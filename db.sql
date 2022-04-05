DROP DATABASE IF EXISTS nutflux;

CREATE DATABASE nutflux;

CREATE TABLE `user`
(
 `id_user`   integer NOT NULL AUTO_INCREMENT,
 `pro_user`  boolean NOT NULL ,
 `mail_user` varchar(255) NOT NULL ,

PRIMARY KEY (`id_user`)
);


CREATE TABLE `content_category`
(
 `id_content_category`     integer NOT NULL AUTO_INCREMENT ,
 `content_category_name` varchar(255) NOT NULL ,

PRIMARY KEY (`id_content_category`)
);

CREATE TABLE `studio`
(
 `id_studio`   integer NOT NULL AUTO_INCREMENT,
 `studio_name` varchar(255) NOT NULL ,

PRIMARY KEY (`id_studio`)
);



CREATE TABLE `content`
(
 `id_content`          integer NOT NULL AUTO_INCREMENT,
 `synopsis`            varchar(255) NULL ,
 `id_studio`           integer NOT NULL ,
 `id_content_category` integer NOT NULL ,
 `name_content`        varchar(255) NOT NULL ,
 `year_content`                integer NOT NULL ,

PRIMARY KEY (`id_content`),
KEY `FK_199` (`id_studio`),
CONSTRAINT `FK_197` FOREIGN KEY `FK_199` (`id_studio`) REFERENCES `studio` (`id_studio`),
KEY `FK_64` (`id_content_category`),
CONSTRAINT `FK_62` FOREIGN KEY `FK_64` (`id_content_category`) REFERENCES `content_category` (`id_content_category`)
);



CREATE TABLE `rating`
(
 `id_user`    integer NOT NULL ,
 `id_content` integer NOT NULL ,
 `note`       smallint NOT NULL ,

PRIMARY KEY (`id_user`,`id_content`),

KEY `FK_36` (`id_user`),
CONSTRAINT `FK_34` FOREIGN KEY `FK_36` (`id_user`) REFERENCES `user` (`id_user`),
KEY `FK_40` (`id_content`),
CONSTRAINT `FK_38` FOREIGN KEY `FK_40` (`id_content`) REFERENCES `content` (`id_content`)
);



CREATE TABLE `quote`
(
 `id_quote`      integer NOT NULL AUTO_INCREMENT ,
 `quote_content` varchar(255) NOT NULL ,
 `id_content`    integer NOT NULL ,

PRIMARY KEY (`id_quote`),
KEY `FK_58` (`id_content`),
CONSTRAINT `FK_55` FOREIGN KEY `FK_58` (`id_content`) REFERENCES `content` (`id_content`)
);


CREATE TABLE `role_type`
(
 `id_role_type` integer NOT NULL AUTO_INCREMENT ,
 `role_type`    varchar(255) NOT NULL ,

PRIMARY KEY (`id_role_type`)
);


CREATE TABLE `nationality`
(
 `id_nationality`   integer NOT NULL AUTO_INCREMENT ,
 `nationality_name` varchar(255) NOT NULL ,

PRIMARY KEY (`id_nationality`)
);


CREATE TABLE `person`
(
 `id_person`      integer NOT NULL AUTO_INCREMENT,
 `birth_date`     date NOT NULL ,
 `id_nationality` integer NOT NULL ,
 `gender`         boolean NOT NULL ,
 `first_name`   varchar(255) NOT NULL ,
 `last_name`    varchar(255) NOT NULL ,

PRIMARY KEY (`id_person`),
KEY `FK_105` (`id_nationality`),
CONSTRAINT `FK_103` FOREIGN KEY `FK_105` (`id_nationality`) REFERENCES `nationality` (`id_nationality`)
);


CREATE TABLE `character_category`
(
 `id_character_category`     integer NOT NULL AUTO_INCREMENT ,
 `character_category_name` varchar(255) NOT NULL ,

PRIMARY KEY (`id_character_category`)
);


