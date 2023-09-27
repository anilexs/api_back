<?php
// fonction pour ce connecter a la bd
function dbConnect(){
    $conn = null;
    try{
        $db = new PDO("mysql:host=localhost;dbname=api_db", "root", "");
        return $db;
    }catch(PDOException $e){
        echo $e->getMessage();
    }

}

// function pour enregistrer un utilisateur
function register($firstName, $lastName, $pseudo, $password){
    $passwordCrypt = password_hash($password, PASSWORD_DEFAULT);
    // conexion a la bd
    $db = dbConnect();
    // preparer la requete
    $request = $db->prepare("INSERT INTO users (pseudo, firstname, lastname, password) VALUES (?,?,?,?)");
    // executer la requete
    try{
        $request->execute(array($pseudo, $firstName, $lastName, $passwordCrypt));
        echo json_encode([
            "status" => 201,
            "message" => "everything goud"
        ]);
    }catch(PDOException $e){
        echo json_encode([
            "status" => 500,
            "message" => "internal server error"
        ]);
    }
}


// fonction pour se connecter
function login($pseudo, $password){
    // conexion a la bd
    $db = dbConnect();
    // requete pour se connecter
    $request = $db->prepare("SELECT * FROM users WHERE pseudo = ?");
    // executer la requete
    try{
        $request->execute(array($pseudo));
        $user = $request->fetch(PDO::FETCH_ASSOC);
        // verifier si le password est correct
        if(empty($user)){
            echo json_encode([
                "status" => 404,
                "message" => "usernot found"
            ]);
        }else{
            // verifier si le password est correct
            if(password_verify($password, $user['password'])){
                echo json_encode([
                    "status" => 200,
                    "message" => "felicitation...",
                    "userInfo" => $user
                ]);
            }else{
               echo json_encode([
                    "status" => 404,
                    "message" => "password incorrect",
                ]); 
            }
        }
    }catch(PDOException $e){
        echo json_encode([
            "status" => 500,
            "message" => $e->getMessage()
        ]);
    }
}


// fonction pour envoyer un message
function sendMessage($expeditor, $receiver, $message){
    // conexion a la bd
    $db = dbConnect();
    // preparer la requete
    $request = $db->prepare("INSERT INTO messages (message, expeditor_id, receiver_id) VALUES (?,?,?)");
    // executer la requete
    try{
        $request->execute(array($message, $expeditor, $receiver));
        echo json_encode([
            "status" => 201,
            "message" => "your message is safely sent.."
        ]);
    }catch(PDOException $e){
        echo json_encode([
            "status" => 500,
            "message" => $e->getMessage()
        ]);
    }
}

// fonction pour recuperer la liste des users
function getListUser(){
    // conexion a la bd
    $db = dbConnect();
    // preparer la requete
    $request = $db->prepare("SELECT * FROM users");
    // executer la requete
    try{
        $request->execute();
        // recuperer le resultat
        $listUsers = $request->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode([
            "status" => 200,
            "message" => "voici la liste des users",
            "data" => $listUsers
        ]);
    }catch(PDOException $e){
        echo json_encode([
            "status" => 500,
            "message" => $e->getMessage()
        ]);
    }
}


// fonction pour recuperer la conversation entre 2 users
function getListMessage($expeditor, $receiver){
    // se connecter a la base de données
    $db = dbConnect();  
    // preparer la requete
    $request = $db->prepare("SELECT * FROM messages WHERE expeditor_id = ? AND receiver_id = ? OR expeditor_id = ? AND receiver_id = ?");
    // executer la requete
    try{
        $request->execute(array($expeditor, $receiver, $receiver, $expeditor));
        // recuperer le resultat dans un tableau
        $message = $request->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode([
            "status" => 200,
            "message" => "voici la liste de votre discution",
            "listMessage" => $message
        ]);
    }catch(PDOException $e){
        echo json_encode([
            "status" => 500,
            "message" => $e->getMessage()
        ]);
    }
}