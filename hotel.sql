-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 22 jan. 2022 à 13:30
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `idChambre` int(11) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `tarif` double NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`idChambre`, `Numero`, `Type`, `tarif`, `photo`) VALUES
(9, 93, 'Chambre Simple', 500, '20220120091825image3.jpg'),
(10, 123, 'Chambre Simple', 400, '20220120090754image4.jpg'),
(12, 100, 'Chambre double', 600, '20220120090513image1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `idReservation` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `DateFin` date NOT NULL,
  `prix` double DEFAULT NULL,
  `idUser` int(11) NOT NULL,
  `idChambre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`idReservation`, `dateDebut`, `DateFin`, `prix`, `idUser`, `idChambre`) VALUES
(1, '2022-01-01', '2022-01-04', 1500, 1002, 10),
(2, '2021-12-01', '2022-01-11', 4200, 1002, 9),
(3, '2022-01-20', '2022-01-29', 4500, 4, 9),
(4, '2022-01-12', '2022-01-18', 3600, 4, 12),
(5, '2022-01-12', '2022-01-29', 6800, 4, 10);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `etat` int(11) NOT NULL DEFAULT 0,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `Nom`, `Prenom`, `Email`, `Password`, `etat`, `role`) VALUES
(1, 'yousra', 'yousra', 'yousraerrahili@gmail.com', '1234', 1, 1),
(4, 'al mahi', 'lina', 'almahilina@gmail.com', 'lina', 1, 2),
(6, 'bissouiki', 'rihab', 'rihab souiki@gmail.com', 'rihab', 2, 2),
(1002, 'almohalhil', 'salma', 'almohalhilsalma@gmail.com', '123456', 1, 2),
(1003, 'errahili', 'yousra', 'yousra@gmail.com', 'Yousra.123', 1, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`idChambre`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`idReservation`),
  ADD KEY `fkkk` (`idUser`),
  ADD KEY `fkkkkk` (`idChambre`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `idChambre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fkkk` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkkkkk` FOREIGN KEY (`idChambre`) REFERENCES `chambre` (`idChambre`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
