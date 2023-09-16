-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 25, 2021 at 10:21 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sysrec1`
--

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `ID_User` int(11) NOT NULL,
  `ID_Produit` int(11) NOT NULL,
  `Note` float DEFAULT NULL,
  PRIMARY KEY (`ID_User`,`ID_Produit`),
  KEY `fk_PD` (`ID_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`ID_User`, `ID_Produit`, `Note`) VALUES
(1, 1, 5.5),
(1, 2, 7),
(1, 3, 5),
(1, 4, 6),
(1, 5, 0),
(1, 6, NULL),
(1, 7, 8.5),
(1, 8, 1.5),
(1, 9, 6.5),
(1, 10, 4),
(1, 11, NULL),
(1, 12, 7),
(1, 13, 3.5),
(1, 14, 2),
(1, 15, 9),
(1, 16, 10),
(1, 17, NULL),
(1, 18, 4),
(1, 19, 3.5),
(1, 20, 8),
(2, 1, 4.5),
(2, 2, 4.5),
(2, 3, 3.5),
(2, 4, 3),
(2, 5, 10),
(2, 6, NULL),
(2, 7, 7.5),
(2, 8, 3.5),
(2, 9, 1.5),
(2, 10, 5),
(2, 11, 4),
(2, 12, 3),
(2, 13, 1),
(2, 14, NULL),
(2, 15, 6),
(2, 16, 8),
(2, 17, 5),
(2, 18, 3),
(2, 19, NULL),
(2, 20, 3),
(3, 1, 5),
(3, 2, 4.5),
(3, 3, 3.5),
(3, 4, 8.5),
(3, 5, 9.5),
(3, 6, NULL),
(3, 7, 2.5),
(3, 8, 8.5),
(3, 9, 5.5),
(3, 10, 5),
(3, 11, 8),
(3, 12, NULL),
(3, 13, 7),
(3, 14, 6),
(3, 15, 6),
(3, 16, 2),
(3, 17, 1),
(3, 18, 1),
(3, 19, 5.5),
(3, 20, 4.5),
(4, 1, 7.5),
(4, 2, 5),
(4, 3, 3.5),
(4, 4, 6.5),
(4, 5, NULL),
(4, 6, NULL),
(4, 7, 3),
(4, 8, 1.5),
(4, 9, 5.5),
(4, 10, 4),
(4, 11, 5.5),
(4, 12, 7.5),
(4, 13, 2),
(4, 14, 9),
(4, 15, NULL),
(4, 16, 2),
(4, 17, 3),
(4, 18, 9),
(4, 19, 4),
(4, 20, NULL),
(5, 1, NULL),
(5, 2, 5.5),
(5, 3, 4),
(5, 4, 1.5),
(5, 5, 8),
(5, 6, 4),
(5, 7, 5),
(5, 8, 6.5),
(5, 9, 2.5),
(5, 10, 7),
(5, 11, 8.5),
(5, 12, 3.5),
(5, 13, NULL),
(5, 14, 3),
(5, 15, 4),
(5, 16, 5),
(5, 17, 8),
(5, 18, 4),
(5, 19, 3),
(5, 20, 7.5),
(6, 1, NULL),
(6, 2, 5.5),
(6, 3, 4),
(6, 4, 9.5),
(6, 5, 8),
(6, 6, 4),
(6, 7, 5),
(6, 8, 6.5),
(6, 9, 2.5),
(6, 10, 4.5),
(6, 11, 1.5),
(6, 12, 4),
(6, 13, 6),
(6, 14, 4),
(6, 15, 7.5),
(6, 16, NULL),
(6, 17, 9),
(6, 18, 8),
(6, 19, 2),
(6, 20, 4.5);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `ID_Produit` int(11) NOT NULL,
  `Nom_Produit` varchar(100) NOT NULL,
  `Type_Produit` varchar(50) NOT NULL,
  `Description_Produit` varchar(500) DEFAULT NULL,
  `Prix_Produit` float NOT NULL,
  `Stock_Produit` int(11) NOT NULL,
  PRIMARY KEY (`ID_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`ID_Produit`, `Nom_Produit`, `Type_Produit`, `Description_Produit`, `Prix_Produit`, `Stock_Produit`) VALUES
(1, 'Imprimante INKJET', 'Electroniques', 'Une imprimante rapide en utilisant la technologie injection avec 3 couleurs RGB', 50, 5),
(2, 'Casque Cobalt', 'Accessoires PC', 'Casque metalique embout cuir avec micro', 50, 10),
(3, 'Souris sans fil', 'Accessoires PC', 'souris sans fil  liée à un petit récepteur sans fil qui se branche sur le port USB de votre ordinateur', 30, 15),
(4, 'Clavier', 'Accessoires PC', 'Clavier possède une centaine de touches dont les lettres de l alphabet les chiffres les accents et des touches spéciales', 80, 20),
(5, 'Webcam', 'Accessoires PC', 'Webcam PC/Laptop -Caméra peut pivoter à 360° - Microphone intégré ', 80, 20),
(6, 'Scie Arboricole', 'Matériel Jardinage ', 'Scie Arboricole  a haut rendement - Lames et dents extra dures ', 22, 30),
(7, 'Tondeuse à gazon', 'Matériel Jardinage ', 'Tondeuse éléctrique 1600W-38cm largeur de coupe', 600, 11),
(8, 'Balais à gazon dents rondes', 'Matériel Jardinage ', 'Tête en acier haute qualité-Dents rondes', 50, 7),
(9, 'Pulvérisateur 12 litres', 'Matériel Jardinage ', 'Réservoir de 12 litres avec chambre d aspiration reduite pour facilite la dimunition du pompage', 300, 5),
(10, 'Tuyau d arrosage', 'Matériel Jardinage ', 'Tuyau resistant au variation de la température -Longueur 50m', 40, 16),
(11, 'Machine à café expresso électrique 1.6L', 'Electromenagers', 'Machine à café expresso électrique 1.6L moulin à café 15 Bar Express machine à café en mousse électrique appareil de cuisine 220V Information produit: Capacité (tasse): 4-6 tasses Puissance (Watts): 850W', 1000, 17),
(12, 'Coupe frites Ménagère Manuelle', 'Electromenagers', 'Dimension:25*12*9cm; Marérial:Inox 201 Appareil à découper précis et robuste.Couper les pommes de terre en frites ou autres légumes crus en bâtonnet. Design ergonomique pour rendre la coupe plus facile.', 30, 14),
(13, 'Mixeur plongeant électrique 1000 W fouet doseur broyeur', 'Electromenagers', 'Très puissant - Batteur électrique puissant en acier inoxydable munit d un pied anti-éclaboussures - Idéal pour préparer des soupes, des shakes, des smoothies', 100, 17),
(14, ' Petit Four Électrique de Bureau Multifonction 10L', 'Electromenagers', 'En cuisinant à l aide d un ventilateur à convection, l air chaud est uniformément autour des aliments pendant la cuisson, ce qui signifie que vous n avez pas à vous soucier de retourner vos aliments à mi-cuisson', 300, 14),
(15, ' gaufrier électrique 3 en 1, Machine à sandwichs, à bulles, four', 'Electromenagers', ' Puissance (W): 700-1000W Assiettes interchangeables: Plaques de presse à griller / Panini Assiettes interchangeables: gaufrier Assiettes interchangeables: Cake Maker Assiettes interchangeables: Cookie Maker Certification: CE', 150, 13),
(16, 'Barre fixe démontable', 'Matériel de sport', 'un équipement de fitness de qualité supérieure conçu pour être utilisé dans les maisons. La barre de gymnastique de fer aide à effectuer un certain nombre d exercices tels que les trempettes, tirages, redressements assis, crunches et ainsi de suite.', 60, 50),
(17, 'Matelas nbr', 'Matériel de sport', 'Facile à Ranger et à Transporter-Taille (Longueur x Largeur x Hauteur cm): 183*61*1 cm-Poids (kg): 0.9', 50, 23),
(18, 'Vélo elliptique', 'Matériel de sport', 'Vélo elliptique est un appareil de cardio-training-il ne génère pas d impacts pour les articulations-Taille (Longueur x Largeur x Hauteur cm): 70*60*30 cm-Poids (kg): 25', 700, 12),
(19, 'Condor Smart 43SD520 Android v9.0-TNT-Full HD', 'Electroniques', 'Android TV v9.0 Licence officielle-HDR 10 (HDMI/USB)-Recherche Vocale-Jeux HD-Supporter les vidéos 4K / UHD via USB-HDMI 3 / USB 2-WiFi intégré (802.11a/b/g/n/ac; 2.4G+5G)', 1100, 5),
(20, 'Infinix Note 8', 'Electroniques', 'Ecran 6.95\" IPS LCD , Résolution: 720 x 1640 pixels \r\nMémoire RAM 6 Go ,Stockage 128 Go\r\nAppareil photo Arriere : Quad ; 64 MP, (wide) , 2 MP, (macro) , 2 MP, (depth) , 2 MP\r\nCaméra Selfie : Dual ; 16 MP , 2 MP, (depth)\r\nProcesseur : Octa-core Mediatek Helio G80 (12 nm)\r\nBatterie : Li-Po 5200 mAh ; Fast charging 18W', 639, 11);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID_User` int(11) NOT NULL,
  `Login` varchar(20) NOT NULL,
  `MotDePasse` varchar(20) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_User`, `Login`, `MotDePasse`, `Adresse`) VALUES
(1, 'WissemBellara', 'Wassoum4562', 'El Mourouj'),
(2, 'AdemNeji', 'Azerty123', 'Soukra'),
(3, 'Mortadha', 'Momo25', 'Ennasr'),
(4, 'Belgacem', 'Gassama123', 'Lac2'),
(5, 'Siwar', 'Sassou24', 'Oued Ellil'),
(6, 'Maryem', 'Hbib404', 'Bardo');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_PD` FOREIGN KEY (`ID_Produit`) REFERENCES `produit` (`ID_Produit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UT` FOREIGN KEY (`ID_User`) REFERENCES `utilisateur` (`ID_User`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
