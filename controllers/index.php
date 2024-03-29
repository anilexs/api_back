<?php
header("Access-Control-Allow-Origin: *");

// inclure functions.php
require_once "userController.php";
// si l'utilisateur envoi une requete de type GET

if($_SERVER["REQUEST_METHOD"] == "GET"){
    $url = $_SERVER["REQUEST_URI"];
    $url = trim($url, "\/");
    $url = explode("/", $url);
    $action = $url[1];
    if($action == "getuserlist"){
        UserController::loadModel($action);
    }
    else if($action == "getListMessage"){
        UserController::loadModel($action, [$url[2], $url[3]]);
    }else{
        echo json_encode([
            "status" => 404,
            "message" => "not found"
        ]);
    }
}else{
    // ce que l'utilisateur envoi via un formulaire on recupere
    $data = json_decode(file_get_contents("php://input"), true);

    if($data["action"] == "login"){
        // appel de la fonction login
        UserController::loadModel($data["action"], [$data['pseudo'], $data['password']]);
    }else if($data["action"] == "register"){
        // on fais appel a la fonction register pour enregistre le user
        UserController::loadModel($data["action"], [$data['firstname'], $data['lastname'], $data['pseudo'], $data['password']]);
    }else if($data["action"] == "send message"){
        // appel de la fonction sendMessage
        UserController::loadModel($data["action"], [$data['expeditor'], $data['receiver'], $data['message']]);
    }else{
        echo json_encode([
                    "status" => 404,
                    "message" => "service not found",
                ]);
    }

}