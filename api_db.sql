-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 02 oct. 2023 à 16:45
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `api_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `message` text NOT NULL,
  `expeditor_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id_message`, `message`, `expeditor_id`, `receiver_id`) VALUES
(1, 'contenu du message', 2, 6),
(2, 'contenu du message', 2, 6),
(3, '2', 2, 6),
(4, '555', 6, 2),
(5, 'hello', 6, 2),
(6, 'say', 6, 2),
(7, 'say', 2, 6),
(10, 'd', 6, 2),
(11, 'f', 6, 2),
(12, 'f', 6, 6),
(13, 'f', 6, 7),
(14, 'd', 6, 18),
(15, 'd', 6, 18),
(16, 'd', 6, 18),
(17, 'd', 6, 18),
(18, 'd', 6, 18),
(19, 'd', 6, 18),
(20, 'd', 6, 18),
(21, 'd', 6, 17),
(22, 'd', 6, 15),
(23, 'd', 6, 15),
(24, 'dd', 6, 13),
(25, 'cd', 6, 17),
(26, 'ds', 6, 2),
(27, 'd', 6, 2),
(28, 'd', 6, 2),
(29, 'zdzd', 6, 6),
(30, 'se gds', 6, 6),
(31, 'sdfse', 6, 2),
(32, '1', 6, 2),
(33, 'contenu du message', 2, 6),
(34, 'contenu du message', 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `pseudo`, `password`, `firstname`, `lastname`) VALUES
(2, 'alexis', '$2y$10$6406Kn9GGzQtVdYsplfQuuhtji1Wc/xsGiLpdFha76Sc.rkzuHMKu', 'alexis', 'simoes'),
(6, 'silica', '$2y$10$XgNG4Mtt.oD9eTdrabo8g.l4CRD/i6eiW1RBI.jDwIPaaANsF4GwC', 'silica', 'sao'),
(7, 'silica2', '$2y$10$xjuknY2gHlas6e5TY87YOeK/DjtFdG/XLKiAkOCLwc9l4rg8PvqJ.', 'silica', 'sao'),
(8, 'silica3', '$2y$10$TKQQo9dYFpQrBjLgLBUkE.kqIIINkS1FeqvwbesAcAQOexjZ7bNnO', 'silica', 'sao'),
(9, 'silica4', '$2y$10$T2Eya3ypTxreDv7xt2sB9.pyjxFj4W3rFj252qYF6y7NWZ8FH2L0C', 'silica', 'sao'),
(10, 'silica5', '$2y$10$fDi0GnCDdnLdwg9b0eA/8u9THfADRCRiTSW0HRYmjbNZ8vi.anhRS', 'silica', 'sao'),
(11, 'silica6', '$2y$10$rdUYQGZyTNgMsKhuSz//IelXcEZe5BAqk4SHsIWnXHfq3KzrSCPHK', 'silica', 'sao'),
(12, 'silica7', '$2y$10$GEP2RpjohwNeuVpMUKZPpezVv62b5cWBYBT.uRZgTSXYBWCRuf80u', 'silica', 'sao'),
(13, 'silica8', '$2y$10$5OX2WWFn/UPY8VM2gzypvuAqwh1aJQMoefZuhbKBxG4XQI6JPKGxq', 'silica', 'sao'),
(14, 'silica9', '$2y$10$0vvKflv5n8mKpHxBGB/Qj.2KGz3EpbxsnrQX5LUFX/dhYn/JNfq2W', 'silica', 'sao'),
(15, 'silica0', '$2y$10$AghqHJRwClVgOXmzK.lMreqZRjSpFrUGPtya5pXpW1I.vjcfQKn4y', 'silica', 'sao'),
(17, 'tik', '$2y$10$EKPkxzWR2kByO4KN89.TCuN92/UPsWtjqzEMT57PrtbI2HDrl.02m', 'tik', 'tik'),
(18, 'tac', '$2y$10$2Hol3WyEisaslK1ws98hq.CV.rm/kXbD2iO3RuIGZjKCJBWFbWr5i', 'tactac', 'tac'),
(21, 'silica23', '$2y$10$TMR6K6pouoNoe/SHRfOg6eMMxi535dCegEusSWd6xkFWJcSriPlQ.', 'silica', 'sao'),
(22, 'l', '$2y$10$tvJ2DD0KomyTaa6iUOX4R.scV7a9N0sM9gXzco4p59dWfau2sIuKy', 's', 'i'),
(29, 'aaaaa', '$2y$10$mN1PpLJwAPlM130xhj.QiugeKXfQfresMPFTcVznmWeJ86peCoUCK', 'silica', 'sao');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `expeditor_id` (`expeditor_id`),
  ADD KEY `reciever_id` (`receiver_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`expeditor_id`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
