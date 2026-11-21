-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: loyalty_tracker
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `campaign_master`
--

DROP TABLE IF EXISTS `campaign_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_master` (
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(30) NOT NULL,
  PRIMARY KEY (`campaign_id`),
  UNIQUE KEY `campaign_name` (`campaign_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_master`
--

LOCK TABLES `campaign_master` WRITE;
/*!40000 ALTER TABLE `campaign_master` DISABLE KEYS */;
INSERT INTO `campaign_master` VALUES (1,'Campaign 1'),(2,'Campaign 2'),(3,'Campaign 3'),(4,'Campaign 4'),(5,'Campaign 5'),(6,'Latest Campaign');
/*!40000 ALTER TABLE `campaign_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_response`
--

DROP TABLE IF EXISTS `campaign_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_response` (
  `response_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `campaign_id` int NOT NULL,
  PRIMARY KEY (`response_id`),
  KEY `customer_id` (`customer_id`),
  KEY `campaign_id` (`campaign_id`),
  CONSTRAINT `campaign_response_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_master` (`customer_id`),
  CONSTRAINT `campaign_response_ibfk_2` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_master` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_response`
--

LOCK TABLES `campaign_response` WRITE;
/*!40000 ALTER TABLE `campaign_response` DISABLE KEYS */;
INSERT INTO `campaign_response` VALUES (1,232,3),(2,280,1),(3,280,2),(4,287,1),(5,297,5),(6,297,6),(7,400,6),(8,698,6),(9,783,6),(10,859,6),(11,949,5),(12,949,6),(13,1106,1),(14,1106,2),(15,1106,4),(16,1106,6),(17,1201,5),(18,1353,5),(19,1353,6),(20,1579,6),(21,1674,1),(22,1674,4),(23,1729,6),(24,1745,4),(25,2075,3),(26,2075,5),(27,2105,1),(28,2105,2),(29,2182,2),(30,2182,6),(31,2188,6);
/*!40000 ALTER TABLE `campaign_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_activity`
--

DROP TABLE IF EXISTS `customer_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_activity` (
  `activity_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `recency_days` int NOT NULL,
  `deals_purchases` int DEFAULT '0',
  `web_purchases` int DEFAULT '0',
  `catalog_purchases` int DEFAULT '0',
  `store_purchases` int DEFAULT '0',
  `web_visits_month` int DEFAULT '0',
  PRIMARY KEY (`activity_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_activity_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_master` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_activity`
--

LOCK TABLES `customer_activity` WRITE;
/*!40000 ALTER TABLE `customer_activity` DISABLE KEYS */;
INSERT INTO `customer_activity` VALUES (1,232,72,3,4,7,2,5),(2,280,43,1,4,1,4,7),(3,287,19,3,2,1,4,11),(4,297,19,2,5,4,6,2),(5,340,35,2,3,4,7,3),(6,400,81,1,4,2,4,7),(7,440,3,8,4,6,7,8),(8,648,35,2,4,4,2,5),(9,698,93,2,3,4,4,4),(10,783,87,3,0,5,3,8),(11,859,93,3,2,3,5,2),(12,949,94,2,4,1,6,5),(13,975,88,9,6,1,2,5),(14,1106,19,4,8,4,4,5),(15,1107,86,1,5,3,5,8),(16,1110,57,2,4,5,5,6),(17,1201,38,4,8,4,8,6),(18,1313,59,1,0,4,2,5),(19,1353,68,3,1,1,8,4),(20,1430,98,2,2,4,4,7),(21,1579,14,6,3,2,4,5),(22,1674,67,5,3,2,5,4),(23,1729,75,1,5,3,10,7),(24,1745,60,3,5,2,5,5),(25,1879,65,3,4,3,7,7),(26,2062,60,3,3,3,8,5),(27,2075,19,1,4,2,6,3),(28,2105,7,1,5,5,1,8),(29,2182,11,1,6,4,7,7),(30,2188,74,2,8,3,5,7);
/*!40000 ALTER TABLE `customer_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_master`
--

DROP TABLE IF EXISTS `customer_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_master` (
  `customer_id` int NOT NULL,
  `year_birth` int NOT NULL,
  `education` varchar(20) NOT NULL,
  `marital_status` varchar(20) NOT NULL,
  `income` int NOT NULL,
  `kids_home` int DEFAULT '0',
  `teens_home` int DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_master`
--

LOCK TABLES `customer_master` WRITE;
/*!40000 ALTER TABLE `customer_master` DISABLE KEYS */;
INSERT INTO `customer_master` VALUES (232,1965,'Graduation','Together',61096,0,0),(280,1959,'Graduation','Single',59574,1,0),(287,1996,'Master','Together',108323,1,1),(297,1963,'Graduation','Together',77162,0,0),(340,1973,'Basic','Married',75136,1,0),(400,1977,'Master','Single',89235,0,1),(440,1977,'2n Cycle','Together',37962,1,1),(648,1973,'2n Cycle','Single',76402,0,0),(698,1958,'PhD','Married',66757,1,2),(783,1976,'Master','Single',90849,0,0),(859,1995,'Graduation','Widow',39839,0,1),(949,1961,'Graduation','Married',22526,1,0),(975,1959,'Graduation','Married',68357,0,1),(1106,1997,'Master','Divorced',59204,0,0),(1107,1969,'Graduation','Together',45174,0,1),(1110,1976,'PhD','Widow',93447,0,0),(1201,1957,'PhD','Together',93080,0,0),(1313,1946,'PhD','Married',61094,0,1),(1353,1961,'Graduation','Divorced',9819,0,0),(1430,1984,'Graduation','Divorced',25564,0,1),(1579,1973,'PhD','Together',41233,2,0),(1674,1971,'Graduation','Together',62868,1,0),(1729,1981,'Graduation','Single',68721,1,0),(1745,1966,'Graduation','Married',33321,0,1),(1879,1955,'Graduation','Together',52856,1,0),(2062,1946,'Graduation','Together',13357,0,1),(2075,1949,'Graduation','Single',65225,0,0),(2105,1966,'Graduation','Together',49571,0,1),(2182,1975,'Graduation','Together',76169,0,0),(2188,1970,'Master','Together',59494,1,2);
/*!40000 ALTER TABLE `customer_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_spending`
--

DROP TABLE IF EXISTS `customer_spending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_spending` (
  `spending_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `category_id` int NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`spending_id`),
  KEY `customer_id` (`customer_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `customer_spending_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_master` (`customer_id`),
  CONSTRAINT `customer_spending_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_category_master` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_spending`
--

LOCK TABLES `customer_spending` WRITE;
/*!40000 ALTER TABLE `customer_spending` DISABLE KEYS */;
INSERT INTO `customer_spending` VALUES (1,232,1,347),(2,232,2,24),(3,232,3,213),(4,232,4,77),(5,232,5,0),(6,232,6,88),(7,280,1,342),(8,280,2,10),(9,280,3,351),(10,280,4,84),(11,280,5,30),(12,280,6,132),(13,287,1,369),(14,287,2,22),(15,287,3,257),(16,287,4,98),(17,287,5,38),(18,287,6,200),(19,297,1,300),(20,297,2,8),(21,297,3,238),(22,297,4,57),(23,297,5,0),(24,297,6,112),(25,340,1,250),(26,340,2,8),(27,340,3,139),(28,340,4,83),(29,340,5,17),(30,340,6,110),(31,400,1,557),(32,400,2,36),(33,400,3,328),(34,400,4,104),(35,400,5,62),(36,400,6,174),(37,440,1,721),(38,440,2,70),(39,440,3,546),(40,440,4,151),(41,440,5,94),(42,440,6,222),(43,648,1,329),(44,648,2,48),(45,648,3,289),(46,648,4,72),(47,648,5,35),(48,648,6,92),(49,698,1,382),(50,698,2,57),(51,698,3,306),(52,698,4,72),(53,698,5,37),(54,698,6,177),(55,783,1,233),(56,783,2,68),(57,783,3,201),(58,783,4,78),(59,783,5,39),(60,783,6,113),(61,859,1,193),(62,859,2,0),(63,859,3,119),(64,859,4,37),(65,859,5,39),(66,859,6,0),(67,949,1,43),(68,949,2,0),(69,949,3,32),(70,949,4,19),(71,949,5,0),(72,949,6,4),(73,975,1,269),(74,975,2,31),(75,975,3,251),(76,975,4,82),(77,975,5,26),(78,975,6,75),(79,1106,1,272),(80,1106,2,34),(81,1106,3,312),(82,1106,4,39),(83,1106,5,17),(84,1106,6,48),(85,1107,1,161),(86,1107,2,0),(87,1107,3,115),(88,1107,4,0),(89,1107,5,39),(90,1107,6,128),(91,1110,1,535),(92,1110,2,70),(93,1110,3,407),(94,1110,4,83),(95,1110,5,51),(96,1110,6,119),(97,1201,1,402),(98,1201,2,0),(99,1201,3,186),(100,1201,4,61),(101,1201,5,70),(102,1201,6,174),(103,1313,1,547),(104,1313,2,38),(105,1313,3,392),(106,1313,4,124),(107,1313,5,27),(108,1313,6,115),(109,1353,1,334),(110,1353,2,24),(111,1353,3,195),(112,1353,4,59),(113,1353,5,47),(114,1353,6,40),(115,1430,1,126),(116,1430,2,17),(117,1430,3,36),(118,1430,4,28),(119,1430,5,18),(120,1430,6,47),(121,1579,1,113),(122,1579,2,38),(123,1579,3,59),(124,1579,4,21),(125,1579,5,17),(126,1579,6,158),(127,1674,1,362),(128,1674,2,7),(129,1674,3,280),(130,1674,4,93),(131,1674,5,24),(132,1674,6,112),(133,1729,1,361),(134,1729,2,54),(135,1729,3,234),(136,1729,4,74),(137,1729,5,0),(138,1729,6,59),(139,1745,1,82),(140,1745,2,0),(141,1745,3,14),(142,1745,4,33),(143,1745,5,57),(144,1745,6,3),(145,1879,1,586),(146,1879,2,37),(147,1879,3,333),(148,1879,4,48),(149,1879,5,37),(150,1879,6,173),(151,2062,1,14),(152,2062,2,0),(153,2062,3,0),(154,2062,4,0),(155,2062,5,0),(156,2062,6,14),(157,2075,1,318),(158,2075,2,34),(159,2075,3,275),(160,2075,4,12),(161,2075,5,0),(162,2075,6,142),(163,2105,1,272),(164,2105,2,35),(165,2105,3,117),(166,2105,4,73),(167,2105,5,2),(168,2105,6,98),(169,2182,1,449),(170,2182,2,29),(171,2182,3,222),(172,2182,4,102),(173,2182,5,41),(174,2182,6,132),(175,2188,1,76),(176,2188,2,0),(177,2188,3,193),(178,2188,4,71),(179,2188,5,44),(180,2188,6,45);
/*!40000 ALTER TABLE `customer_spending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_summary`
--

DROP TABLE IF EXISTS `customer_summary`;
/*!50001 DROP VIEW IF EXISTS `customer_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_summary` AS SELECT 
 1 AS `customer_id`,
 1 AS `education`,
 1 AS `income`,
 1 AS `recency_days`,
 1 AS `frequency`,
 1 AS `monetary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product_category_master`
--

DROP TABLE IF EXISTS `product_category_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_master` (
  `category_id` int NOT NULL,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_master`
--

LOCK TABLES `product_category_master` WRITE;
/*!40000 ALTER TABLE `product_category_master` DISABLE KEYS */;
INSERT INTO `product_category_master` VALUES (4,'Fish Products'),(2,'Fruits'),(6,'Gold Products'),(3,'Meat Products'),(5,'Sweet Products'),(1,'Wines');
/*!40000 ALTER TABLE `product_category_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_summary`
--

/*!50001 DROP VIEW IF EXISTS `customer_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_summary` AS select `c`.`customer_id` AS `customer_id`,`c`.`education` AS `education`,`c`.`income` AS `income`,`a`.`recency_days` AS `recency_days`,(((`a`.`deals_purchases` + `a`.`web_purchases`) + `a`.`catalog_purchases`) + `a`.`store_purchases`) AS `frequency`,(select sum(`s`.`amount`) from `customer_spending` `s` where (`s`.`customer_id` = `c`.`customer_id`)) AS `monetary` from (`customer_master` `c` join `customer_activity` `a` on((`c`.`customer_id` = `a`.`customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-21 11:35:37