CREATE TABLE `works`
(
 `id_works`              integer NOT NULL AUTO_INCREMENT,
 `id_content`            integer NOT NULL ,
 `id_character_category` integer NULL ,
 `id_person`             integer NOT NULL ,
 `salary`                integer NOT NULL ,
 `character_name`        varchar(255) NULL ,
 `is_guest`                 boolean NOT NULL ,

PRIMARY KEY (`id_works`),
KEY `FK_23` (`id_person`),
CONSTRAINT `FK_21` FOREIGN KEY `FK_23` (`id_person`) REFERENCES `person` (`id_person`),
KEY `FK_26` (`id_content`),
CONSTRAINT `FK_24` FOREIGN KEY `FK_26` (`id_content`) REFERENCES `content` (`id_content`),
KEY `FK_72` (`id_character_category`),
CONSTRAINT `FK_70` FOREIGN KEY `FK_72` (`id_character_category`) REFERENCES `character_category` (`id_character_category`)
);



CREATE TABLE `prize`
(
 `id_prize`   integer NOT NULL AUTO_INCREMENT ,
 `prize_name` varchar(255) NOT NULL ,

PRIMARY KEY (`id_prize`)
);


CREATE TABLE `award`
(
 `id_prize` integer NOT NULL ,
 `id_works` integer NOT NULL ,
 `prize_won` boolean NOT NULL ,
 `year_award`     integer NULL ,

PRIMARY KEY (`id_prize`, `id_works`),
KEY `FK_120` (`id_works`),
CONSTRAINT `FK_118` FOREIGN KEY `FK_120` (`id_works`) REFERENCES `works` (`id_works`),
KEY `FK_130` (`id_prize`),
CONSTRAINT `FK_128` FOREIGN KEY `FK_130` (`id_prize`) REFERENCES `prize` (`id_prize`)
);


CREATE TABLE `relationship_type`
(
 `relationship_type_id`   integer NOT NULL AUTO_INCREMENT ,
 `relationship_type_name` varchar(255) NOT NULL ,

PRIMARY KEY (`relationship_type_id`)
);


CREATE TABLE `social_relationship`
(
 `id_person_1`          integer NOT NULL ,
 `id_person_2`          integer NOT NULL ,
 `relationship_type_id` integer NOT NULL ,
 `starting_year`        integer NOT NULL ,
 `ending_year`          integer NULL ,

PRIMARY KEY (`id_person_1`, `id_person_2`, `relationship_type_id`),

KEY `FK_150` (`relationship_type_id`),
CONSTRAINT `FK_148` FOREIGN KEY `FK_150` (`relationship_type_id`) REFERENCES `relationship_type` (`relationship_type_id`),
KEY `FK_166` (`id_person_2`),
CONSTRAINT `FK_164` FOREIGN KEY `FK_166` (`id_person_2`) REFERENCES `person` (`id_person`),
KEY `FK_169` (`id_person_1`),
CONSTRAINT `FK_167` FOREIGN KEY `FK_169` (`id_person_1`) REFERENCES `person` (`id_person`)
);


CREATE TABLE `crime_type`
(
 `id_crime`   integer NOT NULL AUTO_INCREMENT,
 `crime_type` varchar(255) NOT NULL ,

PRIMARY KEY (`id_crime`)
);


CREATE TABLE `status`
(
 `id_status` integer NOT NULL AUTO_INCREMENT,
 `status`    varchar(255) NOT NULL ,

PRIMARY KEY (`id_status`)
);




CREATE TABLE `event`
(
 `id_person` integer NOT NULL ,
 `id_status` integer NOT NULL ,
 `id_crime`  integer NOT NULL ,
 `year_event`      integer NOT NULL ,

 PRIMARY KEY (`id_person`, `id_status`, `id_crime`),

KEY `FK_179` (`id_person`),
CONSTRAINT `FK_177` FOREIGN KEY `FK_179` (`id_person`) REFERENCES `person` (`id_person`),
KEY `FK_182` (`id_crime`),
CONSTRAINT `FK_180` FOREIGN KEY `FK_182` (`id_crime`) REFERENCES `crime_type` (`id_crime`),
KEY `FK_192` (`id_status`),
CONSTRAINT `FK_190` FOREIGN KEY `FK_192` (`id_status`) REFERENCES `status` (`id_status`)
);