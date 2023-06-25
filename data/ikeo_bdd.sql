-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : dim. 25 juin 2023 à 16:07
-- Version du serveur : 8.0.33
-- Version de PHP : 8.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ikeo_bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int NOT NULL,
  `type` varchar(20) NOT NULL,
  `raison_sociale` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adresse` varchar(60) NOT NULL,
  `ville` varchar(20) NOT NULL,
  `pays` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `type`, `raison_sociale`, `adresse`, `ville`, `pays`) VALUES
(1, 'Magasin', 'Bo Meuble', 'Place Vendôme', 'Paris', 'France'),
(2, 'Magasin', 'Mobel', 'Porte de Brandebourg', 'Berlin', 'Allemagne'),
(3, 'Magasin', 'Bo Meuble', 'Rue Jean Jaurès', 'Brest', 'France'),
(4, 'Magasin', 'Tout A la Maison', 'Rue de la Bastille', 'Paris', 'France'),
(5, 'Magasin', 'Bo Meuble', 'Avenue des Trois Dragons', 'Barcelone', 'Espagne'),
(6, 'Centrale d\'achat', 'The World Company', 'Oxford street', 'Londres', 'Angleterre'),
(7, 'Magasin', 'The Best Greatest Beautifulest Furnitures', 'Coven Garden', 'Londres', 'Angleterre');

-- --------------------------------------------------------

--
-- Structure de la table `facturer`
--

CREATE TABLE `facturer` (
  `id_produit` int NOT NULL,
  `quantite` int NOT NULL,
  `id_facture` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `facturer`
--

INSERT INTO `facturer` (`id_produit`, `quantite`, `id_facture`) VALUES
(1, 20, 1),
(2, 30, 1),
(3, 10, 1),
(8, 25, 2),
(4, 32, 2),
(3, 80, 3),
(5, 70, 3),
(6, 60, 3),
(4, 60, 3),
(9, 120, 3),
(7, 90, 3),
(1, 10, 4),
(2, 10, 4),
(6, 30, 4),
(1, 25, 5),
(7, 34, 5),
(2, 40, 6),
(5, 38, 6),
(6, 54, 6),
(4, 20, 7),
(5, 34, 7),
(6, 45, 7);

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

CREATE TABLE `factures` (
  `id_facture` int NOT NULL,
  `numero` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `id_client` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `factures`
--

INSERT INTO `factures` (`id_facture`, `numero`, `date`, `id_client`) VALUES
(1, 'MSQ291', '2018-06-15', 1),
(2, 'MSQ292', '2018-06-23', 5),
(3, 'MSQ293', '2018-06-23', 6),
(4, 'MSQ294', '2018-06-28', 1),
(5, 'MSQ295', '2018-07-01', 4),
(6, 'MSQ296', '2018-07-04', 7),
(7, 'MSQ297', '2018-07-12', 2);

-- --------------------------------------------------------

--
-- Structure de la table `produire`
--

CREATE TABLE `produire` (
  `id_usine` int NOT NULL,
  `id_produit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produire`
--

INSERT INTO `produire` (`id_usine`, `id_produit`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(3, 1),
(6, 3),
(7, 2),
(7, 3),
(8, 3),
(9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id_produit` int NOT NULL,
  `ref` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `description` varchar(80) NOT NULL,
  `abandonne` varchar(3) NOT NULL,
  `usine` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `ref`, `nom`, `description`, `abandonne`, `usine`) VALUES
(1, 'OANT72', 'Knutsen', 'Table basse pour poser les bières', 'Non', 'Harald, Sverre'),
(2, 'OANT34', 'Moen', 'Chaise haute de bar', 'Oui', 'Harald, Sverre'),
(3, 'OANT67', 'Eide', 'Porte serviettes pour 100 serviettes', 'Non', 'Harald, Olaf'),
(4, 'LXAL34', 'Gulbrandsen', 'Lit nuage en levitation', 'Non', 'Olaf'),
(5, 'LXAL56', 'Naess', 'Table pour 128 convives', 'Non', 'Harald, Sverre, Olaf'),
(6, 'LXAL78', 'Lund', 'Bureau-cafetière électrique', 'Non', 'Harald, Olaf'),
(7, 'LXAL12', 'Dahl', 'Tiroir à ronds de serviette', 'Oui', 'Sverre, Olaf'),
(8, 'OANT90', 'Ruud', 'Bureau_lit combiné', 'Non', 'Olaf'),
(9, 'OANT12', 'Apfelgluk', 'Panier à chien (ou à chat)', 'Non', 'Olaf');

-- --------------------------------------------------------

--
-- Structure de la table `usines`
--

CREATE TABLE `usines` (
  `id_usine` int NOT NULL,
  `nom` varchar(60) NOT NULL,
  `adresse` varchar(80) NOT NULL,
  `ville` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `usines`
--

INSERT INTO `usines` (`id_usine`, `nom`, `adresse`, `ville`) VALUES
(1, 'Harald', 'Quai Pipervika', 'Oslo'),
(2, 'Sverre', 'Rue Strangehagen', 'Bergen'),
(3, 'Olaf', 'Place Nidaros', 'Trondheim');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `facturer`
--
ALTER TABLE `facturer`
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_facture` (`id_facture`);

--
-- Index pour la table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id_facture`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `produire`
--
ALTER TABLE `produire`
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `produire_ibfk_2` (`id_usine`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`);

--
-- Index pour la table `usines`
--
ALTER TABLE `usines`
  ADD PRIMARY KEY (`id_usine`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `factures`
--
ALTER TABLE `factures`
  MODIFY `id_facture` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `usines`
--
ALTER TABLE `usines`
  MODIFY `id_usine` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `facturer`
--
ALTER TABLE `facturer`
  ADD CONSTRAINT `facturer_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `facturer_ibfk_2` FOREIGN KEY (`id_facture`) REFERENCES `factures` (`id_facture`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
