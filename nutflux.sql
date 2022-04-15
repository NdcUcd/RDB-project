-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 11, 2022 at 09:37 AM
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
  `id_prize` int NOT NULL,
  `id_works` int NOT NULL,
  `prize_won` tinyint(1) NOT NULL,
  `year_award` int DEFAULT NULL,
  PRIMARY KEY (`id_prize`,`id_works`),
  KEY `FK_120` (`id_works`),
  KEY `FK_130` (`id_prize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `award`
--

INSERT INTO `award` (`id_prize`, `id_works`, `prize_won`, `year_award`) VALUES
(1, 2, 1, 2002),
(2, 2, 1, 2002),
(3, 2, 1, 2002),
(3, 6, 0, 2002),
(3, 7, 1, 1998),
(4, 2, 1, 2002),
(4, 6, 0, 2002),
(4, 7, 1, 1998),
(5, 2, 1, 2002),
(5, 3, 1, 2015),
(5, 7, 1, 1998),
(8, 3, 1, 2015),
(9, 7, 1, 1998),
(10, 6, 0, 2002),
(10, 7, 0, 1998),
(11, 8, 0, 1993);

-- --------------------------------------------------------

--
-- Table structure for table `character_category`
--

DROP TABLE IF EXISTS `character_category`;
CREATE TABLE IF NOT EXISTS `character_category` (
  `id_character_category` int NOT NULL AUTO_INCREMENT,
  `character_category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_character_category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `character_category`
--

INSERT INTO `character_category` (`id_character_category`, `character_category_name`) VALUES
(1, 'politician'),
(2, 'spy'),
(3, 'villain'),
(4, 'cesar'),
(5, 'cleopatra');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id_content` int NOT NULL AUTO_INCREMENT,
  `name_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `id_studio` int NOT NULL,
  `id_content_category` int NOT NULL,
  `year_content` int NOT NULL,
  PRIMARY KEY (`id_content`),
  KEY `FK_199` (`id_studio`),
  KEY `FK_64` (`id_content_category`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id_content`, `name_content`, `synopsis`, `id_studio`, `id_content_category`, `year_content`) VALUES
(1, 'The Pianist', 'A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.', 1, 1, 2002),
(2, 'Cannibal Holocaust', 'During a rescue mission into the Amazon rainforest, a professor stumbles across lost film shot by a missing documentary crew.', 3, 5, 1980),
(3, 'House of Cards', 'A Congressman works with his equally conniving wife to exact revenge on the people who betrayed him.', 4, 6, 2013),
(4, 'Mr. & Mrs. Smith', 'A bored married couple is surprised to learn that they are both assassins hired by competing agencies to kill each other.', 5, 3, 2005),
(5, 'Gang of New York', 'In 1862, Amsterdam Vallon returns to the Five Points area of New York City seeking revenge against Bill the Butcher, his father\'s killer.', 6, 7, 2002),
(6, 'Shakespeare in Love', 'The world\'s greatest ever playwright, William Shakespeare, is young, out of ideas and short of cash, but meets his ideal woman and is inspired to write one of his most famous plays.', 7, 7, 1998),
(7, 'Demolition Man', 'A police officer is brought out of suspended animation in prison to pursue an old ultra-violent nemesis who is loose in a non-violent future society.', 8, 9, 1993),
(8, 'Hostel: Part II', 'Three American college students studying abroad are lured to a Slovakian hostel and discover the grim reality behind it.', 9, 5, 2007),
(9, 'Beauty and the Beast', 'A prince cursed to spend his days as a hideous monster sets out to regain his humanity by earning a young woman\'s love.', 10, 10, 1991),
(10, 'Cleopatra', 'Queen Cleopatra VII of Egypt experiences both triumph and tragedy as she attempts to resist the imperial ambitions of Rome.', 12, 7, 1963);

-- --------------------------------------------------------

--
-- Table structure for table `content_category`
--

DROP TABLE IF EXISTS `content_category`;
CREATE TABLE IF NOT EXISTS `content_category` (
  `id_content_category` int NOT NULL AUTO_INCREMENT,
  `content_category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_content_category`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `content_category`
--

INSERT INTO `content_category` (`id_content_category`, `content_category_name`) VALUES
(1, 'drama'),
(2, 'comedy'),
(3, 'action'),
(4, 'documentary'),
(5, 'horror'),
(6, 'politic'),
(7, 'historical drama'),
(8, 'comedy-drama'),
(9, 'science fiction'),
(10, 'musical');

-- --------------------------------------------------------

--
-- Stand-in structure for view `crime_by_role`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `crime_by_role`;
CREATE TABLE IF NOT EXISTS `crime_by_role` (
`role_type` varchar(255)
,`crime_type` varchar(255)
,`COUNT(0)` bigint
);

-- --------------------------------------------------------

--
-- Table structure for table `crime_type`
--

DROP TABLE IF EXISTS `crime_type`;
CREATE TABLE IF NOT EXISTS `crime_type` (
  `id_crime` int NOT NULL AUTO_INCREMENT,
  `crime_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_crime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `crime_type`
--

INSERT INTO `crime_type` (`id_crime`, `crime_type`) VALUES
(1, 'sexual abuse'),
(2, 'murder'),
(3, 'hate crime'),
(4, 'white collar crime'),
(5, 'animal cruelty'),
(6, 'violence'),
(7, 'organised crime');

-- --------------------------------------------------------

--
-- Table structure for table `event_table`
--

DROP TABLE IF EXISTS `event_table`;
CREATE TABLE IF NOT EXISTS `event_table` (
  `id_event` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  `id_status` int NOT NULL,
  `id_crime` int NOT NULL,
  `year_event` int DEFAULT NULL,
  PRIMARY KEY (`id_event`),
  KEY `FK_179` (`id_person`),
  KEY `FK_182` (`id_crime`),
  KEY `FK_192` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `event_table`
--

INSERT INTO `event_table` (`id_event`, `id_person`, `id_status`, `id_crime`, `year_event`) VALUES
(1, 1, 1, 1, 1977),
(2, 2, 1, 5, 1980),
(3, 2, 2, 2, 1980),
(4, 3, 4, 1, 2017),
(5, 3, 5, 1, 2019),
(6, 3, 6, 1, 2020),
(7, 4, 2, 6, 2016),
(8, 7, 1, 4, 2010),
(9, 6, 1, 1, 2020),
(10, 6, 1, 1, 2020),
(11, 6, 6, 1, 2021),
(12, 8, 3, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
CREATE TABLE IF NOT EXISTS `nationality` (
  `id_nationality` int NOT NULL AUTO_INCREMENT,
  `nationality_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_nationality`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`id_nationality`, `nationality_name`) VALUES
(1, 'French'),
(2, 'Polish'),
(3, 'American'),
(4, 'English'),
(5, 'Italian'),
(6, 'Welsh'),
(7, 'Canadian'),
(8, 'Australian');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id_person` int NOT NULL AUTO_INCREMENT,
  `birth_date` date NOT NULL,
  `id_nationality` int NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `person_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_person`),
  KEY `FK_105` (`id_nationality`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id_person`, `birth_date`, `id_nationality`, `gender`, `person_name`) VALUES
(1, '1933-08-18', 2, 0, 'Roman Polanski'),
(2, '1939-05-07', 5, 0, 'Ruggero Deodato'),
(3, '1959-07-26', 3, 0, 'Kevin Spacey'),
(4, '1963-12-18', 3, 0, 'Brad Pitt'),
(5, '1975-06-04', 3, 1, 'Angelina Jolie'),
(6, '1952-03-19', 3, 0, 'Harvey Weinstein'),
(7, '1962-07-31', 3, 0, 'Wesley Snipes'),
(8, '1935-10-20', 3, 0, 'Jerry Orbach'),
(9, '1932-02-27', 4, 1, 'Elizabeth Taylor'),
(10, '1925-11-10', 6, 0, 'Richard Burton');

-- --------------------------------------------------------

--
-- Table structure for table `prize`
--

DROP TABLE IF EXISTS `prize`;
CREATE TABLE IF NOT EXISTS `prize` (
  `id_prize` int NOT NULL AUTO_INCREMENT,
  `prize_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_prize`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prize`
--

INSERT INTO `prize` (`id_prize`, `prize_name`) VALUES
(1, 'Palme d\'Or'),
(2, 'César'),
(3, 'Oscar'),
(4, 'BAFTA'),
(5, 'Golden Globe'),
(6, 'Berlin International Film Festival'),
(7, 'New York Film Critics Circle'),
(8, 'Screen Actors Guild Awards'),
(9, 'Satellite Award'),
(10, 'Producers Guild of America'),
(11, 'MTV Movie Awards'),
(12, 'Grammy Award');

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
  `id_user` int NOT NULL,
  `id_content` int NOT NULL,
  `note` smallint NOT NULL,
  PRIMARY KEY (`id_user`,`id_content`),
  KEY `FK_36` (`id_user`),
  KEY `FK_40` (`id_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id_user`, `id_content`, `note`) VALUES
(1, 7, 7),
(1, 9, 5),
(1, 10, 1),
(3, 6, 4),
(3, 9, 8),
(4, 3, 9),
(4, 4, 6),
(5, 3, 7),
(6, 1, 9),
(6, 5, 6),
(6, 6, 3),
(6, 7, 5),
(7, 1, 9),
(7, 2, 2),
(7, 4, 4),
(8, 2, 4),
(8, 8, 4),
(9, 5, 7),
(9, 8, 3),
(9, 10, 9),
(10, 10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `relationship_type`
--

DROP TABLE IF EXISTS `relationship_type`;
CREATE TABLE IF NOT EXISTS `relationship_type` (
  `relationship_type_id` int NOT NULL AUTO_INCREMENT,
  `relationship_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`relationship_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `relationship_type`
--

INSERT INTO `relationship_type` (`relationship_type_id`, `relationship_type_name`) VALUES
(1, 'marriage'),
(2, 'friendship');

-- --------------------------------------------------------

--
-- Table structure for table `role_type`
--

DROP TABLE IF EXISTS `role_type`;
CREATE TABLE IF NOT EXISTS `role_type` (
  `id_role_type` int NOT NULL AUTO_INCREMENT,
  `role_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_role_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role_type`
--

INSERT INTO `role_type` (`id_role_type`, `role_type`) VALUES
(1, 'actor'),
(2, 'director'),
(3, 'writer'),
(4, 'scenarist'),
(5, 'producer'),
(6, 'voice actor');

-- --------------------------------------------------------

--
-- Table structure for table `social_relationship`
--

DROP TABLE IF EXISTS `social_relationship`;
CREATE TABLE IF NOT EXISTS `social_relationship` (
  `id_person_1` int NOT NULL,
  `id_person_2` int NOT NULL,
  `relationship_type_id` int NOT NULL,
  `starting_year` int NOT NULL,
  `ending_year` int DEFAULT NULL,
  PRIMARY KEY (`id_person_1`,`id_person_2`,`relationship_type_id`),
  KEY `FK_150` (`relationship_type_id`),
  KEY `FK_166` (`id_person_2`),
  KEY `FK_169` (`id_person_1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `social_relationship`
--

INSERT INTO `social_relationship` (`id_person_1`, `id_person_2`, `relationship_type_id`, `starting_year`, `ending_year`) VALUES
(5, 4, 1, 2014, 2016),
(10, 9, 2, 1965, 1970);

-- --------------------------------------------------------

--
-- Table structure for table `status_table`
--

DROP TABLE IF EXISTS `status_table`;
CREATE TABLE IF NOT EXISTS `status_table` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `status_table`
--

INSERT INTO `status_table` (`id_status`, `status`) VALUES
(1, 'convicted'),
(2, 'acquitted'),
(3, 'rumour'),
(4, 'pending charge'),
(5, 'dropped charges'),
(6, 'accusation');

-- --------------------------------------------------------

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
CREATE TABLE IF NOT EXISTS `studio` (
  `id_studio` int NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_studio`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `studio`
--

INSERT INTO `studio` (`id_studio`, `studio_name`) VALUES
(1, 'Canal+'),
(2, 'The Weinstein Company'),
(3, 'F.D. Cinematografica'),
(4, 'Netflix'),
(5, 'New Regency Pictures'),
(6, 'Miramax Films'),
(7, 'The Bedford Falls Company'),
(8, 'Warner Bros.'),
(9, 'Lionsgate'),
(10, 'Buena Vista Pictures Distribution'),
(12, '20th Century Fox');

-- --------------------------------------------------------

--
-- Stand-in structure for view `unethical_persons_relevant`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `unethical_persons_relevant`;
CREATE TABLE IF NOT EXISTS `unethical_persons_relevant` (
`person_name` varchar(255)
,`nb` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `unethical_persons_unrelevant`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `unethical_persons_unrelevant`;
CREATE TABLE IF NOT EXISTS `unethical_persons_unrelevant` (
`person_name` varchar(255)
,`nb` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `unethical_prizes`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `unethical_prizes`;
CREATE TABLE IF NOT EXISTS `unethical_prizes` (
`prize_name` varchar(255)
,`person_name` varchar(255)
,`year_award` int
,`prize_won` tinyint(1)
,`year_event` int
,`crime_type` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `unethical_score`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `unethical_score`;
CREATE TABLE IF NOT EXISTS `unethical_score` (
`name_content` varchar(255)
,`synopsis` varchar(255)
,`studio_name` varchar(255)
,`year_content` int
,`content_category_name` varchar(255)
,`Unethical score` bigint
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `pro_user` tinyint(1) NOT NULL,
  `mail_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `pro_user`, `mail_user`) VALUES
(1, 0, 'user1S@gmail.com'),
(2, 0, 'user2S@gmail.com'),
(3, 0, 'user3S@gmail.com'),
(4, 0, 'user4S@gmail.com'),
(5, 0, 'user5S@gmail.com'),
(6, 1, 'user6P@gmail.com'),
(7, 1, 'user7P@gmail.com'),
(8, 1, 'user8P@gmail.com'),
(9, 1, 'user9P@gmail.com'),
(10, 1, 'user10P@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
CREATE TABLE IF NOT EXISTS `works` (
  `id_works` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  `id_content` int NOT NULL,
  `id_character_category` int DEFAULT NULL,
  `id_role_type` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `character_name` varchar(255) DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_works`),
  KEY `FK_23` (`id_person`),
  KEY `FK_26` (`id_content`),
  KEY `FK_72` (`id_character_category`),
  KEY `FK_211` (`id_role_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id_works`, `id_person`, `id_content`, `id_character_category`, `id_role_type`, `salary`, `character_name`, `is_guest`) VALUES
(2, 1, 1, NULL, 2, 5000000, NULL, 0),
(3, 3, 3, 1, 1, 6500000, 'Francis Underwood', 0),
(4, 5, 4, 2, 1, 10000000, 'Jane Smith', 0),
(5, 4, 4, 2, 1, 20000000, 'John Smith', 0),
(6, 6, 5, NULL, 5, 5000000, NULL, 0),
(7, 6, 6, NULL, 5, 2500000, NULL, 0),
(8, 7, 7, 3, 1, 1000000, 'Simon Phoenix', 0),
(9, 2, 8, 3, 1, 666, 'Italian Cannibal', 1),
(10, 8, 9, NULL, 6, 100000, 'Lumière', 0),
(11, 9, 10, 5, 1, 7000000, 'Cleopatra', 0),
(12, 10, 10, 4, 1, 300000, 'Caesar Augustus', 0),
(13, 2, 2, NULL, 2, 15000, NULL, 0);

-- --------------------------------------------------------

--
-- Structure for view `crime_by_role`
--
DROP TABLE IF EXISTS `crime_by_role`;

DROP VIEW IF EXISTS `crime_by_role`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `crime_by_role`  AS SELECT DISTINCT `r`.`role_type` AS `role_type`, `c`.`crime_type` AS `crime_type`, count(0) AS `COUNT(0)` FROM (((((`event_table` `e` join `person` `pe`) join `status_table` `s`) join `works` `w`) join `role_type` `r`) join `crime_type` `c`) WHERE ((`e`.`id_person` = `pe`.`id_person`) AND (`e`.`id_status` = `s`.`id_status`) AND (`pe`.`id_person` = `w`.`id_person`) AND (`r`.`id_role_type` = `w`.`id_role_type`) AND (`c`.`id_crime` = `e`.`id_crime`) AND (`s`.`status` = 'convicted')) GROUP BY `c`.`id_crime`, `r`.`id_role_type`, `w`.`id_works` ORDER BY `r`.`role_type` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `unethical_persons_relevant`
--
DROP TABLE IF EXISTS `unethical_persons_relevant`;

DROP VIEW IF EXISTS `unethical_persons_relevant`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `unethical_persons_relevant`  AS SELECT `pe`.`person_name` AS `person_name`, count(0) AS `nb` FROM ((`person` `pe` join `event_table` `e`) join `status_table` `s`) WHERE ((`pe`.`id_person` = `e`.`id_person`) AND (`s`.`id_status` = `e`.`id_status`) AND (`s`.`status` <> 'rumour') AND (`s`.`status` <> 'acquitted') AND (`s`.`status` <> 'dropped charges')) GROUP BY `pe`.`person_name` ORDER BY `nb` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `unethical_persons_unrelevant`
--
DROP TABLE IF EXISTS `unethical_persons_unrelevant`;

DROP VIEW IF EXISTS `unethical_persons_unrelevant`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `unethical_persons_unrelevant`  AS SELECT `pe`.`person_name` AS `person_name`, count(0) AS `nb` FROM (`person` `pe` join `event_table` `e`) WHERE (`pe`.`id_person` = `e`.`id_person`) GROUP BY `pe`.`person_name` ORDER BY `nb` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `unethical_prizes`
--
DROP TABLE IF EXISTS `unethical_prizes`;

DROP VIEW IF EXISTS `unethical_prizes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `unethical_prizes`  AS SELECT `p`.`prize_name` AS `prize_name`, `pe`.`person_name` AS `person_name`, `a`.`year_award` AS `year_award`, `a`.`prize_won` AS `prize_won`, `e`.`year_event` AS `year_event`, `c`.`crime_type` AS `crime_type` FROM ((((((`prize` `p` join `award` `a`) join `person` `pe`) join `event_table` `e`) join `works` `w`) join `status_table` `s`) join `crime_type` `c`) WHERE ((`p`.`id_prize` = `a`.`id_prize`) AND (`a`.`id_works` = `w`.`id_works`) AND (`pe`.`id_person` = `w`.`id_person`) AND (`pe`.`id_person` = `e`.`id_person`) AND (`e`.`id_status` = `s`.`id_status`) AND (`c`.`id_crime` = `e`.`id_crime`) AND (`s`.`status` = 'convicted') AND (`a`.`year_award` >= `e`.`year_event`)) ;

-- --------------------------------------------------------

--
-- Structure for view `unethical_score`
--
DROP TABLE IF EXISTS `unethical_score`;

DROP VIEW IF EXISTS `unethical_score`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `unethical_score`  AS SELECT `c`.`name_content` AS `name_content`, `c`.`synopsis` AS `synopsis`, `s`.`studio_name` AS `studio_name`, `c`.`year_content` AS `year_content`, `cc`.`content_category_name` AS `content_category_name`, (select count(0) from (`event_table` `e` join `status_table` `s`) where ((`e`.`id_person` = `p`.`id_person`) and (`e`.`id_status` = `s`.`id_status`)) group by `p`.`person_name`) AS `Unethical score` FROM ((((((`content` `c` join `person` `p`) join `rating` `r`) join `works` `w`) join `event_table` `e`) join `studio` `s`) join `content_category` `cc`) WHERE ((`c`.`id_studio` = `s`.`id_studio`) AND (`c`.`id_content_category` = `cc`.`id_content_category`) AND (`c`.`id_content` = `r`.`id_content`) AND (`c`.`id_content` = `w`.`id_content`) AND (`p`.`id_person` = `w`.`id_person`)) GROUP BY `c`.`name_content` ORDER BY `Unethical score` DESC ;

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
  ADD CONSTRAINT `FK_197` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id_studio`),
  ADD CONSTRAINT `FK_62` FOREIGN KEY (`id_content_category`) REFERENCES `content_category` (`id_content_category`);

--
-- Constraints for table `event_table`
--
ALTER TABLE `event_table`
  ADD CONSTRAINT `FK_177` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`),
  ADD CONSTRAINT `FK_180` FOREIGN KEY (`id_crime`) REFERENCES `crime_type` (`id_crime`),
  ADD CONSTRAINT `FK_190` FOREIGN KEY (`id_status`) REFERENCES `status_table` (`id_status`);

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
  ADD CONSTRAINT `FK_211` FOREIGN KEY (`id_role_type`) REFERENCES `role_type` (`id_role_type`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_24` FOREIGN KEY (`id_content`) REFERENCES `content` (`id_content`),
  ADD CONSTRAINT `FK_70` FOREIGN KEY (`id_character_category`) REFERENCES `character_category` (`id_character_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



--Views creation
CREATE VIEW unethical_score AS
SELECT name_content, synopsis, studio_name, year_content, content_category_name,
(SELECT COUNT(*)
 FROM event_table E, status_table S
 WHERE E.id_person = P.id_person
 AND E.id_status = S.id_status
 GROUP BY person_name
)  AS `Unethical score` 
FROM `nutflux`.`content` `c` 
JOIN `nutflux`.`person` `p` 
JOIN `nutflux`.`rating` `r` 
JOIN `nutflux`.`works` `w` 
JOIN `nutflux`.`event_table` `e` 
JOIN `nutflux`.`studio` `s` 
JOIN `nutflux`.`content_category` `cc` 
WHERE ((`c`.`id_studio` = `s`.`id_studio`) 
       AND (`c`.`id_content_category` = `cc`.`id_content_category`) 
       AND (`c`.`id_content` = `r`.`id_content`) 
       AND (`c`.`id_content` = `w`.`id_content`) 
       AND (`p`.`id_person` = `w`.`id_person`)) 
GROUP BY `c`.`name_content` 
ORDER BY `Unethical score` DESC;


CREATE VIEW unethical_prizes AS 
SELECT P.prize_name, PE.person_name, A.year_award, A.prize_won, E.year_event, C.crime_type
FROM prize P, award A, person PE, event_table E, works W, status_table S, crime_type C
WHERE P.id_prize = A.id_prize
AND A.id_works = W.id_works
AND PE.id_person = W.id_person
AND PE.id_person = E.id_person
AND E.id_status = S.id_status
AND C.id_crime = E.id_crime
AND S.status = "convicted"
AND A.year_award >= E.year_event;

CREATE VIEW unethical_persons_unrelevant AS 
SELECT PE.person_name, COUNT(0) as nb
FROM person PE, event_table E
WHERE PE.id_person = E.id_person
GROUP BY PE.person_name
ORDER BY nb DESC;

CREATE VIEW unethical_persons_relevant AS 
SELECT PE.person_name, COUNT(0) as nb
FROM person PE, event_table E, status_table S
WHERE PE.id_person = E.id_person
AND S.id_status = E.id_status
AND S.status != "rumour"
AND S.status != "acquitted"
AND S.status != "dropped charges"
GROUP BY PE.person_name
ORDER BY nb DESC;

CREATE VIEW crime_by_role AS
SELECT DISTINCT R.role_type, C.crime_type, COUNT(0)
FROM event_table E, person PE, status_table S, works W, role_type R, crime_type C
WHERE E.id_person = PE.id_person
AND E.id_status = S.id_status
AND PE.id_person = W.id_person
AND R.id_role_type = W.id_role_type
AND C.id_crime = E.id_crime
AND S.status = "convicted"
GROUP BY C.id_crime, R.id_role_type, W.id_works
ORDER BY R.role_type;

--Queries
SELECT person_name, COUNT(*) AS nb 
FROM event_table E, status_table S, person P 
WHERE E.id_person = P.id_person 
AND E.id_status = S.id_status 
AND (S.status != "rumour" OR S.status != "acquitted") 
GROUP BY person_name 
ORDER BY nb DESC; 

SELECT P1.person_name, P2.person_name
FROM person P1, person P2, social_relationship SR, relationship_type R, event_table E, status_table S 
WHERE P1.id_person = SR.id_person_1
AND P2.id_person = SR.id_person_2
AND SR.relationship_type_id = R.relationship_type_id
AND (P1.id_person = E.id_person OR P2.id_person = E.id_person)
AND E.id_status = S.id_status
AND S.status = "convicted";


SELECT P1.person_name AS "Married to a real life villain"
FROM person P1, person P2, social_relationship SR, relationship_type R, event_table E, status_table S 
WHERE P1.id_person = SR.id_person_1
AND P2.id_person = SR.id_person_2
AND SR.relationship_type_id = R.relationship_type_id
AND P2.id_person = E.id_person
AND E.id_status = S.id_status
AND S.status = "convicted"
UNION
SELECT P2.person_name AS "Married to a real life villain"
FROM person P1, person P2, social_relationship SR, relationship_type R, event_table E, status_table S 
WHERE P2.id_person = SR.id_person_2
AND P1.id_person = SR.id_person_1
AND SR.relationship_type_id = R.relationship_type_id
AND P1.id_person = E.id_person
AND E.id_status = S.id_status
AND S.status = "convicted";


CREATE VIEW tempView AS
(SELECT S.studio_name, CT.crime_type, COUNT(*) AS nb
FROM studio S, content C, works W, person P, event_table E, crime_type CT
WHERE S.id_studio = C.id_studio
AND C.id_content = W.id_content
AND W.id_person = P.id_person
AND P.id_person = E.id_person
AND E.id_crime = CT.id_crime
GROUP BY S.id_studio, CT.id_crime
ORDER BY S.id_studio);

SELECT t1.* 
FROM tempview t1
INNER JOIN
(
    SELECT `studio_name`, MAX(nb) AS max_nb
    FROM tempview
    GROUP BY `studio_name`
) AS t2
    ON t1.studio_name = t2.studio_name
    AND t1.nb = t2.max_nb;

DROP VIEW tempview;