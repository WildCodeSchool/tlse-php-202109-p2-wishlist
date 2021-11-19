-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: giftmefive
-- ------------------------------------------------------
-- Server version	8.0.27

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Micro-onde','https://www.amazon.fr/Micro-Ondes-MW2-MM20PF-BK-D%C3%A9cong%C3%A9lation-Puissance/dp/B08CCDDCCC/ref=sr_1_5?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=38MQ97N7N7ON4&dchild=1','https://m.media-amazon.com/images/I/81nB2TamwpL._AC_SL1500_.jpg','Je veux ce micro-onde',99.99,0,1),(2,'Brosse à dent ','https://www.amazon.fr/Oral-B-Électrique-Rechargeable-Pression-Brossette/dp/B094W9KT4Y/ref=sr_1_5?dchild=1','https://m.media-amazon.com/images/I/7110q+qB1JS._AC_SL1500_.jpg','Je veux la brosse à dent Oral-B PRO 600',21.4,0,1),(3,'Manette PS5','https://www.amazon.fr/PlayStation-officielle-DualSense-rechargeable-Compatible/dp/B08H99BPJN/ref=sr_1_5?dchild=1','https://m.media-amazon.com/images/I/71lPDuOqgKL._AC_SL1500_.jpg','Je veux la manette PS5 blanche',69.9,0,1),(4,'Mixeur','https://www.amazon.fr/s?k=magimix+cook+expert+connect&sprefix=magimix+cook+expert+conne%2Caps%2C89&ref=nb_sb_ss_ts-doa-p_1_25','https://m.media-amazon.com/images/I/512cNTldn5L._AC_SL1000_.jpg','Je veux le magimix expert connect',1499,1,1),(5,'Ordinateur','https://www.amazon.fr/Dell-Inspiron-Ordinateur-Processeur-Graphiques/dp/B08XZQLFRF/ref=sr_1_5?__mk_fr_FR=ÅMÅŽÕÑ&crid=XNEVBWDGJQ9W&dchild=1','https://m.media-amazon.com/images/I/81jo+aoVEeS._AC_SL1500_.jpg','Je veux le Dell Inspirion',499,0,1),(6,'Frigo','https://www.amazon.fr/Réfrigérateur-américain-GSX961MCVZ-Door-Door/dp/B07YY5NT2T/ref=sr_1_12?dchild=1','https://m.media-amazon.com/images/I/31YyOzNThrL._AC_.jpg','Je veux le LG Side By Side GSX961MCVZ',2351,1,1),(7,'Fauteuil','https://www.amazon.fr/IDMarket-Fauteuil-scandinave-Tissu-Anthracite/dp/B07QX8ZKBF/ref=sr_1_5?dchild=1','https://m.media-amazon.com/images/I/41U2ZuNxJzL._AC_SX425_.jpg','Je veux le IDMarket',154.9,0,1),(8,'Battlefield 2042','https://www.amazon.fr/Electronic-Arts-198874-Battlefield-PlayStation/dp/B096KG6M2K/ref=sr_1_1?dchild=1','https://m.media-amazon.com/images/I/81jKBuMVq+S._AC_SL1500_.jpg','Je veux battlefield 2042',67.99,0,1),(9,'PQ','https://www.amazon.fr/Papier-toilette-papier-hygi%C3%A9nique-mariage/dp/B00CP3X9QM/ref=sxin_14_ac_d_rm?ac_md=1-1-Y2FkZWF1IG1hcmlhZ2U%3D-ac_d_rm_rm_rm&cv_ct_cx=cadeau+mariage+couple&keywords=cadeau+mariage+couple','https://m.media-amazon.com/images/I/71iJl+l+AhL._AC_SL1500_.jpg','Je veux mon papier personnalisé',8,1,2),(10,'Tasses','https://www.amazon.fr/Coffrets-lengagement-nuptiale-Newlyweds-anniversaire/dp/B081G87TPM/ref=sxin_14_ac_d_rm?ac_md=0-0-Y2FkZWF1IG1hcmlhZ2UgY291cGxl-ac_d_rm_rm_rm&cv_ct_cx','https://m.media-amazon.com/images/I/816L1EPdjBL._AC_SL1500_.jpg','Je veux les tasses en marbre pour Madame',33,0,2),(11,'Ourson','https://www.amazon.fr/TRIPLE-%C3%A9ternelles-conserv%C3%A9e-anniversaire-anniversaire/dp/B08PT8W9QY/ref=sr_1_1_sspa?keywords=cadeau+mariage&pd_rd_r=c06452b4-9abe-4b6c-9ce4-1e678239f7b9&pd_rd_w=X5Su1','https://m.media-amazon.com/images/I/71-QigBKmpS._AC_SL1500_.jpg','Je veux mon Ours en peluche',59,0,2),(12,'Couverture','https://www.amazon.fr/Couverture-Personnalis%C3%A9e-Couvertures-Anniversaire-Compagnie/dp/B096NJK5B3?psc=1&pd_rd_w=m2NYJ&pf_rd_p','https://m.media-amazon.com/images/I/71Z3sliX9ES._AC_SL1500_.jpg','Je veux ma couverture personnalisée',19,1,2),(13,'Coffret Cadeau','https://www.amazon.fr/SMARTBOX-Coffret-famille-petit-d%C3%A9jeuner-personnes/dp/B08285889C/ref=sr_1_168_sspa?keywords=cadeau+mariage','https://m.media-amazon.com/images/I/51GapKe4OjL._AC_.jpg','Je veux mon coffret de famille',79,0,2),(14,'Album Photo','https://www.amazon.fr/Maverton-Album-Photo-personnalis%C3%A9-Transparentes/dp/B09G3HLFHN/ref=sr_1_298?keywords=cadeau+mariage','https://m.media-amazon.com/images/I/71O7VnCRZ-L._AC_SL1400_.jpg','Je veux cet album photo',39,0,2),(15,'Mug Papa','https://www.amazon.fr/Mug-personnalis%C3%A9-%C3%A9chographie-grossesse-originale/dp/B08S72G5T1/ref=sr_1_1_sspa?keywords=cadeau+futur+papa&qid=1636634604&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyN0VHTTRVVTQzN1UyJmVuY3J5cHRlZElkPUEwMTkxNjU2WjIxTEg0MzFTN0RBJmVuY3J5cHRlZEFkSWQ9QTA2NzY0NTIyNE1QM0NPV0NYTlY0JndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==','https://m.media-amazon.com/images/I/41wrzaHgv+L.jpg','C\'est mignon',13,1,3),(16,'Calendrier','https://www.amazon.fr/Vita-Dulcis-Calendrier-classique-2019-24x0/dp/B07XWP2DHM/ref=sr_1_5?__mk_fr_FR=ÅMÅŽÕÑ&crid=225C4B5NHAFAM&keywords=whisky&qid=1636636530&qsid=261-8262764-1988418&sprefix=wh%2Caps%2C257&sr=8-5&sres=B07XWP2DHM%2CB015KXFM5E%2CB001TZASVQ%2CB008CYYV5G%2CB003ZINBLE%2CB00BERLBG0%2CB07YSSQN6T%2CB07F5RFZD3%2CB015KXFDSK%2CB00OGMTNT2%2CB004EY1T4E%2CB01EA0ILJC%2CB01MXU6WV9%2CB00PC9EQQI%2CB005YLX4SK%2CB004R8HO9Q%2CB004V932HY%2CB008U7SUDE%2C2376711851%2CB07CVDBWGZ&srpt=SPIRITS','https://m.media-amazon.com/images/I/81Y5B2U5KpL._AC_SL1500_.jpg','Ca pourrait aider',88,0,3),(17,'Coffret Whisky','https://www.amazon.fr/Coffret-Cadeau-Vinaddict-Whiskys-japonais/dp/B08MCNHJDM/ref=sr_1_1?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=225C4B5NHAFAM&keywords=whisky&qid=1636636618&qsid=261-8262764-1988418&refinements=p_36%3A2492335031&rnid=2492331031&s=grocery&sprefix=wh%2Caps%2C257&sr=1-1&sres=B08MCNHJDM%2CB09D8WLYXH%2CB077PMN3L7%2CB01GVGBN3E%2CB01CYD4N58%2CB077PGNHDL%2CB09C9X7R54%2CB08189BT5P%2CB07C7DLXCJ%2CB08R2V3PK9%2CB0733G6J15%2CB09168W7GL%2CB08N1HBFR9%2CB08Q4FSJ67%2CB0753P57RQ%2CB08L22P6S6%2CB08KWKL421%2CB08KVB98XM%2CB01BKJFBK8%2CB08KBVLR7S&srpt=SPIRITS','https://m.media-amazon.com/images/I/41Sqts0OxTL._AC_.jpg','J\'aime le whisky',199,1,3),(18,'Téléviseur','https://www.amazon.fr/Samsung-QE65Q80A-T%C3%A9l%C3%A9viseur-QLED-163/dp/B08PDJL4B7/ref=sr_1_1?keywords=t%C3%A9l%C3%A9vision&qid=1636636686&qsid=261-8262764-1988418&refinements=p_36%3A12419361031&rnid=12419355031&s=home-theater&sr=1-1&sres=B08PDJL4B7%2CB091Z61JN4%2CB094L865JZ%2CB08QJ2RZZ3%2CB091P2G3CC%2CB08Y3RKL2T%2CB091P23VBL%2CB08PDC96Q3%2CB08PDQ73T4%2CB091P2SFDZ%2CB08Y6WDN94%2CB08YLGH7YY%2CB091Q68XCG%2CB08PDPWQT9%2CB094MTCRCC%2CB089NBN32C%2CB094KX6SGC%2CB08PDQ656T%2CB08HHMC9H6%2CB083QYJN9M&srpt=TELEVISION','https://m.media-amazon.com/images/I/71UY5liMUIL._AC_SL1500_.jpg','Pour la mettre dans mon garage',1270,0,3),(19,'Ordinateur','https://www.amazon.fr/Megaport-i9-11900F-5-20GHz-Centrale-Ordinateur/dp/B098R292Z7/ref=sr_1_1?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=ordinateur+gamer&qid=1636636765&qsid=261-8262764-1988418&refinements=p_36%3A680948011&rnid=389179011&s=electronics&sr=1-1&sres=B098R292Z7%2CB092R7BKS4%2CB09HTQP5PD%2CB083Z9MMTM%2CB00L8DVG24%2CB00OUS0Q20%2CB083Z8TZB7%2CB07YC9H11Z%2CB083Z9LMC2%2CB07BFF45GP%2CB098TJ6QZM%2CB099Z56ZGM%2CB07BFF3FYL%2CB092R8MWJ9%2CB07YC8MX95%2CB099Z6BQ8F%2CB092ZXSNF7%2CB099Z2GRCC%2CB091C6TRYR%2CB098TN2FJ3&srpt=PERSONAL_COMPUTER','https://m.media-amazon.com/images/I/61mWKB1++SL._AC_SL1200_.jpg','Pour m\'occuper pendant les nuits blanches',3249,0,3),(20,'Ecran PC','https://www.amazon.fr/Samsung-LC49HG90DMU-incurv%C3%A9-Pouces-Pixels/dp/B073RJQXB1/ref=sr_1_4?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=ecran+gamer&qid=1636636828&qsid=261-8262764-1988418&s=electronics&sr=1-4&sres=B09C2DSP8Y%2CB09C2B4X9H%2CB076PTMVJ8%2CB073RJQXB1%2CB07XKBM2DX%2CB07VTPKCLS%2CB089QQR47Z%2CB07KJPCGP1%2CB096ZS52JY%2CB096ZPVM4V%2CB08CMPX8QH%2CB096ZK9RVH%2CB096ZK3KZK%2CB07TTJR48G%2CB08CSP3KPJ%2CB07VW9ZD6Y%2CB0913JG3QF%2CB00JLAXLLA%2CB08J4D98JB%2CB084GPSV47&srpt=MONITOR','https://m.media-amazon.com/images/I/8199O-5w1xL._AC_SL1500_.jpg','De quoi accompagner mon nouvel ordinateur',799,0,3),(21,'Poussette','https://www.amazon.fr/Poussette-Pliable-Portable-Couverture-Nouveau-n%C3%A9/dp/B08ZCQ18HM/ref=sr_1_4?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=poussette+luxe&qid=1636637092&qsid=261-8262764-1988418&s=baby&sr=1-4&sres=B0819RYGV1%2CB08ZCQ18HM%2CB01ELDCSHY%2CB08429YN31%2CB07LF94ZMH%2CB096VXVPFJ%2CB07X7GJ325%2CB082BHQ9WS%2CB08G1TZVS6%2CB086XDCS1W%2CB082BL1QC1%2CB082BH5PF2%2CB09FZ37NJB%2CB07R1NDZGW%2CB082FGX1NW%2CB09GK5MCM7&srpt=STROLLER','https://m.media-amazon.com/images/I/71-L9jhek5L._AC_SL1500_.jpg','Il faut bien penser au futur bébé',385,1,3),(22,'Congélateur','https://www.amazon.fr/Whirlpool-WHM39112-cong%C3%A9lateurs-Coffre-Autonome/dp/B008N8WJ46/ref=sr_1_11?keywords=cong%C3%A9lateur&qid=1636637297&qsid=261-8262764-1988418&sr=8-11&sres=B08M9C6PGF%2CB08MTMC7JJ%2CB092TQ4Q4N%2CB008PCJUQA%2CB09CKX1HGN%2CB074SHM4KJ%2CB008N8WJ46%2CB07NXYX9C4%2CB071NXW6TC%2CB08PMR1LPH%2CB00LAXBP96%2CB07PTS3T22%2CB087Z4SV4T%2CB08CF56HQK%2CB08Y5WTBHF%2CB08JV7ZSBY%2CB08DR9988H%2CB08KLYSNGS%2CB007442Q5M%2CB00KU4LEGK&srpt=FREEZER','https://m.media-amazon.com/images/I/815WGHEnyOL._AC_SL1500_.jpg','Ca peut toujours servir',469,0,3),(28,'Planche Fromage','https://www.amazon.fr/Grande-Planche-Fromage-comprenant-sous-verres/dp/B07PTTCY96/ref=sr_1_9?adgrpid=61728208688&gclid=CjwKCAiA7dKMBhBCEiwAO_crFIUB_xwEwtOKkCccwAetACBgsK06OpDppOFVwAkD9owrcG5WJur3XRoCGokQAvD_BwE&hvadid=275538738917&hvdev=c&hvlocphy=9055236&hvnetw=g&hvqmt=e&hvrand=2006610549980071308&hvtargid=kwd-362955329701&hydadcr=14225_1831950&keywords=cadeau+cr%C3%A9maill%C3%A8re+couple&qid=1637163837&sr=8-9','https://m.media-amazon.com/images/I/91Ek6DdFIwL._AC_SL1500_.jpg','Planche à fromage multifonctions',62,1,4),(29,'Tabliers','https://www.amazon.fr/Tabliers-R%C3%A9Glable-Imperm%C3%A9Able-Anniversaire-DAnniversaire/dp/B092CGVHNN/ref=sr_1_18?adgrpid=61728208688&gclid=CjwKCAiA7dKMBhBCEiwAO_crFIUB_xwEwtOKkCccwAetACBgsK06OpDppOFVwAkD9owrcG5WJur3XRoCGokQAvD_BwE&hvadid=275538738917&hvdev=c&hvlocphy=9055236&hvnetw=g&hvqmt=e&hvrand=2006610549980071308&hvtargid=kwd-362955329701&hydadcr=14225_1831950&keywords=cadeau+cr%C3%A9maill%C3%A8re+couple&qid=1637163837&sr=8-18','https://m.media-amazon.com/images/I/51LruQFkcBS._AC_SL1500_.jpg','J\'aime cuisiner!',14,0,4),(30,'Verres à vin','https://www.amazon.fr/Collezione-DIVINO-BORMIOLI-ROCCO-%C3%89l%C3%A9gance/dp/B08NZXM8NG/ref=sr_1_7?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=3HOGJI56ZH7LB&keywords=lot%2Bverre%2Ba%2Bvin&qid=1637164448&sprefix=lot%2Bverre%2Caps%2C188&sr=8-7&th=1','https://m.media-amazon.com/images/I/61vtRTG+F0L._AC_SL1200_.jpg','Lors des repas, un petit verre ne fait jamais de mal',48,0,4),(31,'Lit 180x200','https://www.amazon.fr/Baldaquin-Design-Solide-Double-M%C3%A9talliques/dp/B08XQQDX6Y/ref=sr_1_6?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=305ALR2O3VZHL&keywords=lit+fer+forg%C3%A9+180x200&qid=1637164805&sprefix=lit+fer+forg%C3%A9+180%2Caps%2C213&sr=8-6','https://m.media-amazon.com/images/I/71Yry-H0WCL._AC_SL1500_.jpg','Vive les lits en fer forgé',243,0,4),(32,'Vidéoprojecteur','https://www.amazon.fr/BenQ-TK810-Projecteur-Cinema-3840x2160/dp/B084X9JXQY/ref=sr_1_4?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=398M6VTOXGV1W&keywords=videoprojecteur+4k&qid=1637165263&refinements=p_36%3A680948011&rnid=389179011&s=electronics&sprefix=videoprojec%2Caps%2C177&sr=1-4','https://m.media-amazon.com/images/I/513Pcmvr07L._AC_SL1000_.jpg','Pour aller avec mon nouveau salon',1198,0,4),(33,'Pull de Noel','https://www.amazon.fr/dp/B07Z3HSGMY/ref=cm_gf_aabd_iaaa_d_p0_e0_qd0_auTXGOqrleT3s5vSB4WD','https://m.media-amazon.com/images/I/71-3qsQ7peL._AC_UX385_.jpg','C\'est original',24,0,4),(34,'Cuisinière','https://www.amazon.fr/CONTINENTAL-Cuisiniere-Catalyse-Affichage-Digital/dp/B07V26N7CF/ref=sr_1_38?keywords=cuisiniere&qid=1637166162&refinements=p_36%3A1385142031&rnid=1385134031&s=appliances&sr=1-38','https://m.media-amazon.com/images/I/41hhHVTPRdL._AC_.jpg','J\'adorerai cuisiner avec ça!',612,1,4);
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
INSERT INTO `list` VALUES (1,'29 ans Nicolas',90825,'Salut, j\'ai bientôt 30 ans, donc offrez-moi des cadeaux, j\'ai besoin de me changer les idées.','2022-07-20','2021-10-29',1,2),(2,'Daniel & Barber',90826,'Hey! Faites-vous plaisir en m\'offrant des cadeau pour le plus beau jour de l\'année. Vous pourrez participer au meilleur évènement de tous les temps','2022-03-21','2021-11-10',1,1),(3,'Mini Giovanny',90827,'Bonjour, je vais bientôt devenir papa, donc offrez moi des cadeaux pour combattre ma déprime','2021-12-29','2021-11-10',1,5),(4,'Aménagement Loic',214102,' Je déménage bientôt, de ce fait je jette toutes mes affaires pour repartir à zéro. Donc, faites vous plaisir et offrez moi des choses dont j\'ai besoin.','2022-05-03','2021-11-17',1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Exploratrice','Dora','doralexploratrice@gmail.com','$2y$10$qQ7LdZLP5bYf.SrbGxvYEOyBplTKeEL5JruuqndCQZXbFqhvfQFrC','1990-02-28','a0jsve282bcvro9nu497bb3eea');
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

-- Dump completed on 2021-11-18 14:51:30
