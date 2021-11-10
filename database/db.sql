CREATE DATABASE  IF NOT EXISTS `giftmefive` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `giftmefive`;
-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: giftmefive
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `market_link` longtext NOT NULL,
  `picture` longtext NOT NULL,
  `description` longtext NOT NULL,
  `price` float NOT NULL,
  `is_gifted` tinyint DEFAULT '0',
  `list_id` int NOT NULL,
  PRIMARY KEY (`id`,`list_id`),
  KEY `fk_article_list1_idx` (`list_id`),
  CONSTRAINT `fk_article_list1` FOREIGN KEY (`list_id`) REFERENCES `list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Micro-onde','https://www.amazon.fr/Micro-Ondes-MW2-MM20PF-BK-D%C3%A9cong%C3%A9lation-Puissance/dp/B08CCDDCCC/ref=sr_1_5?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=38MQ97N7N7ON4&dchild=1','https://m.media-amazon.com/images/I/81nB2TamwpL._AC_SL1500_.jpg','Je veux ce micro-onde',99.99,0,1),(2,'Brosse à dent ','https://www.amazon.fr/Oral-B-Électrique-Rechargeable-Pression-Brossette/dp/B094W9KT4Y/ref=sr_1_5?dchild=1','https://m.media-amazon.com/images/I/7110q+qB1JS._AC_SL1500_.jpg','Je veux la brosse à dent Oral-B PRO 600',21.4,0,1),(3,'Manette PS5','https://www.amazon.fr/PlayStation-officielle-DualSense-rechargeable-Compatible/dp/B08H99BPJN/ref=sr_1_5?dchild=1','https://m.media-amazon.com/images/I/71lPDuOqgKL._AC_SL1500_.jpg','Je veux la manette PS5 blanche',69.9,0,1),(4,'Mixeur','https://www.amazon.fr/s?k=magimix+cook+expert+connect&sprefix=magimix+cook+expert+conne%2Caps%2C89&ref=nb_sb_ss_ts-doa-p_1_25','https://m.media-amazon.com/images/I/512cNTldn5L._AC_SL1000_.jpg','Je veux le magimix expert connect',1499,1,1),(5,'Ordinateur','https://www.amazon.fr/Dell-Inspiron-Ordinateur-Processeur-Graphiques/dp/B08XZQLFRF/ref=sr_1_5?__mk_fr_FR=ÅMÅŽÕÑ&crid=XNEVBWDGJQ9W&dchild=1','https://m.media-amazon.com/images/I/81jo+aoVEeS._AC_SL1500_.jpg','Je veux le Dell Inspirion',499,0,1),(6,'Frigo','https://www.amazon.fr/Réfrigérateur-américain-GSX961MCVZ-Door-Door/dp/B07YY5NT2T/ref=sr_1_12?dchild=1','https://m.media-amazon.com/images/I/31YyOzNThrL._AC_.jpg','Je veux le LG Side By Side GSX961MCVZ',2351,1,1),(7,'Fauteuil','https://www.amazon.fr/IDMarket-Fauteuil-scandinave-Tissu-Anthracite/dp/B07QX8ZKBF/ref=sr_1_5?dchild=1','https://m.media-amazon.com/images/I/41U2ZuNxJzL._AC_SX425_.jpg','Je veux le IDMarket',154.9,0,1),(8,'Battlefield 2042','https://www.amazon.fr/Electronic-Arts-198874-Battlefield-PlayStation/dp/B096KG6M2K/ref=sr_1_1?dchild=1','https://m.media-amazon.com/images/I/81jKBuMVq+S._AC_SL1500_.jpg','Je veux battlefield 2042',67.99,0,1),(9,'Papier hygiénique','https://www.amazon.fr/Papier-toilette-papier-hygi%C3%A9nique-mariage/dp/B00CP3X9QM/ref=sxin_14_ac_d_rm?ac_md=1-1-Y2FkZWF1IG1hcmlhZ2U%3D-ac_d_rm_rm_rm&cv_ct_cx=cadeau+mariage+couple&keywords=cadeau+mariage+couple','https://m.media-amazon.com/images/I/71iJl+l+AhL._AC_SL1500_.jpg','Je veux mon papier personnalisé',8,1,2),(10,'Tasses en Marbre','https://www.amazon.fr/Coffrets-lengagement-nuptiale-Newlyweds-anniversaire/dp/B081G87TPM/ref=sxin_14_ac_d_rm?ac_md=0-0-Y2FkZWF1IG1hcmlhZ2UgY291cGxl-ac_d_rm_rm_rm&cv_ct_cx','https://m.media-amazon.com/images/I/816L1EPdjBL._AC_SL1500_.jpg','Je veux les tasses en marbre pour Madame',33,0,2),(11,'Ourson','https://www.amazon.fr/TRIPLE-%C3%A9ternelles-conserv%C3%A9e-anniversaire-anniversaire/dp/B08PT8W9QY/ref=sr_1_1_sspa?keywords=cadeau+mariage&pd_rd_r=c06452b4-9abe-4b6c-9ce4-1e678239f7b9&pd_rd_w=X5Su1','https://m.media-amazon.com/images/I/71-QigBKmpS._AC_SL1500_.jpg','Je veux mon Ours en peluche',59,0,2),(12,'Couverture','https://www.amazon.fr/Couverture-Personnalis%C3%A9e-Couvertures-Anniversaire-Compagnie/dp/B096NJK5B3?psc=1&pd_rd_w=m2NYJ&pf_rd_p','https://m.media-amazon.com/images/I/71Z3sliX9ES._AC_SL1500_.jpg','Je veux ma couverture personnalisée',19,1,2),(13,'Coffret Cadeau','https://www.amazon.fr/SMARTBOX-Coffret-famille-petit-d%C3%A9jeuner-personnes/dp/B08285889C/ref=sr_1_168_sspa?keywords=cadeau+mariage','https://m.media-amazon.com/images/I/51GapKe4OjL._AC_.jpg','Je veux mon coffret de famille',79,0,2),(14,'Album Photo','https://www.amazon.fr/Maverton-Album-Photo-personnalis%C3%A9-Transparentes/dp/B09G3HLFHN/ref=sr_1_298?keywords=cadeau+mariage','https://m.media-amazon.com/images/I/71O7VnCRZ-L._AC_SL1400_.jpg','Je veux cet album photo',39,0,2);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Mariage'),(2,'Anniversaire'),(3,'Crémaillère'),(4,'Fêtes religieuses'),(5,'Fête Prénatale'),(6,'Autre');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `share_link` int NOT NULL,
  `description` longtext NOT NULL,
  `limit_date` date NOT NULL,
  `creation_date` date NOT NULL,
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`event_id`),
  KEY `fk_list_user_idx` (`user_id`),
  KEY `fk_list_event1_idx` (`event_id`),
  CONSTRAINT `fk_list_event1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `fk_list_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
INSERT INTO `list` VALUES (1,'Annif',90825,'Hey! vous pouvez trouver ci-dessous ce qui me fera plaisir pour mon anniversaire. Vous pouvez réserver tel ou tel objet. Vous y trouvererez également un lien vers  un site marchand si vous ne savez pas où le trouver','2021-07-31','2021-10-29',1,2),(2,'Mariage',90826,'Hey! vous pouvez trouver ci-dessous ce qui me fera plaisir pour mon mariage. Vous pouvez réserver tel ou tel objet. Vous y trouvererez également un lien vers  un site marchand si vous ne savez pas où le trouver','2021-12-21','2021-11-10',1,1);
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(70) NOT NULL,
  `firstname` varchar(70) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `session` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `session_UNIQUE` (`session`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Toto','Tacos','tototacos@gmail.com','$2y$10$qQ7LdZLP5bYf.SrbGxvYEOyBplTKeEL5JruuqndCQZXbFqhvfQFrC','1990-02-28','a0jsve282bcvro9nu497bb3eea');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-10 16:24:03
