-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 02, 2022 at 09:12 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutflux`
--

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
CREATE TABLE IF NOT EXISTS `award` (
  `id_award` int NOT NULL AUTO_INCREMENT,
  `won` tinyint(1) NOT NULL,
  `id_prize` int NOT NULL,
  `id_works` int NOT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id_award`),
  KEY `FK_120` (`id_works`),
  KEY `FK_130` (`id_prize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `character_category`
--

DROP TABLE IF EXISTS `character_category`;
CREATE TABLE IF NOT EXISTS `character_category` (
  `id_character_category` int NOT NULL AUTO_INCREMENT,
  `character_category_name_1` varchar(255) NOT NULL,
  PRIMARY KEY (`id_character_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id_content` int NOT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `id_content_category` int NOT NULL,
  `name_content` varchar(255) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id_content`),
  KEY `FK_64` (`id_content_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_category`
--

DROP TABLE IF EXISTS `content_category`;
CREATE TABLE IF NOT EXISTS `content_category` (
  `id_content_category` int NOT NULL AUTO_INCREMENT,
  `content_category_name_1` varchar(255) NOT NULL,
  PRIMARY KEY (`id_content_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
CREATE TABLE IF NOT EXISTS `nationality` (
  `id_nationality` int NOT NULL AUTO_INCREMENT,
  `nationality_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id_person` int NOT NULL,
  `birth_date` date NOT NULL,
  `id_nationality` int NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `first_name_1` varchar(255) NOT NULL,
  `last_name_1` varchar(255) NOT NULL,
  PRIMARY KEY (`id_person`),
  KEY `FK_105` (`id_nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prize`
--

DROP TABLE IF EXISTS `prize`;
CREATE TABLE IF NOT EXISTS `prize` (
  `id_prize` int NOT NULL AUTO_INCREMENT,
  `prize_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_prize`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prize`
--

INSERT INTO `prize` (`id_prize`, `prize_name`) VALUES
(1, 'Oscar'),
(2, 'Grammy');

-- --------------------------------------------------------

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
CREATE TABLE IF NOT EXISTS `quote` (
  `id_quote` int NOT NULL AUTO_INCREMENT,
  `quote_content` varchar(255) NOT NULL,
  `id_content` int NOT NULL,
  PRIMARY KEY (`id_quote`),
  KEY `FK_58` (`id_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id_rating` int NOT NULL,
  `id_user` int NOT NULL,
  `id_content` int NOT NULL,
  `note` smallint NOT NULL,
  PRIMARY KEY (`id_rating`),
  KEY `FK_36` (`id_user`),
  KEY `FK_40` (`id_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relationship_type`
--

DROP TABLE IF EXISTS `relationship_type`;
CREATE TABLE IF NOT EXISTS `relationship_type` (
  `relationship_type_id` int NOT NULL AUTO_INCREMENT,
  `relationship_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`relationship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_type`
--

DROP TABLE IF EXISTS `role_type`;
CREATE TABLE IF NOT EXISTS `role_type` (
  `id_role_type` int NOT NULL AUTO_INCREMENT,
  `role_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_role_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_relationship`
--

DROP TABLE IF EXISTS `social_relationship`;
CREATE TABLE IF NOT EXISTS `social_relationship` (
  `id_person_2` int NOT NULL,
  `id_person_1` int NOT NULL,
  `relationship_type_id` int NOT NULL,
  `starting_year` int NOT NULL,
  `ending_year` int DEFAULT NULL,
  KEY `FK_150` (`relationship_type_id`),
  KEY `FK_166` (`id_person_2`),
  KEY `FK_169` (`id_person_1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL,
  `pro_user` tinyint(1) NOT NULL,
  `mail_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
CREATE TABLE IF NOT EXISTS `works` (
  `id_works` int NOT NULL,
  `id_content` int NOT NULL,
  `id_character_category` int DEFAULT NULL,
  `id_person` int NOT NULL,
  `salary` int NOT NULL,
  `character_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_works`),
  KEY `FK_23` (`id_person`),
  KEY `FK_26` (`id_content`),
  KEY `FK_72` (`id_character_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_is_of_type`
--

DROP TABLE IF EXISTS `work_is_of_type`;
CREATE TABLE IF NOT EXISTS `work_is_of_type` (
  `id_role_type` int NOT NULL,
  `id_works` int NOT NULL,
  KEY `FK_79` (`id_role_type`),
  KEY `FK_87` (`id_works`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `FK_118` FOREIGN KEY (`id_works`) REFERENCES `works` (`id_works`),
  ADD CONSTRAINT `FK_128` FOREIGN KEY (`id_prize`) REFERENCES `prize` (`id_prize`);

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `FK_62` FOREIGN KEY (`id_content_category`) REFERENCES `content_category` (`id_content_category`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `FK_103` FOREIGN KEY (`id_nationality`) REFERENCES `nationality` (`id_nationality`);

--
-- Constraints for table `quote`
--
ALTER TABLE `quote`
  ADD CONSTRAINT `FK_55` FOREIGN KEY (`id_content`) REFERENCES `content` (`id_content`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK_34` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `FK_38` FOREIGN KEY (`id_content`) REFERENCES `content` (`id_content`);

--
-- Constraints for table `social_relationship`
--
ALTER TABLE `social_relationship`
  ADD CONSTRAINT `FK_148` FOREIGN KEY (`relationship_type_id`) REFERENCES `relationship_type` (`relationship_type_id`),
  ADD CONSTRAINT `FK_164` FOREIGN KEY (`id_person_2`) REFERENCES `person` (`id_person`),
  ADD CONSTRAINT `FK_167` FOREIGN KEY (`id_person_1`) REFERENCES `person` (`id_person`);

--
-- Constraints for table `works`
--
ALTER TABLE `works`
  ADD CONSTRAINT `FK_21` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`),
  ADD CONSTRAINT `FK_24` FOREIGN KEY (`id_content`) REFERENCES `content` (`id_content`),
  ADD CONSTRAINT `FK_70` FOREIGN KEY (`id_character_category`) REFERENCES `character_category` (`id_character_category`);

--
-- Constraints for table `work_is_of_type`
--
ALTER TABLE `work_is_of_type`
  ADD CONSTRAINT `FK_77` FOREIGN KEY (`id_role_type`) REFERENCES `role_type` (`id_role_type`),
  ADD CONSTRAINT `FK_85` FOREIGN KEY (`id_works`) REFERENCES `works` (`id_works`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
