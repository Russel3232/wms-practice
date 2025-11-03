-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: wms-silgan-uat
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adjustment_reason`
--

DROP TABLE IF EXISTS `adjustment_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustment_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(80) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `adjustment_reason_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `adjustment_reason_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustment_reason`
--

LOCK TABLES `adjustment_reason` WRITE;
/*!40000 ALTER TABLE `adjustment_reason` DISABLE KEYS */;
INSERT INTO `adjustment_reason` VALUES (1,'Change Lot Number','2019-12-02 02:50:34',1,NULL,NULL,1),(2,'Change Expiry','2019-12-02 02:50:45',1,'2019-12-02 02:50:56',1,1),(3,'Wrong Quantity','2019-12-02 03:50:49',1,NULL,NULL,1),(4,'Wrong Kilos','2021-04-19 14:26:46',1,NULL,NULL,1);
/*!40000 ALTER TABLE `adjustment_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `area_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcode_mapping`
--

DROP TABLE IF EXISTS `barcode_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barcode_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) DEFAULT NULL,
  `item_code` int(11) DEFAULT NULL,
  `item_name` int(11) DEFAULT NULL,
  `lot_number` int(11) DEFAULT NULL,
  `expiry_date` int(11) DEFAULT NULL,
  `mfg_date` int(11) DEFAULT NULL,
  `uom_code` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `pallet_number` int(11) DEFAULT NULL,
  `box_number` int(11) DEFAULT NULL,
  `delimiter` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcode_mapping`
--

LOCK TABLES `barcode_mapping` WRITE;
/*!40000 ALTER TABLE `barcode_mapping` DISABLE KEYS */;
INSERT INTO `barcode_mapping` VALUES (2,'DEFAULT',0,1,2,3,4,5,6,7,NULL,8,'|');
/*!40000 ALTER TABLE `barcode_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bin_location`
--

DROP TABLE IF EXISTS `bin_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) NOT NULL,
  `description` varchar(128) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `weight_capacity` double NOT NULL DEFAULT '0',
  `cbm_capacity` double NOT NULL DEFAULT '0',
  `capacity` double NOT NULL DEFAULT '0',
  `on_hold_flag` tinyint(1) NOT NULL DEFAULT '0',
  `disposition` varchar(128) DEFAULT NULL,
  `suggestion_flag` tinyint(1) NOT NULL DEFAULT '0',
  `location_index` double DEFAULT NULL,
  `all_items_flag` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) NOT NULL DEFAULT '1',
  `staging_flag` tinyint(1) DEFAULT '0',
  `pallet_slot` int(11) DEFAULT '1',
  `pick_phase_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `bin_location_ibfk_2` (`zone_id`),
  KEY `bin_location_ibfk_3` (`created_by`),
  KEY `bin_location_ibfk_4` (`updated_by`),
  CONSTRAINT `bin_location_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bin_location_ibfk_2` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bin_location_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bin_location_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin_location`
--

LOCK TABLES `bin_location` WRITE;
/*!40000 ALTER TABLE `bin_location` DISABLE KEYS */;
INSERT INTO `bin_location` VALUES (1,'PRODUCTION','PRODUCTION',48,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,'2023-12-14 16:50:02',1,1,1,NULL,0),(2,'PRODUCTION N/U','NON-USABLE',48,NULL,0,0,0,1,'BAD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(3,'LITHO','LITHO',49,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(4,'LITHO N/U','NON-USABLE',49,NULL,0,0,0,1,'BAD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(5,'LITHO INK','LITHO INK',49,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(6,'ROWELL','ROWELL',50,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,'2023-12-14 14:02:16',1,1,1,NULL,0),(7,'OTC','OTC',51,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(8,'BCC','BCC',52,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(9,'WHSE-LB','LOADING BAY',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(10,'WHSE-LB F/E','WHSE-LB FOR EVALUATION',53,NULL,0,0,0,0,'FOR  EVALUATION',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(11,'WHSE-PM','PACKAGING MATERIALS',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(12,'WHSE-CTG','COATINGS',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(13,'WHSE-CTG N/U','NON-USABLE COATINGS',53,NULL,0,0,0,1,'BAD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(14,'WHSE-CPD','COMPOUND',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(15,'WHSE-CPD N/U','NON-USABLE COMPOUND',53,NULL,0,0,0,1,'BAD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(16,'TNP LINE 1','TNP LINE 1',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(17,'TNP LINE 2','TNP LINE 2',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(18,'TNP LINE 3','TNP LINE 3',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(19,'TNP LINE 4','TNP LINE 4',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(20,'TNP LINE 5','TNP LINE 5',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(21,'TNP LINE 6','TNP LINE 6',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(22,'TNP LINE 7','TNP LINE 7',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(23,'TNP LINE 8','TNP LINE 8',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(24,'TNP LINE 9','TNP LINE 9',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(25,'TNP LINE 10','TNP LINE 10',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(26,'TNP LINE 11','TNP LINE 11',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(27,'TNP LINE 12','TNP LINE 12',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(28,'TNP LINE 13','TNP LINE 13',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(29,'TNP LINE 14','TNP LINE 14',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(30,'TNP LINE 15','TNP LINE 15',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(31,'TNP LINE 16','TNP LINE 16',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(32,'TNP LINE 17','TNP LINE 17',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(33,'TNP LINE 18','TNP LINE 18',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(34,'TNP LINE 19','TNP LINE 19',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(35,'TNP LINE 20','TNP LINE 20',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(36,'TNP LINE 21','TNP LINE 21',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(37,'TNP LINE 22','TNP LINE 22',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(38,'TNP LINE 23','TNP LINE 23',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(39,'TNP LINE 24','TNP LINE 24',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(40,'TNP LINE 25','TNP LINE 25',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(41,'TNP LINE 26','TNP LINE 26',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(42,'TNP LINE 27','TNP LINE 27',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(43,'TNP LINE 28','TNP LINE 28',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(44,'TNP LINE 29','TNP LINE 29',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(45,'TNP LINE 30','TNP LINE 30',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(46,'TNP LINE 31','TNP LINE 31',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(47,'TNP LINE 32','TNP LINE 32',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(48,'TNP LINE 33','TNP LINE 33',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(49,'TNP LINE 34','TNP LINE 34',53,NULL,0,0,0,0,'GOOD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1),(50,'TNP  N/U','NON-USABLE RAW TINPLATES',53,NULL,0,0,0,1,'BAD STOCKS',1,NULL,1,'2023-11-13 08:49:00',NULL,NULL,NULL,1,0,999999,1);
/*!40000 ALTER TABLE `bin_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bin_location_item`
--

DROP TABLE IF EXISTS `bin_location_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin_location_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `bin_location_item_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bin_location_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bin_location_item_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin_location_item`
--

LOCK TABLES `bin_location_item` WRITE;
/*!40000 ALTER TABLE `bin_location_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `bin_location_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bin_transfer`
--

DROP TABLE IF EXISTS `bin_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `location_from_id` int(11) NOT NULL,
  `location_to_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `pallet_number_from` varchar(80) DEFAULT NULL,
  `pallet_number_to` varchar(80) DEFAULT NULL,
  `pallet_from` varchar(80) DEFAULT NULL,
  `pallet_to` varchar(80) DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `box_number` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `location_from_id` (`location_from_id`),
  KEY `location_to_id` (`location_to_id`),
  KEY `created_by` (`created_by`),
  KEY `pallet_number_from` (`pallet_number_from`),
  KEY `pallet_number_to` (`pallet_number_to`),
  KEY `pallet_from` (`pallet_from`),
  KEY `pallet_to` (`pallet_to`),
  KEY `for_client_id` (`for_client_id`),
  CONSTRAINT `bin_transfer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bin_transfer_ibfk_10` FOREIGN KEY (`for_client_id`) REFERENCES `for_client` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bin_transfer_ibfk_2` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bin_transfer_ibfk_3` FOREIGN KEY (`location_from_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bin_transfer_ibfk_4` FOREIGN KEY (`location_to_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bin_transfer_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bin_transfer_ibfk_6` FOREIGN KEY (`pallet_number_from`) REFERENCES `pallet` (`pallet_number`) ON UPDATE CASCADE,
  CONSTRAINT `bin_transfer_ibfk_7` FOREIGN KEY (`pallet_number_to`) REFERENCES `pallet` (`pallet_number`) ON UPDATE CASCADE,
  CONSTRAINT `bin_transfer_ibfk_8` FOREIGN KEY (`pallet_from`) REFERENCES `pallet` (`pallet_number`) ON UPDATE CASCADE,
  CONSTRAINT `bin_transfer_ibfk_9` FOREIGN KEY (`pallet_to`) REFERENCES `pallet` (`pallet_number`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin_transfer`
--

LOCK TABLES `bin_transfer` WRITE;
/*!40000 ALTER TABLE `bin_transfer` DISABLE KEYS */;
INSERT INTO `bin_transfer` VALUES (1,9,'240108',NULL,3,25,25,20,37,'2024-01-09 01:02:47',1,NULL,NULL,NULL,NULL,NULL,NULL,0,'000000000008');
/*!40000 ALTER TABLE `bin_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `brand_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `percentage` double DEFAULT '0',
  `department` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `category_ibfk_3_idx` (`department`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `category_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `category_ibfk_3` FOREIGN KEY (`department`) REFERENCES `category_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_department`
--

DROP TABLE IF EXISTS `category_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `description` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_department`
--

LOCK TABLES `category_department` WRITE;
/*!40000 ALTER TABLE `category_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_adjustment_history`
--

DROP TABLE IF EXISTS `cd_adjustment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_adjustment_history` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(45) NOT NULL,
  `cd_purchase_order_header_id` int(11) DEFAULT NULL,
  `cd_trf_header_id` int(11) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'LOGGED',
  `adjustment_reason` tinytext,
  `item_id` int(11) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `previous_quantity` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `previous_base_quantity` double DEFAULT NULL,
  `base_quantity` double DEFAULT NULL,
  `remarks` text,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voided_by` int(11) DEFAULT NULL,
  `voided_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cd_adj_po_id_idx` (`cd_purchase_order_header_id`),
  KEY `cd_adj_trf_id_idx` (`cd_trf_header_id`),
  KEY `cd_adj_item_id_idx` (`item_id`),
  KEY `cd_adj_uom_id_idx` (`uom_id`),
  CONSTRAINT `cd_adj_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cd_adj_po_id` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cd_adj_trf_id` FOREIGN KEY (`cd_trf_header_id`) REFERENCES `cd_trf_header` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cd_adj_uom_id` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_adjustment_history`
--

LOCK TABLES `cd_adjustment_history` WRITE;
/*!40000 ALTER TABLE `cd_adjustment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_adjustment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_inventory_details`
--

DROP TABLE IF EXISTS `cd_inventory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_inventory_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `cd_receiving_header_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `invoice_number` varchar(45) NOT NULL,
  `production_date` date DEFAULT NULL,
  `pallet_number` varchar(45) DEFAULT NULL,
  `base_quantity` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `cd_receiving_header_id` (`cd_receiving_header_id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `cd_inventory_details_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_inventory_details_ibfk_2` FOREIGN KEY (`cd_receiving_header_id`) REFERENCES `cd_receiving_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_inventory_details_ibfk_3` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_inventory_details_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_inventory_details_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_inventory_details`
--

LOCK TABLES `cd_inventory_details` WRITE;
/*!40000 ALTER TABLE `cd_inventory_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_inventory_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_load_plan_details`
--

DROP TABLE IF EXISTS `cd_load_plan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_load_plan_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_load_plan_header_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `cd_picklist_header_id` int(11) DEFAULT NULL,
  `cd_trf_header_id` int(11) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `cd_receiving_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `invoice_number` varchar(45) NOT NULL,
  `production_date` date DEFAULT NULL,
  `pallet_number` varchar(45) DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `cd_load_plan_header_id` (`cd_load_plan_header_id`),
  KEY `cd_trf_header_id` (`cd_trf_header_id`),
  KEY `cd_receiving_header_id` (`cd_receiving_header_id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `cd_picklist_header_id` (`cd_picklist_header_id`),
  KEY `uom_id` (`uom_id`),
  CONSTRAINT `cd_load_plan_details_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_details_ibfk_10` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_details_ibfk_2` FOREIGN KEY (`cd_load_plan_header_id`) REFERENCES `cd_load_plan_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_details_ibfk_3` FOREIGN KEY (`cd_picklist_header_id`) REFERENCES `cd_picklist_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_details_ibfk_4` FOREIGN KEY (`cd_trf_header_id`) REFERENCES `cd_trf_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_details_ibfk_5` FOREIGN KEY (`cd_receiving_header_id`) REFERENCES `cd_receiving_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_details_ibfk_6` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_details_ibfk_7` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_details_ibfk_8` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_details_ibfk_9` FOREIGN KEY (`cd_picklist_header_id`) REFERENCES `cd_picklist_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_load_plan_details`
--

LOCK TABLES `cd_load_plan_details` WRITE;
/*!40000 ALTER TABLE `cd_load_plan_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_load_plan_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_load_plan_header`
--

DROP TABLE IF EXISTS `cd_load_plan_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_load_plan_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `document_date` date DEFAULT NULL,
  `status` varchar(80) NOT NULL DEFAULT 'LOGGED',
  `warehouse_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `dr_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `store_id` (`store_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `cancelled_by` (`cancelled_by`),
  CONSTRAINT `cd_load_plan_header_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_header_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_header_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_header_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_header_ibfk_5` FOREIGN KEY (`posted_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_header_ibfk_6` FOREIGN KEY (`cancelled_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_load_plan_header`
--

LOCK TABLES `cd_load_plan_header` WRITE;
/*!40000 ALTER TABLE `cd_load_plan_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_load_plan_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_load_plan_transaction`
--

DROP TABLE IF EXISTS `cd_load_plan_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_load_plan_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_load_plan_header_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `cd_trf_header_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cd_load_plan_header_id` (`cd_load_plan_header_id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `cd_trf_header_id` (`cd_trf_header_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `cd_load_plan_transaction_ibfk_1` FOREIGN KEY (`cd_load_plan_header_id`) REFERENCES `cd_load_plan_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_transaction_ibfk_2` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_transaction_ibfk_3` FOREIGN KEY (`cd_trf_header_id`) REFERENCES `cd_trf_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_load_plan_transaction_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_load_plan_transaction`
--

LOCK TABLES `cd_load_plan_transaction` WRITE;
/*!40000 ALTER TABLE `cd_load_plan_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_load_plan_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_picking_details`
--

DROP TABLE IF EXISTS `cd_picking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_picking_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `cd_picklist_header_id` int(11) DEFAULT NULL,
  `cd_trf_header_id` int(11) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `cd_receiving_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `invoice_number` varchar(45) NOT NULL,
  `production_date` date DEFAULT NULL,
  `pallet_number` varchar(45) DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `ldp_base_quantity` double NOT NULL DEFAULT '0',
  `ldp_quantity` double NOT NULL DEFAULT '0',
  `cd_load_plan_header_id` int(11) DEFAULT NULL,
  `base_shipped_quantity` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `cd_trf_header_id` (`cd_trf_header_id`),
  KEY `cd_receiving_header_id` (`cd_receiving_header_id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `cd_picklist_header_id` (`cd_picklist_header_id`),
  KEY `uom_id` (`uom_id`),
  CONSTRAINT `cd_picking_details_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picking_details_ibfk_2` FOREIGN KEY (`cd_picklist_header_id`) REFERENCES `cd_picklist_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picking_details_ibfk_3` FOREIGN KEY (`cd_trf_header_id`) REFERENCES `cd_trf_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picking_details_ibfk_4` FOREIGN KEY (`cd_receiving_header_id`) REFERENCES `cd_receiving_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picking_details_ibfk_5` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picking_details_ibfk_6` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picking_details_ibfk_7` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picking_details_ibfk_8` FOREIGN KEY (`cd_picklist_header_id`) REFERENCES `cd_picklist_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cd_picking_details_ibfk_9` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_picking_details`
--

LOCK TABLES `cd_picking_details` WRITE;
/*!40000 ALTER TABLE `cd_picking_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_picking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_picklist_details`
--

DROP TABLE IF EXISTS `cd_picklist_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_picklist_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_picklist_header_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `cd_receiving_header_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `invoice_number` varchar(45) NOT NULL,
  `production_date` date DEFAULT NULL,
  `pallet_number` varchar(45) DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `transferred_to_location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `cd_receiving_header_id` (`cd_receiving_header_id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `cd_picklist_header_id` (`cd_picklist_header_id`),
  KEY `uom_id` (`uom_id`),
  KEY `transferred_to_location_id` (`transferred_to_location_id`),
  CONSTRAINT `cd_picklist_details_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_details_ibfk_2` FOREIGN KEY (`cd_receiving_header_id`) REFERENCES `cd_receiving_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_details_ibfk_3` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_details_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_details_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_details_ibfk_6` FOREIGN KEY (`cd_picklist_header_id`) REFERENCES `cd_picklist_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_details_ibfk_7` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_details_ibfk_8` FOREIGN KEY (`transferred_to_location_id`) REFERENCES `bin_location` (`id`),
  CONSTRAINT `cd_picklist_details_ibfk_9` FOREIGN KEY (`transferred_to_location_id`) REFERENCES `bin_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_picklist_details`
--

LOCK TABLES `cd_picklist_details` WRITE;
/*!40000 ALTER TABLE `cd_picklist_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_picklist_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_picklist_header`
--

DROP TABLE IF EXISTS `cd_picklist_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_picklist_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `cd_trf_header_id` int(11) DEFAULT NULL,
  `document_date` date DEFAULT NULL,
  `status` varchar(80) NOT NULL DEFAULT 'LOGGED',
  `remarks` text,
  `user_defined_field1` varchar(200) DEFAULT NULL,
  `user_defined_field2` varchar(200) DEFAULT NULL,
  `user_defined_field3` varchar(200) DEFAULT NULL,
  `user_defined_field4` varchar(200) DEFAULT NULL,
  `user_defined_field5` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `cd_purchase_order_header_id` int(11) DEFAULT NULL,
  `source_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `cd_trf_header_id` (`cd_trf_header_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `cancelled_by` (`cancelled_by`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  CONSTRAINT `cd_picklist_header_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_header_ibfk_2` FOREIGN KEY (`cd_trf_header_id`) REFERENCES `cd_trf_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_header_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_header_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_header_ibfk_5` FOREIGN KEY (`posted_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_header_ibfk_6` FOREIGN KEY (`cancelled_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_header_ibfk_7` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_picklist_header_ibfk_8` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_picklist_header`
--

LOCK TABLES `cd_picklist_header` WRITE;
/*!40000 ALTER TABLE `cd_picklist_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_picklist_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_pod_status`
--

DROP TABLE IF EXISTS `cd_pod_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_pod_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) NOT NULL,
  `description` varchar(80) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_pod_status`
--

LOCK TABLES `cd_pod_status` WRITE;
/*!40000 ALTER TABLE `cd_pod_status` DISABLE KEYS */;
INSERT INTO `cd_pod_status` VALUES (1,'COMPLETELY DELIVERED','COMPLETELY DELIVERED','2021-03-25 06:35:29'),(2,'PARTIALLY DELIVERED','PARTIALLY DELIVERED','2021-03-25 06:35:29'),(3,'FULL REJECTION','FULL REJECTION','2021-03-25 06:35:29');
/*!40000 ALTER TABLE `cd_pod_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_purchase_order_details`
--

DROP TABLE IF EXISTS `cd_purchase_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_purchase_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `child_po_number` varchar(80) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `base_quantity` double DEFAULT NULL,
  `unit_price` double DEFAULT '0',
  `amount` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `remarks` text,
  `base_quantity_received` double DEFAULT '0',
  `base_quantity_picked` double DEFAULT '0',
  `base_quantity_dispatched` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `cd_purchase_order_details_ibfk_1` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cd_purchase_order_details_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_purchase_order_details_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_purchase_order_details_ibfk_4` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_purchase_order_details_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_purchase_order_details_ibfk_6` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_purchase_order_details`
--

LOCK TABLES `cd_purchase_order_details` WRITE;
/*!40000 ALTER TABLE `cd_purchase_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_purchase_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_purchase_order_header`
--

DROP TABLE IF EXISTS `cd_purchase_order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_purchase_order_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(80) DEFAULT 'LOGGED',
  `supplier_id` int(11) NOT NULL,
  `document_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `remarks` text,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `supplier_street_address` varchar(200) DEFAULT NULL,
  `supplier_district_address` varchar(80) DEFAULT NULL,
  `supplier_city_address` varchar(80) DEFAULT NULL,
  `supplier_region_address` varchar(80) DEFAULT NULL,
  `supplier_zip_code_address` varchar(45) DEFAULT NULL,
  `supplier_country_address` varchar(80) DEFAULT NULL,
  `supplier_contact_person` varchar(80) DEFAULT NULL,
  `supplier_contact_number` varchar(80) DEFAULT NULL,
  `ship_to_street_address` varchar(200) DEFAULT NULL,
  `ship_to_district_address` varchar(80) DEFAULT NULL,
  `ship_to_city_address` varchar(80) DEFAULT NULL,
  `ship_to_region_address` varchar(80) DEFAULT NULL,
  `ship_to_zip_code_address` varchar(45) DEFAULT NULL,
  `ship_to_country_address` varchar(80) DEFAULT NULL,
  `ship_to_contact_person` varchar(80) DEFAULT NULL,
  `ship_to_contact_number` varchar(80) DEFAULT NULL,
  `document_expiry_date` date DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `with_rcv_flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `supplier_id` (`supplier_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `cancelled_by` (`cancelled_by`),
  CONSTRAINT `cd_purchase_order_header_ibfk_1` FOREIGN KEY (`cancelled_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cd_purchase_order_header_ibfk_2` FOREIGN KEY (`cancelled_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cd_purchase_order_header_ibfkcd_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_purchase_order_header_ibfkcd_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_purchase_order_header_ibfkcd_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_purchase_order_header_ibfkcd_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_purchase_order_header`
--

LOCK TABLES `cd_purchase_order_header` WRITE;
/*!40000 ALTER TABLE `cd_purchase_order_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_purchase_order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_purchase_order_type`
--

DROP TABLE IF EXISTS `cd_purchase_order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_purchase_order_type` (
  `code` varchar(45) NOT NULL,
  `description` varchar(80) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_purchase_order_type`
--

LOCK TABLES `cd_purchase_order_type` WRITE;
/*!40000 ALTER TABLE `cd_purchase_order_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_purchase_order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_receiving_details`
--

DROP TABLE IF EXISTS `cd_receiving_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_receiving_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_receiving_header_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `base_quantity` double DEFAULT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `invoice_number` varchar(45) DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `pallet_number` varchar(45) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `on_hold_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cd_receiving_header_id` (`cd_receiving_header_id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `cd_receiving_details_ibfk_1` FOREIGN KEY (`cd_receiving_header_id`) REFERENCES `cd_receiving_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cd_receiving_details_ibfk_2` FOREIGN KEY (`cd_purchase_order_header_id`) REFERENCES `cd_purchase_order_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_receiving_details_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_receiving_details_ibfk_4` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_receiving_details_ibfk_5` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_receiving_details_ibfk_6` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cd_receiving_details_ibfk_7` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_receiving_details`
--

LOCK TABLES `cd_receiving_details` WRITE;
/*!40000 ALTER TABLE `cd_receiving_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_receiving_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_receiving_header`
--

DROP TABLE IF EXISTS `cd_receiving_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_receiving_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(45) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `document_date` date DEFAULT NULL,
  `plate_number` varchar(45) DEFAULT NULL,
  `driver_name` varchar(200) DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `trucking_id` int(11) DEFAULT NULL,
  `vehicle_type_id` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'LOGGED',
  `dr_number` varchar(45) DEFAULT NULL,
  `checker_id` int(11) DEFAULT NULL,
  `arrival_datetime` datetime DEFAULT NULL,
  `start_unload_datetime` datetime DEFAULT NULL,
  `end_unload_datetime` datetime DEFAULT NULL,
  `doc_released_datetime` datetime DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `user_defined_field1` varchar(200) DEFAULT NULL,
  `user_defined_field2` varchar(200) DEFAULT NULL,
  `user_defined_field3` varchar(200) DEFAULT NULL,
  `user_defined_field4` varchar(200) DEFAULT NULL,
  `user_defined_field5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `trucking_id` (`trucking_id`),
  KEY `vehicle_type_id` (`vehicle_type_id`),
  KEY `checker_id` (`checker_id`),
  KEY `posted_by` (`posted_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_receiving_header`
--

LOCK TABLES `cd_receiving_header` WRITE;
/*!40000 ALTER TABLE `cd_receiving_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_receiving_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_receiving_purchase_order`
--

DROP TABLE IF EXISTS `cd_receiving_purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_receiving_purchase_order` (
  `cd_receiving_header_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_receiving_header_id`,`cd_purchase_order_header_id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_receiving_purchase_order`
--

LOCK TABLES `cd_receiving_purchase_order` WRITE;
/*!40000 ALTER TABLE `cd_receiving_purchase_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_receiving_purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_receiving_purchase_order_invoice`
--

DROP TABLE IF EXISTS `cd_receiving_purchase_order_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_receiving_purchase_order_invoice` (
  `cd_receiving_header_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `invoice_number` varchar(80) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_receiving_header_id`,`cd_purchase_order_header_id`,`invoice_number`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_receiving_purchase_order_invoice`
--

LOCK TABLES `cd_receiving_purchase_order_invoice` WRITE;
/*!40000 ALTER TABLE `cd_receiving_purchase_order_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_receiving_purchase_order_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_shipment_details`
--

DROP TABLE IF EXISTS `cd_shipment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_shipment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_shipment_header_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `cd_picklist_header_id` int(11) DEFAULT NULL,
  `cd_trf_header_id` int(11) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `cd_receiving_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `invoice_number` varchar(45) NOT NULL,
  `production_date` date DEFAULT NULL,
  `pallet_number` varchar(45) DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cd_shipment_header_id` (`cd_shipment_header_id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `cd_picklist_header_id` (`cd_picklist_header_id`),
  KEY `cd_trf_header_id` (`cd_trf_header_id`),
  KEY `location_id` (`location_id`),
  KEY `cd_receiving_header_id` (`cd_receiving_header_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_shipment_details`
--

LOCK TABLES `cd_shipment_details` WRITE;
/*!40000 ALTER TABLE `cd_shipment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_shipment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_shipment_header`
--

DROP TABLE IF EXISTS `cd_shipment_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_shipment_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `cd_load_plan_header_id` int(11) NOT NULL,
  `arrival_datetime` datetime DEFAULT NULL,
  `start_loading_datetime` datetime DEFAULT NULL,
  `finished_loading_datetime` datetime DEFAULT NULL,
  `trucking_id` int(11) NOT NULL,
  `plate_number` varchar(45) DEFAULT NULL,
  `vehicle_type_id` int(11) NOT NULL,
  `driver_name` varchar(200) DEFAULT NULL,
  `dispatcher_id` int(11) NOT NULL,
  `seal_number` varchar(200) DEFAULT NULL,
  `document_date` date DEFAULT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `dr_number` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `cd_load_plan_header_id` (`cd_load_plan_header_id`),
  KEY `trucking_id` (`trucking_id`),
  KEY `vehicle_type_id` (`vehicle_type_id`),
  KEY `dispatcher_id` (`dispatcher_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `cancelled_by` (`cancelled_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_shipment_header`
--

LOCK TABLES `cd_shipment_header` WRITE;
/*!40000 ALTER TABLE `cd_shipment_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_shipment_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_shipment_status_history`
--

DROP TABLE IF EXISTS `cd_shipment_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_shipment_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_shipment_header_id` int(11) NOT NULL,
  `status` varchar(80) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `remarks` text,
  `date_returned` datetime DEFAULT NULL,
  `date_transmitted` datetime DEFAULT NULL,
  `date_received` datetime DEFAULT NULL,
  `received_by` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cd_shipment_header_id` (`cd_shipment_header_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_shipment_status_history`
--

LOCK TABLES `cd_shipment_status_history` WRITE;
/*!40000 ALTER TABLE `cd_shipment_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_shipment_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_shipment_transaction`
--

DROP TABLE IF EXISTS `cd_shipment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_shipment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_shipment_header_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `cd_trf_header_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cd_shipment_header_id` (`cd_shipment_header_id`),
  KEY `created_by` (`created_by`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `cd_trf_header_id` (`cd_trf_header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_shipment_transaction`
--

LOCK TABLES `cd_shipment_transaction` WRITE;
/*!40000 ALTER TABLE `cd_shipment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_shipment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_store_bin_assignment`
--

DROP TABLE IF EXISTS `cd_store_bin_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_store_bin_assignment` (
  `warehouse_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `bin_location_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`,`store_id`,`bin_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_store_bin_assignment`
--

LOCK TABLES `cd_store_bin_assignment` WRITE;
/*!40000 ALTER TABLE `cd_store_bin_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_store_bin_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_trf_details`
--

DROP TABLE IF EXISTS `cd_trf_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_trf_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_trf_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `base_quantity` double DEFAULT NULL,
  `unit_price` decimal(24,4) DEFAULT NULL,
  `remarks` text,
  `picked_base_quantity` double DEFAULT '0',
  `shipped_base_quantity` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cd_trf_header_id` (`cd_trf_header_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_trf_details`
--

LOCK TABLES `cd_trf_details` WRITE;
/*!40000 ALTER TABLE `cd_trf_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_trf_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_trf_header`
--

DROP TABLE IF EXISTS `cd_trf_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_trf_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `cd_purchase_order_header_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` varchar(80) NOT NULL DEFAULT 'LOGGED',
  `remarks` text,
  `document_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `store_id` (`store_id`),
  KEY `cd_purchase_order_header_id` (`cd_purchase_order_header_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_trf_header`
--

LOCK TABLES `cd_trf_header` WRITE;
/*!40000 ALTER TABLE `cd_trf_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_trf_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charges`
--

DROP TABLE IF EXISTS `charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) NOT NULL,
  `description` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charges`
--

LOCK TABLES `charges` WRITE;
/*!40000 ALTER TABLE `charges` DISABLE KEYS */;
INSERT INTO `charges` VALUES (1,'BROKERAGE','BROKERAGE','2019-09-30 19:56:48',1,'2020-01-08 07:38:56',1,1),(2,'INSURANCE','INSURANCE','2019-09-30 19:57:02',1,'2020-01-08 07:39:02',1,1),(3,'FREIGHT','FREIGHT','2019-09-30 19:57:36',1,'2020-01-08 07:38:41',1,1);
/*!40000 ALTER TABLE `charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `client_group_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `fax` varchar(80) DEFAULT NULL,
  `telephone` varchar(80) DEFAULT NULL,
  `mobile` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  `reservation_strategy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `client_ibfk_1` (`client_group_id`),
  KEY `client_ibfk_2` (`term_id`),
  KEY `reservation_strategy` (`reservation_strategy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_address`
--

DROP TABLE IF EXISTS `client_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '1',
  `street` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `district` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `shipping_group_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `latitude` varchar(80) DEFAULT NULL,
  `longitude` varchar(80) DEFAULT NULL,
  `delivery_window_from` time DEFAULT NULL,
  `delivery_window_to` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `area_id` (`area_id`),
  KEY `shipping_group_id` (`shipping_group_id`),
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_address`
--

LOCK TABLES `client_address` WRITE;
/*!40000 ALTER TABLE `client_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_address_delivery_day`
--

DROP TABLE IF EXISTS `client_address_delivery_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_address_delivery_day` (
  `client_address_id` int(11) NOT NULL,
  `delivery_day_id` int(11) NOT NULL,
  PRIMARY KEY (`client_address_id`,`delivery_day_id`),
  KEY `delivery_day_id` (`delivery_day_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_address_delivery_day`
--

LOCK TABLES `client_address_delivery_day` WRITE;
/*!40000 ALTER TABLE `client_address_delivery_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_address_delivery_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_address_trucking`
--

DROP TABLE IF EXISTS `client_address_trucking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_address_trucking` (
  `client_address_id` int(11) NOT NULL,
  `trucking_id` int(11) NOT NULL,
  PRIMARY KEY (`client_address_id`,`trucking_id`),
  KEY `trucking_id` (`trucking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_address_trucking`
--

LOCK TABLES `client_address_trucking` WRITE;
/*!40000 ALTER TABLE `client_address_trucking` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_address_trucking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_address_vehicle_type`
--

DROP TABLE IF EXISTS `client_address_vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_address_vehicle_type` (
  `client_address_id` int(11) NOT NULL,
  `vehicle_type_id` int(11) NOT NULL,
  PRIMARY KEY (`client_address_id`,`vehicle_type_id`),
  KEY `vehicle_type_id` (`vehicle_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_address_vehicle_type`
--

LOCK TABLES `client_address_vehicle_type` WRITE;
/*!40000 ALTER TABLE `client_address_vehicle_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_address_vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_contact`
--

DROP TABLE IF EXISTS `client_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '1',
  `name` varchar(80) DEFAULT NULL,
  `designation` varchar(80) DEFAULT NULL,
  `telephone` varchar(80) DEFAULT NULL,
  `mobile` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `street` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `district` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_contact`
--

LOCK TABLES `client_contact` WRITE;
/*!40000 ALTER TABLE `client_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_for_client`
--

DROP TABLE IF EXISTS `client_for_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_for_client` (
  `client_id` int(11) NOT NULL,
  `for_client_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`,`for_client_id`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_for_client`
--

LOCK TABLES `client_for_client` WRITE;
/*!40000 ALTER TABLE `client_for_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_for_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_group`
--

DROP TABLE IF EXISTS `client_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_group`
--

LOCK TABLES `client_group` WRITE;
/*!40000 ALTER TABLE `client_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_information`
--

DROP TABLE IF EXISTS `company_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(128) DEFAULT NULL,
  `company_address` mediumtext,
  `city` varchar(150) DEFAULT NULL,
  `state_province` varchar(150) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `primary_color` varchar(100) DEFAULT NULL,
  `secondary_color` varchar(100) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `tax_identification_number` varchar(128) DEFAULT NULL,
  `value_added_tax_percentage` double DEFAULT '0.12',
  `system_generated_po_number_only_flag` tinyint(1) DEFAULT '0',
  `item_supplier_flag` tinyint(1) NOT NULL DEFAULT '0',
  `default_po_approver` varchar(80) DEFAULT NULL,
  `default_case_uom_id` int(11) DEFAULT NULL,
  `rcv_po_partial_delivery` tinyint(1) DEFAULT '1',
  `rcv_iss_partial_delivery` tinyint(1) DEFAULT '1',
  `convert_free_to_regular_in_putaway` tinyint(1) DEFAULT '0',
  `default_reservation_strategy` int(11) DEFAULT NULL,
  `picking_in_pick_phase_only_flag` tinyint(1) DEFAULT '1',
  `allow_pick_phase_putaway_flag` tinyint(1) DEFAULT '1',
  `allow_partial_pallet_picking_flag` tinyint(1) DEFAULT '1',
  `allow_more_than_purchase_order_quantity_flag` tinyint(1) DEFAULT '0',
  `hide_pallet_ref_on_picklist` tinyint(1) DEFAULT '0',
  `allow_bin_transfer_without_pallet` tinyint(1) NOT NULL DEFAULT '0',
  `enable_poref_restriction` tinyint(1) NOT NULL DEFAULT '0',
  `enable_soref_restriction` tinyint(1) NOT NULL DEFAULT '0',
  `require_pallet_on_rcv` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `default_case_uom_id` (`default_case_uom_id`),
  KEY `default_reservation_strategy` (`default_reservation_strategy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_information`
--

LOCK TABLES `company_information` WRITE;
/*!40000 ALTER TABLE `company_information` DISABLE KEYS */;
INSERT INTO `company_information` VALUES (1,'Silgan White Cap South East Asia Inc','American Rd, Greenfield Park SEZ, Santa Rosa, Laguna','Santa Rosa','Laguna','','rgb(255,255,255)','rgb(255,255,255)','PHILIPPINES','',0.12,1,1,'DEFAULT PO APPROVER',NULL,1,1,0,5,0,1,1,1,1,0,0,0,0);
/*!40000 ALTER TABLE `company_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costing`
--

DROP TABLE IF EXISTS `costing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `charges_id` int(11) NOT NULL,
  `amount` double DEFAULT '0',
  `reference` varchar(80) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `remarks` text,
  `bl_number` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `charges_id` (`charges_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costing`
--

LOCK TABLES `costing` WRITE;
/*!40000 ALTER TABLE `costing` DISABLE KEYS */;
/*!40000 ALTER TABLE `costing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costing_stock_receipt`
--

DROP TABLE IF EXISTS `costing_stock_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costing_stock_receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costing_id` int(11) NOT NULL,
  `stock_receipt_header_id` int(11) NOT NULL,
  `amount` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `costing_id` (`costing_id`),
  KEY `stock_receipt_header_id` (`stock_receipt_header_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costing_stock_receipt`
--

LOCK TABLES `costing_stock_receipt` WRITE;
/*!40000 ALTER TABLE `costing_stock_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `costing_stock_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costing_stock_receipt_item`
--

DROP TABLE IF EXISTS `costing_stock_receipt_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costing_stock_receipt_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costing_id` int(11) NOT NULL,
  `stock_receipt_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) NOT NULL,
  `amount` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `total_regular_and_free_quantity` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `costing_id` (`costing_id`),
  KEY `stock_receipt_header_id` (`stock_receipt_header_id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costing_stock_receipt_item`
--

LOCK TABLES `costing_stock_receipt_item` WRITE;
/*!40000 ALTER TABLE `costing_stock_receipt_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `costing_stock_receipt_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costing_supplier`
--

DROP TABLE IF EXISTS `costing_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costing_supplier` (
  `costing_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`costing_id`,`supplier_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costing_supplier`
--

LOCK TABLES `costing_supplier` WRITE;
/*!40000 ALTER TABLE `costing_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `costing_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(45) DEFAULT NULL,
  `country_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_code` (`country_code`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AF','Afghanistan'),(2,'AL','Albania'),(3,'DZ','Algeria'),(4,'DS','American Samoa'),(5,'AD','Andorra'),(6,'AO','Angola'),(7,'AI','Anguilla'),(8,'AQ','Antarctica'),(9,'AG','Antigua and Barbuda'),(10,'AR','Argentina'),(11,'AM','Armenia'),(12,'AW','Aruba'),(13,'AU','Australia'),(14,'AT','Austria'),(15,'AZ','Azerbaijan'),(16,'BS','Bahamas'),(17,'BH','Bahrain'),(18,'BD','Bangladesh'),(19,'BB','Barbados'),(20,'BY','Belarus'),(21,'BE','Belgium'),(22,'BZ','Belize'),(23,'BJ','Benin'),(24,'BM','Bermuda'),(25,'BT','Bhutan'),(26,'BO','Bolivia'),(27,'BA','Bosnia and Herzegovina'),(28,'BW','Botswana'),(29,'BV','Bouvet Island'),(30,'BR','Brazil'),(31,'IO','British Indian Ocean Territory'),(32,'BN','Brunei Darussalam'),(33,'BG','Bulgaria'),(34,'BF','Burkina Faso'),(35,'BI','Burundi'),(36,'KH','Cambodia'),(37,'CM','Cameroon'),(38,'CA','Canada'),(39,'CV','Cape Verde'),(40,'KY','Cayman Islands'),(41,'CF','Central African Republic'),(42,'TD','Chad'),(43,'CL','Chile'),(44,'CN','China'),(45,'CX','Christmas Island'),(46,'CC','Cocos (Keeling) Islands'),(47,'CO','Colombia'),(48,'KM','Comoros'),(49,'CG','Congo'),(50,'CK','Cook Islands'),(51,'CR','Costa Rica'),(52,'HR','Croatia (Hrvatska)'),(53,'CU','Cuba'),(54,'CY','Cyprus'),(55,'CZ','Czech Republic'),(56,'DK','Denmark'),(57,'DJ','Djibouti'),(58,'DM','Dominica'),(59,'DO','Dominican Republic'),(60,'TP','East Timor'),(61,'EC','Ecuador'),(62,'EG','Egypt'),(63,'SV','El Salvador'),(64,'GQ','Equatorial Guinea'),(65,'ER','Eritrea'),(66,'EE','Estonia'),(67,'ET','Ethiopia'),(68,'FK','Falkland Islands (Malvinas)'),(69,'FO','Faroe Islands'),(70,'FJ','Fiji'),(71,'FI','Finland'),(72,'FR','France'),(73,'FX','France, Metropolitan'),(74,'GF','French Guiana'),(75,'PF','French Polynesia'),(76,'TF','French Southern Territories'),(77,'GA','Gabon'),(78,'GM','Gambia'),(79,'GE','Georgia'),(80,'DE','Germany'),(81,'GH','Ghana'),(82,'GI','Gibraltar'),(83,'GK','Guernsey'),(84,'GR','Greece'),(85,'GL','Greenland'),(86,'GD','Grenada'),(87,'GP','Guadeloupe'),(88,'GU','Guam'),(89,'GT','Guatemala'),(90,'GN','Guinea'),(91,'GW','Guinea-Bissau'),(92,'GY','Guyana'),(93,'HT','Haiti'),(94,'HM','Heard and Mc Donald Islands'),(95,'HN','Honduras'),(96,'HK','Hong Kong'),(97,'HU','Hungary'),(98,'IS','Iceland'),(99,'IN','India'),(100,'IM','Isle of Man'),(101,'ID','Indonesia'),(102,'IR','Iran (Islamic Republic of)'),(103,'IQ','Iraq'),(104,'IE','Ireland'),(105,'IL','Israel'),(106,'IT','Italy'),(107,'CI','Ivory Coast'),(108,'JE','Jersey'),(109,'JM','Jamaica'),(110,'JP','Japan'),(111,'JO','Jordan'),(112,'KZ','Kazakhstan'),(113,'KE','Kenya'),(114,'KI','Kiribati'),(115,'KP','Korea, Democratic People\'s Republic of'),(116,'KR','Korea, Republic of'),(117,'XK','Kosovo'),(118,'KW','Kuwait'),(119,'KG','Kyrgyzstan'),(120,'LA','Lao People\'s Democratic Republic'),(121,'LV','Latvia'),(122,'LB','Lebanon'),(123,'LS','Lesotho'),(124,'LR','Liberia'),(125,'LY','Libyan Arab Jamahiriya'),(126,'LI','Liechtenstein'),(127,'LT','Lithuania'),(128,'LU','Luxembourg'),(129,'MO','Macau'),(130,'MK','Macedonia'),(131,'MG','Madagascar'),(132,'MW','Malawi'),(133,'MY','Malaysia'),(134,'MV','Maldives'),(135,'ML','Mali'),(136,'MT','Malta'),(137,'MH','Marshall Islands'),(138,'MQ','Martinique'),(139,'MR','Mauritania'),(140,'MU','Mauritius'),(141,'TY','Mayotte'),(142,'MX','Mexico'),(143,'FM','Micronesia, Federated States of'),(144,'MD','Moldova, Republic of'),(145,'MC','Monaco'),(146,'MN','Mongolia'),(147,'ME','Montenegro'),(148,'MS','Montserrat'),(149,'MA','Morocco'),(150,'MZ','Mozambique'),(151,'MM','Myanmar'),(152,'NA','Namibia'),(153,'NR','Nauru'),(154,'NP','Nepal'),(155,'NL','Netherlands'),(156,'AN','Netherlands Antilles'),(157,'NC','New Caledonia'),(158,'NZ','New Zealand'),(159,'NI','Nicaragua'),(160,'NE','Niger'),(161,'NG','Nigeria'),(162,'NU','Niue'),(163,'NF','Norfolk Island'),(164,'MP','Northern Mariana Islands'),(165,'NO','Norway'),(166,'OM','Oman'),(167,'PK','Pakistan'),(168,'PW','Palau'),(169,'PS','Palestine'),(170,'PA','Panama'),(171,'PG','Papua New Guinea'),(172,'PY','Paraguay'),(173,'PE','Peru'),(174,'PH','Philippines'),(175,'PN','Pitcairn'),(176,'PL','Poland'),(177,'PT','Portugal'),(178,'PR','Puerto Rico'),(179,'QA','Qatar'),(180,'RE','Reunion'),(181,'RO','Romania'),(182,'RU','Russian Federation'),(183,'RW','Rwanda'),(184,'KN','Saint Kitts and Nevis'),(185,'LC','Saint Lucia'),(186,'VC','Saint Vincent and the Grenadines'),(187,'WS','Samoa'),(188,'SM','San Marino'),(189,'ST','Sao Tome and Principe'),(190,'SA','Saudi Arabia'),(191,'SN','Senegal'),(192,'RS','Serbia'),(193,'SC','Seychelles'),(194,'SL','Sierra Leone'),(195,'SG','Singapore'),(196,'SK','Slovakia'),(197,'SI','Slovenia'),(198,'SB','Solomon Islands'),(199,'SO','Somalia'),(200,'ZA','South Africa'),(201,'GS','South Georgia South Sandwich Islands'),(202,'ES','Spain'),(203,'LK','Sri Lanka'),(204,'SH','St. Helena'),(205,'PM','St. Pierre and Miquelon'),(206,'SD','Sudan'),(207,'SR','Suriname'),(208,'SJ','Svalbard and Jan Mayen Islands'),(209,'SZ','Swaziland'),(210,'SE','Sweden'),(211,'CH','Switzerland'),(212,'SY','Syrian Arab Republic'),(213,'TW','Taiwan'),(214,'TJ','Tajikistan'),(215,'TZ','Tanzania, United Republic of'),(216,'TH','Thailand'),(217,'TG','Togo'),(218,'TK','Tokelau'),(219,'TO','Tonga'),(220,'TT','Trinidad and Tobago'),(221,'TN','Tunisia'),(222,'TR','Turkey'),(223,'TM','Turkmenistan'),(224,'TC','Turks and Caicos Islands'),(225,'TV','Tuvalu'),(226,'UG','Uganda'),(227,'UA','Ukraine'),(228,'AE','United Arab Emirates'),(229,'GB','United Kingdom'),(230,'US','United States'),(231,'UM','United States minor outlying islands'),(232,'UY','Uruguay'),(233,'UZ','Uzbekistan'),(234,'VU','Vanuatu'),(235,'VA','Vatican City State'),(236,'VE','Venezuela'),(237,'VN','Vietnam'),(238,'VG','Virgin Islands (British)'),(239,'VI','Virgin Islands (U.S.)'),(240,'WF','Wallis and Futuna Islands'),(241,'EH','Western Sahara'),(242,'YE','Yemen'),(243,'ZR','Zaire'),(244,'ZM','Zambia'),(245,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `description` varchar(128) NOT NULL,
  `exchange_rate` double NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'PHP','PHP',1,'2020-10-16 14:48:32',1,NULL,NULL,1),(2,'EUR','EUR',0,'2023-07-11 16:50:09',NULL,NULL,NULL,1),(3,'USD','USD',0,'2023-09-20 14:55:40',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cycle_count_brand`
--

DROP TABLE IF EXISTS `cycle_count_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cycle_count_brand` (
  `cycle_count_header_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`cycle_count_header_id`,`brand_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `cycle_count_brand_ibfk_1` FOREIGN KEY (`cycle_count_header_id`) REFERENCES `cycle_count_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_brand_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cycle_count_brand`
--

LOCK TABLES `cycle_count_brand` WRITE;
/*!40000 ALTER TABLE `cycle_count_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `cycle_count_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cycle_count_category`
--

DROP TABLE IF EXISTS `cycle_count_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cycle_count_category` (
  `cycle_count_header_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`cycle_count_header_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `cycle_count_category_ibfk_1` FOREIGN KEY (`cycle_count_header_id`) REFERENCES `cycle_count_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cycle_count_category`
--

LOCK TABLES `cycle_count_category` WRITE;
/*!40000 ALTER TABLE `cycle_count_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cycle_count_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cycle_count_details`
--

DROP TABLE IF EXISTS `cycle_count_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cycle_count_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_count_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `system_count` double DEFAULT NULL,
  `actual_count` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `system_weight` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cycle_count_header_id` (`cycle_count_header_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `cycle_count_details_ibfk_1` FOREIGN KEY (`cycle_count_header_id`) REFERENCES `cycle_count_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_details_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_details_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_details_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cycle_count_details`
--

LOCK TABLES `cycle_count_details` WRITE;
/*!40000 ALTER TABLE `cycle_count_details` DISABLE KEYS */;
INSERT INTO `cycle_count_details` VALUES (1,1,1,11,'SC001',NULL,12200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-10-07',0,0),(2,1,2,11,'PPMC001',NULL,8510,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-10-06',0,0),(3,1,3,11,'SL001',NULL,800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-10-25',0,0),(4,1,4,11,'LBL001',NULL,45,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-10-24',0,0),(5,1,5,11,'RBN001',NULL,20,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-10-24',0,0),(6,1,6,50,'20231215',NULL,400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-12-01',0,400),(7,1,6,48,'6-1033',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,7108),(8,1,6,48,'6-1032',NULL,12600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,10662),(9,1,6,48,'6-1031',NULL,14700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,12439),(10,1,6,48,'6-1031',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-04-25',0,1777),(11,1,6,48,'6-1030',NULL,14700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,12439),(12,1,6,48,'4-0906',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,1777),(13,1,6,48,'4-0906',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-04-25',0,7108),(14,1,6,43,'Y-0669',NULL,12600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,10662),(15,1,6,43,'Y-0668-1',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,7108),(16,1,6,43,'Y-0668',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,1777),(17,1,6,43,'Y-0667',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,7108),(18,1,6,43,'Y-0666',NULL,12600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,10662),(19,1,6,43,'Y-0665',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,7108),(20,1,6,43,'Y-0664',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,7108),(21,1,6,43,'6-1040',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,1777),(22,1,6,39,'Y-0668',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,1777),(23,1,6,39,'Y-0667',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,7108),(24,1,6,39,'Y-0666',NULL,6300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,5331),(25,1,6,39,'Y-0665',NULL,6300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,5331),(26,1,6,39,'Y-0664',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,7108),(27,1,6,39,'6-1040',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-04',0,1777),(28,1,6,39,'6-1040',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,1777),(29,1,6,30,'05-482301',NULL,8000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-13',0,6768),(30,1,6,30,'05-482300',NULL,12000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-13',0,10152),(31,1,6,30,'05-482299',NULL,12000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-13',0,10152),(32,1,6,30,'05-482297',NULL,6000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-13',0,5076),(33,1,6,23,'6-1037',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,1777),(34,1,6,23,'6-1037',NULL,6300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,5331),(35,1,6,23,'6-1036',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,7108),(36,1,6,23,'6-1036',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,7108),(37,1,6,23,'6-1035',NULL,4200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,3554),(38,1,6,23,'6-1035',NULL,14700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,12439),(39,1,6,23,'6-1034',NULL,12600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,10662),(40,1,6,23,'6-1033',NULL,6300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,5331),(41,1,6,16,'6-1069',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,1777),(42,1,6,16,'6-1040',NULL,12600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,10662),(43,1,6,16,'6-1039',NULL,10500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,8885),(44,1,6,16,'6-1038',NULL,16800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,14216),(45,1,6,16,'6-1037',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,7108),(46,1,6,16,'6-1034',NULL,4200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,3554),(47,1,6,16,'6-1033',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,1777),(48,1,6,16,'6-1033',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-01',0,1777),(49,1,7,47,'6-0930',NULL,7500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,8535),(50,1,7,47,'6-0929',NULL,12000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,13656),(51,1,7,47,'6-0928',NULL,13500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,15363),(52,1,7,47,'6-0927',NULL,13500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,15363),(53,1,7,47,'6-0926-1',NULL,6000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,6828),(54,1,7,42,'Y-0639',NULL,4500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-03',0,5121),(55,1,7,42,'Y-0638',NULL,1500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-03',0,1707),(56,1,7,42,'Y-0638',NULL,7500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-12-31',0,8535),(57,1,7,42,'6-0931',NULL,6000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,6828),(58,1,7,42,'2-1112-2',NULL,1500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-06',0,1707),(59,1,7,35,'4-0864',NULL,7500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-04-23',0,8535),(60,1,7,35,'4-0863',NULL,13500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-04-23',0,15363),(61,1,7,35,'4-0862',NULL,12000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-04-23',0,13656),(62,1,7,35,'2-1114',NULL,10500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-06',0,11949),(63,1,7,35,'2-1112-2',NULL,3000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-06',0,3414),(64,1,7,32,'06-482393',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-17',0,2276),(65,1,7,32,'06-482385',NULL,6000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-19',0,6828),(66,1,7,32,'06-482383',NULL,8000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-19',0,9104),(67,1,7,32,'06-482196',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-19',0,2276),(68,1,7,32,'06-482196',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-17',0,2276),(69,1,7,32,'06-482194',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-17',0,2276),(70,1,7,18,'6-0931',NULL,9000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,10242),(71,1,7,18,'6-0930',NULL,6000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,6828),(72,1,7,18,'6-0926',NULL,7500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,8535),(73,1,7,18,'6-0925',NULL,13500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,15363),(74,1,7,18,'6-0921',NULL,1500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,1707),(75,1,7,18,'6-0912',NULL,7500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,8535),(76,1,7,18,'6-0912',NULL,1500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-04-23',0,1707),(77,1,7,18,'4-0864',NULL,6000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-04-23',0,6828),(78,1,8,49,'8-0992',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,1783),(79,1,8,49,'8-0991',NULL,11900,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,12481),(80,1,8,49,'8-0990',NULL,5100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,5349),(81,1,8,49,'8-0988-1',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,1783),(82,1,8,49,'8-0988',NULL,8500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,8915),(83,1,8,49,'8-0938',NULL,5100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,5349),(84,1,8,49,'8-0936',NULL,11900,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,12481),(85,1,8,49,'8-0934',NULL,8500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,8915),(86,1,8,34,'X-0718',NULL,15300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-22',0,16047),(87,1,8,34,'X-0717',NULL,15300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-22',0,16047),(88,1,8,34,'X-0716-1',NULL,5100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-22',0,5349),(89,1,8,34,'X-0716',NULL,5100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-22',0,5349),(90,1,8,34,'8-0993',NULL,13600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,14264),(91,1,8,34,'8-0992',NULL,3400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,3566),(92,1,8,34,'8-0989',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,1783),(93,1,8,24,'8-0935-1',NULL,6800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,7132),(94,1,8,24,'8-0935',NULL,6800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,7132),(95,1,8,24,'8-0934',NULL,6800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,7132),(96,1,8,24,'6-0924',NULL,8500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-05',0,8915),(97,1,8,24,'6-0921',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-05',0,1783),(98,1,8,21,'8-0990',NULL,3400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,3566),(99,1,8,21,'8-0988',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,1783),(100,1,8,21,'6-0924',NULL,3400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-05',0,3566),(101,1,8,21,'6-0923',NULL,15300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-05',0,16047),(102,1,8,21,'6-0922',NULL,15300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-05',0,16047),(103,1,8,21,'6-0921',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-05',0,1783),(104,1,8,21,'6-0920',NULL,8500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-05',0,8915),(105,1,8,21,'6-0916',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-05',0,1783),(106,1,8,21,'6-0915',NULL,5100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-05',0,5349),(107,1,8,19,'8-0992',NULL,8500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,8915),(108,1,8,19,'8-0992',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,1783),(109,1,8,19,'8-0991',NULL,3400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,3566),(110,1,8,19,'8-0990',NULL,6800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,7132),(111,1,8,19,'8-0989',NULL,3400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,3566),(112,1,8,19,'8-0989',NULL,10200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,10698),(113,1,8,19,'8-0988-1',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,1783),(114,1,8,19,'8-0938',NULL,6800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,7132),(115,1,8,19,'8-0938',NULL,3400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,3566),(116,1,8,19,'8-0937',NULL,15300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-24',0,16047),(117,1,9,44,'07-482341',NULL,8000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-27',0,6496),(118,1,9,44,'05-482294',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-13',0,3248),(119,1,9,44,'05-482293',NULL,12000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-13',0,9744),(120,1,9,44,'05-482292',NULL,18000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-13',0,14616),(121,1,9,37,'240108',NULL,25,0,'2024-01-09 03:27:38',1,NULL,NULL,NULL,0,0),(122,1,9,31,'Y-0649',NULL,18900,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-03',0,15345),(123,1,9,31,'Y-0400',NULL,10500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-03',0,8525),(124,1,9,31,'6-0969',NULL,10500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-30',0,8525),(125,1,9,26,'6-0969',NULL,6300,5,'2024-01-09 03:27:38',1,'2024-01-09 03:52:02',1,'2022-06-30',0,5115),(126,1,9,26,'6-0968',NULL,6300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-30',0,5115),(127,1,9,26,'6-0965',NULL,14700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-30',0,11935),(128,1,9,26,'6-0964',NULL,4200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-30',0,3410),(129,1,9,26,'6-0964',NULL,10500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-29',0,8525),(130,1,9,26,'6-0963',NULL,16800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-29',0,13640),(131,1,9,26,'4-0891',NULL,4200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-04-24',0,3410),(132,1,9,25,'6-0969',NULL,4200,25,'2024-01-09 03:27:38',1,'2024-01-09 03:52:00',1,'2022-06-30',0,3410),(133,1,9,25,'6-0968',NULL,12600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-30',0,10230),(134,1,9,25,'6-0967',NULL,18900,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-30',0,15345),(135,1,9,25,'4-0891',NULL,16800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-04-24',0,13640),(136,1,9,25,'3-1221',NULL,6300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-26',0,5115),(137,1,9,25,'2-1154',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-07',0,1705),(138,1,9,25,'2-1152',NULL,1700,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-07',0,1705),(139,1,9,22,'3-1221',NULL,4200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-26',0,3410),(140,1,9,22,'3-1220',NULL,8400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-25',0,6898),(141,1,9,22,'3-1219',NULL,16800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-25',0,13874),(142,1,9,22,'2-1154',NULL,10500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-07',0,8525),(143,1,9,22,'2-1140-2',NULL,4200,121,'2024-01-09 03:27:38',1,'2024-01-09 03:52:04',1,'2022-03-07',0,3410),(144,1,9,20,'6-0966',NULL,18900,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-30',0,15345),(145,1,9,20,'6-0965',NULL,4200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-06-30',0,3410),(146,1,9,20,'240108',NULL,0,0,'2024-01-09 03:27:38',1,NULL,NULL,NULL,0,0),(147,1,9,20,'2-1154',NULL,2100,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-07',0,1705),(148,1,9,20,'2-1140-2',NULL,4200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-03-07',0,3410),(149,1,10,50,'20231215',NULL,12,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-12-01',0,12),(150,1,10,36,'8-1007',NULL,9000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,8165),(151,1,10,36,'8-1006',NULL,9000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,8165),(152,1,10,36,'8-1005',NULL,14400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,13064),(153,1,10,36,'8-1004',NULL,5400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,4899),(154,1,10,36,'8-1002',NULL,12600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,11431),(155,1,10,36,'8-1001',NULL,12600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,11431),(156,1,10,36,'8-0999',NULL,1800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,1633),(157,1,10,33,'X-0734',NULL,16200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-22',0,14697),(158,1,10,33,'X-0733',NULL,7200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-22',0,6532),(159,1,10,33,'X-0732-1',NULL,12600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-22',0,11431),(160,1,10,33,'X-0732',NULL,3600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-22',0,3266),(161,1,10,33,'8-1009',NULL,1800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,1633),(162,1,10,28,'8-1005',NULL,3600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,3266),(163,1,10,28,'8-1004',NULL,10800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,9798),(164,1,10,28,'8-1003',NULL,16200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,14697),(165,1,10,28,'8-1001',NULL,1800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,1633),(166,1,10,28,'6-0955',NULL,1800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-07',0,1633),(167,1,10,28,'6-0954',NULL,3600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-07',0,3266),(168,1,10,28,'6-0953',NULL,16200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-07',0,14697),(169,1,10,28,'6-0953',NULL,1800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-04',0,1633),(170,1,10,28,'6-0952-1',NULL,3600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-07',0,3266),(171,1,10,28,'6-0951',NULL,3600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-07',0,3266),(172,1,10,27,'8-1009',NULL,9000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,8165),(173,1,10,27,'8-1007',NULL,3600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,3266),(174,1,10,27,'8-0998',NULL,1800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-25',0,1633),(175,1,11,29,'Y-0937-2',NULL,1800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-06',0,1753),(176,1,11,29,'Y-0647-2',NULL,5400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-03',0,5259),(177,1,11,29,'Y-0645',NULL,16200,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-03',0,15777),(178,1,12,46,'09-484389',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,3628),(179,1,12,46,'09-484387',NULL,6000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,5442),(180,1,12,46,'09-484385',NULL,6000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,5442),(181,1,12,46,'09-484382',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,3628),(182,1,12,46,'09-484381',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,3628),(183,1,12,46,'09-484379',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,3628),(184,1,12,46,'09-482319',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-29',0,1814),(185,1,12,46,'09-482305',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-29',0,1814),(186,1,12,46,'09-482147',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-16',0,1814),(187,1,12,46,'09-482146',NULL,14000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-16',0,12698),(188,1,12,45,'09-482322',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-23',0,3628),(189,1,12,45,'09-482151',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-16',0,1814),(190,1,12,45,'09-482149',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-16',0,1814),(191,1,12,45,'09-482147',NULL,10000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-16',0,9070),(192,1,12,45,'09-482125',NULL,10000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-13',0,9070),(193,1,12,37,'10-484128',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-10-05',0,3628),(194,1,12,37,'10-484128',NULL,1985,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,0),(195,1,12,37,'09-484684',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,1814),(196,1,12,37,'09-484389',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-10-05',0,1814),(197,1,12,37,'09-484389',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,3628),(198,1,12,37,'09-484387',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,3628),(199,1,12,37,'09-484385',NULL,4000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,3628),(200,1,12,37,'09-484384',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-29',0,1814),(201,1,12,37,'09-484384',NULL,8000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,7256),(202,1,12,37,'09-484382',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,1814),(203,1,12,37,'09-484381',NULL,12000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,10884),(204,1,12,37,'09-484379',NULL,6000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,5442),(205,1,12,37,'09-482305',NULL,2000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-09-24',0,1814),(206,1,13,50,'01-484731',NULL,1910,0,'2024-01-09 03:27:38',1,NULL,NULL,'2019-02-05',0,1790),(207,1,13,50,'01-484731',NULL,8000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2019-01-31',0,7496),(208,1,14,50,'RETURN-003',NULL,635,0,'2024-01-09 03:27:38',1,NULL,NULL,'2021-06-01',0,635),(209,1,14,50,'RETURN-002',NULL,490,0,'2024-01-09 03:27:38',1,NULL,NULL,'2021-06-01',0,490),(210,1,14,50,'RETURN-001',NULL,1510,0,'2024-01-09 03:27:38',1,NULL,NULL,'2021-06-01',0,1510),(211,1,15,12,'GOP134274','2023-10-25',6270,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-26',0,6270),(212,1,16,12,'BDC370458','2023-01-28',1000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-01',0,1000),(213,1,17,12,'BDC378564','2024-01-10',3300,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-14',0,3300),(214,1,17,12,'BDC369082','2023-01-24',103.95,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-07-28',0,103.95),(215,1,17,12,'BDC351308','2021-01-18',220,0,'2024-01-09 03:27:38',1,NULL,NULL,'2020-07-22',0,220),(216,1,17,12,'BDC338650','2019-11-12',988.9,0,'2024-01-09 03:27:38',1,NULL,NULL,'2019-05-19',0,988.9),(217,1,18,12,'8635099570','2019-05-10',569.3,0,'2024-01-09 03:27:38',1,NULL,NULL,'2018-05-10',0,569.3),(218,1,18,12,'3394127754','2024-03-06',4100.25,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-03-06',0,4100.25),(219,1,18,12,'2V35127471','2023-11-12',1562,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-12',0,1562),(220,1,19,12,'2835126287','2023-08-26',2631.1800000000007,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-26',0,2631.1800000000007),(221,1,20,12,'321H060810','2024-02-02',1600,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-02-02',0,1600),(222,1,21,12,'9T1H048489','2020-06-26',119,0,'2024-01-09 03:27:38',1,NULL,NULL,'2019-06-26',0,119),(223,1,21,12,'8W1H045295','2019-09-14',1635.3,0,'2024-01-09 03:27:38',1,NULL,NULL,'2018-09-14',0,1635.3),(224,1,21,12,'321H060764','2023-11-05',500,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-05',0,500),(225,1,21,12,'181H055343','2022-04-04',76,0,'2024-01-09 03:27:38',1,NULL,NULL,'2021-04-04',0,76),(226,1,22,12,'P131337098','2022-03-22',440,0,'2024-01-09 03:27:38',1,NULL,NULL,'2021-09-22',0,440),(227,1,23,12,'P140339688','2022-04-26',440,0,'2024-01-09 03:27:38',1,NULL,NULL,'2021-10-26',0,440),(228,1,24,12,'TEO407','2023-11-22',7440,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-05-26',0,7440),(229,1,25,12,'TFO167','2023-12-13',1000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-06-16',0,1000),(230,1,25,12,'TEO154','2023-11-08',3000,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-06-01',0,3000),(231,1,26,12,'TEO361','2023-12-06',400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-06-09',0,400),(232,1,27,12,'TFO429','2023-12-16',400,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-06-19',0,400),(233,1,28,12,'FH3310XA3','2021-11-27',93.65,0,'2024-01-09 03:27:38',1,NULL,NULL,'2020-11-27',0,93.65),(234,1,28,12,'875C016011','2019-01-22',394,0,'2024-01-09 03:27:38',1,NULL,NULL,'2018-07-26',0,394),(235,1,29,12,'F1808083654','2019-02-15',194.8,0,'2024-01-09 03:27:38',1,NULL,NULL,'2018-08-15',0,194.8),(236,1,29,12,'1808083654','2019-02-15',96,0,'2024-01-09 03:27:38',1,NULL,NULL,'2018-08-15',0,96),(237,1,30,12,'F1808083655','2019-02-15',219.8,0,'2024-01-09 03:27:38',1,NULL,NULL,'2018-08-15',0,219.8),(238,1,30,12,'1808083655','2019-02-15',167,0,'2024-01-09 03:27:38',1,NULL,NULL,'2018-08-15',0,167),(239,1,31,12,'1318Y1910','2019-05-18',60,0,'2024-01-09 03:27:38',1,NULL,NULL,'2018-11-19',0,81),(240,1,32,12,'1318Y1909','2019-05-18',76.8,0,'2024-01-09 03:27:38',1,NULL,NULL,'2018-11-19',0,76.8),(241,1,33,12,'BDC370729','2023-02-04',88.14,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-08-08',0,88.14),(242,1,33,12,'BDC351252','2021-01-18',252.5,0,'2024-01-09 03:27:38',1,NULL,NULL,'2020-07-22',0,252.5),(243,1,34,12,'9V1A040676','2020-05-03',420,0,'2024-01-09 03:27:38',1,NULL,NULL,'2019-11-03',0,420),(244,1,34,12,'961A039173','2019-11-30',123,0,'2024-01-09 03:27:38',1,NULL,NULL,'2019-05-30',0,123),(245,1,35,12,'BDC347233','2020-09-14',28,0,'2024-01-09 03:27:38',1,NULL,NULL,'2020-03-18',0,28),(246,1,36,12,'BDC356440','2021-08-30',800,0,'2024-01-09 03:27:38',1,NULL,NULL,'2021-03-03',0,800),(247,1,37,14,'2749980117','2024-02-26',759,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-03-03',0,759),(248,1,37,14,'2749980116','2024-02-26',1004,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-03-03',0,1004),(249,1,37,14,'2749980112','2024-02-26',988,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-03-03',0,988),(250,1,37,14,'2749980111','2024-02-26',1261,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-03-03',0,1261),(251,1,38,14,'2733230202','2023-05-02',984,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-03',0,984),(252,1,38,14,'2733230201','2023-05-02',976,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-03',0,976),(253,1,38,14,'2733230199','2023-05-02',984,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-11-03',0,984),(254,1,38,14,'2731990165','2023-07-17',984,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-18',0,984),(255,1,38,14,'2731990015','2023-07-18',996,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-19',0,996),(256,1,38,14,'2731990014','2023-07-18',992,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-19',0,992),(257,1,38,14,'2731990013','2023-07-18',992,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-19',0,992),(258,1,38,14,'2731990012','2023-07-18',996,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-19',0,996),(259,1,38,14,'2731990011','2023-07-18',984,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-19',0,984),(260,1,38,14,'2731990010','2023-07-18',988,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-19',0,988),(261,1,38,14,'2731990009','2023-07-18',988,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-01-19',0,988),(262,1,39,14,'2773861105','2024-01-28',972,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-08-01',0,972),(263,1,39,14,'2773861104','2024-01-28',984,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-08-01',0,984),(264,1,39,14,'2773861101','2024-01-27',988,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-31',0,988),(265,1,39,14,'2773861100','2024-01-27',988,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-31',0,988),(266,1,39,14,'2773861092','2024-01-25',984,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-29',0,984),(267,1,39,14,'2773861091','2024-01-25',984,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-29',0,984),(268,1,39,14,'2773861048','2024-01-20',972,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-24',0,972),(269,1,39,14,'2773861047','2024-01-20',980,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-24',0,980),(270,1,39,14,'2773861040','2024-01-18',980,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-22',0,980),(271,1,39,14,'2773861039','2024-01-18',980,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-22',0,980),(272,1,39,14,'2773861026','2024-01-17',980,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-21',0,980),(273,1,39,14,'2773861025','2024-01-17',980,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-21',0,980),(274,1,39,14,'2773861017','2024-01-16',976,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-20',0,976),(275,1,39,14,'2773861016','2024-01-16',976,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-20',0,976),(276,1,39,14,'2773861010','2024-01-15',980,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-19',0,980),(277,1,39,14,'2773861009','2024-01-15',980,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-19',0,980),(278,1,39,14,'2773861002','2024-01-14',976,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-18',0,976),(279,1,39,14,'2773861001','2024-01-14',980,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-18',0,980),(280,1,39,14,'2773860997','2024-01-13',996,0,'2024-01-09 03:27:38',1,NULL,NULL,'2023-07-17',0,996),(281,1,40,14,'2698100160','2023-05-01',1020,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-06',0,1020),(282,1,40,14,'2698100157','2023-04-30',1024,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-05',0,1024),(283,1,40,14,'2698100155','2023-04-30',1024,0,'2024-01-09 03:27:38',1,NULL,NULL,'2022-05-05',0,1024),(284,1,41,14,'2415360003','2019-09-15',984,0,'2024-01-09 03:27:38',1,NULL,NULL,'2019-03-19',0,984),(285,1,41,14,'2415360002','2019-09-15',735,0,'2024-01-09 03:27:38',1,NULL,NULL,'2019-03-19',0,735),(286,1,41,14,'2415360001','2019-09-15',244,0,'2024-01-09 03:27:38',1,NULL,NULL,'2019-03-19',0,244),(287,3,31,6,'1318Y1910','2019-05-18',21,20,'2024-02-14 03:41:54',1,'2024-02-14 03:55:00',1,'2018-11-19',20,0),(288,4,9,6,'BATCH001','2025-02-01',15,15,'2024-02-14 04:38:21',1,'2024-02-14 04:38:35',1,'2024-02-01',15,15),(289,4,9,6,'BATCH002','2025-02-01',5,4,'2024-02-14 04:38:21',1,'2024-02-14 04:38:42',1,'2024-02-01',4,5),(290,4,10,6,'BATCH003','2026-02-01',30,30,'2024-02-14 04:38:21',1,'2024-02-14 04:38:45',1,'2024-02-01',30,30),(291,4,10,6,'BATCH004','2026-02-02',20,20,'2024-02-14 04:38:21',1,'2024-02-14 04:38:49',1,'2024-02-02',10,20),(292,4,31,6,'1318Y1910','2019-05-18',21,21,'2024-02-14 04:38:21',1,'2024-02-14 04:38:27',1,'2018-11-19',NULL,0);
/*!40000 ALTER TABLE `cycle_count_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cycle_count_details_upload_temp`
--

DROP TABLE IF EXISTS `cycle_count_details_upload_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cycle_count_details_upload_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `document_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cycle_count_details_upload_temp`
--

LOCK TABLES `cycle_count_details_upload_temp` WRITE;
/*!40000 ALTER TABLE `cycle_count_details_upload_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cycle_count_details_upload_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cycle_count_header`
--

DROP TABLE IF EXISTS `cycle_count_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cycle_count_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'LOGGED',
  `document_date` date DEFAULT NULL,
  `reference` varchar(80) CHARACTER SET utf8mb4 DEFAULT NULL,
  `remarks` mediumtext CHARACTER SET utf8mb4,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `cycle_count_type_code` varchar(45) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'ITEM',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `overall_inventory` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `posted_by` (`posted_by`),
  KEY `cancelled_by` (`cancelled_by`),
  KEY `type` (`cycle_count_type_code`),
  CONSTRAINT `cycle_count_header_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_header_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_header_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_header_ibfk_4` FOREIGN KEY (`posted_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_header_ibfk_5` FOREIGN KEY (`cancelled_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_header_ibfk_6` FOREIGN KEY (`cycle_count_type_code`) REFERENCES `cycle_count_type` (`code`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cycle_count_header`
--

LOCK TABLES `cycle_count_header` WRITE;
/*!40000 ALTER TABLE `cycle_count_header` DISABLE KEYS */;
INSERT INTO `cycle_count_header` VALUES (1,'CC00000001','POSTED','2024-01-09',NULL,NULL,'2024-01-09 03:27:38',1,NULL,NULL,53,'2024-01-09 03:52:08',1,NULL,NULL,'ITEM',NULL,NULL,0),(2,'CC00000002','LOGGED','2024-02-01',NULL,NULL,'2024-02-01 14:10:38',1,NULL,NULL,49,NULL,NULL,NULL,NULL,'ITEM',NULL,NULL,0),(3,'CC00000003','LOGGED','2024-02-14',NULL,NULL,'2024-02-14 03:41:54',1,NULL,NULL,50,NULL,NULL,NULL,NULL,'ITEM',NULL,NULL,0),(4,'CC00000004','LOGGED','2024-02-14',NULL,NULL,'2024-02-14 04:38:21',1,NULL,NULL,50,NULL,NULL,NULL,NULL,'ITEM',NULL,NULL,0);
/*!40000 ALTER TABLE `cycle_count_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cycle_count_scanned_items`
--

DROP TABLE IF EXISTS `cycle_count_scanned_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cycle_count_scanned_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_count_header_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(200) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `weight` double DEFAULT NULL,
  `barcode_quantity` double DEFAULT NULL,
  `barcode_uom_id` int(11) DEFAULT NULL,
  `barcode_weight` double DEFAULT NULL,
  `box_number` varchar(120) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `barcode_uom_id` (`barcode_uom_id`),
  KEY `cycle_count_header_id` (`cycle_count_header_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `cycle_count_scanned_items_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_scanned_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_scanned_items_ibfk_3` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_scanned_items_ibfk_4` FOREIGN KEY (`barcode_uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_scanned_items_ibfk_5` FOREIGN KEY (`cycle_count_header_id`) REFERENCES `cycle_count_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cycle_count_scanned_items_ibfk_6` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cycle_count_scanned_items`
--

LOCK TABLES `cycle_count_scanned_items` WRITE;
/*!40000 ALTER TABLE `cycle_count_scanned_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cycle_count_scanned_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cycle_count_type`
--

DROP TABLE IF EXISTS `cycle_count_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cycle_count_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `description` varchar(80) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cycle_count_type`
--

LOCK TABLES `cycle_count_type` WRITE;
/*!40000 ALTER TABLE `cycle_count_type` DISABLE KEYS */;
INSERT INTO `cycle_count_type` VALUES (1,'ITEM','Item Only','2021-01-26 16:58:46'),(2,'LOTEXP','With Lot & Expiry','2021-01-26 16:58:46');
/*!40000 ALTER TABLE `cycle_count_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_day`
--

DROP TABLE IF EXISTS `delivery_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_day`
--

LOCK TABLES `delivery_day` WRITE;
/*!40000 ALTER TABLE `delivery_day` DISABLE KEYS */;
INSERT INTO `delivery_day` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `delivery_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disposition`
--

DROP TABLE IF EXISTS `disposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disposition`
--

LOCK TABLES `disposition` WRITE;
/*!40000 ALTER TABLE `disposition` DISABLE KEYS */;
INSERT INTO `disposition` VALUES (8,'GOOD STOCKS','GOOD STOCKS','2018-12-22 05:21:54',1,'2019-01-03 14:07:50',1,1,1),(9,'BAD STOCKS','BAD STOCKS','2018-12-22 05:22:03',1,'2019-01-03 14:07:45',1,1,0),(10,'SAMPLE','SAMPLE','2018-12-22 05:22:16',1,'2021-02-23 10:54:52',4,1,0),(11,'FOR EVALUATION','FOR EVALUATION','2023-06-20 15:06:13',1,NULL,NULL,1,0);
/*!40000 ALTER TABLE `disposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_configuration`
--

DROP TABLE IF EXISTS `email_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `port` varchar(30) DEFAULT NULL,
  `email_sent_from` varchar(45) DEFAULT NULL,
  `email_sender` varchar(45) DEFAULT NULL,
  `encryption` varchar(25) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `smtp_authentication_flag` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_configuration`
--

LOCK TABLES `email_configuration` WRITE;
/*!40000 ALTER TABLE `email_configuration` DISABLE KEYS */;
INSERT INTO `email_configuration` VALUES (1,'sg2plcpnl0114.prod.sin2.secureserver.net',NULL,NULL,'587','wbms@tpincorporated.com','WMS Administrator','SSL',0,0);
/*!40000 ALTER TABLE `email_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `for_client`
--

DROP TABLE IF EXISTS `for_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `for_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) NOT NULL,
  `description` varchar(128) NOT NULL,
  `rcv_prefix` varchar(45) DEFAULT NULL,
  `iss_prefix` varchar(45) DEFAULT NULL,
  `iss_number_series` bigint(20) DEFAULT '1',
  `rcv_number_series` bigint(20) DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `address` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `for_client`
--

LOCK TABLES `for_client` WRITE;
/*!40000 ALTER TABLE `for_client` DISABLE KEYS */;
INSERT INTO `for_client` VALUES (22,'NA','NA',NULL,NULL,1,1,'2023-05-08 02:34:36',1,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `for_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handling_instruction`
--

DROP TABLE IF EXISTS `handling_instruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handling_instruction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handling_instruction`
--

LOCK TABLES `handling_instruction` WRITE;
/*!40000 ALTER TABLE `handling_instruction` DISABLE KEYS */;
INSERT INTO `handling_instruction` VALUES (1,'FR','Fragile','2020-06-10 09:16:17',1,NULL,NULL,1),(2,'PE','Perishable','2020-06-10 09:16:36',1,NULL,NULL,1),(3,'DG','Dangerous Goods','2020-06-10 09:16:45',1,NULL,NULL,1);
/*!40000 ALTER TABLE `handling_instruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_closing`
--

DROP TABLE IF EXISTS `inventory_closing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_closing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `pallet_number` varchar(80) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  `base_quantity` tinyint(1) DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `remarks` text,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `item_id` (`item_id`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_closing`
--

LOCK TABLES `inventory_closing` WRITE;
/*!40000 ALTER TABLE `inventory_closing` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_closing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_management_history`
--

DROP TABLE IF EXISTS `inventory_management_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_management_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `description` varchar(80) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lot_number` varchar(80) NOT NULL,
  `lot_number_new` varchar(80) DEFAULT NULL,
  `expiry_date_old` date DEFAULT NULL,
  `expiry_date_new` date DEFAULT NULL,
  `mfg_date_old` date DEFAULT NULL,
  `mfg_date_new` date DEFAULT NULL,
  `on_hold_flag_old` tinyint(1) DEFAULT NULL,
  `on_hold_flag_new` tinyint(1) DEFAULT NULL,
  `disposition_old` varchar(128) DEFAULT NULL,
  `disposition_new` varchar(128) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `remarks` text,
  `for_client_id` int(11) DEFAULT NULL,
  `item_id_new` int(11) DEFAULT NULL,
  `pallet_number` varchar(200) DEFAULT NULL,
  `base_quantity` double NOT NULL,
  `weight` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_management_history`
--

LOCK TABLES `inventory_management_history` WRITE;
/*!40000 ALTER TABLE `inventory_management_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_management_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_details`
--

DROP TABLE IF EXISTS `issuance_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issuance_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lot_number` varchar(80) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `base_quantity` double DEFAULT NULL,
  `weight` decimal(24,4) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `pallet_number` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issuance_header_id` (`issuance_header_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `issuance_details_ibfk_1` FOREIGN KEY (`issuance_header_id`) REFERENCES `issuance_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issuance_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `issuance_details_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_details`
--

LOCK TABLES `issuance_details` WRITE;
/*!40000 ALTER TABLE `issuance_details` DISABLE KEYS */;
INSERT INTO `issuance_details` VALUES (1,1,31,12,'1318Y1910','2019-05-18',21,0.0000,'2018-11-19',NULL),(2,2,9,25,'2-1152',NULL,400,0.0000,'2022-03-07',NULL),(3,3,12,37,'10-484128',NULL,15,1814.0000,'2022-09-24',NULL);
/*!40000 ALTER TABLE `issuance_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_dispatch`
--

DROP TABLE IF EXISTS `issuance_dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issuance_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `weight` decimal(24,4) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `pallet_number` varchar(80) DEFAULT NULL,
  `box_number` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issuance_header_id` (`issuance_header_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `issuance_dispatch_ibfk_1` FOREIGN KEY (`issuance_header_id`) REFERENCES `issuance_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issuance_dispatch_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `issuance_dispatch_ibfk_3` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `issuance_dispatch_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_dispatch`
--

LOCK TABLES `issuance_dispatch` WRITE;
/*!40000 ALTER TABLE `issuance_dispatch` DISABLE KEYS */;
INSERT INTO `issuance_dispatch` VALUES (1,1,31,'1318Y1910','2019-05-18',4,21,21,'2023-12-14 14:00:58',1,NULL,'2018-11-19',NULL,NULL),(2,2,9,'2-1152',NULL,3,400,400,'2023-12-14 17:12:02',1,0.0000,'2022-03-07',NULL,'000000000004'),(3,3,12,'10-484128',NULL,3,15,15,'2024-01-09 00:01:12',1,NULL,'2022-09-24',NULL,NULL);
/*!40000 ALTER TABLE `issuance_dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_header`
--

DROP TABLE IF EXISTS `issuance_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(80) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `picklist_flag` tinyint(1) NOT NULL DEFAULT '1',
  `picklist_header_id` int(11) DEFAULT NULL,
  `reference_type` varchar(10) NOT NULL,
  `reference_number` varchar(80) NOT NULL,
  `transfer_order_header_id` int(11) DEFAULT NULL,
  `sales_order_header_id` int(11) DEFAULT NULL,
  `purchase_return_header_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `cancelled_date` date DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `dr_number` varchar(80) DEFAULT NULL,
  `si_number` varchar(80) DEFAULT NULL,
  `trucking_id` int(11) DEFAULT NULL,
  `vehicle_type_id` int(11) DEFAULT NULL,
  `driver_name` varchar(128) DEFAULT NULL,
  `plate_number` varchar(80) DEFAULT NULL,
  `van_number` varchar(80) DEFAULT NULL,
  `seal_number` varchar(80) DEFAULT NULL,
  `delivery_instruction` text,
  `dispatched_date` datetime DEFAULT NULL,
  `dispatched_by` int(11) DEFAULT NULL,
  `tagged_as_dispatched_date` datetime DEFAULT NULL,
  `tagged_as_dispatched_by` int(11) DEFAULT NULL,
  `date_delivered` datetime DEFAULT NULL,
  `received_by` varchar(128) DEFAULT NULL,
  `tagged_as_delivered_date` datetime DEFAULT NULL,
  `tagged_as_delivered_by` int(11) DEFAULT NULL,
  `ax_number` varchar(80) DEFAULT NULL,
  `purchase_order_header_id` int(11) DEFAULT NULL,
  `store_warehouse_id` int(11) DEFAULT NULL,
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  `user_defined_field6` varchar(128) DEFAULT NULL,
  `user_defined_field7` varchar(128) DEFAULT NULL,
  `user_defined_field8` varchar(128) DEFAULT NULL,
  `client_transaction_number` varchar(45) DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  `stock_withdrawal_header_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `cancelled_by` (`cancelled_by`),
  KEY `transfer_order_header_id` (`transfer_order_header_id`),
  KEY `trucking_id` (`trucking_id`),
  KEY `vehicle_type_id` (`vehicle_type_id`),
  KEY `dispatched_by` (`dispatched_by`),
  KEY `tagged_as_dispatched_by` (`tagged_as_dispatched_by`),
  KEY `tagged_as_delivered_by` (`tagged_as_delivered_by`),
  KEY `purchase_order_header_id` (`purchase_order_header_id`),
  KEY `warehouse_destination_id` (`store_warehouse_id`),
  KEY `for_client_id` (`for_client_id`),
  KEY `stock_withdrawal_header_id` (`stock_withdrawal_header_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `issuance_header_ibfk_1` FOREIGN KEY (`stock_withdrawal_header_id`) REFERENCES `stock_withdrawal_header` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `issuance_header_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_header`
--

LOCK TABLES `issuance_header` WRITE;
/*!40000 ALTER TABLE `issuance_header` DISABLE KEYS */;
INSERT INTO `issuance_header` VALUES (1,'ISS00000001','DELIVERED',53,1,1,'TO','TO00000001',1,NULL,NULL,'2023-12-14 14:00:49',1,'2023-12-14 14:03:48',1,NULL,NULL,'DR00000001','',NULL,NULL,'','','','','','2023-12-14 14:00:00',1,'2023-12-14 14:00:58',1,'2023-12-14 14:03:00','test','2023-12-14 14:03:48',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'ISS00000002','DISPATCHED',53,1,3,'TO','TO00000002',2,NULL,NULL,'2023-12-14 17:11:40',1,NULL,NULL,NULL,NULL,'Na','Na',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-14 17:12:23',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'ISS00000003','DISPATCHED',53,1,4,'TO','TO00000003',3,NULL,NULL,'2024-01-08 23:33:26',1,'2024-01-09 00:01:12',1,NULL,NULL,'dr123','1234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-09 00:05:06',1,'2024-01-09 00:01:12',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `issuance_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_staging`
--

DROP TABLE IF EXISTS `issuance_staging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_staging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `transfer_order_header_id` int(11) DEFAULT NULL,
  `sales_order_header_id` int(11) DEFAULT NULL,
  `purchase_return_header_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lot_number` varchar(80) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `base_quantity` double NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `purchase_order_header_id` int(11) DEFAULT NULL,
  `store_warehouse_id` int(11) DEFAULT NULL,
  `stock_withdrawal_header_id` int(11) DEFAULT NULL,
  `pallet_number` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  KEY `created_by` (`created_by`),
  KEY `transfer_order_header_id` (`transfer_order_header_id`),
  KEY `purchase_order_header_id` (`purchase_order_header_id`),
  KEY `store_warehouse_id` (`store_warehouse_id`),
  KEY `stock_withdrawal_header_id` (`stock_withdrawal_header_id`),
  KEY `pallet_number` (`pallet_number`),
  CONSTRAINT `issuance_staging_ibfk_1` FOREIGN KEY (`stock_withdrawal_header_id`) REFERENCES `stock_withdrawal_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_staging`
--

LOCK TABLES `issuance_staging` WRITE;
/*!40000 ALTER TABLE `issuance_staging` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuance_staging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issued_picklist`
--

DROP TABLE IF EXISTS `issued_picklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issued_picklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `picklist_header_id` (`picklist_header_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `issued_picklist_ibfk_1` FOREIGN KEY (`picklist_header_id`) REFERENCES `picklist_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issued_picklist_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issued_picklist`
--

LOCK TABLES `issued_picklist` WRITE;
/*!40000 ALTER TABLE `issued_picklist` DISABLE KEYS */;
INSERT INTO `issued_picklist` VALUES (1,1,'2023-12-14 14:00:49',1),(2,3,'2023-12-14 17:11:40',1),(3,4,'2024-01-08 23:33:26',1);
/*!40000 ALTER TABLE `issued_picklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active_flag` tinyint(1) DEFAULT '1',
  `code` varchar(80) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `item_type_id` int(11) DEFAULT '2',
  `category_id` int(11) DEFAULT NULL,
  `expiry_flag` tinyint(1) DEFAULT '1',
  `reorder_quantity` double DEFAULT '0',
  `quantity_per_pallet` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `sku_type_id` int(11) DEFAULT NULL,
  `subcategory1_id` int(11) DEFAULT NULL,
  `subcategory2_id` int(11) DEFAULT NULL,
  `fda_reference_number` varchar(80) DEFAULT NULL,
  `validity_date` date DEFAULT NULL,
  `ax_code` varchar(80) DEFAULT NULL,
  `packaging_id` int(11) DEFAULT NULL,
  `srp` double DEFAULT '0',
  `dfp_po_cost` double DEFAULT '0',
  `excise` double DEFAULT '0',
  `vat` double DEFAULT '0',
  `currency_id` int(11) DEFAULT NULL,
  `shelf_life_in_months` int(11) DEFAULT NULL,
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `item_type_id` (`item_type_id`),
  KEY `category_id` (`category_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `brand_id` (`brand_id`),
  KEY `origin_id` (`origin_id`),
  KEY `sku_type_id` (`sku_type_id`),
  KEY `subcategory1_id` (`subcategory1_id`),
  KEY `subcategory2_id` (`subcategory2_id`),
  KEY `packaging_id` (`packaging_id`),
  KEY `currency_id` (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,'PM-CAR-001-002A','CARTON (EURO)','CARTON (EURO)',2,NULL,0,0,NULL,'2023-11-13 08:49:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'PM-POL-001-001B','POLYBAG BLUE (EURO)','POLYBAG BLUE (EURO)',2,NULL,0,0,NULL,'2023-11-13 08:49:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,'PM-TAP-001-007','PACKAGING TAPE 3\"','PACKAGING TAPE 3\"',2,NULL,0,0,NULL,'2023-11-13 08:49:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,'PM-LBL-001-004','THERMAL TRANSFER LABEL','THERMAL TRANSFER LABEL',2,NULL,0,0,NULL,'2023-11-13 08:49:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1,'PM-RIB-001-006','THERMAL TRANSFER RIBBON','THERMAL TRANSFER RIBBON',2,NULL,0,0,NULL,'2023-11-13 08:49:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,'RM-TNP-010-51M-150','0.150 X 846.5 X 848','0.150 X 846.5 X 848',2,NULL,0,0,NULL,'2023-11-13 08:49:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,1,'RM-TNP-010-70M-170','0.170 X 914 X 933.2','0.170 X 914 X 933.2',2,NULL,0,0,NULL,'2023-11-13 08:49:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,1,'RM-TNP-010-63M-150','0.150 X 935 X 952','0.150 X 935 X 952',2,NULL,0,0,NULL,'2023-11-13 08:49:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,1,'AAA','0.150 X 783 X 880','0.150 X 783 X 880',2,NULL,1,0,0,'2023-11-13 08:49:25',NULL,'2024-01-18 00:24:44',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,1,'BBB','0.150 X 870 X 885','0.150 X 870 X 885',2,NULL,1,0,0,'2023-11-13 08:49:25',NULL,'2024-01-17 18:39:08',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,1,'RM-TNP-010-53M-150','0.150 X 903 X 916','0.150 X 903 X 916',2,NULL,0,0,NULL,'2023-11-13 08:49:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,1,'RM-TNP-010-30M-150','0.150 X 862.6 X 893','0.150 X 862.6 X 893',2,NULL,0,0,NULL,'2023-11-13 08:49:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,1,'RM-TNP-010-30M-155','0.155 X 862.6 X 893','0.155 X 862.6 X 893',2,NULL,0,0,NULL,'2023-11-13 08:49:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,'RM-TNP-010-53M-155','0.155 X 903 X 916','0.155 X 903 X 916',2,NULL,0,0,NULL,'2023-11-13 08:49:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,1,'RM-CTG-003-033','PPG3143-801/C (P10) PRIMER','PPG3143-801/C (P10) PRIMER',2,NULL,1,0,NULL,'2023-11-13 08:49:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,1,'RM-CTG-003-027','PPG 8241-803/A (V18) VARNISH','PPG 8241-803/A (V18) VARNISH',2,NULL,1,0,NULL,'2023-11-13 08:49:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,1,'RM-CTG-003-023','PPG9140-001/B (T10) BUFF','PPG9140-001/B (T10) BUFF',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,1,'RM-CTG-002-017','VALSPAR 9372015 (S40) SIZE','VALSPAR 9372015 (S40) SIZE',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,1,'RM-CTG-002-032','VALSPAR 9372030 (V40) VARNISH','VALSPAR 9372030 (V40) VARNISH',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,1,'RM-CTG-002-029','VALSPAR V32S68EA (P30) PRIMER','VALSPAR V32S68EA (P30) PRIMER',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,1,'RM-CTG-002-030','VALSPAR V28S22ED (T30) BUFF','VALSPAR V28S22ED (T30) BUFF',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,1,'RM-CTG-003-030','PPG6650-401/A (P32) PRIMER','PPG6650-401/A (P32) PRIMER',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,1,'RM-CTG-003-031','PPG6250-402/A (T32) BUFF','PPG6250-402/A (T32) BUFF',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,1,'RM-CTG-005-007','METLAC WHITE 898010 (W17)','METLAC WHITE 898010 (W17)',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,1,'RM-CTG-005-008','METLAC POLYESTER VARNISH 815655 (V17)','METLAC POLYESTER VARNISH 815655 (V17)',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,1,'RM-CTG-005-003','METLAC G62 POLYESTER GOLD 814524','METLAC G62 POLYESTER GOLD 814524',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,1,'RM-CTG-005-006','METLAC CLEAR SIZE 815095','METLAC CLEAR SIZE 815095',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,1,'RM-CTG-002-016','VALSPAR 5061-060 (G40)  GOLD','VALSPAR 5061-060 (G40)  GOLD',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,1,'RM-CTG-006-001','GS 806-2 EDSON VARNISH','GS 806-2 EDSON VARNISH',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,1,'RM-CTG-006-002','GS 1157 EDSON WHITE','GS 1157 EDSON WHITE',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,1,'RM-CTG-007-002','W-48 LUG TOYO INK WHITE','W-48 LUG TOYO INK WHITE',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,1,'RM-CTG-007-001','F-48 PE-1 (3%) TOYO INK VARNISH','F-48 PE-1 (3%) TOYO INK VARNISH',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,1,'RM-CTG-003-020','PPG 8130-001/C (W14) WHITE','PPG 8130-001/C (W14) WHITE',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,1,'RM-CTG-002-027','VALSPAR 8513A34R/9D (T13) BUFF','VALSPAR 8513A34R/9D (T13) BUFF',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,1,'RM-CTG-003-032','PPG5077-801/B CLEAR VARNISH (V18)','PPG5077-801/B CLEAR VARNISH (V18)',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,1,'RM-CTG-003-029','G32 PPG 6291-304/A-DCNA GOLD','G32 PPG 6291-304/A-DCNA GOLD',2,NULL,1,0,NULL,'2023-11-13 08:49:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,1,'RM-CPD-001-038','038 COMPOUND','038 COMPOUND',2,NULL,1,0,NULL,'2023-11-13 08:50:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,1,'RM-CPD-001-467','467 COMPOUND','467 COMPOUND',2,NULL,1,0,NULL,'2023-11-13 08:50:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,1,'RM-CPD-001-469','469 COMPOUND','469 COMPOUND',2,NULL,1,0,NULL,'2023-11-13 08:50:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,1,'RM-CPD-001-863-P14','863 COMPOUND','863 COMPOUND',2,NULL,1,0,NULL,'2023-11-13 08:50:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,1,'RM-CPD-001-282','282 COMPOUND','282 COMPOUND',2,NULL,1,0,NULL,'2023-11-13 08:50:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,1,'RM-TNP-010-63M-151','0.150 X 935 X 953','0.150 X 935 X 953',2,NULL,0,0,NULL,'2023-11-17 06:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,1,'RM-TNP-010-63M-152','0.150 X 935 X 954','0.150 X 935 X 954',2,NULL,0,0,NULL,'2023-11-17 06:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,1,'RM-INK-30-076','TL HP S HC BLACK-PH TOYO','TL HP S HC BLACK-PH TOYO',2,NULL,0,0,NULL,'2023-11-17 07:06:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,1,'RM-INK-30-080','LKK DIC1052 RED INK','LKK DIC1052 RED INK',2,NULL,0,0,NULL,'2023-11-17 07:06:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,1,'RM-INK-30-081','LKK DIC1028 ORANGE INK','LKK DIC1028 ORANGE INK',2,NULL,0,0,NULL,'2023-11-17 07:06:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,1,'RM-INK-38-051','MO-2842 TL SINGLONG GOLD','MO-2842 TL SINGLONG GOLD',2,NULL,0,0,NULL,'2023-11-17 07:06:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,1,'ITEM CODE','ITEM NAME','ITEM NAME',2,NULL,1,0,NULL,'2023-11-21 13:54:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,1,'CODE','DESCRIPTION','DESCRIPTION',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,1,'PRODUCTION','PRODUCTION','PRODUCTION',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,1,'PRODUCTION N/U','NON-USABLE','NON-USABLE',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,1,'LITHO','LITHO','LITHO',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,1,'LITHO N/U','NON-USABLE','NON-USABLE',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,1,'LITHO INK','LITHO INK','LITHO INK',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,1,'ROWELL','ROWELL','ROWELL',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,1,'OTC','OTC','OTC',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,1,'BCC','BCC','BCC',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,1,'WHSE-LB','LOADING BAY','LOADING BAY',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,1,'WHSE-LB F/E','WHSE-LB FOR EVALUATION','WHSE-LB FOR EVALUATION',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,1,'WHSE-PM','PACKAGING MATERIALS','PACKAGING MATERIALS',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,1,'WHSE-CTG','COATINGS','COATINGS',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,1,'WHSE-CTG N/U','NON-USABLE COATINGS','NON-USABLE COATINGS',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,1,'WHSE-CPD','COMPOUND','COMPOUND',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,1,'WHSE-CPD N/U','NON-USABLE COMPOUND','NON-USABLE COMPOUND',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,1,'TNP LINE 1','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,1,'TNP LINE 2','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,1,'TNP LINE 3','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,1,'TNP LINE 4','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,1,'TNP LINE 5','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,1,'TNP LINE 6','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,1,'TNP LINE 7','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,1,'TNP LINE 8','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,1,'TNP LINE 9','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,1,'TNP LINE 10','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,1,'TNP LINE 11','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,1,'TNP LINE 12','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,1,'TNP LINE 13','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,1,'TNP LINE 14','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,1,'TNP LINE 15','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,1,'TNP LINE 16','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,1,'TNP LINE 17','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,1,'TNP LINE 18','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,1,'TNP LINE 19','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,1,'TNP LINE 20','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,1,'TNP LINE 21','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,1,'TNP LINE 22','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,1,'TNP LINE 23','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,1,'TNP LINE 24','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,1,'TNP LINE 25','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,1,'TNP LINE 26','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,1,'TNP LINE 27','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,1,'TNP LINE 28','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,1,'TNP LINE 29','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,1,'TNP LINE 30','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,1,'TNP LINE 31','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,1,'TNP LINE 32','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,1,'TNP LINE 33','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,1,'TNP LINE 34','RAW TINPLATES','RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,1,'TNP  N/U','NON-USABLE RAW TINPLATES','NON-USABLE RAW TINPLATES',2,NULL,1,0,NULL,'2023-11-21 13:54:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_assembly`
--

DROP TABLE IF EXISTS `item_assembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_assembly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `component_base_quantity` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `item_id` (`item_id`),
  KEY `component_id` (`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_assembly`
--

LOCK TABLES `item_assembly` WRITE;
/*!40000 ALTER TABLE `item_assembly` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_assembly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cost_history`
--

DROP TABLE IF EXISTS `item_cost_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_cost_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `srp` double DEFAULT '0',
  `dfp_po_cost` double DEFAULT '0',
  `excise` double DEFAULT '0',
  `vat` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cost_history`
--

LOCK TABLES `item_cost_history` WRITE;
/*!40000 ALTER TABLE `item_cost_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_cost_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_plu`
--

DROP TABLE IF EXISTS `item_plu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_plu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_unit_flag` tinyint(1) NOT NULL,
  `active_flag` tinyint(1) NOT NULL DEFAULT '1',
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `cost` double NOT NULL DEFAULT '0',
  `length` double NOT NULL DEFAULT '0',
  `width` double NOT NULL DEFAULT '0',
  `height` double NOT NULL DEFAULT '0',
  `cbm` double NOT NULL DEFAULT '0',
  `weight` double NOT NULL DEFAULT '0',
  `sales_order_flag` tinyint(1) DEFAULT '0',
  `purchase_order_flag` tinyint(1) DEFAULT '0',
  `description` varchar(80) DEFAULT NULL,
  `minimum_order_quantity` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `whole_unit_flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `item_plu_ibfk_1` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_plu`
--

LOCK TABLES `item_plu` WRITE;
/*!40000 ALTER TABLE `item_plu` DISABLE KEYS */;
INSERT INTO `item_plu` VALUES (1,1,1,1,1,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:14',NULL,NULL,NULL,0),(2,1,1,2,1,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:14',NULL,NULL,NULL,0),(3,1,1,3,2,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:14',NULL,NULL,NULL,0),(4,1,1,4,2,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:14',NULL,NULL,NULL,0),(5,1,1,5,2,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:14',NULL,NULL,NULL,0),(6,1,1,6,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:24',NULL,NULL,NULL,0),(7,1,1,7,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:24',NULL,NULL,NULL,0),(8,1,1,8,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:25',NULL,NULL,NULL,0),(9,1,1,9,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:25',NULL,NULL,NULL,0),(10,1,1,10,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:25',NULL,NULL,NULL,0),(11,1,1,11,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:25',NULL,NULL,NULL,0),(12,1,1,12,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:25',NULL,NULL,NULL,0),(13,1,1,13,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:25',NULL,NULL,NULL,0),(14,1,1,14,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:25',NULL,NULL,NULL,0),(15,1,1,15,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:50',NULL,NULL,NULL,0),(16,1,1,16,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:50',NULL,NULL,NULL,0),(17,1,1,17,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(18,1,1,18,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(19,1,1,19,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(20,1,1,20,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(21,1,1,21,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(22,1,1,22,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(23,1,1,23,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(24,1,1,24,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(25,1,1,25,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(26,1,1,26,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(27,1,1,27,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(28,1,1,28,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(29,1,1,29,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(30,1,1,30,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(31,1,1,31,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(32,1,1,32,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(33,1,1,33,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(34,1,1,34,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(35,1,1,35,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(36,1,1,36,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:49:51',NULL,NULL,NULL,0),(37,1,1,37,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:50:03',NULL,NULL,NULL,0),(38,1,1,38,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:50:03',NULL,NULL,NULL,0),(39,1,1,39,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:50:03',NULL,NULL,NULL,0),(40,1,1,40,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:50:03',NULL,NULL,NULL,0),(41,1,1,41,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-13 08:50:03',NULL,NULL,NULL,0),(42,1,1,42,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-17 06:35:23',NULL,NULL,NULL,0),(43,1,1,43,3,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-17 06:35:23',NULL,NULL,NULL,0),(44,1,1,44,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-17 07:06:55',NULL,NULL,NULL,0),(45,1,1,45,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-17 07:06:55',NULL,NULL,NULL,0),(46,1,1,46,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-17 07:06:55',NULL,NULL,NULL,0),(47,1,1,47,4,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-17 07:06:55',NULL,NULL,NULL,0),(48,1,1,48,5,1,NULL,0,0,0,0,0,0,0,0,0,NULL,0,'2023-11-21 13:54:57',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `item_plu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_supplier`
--

DROP TABLE IF EXISTS `item_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_supplier`
--

LOCK TABLES `item_supplier` WRITE;
/*!40000 ALTER TABLE `item_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_type`
--

DROP TABLE IF EXISTS `item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_type`
--

LOCK TABLES `item_type` WRITE;
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` VALUES (1,'ASSEMBLY'),(2,'PART'),(3,'SERVICE');
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_warehouse_reorder_quantity`
--

DROP TABLE IF EXISTS `item_warehouse_reorder_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_warehouse_reorder_quantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_warehouse_reorder_quantity`
--

LOCK TABLES `item_warehouse_reorder_quantity` WRITE;
/*!40000 ALTER TABLE `item_warehouse_reorder_quantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_warehouse_reorder_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode_of_transport`
--

DROP TABLE IF EXISTS `mode_of_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mode_of_transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_of_transport`
--

LOCK TABLES `mode_of_transport` WRITE;
/*!40000 ALTER TABLE `mode_of_transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `mode_of_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origin`
--

DROP TABLE IF EXISTS `origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origin`
--

LOCK TABLES `origin` WRITE;
/*!40000 ALTER TABLE `origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packaging`
--

DROP TABLE IF EXISTS `packaging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packaging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packaging_type` varchar(45) NOT NULL,
  `code` varchar(80) NOT NULL,
  `description` varchar(80) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `multiplier` double DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packaging`
--

LOCK TABLES `packaging` WRITE;
/*!40000 ALTER TABLE `packaging` DISABLE KEYS */;
/*!40000 ALTER TABLE `packaging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pallet`
--

DROP TABLE IF EXISTS `pallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pallet_number` varchar(80) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `stock_receipt_header_id` int(11) DEFAULT NULL,
  `reference_number` varchar(80) DEFAULT NULL,
  `remarks` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pallet_number` (`pallet_number`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `location_id` (`location_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `stock_receipt_header_id` (`stock_receipt_header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pallet`
--

LOCK TABLES `pallet` WRITE;
/*!40000 ALTER TABLE `pallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pallet_inventory`
--

DROP TABLE IF EXISTS `pallet_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pallet_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pallet_number` varchar(80) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `stock_receipt_header_id` int(11) DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pallet_number` (`pallet_number`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `stock_receipt_header_id` (`stock_receipt_header_id`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pallet_inventory`
--

LOCK TABLES `pallet_inventory` WRITE;
/*!40000 ALTER TABLE `pallet_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `pallet_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pallet_stock_card`
--

DROP TABLE IF EXISTS `pallet_stock_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pallet_stock_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pallet_number` varchar(80) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `base_quantity` double NOT NULL,
  `movement` varchar(80) NOT NULL,
  `module` varchar(80) NOT NULL,
  `description` varchar(80) NOT NULL,
  `transaction_number` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pallet_number` (`pallet_number`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pallet_stock_card`
--

LOCK TABLES `pallet_stock_card` WRITE;
/*!40000 ALTER TABLE `pallet_stock_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `pallet_stock_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pallet_temp`
--

DROP TABLE IF EXISTS `pallet_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pallet_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pallet_number` varchar(80) DEFAULT NULL,
  `balance` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pallet_temp`
--

LOCK TABLES `pallet_temp` WRITE;
/*!40000 ALTER TABLE `pallet_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `pallet_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_inventory`
--

DROP TABLE IF EXISTS `physical_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physical_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(128) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double NOT NULL,
  `base_quantity` double NOT NULL,
  `on_hold_flag` tinyint(1) NOT NULL DEFAULT '0',
  `cycle_count_flag` tinyint(1) NOT NULL DEFAULT '0',
  `disposition` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `for_client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_id_2` (`location_id`,`item_id`,`lot_number`,`expiry_date`,`for_client_id`),
  KEY `location_id` (`location_id`),
  KEY `item_id` (`item_id`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2073 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_inventory`
--

LOCK TABLES `physical_inventory` WRITE;
/*!40000 ALTER TABLE `physical_inventory` DISABLE KEYS */;
INSERT INTO `physical_inventory` VALUES (604,8,17,'BDC378564','2024-01-10','2023-07-14',440,440,0,0,'GOOD STOCKS','2023-11-17 07:04:27',NULL),(605,8,24,'TEO407','2023-11-22','2023-05-26',480,480,0,0,'GOOD STOCKS','2023-11-17 07:04:27',NULL),(606,8,25,'TEO154','2023-11-08','2023-06-01',400,400,0,0,'GOOD STOCKS','2023-11-17 07:04:27',NULL),(607,8,8,'',NULL,'2022-07-20',1240,1240,0,0,'GOOD STOCKS','2023-11-17 07:05:08',NULL),(1779,11,1,'SC001',NULL,'2023-10-07',0,12200,0,0,'GOOD STOCKS','2023-11-21 15:04:30',NULL),(1780,11,2,'PPMC001',NULL,'2023-10-06',0,8510,0,0,'GOOD STOCKS','2023-11-21 15:04:30',NULL),(1781,11,3,'SL001',NULL,'2023-10-25',0,800,0,0,'GOOD STOCKS','2023-11-21 15:04:31',NULL),(1782,11,4,'LBL001',NULL,'2023-10-24',0,45,0,0,'GOOD STOCKS','2023-11-21 15:04:31',NULL),(1783,11,5,'RBN001',NULL,'2023-10-24',0,20,0,0,'GOOD STOCKS','2023-11-21 15:04:31',NULL),(1784,16,6,'6-1038',NULL,'2022-07-04',14216,16800,0,0,'GOOD STOCKS','2023-11-21 15:04:31',NULL),(1785,16,6,'6-1037',NULL,'2022-07-04',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:31',NULL),(1786,16,6,'6-1069',NULL,'2022-07-04',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1787,16,6,'6-1040',NULL,'2022-07-04',10662,12600,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1788,16,6,'6-1039',NULL,'2022-07-04',8885,10500,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1789,16,6,'6-1033',NULL,'2022-07-04',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1790,16,6,'6-1034',NULL,'2022-07-01',3554,4200,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1791,16,6,'6-1033',NULL,'2022-07-01',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1792,18,7,'6-0926',NULL,'2022-07-06',8535,7500,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1793,18,7,'6-0925',NULL,'2022-07-06',15363,13500,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1794,18,7,'6-0912',NULL,'2022-07-06',8535,7500,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1795,18,7,'4-0864',NULL,'2022-04-23',6828,6000,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1796,18,7,'6-0912',NULL,'2022-04-23',1707,1500,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1797,18,7,'6-0931',NULL,'2022-07-06',10242,9000,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1798,18,7,'6-0930',NULL,'2022-07-06',6828,6000,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1799,18,7,'6-0921',NULL,'2022-07-06',1707,1500,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1800,19,8,'8-0937',NULL,'2022-08-24',16047,15300,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1801,19,8,'8-0989',NULL,'2022-08-24',10698,10200,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1802,19,8,'8-0990',NULL,'2022-08-25',7132,6800,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1803,19,8,'8-0992',NULL,'2022-08-25',8915,8500,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1804,19,8,'8-0991',NULL,'2022-08-25',3566,3400,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1805,19,8,'8-0938',NULL,'2022-08-25',7132,6800,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1806,19,8,'8-0992',NULL,'2022-08-24',1783,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1807,19,8,'8-0988-1',NULL,'2022-08-24',1783,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1808,19,8,'8-0989',NULL,'2022-08-25',3566,3400,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1809,19,8,'8-0938',NULL,'2022-08-24',3566,3400,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1810,20,9,'6-0966',NULL,'2022-06-30',15345,18900,0,0,'GOOD STOCKS','2023-11-21 15:04:32',NULL),(1811,20,9,'6-0965',NULL,'2022-06-30',3410,4200,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1812,20,9,'2-1154',NULL,'2022-03-07',1705,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1813,20,9,'2-1140-2',NULL,'2022-03-07',3410,4200,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1814,21,8,'6-0920',NULL,'2022-07-05',8915,8500,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1815,21,8,'6-0916',NULL,'2022-07-05',1783,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1816,21,8,'6-0922',NULL,'2022-07-05',16047,15300,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1817,21,8,'6-0915',NULL,'2022-07-05',5349,5100,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1818,21,8,'6-0921',NULL,'2022-07-05',1783,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1819,21,8,'6-0923',NULL,'2022-07-05',16047,15300,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1820,21,8,'6-0924',NULL,'2022-07-05',3566,3400,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1821,21,8,'8-0988',NULL,'2022-08-25',1783,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1822,21,8,'8-0990',NULL,'2022-08-25',3566,3400,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1823,22,9,'3-1220',NULL,'2022-03-25',6898,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1824,22,9,'3-1219',NULL,'2022-03-25',13874,16800,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1825,22,9,'3-1221',NULL,'2022-03-26',3410,4200,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1826,22,9,'2-1154',NULL,'2022-03-07',8525,10500,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1827,22,9,'2-1140-2',NULL,'2022-03-07',3410,4200,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1828,23,6,'6-1036',NULL,'2022-07-04',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1829,23,6,'6-1035',NULL,'2022-07-01',12439,14700,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1830,23,6,'6-1034',NULL,'2022-07-01',10662,12600,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1831,23,6,'6-1033',NULL,'2022-07-01',5331,6300,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1832,23,6,'6-1035',NULL,'2022-07-04',3554,4200,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1833,23,6,'6-1037',NULL,'2022-07-04',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1834,23,6,'6-1036',NULL,'2022-07-01',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1835,23,6,'6-1037',NULL,'2022-07-01',5331,6300,0,0,'GOOD STOCKS','2023-11-21 15:04:33',NULL),(1836,24,8,'8-0935',NULL,'2022-08-24',7132,6800,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1837,24,8,'8-0935-1',NULL,'2022-08-24',7132,6800,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1838,24,8,'6-0924',NULL,'2022-07-05',8915,8500,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1839,24,8,'6-0921',NULL,'2022-07-05',1783,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1840,24,8,'8-0934',NULL,'2022-08-24',7132,6800,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1841,25,9,'2-1154',NULL,'2022-03-07',1705,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1842,25,9,'2-1152',NULL,'2022-03-07',1705,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1843,25,9,'3-1221',NULL,'2022-03-26',5115,6300,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1844,25,9,'4-0891',NULL,'2022-04-24',13640,16800,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1845,25,9,'6-0969',NULL,'2022-06-30',3410,4200,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1846,25,9,'6-0968',NULL,'2022-06-30',10230,12600,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1847,25,9,'6-0967',NULL,'2022-06-30',15345,18900,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1848,26,9,'6-0968',NULL,'2022-06-30',5115,6300,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1849,26,9,'6-0969',NULL,'2022-06-30',5115,6300,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1850,26,9,'6-0965',NULL,'2022-06-30',11935,14700,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1851,26,9,'6-0964',NULL,'2022-06-29',8525,10500,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1852,26,9,'6-0964',NULL,'2022-06-30',3410,4200,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1853,26,9,'6-0963',NULL,'2022-06-29',13640,16800,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1854,26,9,'4-0891',NULL,'2022-04-24',3410,4200,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1855,27,10,'8-0998',NULL,'2022-08-25',1633,1800,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1856,27,10,'8-1007',NULL,'2022-08-26',3266,3600,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1857,27,10,'8-1009',NULL,'2022-08-26',8165,9000,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1858,28,10,'8-1005',NULL,'2022-08-26',3266,3600,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1859,28,10,'8-1004',NULL,'2022-08-26',9798,10800,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1860,28,10,'8-1003',NULL,'2022-08-26',14697,16200,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1861,28,10,'6-0953',NULL,'2022-07-07',14697,16200,0,0,'GOOD STOCKS','2023-11-21 15:04:34',NULL),(1862,28,10,'6-0953',NULL,'2022-07-04',1633,1800,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1863,28,10,'8-1001',NULL,'2022-08-25',1633,1800,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1864,28,10,'6-0954',NULL,'2022-07-07',3266,3600,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1865,28,10,'6-0955',NULL,'2022-07-07',1633,1800,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1866,28,10,'6-0952-1',NULL,'2022-07-07',3266,3600,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1867,28,10,'6-0951',NULL,'2022-07-07',3266,3600,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1868,29,11,'Y-0937-2',NULL,'2022-07-06',1753,1800,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1869,29,11,'Y-0645',NULL,'2023-01-03',15777,16200,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1870,29,11,'Y-0647-2',NULL,'2023-01-03',5259,5400,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1871,30,6,'05-482300',NULL,'2022-05-13',10152,12000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1872,30,6,'05-482297',NULL,'2022-05-13',5076,6000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1873,30,6,'05-482301',NULL,'2022-05-13',6768,8000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1874,30,6,'05-482299',NULL,'2022-05-13',10152,12000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1875,31,9,'6-0969',NULL,'2022-06-30',8525,10500,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1876,31,9,'Y-0400',NULL,'2023-01-03',8525,10500,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1877,31,9,'Y-0649',NULL,'2023-01-03',15345,18900,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1878,32,7,'06-482393',NULL,'2022-06-17',2276,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1879,32,7,'06-482196',NULL,'2022-06-17',2276,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1880,32,7,'06-482194',NULL,'2022-06-17',2276,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1881,32,7,'06-482196',NULL,'2022-06-19',2276,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1882,32,7,'06-482383',NULL,'2022-06-19',9104,8000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1883,32,7,'06-482385',NULL,'2022-06-19',6828,6000,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1884,33,10,'8-1009',NULL,'2022-08-26',1633,1800,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1885,33,10,'X-0732',NULL,'2022-11-22',3266,3600,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1886,33,10,'X-0732-1',NULL,'2022-11-22',11431,12600,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1887,33,10,'X-0734',NULL,'2022-11-22',14697,16200,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1888,33,10,'X-0733',NULL,'2022-11-22',6532,7200,0,0,'GOOD STOCKS','2023-11-21 15:04:35',NULL),(1889,34,8,'X-0717',NULL,'2022-11-22',16047,15300,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1890,34,8,'X-0718',NULL,'2022-11-22',16047,15300,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1891,34,8,'8-0993',NULL,'2022-08-25',14264,13600,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1892,34,8,'8-0992',NULL,'2022-08-25',3566,3400,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1893,34,8,'X-0716',NULL,'2022-11-22',5349,5100,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1894,34,8,'X-0716-1',NULL,'2022-11-22',5349,5100,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1895,34,8,'8-0989',NULL,'2022-08-24',1783,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1896,35,7,'2-1114',NULL,'2022-03-06',11949,10500,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1897,35,7,'2-1112-2',NULL,'2022-03-06',3414,3000,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1898,35,7,'4-0862',NULL,'2022-04-23',13656,12000,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1899,35,7,'4-0864',NULL,'2022-04-23',8535,7500,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1900,35,7,'4-0863',NULL,'2022-04-23',15363,13500,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1901,36,10,'8-1007',NULL,'2022-08-26',8165,9000,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1902,36,10,'8-1006',NULL,'2022-08-26',8165,9000,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1903,36,10,'8-1001',NULL,'2022-08-25',11431,12600,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1904,36,10,'8-1002',NULL,'2022-08-25',11431,12600,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1905,36,10,'8-1005',NULL,'2022-08-26',13064,14400,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1906,36,10,'8-1004',NULL,'2022-08-26',4899,5400,0,0,'GOOD STOCKS','2023-11-21 15:04:36',NULL),(1907,36,10,'8-0999',NULL,'2022-08-25',1633,1800,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1908,37,12,'09-484379',NULL,'2022-09-24',5442,6000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1909,37,12,'09-484389',NULL,'2022-09-24',3628,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1910,37,12,'10-484128',NULL,'2022-10-05',3628,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1911,37,12,'09-484385',NULL,'2022-09-24',3628,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1912,37,12,'09-484384',NULL,'2022-09-29',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1913,37,12,'09-482305',NULL,'2022-09-24',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1914,37,12,'09-484684',NULL,'2022-09-24',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1915,37,12,'09-484389',NULL,'2022-10-05',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1916,37,12,'10-484128',NULL,'2022-09-24',0,1985,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1917,37,12,'09-484381',NULL,'2022-09-24',10884,12000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1918,37,12,'09-484382',NULL,'2022-09-24',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1919,37,12,'09-484384',NULL,'2022-09-24',7256,8000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1920,37,12,'09-484387',NULL,'2022-09-24',3628,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1921,39,6,'6-1040',NULL,'2022-07-04',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1922,39,6,'Y-0664',NULL,'2023-01-04',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1923,39,6,'Y-0666',NULL,'2023-01-04',5331,6300,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1924,39,6,'6-1040',NULL,'2023-01-04',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1925,39,6,'Y-0665',NULL,'2023-01-04',5331,6300,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1926,39,6,'Y-0668',NULL,'2023-01-04',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1927,39,6,'Y-0667',NULL,'2023-01-04',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1928,42,7,'Y-0638',NULL,'2022-12-31',8535,7500,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1929,42,7,'2-1112-2',NULL,'2022-03-06',1707,1500,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1930,42,7,'6-0931',NULL,'2022-07-06',6828,6000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1931,42,7,'Y-0639',NULL,'2023-01-03',5121,4500,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1932,42,7,'Y-0638',NULL,'2023-01-03',1707,1500,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1933,43,6,'Y-0666',NULL,'2023-01-04',10662,12600,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1934,43,6,'Y-0665',NULL,'2023-01-04',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1935,43,6,'6-1040',NULL,'2023-01-04',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1936,43,6,'Y-0664',NULL,'2023-01-04',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1937,43,6,'Y-0668-1',NULL,'2023-01-04',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1938,43,6,'Y-0667',NULL,'2023-01-04',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1939,43,6,'Y-0669',NULL,'2023-01-04',10662,12600,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1940,43,6,'Y-0668',NULL,'2023-01-04',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1941,44,9,'07-482341',NULL,'2022-07-27',6496,8000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1942,44,9,'05-482294',NULL,'2022-05-13',3248,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1943,44,9,'05-482292',NULL,'2022-05-13',14616,18000,0,0,'GOOD STOCKS','2023-11-21 15:04:37',NULL),(1944,44,9,'05-482293',NULL,'2022-05-13',9744,12000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1945,45,12,'09-482147',NULL,'2022-09-16',9070,10000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1946,45,12,'09-482322',NULL,'2022-09-23',3628,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1947,45,12,'09-482149',NULL,'2022-09-16',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1948,45,12,'09-482151',NULL,'2022-09-16',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1949,45,12,'09-482125',NULL,'2022-09-13',9070,10000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1950,46,12,'09-484385',NULL,'2022-09-24',5442,6000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1951,46,12,'09-484382',NULL,'2022-09-24',3628,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1952,46,12,'09-482319',NULL,'2022-09-29',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1953,46,12,'09-482305',NULL,'2022-09-29',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1954,46,12,'09-484387',NULL,'2022-09-24',5442,6000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1955,46,12,'09-484389',NULL,'2022-09-24',3628,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1956,46,12,'09-484381',NULL,'2022-09-24',3628,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1957,46,12,'09-484379',NULL,'2022-09-24',3628,4000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1958,46,12,'09-482146',NULL,'2022-09-16',12698,14000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1959,46,12,'09-482147',NULL,'2022-09-16',1814,2000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1960,47,7,'6-0930',NULL,'2022-07-06',8535,7500,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1961,47,7,'6-0929',NULL,'2022-07-06',13656,12000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1962,47,7,'6-0926-1',NULL,'2022-07-06',6828,6000,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1963,47,7,'6-0928',NULL,'2022-07-06',15363,13500,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1964,47,7,'6-0927',NULL,'2022-07-06',15363,13500,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1965,48,6,'6-1030',NULL,'2022-07-01',12439,14700,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1966,48,6,'6-1031',NULL,'2022-07-01',12439,14700,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1967,48,6,'6-1031',NULL,'2022-04-25',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1968,48,6,'4-0906',NULL,'2022-07-01',1777,2100,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1969,48,6,'6-1032',NULL,'2022-07-01',10662,12600,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1970,48,6,'4-0906',NULL,'2022-04-25',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:38',NULL),(1971,48,6,'6-1033',NULL,'2022-07-01',7108,8400,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1972,49,8,'8-0936',NULL,'2022-08-24',12481,11900,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1973,49,8,'8-0934',NULL,'2022-08-24',8915,8500,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1974,49,8,'8-0938',NULL,'2022-08-24',5349,5100,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1975,49,8,'8-0988',NULL,'2022-08-25',8915,8500,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1976,49,8,'8-0988-1',NULL,'2022-08-25',1783,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1977,49,8,'8-0991',NULL,'2022-08-25',12481,11900,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1978,49,8,'8-0990',NULL,'2022-08-25',5349,5100,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1979,49,8,'8-0992',NULL,'2022-08-25',1783,1700,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1980,50,13,'01-484731',NULL,'2019-02-05',1790,1910,1,0,'BAD STOCKS','2023-11-21 15:04:39',NULL),(1981,50,13,'01-484731',NULL,'2019-01-31',7496,8000,1,0,'BAD STOCKS','2023-11-21 15:04:39',NULL),(1982,50,14,'RETURN-001',NULL,'2021-06-01',1510,1510,1,0,'BAD STOCKS','2023-11-21 15:04:39',NULL),(1983,50,14,'RETURN-002',NULL,'2021-06-01',490,490,1,0,'BAD STOCKS','2023-11-21 15:04:39',NULL),(1984,50,14,'RETURN-003',NULL,'2021-06-01',635,635,1,0,'BAD STOCKS','2023-11-21 15:04:39',NULL),(1985,12,15,'GOP134274','2023-10-25','2023-01-26',6270,6270,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1986,12,16,'BDC370458','2023-01-28','2022-08-01',1000,1000,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1987,12,17,'BDC378564','2024-01-10','2023-07-14',3300,3300,0,0,'GOOD STOCKS','2023-11-21 15:04:39',NULL),(1988,12,18,'2V35127471','2023-11-12','2022-11-12',1562,1562,0,0,'GOOD STOCKS','2023-11-21 15:04:40',NULL),(1989,12,18,'3394127754','2024-03-06','2023-03-06',4100.25,4100.25,0,0,'GOOD STOCKS','2023-11-21 15:04:40',NULL),(1990,12,19,'2835126287','2023-08-26','2022-08-26',2631.1800000000007,2631.1800000000007,0,0,'GOOD STOCKS','2023-11-21 15:04:40',NULL),(1991,12,20,'321H060810','2024-02-02','2023-02-02',1600,1600,0,0,'GOOD STOCKS','2023-11-21 15:04:40',NULL),(1992,12,21,'321H060764','2023-11-05','2022-11-05',500,500,0,0,'GOOD STOCKS','2023-11-21 15:04:40',NULL),(1993,12,22,'P131337098','2022-03-22','2021-09-22',440,440,0,0,'GOOD STOCKS','2023-11-21 15:04:40',NULL),(1994,12,23,'P140339688','2022-04-26','2021-10-26',440,440,0,0,'GOOD STOCKS','2023-11-21 15:04:40',NULL),(1995,12,24,'TEO407','2023-11-22','2023-05-26',7440,7440,0,0,'GOOD STOCKS','2023-11-21 15:04:40',NULL),(1996,12,25,'TEO154','2023-11-08','2023-06-01',3000,3000,0,0,'GOOD STOCKS','2023-11-21 15:04:40',NULL),(1997,12,25,'TFO167','2023-12-13','2023-06-16',1000,1000,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(1998,12,26,'TEO361','2023-12-06','2023-06-09',400,400,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(1999,12,27,'TFO429','2023-12-16','2023-06-19',400,400,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2000,12,28,'875C016011','2019-01-22','2018-07-26',394,394,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2001,12,29,'1808083654','2019-02-15','2018-08-15',96,96,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2002,12,30,'1808083655','2019-02-15','2018-08-15',167,167,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2003,12,18,'8635099570','2019-05-10','2018-05-10',569.3,569.3,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2004,12,21,'8W1H045295','2019-09-14','2018-09-14',1635.3,1635.3,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2005,12,17,'BDC338650','2019-11-12','2019-05-19',988.9,988.9,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2006,12,21,'9T1H048489','2020-06-26','2019-06-26',119,119,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2007,12,21,'181H055343','2022-04-04','2021-04-04',76,76,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2008,12,30,'F1808083655','2019-02-15','2018-08-15',219.8,219.8,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2009,12,29,'F1808083654','2019-02-15','2018-08-15',194.8,194.8,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2010,12,31,'1318Y1910','2019-05-18','2018-11-19',81,60,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2011,12,32,'1318Y1909','2019-05-18','2018-11-19',76.8,76.8,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2012,12,17,'BDC351308','2021-01-18','2020-07-22',220,220,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2013,12,28,'FH3310XA3','2021-11-27','2020-11-27',93.65,93.65,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2014,12,33,'BDC351252','2021-01-18','2020-07-22',252.5,252.5,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2015,12,34,'9V1A040676','2020-05-03','2019-11-03',420,420,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2016,12,35,'BDC347233','2020-09-14','2020-03-18',28,28,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2017,12,36,'BDC356440','2021-08-30','2021-03-03',800,800,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2018,12,17,'BDC369082','2023-01-24','2022-07-28',103.95,103.95,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2019,12,33,'BDC370729','2023-02-04','2022-08-08',88.14,88.14,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2020,12,34,'961A039173','2019-11-30','2019-05-30',123,123,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2021,14,37,'2749980112','2024-02-26','2023-03-03',988,988,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2022,14,37,'2749980117','2024-02-26','2023-03-03',759,759,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2023,14,37,'2749980111','2024-02-26','2023-03-03',1261,1261,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2024,14,37,'2749980116','2024-02-26','2023-03-03',1004,1004,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2025,14,38,'2733230199','2023-05-02','2022-11-03',984,984,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2026,14,38,'2733230202','2023-05-02','2022-11-03',984,984,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2027,14,38,'2733230201','2023-05-02','2022-11-03',976,976,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2028,14,38,'2731990011','2023-07-18','2023-01-19',984,984,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2029,14,38,'2731990165','2023-07-17','2023-01-18',984,984,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2030,14,38,'2731990009','2023-07-18','2023-01-19',988,988,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2031,14,38,'2731990010','2023-07-18','2023-01-19',988,988,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2032,14,38,'2731990014','2023-07-18','2023-01-19',992,992,0,0,'GOOD STOCKS','2023-11-21 15:04:41',NULL),(2033,14,38,'2731990012','2023-07-18','2023-01-19',996,996,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2034,14,38,'2731990015','2023-07-18','2023-01-19',996,996,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2035,14,38,'2731990013','2023-07-18','2023-01-19',992,992,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2036,14,39,'2773861026','2024-01-17','2023-07-21',980,980,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2037,14,39,'2773860997','2024-01-13','2023-07-17',996,996,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2038,14,39,'2773861091','2024-01-25','2023-07-29',984,984,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2039,14,39,'2773861047','2024-01-20','2023-07-24',980,980,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2040,14,39,'2773861010','2024-01-15','2023-07-19',980,980,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2041,14,39,'2773861001','2024-01-14','2023-07-18',980,980,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2042,14,39,'2773861009','2024-01-15','2023-07-19',980,980,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2043,14,39,'2773861016','2024-01-16','2023-07-20',976,976,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2044,14,39,'2773861017','2024-01-16','2023-07-20',976,976,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2045,14,39,'2773861002','2024-01-14','2023-07-18',976,976,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2046,14,39,'2773861039','2024-01-18','2023-07-22',980,980,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2047,14,39,'2773861040','2024-01-18','2023-07-22',980,980,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2048,14,39,'2773861048','2024-01-20','2023-07-24',972,972,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2049,14,39,'2773861104','2024-01-28','2023-08-01',984,984,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2050,14,39,'2773861105','2024-01-28','2023-08-01',972,972,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2051,14,39,'2773861025','2024-01-17','2023-07-21',980,980,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2052,14,39,'2773861092','2024-01-25','2023-07-29',984,984,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2053,14,39,'2773861101','2024-01-27','2023-07-31',988,988,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2054,14,39,'2773861100','2024-01-27','2023-07-31',988,988,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2055,14,40,'2698100157','2023-04-30','2022-05-05',1024,1024,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2056,14,40,'2698100155','2023-04-30','2022-05-05',1024,1024,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2057,14,40,'2698100160','2023-05-01','2022-05-06',1020,1020,0,0,'GOOD STOCKS','2023-11-21 15:04:42',NULL),(2058,14,41,'2415360001','2019-09-15','2019-03-19',244,244,0,0,'GOOD STOCKS','2023-11-21 15:04:43',NULL),(2059,14,41,'2415360003','2019-09-15','2019-03-19',984,984,0,0,'GOOD STOCKS','2023-11-21 15:04:43',NULL),(2060,14,41,'2415360002','2019-09-15','2019-03-19',735,735,0,0,'GOOD STOCKS','2023-11-21 15:04:43',NULL),(2061,6,31,'1318Y1910','2019-05-18','2018-11-19',0,21,0,0,'GOOD STOCKS','2023-12-14 14:03:48',NULL),(2062,1,9,'2-1152',NULL,'2022-03-07',0,5200,0,0,'GOOD STOCKS','2023-12-15 00:10:58',NULL),(2063,50,6,'20231215',NULL,'2023-12-01',400,400,1,0,'BAD STOCKS','2023-12-15 12:30:43',NULL),(2064,50,10,'20231215',NULL,'2023-12-01',12,12,1,0,'BAD STOCKS','2023-12-15 12:52:22',NULL),(2065,20,9,'240108',NULL,NULL,0,0,0,0,'GOOD STOCKS','2024-01-09 00:52:59',NULL),(2066,37,9,'240108',NULL,NULL,0,25,0,0,'GOOD STOCKS','2024-01-09 01:02:47',NULL),(2067,11,9,'BATCH001','2024-12-30','2024-01-01',0,1000,0,0,'GOOD STOCKS','2024-01-18 00:28:43',NULL),(2068,11,10,'BATCH002','2024-12-30','2024-01-01',0,0,0,0,'GOOD STOCKS','2024-01-18 00:28:47',NULL),(2069,6,9,'BATCH001','2025-02-01','2024-02-01',15,15,0,0,'GOOD STOCKS','2024-02-14 04:38:12',NULL),(2070,6,9,'BATCH002','2025-02-01','2024-02-01',5,5,0,0,'GOOD STOCKS','2024-02-14 04:38:12',NULL),(2071,6,10,'BATCH003','2026-02-01','2024-02-01',30,30,0,0,'GOOD STOCKS','2024-02-14 04:38:12',NULL),(2072,6,10,'BATCH004','2026-02-02','2024-02-02',20,20,0,0,'GOOD STOCKS','2024-02-14 04:38:12',NULL);
/*!40000 ALTER TABLE `physical_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picking_details`
--

DROP TABLE IF EXISTS `picking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picking_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `remarks` text,
  `pdt_flag` tinyint(1) NOT NULL DEFAULT '0',
  `pallet_number` varchar(80) DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `box_number` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `location_id` (`location_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `pallet_number` (`pallet_number`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picking_details`
--

LOCK TABLES `picking_details` WRITE;
/*!40000 ALTER TABLE `picking_details` DISABLE KEYS */;
INSERT INTO `picking_details` VALUES (1,1,12,31,'1318Y1910','2019-05-18',4,21,21,'2023-12-14 14:00:37',1,'AUTO-GENERATED PICKING',0,NULL,NULL,'2018-11-19',0,NULL),(2,3,25,9,'2-1152',NULL,3,400,400,'2023-12-14 17:11:07',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(3,4,37,12,'10-484128',NULL,3,15,15,'2024-01-08 23:33:21',1,'AUTO-GENERATED PICKING',0,NULL,NULL,'2022-09-24',1814,NULL),(18,6,11,10,'BATCH002','2024-12-30',3,500,500,'2024-01-19 02:43:06',1,NULL,1,NULL,NULL,'2024-01-01',0,'BG000000000034'),(19,6,11,10,'BATCH002','2024-12-30',3,500,500,'2024-01-19 02:47:18',1,NULL,1,NULL,NULL,'2024-01-01',0,'BG000000000033'),(20,6,11,10,'BATCH002','2024-12-30',3,500,500,'2024-01-19 02:47:25',1,NULL,1,NULL,NULL,'2024-01-01',0,'BG000000000035'),(21,6,11,10,'BATCH002','2024-12-30',3,500,500,'2024-01-19 02:47:28',1,NULL,1,NULL,NULL,'2024-01-01',0,'BG000000000036');
/*!40000 ALTER TABLE `picking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picking_group`
--

DROP TABLE IF EXISTS `picking_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picking_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `description` varchar(128) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picking_group`
--

LOCK TABLES `picking_group` WRITE;
/*!40000 ALTER TABLE `picking_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `picking_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picking_group_user`
--

DROP TABLE IF EXISTS `picking_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picking_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picking_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `picking_group_id` (`picking_group_id`),
  KEY `user_id` (`user_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picking_group_user`
--

LOCK TABLES `picking_group_user` WRITE;
/*!40000 ALTER TABLE `picking_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `picking_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_details`
--

DROP TABLE IF EXISTS `picklist_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_details`
--

LOCK TABLES `picklist_details` WRITE;
/*!40000 ALTER TABLE `picklist_details` DISABLE KEYS */;
INSERT INTO `picklist_details` VALUES (1,1,9,400,'2023-12-14 14:00:11'),(2,1,31,21,'2023-12-14 14:00:11'),(4,2,9,400,'2023-12-14 17:06:35'),(5,3,9,400,'2023-12-14 17:09:19'),(6,4,12,15,'2024-01-08 21:07:37'),(7,5,9,1000,'2024-01-17 17:07:34'),(8,6,10,2000,'2024-01-18 00:39:20'),(9,7,15,28.25,'2024-01-24 17:49:01');
/*!40000 ALTER TABLE `picklist_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_header`
--

DROP TABLE IF EXISTS `picklist_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(40) NOT NULL,
  `document_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `warehouse_id` int(11) NOT NULL,
  `picklist_type_code` varchar(10) NOT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `picking_group_id` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  `issued_date` datetime DEFAULT NULL,
  `issued_by` int(11) DEFAULT NULL,
  `printed_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `closed_by` (`closed_by`),
  KEY `cancelled_by` (`cancelled_by`),
  KEY `picklist_type_code` (`picklist_type_code`),
  KEY `picklist_header_ibfk_8` (`picking_group_id`),
  KEY `issued_by` (`issued_by`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_header`
--

LOCK TABLES `picklist_header` WRITE;
/*!40000 ALTER TABLE `picklist_header` DISABLE KEYS */;
INSERT INTO `picklist_header` VALUES (1,'PKL00000001','ISSUED','2023-12-14 00:00:00',53,'TO',NULL,'2023-12-14 14:00:01',1,NULL,NULL,'2023-12-14 14:00:16',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-14 14:00:49',1,1),(2,'PKL00000002','POSTED','2023-12-14 00:00:00',53,'TO',NULL,'2023-12-14 17:06:32',1,NULL,NULL,'2023-12-14 17:06:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(3,'PKL00000003','ISSUED','2023-12-14 00:00:00',53,'TO',NULL,'2023-12-14 17:09:16',1,NULL,NULL,'2023-12-14 17:09:22',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-14 17:11:40',1,1),(4,'PKL00000004','ISSUED','2024-01-08 00:00:00',53,'TO',NULL,'2024-01-08 20:51:56',1,NULL,NULL,'2024-01-08 21:10:15',1,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-08 23:33:26',1,1),(5,'PKL00000005','POSTED','2024-01-17 00:00:00',53,'TO',NULL,'2024-01-17 17:07:32',1,NULL,NULL,'2024-01-17 17:07:37',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(6,'PKL00000006','POSTED','2024-01-18 00:00:00',53,'TO',NULL,'2024-01-18 00:39:18',1,NULL,NULL,'2024-01-18 00:39:24',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(7,'PKL00000007','POSTED','2024-01-24 00:00:00',53,'TO',NULL,'2024-01-24 17:48:59',1,NULL,NULL,'2024-01-24 17:49:11',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(8,'PKL00000008','LOGGED','2024-02-05 00:00:00',49,'SO',NULL,'2024-02-05 18:55:38',1,'2024-02-05 18:57:50',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `picklist_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_picker`
--

DROP TABLE IF EXISTS `picklist_picker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_picker` (
  `picklist_header_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`picklist_header_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_picker`
--

LOCK TABLES `picklist_picker` WRITE;
/*!40000 ALTER TABLE `picklist_picker` DISABLE KEYS */;
/*!40000 ALTER TABLE `picklist_picker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_purchase_order`
--

DROP TABLE IF EXISTS `picklist_purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `purchase_order_header_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `purchase_order_header_id` (`purchase_order_header_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_purchase_order`
--

LOCK TABLES `picklist_purchase_order` WRITE;
/*!40000 ALTER TABLE `picklist_purchase_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `picklist_purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_purchase_return`
--

DROP TABLE IF EXISTS `picklist_purchase_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_purchase_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `purchase_return_header_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `purchase_return_header_id` (`purchase_return_header_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_purchase_return`
--

LOCK TABLES `picklist_purchase_return` WRITE;
/*!40000 ALTER TABLE `picklist_purchase_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `picklist_purchase_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_reservation`
--

DROP TABLE IF EXISTS `picklist_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lot_number` varchar(80) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `reserved_quantity` double NOT NULL,
  `picked_quantity` double NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `pallet_number` varchar(80) DEFAULT NULL,
  `auto_reserved_flag` tinyint(1) DEFAULT '1',
  `for_client_id` int(11) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  KEY `created_by` (`created_by`),
  KEY `pallet_number` (`pallet_number`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_reservation`
--

LOCK TABLES `picklist_reservation` WRITE;
/*!40000 ALTER TABLE `picklist_reservation` DISABLE KEYS */;
INSERT INTO `picklist_reservation` VALUES (1,1,31,12,'1318Y1910','2019-05-18',21,21,'2023-12-14 14:00:25',1,NULL,0,NULL,'2018-11-19',0),(2,2,9,25,'2-1152',NULL,400,0,'2023-12-14 17:06:52',1,NULL,1,NULL,'2022-03-07',1705),(3,3,9,25,'2-1152',NULL,400,400,'2023-12-14 17:09:26',1,NULL,1,NULL,'2022-03-07',0),(5,4,12,37,'10-484128',NULL,15,15,'2024-01-08 22:48:33',1,NULL,1,NULL,'2022-09-24',1814),(6,5,9,20,'2-1140-2',NULL,1000,0,'2024-01-18 00:17:16',1,NULL,0,NULL,'2022-03-07',3.45),(15,6,10,11,'BATCH002','2024-12-30',2000,2000,'2024-01-19 02:43:06',1,NULL,1,NULL,'2024-01-01',0),(16,7,15,12,'GOP134274','2023-10-25',28.25,0,'2024-01-24 17:49:19',1,NULL,0,NULL,'2023-01-26',0);
/*!40000 ALTER TABLE `picklist_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_reservation_type`
--

DROP TABLE IF EXISTS `picklist_reservation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_reservation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_type_name` varchar(128) NOT NULL,
  `reservation_details_1` text NOT NULL,
  `reservation_details_2` text NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_reservation_type`
--

LOCK TABLES `picklist_reservation_type` WRITE;
/*!40000 ALTER TABLE `picklist_reservation_type` DISABLE KEYS */;
INSERT INTO `picklist_reservation_type` VALUES (5,'FEFO','order by pallet_inventory.expiry_date asc, pallet_inventory.mfg_date asc, bin_location.location_index asc, bin_location.code asc, bin_location.description asc, pallet_inventory.pallet_number asc, physical_inventory.created_date asc\r\n','order by physical_inventory.expiry_date asc, physical_inventory.expiry_date asc, bin_location.location_index asc, bin_location.code asc, bin_location.description asc, physical_inventory.mfg_date asc',1),(6,'FIFO','order by physical_inventory.created_date asc, pallet_inventory.expiry_date asc, \r\npallet_inventory.mfg_date asc, bin_location.location_index asc, bin_location.code asc, bin_location.description asc, pallet_inventory.pallet_number asc ','order by physical_inventory.created_date asc, physical_inventory.expiry_date asc, physical_inventory.mfg_date asc, bin_location.location_index asc, bin_location.code asc, bin_location.description asc',1),(7,'LOCATION INDEX (FEFO)','order by bin_location.location_index asc, bin_location.code asc, bin_location.description asc, pallet_inventory.expiry_date asc, pallet_inventory.mfg_date asc, physical_inventory.created_date asc, pallet_inventory.pallet_number asc ','order by bin_location.location_index asc, bin_location.code asc, bin_location.description asc, physical_inventory.expiry_date asc,  physical_inventory.mfg_date asc, physical_inventory.created_date asc  ',1),(8,'LOCATION INDEX (FIFO)','order by bin_location.location_index asc, bin_location.code asc, bin_location.description asc, physical_inventory.created_date asc, pallet_inventory.expiry_date asc, \r\npallet_inventory.mfg_date asc, pallet_inventory.pallet_number asc ','order by bin_location.location_index asc, bin_location.code asc, bin_location.description asc, physical_inventory.created_date asc, physical_inventory.expiry_date asc, physical_inventory.mfg_date asc',1);
/*!40000 ALTER TABLE `picklist_reservation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_sales_order`
--

DROP TABLE IF EXISTS `picklist_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_sales_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `sales_order_header_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_sales_order`
--

LOCK TABLES `picklist_sales_order` WRITE;
/*!40000 ALTER TABLE `picklist_sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `picklist_sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_stock_withdrawal`
--

DROP TABLE IF EXISTS `picklist_stock_withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_stock_withdrawal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `stock_withdrawal_header_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `stock_withdrawal_header_id` (`stock_withdrawal_header_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `picklist_stock_withdrawal_ibfk_1` FOREIGN KEY (`picklist_header_id`) REFERENCES `picklist_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picklist_stock_withdrawal_ibfk_2` FOREIGN KEY (`stock_withdrawal_header_id`) REFERENCES `stock_withdrawal_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picklist_stock_withdrawal_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_stock_withdrawal`
--

LOCK TABLES `picklist_stock_withdrawal` WRITE;
/*!40000 ALTER TABLE `picklist_stock_withdrawal` DISABLE KEYS */;
/*!40000 ALTER TABLE `picklist_stock_withdrawal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_transfer_order`
--

DROP TABLE IF EXISTS `picklist_transfer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_transfer_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picklist_header_id` int(11) NOT NULL,
  `transfer_order_header_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `picklist_header_id` (`picklist_header_id`),
  KEY `transfer_order_header_id` (`transfer_order_header_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_transfer_order`
--

LOCK TABLES `picklist_transfer_order` WRITE;
/*!40000 ALTER TABLE `picklist_transfer_order` DISABLE KEYS */;
INSERT INTO `picklist_transfer_order` VALUES (1,1,1,'2023-12-14 14:00:11',1),(2,2,1,'2023-12-14 17:06:35',1),(3,3,2,'2023-12-14 17:09:19',1),(4,4,3,'2024-01-08 21:07:37',1),(5,5,4,'2024-01-17 17:07:34',1),(6,6,5,'2024-01-18 00:39:20',1),(7,7,6,'2024-01-24 17:49:01',1);
/*!40000 ALTER TABLE `picklist_transfer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist_type`
--

DROP TABLE IF EXISTS `picklist_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `description` varchar(128) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist_type`
--

LOCK TABLES `picklist_type` WRITE;
/*!40000 ALTER TABLE `picklist_type` DISABLE KEYS */;
INSERT INTO `picklist_type` VALUES (1,'SO','SALES ORDER','2019-12-18 20:50:25'),(2,'TO','TRANSFER ORDER','2019-12-18 20:50:25'),(3,'PR','PURCHASE RETURN','2019-12-18 20:50:25'),(5,'SW','STOCK WITHDRAWAL','2023-05-21 19:48:10');
/*!40000 ALTER TABLE `picklist_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_details`
--

DROP TABLE IF EXISTS `purchase_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `unit_price` double NOT NULL DEFAULT '0',
  `net_price` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) NOT NULL DEFAULT '1',
  `bpc` double DEFAULT '0',
  `store_warehouse_id` int(11) DEFAULT NULL,
  `weight` decimal(24,4) DEFAULT NULL,
  `expected_mfg_date` date DEFAULT NULL,
  `expected_expiry_date` date DEFAULT NULL,
  `expected_lot_number` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_header_id` (`purchase_order_header_id`),
  KEY `item_id` (`item_id`),
  KEY `unit_of_measure_id` (`uom_id`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  KEY `store_warehouse_id` (`store_warehouse_id`),
  CONSTRAINT `purchase_order_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_details_ibfk_2` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_details_ibfk_3` FOREIGN KEY (`purchase_order_header_id`) REFERENCES `purchase_order_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_details_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_details_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_details`
--

LOCK TABLES `purchase_order_details` WRITE;
/*!40000 ALTER TABLE `purchase_order_details` DISABLE KEYS */;
INSERT INTO `purchase_order_details` VALUES (1,1,9,3,25,25,0,0,0,NULL,'2024-01-08 02:20:03',1,'2024-01-08 02:20:03',1,1,1,NULL,0.0000,NULL,NULL,NULL),(2,1,10,3,15,15,0,0,0,NULL,'2024-01-08 02:20:11',1,'2024-01-08 02:20:11',1,1,1,NULL,0.0000,NULL,NULL,NULL),(3,2,9,3,1000,1000,0,0,0,NULL,'2024-01-17 17:35:13',1,'2024-01-17 17:35:13',1,1,1,NULL,0.0000,NULL,NULL,NULL),(4,2,10,3,2000,2000,0,0,0,NULL,'2024-01-17 17:35:20',1,'2024-01-17 17:35:20',1,1,1,NULL,0.0000,NULL,NULL,NULL),(5,3,9,3,12,12,0,0,0,NULL,'2024-02-14 03:18:55',1,'2024-02-14 03:18:55',1,1,1,NULL,0.0000,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchase_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_details_store_breakdown`
--

DROP TABLE IF EXISTS `purchase_order_details_store_breakdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_details_store_breakdown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_header_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `reference` varchar(80) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `purchase_order_header_id` (`purchase_order_header_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_details_store_breakdown`
--

LOCK TABLES `purchase_order_details_store_breakdown` WRITE;
/*!40000 ALTER TABLE `purchase_order_details_store_breakdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_details_store_breakdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_header`
--

DROP TABLE IF EXISTS `purchase_order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(80) NOT NULL,
  `reference` varchar(80) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier_street_address` varchar(128) DEFAULT NULL,
  `supplier_district_address` varchar(128) DEFAULT NULL,
  `supplier_city_address` varchar(128) DEFAULT NULL,
  `supplier_region_address` varchar(128) DEFAULT NULL,
  `supplier_zip_code_address` varchar(45) DEFAULT NULL,
  `supplier_country_address` varchar(128) DEFAULT NULL,
  `supplier_contact_person` varchar(128) DEFAULT NULL,
  `supplier_contact_number` varchar(128) DEFAULT NULL,
  `ship_to` varchar(80) DEFAULT 'WAREHOUSE',
  `warehouse_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `ship_to_street_address` varchar(128) DEFAULT NULL,
  `ship_to_district_address` varchar(128) DEFAULT NULL,
  `ship_to_city_address` varchar(128) DEFAULT NULL,
  `ship_to_region_address` varchar(128) DEFAULT NULL,
  `ship_to_zip_code_address` varchar(128) DEFAULT NULL,
  `ship_to_country_address` varchar(128) DEFAULT NULL,
  `ship_to_contact_person` varchar(128) DEFAULT NULL,
  `ship_to_contact_number` varchar(128) DEFAULT NULL,
  `terms_id` int(11) DEFAULT NULL,
  `remarks` text,
  `document_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `proforma_invoice` varchar(45) DEFAULT NULL,
  `shipment_terms_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `approved_by` varchar(80) DEFAULT NULL,
  `discount_1` double DEFAULT '0',
  `discount_1_type` varchar(25) NOT NULL,
  `discount_2` double DEFAULT '0',
  `discount_2_type` varchar(25) NOT NULL,
  `charges_insurance` double NOT NULL DEFAULT '0',
  `charges_freight` double NOT NULL DEFAULT '0',
  `discount_3_type` varchar(25) NOT NULL,
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `supplier_id` (`supplier_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `client_id` (`client_id`),
  KEY `terms_id` (`terms_id`),
  KEY `purchase_order_header_ibfk_4` (`created_by`),
  KEY `purchase_order_header_ibfk_5` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `closed_by` (`closed_by`),
  KEY `cancelled_by` (`cancelled_by`),
  KEY `shipment_terms_id` (`shipment_terms_id`),
  KEY `currency_id` (`currency_id`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_header`
--

LOCK TABLES `purchase_order_header` WRITE;
/*!40000 ALTER TABLE `purchase_order_header` DISABLE KEYS */;
INSERT INTO `purchase_order_header` VALUES (1,'PO00000001','CLOSED','TEDT',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WAREHOUSE',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-08','2024-02-01','2024-01-08 02:19:55',1,NULL,NULL,'2024-01-08 02:20:14',1,'2024-01-08 03:56:09',NULL,'All Items Received (RCV00000009)',NULL,NULL,NULL,12,1,'DEFAULT PO APPROVER',0,'',0,'',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL),(2,'PO00000002','CLOSED','PO00123',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WAREHOUSE',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-17','2024-03-01','2024-01-17 17:34:57',1,NULL,NULL,'2024-01-17 17:35:24',1,'2024-01-18 00:25:02',NULL,'All Items Received (RCV00000010)',NULL,NULL,NULL,12,1,'DEFAULT PO APPROVER',0,'',0,'',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL),(3,'PO00000003','POSTED','TEST',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WAREHOUSE',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-14','2024-03-01','2024-02-14 03:18:33',1,NULL,NULL,'2024-02-14 03:18:57',1,NULL,NULL,NULL,NULL,NULL,NULL,19,1,'DEFAULT PO APPROVER',0,'',0,'',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchase_order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_monitoring`
--

DROP TABLE IF EXISTS `purchase_order_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_monitoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_header_id` int(11) NOT NULL,
  `date_dfp_received` date DEFAULT NULL,
  `date_integ_received` date DEFAULT NULL,
  `date_dfp_po_approved` date DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `pbi_number` varchar(80) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `port_of_origin` varchar(128) DEFAULT NULL,
  `port_of_destination` varchar(128) DEFAULT NULL,
  `eta_manila_port` varchar(128) DEFAULT NULL,
  `ata_manila_port` varchar(128) DEFAULT NULL,
  `container_size` varchar(128) DEFAULT NULL,
  `bl_number` varchar(128) DEFAULT NULL,
  `broker` varchar(128) DEFAULT NULL,
  `storage` varchar(128) DEFAULT NULL,
  `demurrage` varchar(128) DEFAULT NULL,
  `other_charges` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_header_id` (`purchase_order_header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_monitoring`
--

LOCK TABLES `purchase_order_monitoring` WRITE;
/*!40000 ALTER TABLE `purchase_order_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_return_details`
--

DROP TABLE IF EXISTS `purchase_return_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_return_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_return_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `issued_quantity` double NOT NULL DEFAULT '0',
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_return_header_id` (`purchase_return_header_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_return_details`
--

LOCK TABLES `purchase_return_details` WRITE;
/*!40000 ALTER TABLE `purchase_return_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_return_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_return_header`
--

DROP TABLE IF EXISTS `purchase_return_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_return_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(80) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier_street_address` varchar(128) DEFAULT NULL,
  `supplier_district_address` varchar(80) DEFAULT NULL,
  `supplier_city_address` varchar(80) DEFAULT NULL,
  `supplier_region_address` varchar(80) DEFAULT NULL,
  `supplier_zip_code_address` varchar(80) DEFAULT NULL,
  `supplier_country_address` varchar(80) DEFAULT NULL,
  `reference` varchar(80) DEFAULT NULL,
  `remarks` text,
  `document_date` date DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `closed_by` (`closed_by`),
  KEY `cancelled_by` (`cancelled_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_return_header`
--

LOCK TABLES `purchase_return_header` WRITE;
/*!40000 ALTER TABLE `purchase_return_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_return_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `putaway_details`
--

DROP TABLE IF EXISTS `putaway_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `putaway_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_receipt_header_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(128) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `pdt_flag` tinyint(1) NOT NULL DEFAULT '0',
  `pallet_number` varchar(80) DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `box_number` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `stock_receipt_header_id` (`stock_receipt_header_id`),
  KEY `pallet_number` (`pallet_number`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `putaway_details`
--

LOCK TABLES `putaway_details` WRITE;
/*!40000 ALTER TABLE `putaway_details` DISABLE KEYS */;
INSERT INTO `putaway_details` VALUES (1,3,6,31,'1318Y1910','2019-05-18',4,21,21,'2023-12-14 14:03:48',1,'AUTO PWY (RCV00000003)',0,NULL,NULL,'2018-11-19',0,NULL),(2,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:24:32',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(3,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:27:01',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(4,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:29:04',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(5,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:31:04',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(6,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:31:55',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(7,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:33:16',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(8,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:36:38',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(9,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:37:10',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(10,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:37:44',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(11,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:39:09',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(12,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:39:32',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(13,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:43:25',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(14,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:44:15',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(15,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:45:53',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(16,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:52:58',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(17,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:54:13',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(18,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:55:23',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(19,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:58:00',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(20,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 00:59:32',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(21,7,1,9,'2-1152',NULL,3,400,400,'2023-12-15 01:01:13',1,NULL,1,NULL,NULL,'2022-03-07',0,'000000000004'),(27,8,50,6,'20231215',NULL,3,400,400,'2023-12-15 12:53:19',1,NULL,1,NULL,NULL,'2023-12-01',400,'000000000006'),(30,8,50,10,'20231215',NULL,3,12,12,'2023-12-15 12:56:10',1,NULL,1,NULL,NULL,'2023-12-01',12,'000000000007'),(31,9,20,9,'240108',NULL,3,25,25,'2024-01-09 00:52:59',1,'DESKTOP PWY',0,NULL,NULL,NULL,0,NULL),(32,10,11,9,'BATCH001','2024-12-30',3,1000,1000,'2024-01-18 00:28:43',1,NULL,1,NULL,NULL,'2024-01-01',0,'BG000000000032'),(33,10,11,10,'BATCH002','2024-12-30',3,500,500,'2024-01-18 00:28:47',1,NULL,1,NULL,NULL,'2024-01-01',0,'BG000000000033'),(34,10,11,10,'BATCH002','2024-12-30',3,500,500,'2024-01-18 00:28:51',1,NULL,1,NULL,NULL,'2024-01-01',0,'BG000000000034'),(35,10,11,10,'BATCH002','2024-12-30',3,500,500,'2024-01-18 00:34:40',1,NULL,1,NULL,NULL,'2024-01-01',0,'BG000000000035'),(36,10,11,10,'BATCH002','2024-12-30',3,500,500,'2024-01-18 00:34:45',1,NULL,1,NULL,NULL,'2024-01-01',0,'BG000000000036');
/*!40000 ALTER TABLE `putaway_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `putaway_suggestion`
--

DROP TABLE IF EXISTS `putaway_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `putaway_suggestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_receipt_header_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `pallet_number` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `base_quantity` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `stock_receipt_header_id` (`stock_receipt_header_id`),
  KEY `location_id` (`location_id`),
  KEY `item_id` (`item_id`),
  KEY `pallet_number` (`pallet_number`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `putaway_suggestion`
--

LOCK TABLES `putaway_suggestion` WRITE;
/*!40000 ALTER TABLE `putaway_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `putaway_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reason`
--

DROP TABLE IF EXISTS `reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) NOT NULL,
  `description` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reason`
--

LOCK TABLES `reason` WRITE;
/*!40000 ALTER TABLE `reason` DISABLE KEYS */;
INSERT INTO `reason` VALUES (1,'WQ','Wrong Qty','2020-11-13 16:59:17',1,NULL,NULL,1),(2,'WE','Wrong Entry','2021-01-12 13:30:06',1,NULL,NULL,1),(3,'WP','Wrong Posting','2021-01-12 13:30:24',1,NULL,NULL,1);
/*!40000 ALTER TABLE `reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclass_header`
--

DROP TABLE IF EXISTS `reclass_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclass_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(45) NOT NULL,
  `document_date` date DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `reference` varchar(80) DEFAULT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `cancelled_by` (`cancelled_by`),
  KEY `posted_by` (`posted_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclass_header`
--

LOCK TABLES `reclass_header` WRITE;
/*!40000 ALTER TABLE `reclass_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclass_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclass_input_details`
--

DROP TABLE IF EXISTS `reclass_input_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclass_input_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reclass_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reclass_header_id` (`reclass_header_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclass_input_details`
--

LOCK TABLES `reclass_input_details` WRITE;
/*!40000 ALTER TABLE `reclass_input_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclass_input_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclass_output_details`
--

DROP TABLE IF EXISTS `reclass_output_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclass_output_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reclass_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reclass_header_id` (`reclass_header_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclass_output_details`
--

LOCK TABLES `reclass_output_details` WRITE;
/*!40000 ALTER TABLE `reclass_output_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclass_output_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_details`
--

DROP TABLE IF EXISTS `sales_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_order_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `unit_price` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sales_order_header_id` (`sales_order_header_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_details`
--

LOCK TABLES `sales_order_details` WRITE;
/*!40000 ALTER TABLE `sales_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_header`
--

DROP TABLE IF EXISTS `sales_order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(80) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_street_address` varchar(128) DEFAULT NULL,
  `client_district_address` varchar(80) DEFAULT NULL,
  `client_city_address` varchar(80) DEFAULT NULL,
  `client_region_address` varchar(80) DEFAULT NULL,
  `client_zip_code_address` varchar(80) DEFAULT NULL,
  `client_country_address` varchar(80) DEFAULT NULL,
  `shipping_group_id` int(11) DEFAULT NULL,
  `sales_representative_id` int(11) DEFAULT NULL,
  `reference` varchar(80) DEFAULT NULL,
  `remarks` text,
  `document_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `client_id` (`client_id`),
  KEY `shipping_group_id` (`shipping_group_id`),
  KEY `sales_representative_id` (`sales_representative_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `closed_by` (`closed_by`),
  KEY `cancelled_by` (`cancelled_by`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_header`
--

LOCK TABLES `sales_order_header` WRITE;
/*!40000 ALTER TABLE `sales_order_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_representative`
--

DROP TABLE IF EXISTS `sales_representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_representative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_representative`
--

LOCK TABLES `sales_representative` WRITE;
/*!40000 ALTER TABLE `sales_representative` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_representative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_uploaded_ax`
--

DROP TABLE IF EXISTS `sales_uploaded_ax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_uploaded_ax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(45) NOT NULL,
  `receipt_number` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `variant_number` varchar(45) NOT NULL,
  `category` tinytext NOT NULL,
  `unit_quantity` double NOT NULL,
  `vendor` varchar(45) NOT NULL,
  `transaction_time` datetime NOT NULL,
  `store_number` varchar(45) NOT NULL,
  `item_number` varchar(45) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `price` decimal(22,2) NOT NULL,
  `net_amount` decimal(22,2) NOT NULL,
  `cash_discount_amount` decimal(22,2) NOT NULL,
  `vat` decimal(22,2) NOT NULL,
  `gross` decimal(22,2) NOT NULL,
  `tax` decimal(22,2) NOT NULL,
  `discount_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_uploaded_ax`
--

LOCK TABLES `sales_uploaded_ax` WRITE;
/*!40000 ALTER TABLE `sales_uploaded_ax` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_uploaded_ax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_uploaded_mms`
--

DROP TABLE IF EXISTS `sales_uploaded_mms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_uploaded_mms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_number` varchar(45) NOT NULL,
  `loc` varchar(45) NOT NULL,
  `vendor` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `dept` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `stock_no` varchar(45) NOT NULL,
  `stock_description` tinytext NOT NULL,
  `qty` double NOT NULL,
  `gross` decimal(22,2) NOT NULL,
  `net` decimal(22,2) NOT NULL,
  `tax` decimal(22,2) NOT NULL,
  `net_retail_price` decimal(22,2) NOT NULL,
  `disc` decimal(22,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_uploaded_mms`
--

LOCK TABLES `sales_uploaded_mms` WRITE;
/*!40000 ALTER TABLE `sales_uploaded_mms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_uploaded_mms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_terms`
--

DROP TABLE IF EXISTS `shipment_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `description` varchar(128) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `shipment_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_terms`
--

LOCK TABLES `shipment_terms` WRITE;
/*!40000 ALTER TABLE `shipment_terms` DISABLE KEYS */;
INSERT INTO `shipment_terms` VALUES (1,'FOB','FOB','2019-09-03 00:03:09',1,'2019-10-08 17:57:34',1,1,'LOCAL'),(12,'CIF - MLA','CIF - MLA','2020-01-08 16:09:00',NULL,'2020-01-29 15:17:32',49,1,'DIRECT'),(14,'FOB - CALIFORNIA','FOB - CALIFORNIA','2020-01-08 16:09:00',NULL,'2020-01-29 15:17:19',49,1,'DIRECT'),(15,'FCA - FORWARDER WHSE','FCA - FORWARDER WHSE','2020-01-08 16:09:00',NULL,'2020-01-29 15:17:37',49,1,'DIRECT'),(16,'LOCAL DELIVERY','LOCAL DELIVERY','2020-01-08 16:09:00',NULL,'2020-01-29 15:17:25',49,1,'LOCAL'),(17,'FOB - CHILE','FOB - CHILE','2020-01-08 16:09:00',NULL,'2020-01-29 15:17:11',49,1,'DIRECT'),(18,'FOB-SIN','FOB-SIN','2020-01-16 13:09:57',59,'2020-01-16 13:11:56',59,1,'DIRECT'),(19,'EX WORKS','EX WORKS','2020-01-16 14:14:50',59,'2020-01-29 15:14:02',49,1,'DIRECT'),(21,'FCA','FCA','2020-01-29 15:13:20',49,NULL,NULL,1,'DIRECT');
/*!40000 ALTER TABLE `shipment_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_type`
--

DROP TABLE IF EXISTS `shipment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_type`
--

LOCK TABLES `shipment_type` WRITE;
/*!40000 ALTER TABLE `shipment_type` DISABLE KEYS */;
INSERT INTO `shipment_type` VALUES (1,'LOCAL','2019-10-08 17:45:48'),(2,'DIRECT','2019-10-08 17:45:48');
/*!40000 ALTER TABLE `shipment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_group`
--

DROP TABLE IF EXISTS `shipping_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_group`
--

LOCK TABLES `shipping_group` WRITE;
/*!40000 ALTER TABLE `shipping_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_type`
--

DROP TABLE IF EXISTS `sku_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_type`
--

LOCK TABLES `sku_type` WRITE;
/*!40000 ALTER TABLE `sku_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `sku_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustment_details`
--

DROP TABLE IF EXISTS `stock_adjustment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_adjustment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_adjustment_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `previous_base_quantity` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `reason` text,
  `for_client_id` int(11) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `previous_weight` double NOT NULL DEFAULT '0',
  `pallet_number` varchar(45) DEFAULT NULL,
  `adjustment_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `stock_adjustment_details_ibfk_2` (`stock_adjustment_header_id`),
  CONSTRAINT `stock_adjustment_details_ibfk_1` FOREIGN KEY (`stock_adjustment_header_id`) REFERENCES `stock_adjustment_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustment_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustment_details_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustment_details_ibfk_4` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustment_details_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustment_details_ibfk_6` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=795 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustment_details`
--

LOCK TABLES `stock_adjustment_details` WRITE;
/*!40000 ALTER TABLE `stock_adjustment_details` DISABLE KEYS */;
INSERT INTO `stock_adjustment_details` VALUES (1,1,9,44,'05-482293',NULL,3,12,12,0,'2024-01-09 02:17:55',1,'2024-01-09 02:17:55',1,'Wrong Quantity',NULL,'2022-05-13',9744,0,NULL,'INCREASE'),(2,2,1,11,'SC001',NULL,1,12200,12200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-10-07',0,0,NULL,'DECREASE'),(3,2,2,11,'PPMC001',NULL,1,8510,8510,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-10-06',0,0,NULL,'DECREASE'),(4,2,3,11,'SL001',NULL,2,800,800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-10-25',0,0,NULL,'DECREASE'),(5,2,4,11,'LBL001',NULL,2,45,45,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-10-24',0,0,NULL,'DECREASE'),(6,2,5,11,'RBN001',NULL,2,20,20,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-10-24',0,0,NULL,'DECREASE'),(7,2,6,50,'20231215',NULL,3,400,400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-12-01',0,0,NULL,'DECREASE'),(8,2,6,48,'6-1033',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(9,2,6,48,'6-1032',NULL,3,12600,12600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(10,2,6,48,'6-1031',NULL,3,14700,14700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(11,2,6,48,'6-1031',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-25',0,0,NULL,'DECREASE'),(12,2,6,48,'6-1030',NULL,3,14700,14700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(13,2,6,48,'4-0906',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(14,2,6,48,'4-0906',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-25',0,0,NULL,'DECREASE'),(15,2,6,43,'Y-0669',NULL,3,12600,12600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(16,2,6,43,'Y-0668-1',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(17,2,6,43,'Y-0668',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(18,2,6,43,'Y-0667',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(19,2,6,43,'Y-0666',NULL,3,12600,12600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(20,2,6,43,'Y-0665',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(21,2,6,43,'Y-0664',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(22,2,6,43,'6-1040',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(23,2,6,39,'Y-0668',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(24,2,6,39,'Y-0667',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(25,2,6,39,'Y-0666',NULL,3,6300,6300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(26,2,6,39,'Y-0665',NULL,3,6300,6300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(27,2,6,39,'Y-0664',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(28,2,6,39,'6-1040',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',0,0,NULL,'DECREASE'),(29,2,6,39,'6-1040',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(30,2,6,30,'05-482301',NULL,3,8000,8000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',0,0,NULL,'DECREASE'),(31,2,6,30,'05-482300',NULL,3,12000,12000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',0,0,NULL,'DECREASE'),(32,2,6,30,'05-482299',NULL,3,12000,12000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',0,0,NULL,'DECREASE'),(33,2,6,30,'05-482297',NULL,3,6000,6000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',0,0,NULL,'DECREASE'),(34,2,6,23,'6-1037',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(35,2,6,23,'6-1037',NULL,3,6300,6300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(36,2,6,23,'6-1036',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(37,2,6,23,'6-1036',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(38,2,6,23,'6-1035',NULL,3,4200,4200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(39,2,6,23,'6-1035',NULL,3,14700,14700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(40,2,6,23,'6-1034',NULL,3,12600,12600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(41,2,6,23,'6-1033',NULL,3,6300,6300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(42,2,6,16,'6-1069',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(43,2,6,16,'6-1040',NULL,3,12600,12600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(44,2,6,16,'6-1039',NULL,3,10500,10500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(45,2,6,16,'6-1038',NULL,3,16800,16800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(46,2,6,16,'6-1037',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(47,2,6,16,'6-1034',NULL,3,4200,4200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(48,2,6,16,'6-1033',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(49,2,6,16,'6-1033',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',0,0,NULL,'DECREASE'),(50,2,7,47,'6-0930',NULL,3,7500,7500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(51,2,7,47,'6-0929',NULL,3,12000,12000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(52,2,7,47,'6-0928',NULL,3,13500,13500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(53,2,7,47,'6-0927',NULL,3,13500,13500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(54,2,7,47,'6-0926-1',NULL,3,6000,6000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(55,2,7,42,'Y-0639',NULL,3,4500,4500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',0,0,NULL,'DECREASE'),(56,2,7,42,'Y-0638',NULL,3,1500,1500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',0,0,NULL,'DECREASE'),(57,2,7,42,'Y-0638',NULL,3,7500,7500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-12-31',0,0,NULL,'DECREASE'),(58,2,7,42,'6-0931',NULL,3,6000,6000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(59,2,7,42,'2-1112-2',NULL,3,1500,1500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-06',0,0,NULL,'DECREASE'),(60,2,7,35,'4-0864',NULL,3,7500,7500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',0,0,NULL,'DECREASE'),(61,2,7,35,'4-0863',NULL,3,13500,13500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',0,0,NULL,'DECREASE'),(62,2,7,35,'4-0862',NULL,3,12000,12000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',0,0,NULL,'DECREASE'),(63,2,7,35,'2-1114',NULL,3,10500,10500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-06',0,0,NULL,'DECREASE'),(64,2,7,35,'2-1112-2',NULL,3,3000,3000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-06',0,0,NULL,'DECREASE'),(65,2,7,32,'06-482393',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-17',0,0,NULL,'DECREASE'),(66,2,7,32,'06-482385',NULL,3,6000,6000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-19',0,0,NULL,'DECREASE'),(67,2,7,32,'06-482383',NULL,3,8000,8000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-19',0,0,NULL,'DECREASE'),(68,2,7,32,'06-482196',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-19',0,0,NULL,'DECREASE'),(69,2,7,32,'06-482196',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-17',0,0,NULL,'DECREASE'),(70,2,7,32,'06-482194',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-17',0,0,NULL,'DECREASE'),(71,2,7,18,'6-0931',NULL,3,9000,9000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(72,2,7,18,'6-0930',NULL,3,6000,6000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(73,2,7,18,'6-0926',NULL,3,7500,7500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(74,2,7,18,'6-0925',NULL,3,13500,13500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(75,2,7,18,'6-0921',NULL,3,1500,1500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(76,2,7,18,'6-0912',NULL,3,7500,7500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(77,2,7,18,'6-0912',NULL,3,1500,1500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',0,0,NULL,'DECREASE'),(78,2,7,18,'4-0864',NULL,3,6000,6000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',0,0,NULL,'DECREASE'),(79,2,8,49,'8-0992',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(80,2,8,49,'8-0991',NULL,3,11900,11900,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(81,2,8,49,'8-0990',NULL,3,5100,5100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(82,2,8,49,'8-0988-1',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(83,2,8,49,'8-0988',NULL,3,8500,8500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(84,2,8,49,'8-0938',NULL,3,5100,5100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(85,2,8,49,'8-0936',NULL,3,11900,11900,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(86,2,8,49,'8-0934',NULL,3,8500,8500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(87,2,8,34,'X-0718',NULL,3,15300,15300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',0,0,NULL,'DECREASE'),(88,2,8,34,'X-0717',NULL,3,15300,15300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',0,0,NULL,'DECREASE'),(89,2,8,34,'X-0716-1',NULL,3,5100,5100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',0,0,NULL,'DECREASE'),(90,2,8,34,'X-0716',NULL,3,5100,5100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',0,0,NULL,'DECREASE'),(91,2,8,34,'8-0993',NULL,3,13600,13600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(92,2,8,34,'8-0992',NULL,3,3400,3400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(93,2,8,34,'8-0989',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(94,2,8,24,'8-0935-1',NULL,3,6800,6800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(95,2,8,24,'8-0935',NULL,3,6800,6800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(96,2,8,24,'8-0934',NULL,3,6800,6800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(97,2,8,24,'6-0924',NULL,3,8500,8500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',0,0,NULL,'DECREASE'),(98,2,8,24,'6-0921',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',0,0,NULL,'DECREASE'),(99,2,8,21,'8-0990',NULL,3,3400,3400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(100,2,8,21,'8-0988',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(101,2,8,21,'6-0924',NULL,3,3400,3400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',0,0,NULL,'DECREASE'),(102,2,8,21,'6-0923',NULL,3,15300,15300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',0,0,NULL,'DECREASE'),(103,2,8,21,'6-0922',NULL,3,15300,15300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',0,0,NULL,'DECREASE'),(104,2,8,21,'6-0921',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',0,0,NULL,'DECREASE'),(105,2,8,21,'6-0920',NULL,3,8500,8500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',0,0,NULL,'DECREASE'),(106,2,8,21,'6-0916',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',0,0,NULL,'DECREASE'),(107,2,8,21,'6-0915',NULL,3,5100,5100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',0,0,NULL,'DECREASE'),(108,2,8,19,'8-0992',NULL,3,8500,8500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(109,2,8,19,'8-0992',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(110,2,8,19,'8-0991',NULL,3,3400,3400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(111,2,8,19,'8-0990',NULL,3,6800,6800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(112,2,8,19,'8-0989',NULL,3,3400,3400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(113,2,8,19,'8-0989',NULL,3,10200,10200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(114,2,8,19,'8-0988-1',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(115,2,8,19,'8-0938',NULL,3,6800,6800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(116,2,8,19,'8-0938',NULL,3,3400,3400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(117,2,8,19,'8-0937',NULL,3,15300,15300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',0,0,NULL,'DECREASE'),(118,2,9,44,'07-482341',NULL,3,8000,8000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-27',0,0,NULL,'DECREASE'),(119,2,9,44,'05-482294',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',0,0,NULL,'DECREASE'),(120,2,9,44,'05-482293',NULL,3,12000,12000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',0,0,NULL,'DECREASE'),(121,2,9,44,'05-482292',NULL,3,18000,18000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',0,0,NULL,'DECREASE'),(122,2,9,37,'240108',NULL,3,25,25,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,NULL,0,0,NULL,'DECREASE'),(123,2,9,31,'Y-0649',NULL,3,18900,18900,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',0,0,NULL,'DECREASE'),(124,2,9,31,'Y-0400',NULL,3,10500,10500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',0,0,NULL,'DECREASE'),(125,2,9,31,'6-0969',NULL,3,10500,10500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(126,2,9,26,'6-0969',NULL,3,6295,6295,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(127,2,9,26,'6-0968',NULL,3,6300,6300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(128,2,9,26,'6-0965',NULL,3,14700,14700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(129,2,9,26,'6-0964',NULL,3,4200,4200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(130,2,9,26,'6-0964',NULL,3,10500,10500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-29',0,0,NULL,'DECREASE'),(131,2,9,26,'6-0963',NULL,3,16800,16800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-29',0,0,NULL,'DECREASE'),(132,2,9,26,'4-0891',NULL,3,4200,4200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-24',0,0,NULL,'DECREASE'),(133,2,9,25,'6-0969',NULL,3,4175,4175,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(134,2,9,25,'6-0968',NULL,3,12600,12600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(135,2,9,25,'6-0967',NULL,3,18900,18900,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(136,2,9,25,'4-0891',NULL,3,16800,16800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-24',0,0,NULL,'DECREASE'),(137,2,9,25,'3-1221',NULL,3,6300,6300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-26',0,0,NULL,'DECREASE'),(138,2,9,25,'2-1154',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',0,0,NULL,'DECREASE'),(139,2,9,25,'2-1152',NULL,3,1700,1700,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',0,0,NULL,'DECREASE'),(140,2,9,22,'3-1221',NULL,3,4200,4200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-26',0,0,NULL,'DECREASE'),(141,2,9,22,'3-1220',NULL,3,8400,8400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-25',0,0,NULL,'DECREASE'),(142,2,9,22,'3-1219',NULL,3,16800,16800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-25',0,0,NULL,'DECREASE'),(143,2,9,22,'2-1154',NULL,3,10500,10500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',0,0,NULL,'DECREASE'),(144,2,9,22,'2-1140-2',NULL,3,4079,4079,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',0,0,NULL,'DECREASE'),(145,2,9,20,'6-0966',NULL,3,18900,18900,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(146,2,9,20,'6-0965',NULL,3,4200,4200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',0,0,NULL,'DECREASE'),(147,2,9,20,'2-1154',NULL,3,2100,2100,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',0,0,NULL,'DECREASE'),(148,2,9,20,'2-1140-2',NULL,3,4200,4200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',0,0,NULL,'DECREASE'),(149,2,10,50,'20231215',NULL,3,12,12,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-12-01',0,0,NULL,'DECREASE'),(150,2,10,36,'8-1007',NULL,3,9000,9000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(151,2,10,36,'8-1006',NULL,3,9000,9000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(152,2,10,36,'8-1005',NULL,3,14400,14400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(153,2,10,36,'8-1004',NULL,3,5400,5400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(154,2,10,36,'8-1002',NULL,3,12600,12600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(155,2,10,36,'8-1001',NULL,3,12600,12600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(156,2,10,36,'8-0999',NULL,3,1800,1800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(157,2,10,33,'X-0734',NULL,3,16200,16200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',0,0,NULL,'DECREASE'),(158,2,10,33,'X-0733',NULL,3,7200,7200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',0,0,NULL,'DECREASE'),(159,2,10,33,'X-0732-1',NULL,3,12600,12600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',0,0,NULL,'DECREASE'),(160,2,10,33,'X-0732',NULL,3,3600,3600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',0,0,NULL,'DECREASE'),(161,2,10,33,'8-1009',NULL,3,1800,1800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(162,2,10,28,'8-1005',NULL,3,3600,3600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(163,2,10,28,'8-1004',NULL,3,10800,10800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(164,2,10,28,'8-1003',NULL,3,16200,16200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(165,2,10,28,'8-1001',NULL,3,1800,1800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(166,2,10,28,'6-0955',NULL,3,1800,1800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',0,0,NULL,'DECREASE'),(167,2,10,28,'6-0954',NULL,3,3600,3600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',0,0,NULL,'DECREASE'),(168,2,10,28,'6-0953',NULL,3,16200,16200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',0,0,NULL,'DECREASE'),(169,2,10,28,'6-0953',NULL,3,1800,1800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',0,0,NULL,'DECREASE'),(170,2,10,28,'6-0952-1',NULL,3,3600,3600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',0,0,NULL,'DECREASE'),(171,2,10,28,'6-0951',NULL,3,3600,3600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',0,0,NULL,'DECREASE'),(172,2,10,27,'8-1009',NULL,3,9000,9000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(173,2,10,27,'8-1007',NULL,3,3600,3600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(174,2,10,27,'8-0998',NULL,3,1800,1800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',0,0,NULL,'DECREASE'),(175,2,11,29,'Y-0937-2',NULL,3,1800,1800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',0,0,NULL,'DECREASE'),(176,2,11,29,'Y-0647-2',NULL,3,5400,5400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',0,0,NULL,'DECREASE'),(177,2,11,29,'Y-0645',NULL,3,16200,16200,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',0,0,NULL,'DECREASE'),(178,2,12,46,'09-484389',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(179,2,12,46,'09-484387',NULL,3,6000,6000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(180,2,12,46,'09-484385',NULL,3,6000,6000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(181,2,12,46,'09-484382',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(182,2,12,46,'09-484381',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(183,2,12,46,'09-484379',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(184,2,12,46,'09-482319',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-29',0,0,NULL,'DECREASE'),(185,2,12,46,'09-482305',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-29',0,0,NULL,'DECREASE'),(186,2,12,46,'09-482147',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',0,0,NULL,'DECREASE'),(187,2,12,46,'09-482146',NULL,3,14000,14000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',0,0,NULL,'DECREASE'),(188,2,12,45,'09-482322',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-23',0,0,NULL,'DECREASE'),(189,2,12,45,'09-482151',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',0,0,NULL,'DECREASE'),(190,2,12,45,'09-482149',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',0,0,NULL,'DECREASE'),(191,2,12,45,'09-482147',NULL,3,10000,10000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',0,0,NULL,'DECREASE'),(192,2,12,45,'09-482125',NULL,3,10000,10000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-13',0,0,NULL,'DECREASE'),(193,2,12,37,'10-484128',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-10-05',0,0,NULL,'DECREASE'),(194,2,12,37,'10-484128',NULL,3,1985,1985,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(195,2,12,37,'09-484684',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(196,2,12,37,'09-484389',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-10-05',0,0,NULL,'DECREASE'),(197,2,12,37,'09-484389',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(198,2,12,37,'09-484387',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(199,2,12,37,'09-484385',NULL,3,4000,4000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(200,2,12,37,'09-484384',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-29',0,0,NULL,'DECREASE'),(201,2,12,37,'09-484384',NULL,3,8000,8000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(202,2,12,37,'09-484382',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(203,2,12,37,'09-484381',NULL,3,12000,12000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(204,2,12,37,'09-484379',NULL,3,6000,6000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(205,2,12,37,'09-482305',NULL,3,2000,2000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',0,0,NULL,'DECREASE'),(206,2,13,50,'01-484731',NULL,3,1910,1910,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-02-05',0,0,NULL,'DECREASE'),(207,2,13,50,'01-484731',NULL,3,8000,8000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-01-31',0,0,NULL,'DECREASE'),(208,2,14,50,'RETURN-003',NULL,3,635,635,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-06-01',0,0,NULL,'DECREASE'),(209,2,14,50,'RETURN-002',NULL,3,490,490,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-06-01',0,0,NULL,'DECREASE'),(210,2,14,50,'RETURN-001',NULL,3,1510,1510,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-06-01',0,0,NULL,'DECREASE'),(211,2,15,12,'GOP134274','2023-10-25',4,6270,6270,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-26',0,0,NULL,'DECREASE'),(212,2,16,12,'BDC370458','2023-01-28',4,1000,1000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-01',0,0,NULL,'DECREASE'),(213,2,17,12,'BDC378564','2024-01-10',4,3300,3300,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-14',0,0,NULL,'DECREASE'),(214,2,17,12,'BDC369082','2023-01-24',4,103.95,103.95,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-28',0,0,NULL,'DECREASE'),(215,2,17,12,'BDC351308','2021-01-18',4,220,220,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2020-07-22',0,0,NULL,'DECREASE'),(216,2,17,12,'BDC338650','2019-11-12',4,988.9,988.9,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-05-19',0,0,NULL,'DECREASE'),(217,2,18,12,'8635099570','2019-05-10',4,569.3,569.3,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-05-10',0,0,NULL,'DECREASE'),(218,2,18,12,'3394127754','2024-03-06',4,4100.25,4100.25,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-06',0,0,NULL,'DECREASE'),(219,2,18,12,'2V35127471','2023-11-12',4,1562,1562,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-12',0,0,NULL,'DECREASE'),(220,2,19,12,'2835126287','2023-08-26',4,2631.1800000000007,2631.1800000000007,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',0,0,NULL,'DECREASE'),(221,2,20,12,'321H060810','2024-02-02',4,1600,1600,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-02-02',0,0,NULL,'DECREASE'),(222,2,21,12,'9T1H048489','2020-06-26',4,119,119,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-06-26',0,0,NULL,'DECREASE'),(223,2,21,12,'8W1H045295','2019-09-14',4,1635.3,1635.3,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-09-14',0,0,NULL,'DECREASE'),(224,2,21,12,'321H060764','2023-11-05',4,500,500,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-05',0,0,NULL,'DECREASE'),(225,2,21,12,'181H055343','2022-04-04',4,76,76,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-04-04',0,0,NULL,'DECREASE'),(226,2,22,12,'P131337098','2022-03-22',4,440,440,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-09-22',0,0,NULL,'DECREASE'),(227,2,23,12,'P140339688','2022-04-26',4,440,440,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-10-26',0,0,NULL,'DECREASE'),(228,2,24,12,'TEO407','2023-11-22',4,7440,7440,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-05-26',0,0,NULL,'DECREASE'),(229,2,25,12,'TFO167','2023-12-13',4,1000,1000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-06-16',0,0,NULL,'DECREASE'),(230,2,25,12,'TEO154','2023-11-08',4,3000,3000,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-06-01',0,0,NULL,'DECREASE'),(231,2,26,12,'TEO361','2023-12-06',4,400,400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-06-09',0,0,NULL,'DECREASE'),(232,2,27,12,'TFO429','2023-12-16',4,400,400,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-06-19',0,0,NULL,'DECREASE'),(233,2,28,12,'FH3310XA3','2021-11-27',4,93.65,93.65,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2020-11-27',0,0,NULL,'DECREASE'),(234,2,28,12,'875C016011','2019-01-22',4,394,394,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-07-26',0,0,NULL,'DECREASE'),(235,2,29,12,'F1808083654','2019-02-15',4,194.8,194.8,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-08-15',0,0,NULL,'DECREASE'),(236,2,29,12,'1808083654','2019-02-15',4,96,96,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-08-15',0,0,NULL,'DECREASE'),(237,2,30,12,'F1808083655','2019-02-15',4,219.8,219.8,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-08-15',0,0,NULL,'DECREASE'),(238,2,30,12,'1808083655','2019-02-15',4,167,167,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-08-15',0,0,NULL,'DECREASE'),(239,2,31,12,'1318Y1910','2019-05-18',4,60,60,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-11-19',0,0,NULL,'DECREASE'),(240,2,32,12,'1318Y1909','2019-05-18',4,76.8,76.8,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-11-19',0,0,NULL,'DECREASE'),(241,2,33,12,'BDC370729','2023-02-04',4,88.14,88.14,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-08',0,0,NULL,'DECREASE'),(242,2,33,12,'BDC351252','2021-01-18',4,252.5,252.5,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2020-07-22',0,0,NULL,'DECREASE'),(243,2,34,12,'9V1A040676','2020-05-03',4,420,420,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-11-03',0,0,NULL,'DECREASE'),(244,2,34,12,'961A039173','2019-11-30',4,123,123,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-05-30',0,0,NULL,'DECREASE'),(245,2,35,12,'BDC347233','2020-09-14',4,28,28,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2020-03-18',0,0,NULL,'DECREASE'),(246,2,36,12,'BDC356440','2021-08-30',4,800,800,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-03-03',0,0,NULL,'DECREASE'),(247,2,37,14,'2749980117','2024-02-26',4,759,759,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-03',0,0,NULL,'DECREASE'),(248,2,37,14,'2749980116','2024-02-26',4,1004,1004,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-03',0,0,NULL,'DECREASE'),(249,2,37,14,'2749980112','2024-02-26',4,988,988,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-03',0,0,NULL,'DECREASE'),(250,2,37,14,'2749980111','2024-02-26',4,1261,1261,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-03',0,0,NULL,'DECREASE'),(251,2,38,14,'2733230202','2023-05-02',4,984,984,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-03',0,0,NULL,'DECREASE'),(252,2,38,14,'2733230201','2023-05-02',4,976,976,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-03',0,0,NULL,'DECREASE'),(253,2,38,14,'2733230199','2023-05-02',4,984,984,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-03',0,0,NULL,'DECREASE'),(254,2,38,14,'2731990165','2023-07-17',4,984,984,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-18',0,0,NULL,'DECREASE'),(255,2,38,14,'2731990015','2023-07-18',4,996,996,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',0,0,NULL,'DECREASE'),(256,2,38,14,'2731990014','2023-07-18',4,992,992,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',0,0,NULL,'DECREASE'),(257,2,38,14,'2731990013','2023-07-18',4,992,992,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',0,0,NULL,'DECREASE'),(258,2,38,14,'2731990012','2023-07-18',4,996,996,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',0,0,NULL,'DECREASE'),(259,2,38,14,'2731990011','2023-07-18',4,984,984,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',0,0,NULL,'DECREASE'),(260,2,38,14,'2731990010','2023-07-18',4,988,988,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',0,0,NULL,'DECREASE'),(261,2,38,14,'2731990009','2023-07-18',4,988,988,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',0,0,NULL,'DECREASE'),(262,2,39,14,'2773861105','2024-01-28',4,972,972,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-08-01',0,0,NULL,'DECREASE'),(263,2,39,14,'2773861104','2024-01-28',4,984,984,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-08-01',0,0,NULL,'DECREASE'),(264,2,39,14,'2773861101','2024-01-27',4,988,988,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-31',0,0,NULL,'DECREASE'),(265,2,39,14,'2773861100','2024-01-27',4,988,988,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-31',0,0,NULL,'DECREASE'),(266,2,39,14,'2773861092','2024-01-25',4,984,984,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-29',0,0,NULL,'DECREASE'),(267,2,39,14,'2773861091','2024-01-25',4,984,984,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-29',0,0,NULL,'DECREASE'),(268,2,39,14,'2773861048','2024-01-20',4,972,972,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-24',0,0,NULL,'DECREASE'),(269,2,39,14,'2773861047','2024-01-20',4,980,980,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-24',0,0,NULL,'DECREASE'),(270,2,39,14,'2773861040','2024-01-18',4,980,980,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-22',0,0,NULL,'DECREASE'),(271,2,39,14,'2773861039','2024-01-18',4,980,980,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-22',0,0,NULL,'DECREASE'),(272,2,39,14,'2773861026','2024-01-17',4,980,980,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-21',0,0,NULL,'DECREASE'),(273,2,39,14,'2773861025','2024-01-17',4,980,980,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-21',0,0,NULL,'DECREASE'),(274,2,39,14,'2773861017','2024-01-16',4,976,976,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-20',0,0,NULL,'DECREASE'),(275,2,39,14,'2773861016','2024-01-16',4,976,976,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-20',0,0,NULL,'DECREASE'),(276,2,39,14,'2773861010','2024-01-15',4,980,980,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-19',0,0,NULL,'DECREASE'),(277,2,39,14,'2773861009','2024-01-15',4,980,980,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-19',0,0,NULL,'DECREASE'),(278,2,39,14,'2773861002','2024-01-14',4,976,976,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-18',0,0,NULL,'DECREASE'),(279,2,39,14,'2773861001','2024-01-14',4,980,980,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-18',0,0,NULL,'DECREASE'),(280,2,39,14,'2773860997','2024-01-13',4,996,996,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-17',0,0,NULL,'DECREASE'),(281,2,40,14,'2698100160','2023-05-01',4,1020,1020,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-06',0,0,NULL,'DECREASE'),(282,2,40,14,'2698100157','2023-04-30',4,1024,1024,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-05',0,0,NULL,'DECREASE'),(283,2,40,14,'2698100155','2023-04-30',4,1024,1024,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-05',0,0,NULL,'DECREASE'),(284,2,41,14,'2415360003','2019-09-15',4,984,984,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-03-19',0,0,NULL,'DECREASE'),(285,2,41,14,'2415360002','2019-09-15',4,735,735,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-03-19',0,0,NULL,'DECREASE'),(286,2,41,14,'2415360001','2019-09-15',4,244,244,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-03-19',0,0,NULL,'DECREASE'),(513,2,6,50,'20231215',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-12-01',400,0,NULL,'DECREASE'),(514,2,6,48,'6-1033',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',7108,0,NULL,'DECREASE'),(515,2,6,48,'6-1032',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',10662,0,NULL,'DECREASE'),(516,2,6,48,'6-1031',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',12439,0,NULL,'DECREASE'),(517,2,6,48,'6-1031',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-25',1777,0,NULL,'DECREASE'),(518,2,6,48,'6-1030',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',12439,0,NULL,'DECREASE'),(519,2,6,48,'4-0906',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',1777,0,NULL,'DECREASE'),(520,2,6,48,'4-0906',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-25',7108,0,NULL,'DECREASE'),(521,2,6,43,'Y-0669',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',10662,0,NULL,'DECREASE'),(522,2,6,43,'Y-0668-1',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',7108,0,NULL,'DECREASE'),(523,2,6,43,'Y-0668',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',1777,0,NULL,'DECREASE'),(524,2,6,43,'Y-0667',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',7108,0,NULL,'DECREASE'),(525,2,6,43,'Y-0666',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',10662,0,NULL,'DECREASE'),(526,2,6,43,'Y-0665',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',7108,0,NULL,'DECREASE'),(527,2,6,43,'Y-0664',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',7108,0,NULL,'DECREASE'),(528,2,6,43,'6-1040',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',1777,0,NULL,'DECREASE'),(529,2,6,39,'Y-0668',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',1777,0,NULL,'DECREASE'),(530,2,6,39,'Y-0667',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',7108,0,NULL,'DECREASE'),(531,2,6,39,'Y-0666',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',5331,0,NULL,'DECREASE'),(532,2,6,39,'Y-0665',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',5331,0,NULL,'DECREASE'),(533,2,6,39,'Y-0664',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',7108,0,NULL,'DECREASE'),(534,2,6,39,'6-1040',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-04',1777,0,NULL,'DECREASE'),(535,2,6,39,'6-1040',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',1777,0,NULL,'DECREASE'),(536,2,6,30,'05-482301',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',6768,0,NULL,'DECREASE'),(537,2,6,30,'05-482300',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',10152,0,NULL,'DECREASE'),(538,2,6,30,'05-482299',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',10152,0,NULL,'DECREASE'),(539,2,6,30,'05-482297',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',5076,0,NULL,'DECREASE'),(540,2,6,23,'6-1037',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',1777,0,NULL,'DECREASE'),(541,2,6,23,'6-1037',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',5331,0,NULL,'DECREASE'),(542,2,6,23,'6-1036',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',7108,0,NULL,'DECREASE'),(543,2,6,23,'6-1036',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',7108,0,NULL,'DECREASE'),(544,2,6,23,'6-1035',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',3554,0,NULL,'DECREASE'),(545,2,6,23,'6-1035',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',12439,0,NULL,'DECREASE'),(546,2,6,23,'6-1034',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',10662,0,NULL,'DECREASE'),(547,2,6,23,'6-1033',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',5331,0,NULL,'DECREASE'),(548,2,6,16,'6-1069',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',1777,0,NULL,'DECREASE'),(549,2,6,16,'6-1040',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',10662,0,NULL,'DECREASE'),(550,2,6,16,'6-1039',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',8885,0,NULL,'DECREASE'),(551,2,6,16,'6-1038',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',14216,0,NULL,'DECREASE'),(552,2,6,16,'6-1037',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',7108,0,NULL,'DECREASE'),(553,2,6,16,'6-1034',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',3554,0,NULL,'DECREASE'),(554,2,6,16,'6-1033',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',1777,0,NULL,'DECREASE'),(555,2,6,16,'6-1033',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-01',1777,0,NULL,'DECREASE'),(556,2,7,47,'6-0930',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',8535,0,NULL,'DECREASE'),(557,2,7,47,'6-0929',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',13656,0,NULL,'DECREASE'),(558,2,7,47,'6-0928',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',15363,0,NULL,'DECREASE'),(559,2,7,47,'6-0927',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',15363,0,NULL,'DECREASE'),(560,2,7,47,'6-0926-1',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',6828,0,NULL,'DECREASE'),(561,2,7,42,'Y-0639',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',5121,0,NULL,'DECREASE'),(562,2,7,42,'Y-0638',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',1707,0,NULL,'DECREASE'),(563,2,7,42,'Y-0638',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-12-31',8535,0,NULL,'DECREASE'),(564,2,7,42,'6-0931',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',6828,0,NULL,'DECREASE'),(565,2,7,42,'2-1112-2',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-06',1707,0,NULL,'DECREASE'),(566,2,7,35,'4-0864',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',8535,0,NULL,'DECREASE'),(567,2,7,35,'4-0863',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',15363,0,NULL,'DECREASE'),(568,2,7,35,'4-0862',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',13656,0,NULL,'DECREASE'),(569,2,7,35,'2-1114',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-06',11949,0,NULL,'DECREASE'),(570,2,7,35,'2-1112-2',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-06',3414,0,NULL,'DECREASE'),(571,2,7,32,'06-482393',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-17',2276,0,NULL,'DECREASE'),(572,2,7,32,'06-482385',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-19',6828,0,NULL,'DECREASE'),(573,2,7,32,'06-482383',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-19',9104,0,NULL,'DECREASE'),(574,2,7,32,'06-482196',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-19',2276,0,NULL,'DECREASE'),(575,2,7,32,'06-482196',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-17',2276,0,NULL,'DECREASE'),(576,2,7,32,'06-482194',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-17',2276,0,NULL,'DECREASE'),(577,2,7,18,'6-0931',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',10242,0,NULL,'DECREASE'),(578,2,7,18,'6-0930',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',6828,0,NULL,'DECREASE'),(579,2,7,18,'6-0926',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',8535,0,NULL,'DECREASE'),(580,2,7,18,'6-0925',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',15363,0,NULL,'DECREASE'),(581,2,7,18,'6-0921',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',1707,0,NULL,'DECREASE'),(582,2,7,18,'6-0912',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',8535,0,NULL,'DECREASE'),(583,2,7,18,'6-0912',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',1707,0,NULL,'DECREASE'),(584,2,7,18,'4-0864',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-23',6828,0,NULL,'DECREASE'),(585,2,8,49,'8-0992',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',1783,0,NULL,'DECREASE'),(586,2,8,49,'8-0991',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',12481,0,NULL,'DECREASE'),(587,2,8,49,'8-0990',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',5349,0,NULL,'DECREASE'),(588,2,8,49,'8-0988-1',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',1783,0,NULL,'DECREASE'),(589,2,8,49,'8-0988',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',8915,0,NULL,'DECREASE'),(590,2,8,49,'8-0938',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',5349,0,NULL,'DECREASE'),(591,2,8,49,'8-0936',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',12481,0,NULL,'DECREASE'),(592,2,8,49,'8-0934',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',8915,0,NULL,'DECREASE'),(593,2,8,34,'X-0718',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',16047,0,NULL,'DECREASE'),(594,2,8,34,'X-0717',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',16047,0,NULL,'DECREASE'),(595,2,8,34,'X-0716-1',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',5349,0,NULL,'DECREASE'),(596,2,8,34,'X-0716',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',5349,0,NULL,'DECREASE'),(597,2,8,34,'8-0993',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',14264,0,NULL,'DECREASE'),(598,2,8,34,'8-0992',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',3566,0,NULL,'DECREASE'),(599,2,8,34,'8-0989',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',1783,0,NULL,'DECREASE'),(600,2,8,24,'8-0935-1',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',7132,0,NULL,'DECREASE'),(601,2,8,24,'8-0935',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',7132,0,NULL,'DECREASE'),(602,2,8,24,'8-0934',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',7132,0,NULL,'DECREASE'),(603,2,8,24,'6-0924',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',8915,0,NULL,'DECREASE'),(604,2,8,24,'6-0921',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',1783,0,NULL,'DECREASE'),(605,2,8,21,'8-0990',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',3566,0,NULL,'DECREASE'),(606,2,8,21,'8-0988',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',1783,0,NULL,'DECREASE'),(607,2,8,21,'6-0924',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',3566,0,NULL,'DECREASE'),(608,2,8,21,'6-0923',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',16047,0,NULL,'DECREASE'),(609,2,8,21,'6-0922',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',16047,0,NULL,'DECREASE'),(610,2,8,21,'6-0921',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',1783,0,NULL,'DECREASE'),(611,2,8,21,'6-0920',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',8915,0,NULL,'DECREASE'),(612,2,8,21,'6-0916',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',1783,0,NULL,'DECREASE'),(613,2,8,21,'6-0915',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-05',5349,0,NULL,'DECREASE'),(614,2,8,19,'8-0992',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',8915,0,NULL,'DECREASE'),(615,2,8,19,'8-0992',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',1783,0,NULL,'DECREASE'),(616,2,8,19,'8-0991',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',3566,0,NULL,'DECREASE'),(617,2,8,19,'8-0990',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',7132,0,NULL,'DECREASE'),(618,2,8,19,'8-0989',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',3566,0,NULL,'DECREASE'),(619,2,8,19,'8-0989',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',10698,0,NULL,'DECREASE'),(620,2,8,19,'8-0988-1',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',1783,0,NULL,'DECREASE'),(621,2,8,19,'8-0938',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',7132,0,NULL,'DECREASE'),(622,2,8,19,'8-0938',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',3566,0,NULL,'DECREASE'),(623,2,8,19,'8-0937',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-24',16047,0,NULL,'DECREASE'),(624,2,9,44,'07-482341',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-27',6496,0,NULL,'DECREASE'),(625,2,9,44,'05-482294',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',3248,0,NULL,'DECREASE'),(626,2,9,44,'05-482293',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',9744,0,NULL,'DECREASE'),(627,2,9,44,'05-482292',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-13',14616,0,NULL,'DECREASE'),(628,2,9,31,'Y-0649',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',15345,0,NULL,'DECREASE'),(629,2,9,31,'Y-0400',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',8525,0,NULL,'DECREASE'),(630,2,9,31,'6-0969',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',8525,0,NULL,'DECREASE'),(631,2,9,26,'6-0969',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',5115,0,NULL,'DECREASE'),(632,2,9,26,'6-0968',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',5115,0,NULL,'DECREASE'),(633,2,9,26,'6-0965',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',11935,0,NULL,'DECREASE'),(634,2,9,26,'6-0964',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',3410,0,NULL,'DECREASE'),(635,2,9,26,'6-0964',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-29',8525,0,NULL,'DECREASE'),(636,2,9,26,'6-0963',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-29',13640,0,NULL,'DECREASE'),(637,2,9,26,'4-0891',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-24',3410,0,NULL,'DECREASE'),(638,2,9,25,'6-0969',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',3410,0,NULL,'DECREASE'),(639,2,9,25,'6-0968',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',10230,0,NULL,'DECREASE'),(640,2,9,25,'6-0967',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',15345,0,NULL,'DECREASE'),(641,2,9,25,'4-0891',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-04-24',13640,0,NULL,'DECREASE'),(642,2,9,25,'3-1221',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-26',5115,0,NULL,'DECREASE'),(643,2,9,25,'2-1154',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',1705,0,NULL,'DECREASE'),(644,2,9,25,'2-1152',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',1705,0,NULL,'DECREASE'),(645,2,9,22,'3-1221',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-26',3410,0,NULL,'DECREASE'),(646,2,9,22,'3-1220',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-25',6898,0,NULL,'DECREASE'),(647,2,9,22,'3-1219',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-25',13874,0,NULL,'DECREASE'),(648,2,9,22,'2-1154',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',8525,0,NULL,'DECREASE'),(649,2,9,22,'2-1140-2',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',3410,0,NULL,'DECREASE'),(650,2,9,20,'6-0966',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',15345,0,NULL,'DECREASE'),(651,2,9,20,'6-0965',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-06-30',3410,0,NULL,'DECREASE'),(652,2,9,20,'2-1154',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',1705,0,NULL,'DECREASE'),(653,2,9,20,'2-1140-2',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-03-07',3410,0,NULL,'DECREASE'),(654,2,10,50,'20231215',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-12-01',12,0,NULL,'DECREASE'),(655,2,10,36,'8-1007',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',8165,0,NULL,'DECREASE'),(656,2,10,36,'8-1006',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',8165,0,NULL,'DECREASE'),(657,2,10,36,'8-1005',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',13064,0,NULL,'DECREASE'),(658,2,10,36,'8-1004',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',4899,0,NULL,'DECREASE'),(659,2,10,36,'8-1002',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',11431,0,NULL,'DECREASE'),(660,2,10,36,'8-1001',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',11431,0,NULL,'DECREASE'),(661,2,10,36,'8-0999',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',1633,0,NULL,'DECREASE'),(662,2,10,33,'X-0734',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',14697,0,NULL,'DECREASE'),(663,2,10,33,'X-0733',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',6532,0,NULL,'DECREASE'),(664,2,10,33,'X-0732-1',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',11431,0,NULL,'DECREASE'),(665,2,10,33,'X-0732',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-22',3266,0,NULL,'DECREASE'),(666,2,10,33,'8-1009',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',1633,0,NULL,'DECREASE'),(667,2,10,28,'8-1005',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',3266,0,NULL,'DECREASE'),(668,2,10,28,'8-1004',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',9798,0,NULL,'DECREASE'),(669,2,10,28,'8-1003',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',14697,0,NULL,'DECREASE'),(670,2,10,28,'8-1001',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',1633,0,NULL,'DECREASE'),(671,2,10,28,'6-0955',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',1633,0,NULL,'DECREASE'),(672,2,10,28,'6-0954',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',3266,0,NULL,'DECREASE'),(673,2,10,28,'6-0953',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',14697,0,NULL,'DECREASE'),(674,2,10,28,'6-0953',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-04',1633,0,NULL,'DECREASE'),(675,2,10,28,'6-0952-1',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',3266,0,NULL,'DECREASE'),(676,2,10,28,'6-0951',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-07',3266,0,NULL,'DECREASE'),(677,2,10,27,'8-1009',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',8165,0,NULL,'DECREASE'),(678,2,10,27,'8-1007',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',3266,0,NULL,'DECREASE'),(679,2,10,27,'8-0998',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-25',1633,0,NULL,'DECREASE'),(680,2,11,29,'Y-0937-2',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-06',1753,0,NULL,'DECREASE'),(681,2,11,29,'Y-0647-2',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',5259,0,NULL,'DECREASE'),(682,2,11,29,'Y-0645',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-03',15777,0,NULL,'DECREASE'),(683,2,12,46,'09-484389',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',3628,0,NULL,'DECREASE'),(684,2,12,46,'09-484387',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',5442,0,NULL,'DECREASE'),(685,2,12,46,'09-484385',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',5442,0,NULL,'DECREASE'),(686,2,12,46,'09-484382',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',3628,0,NULL,'DECREASE'),(687,2,12,46,'09-484381',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',3628,0,NULL,'DECREASE'),(688,2,12,46,'09-484379',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',3628,0,NULL,'DECREASE'),(689,2,12,46,'09-482319',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-29',1814,0,NULL,'DECREASE'),(690,2,12,46,'09-482305',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-29',1814,0,NULL,'DECREASE'),(691,2,12,46,'09-482147',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',1814,0,NULL,'DECREASE'),(692,2,12,46,'09-482146',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',12698,0,NULL,'DECREASE'),(693,2,12,45,'09-482322',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-23',3628,0,NULL,'DECREASE'),(694,2,12,45,'09-482151',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',1814,0,NULL,'DECREASE'),(695,2,12,45,'09-482149',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',1814,0,NULL,'DECREASE'),(696,2,12,45,'09-482147',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-16',9070,0,NULL,'DECREASE'),(697,2,12,45,'09-482125',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-13',9070,0,NULL,'DECREASE'),(698,2,12,37,'10-484128',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-10-05',3628,0,NULL,'DECREASE'),(699,2,12,37,'09-484684',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',1814,0,NULL,'DECREASE'),(700,2,12,37,'09-484389',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-10-05',1814,0,NULL,'DECREASE'),(701,2,12,37,'09-484389',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',3628,0,NULL,'DECREASE'),(702,2,12,37,'09-484387',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',3628,0,NULL,'DECREASE'),(703,2,12,37,'09-484385',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',3628,0,NULL,'DECREASE'),(704,2,12,37,'09-484384',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-29',1814,0,NULL,'DECREASE'),(705,2,12,37,'09-484384',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',7256,0,NULL,'DECREASE'),(706,2,12,37,'09-484382',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',1814,0,NULL,'DECREASE'),(707,2,12,37,'09-484381',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',10884,0,NULL,'DECREASE'),(708,2,12,37,'09-484379',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',5442,0,NULL,'DECREASE'),(709,2,12,37,'09-482305',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-09-24',1814,0,NULL,'DECREASE'),(710,2,13,50,'01-484731',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-02-05',1790,0,NULL,'DECREASE'),(711,2,13,50,'01-484731',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-01-31',7496,0,NULL,'DECREASE'),(712,2,14,50,'RETURN-003',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-06-01',635,0,NULL,'DECREASE'),(713,2,14,50,'RETURN-002',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-06-01',490,0,NULL,'DECREASE'),(714,2,14,50,'RETURN-001',NULL,3,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-06-01',1510,0,NULL,'DECREASE'),(715,2,15,12,'GOP134274','2023-10-25',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-26',6270,0,NULL,'DECREASE'),(716,2,16,12,'BDC370458','2023-01-28',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-01',1000,0,NULL,'DECREASE'),(717,2,17,12,'BDC378564','2024-01-10',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-14',3300,0,NULL,'DECREASE'),(718,2,17,12,'BDC369082','2023-01-24',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-07-28',103.95,0,NULL,'DECREASE'),(719,2,17,12,'BDC351308','2021-01-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2020-07-22',220,0,NULL,'DECREASE'),(720,2,17,12,'BDC338650','2019-11-12',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-05-19',988.9,0,NULL,'DECREASE'),(721,2,18,12,'8635099570','2019-05-10',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-05-10',569.3,0,NULL,'DECREASE'),(722,2,18,12,'3394127754','2024-03-06',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-06',4100.25,0,NULL,'DECREASE'),(723,2,18,12,'2V35127471','2023-11-12',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-12',1562,0,NULL,'DECREASE'),(724,2,19,12,'2835126287','2023-08-26',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-26',2631.1800000000007,0,NULL,'DECREASE'),(725,2,20,12,'321H060810','2024-02-02',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-02-02',1600,0,NULL,'DECREASE'),(726,2,21,12,'9T1H048489','2020-06-26',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-06-26',119,0,NULL,'DECREASE'),(727,2,21,12,'8W1H045295','2019-09-14',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-09-14',1635.3,0,NULL,'DECREASE'),(728,2,21,12,'321H060764','2023-11-05',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-05',500,0,NULL,'DECREASE'),(729,2,21,12,'181H055343','2022-04-04',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-04-04',76,0,NULL,'DECREASE'),(730,2,22,12,'P131337098','2022-03-22',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-09-22',440,0,NULL,'DECREASE'),(731,2,23,12,'P140339688','2022-04-26',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-10-26',440,0,NULL,'DECREASE'),(732,2,24,12,'TEO407','2023-11-22',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-05-26',7440,0,NULL,'DECREASE'),(733,2,25,12,'TFO167','2023-12-13',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-06-16',1000,0,NULL,'DECREASE'),(734,2,25,12,'TEO154','2023-11-08',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-06-01',3000,0,NULL,'DECREASE'),(735,2,26,12,'TEO361','2023-12-06',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-06-09',400,0,NULL,'DECREASE'),(736,2,27,12,'TFO429','2023-12-16',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-06-19',400,0,NULL,'DECREASE'),(737,2,28,12,'FH3310XA3','2021-11-27',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2020-11-27',93.65,0,NULL,'DECREASE'),(738,2,28,12,'875C016011','2019-01-22',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-07-26',394,0,NULL,'DECREASE'),(739,2,29,12,'F1808083654','2019-02-15',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-08-15',194.8,0,NULL,'DECREASE'),(740,2,29,12,'1808083654','2019-02-15',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-08-15',96,0,NULL,'DECREASE'),(741,2,30,12,'F1808083655','2019-02-15',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-08-15',219.8,0,NULL,'DECREASE'),(742,2,30,12,'1808083655','2019-02-15',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-08-15',167,0,NULL,'DECREASE'),(743,2,31,12,'1318Y1910','2019-05-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-11-19',81,0,NULL,'DECREASE'),(744,2,32,12,'1318Y1909','2019-05-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2018-11-19',76.8,0,NULL,'DECREASE'),(745,2,33,12,'BDC370729','2023-02-04',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-08-08',88.14,0,NULL,'DECREASE'),(746,2,33,12,'BDC351252','2021-01-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2020-07-22',252.5,0,NULL,'DECREASE'),(747,2,34,12,'9V1A040676','2020-05-03',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-11-03',420,0,NULL,'DECREASE'),(748,2,34,12,'961A039173','2019-11-30',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-05-30',123,0,NULL,'DECREASE'),(749,2,35,12,'BDC347233','2020-09-14',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2020-03-18',28,0,NULL,'DECREASE'),(750,2,36,12,'BDC356440','2021-08-30',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2021-03-03',800,0,NULL,'DECREASE'),(751,2,37,14,'2749980117','2024-02-26',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-03',759,0,NULL,'DECREASE'),(752,2,37,14,'2749980116','2024-02-26',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-03',1004,0,NULL,'DECREASE'),(753,2,37,14,'2749980112','2024-02-26',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-03',988,0,NULL,'DECREASE'),(754,2,37,14,'2749980111','2024-02-26',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-03-03',1261,0,NULL,'DECREASE'),(755,2,38,14,'2733230202','2023-05-02',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-03',984,0,NULL,'DECREASE'),(756,2,38,14,'2733230201','2023-05-02',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-03',976,0,NULL,'DECREASE'),(757,2,38,14,'2733230199','2023-05-02',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-11-03',984,0,NULL,'DECREASE'),(758,2,38,14,'2731990165','2023-07-17',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-18',984,0,NULL,'DECREASE'),(759,2,38,14,'2731990015','2023-07-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',996,0,NULL,'DECREASE'),(760,2,38,14,'2731990014','2023-07-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',992,0,NULL,'DECREASE'),(761,2,38,14,'2731990013','2023-07-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',992,0,NULL,'DECREASE'),(762,2,38,14,'2731990012','2023-07-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',996,0,NULL,'DECREASE'),(763,2,38,14,'2731990011','2023-07-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',984,0,NULL,'DECREASE'),(764,2,38,14,'2731990010','2023-07-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',988,0,NULL,'DECREASE'),(765,2,38,14,'2731990009','2023-07-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-01-19',988,0,NULL,'DECREASE'),(766,2,39,14,'2773861105','2024-01-28',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-08-01',972,0,NULL,'DECREASE'),(767,2,39,14,'2773861104','2024-01-28',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-08-01',984,0,NULL,'DECREASE'),(768,2,39,14,'2773861101','2024-01-27',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-31',988,0,NULL,'DECREASE'),(769,2,39,14,'2773861100','2024-01-27',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-31',988,0,NULL,'DECREASE'),(770,2,39,14,'2773861092','2024-01-25',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-29',984,0,NULL,'DECREASE'),(771,2,39,14,'2773861091','2024-01-25',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-29',984,0,NULL,'DECREASE'),(772,2,39,14,'2773861048','2024-01-20',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-24',972,0,NULL,'DECREASE'),(773,2,39,14,'2773861047','2024-01-20',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-24',980,0,NULL,'DECREASE'),(774,2,39,14,'2773861040','2024-01-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-22',980,0,NULL,'DECREASE'),(775,2,39,14,'2773861039','2024-01-18',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-22',980,0,NULL,'DECREASE'),(776,2,39,14,'2773861026','2024-01-17',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-21',980,0,NULL,'DECREASE'),(777,2,39,14,'2773861025','2024-01-17',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-21',980,0,NULL,'DECREASE'),(778,2,39,14,'2773861017','2024-01-16',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-20',976,0,NULL,'DECREASE'),(779,2,39,14,'2773861016','2024-01-16',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-20',976,0,NULL,'DECREASE'),(780,2,39,14,'2773861010','2024-01-15',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-19',980,0,NULL,'DECREASE'),(781,2,39,14,'2773861009','2024-01-15',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-19',980,0,NULL,'DECREASE'),(782,2,39,14,'2773861002','2024-01-14',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-18',976,0,NULL,'DECREASE'),(783,2,39,14,'2773861001','2024-01-14',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-18',980,0,NULL,'DECREASE'),(784,2,39,14,'2773860997','2024-01-13',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2023-07-17',996,0,NULL,'DECREASE'),(785,2,40,14,'2698100160','2023-05-01',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-06',1020,0,NULL,'DECREASE'),(786,2,40,14,'2698100157','2023-04-30',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-05',1024,0,NULL,'DECREASE'),(787,2,40,14,'2698100155','2023-04-30',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2022-05-05',1024,0,NULL,'DECREASE'),(788,2,41,14,'2415360003','2019-09-15',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-03-19',984,0,NULL,'DECREASE'),(789,2,41,14,'2415360002','2019-09-15',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-03-19',735,0,NULL,'DECREASE'),(790,2,41,14,'2415360001','2019-09-15',4,0,0,0,'2024-01-09 04:02:44',1,NULL,NULL,'variance in cycle count',NULL,'2019-03-19',244,0,NULL,'DECREASE'),(791,3,9,6,'BATCH001','2025-02-01',3,15,15,0,'2024-02-14 04:36:36',1,'2024-02-14 04:36:36',1,'Wrong Quantity',NULL,'2024-02-01',15,0,NULL,'INCREASE'),(792,3,9,6,'BATCH002','2025-02-01',3,5,5,0,'2024-02-14 04:36:56',1,'2024-02-14 04:36:56',1,'Wrong Quantity',NULL,'2024-02-01',5,0,NULL,'INCREASE'),(793,3,10,6,'BATCH003','2026-02-01',3,30,30,0,'2024-02-14 04:37:21',1,'2024-02-14 04:37:21',1,'Wrong Quantity',NULL,'2024-02-01',30,0,NULL,'INCREASE'),(794,3,10,6,'BATCH004','2026-02-02',3,20,20,0,'2024-02-14 04:37:49',1,'2024-02-14 04:37:49',1,'Wrong Quantity',NULL,'2024-02-02',20,0,NULL,'INCREASE');
/*!40000 ALTER TABLE `stock_adjustment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustment_header`
--

DROP TABLE IF EXISTS `stock_adjustment_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_adjustment_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(45) NOT NULL,
  `document_date` date DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `reference` varchar(80) DEFAULT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  `stock_adjustment_approver_id` int(11) DEFAULT NULL,
  `reason` text,
  `rejected_date` datetime DEFAULT NULL,
  `rejected_by` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `overall_inventory` tinyint(1) DEFAULT '0',
  `cycle_count_header_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `cancelled_by` (`cancelled_by`),
  KEY `stock_adjustment_approver_id` (`stock_adjustment_approver_id`),
  KEY `rejected_by` (`rejected_by`),
  KEY `approved_by` (`approved_by`),
  KEY `cycle_count_header_id` (`cycle_count_header_id`),
  CONSTRAINT `stock_adjustment_header_ibfk_1` FOREIGN KEY (`cycle_count_header_id`) REFERENCES `cycle_count_header` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustment_header`
--

LOCK TABLES `stock_adjustment_header` WRITE;
/*!40000 ALTER TABLE `stock_adjustment_header` DISABLE KEYS */;
INSERT INTO `stock_adjustment_header` VALUES (1,'ADJ00000001','FOR APPROVAL','2024-01-09',53,NULL,NULL,'2024-01-09 01:57:51',1,NULL,NULL,'2024-01-09 02:25:37',1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL),(2,'ADJ00000002','LOGGED','2024-01-09',53,'CC00000001','Auto-generated from cycle count variance [CC00000001]','2024-01-09 04:02:44',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Variance Found in Cycle Count',NULL,NULL,NULL,NULL,0,1),(3,'ADJ00000003','POSTED','2024-02-14',50,NULL,NULL,'2024-02-14 04:36:08',1,NULL,NULL,'2024-02-14 04:38:10',1,NULL,NULL,'FOR APPROVAL=>APPROVED',1,NULL,NULL,NULL,'2024-02-14 04:38:12',1,0,NULL);
/*!40000 ALTER TABLE `stock_adjustment_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_card`
--

DROP TABLE IF EXISTS `stock_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_movement` varchar(80) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `base_quantity` double DEFAULT NULL,
  `warehouse_batch` double DEFAULT '0',
  `warehouse_balance` double DEFAULT '0',
  `batch_balance` double DEFAULT '0',
  `total_balance` double DEFAULT '0',
  `inventory_flag` tinyint(1) DEFAULT '0',
  `module` varchar(80) DEFAULT NULL,
  `transaction_number` varchar(80) DEFAULT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `pdt_flag` tinyint(1) NOT NULL DEFAULT '0',
  `pallet_number` varchar(80) DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `pallet_balance` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43566 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_card`
--

LOCK TABLES `stock_card` WRITE;
/*!40000 ALTER TABLE `stock_card` DISABLE KEYS */;
INSERT INTO `stock_card` VALUES (43538,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,2000,185612,2000,185612,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->e','2024-01-19 02:10:55',1,0,NULL,NULL,'2024-01-01',0,0),(43539,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:11:18',1,1,NULL,NULL,'2024-01-01',0,NULL),(43540,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:11:52',1,1,NULL,NULL,'2024-01-01',0,NULL),(43541,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,1500,185112,1500,185112,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->wer','2024-01-19 02:12:31',1,0,NULL,NULL,'2024-01-01',0,0),(43542,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,2000,185612,2000,185612,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->werwe','2024-01-19 02:12:34',1,0,NULL,NULL,'2024-01-01',0,0),(43543,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:13:35',1,1,NULL,NULL,'2024-01-01',0,NULL),(43544,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,1500,185112,1500,185112,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->f','2024-01-19 02:14:17',1,0,NULL,NULL,'2024-01-01',0,0),(43545,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,2000,185612,2000,185612,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->asd','2024-01-19 02:14:20',1,0,NULL,NULL,'2024-01-01',0,0),(43546,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:14:35',1,1,NULL,NULL,'2024-01-01',0,NULL),(43547,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,1000,184612,1000,184612,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->werwe','2024-01-19 02:16:55',1,0,NULL,NULL,'2024-01-01',0,0),(43548,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,1500,185112,1500,185112,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->wer','2024-01-19 02:16:58',1,0,NULL,NULL,'2024-01-01',0,0),(43549,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,2000,185612,2000,185612,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->werwe','2024-01-19 02:17:01',1,0,NULL,NULL,'2024-01-01',0,0),(43550,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:25:53',1,1,NULL,NULL,'2024-01-01',0,NULL),(43551,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:25:58',1,1,NULL,NULL,'2024-01-01',0,NULL),(43552,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:26:22',1,1,NULL,NULL,'2024-01-01',0,NULL),(43553,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:26:28',1,1,NULL,NULL,'2024-01-01',0,NULL),(43554,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,500,184112,500,184112,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->dfg','2024-01-19 02:39:19',1,0,NULL,NULL,'2024-01-01',0,0),(43555,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,1000,184612,1000,184612,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->dfg','2024-01-19 02:39:21',1,0,NULL,NULL,'2024-01-01',0,0),(43556,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,1500,185112,1500,185112,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->dfg','2024-01-19 02:39:24',1,0,NULL,NULL,'2024-01-01',0,0),(43557,'INCREASE',10,11,'BATCH002','2024-12-30',500,3,500,2000,185612,2000,185612,1,'PICKING (REVERSAL)','PKL00000006','PICKING REVERSAL: Reason->dfg','2024-01-19 02:39:26',1,0,NULL,NULL,'2024-01-01',0,0),(43558,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:43:06',1,1,NULL,NULL,'2024-01-01',0,NULL),(43559,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:47:18',1,1,NULL,NULL,'2024-01-01',0,NULL),(43560,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:47:25',1,1,NULL,NULL,'2024-01-01',0,NULL),(43561,'DECREASE',10,11,'BATCH002','2024-12-30',500,3,500,0,0,0,0,1,'PICKING','PKL00000006',NULL,'2024-01-19 02:47:28',1,1,NULL,NULL,'2024-01-01',0,NULL),(43562,'INCREASE',9,6,'BATCH001','2025-02-01',15,3,15,15,15,1015,287240,1,'STOCK ADJUSTMENT','ADJ00000003','Wrong Quantity','2024-02-14 04:38:12',1,0,NULL,NULL,'2024-02-01',15,0),(43563,'INCREASE',9,6,'BATCH002','2025-02-01',5,3,5,5,20,5,287245,1,'STOCK ADJUSTMENT','ADJ00000003','Wrong Quantity','2024-02-14 04:38:12',1,0,NULL,NULL,'2024-02-01',5,0),(43564,'INCREASE',10,6,'BATCH003','2026-02-01',30,3,30,30,30,30,183642,1,'STOCK ADJUSTMENT','ADJ00000003','Wrong Quantity','2024-02-14 04:38:12',1,0,NULL,NULL,'2024-02-01',30,0),(43565,'INCREASE',10,6,'BATCH004','2026-02-02',20,3,20,20,50,20,183662,1,'STOCK ADJUSTMENT','ADJ00000003','Wrong Quantity','2024-02-14 04:38:12',1,0,NULL,NULL,'2024-02-02',20,0);
/*!40000 ALTER TABLE `stock_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_card_backup`
--

DROP TABLE IF EXISTS `stock_card_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_card_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_movement` varchar(80) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `base_quantity` double DEFAULT NULL,
  `warehouse_batch` double DEFAULT '0',
  `warehouse_balance` double DEFAULT '0',
  `batch_balance` double DEFAULT '0',
  `total_balance` double DEFAULT '0',
  `inventory_flag` tinyint(1) DEFAULT '0',
  `module` varchar(80) DEFAULT NULL,
  `transaction_number` varchar(80) DEFAULT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `pdt_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_card_backup`
--

LOCK TABLES `stock_card_backup` WRITE;
/*!40000 ALTER TABLE `stock_card_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_card_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_card_matched_trail`
--

DROP TABLE IF EXISTS `stock_card_matched_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_card_matched_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_movement` varchar(80) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `base_quantity` double DEFAULT NULL,
  `warehouse_batch` double DEFAULT '0',
  `warehouse_balance` double DEFAULT '0',
  `batch_balance` double DEFAULT '0',
  `total_balance` double DEFAULT '0',
  `inventory_flag` tinyint(1) DEFAULT '0',
  `module` varchar(80) DEFAULT NULL,
  `transaction_number` varchar(80) DEFAULT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `pdt_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_card_matched_trail`
--

LOCK TABLES `stock_card_matched_trail` WRITE;
/*!40000 ALTER TABLE `stock_card_matched_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_card_matched_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_receipt_costing`
--

DROP TABLE IF EXISTS `stock_receipt_costing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_receipt_costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_receipt_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `po_price` double DEFAULT '0',
  `other_charges` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_receipt_costing`
--

LOCK TABLES `stock_receipt_costing` WRITE;
/*!40000 ALTER TABLE `stock_receipt_costing` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_receipt_costing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_receipt_details`
--

DROP TABLE IF EXISTS `stock_receipt_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_receipt_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_receipt_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(128) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `remarks` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `pdt_flag` tinyint(1) NOT NULL DEFAULT '0',
  `po_price` double DEFAULT '0',
  `other_charges` double DEFAULT '0',
  `excise_tax` double DEFAULT '0',
  `vat` double DEFAULT '0',
  `vat_di` double DEFAULT '0',
  `pallet_number` varchar(80) DEFAULT NULL,
  `weight` decimal(24,4) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `box_number` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `updated_by` (`updated_by`),
  KEY `item_id` (`item_id`),
  KEY `unit_of_measure_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `stock_receipt_header_id` (`stock_receipt_header_id`),
  KEY `pallet_number` (`pallet_number`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_receipt_details`
--

LOCK TABLES `stock_receipt_details` WRITE;
/*!40000 ALTER TABLE `stock_receipt_details` DISABLE KEYS */;
INSERT INTO `stock_receipt_details` VALUES (2,3,31,'1318Y1910','2019-05-18',4,21,21,'AUTO-POPULATED','2023-12-14 14:03:48',1,NULL,NULL,0,0,0,0,0,0,NULL,0.0000,'2018-11-19',NULL),(5,7,9,'2-1152',NULL,3,400,400,NULL,'2023-12-14 17:13:55',1,NULL,NULL,1,0,0,0,0,0,NULL,0.0000,'2022-03-07','000000000004'),(6,8,6,'20231215',NULL,3,400,400,NULL,'2023-12-15 12:29:33',1,'2023-12-15 12:29:33',1,0,NULL,0,0,0,0,NULL,400.0000,'2023-12-01','000000000006'),(7,8,10,'20231215',NULL,3,12,12,NULL,'2023-12-15 12:44:02',1,'2023-12-15 12:44:02',1,0,NULL,0,0,0,0,NULL,12.0000,'2023-12-01','000000000007'),(8,9,9,'240108',NULL,3,25,25,'AUTO-POPULATED','2024-01-08 03:05:24',1,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,'000000000008'),(9,9,10,'240108',NULL,3,15,15,'AUTO-POPULATED','2024-01-08 03:05:24',1,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,'000000000009'),(32,10,9,'BATCH001','2024-12-30',3,1000,1000,'UPLOADED','2024-01-18 00:24:50',1,NULL,NULL,0,0,0,0,0,0,NULL,0.0000,'2024-01-01','BG000000000032'),(33,10,10,'BATCH002','2024-12-30',3,500,500,'UPLOADED','2024-01-18 00:24:50',1,NULL,NULL,0,0,0,0,0,0,NULL,0.0000,'2024-01-01','BG000000000033'),(34,10,10,'BATCH002','2024-12-30',3,500,500,'UPLOADED','2024-01-18 00:24:50',1,NULL,NULL,0,0,0,0,0,0,NULL,0.0000,'2024-01-01','BG000000000034'),(35,10,10,'BATCH002','2024-12-30',3,500,500,'UPLOADED','2024-01-18 00:24:50',1,NULL,NULL,0,0,0,0,0,0,NULL,0.0000,'2024-01-01','BG000000000035'),(36,10,10,'BATCH002','2024-12-30',3,500,500,'UPLOADED','2024-01-18 00:24:50',1,NULL,NULL,0,0,0,0,0,0,NULL,0.0000,'2024-01-01','BG000000000036'),(38,11,9,'20240214','2024-02-14',3,12,12,NULL,'2024-02-14 03:17:46',1,'2024-02-14 03:17:46',1,0,NULL,0,0,0,0,NULL,12.0000,'2024-02-29','BG000000000038'),(39,12,9,'240214','2024-03-09',3,12,12,NULL,'2024-02-14 03:19:12',1,'2024-02-14 03:19:12',1,0,0,0,0,0,0,NULL,0.0000,'2024-02-14','BG000000000039');
/*!40000 ALTER TABLE `stock_receipt_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_receipt_header`
--

DROP TABLE IF EXISTS `stock_receipt_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_receipt_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(80) NOT NULL,
  `document_date` date NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `source_type` varchar(30) NOT NULL,
  `purchase_order_header_id` int(11) DEFAULT NULL,
  `stock_issuance_header_id` int(11) DEFAULT NULL,
  `source_rt_type` varchar(30) DEFAULT NULL,
  `source_ud_type` varchar(30) DEFAULT NULL,
  `source_client_id` int(11) DEFAULT NULL,
  `source_supplier_id` int(11) DEFAULT NULL,
  `source_warehouse_id` int(11) DEFAULT NULL,
  `reference_1` varchar(80) DEFAULT NULL,
  `reference_2` varchar(80) DEFAULT NULL,
  `reference_3` varchar(80) DEFAULT NULL,
  `remarks` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  `ie_number` varchar(80) DEFAULT NULL,
  `arr_date` date DEFAULT NULL,
  `stripping_date` date DEFAULT NULL,
  `dr_date` date DEFAULT NULL,
  `pbi_number` varchar(80) DEFAULT NULL,
  `container_number` varchar(80) DEFAULT NULL,
  `boat_note_number` varchar(80) DEFAULT NULL,
  `broker_name` varchar(80) DEFAULT NULL,
  `exchange_rate` double DEFAULT '0',
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  `user_defined_field6` varchar(128) DEFAULT NULL,
  `user_defined_field7` varchar(128) DEFAULT NULL,
  `user_defined_field8` varchar(128) DEFAULT NULL,
  `for_client_id` int(11) DEFAULT NULL,
  `client_transaction_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipt_number` (`transaction_number`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `closed_by` (`closed_by`),
  KEY `purchase_order_header_id` (`purchase_order_header_id`),
  KEY `source_client_id` (`source_client_id`),
  KEY `source_supplier_id` (`source_supplier_id`),
  KEY `source_warehouse_id` (`source_warehouse_id`),
  KEY `cancelled_by` (`cancelled_by`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_receipt_header`
--

LOCK TABLES `stock_receipt_header` WRITE;
/*!40000 ALTER TABLE `stock_receipt_header` DISABLE KEYS */;
INSERT INTO `stock_receipt_header` VALUES (3,'RCV00000003','CLOSED','2023-12-14',50,'ISS',NULL,1,NULL,NULL,NULL,NULL,NULL,'','DR00000001',NULL,'Auto-generated - issuance ISS00000001','2023-12-14 14:03:48',1,NULL,NULL,'2023-12-14 14:03:48',1,'2023-12-14 14:03:48',1,NULL,NULL,'Closed automatically upon posting. Generated putaway for all remaining items received [RCV00000003].',NULL,'2023-12-14',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'RCV00000004','LOGGED','2023-12-14',48,'UD',NULL,NULL,NULL,'WAREHOUSE',NULL,NULL,49,'TEST','WRWE',NULL,NULL,'2023-12-14 16:50:57',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-14','2023-12-14','2023-12-14',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'RCV00000005','POSTED','2023-12-14',53,'UD',NULL,NULL,NULL,'WAREHOUSE',NULL,NULL,49,NULL,NULL,NULL,NULL,'2023-12-14 17:05:26',1,NULL,NULL,'2023-12-14 17:08:17',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-14','2023-12-14','2023-12-14',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'RCV00000006','LOGGED','2023-12-14',48,'ISS',NULL,2,NULL,NULL,NULL,NULL,NULL,'NA','NA',NULL,NULL,'2023-12-14 17:12:42',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-14',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'RCV00000007','POSTED','2023-12-14',48,'ISS',NULL,2,NULL,NULL,NULL,NULL,NULL,'NA','NA',NULL,NULL,'2023-12-14 17:13:10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CLOSED=>POSTED \nRemarks: sdfgsdf',NULL,'2023-12-14',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'RCV00000008','CLOSED','2023-12-15',53,'UD',NULL,NULL,NULL,'WAREHOUSE',NULL,NULL,50,NULL,NULL,NULL,NULL,'2023-12-15 12:29:16',1,NULL,NULL,'2023-12-15 12:44:12',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-15','2023-12-15','2023-12-15',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'RCV00000009','POSTED','2024-01-08',53,'PO',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-08 02:20:24',1,NULL,NULL,'2024-01-08 03:56:09',1,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-08','2024-01-08','2024-01-08',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'RCV00000010','CLOSED','2024-01-17',53,'PO',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-17 17:36:07',1,NULL,NULL,'2024-01-18 00:25:02',1,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-17','2024-01-17','2024-01-17',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'RCV00000011','LOGGED','2024-02-14',53,'UD',NULL,NULL,NULL,'SUPPLIER',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-02-14 02:51:17',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-14','2024-02-14','2024-02-14',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'RCV00000012','LOGGED','2024-02-14',53,'PO',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-14 03:19:03',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-14','2024-02-14','2024-02-14',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stock_receipt_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `stock_receipt_received`
--

DROP TABLE IF EXISTS `stock_receipt_received`;
/*!50001 DROP VIEW IF EXISTS `stock_receipt_received`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stock_receipt_received` (
  `id` tinyint NOT NULL,
  `receipt_number` tinyint NOT NULL,
  `item_id` tinyint NOT NULL,
  `itm_reference` tinyint NOT NULL,
  `itm_name` tinyint NOT NULL,
  `itm_description` tinyint NOT NULL,
  `lot_number` tinyint NOT NULL,
  `expiry_date` tinyint NOT NULL,
  `Received` tinyint NOT NULL,
  `BaseReceived` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stock_receipt_remaining_po`
--

DROP TABLE IF EXISTS `stock_receipt_remaining_po`;
/*!50001 DROP VIEW IF EXISTS `stock_receipt_remaining_po`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stock_receipt_remaining_po` (
  `ponum` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `required` tinyint NOT NULL,
  `rcvd` tinyint NOT NULL,
  `remaining` tinyint NOT NULL,
  `baseunit` tinyint NOT NULL,
  `itemid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stock_receipt_remaining_to`
--

DROP TABLE IF EXISTS `stock_receipt_remaining_to`;
/*!50001 DROP VIEW IF EXISTS `stock_receipt_remaining_to`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stock_receipt_remaining_to` (
  `tonum` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `required` tinyint NOT NULL,
  `rcvd` tinyint NOT NULL,
  `remaining` tinyint NOT NULL,
  `baseunit` tinyint NOT NULL,
  `itemid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stock_withdrawal_details`
--

DROP TABLE IF EXISTS `stock_withdrawal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_withdrawal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_withdrawal_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `issued_quantity` double NOT NULL DEFAULT '0',
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_withdrawal_header_id` (`stock_withdrawal_header_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `stock_withdrawal_details_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_withdrawal_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_withdrawal_details_ibfk_3` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_withdrawal_details_ibfk_4` FOREIGN KEY (`stock_withdrawal_header_id`) REFERENCES `stock_withdrawal_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_withdrawal_details_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_withdrawal_details`
--

LOCK TABLES `stock_withdrawal_details` WRITE;
/*!40000 ALTER TABLE `stock_withdrawal_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_withdrawal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_withdrawal_header`
--

DROP TABLE IF EXISTS `stock_withdrawal_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_withdrawal_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(80) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_street_address` varchar(128) DEFAULT NULL,
  `client_district_address` varchar(80) DEFAULT NULL,
  `client_city_address` varchar(80) DEFAULT NULL,
  `client_region_address` varchar(80) DEFAULT NULL,
  `client_zip_code_address` varchar(80) DEFAULT NULL,
  `client_country_address` varchar(80) DEFAULT NULL,
  `reference` varchar(80) DEFAULT NULL,
  `remarks` text,
  `document_date` date DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `closed_by` (`closed_by`),
  KEY `cancelled_by` (`cancelled_by`),
  CONSTRAINT `stock_withdrawal_header_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_withdrawal_header_ibfk_2` FOREIGN KEY (`cancelled_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_withdrawal_header_ibfk_3` FOREIGN KEY (`closed_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_withdrawal_header_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_withdrawal_header_ibfk_5` FOREIGN KEY (`posted_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `stock_withdrawal_header_ibfk_6` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_withdrawal_header`
--

LOCK TABLES `stock_withdrawal_header` WRITE;
/*!40000 ALTER TABLE `stock_withdrawal_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_withdrawal_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory1`
--

DROP TABLE IF EXISTS `subcategory1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `code` varchar(80) NOT NULL,
  `description` varchar(80) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory1`
--

LOCK TABLES `subcategory1` WRITE;
/*!40000 ALTER TABLE `subcategory1` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategory1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory2`
--

DROP TABLE IF EXISTS `subcategory2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory1_id` int(11) NOT NULL,
  `code` varchar(80) NOT NULL,
  `description` varchar(80) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `subcategory1_id` (`subcategory1_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory2`
--

LOCK TABLES `subcategory2` WRITE;
/*!40000 ALTER TABLE `subcategory2` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategory2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `supplier_group_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `fax` varchar(80) DEFAULT NULL,
  `telephone` varchar(80) DEFAULT NULL,
  `mobile` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `supplier_ibfk_1` (`supplier_group_id`),
  KEY `supplier_ibfk_2` (`term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'UNILEVER','UNILEVER',NULL,NULL,'','','','','2024-01-08 02:19:49',1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_address`
--

DROP TABLE IF EXISTS `supplier_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '1',
  `street` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `district` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_address`
--

LOCK TABLES `supplier_address` WRITE;
/*!40000 ALTER TABLE `supplier_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_contact`
--

DROP TABLE IF EXISTS `supplier_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '1',
  `name` varchar(80) DEFAULT NULL,
  `designation` varchar(80) DEFAULT NULL,
  `telephone` varchar(80) DEFAULT NULL,
  `mobile` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `street` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `district` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_contact`
--

LOCK TABLES `supplier_contact` WRITE;
/*!40000 ALTER TABLE `supplier_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_for_client`
--

DROP TABLE IF EXISTS `supplier_for_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_for_client` (
  `supplier_id` int(11) NOT NULL,
  `for_client_id` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`,`for_client_id`),
  KEY `for_client_id` (`for_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_for_client`
--

LOCK TABLES `supplier_for_client` WRITE;
/*!40000 ALTER TABLE `supplier_for_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_for_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_group`
--

DROP TABLE IF EXISTS `supplier_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_group`
--

LOCK TABLES `supplier_group` WRITE;
/*!40000 ALTER TABLE `supplier_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(128) DEFAULT NULL,
  `description` mediumtext,
  `query` mediumtext,
  `user_source` int(11) DEFAULT NULL,
  `date_source` datetime DEFAULT CURRENT_TIMESTAMP,
  `transaction_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_source` (`user_source`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,'USER','Edited User Info','OLD VALUES: id=1 | first_name=System | middle_name= | last_name=Administrator | username=admin | password=827ccb0eea8a706c4c34a16891f84e7b | email_address= | active_flag=1 | user_group_id=3 | created_date=2023-11-13 06:24:14 | created_by=1 | admin_flag=0 | warehouse_id=47 | updated_date= | updated_by= | hash_password=$2b$10$EA3xHEm//aGg0zJfeq8CgeZ6mJ/KtdwOF.K/ZtJMJLlzb3fh0SDou <br>NEW VALUES: first_name=System | middle_name= | last_name=Administrator | username=admin | password=NOCHANGE | email_address= | active_flag=1 | warehouse_id=53 | created_date=2023-11-13 08:52:14 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=3',1,'2023-11-13 08:52:14','1'),(2,'USER','Edited User Info','OLD VALUES: id=95 | first_name=Receiving | middle_name= | last_name=Ilp Logistics | username=receiving.ilp logistics | password=827ccb0eea8a706c4c34a16891f84e7b | email_address= | active_flag=1 | user_group_id= | created_date= | created_by= | admin_flag=0 | warehouse_id=53 | updated_date= | updated_by= | hash_password= <br>NEW VALUES: first_name=Receiving | middle_name= | last_name=Ilp Logistics | username=receiving.ilplogistics | password=NOCHANGE | email_address= | active_flag=1 | warehouse_id=53 | created_date=2023-11-14 11:32:07 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=3',1,'2023-11-14 11:32:07','95'),(3,'WAREHOUSE','Edited Warehouse Info','OLD VALUES: id=50 | code=ROWELL | description=ROWELL | created_by= | created_date=2023-11-13 08:49:00 | updated_by= | updated_date= | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=6 | street= | city= | district= | region= | zip_code= | country= | pallet_prefix= | pallet_number_series=1 | stock_adjustment_approver_id= | mpo_default_bin_location_id= | rpo_default_bin_location_id= | generate_receiving_upon_dispatch=1 <br>NEW VALUES: code=ROWELL | description=ROWELL | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2023-12-14 13:56:46 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=6 | street=NULL | district=NULL | city=NULL | region=NULL | zip_code=NULL | country=NULL | stock_adjustment_approver_id=NULL | rpo_default_bin_location_id=NULL | mpo_default_bin_location_id=NULL | generate_receiving_upon_dispatch=1',1,'2023-12-14 13:56:46','50'),(4,'TRANSFER ORDER','Created Transfer Order Header','id=1 | transaction_number=TO00000001 | status=LOGGED | type=TRANSFER | warehouse_origin_id=53 | warehouse_destination_id=50 | reference=TEST | remarks=NULL | document_date=2023-12-14 | created_date=2023-12-14 13:56:56 | created_by=1 | updated_date=NULL | updated_by=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2023-12-14 13:56:56','1'),(5,'TRANSFER ORDER','Added Row Detail: New Line','id=1 | transfer_order_header_id=1 | item_id=9 | uom_id=3 | quantity=400 | base_quantity=400 | remarks=NULL | created_date=2023-12-14 13:57:11 | created_by=1 | updated_date=2023-12-14 13:57:11 | updated_by=1',1,'2023-12-14 13:57:11','1'),(6,'TRANSFER ORDER','Added Row Detail: New Line','id=2 | transfer_order_header_id=1 | item_id=31 | uom_id=4 | quantity=21 | base_quantity=21 | remarks=NULL | created_date=2023-12-14 13:57:22 | created_by=1 | updated_date=2023-12-14 13:57:22 | updated_by=1',1,'2023-12-14 13:57:22','1'),(7,'PICKLIST','Created Picklist Header','id=1 | transaction_number=PKL00000001 | status=LOGGED | document_date=2023-12-14 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2023-12-14 14:00:01 | created_by=1 | updated_date=NULL | updated_by=NULL',1,'2023-12-14 14:00:01','1'),(8,'TRANSFER ORDER','Posted Transaction','Transaction No.: TO00000001',1,'2023-12-14 14:00:06','1'),(9,'PICKLIST','Added Transfer Order','picklist_number=PKL00000001 | transfer_order_number=TO00000001',1,'2023-12-14 14:00:11','1'),(10,'PICKLIST','Posted Transaction','Transaction No.: PKL00000001',1,'2023-12-14 14:00:16','1'),(11,'PICKLIST','Manual Stock Reservation','INSERTROW -> picklist_number=PKL00000001 | item_id=31 | location_id=12 | lot_number=1318Y1910 | expiry_date=2019-05-18 | base_quantity=21 | pallet_number= | for_client_id=',1,'2023-12-14 14:00:25','1'),(12,'PICKING','Auto Generated Picking','picklist_number=PKL00000001 | picklist_header_id=1 | item_id=31 | location_id=12 | lot_number=1318Y1910 | expiry_date=2019-05-18 | uom_id=4 | quanity=21 | base_quantity=21 | pallet_number= | for_client_id=',1,'2023-12-14 14:00:37','1'),(13,'STOCK ISSUANCE','Generated Transaction','Transaction No.: ISS00000001 | Picklist: PKL00000001 | Type: TO | Reference: TO00000001 | Reference ID: 1',1,'2023-12-14 14:00:49','1'),(14,'PICKLIST','Issued Transaction','Transaction No.: PKL00000001',1,'2023-12-14 14:00:49','1'),(15,'STOCK ISSUANCE','Tagged as Dispatched','Transaction No.: ISS00000001 | DR Number: DR00000001 | SI Number:  | Trucking ID: NULL | Vehicle Type ID: NULL | Driver Name:  | Plate Number:  | Seal Number:  | Van Number:  | Dispatched Date: 2023-12-14 14:00:00 | Dispatched By: 1 | Delivery Instruction:  | user_defined_field1: NULL | user_defined_field2: NULL | user_defined_field3: NULL | user_defined_field4: NULL | user_defined_field5: NULL',1,'2023-12-14 14:00:58','1'),(16,'STOCK ISSUANCE','Tagged as Delivered','Transaction No.: ISS00000001 | Date Delivered: 2023-12-14 14:01:00 | Received By: test',1,'2023-12-14 14:01:25','1'),(17,'STOCK RECEIPT','Posted Transaction','Transaction No.: RCV00000001',1,'2023-12-14 14:01:25','1'),(18,'BIN LOCATION','Edited Bin Location Info','OLD VALUES: id=6 | code=ROWELL | description=ROWELL | warehouse_id=50 | zone_id= | weight_capacity=0 | cbm_capacity=0 | capacity=0 | on_hold_flag=0 | disposition=GOOD STOCKS | suggestion_flag=1 | location_index= | all_items_flag=1 | created_date=2023-11-13 08:49:00 | created_by= | updated_date= | updated_by= | active_flag=1 | staging_flag=0 | pallet_slot=999999 | pick_phase_flag=1 <br>NEW VALUES: code=ROWELL | description=ROWELL | warehouse_id=50 | zone_id=NULL | weight_capacity=0 | cbm_capacity=0 | capacity=0 | on_hold_flag=0 | disposition=GOOD STOCKS | suggestion_flag=1 | location_index=NULL | all_items_flag=1 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2023-12-14 14:02:16 | updated_by=1 | active_flag=1 | staging_flag=1 | pallet_slot=NULL | pick_phase_flag=0',1,'2023-12-14 14:02:16','6'),(19,'STOCK ISSUANCE','Tagged as Delivered','Transaction No.: ISS00000001 | Date Delivered: 2023-12-14 14:02:00 | Received By: test',1,'2023-12-14 14:02:53','1'),(20,'STOCK RECEIPT','Posted Transaction','Transaction No.: RCV00000002',1,'2023-12-14 14:02:53','2'),(21,'STOCK RECEIPT','Auto-closed Transaction','Transaction No.: RCV00000002 | Putaway Completed',1,'2023-12-14 14:02:53','2'),(22,'STOCK ISSUANCE','Tagged as Delivered','Transaction No.: ISS00000001 | Date Delivered: 2023-12-14 14:03:00 | Received By: test',1,'2023-12-14 14:03:48','1'),(23,'STOCK RECEIPT','Posted Transaction','Transaction No.: RCV00000003',1,'2023-12-14 14:03:48','3'),(24,'STOCK RECEIPT (AUTO GENERATED PUTAWAY)','Auto Generated Putaway','receipt_number=RCV00000003 | receipt_id=3 | default_location_id=6 | location_on_hold_flag=0 | location_disposition=GOOD STOCKS | item_id=31 | lot_number=1318Y1910 | expiry_date=2019-05-18 | uom_id=4 | quantity=21 | for_client_id=NULL | pallet=NULL',1,'2023-12-14 14:03:48','3'),(25,'STOCK RECEIPT','Auto-closed Transaction','Transaction No.: RCV00000003 | Putaway Completed',1,'2023-12-14 14:03:48','3'),(26,'WAREHOUSE','Edited Warehouse Info','OLD VALUES: id=48 | code=PRODUCTION | description=PRODUCTION | created_by= | created_date=2023-11-13 08:49:00 | updated_by= | updated_date= | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=1 | street= | city= | district= | region= | zip_code= | country= | pallet_prefix= | pallet_number_series=1 | stock_adjustment_approver_id= | mpo_default_bin_location_id= | rpo_default_bin_location_id= | generate_receiving_upon_dispatch=0 <br>NEW VALUES: code=PRODUCTION | description=PRODUCTION | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2023-12-14 16:49:46 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=1 | street=NULL | district=NULL | city=NULL | region=NULL | zip_code=NULL | country=NULL | stock_adjustment_approver_id=NULL | rpo_default_bin_location_id=NULL | mpo_default_bin_location_id=NULL | generate_receiving_upon_dispatch=0',1,'2023-12-14 16:49:46','48'),(27,'BIN LOCATION','Edited Bin Location Info','OLD VALUES: id=1 | code=PRODUCTION | description=PRODUCTION | warehouse_id=48 | zone_id= | weight_capacity=0 | cbm_capacity=0 | capacity=0 | on_hold_flag=0 | disposition=GOOD STOCKS | suggestion_flag=1 | location_index= | all_items_flag=1 | created_date=2023-11-13 08:49:00 | created_by= | updated_date= | updated_by= | active_flag=1 | staging_flag=0 | pallet_slot=999999 | pick_phase_flag=1 <br>NEW VALUES: code=PRODUCTION | description=PRODUCTION | warehouse_id=48 | zone_id=NULL | weight_capacity=0 | cbm_capacity=0 | capacity=0 | on_hold_flag=0 | disposition=GOOD STOCKS | suggestion_flag=1 | location_index=NULL | all_items_flag=1 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2023-12-14 16:50:02 | updated_by=1 | active_flag=1 | staging_flag=1 | pallet_slot=NULL | pick_phase_flag=0',1,'2023-12-14 16:50:02','1'),(28,'WAREHOUSE','Edited Warehouse Info','OLD VALUES: id=48 | code=PRODUCTION | description=PRODUCTION | created_by= | created_date=2023-11-13 08:49:00 | updated_by=1 | updated_date=2023-12-14 16:49:46 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=1 | street= | city= | district= | region= | zip_code= | country= | pallet_prefix= | pallet_number_series=1 | stock_adjustment_approver_id= | mpo_default_bin_location_id= | rpo_default_bin_location_id= | generate_receiving_upon_dispatch=0 <br>NEW VALUES: code=PRODUCTION | description=PRODUCTION | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2023-12-14 16:50:15 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=1 | street=NULL | district=NULL | city=NULL | region=NULL | zip_code=NULL | country=NULL | stock_adjustment_approver_id=NULL | rpo_default_bin_location_id=NULL | mpo_default_bin_location_id=NULL | generate_receiving_upon_dispatch=0',1,'2023-12-14 16:50:15','48'),(29,'STOCK RECEIPT','Created Stock Receipt Header','id=4 | transaction_number=RCV00000004 | status=LOGGED | document_date=2023-12-14 | warehouse_id=48 | source_type=UD | purchase_order_header_id=NULL | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=WAREHOUSE | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=49 | reference_1=TEST | reference_2=WRWE | reference_3=NULL | remarks=NULL | created_date=2023-12-14 16:50:57 | created_by=1 | updated_date=NULL | updated_by=NULL | ie_number=NULL | arr_date=2023-12-14 | stripping_date=2023-12-14 | dr_date=2023-12-14 | pbi_number=NULL | container_number=NULL | boat_note_number=NULL | broker_name=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | user_defined_field6=NULL | user_defined_field7=NULL | user_defined_field8=NULL | for_client_id=NULL | client_transaction_number=NULL',1,'2023-12-14 16:50:57','4'),(30,'STOCK RECEIPT','Created Stock Receipt Header','id=5 | transaction_number=RCV00000005 | status=LOGGED | document_date=2023-12-14 | warehouse_id=53 | source_type=UD | purchase_order_header_id=NULL | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=WAREHOUSE | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=49 | reference_1=NULL | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2023-12-14 17:05:26 | created_by=1 | updated_date=NULL | updated_by=NULL | ie_number=NULL | arr_date=2023-12-14 | stripping_date=2023-12-14 | dr_date=2023-12-14 | pbi_number=NULL | container_number=NULL | boat_note_number=NULL | broker_name=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | user_defined_field6=NULL | user_defined_field7=NULL | user_defined_field8=NULL | for_client_id=NULL | client_transaction_number=NULL',1,'2023-12-14 17:05:26','5'),(31,'STOCK RECEIPT','Added Row Detail: New Line','id=3 | stock_receipt_header_id=5 | item_id=31 | lot_number=20231214 | expiry_date=2019-05-18 | uom_id=4 | quantity=21 | base_quantity=21 | remarks=NULL | created_date=2023-12-14 17:05:57 | created_by=1 | updated_date=2023-12-14 17:05:57 | updated_by=1 | pallet_number=NULL | weight=0 | mfg_date=2018-11-19 | box_number=',1,'2023-12-14 17:05:57','5'),(32,'PICKLIST','Created Picklist Header','id=2 | transaction_number=PKL00000002 | status=LOGGED | document_date=2023-12-14 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2023-12-14 17:06:32 | created_by=1 | updated_date=NULL | updated_by=NULL',1,'2023-12-14 17:06:32','2'),(33,'PICKLIST','Added Transfer Order','picklist_number=PKL00000002 | transfer_order_number=TO00000001',1,'2023-12-14 17:06:35','2'),(34,'PICKLIST','Posted Transaction','Transaction No.: PKL00000002',1,'2023-12-14 17:06:45','2'),(35,'PICKLIST','Generated Stock Reservation','INSERTROW -> picklist_number=PKL00000002 | item_id=9 | location_id=25 | lot_number=2-1152 | expiry_date= | base_quantity=400 | pallet_number=NULL | for_client_id=',1,'2023-12-14 17:06:52','2'),(36,'STOCK RECEIPT','Added Row Detail: New Line','id=4 | stock_receipt_header_id=5 | item_id=9 | lot_number=2-1152 | expiry_date=NULL | uom_id=3 | quantity=400 | base_quantity=400 | remarks=NULL | created_date=2023-12-14 17:07:22 | created_by=1 | updated_date=2023-12-14 17:07:22 | updated_by=1 | pallet_number=NULL | weight=0 | mfg_date=2022-03-07 | box_number=',1,'2023-12-14 17:07:22','5'),(37,'STOCK RECEIPT','Posted Transaction','Transaction No.: RCV00000005',1,'2023-12-14 17:08:17','5'),(38,'TRANSFER ORDER','Created Transfer Order Header','id=2 | transaction_number=TO00000002 | status=LOGGED | type=TRANSFER | warehouse_origin_id=53 | warehouse_destination_id=48 | reference=TEST12 | remarks=NULL | document_date=2023-12-14 | created_date=2023-12-14 17:08:52 | created_by=1 | updated_date=NULL | updated_by=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2023-12-14 17:08:52','2'),(39,'TRANSFER ORDER','Added Row Detail: New Line','id=3 | transfer_order_header_id=2 | item_id=9 | uom_id=3 | quantity=400 | base_quantity=400 | remarks=NULL | created_date=2023-12-14 17:09:08 | created_by=1 | updated_date=2023-12-14 17:09:08 | updated_by=1',1,'2023-12-14 17:09:08','2'),(40,'TRANSFER ORDER','Posted Transaction','Transaction No.: TO00000002',1,'2023-12-14 17:09:11','2'),(41,'PICKLIST','Created Picklist Header','id=3 | transaction_number=PKL00000003 | status=LOGGED | document_date=2023-12-14 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2023-12-14 17:09:16 | created_by=1 | updated_date=NULL | updated_by=NULL',1,'2023-12-14 17:09:16','3'),(42,'PICKLIST','Added Transfer Order','picklist_number=PKL00000003 | transfer_order_number=TO00000002',1,'2023-12-14 17:09:19','3'),(43,'PICKLIST','Posted Transaction','Transaction No.: PKL00000003',1,'2023-12-14 17:09:22','3'),(44,'PICKLIST','Generated Stock Reservation','INSERTROW -> picklist_number=PKL00000003 | item_id=9 | location_id=25 | lot_number=2-1152 | expiry_date= | base_quantity=400 | pallet_number=NULL | for_client_id=',1,'2023-12-14 17:09:26','3'),(45,'STOCK ISSUANCE','Generated Transaction','Transaction No.: ISS00000002 | Picklist: PKL00000003 | Type: TO | Reference: TO00000002 | Reference ID: 2',1,'2023-12-14 17:11:40','2'),(46,'PICKLIST','Issued Transaction','Transaction No.: PKL00000003',1,'2023-12-14 17:11:40','3'),(47,'TRANSFER ORDER','Closed Transaction - All Items Issued','Transaction No.: TO00000002 | Triggered By->PKL00000003',1,'2023-12-14 17:11:41','2'),(48,'STOCK RECEIPT','Created Stock Receipt Header','id=6 | transaction_number=RCV00000006 | status=LOGGED | document_date=2023-12-14 | warehouse_id=48 | source_type=ISS | purchase_order_header_id=NULL | stock_issuance_header_id=2 | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=NA | reference_2=NA | reference_3=NULL | remarks=NULL | created_date=2023-12-14 17:12:42 | created_by=1 | updated_date=NULL | updated_by=NULL | ie_number=NULL | arr_date=2023-12-14 | stripping_date=NULL | dr_date=NULL | pbi_number=NULL | container_number=NULL | boat_note_number=NULL | broker_name=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | user_defined_field6=NULL | user_defined_field7=NULL | user_defined_field8=NULL | for_client_id=NULL | client_transaction_number=NULL',1,'2023-12-14 17:12:42','6'),(49,'STOCK RECEIPT','Created Stock Receipt Header','id=7 | transaction_number=RCV00000007 | status=LOGGED | document_date=2023-12-14 | warehouse_id=48 | source_type=ISS | purchase_order_header_id=NULL | stock_issuance_header_id=2 | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=NA | reference_2=NA | reference_3=NULL | remarks=NULL | created_date=2023-12-14 17:13:10 | created_by=1 | updated_date=NULL | updated_by=NULL | ie_number=NULL | arr_date=2023-12-14 | stripping_date=NULL | dr_date=NULL | pbi_number=NULL | container_number=NULL | boat_note_number=NULL | broker_name=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | user_defined_field6=NULL | user_defined_field7=NULL | user_defined_field8=NULL | for_client_id=NULL | client_transaction_number=NULL',1,'2023-12-14 17:13:10','7'),(50,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 15:03:20','7'),(51,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 15:04:17','7'),(52,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 15:04:26','7'),(53,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:14:37','7'),(54,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:24:32','7'),(55,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:27:01','7'),(56,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:33:16','7'),(57,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:45:53','7'),(58,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:52:58','7'),(59,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:54:13','7'),(60,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:55:23','7'),(61,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:58:00','7'),(62,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 16:59:32','7'),(63,'STOCK RECEIPT','Posted Transaction (Mobile)','Transaction No.: RCV00000007',1,'2023-12-14 17:01:13','7'),(64,'STOCK RECEIPT','Reopened Transaction','Transaction No.: RCV00000007 | Remarks: sdfgsdf',1,'2023-12-15 01:10:44','7'),(65,'STOCK RECEIPT','Created Stock Receipt Header','id=8 | transaction_number=RCV00000008 | status=LOGGED | document_date=2023-12-15 | warehouse_id=53 | source_type=UD | purchase_order_header_id=NULL | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=WAREHOUSE | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=50 | reference_1=NULL | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2023-12-15 12:29:16 | created_by=1 | updated_date=NULL | updated_by=NULL | ie_number=NULL | arr_date=2023-12-15 | stripping_date=2023-12-15 | dr_date=2023-12-15 | pbi_number=NULL | container_number=NULL | boat_note_number=NULL | broker_name=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | user_defined_field6=NULL | user_defined_field7=NULL | user_defined_field8=NULL | for_client_id=NULL | client_transaction_number=NULL',1,'2023-12-15 12:29:16','8'),(66,'STOCK RECEIPT','Added Row Detail: New Line','id=6 | stock_receipt_header_id=8 | item_id=6 | lot_number=20231215 | expiry_date=NULL | uom_id=3 | quantity=400 | base_quantity=400 | remarks=NULL | created_date=2023-12-15 12:29:33 | created_by=1 | updated_date=2023-12-15 12:29:33 | updated_by=1 | pallet_number=NULL | weight=400 | mfg_date=2023-12-01 | box_number=',1,'2023-12-15 12:29:33','8'),(67,'STOCK RECEIPT','Posted Transaction','Transaction No.: RCV00000008',1,'2023-12-15 12:29:40','8'),(68,'STOCK RECEIPT','Closed Transaction','Transaction No.: RCV00000008; Complete Mobile Putaway - Closed RCV Automatically',1,'2023-12-15 04:30:43','8'),(69,'STOCK RECEIPT','Closed Transaction','Transaction No.: RCV00000008; Complete Mobile Putaway - Closed RCV Automatically',1,'2023-12-15 04:36:31','8'),(70,'STOCK RECEIPT','Closed Transaction','Transaction No.: RCV00000008; Complete Mobile Putaway - Closed RCV Automatically',1,'2023-12-15 04:42:49','8'),(71,'STOCK RECEIPT','Reopened Transaction','Transaction No.: RCV00000008 | Remarks: weqr',1,'2023-12-15 12:43:38','8'),(72,'PUTAWAY','Deleted Row Detail','receipt_number=RCV00000008 | receipt_id=8 | putaway_detail_id=24 | location_id=50 | item_id=6 | lot_number=20231215 | expiry_date=NULL | uom_id=3 | quanity=400 | base_quantity=400 | Reason=sdfsd | pallet_number= | for_client_id=',1,'2023-12-15 12:43:47','8'),(73,'STOCK RECEIPT','Unposted Transaction','Transaction No.: RCV00000008 | Remarks: sdfs',1,'2023-12-15 12:43:52','8'),(74,'STOCK RECEIPT','Added Row Detail: New Line','id=7 | stock_receipt_header_id=8 | item_id=10 | lot_number=20231215 | expiry_date=NULL | uom_id=3 | quantity=12 | base_quantity=12 | remarks=NULL | created_date=2023-12-15 12:44:02 | created_by=1 | updated_date=2023-12-15 12:44:02 | updated_by=1 | pallet_number=NULL | weight=12 | mfg_date=2023-12-01 | box_number=',1,'2023-12-15 12:44:02','8'),(75,'STOCK RECEIPT','Posted Transaction','Transaction No.: RCV00000008',1,'2023-12-15 12:44:12','8'),(76,'PUTAWAY','Deleted Row Detail','receipt_number=RCV00000008 | receipt_id=8 | putaway_detail_id=26 | location_id=50 | item_id=10 | lot_number=20231215 | expiry_date=NULL | uom_id=3 | quanity=12 | base_quantity=12 | Reason=werw | pallet_number= | for_client_id=',1,'2023-12-15 12:53:02','8'),(77,'PUTAWAY','Deleted Row Detail','receipt_number=RCV00000008 | receipt_id=8 | putaway_detail_id=25 | location_id=50 | item_id=6 | lot_number=20231215 | expiry_date=NULL | uom_id=3 | quanity=400 | base_quantity=400 | Reason=werwe | pallet_number= | for_client_id=',1,'2023-12-15 12:53:05','8'),(78,'STOCK RECEIPT','Closed Transaction','Transaction No.: RCV00000008; Complete Mobile Putaway - Closed RCV Automatically',1,'2023-12-15 04:56:10','8'),(79,'SUPPLIER','New Supplier Added','id=1 | code=UNILEVER | description=UNILEVER | supplier_group_id=NULL | term_id=NULL | fax= | telephone= | mobile= | email= | created_by=1 | created_date=2024-01-08 02:19:49 | updated_by=NULL | updated_date=NULL | active_flag=1 | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-08 02:19:49','1'),(80,'PURCHASE ORDER','Created Purchase Order Header','id=1 | transaction_number=PO00000001 | status=LOGGED | reference=TEDT | supplier_id=1 | supplier_street_address=NULL | supplier_district_address=NULL | supplier_city_address=NULL | supplier_region_address=NULL | supplier_zip_code_address=NULL | supplier_country_address=NULL | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=53 | client_id=NULL | ship_to_street_address=NULL | ship_to_district_address=NULL | ship_to_city_address=NULL | ship_to_region_address=NULL | ship_to_zip_code_address=NULL | ship_to_country_address=NULL | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2024-01-08 | delivery_date=2024-02-01 | created_date=2024-01-08 02:19:55 | created_by=1 | updated_date=NULL | updated_by=NULL | proforma_invoice=NULL | shipment_terms_id=12 | currency_id=1 | approved_by=DEFAULT PO APPROVER | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | for_client_id=NULL',1,'2024-01-08 02:19:55','1'),(81,'PURCHASE ORDER','Added Row Detail: New Line','id=1 | purchase_order_header_id=1 | item_id=9 | uom_id=3 | quantity=25 | base_quantity=25 | unit_price=0 | net_price=0 | amount=0 | remarks=NULL | created_date=2024-01-08 02:20:03 | created_by=1 | updated_date=2024-01-08 02:20:03 | updated_by=1 | active_flag=1 | bpc=1 | weight=0 | expected_expiry_date=NULL | expected_mfg_date=NULL | expected_lot_number=NULL',1,'2024-01-08 02:20:03','1'),(82,'PURCHASE ORDER','Added Row Detail: New Line','id=2 | purchase_order_header_id=1 | item_id=10 | uom_id=3 | quantity=15 | base_quantity=15 | unit_price=0 | net_price=0 | amount=0 | remarks=NULL | created_date=2024-01-08 02:20:11 | created_by=1 | updated_date=2024-01-08 02:20:11 | updated_by=1 | active_flag=1 | bpc=1 | weight=0 | expected_expiry_date=NULL | expected_mfg_date=NULL | expected_lot_number=NULL',1,'2024-01-08 02:20:11','1'),(83,'PURCHASE ORDER','Posted Transaction','Transaction No.: PO00000001',1,'2024-01-08 02:20:14','1'),(84,'STOCK RECEIPT','Created Stock Receipt Header','id=9 | transaction_number=RCV00000009 | status=LOGGED | document_date=2024-01-08 | warehouse_id=53 | source_type=PO | purchase_order_header_id=1 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=NULL | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2024-01-08 02:20:24 | created_by=1 | updated_date=NULL | updated_by=NULL | ie_number=NULL | arr_date=2024-01-08 | stripping_date=2024-01-08 | dr_date=2024-01-08 | pbi_number=NULL | container_number=NULL | boat_note_number=NULL | broker_name=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | user_defined_field6=NULL | user_defined_field7=NULL | user_defined_field8=NULL | for_client_id=NULL | client_transaction_number=NULL',1,'2024-01-08 02:20:24','9'),(85,'STOCK RECEIPT','Posted Transaction','Transaction No.: RCV00000009',1,'2024-01-08 03:56:09','9'),(86,'PURCHASE ORDER','Closed Transaction - RCV Completed','Transaction No.: PO00000001; Triggered by: RCV00000009',1,'2024-01-08 03:56:09','1'),(87,'ITEM','Edited Item Info','OLD VALUES: id=9 | active_flag=1 | code=RM-TNP-010-38R-150 | name=0.150 X 783 X 880 | description=0.150 X 783 X 880 | item_type_id=2 | category_id= | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet= | created_date=2023-11-13 08:49:25 | created_by= | updated_date= | updated_by= | label= | brand_id= | origin_id= | sku_type_id= | subcategory1_id= | subcategory2_id= | fda_reference_number= | validity_date= | ax_code= | packaging_id= | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id= | shelf_life_in_months= | user_defined_field1= | user_defined_field2= | user_defined_field3= | user_defined_field4= | user_defined_field5= <br>NEW VALUES: active_flag=1 | code=AAA | name=0.150 X 783 X 880 | description=0.150 X 783 X 880 | item_type_id=2 | category_id=NULL | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet=0 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2024-01-08 07:22:32 | label=NULL | brand_id=NULL | origin_id=NULL | sku_type_id=NULL | subcategory1_id=NULL | subcategory2_id=NULL | ax_code=NULL | fda_reference_number=NULL | validity_date=NULL | packaging_id=NULL | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id=NULL | shelf_life_in_months=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-08 07:22:32','9'),(88,'ITEM','Edited Item Info','OLD VALUES: id=10 | active_flag=1 | code=RM-TNP-010-58M-150 | name=0.150 X 870 X 885 | description=0.150 X 870 X 885 | item_type_id=2 | category_id= | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet= | created_date=2023-11-13 08:49:25 | created_by= | updated_date= | updated_by= | label= | brand_id= | origin_id= | sku_type_id= | subcategory1_id= | subcategory2_id= | fda_reference_number= | validity_date= | ax_code= | packaging_id= | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id= | shelf_life_in_months= | user_defined_field1= | user_defined_field2= | user_defined_field3= | user_defined_field4= | user_defined_field5= <br>NEW VALUES: active_flag=1 | code=BBB | name=0.150 X 870 X 885 | description=0.150 X 870 X 885 | item_type_id=2 | category_id=NULL | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet=0 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2024-01-08 07:23:03 | label=NULL | brand_id=NULL | origin_id=NULL | sku_type_id=NULL | subcategory1_id=NULL | subcategory2_id=NULL | ax_code=NULL | fda_reference_number=NULL | validity_date=NULL | packaging_id=NULL | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id=NULL | shelf_life_in_months=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-08 07:23:03','10'),(89,'TRANSFER ORDER','Created Transfer Order Header','id=3 | transaction_number=TO00000003 | status=LOGGED | type=TRANSFER | warehouse_origin_id=53 | warehouse_destination_id=48 | reference=TF01345 | remarks=NULL | document_date=2024-01-08 | created_date=2024-01-08 19:35:13 | created_by=1 | updated_date=NULL | updated_by=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-08 19:35:13','3'),(90,'TRANSFER ORDER','Added Row Detail: New Line','id=4 | transfer_order_header_id=3 | item_id=12 | uom_id=3 | quantity=15 | base_quantity=15 | remarks=NULL | created_date=2024-01-08 20:05:56 | created_by=1 | updated_date=2024-01-08 20:05:56 | updated_by=1',1,'2024-01-08 20:05:56','3'),(91,'TRANSFER ORDER','Posted Transaction','Transaction No.: TO00000003',1,'2024-01-08 20:42:35','3'),(92,'PICKLIST','Created Picklist Header','id=4 | transaction_number=PKL00000004 | status=LOGGED | document_date=2024-01-08 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2024-01-08 20:51:56 | created_by=1 | updated_date=NULL | updated_by=NULL',1,'2024-01-08 20:51:56','4'),(93,'PICKLIST','Added Transfer Order','picklist_number=PKL00000004 | transfer_order_number=TO00000003',1,'2024-01-08 21:07:37','4'),(94,'PICKLIST','Posted Transaction','Transaction No.: PKL00000004',1,'2024-01-08 21:10:15','4'),(95,'PICKLIST','Generated Stock Reservation','INSERTROW -> picklist_number=PKL00000004 | item_id=12 | location_id=37 | lot_number=09-484389 | expiry_date= | base_quantity=15 | pallet_number=NULL | for_client_id=',1,'2024-01-08 21:37:47','4'),(96,'PICKLIST','Deleted Reservation Detail','picklist_number=PKL00000004 | deleted_row_id=4 | item_id=12 | location_id=37 | lot_number=09-484389 | expiry_date= | reserved_quantity=15 | picked_quantity=0 | picked_quantity_details=0',1,'2024-01-08 22:01:20','4'),(97,'PICKLIST','Generated Stock Reservation','INSERTROW -> picklist_number=PKL00000004 | item_id=12 | location_id=37 | lot_number=10-484128 | expiry_date= | base_quantity=15 | pallet_number=NULL | for_client_id=',1,'2024-01-08 22:48:33','4'),(98,'PICKING','Auto Generated Picking','picklist_number=PKL00000004 | picklist_header_id=4 | item_id=12 | location_id=37 | lot_number=10-484128 | expiry_date=NULL | uom_id=3 | quanity=15 | base_quantity=15 | pallet_number= | for_client_id=',1,'2024-01-08 23:33:21','4'),(99,'STOCK ISSUANCE','Generated Transaction','Transaction No.: ISS00000003 | Picklist: PKL00000004 | Type: TO | Reference: TO00000003 | Reference ID: 3',1,'2024-01-08 23:33:26','3'),(100,'PICKLIST','Issued Transaction','Transaction No.: PKL00000004',1,'2024-01-08 23:33:26','4'),(101,'TRANSFER ORDER','Closed Transaction - All Items Issued','Transaction No.: TO00000003 | Triggered By->PKL00000004',1,'2024-01-08 23:33:26','3'),(102,'STOCK ISSUANCE','Tagged as Dispatched','Transaction No.: ISS00000003 | DR Number: DR00000002 | SI Number:  | Trucking ID: NULL | Vehicle Type ID: NULL | Driver Name:  | Plate Number:  | Seal Number:  | Van Number:  | Dispatched Date: 2024-01-09 00:01:00 | Dispatched By: 1 | Delivery Instruction:  | user_defined_field1: NULL | user_defined_field2: NULL | user_defined_field3: NULL | user_defined_field4: NULL | user_defined_field5: NULL',1,'2024-01-09 00:01:12','3'),(103,'PUTAWAY','Desktop Putaway','receipt_number=RCV00000009 | receipt_id=9 | default_location_id=20 | location_on_hold_flag=0 | location_disposition=GOOD STOCKS | item_id=9 | lot_number=240108 | expiry_date=NULL | uom_id=3 | quantity=25 | base_quantity=25',1,'2024-01-09 00:52:59','9'),(104,'STOCK ADJUSTMENT','Created Stock Adjustment Header','id=1 | transaction_number=ADJ00000001 | status=LOGGED | document_date=2024-01-09 | warehouse_id=53 | reference=NULL | remarks=NULL | created_date=2024-01-09 01:57:51 | created_by=1 | updated_date=NULL | updated_by=NULL | overall_inventory=0',1,'2024-01-09 01:57:51','1'),(105,'STOCK ADJUSTMENT','Added Row Detail','id= | stock_adjustment_header_id=1 | item_id=9 | location_id=44 | lot_number=05-482293 | expiry_date=NULL | uom_id=3 | quantity=12 | base_quantity=12 | created_date=2024-01-09 02:17:55 | created_by=1 | updated_date=2024-01-09 02:17:55 | updated_by=1 | reason=Wrong Quantity | for_client_id=NULL | mfg_date=2022-05-13 | weight=9744.0000 | pallet_number=NULL | adjustment_type=INCREASE',1,'2024-01-09 02:17:55','1'),(106,'WAREHOUSE','Edited Warehouse Info','OLD VALUES: id=53 | code=SILGAN WAREHOUSE | description=SILGAN WAREHOUSE | created_by= | created_date=2023-11-13 08:49:00 | updated_by= | updated_date= | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=9 | street= | city= | district= | region= | zip_code= | country= | pallet_prefix= | pallet_number_series=1 | stock_adjustment_approver_id= | mpo_default_bin_location_id= | rpo_default_bin_location_id= | generate_receiving_upon_dispatch=0 <br>NEW VALUES: code=SILGAN WAREHOUSE | description=SILGAN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2024-01-09 02:25:34 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=9 | street=NULL | district=NULL | city=NULL | region=NULL | zip_code=NULL | country=NULL | stock_adjustment_approver_id=1 | rpo_default_bin_location_id=NULL | mpo_default_bin_location_id=NULL | generate_receiving_upon_dispatch=0',1,'2024-01-09 02:25:34','53'),(107,'STOCK ADJUSTMENT','Posted For Approval Transaction','Transaction No.: ADJ00000001; Assigned Approver: System Administrator',1,'2024-01-09 02:25:37','1'),(108,'CYCLE COUNT','Created Cycle Count Header','id=1 | transaction_number=CC00000001 | status=LOGGED | document_date=2024-01-09 | warehouse_id=53 | reference=NULL | remarks=NULL | created_date=2024-01-09 03:27:38 | created_by=1 | updated_date=NULL | updated_by=NULL | cycle_count_type_code=ITEM | date_from=ITEM | date_to=NULL',1,'2024-01-09 03:27:38','1'),(109,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000001 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count:  | actual_count: 25',1,'2024-01-09 03:51:59','1'),(110,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000001 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count: 25 | actual_count: 25',1,'2024-01-09 03:52:00','1'),(111,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000001 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count:  | actual_count: 5',1,'2024-01-09 03:52:02','1'),(112,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000001 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count:  | actual_count: 12',1,'2024-01-09 03:52:03','1'),(113,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000001 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count: 12 | actual_count: 12',1,'2024-01-09 03:52:03','1'),(114,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000001 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count: 12 | actual_count: 121',1,'2024-01-09 03:52:04','1'),(115,'CYCLE COUNT','Posted Transaction','Transaction No.: CC00000001',1,'2024-01-09 03:52:08','1'),(116,'TRANSFER ORDER','Created Transfer Order Header','id=4 | transaction_number=TO00000004 | status=LOGGED | type=TRANSFER | warehouse_origin_id=53 | warehouse_destination_id=49 | reference=TEST231 | remarks=NULL | document_date=2024-01-17 | created_date=2024-01-17 17:07:03 | created_by=1 | updated_date=NULL | updated_by=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-17 17:07:03','4'),(117,'TRANSFER ORDER','Added Row Detail: New Line','id=5 | transfer_order_header_id=4 | item_id=9 | uom_id=3 | quantity=1000 | base_quantity=1000 | remarks=NULL | created_date=2024-01-17 17:07:14 | created_by=1 | updated_date=2024-01-17 17:07:14 | updated_by=1',1,'2024-01-17 17:07:14','4'),(118,'TRANSFER ORDER','Posted Transaction','Transaction No.: TO00000004',1,'2024-01-17 17:07:17','4'),(119,'PICKLIST','Created Picklist Header','id=5 | transaction_number=PKL00000005 | status=LOGGED | document_date=2024-01-17 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2024-01-17 17:07:32 | created_by=1 | updated_date=NULL | updated_by=NULL',1,'2024-01-17 17:07:32','5'),(120,'PICKLIST','Added Transfer Order','picklist_number=PKL00000005 | transfer_order_number=TO00000004',1,'2024-01-17 17:07:34','5'),(121,'PICKLIST','Posted Transaction','Transaction No.: PKL00000005',1,'2024-01-17 17:07:37','5'),(122,'PURCHASE ORDER','Created Purchase Order Header','id=2 | transaction_number=PO00000002 | status=LOGGED | reference=PO00123 | supplier_id=1 | supplier_street_address=NULL | supplier_district_address=NULL | supplier_city_address=NULL | supplier_region_address=NULL | supplier_zip_code_address=NULL | supplier_country_address=NULL | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=53 | client_id=NULL | ship_to_street_address=NULL | ship_to_district_address=NULL | ship_to_city_address=NULL | ship_to_region_address=NULL | ship_to_zip_code_address=NULL | ship_to_country_address=NULL | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2024-01-17 | delivery_date=2024-03-01 | created_date=2024-01-17 17:34:57 | created_by=1 | updated_date=NULL | updated_by=NULL | proforma_invoice=NULL | shipment_terms_id=12 | currency_id=1 | approved_by=DEFAULT PO APPROVER | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | for_client_id=NULL',1,'2024-01-17 17:34:57','2'),(123,'PURCHASE ORDER','Added Row Detail: New Line','id=3 | purchase_order_header_id=2 | item_id=9 | uom_id=3 | quantity=1000 | base_quantity=1000 | unit_price=0 | net_price=0 | amount=0 | remarks=NULL | created_date=2024-01-17 17:35:13 | created_by=1 | updated_date=2024-01-17 17:35:13 | updated_by=1 | active_flag=1 | bpc=1 | weight=0 | expected_expiry_date=NULL | expected_mfg_date=NULL | expected_lot_number=NULL',1,'2024-01-17 17:35:13','2'),(124,'PURCHASE ORDER','Added Row Detail: New Line','id=4 | purchase_order_header_id=2 | item_id=10 | uom_id=3 | quantity=2000 | base_quantity=2000 | unit_price=0 | net_price=0 | amount=0 | remarks=NULL | created_date=2024-01-17 17:35:20 | created_by=1 | updated_date=2024-01-17 17:35:20 | updated_by=1 | active_flag=1 | bpc=1 | weight=0 | expected_expiry_date=NULL | expected_mfg_date=NULL | expected_lot_number=NULL',1,'2024-01-17 17:35:20','2'),(125,'PURCHASE ORDER','Posted Transaction','Transaction No.: PO00000002',1,'2024-01-17 17:35:24','2'),(126,'STOCK RECEIPT','Created Stock Receipt Header','id=10 | transaction_number=RCV00000010 | status=LOGGED | document_date=2024-01-17 | warehouse_id=53 | source_type=PO | purchase_order_header_id=2 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=NULL | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2024-01-17 17:36:07 | created_by=1 | updated_date=NULL | updated_by=NULL | ie_number=NULL | arr_date=2024-01-17 | stripping_date=2024-01-17 | dr_date=2024-01-17 | pbi_number=NULL | container_number=NULL | boat_note_number=NULL | broker_name=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | user_defined_field6=NULL | user_defined_field7=NULL | user_defined_field8=NULL | for_client_id=NULL | client_transaction_number=NULL',1,'2024-01-17 17:36:07','10'),(127,'STOCK RECEIPT','Added Row Detail: New Line','id=10 | stock_receipt_header_id=10 | item_id=9 | lot_number=240117 | expiry_date=NULL | uom_id=3 | quantity=1200 | base_quantity=1200 | remarks=NULL | created_date=2024-01-17 17:48:30 | created_by=1 | updated_date=2024-01-17 17:48:30 | updated_by=1 | pallet_number=NULL | weight=0 | mfg_date=NULL | box_number=',1,'2024-01-17 17:48:30','10'),(128,'STOCK RECEIPT','Deleted Row Detail','id=10 | stock_receipt_header_id=10 | transaction_number=RCV00000010 | item_id=9 | item_name=0.150 X 783 X 880 | uom_id=3 | uom_description=SHEETS | quantity=1200 | base_quantity=1200 | lot_number=240117 | expiry_date= | remarks= | created_date=2024-01-17 17:48:30 | created_by=System Administrator | updated_date=2024-01-17 17:48:30 | updated_by=System Administrator | for_client_id=',1,'2024-01-17 17:48:38','10'),(129,'ITEM','Edited Item Info','OLD VALUES: id=10 | active_flag=1 | code=BBB | name=0.150 X 870 X 885 | description=0.150 X 870 X 885 | item_type_id=2 | category_id= | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet=0 | created_date=2023-11-13 08:49:25 | created_by= | updated_date=2024-01-08 07:23:03 | updated_by=1 | label= | brand_id= | origin_id= | sku_type_id= | subcategory1_id= | subcategory2_id= | fda_reference_number= | validity_date= | ax_code= | packaging_id= | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id= | shelf_life_in_months= | user_defined_field1= | user_defined_field2= | user_defined_field3= | user_defined_field4= | user_defined_field5= <br>NEW VALUES: active_flag=1 | code=BBB | name=0.150 X 870 X 885 | description=0.150 X 870 X 885 | item_type_id=2 | category_id=NULL | expiry_flag=1 | reorder_quantity=0 | quantity_per_pallet=0 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2024-01-17 18:39:08 | label=NULL | brand_id=NULL | origin_id=NULL | sku_type_id=NULL | subcategory1_id=NULL | subcategory2_id=NULL | ax_code=NULL | fda_reference_number=NULL | validity_date=NULL | packaging_id=NULL | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id=NULL | shelf_life_in_months=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-17 18:39:08','10'),(130,'ITEM','Edited Item Info','OLD VALUES: id=9 | active_flag=1 | code=AAA | name=0.150 X 783 X 880 | description=0.150 X 783 X 880 | item_type_id=2 | category_id= | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet=0 | created_date=2023-11-13 08:49:25 | created_by= | updated_date=2024-01-08 07:22:32 | updated_by=1 | label= | brand_id= | origin_id= | sku_type_id= | subcategory1_id= | subcategory2_id= | fda_reference_number= | validity_date= | ax_code= | packaging_id= | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id= | shelf_life_in_months= | user_defined_field1= | user_defined_field2= | user_defined_field3= | user_defined_field4= | user_defined_field5= <br>NEW VALUES: active_flag=1 | code=AAA | name=0.150 X 783 X 880 | description=0.150 X 783 X 880 | item_type_id=2 | category_id=NULL | expiry_flag=1 | reorder_quantity=0 | quantity_per_pallet=0 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2024-01-17 18:39:16 | label=NULL | brand_id=NULL | origin_id=NULL | sku_type_id=NULL | subcategory1_id=NULL | subcategory2_id=NULL | ax_code=NULL | fda_reference_number=NULL | validity_date=NULL | packaging_id=NULL | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id=NULL | shelf_life_in_months=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-17 18:39:16','9'),(131,'STOCK RECEIPT','Deleted Row Detail','id=26 | stock_receipt_header_id=10 | transaction_number=RCV00000010 | item_id=9 | item_name=0.150 X 783 X 880 | uom_id=3 | uom_description=SHEETS | quantity=1000 | base_quantity=1000 | lot_number=BATCH001 | expiry_date=2024-12-30 | remarks=UPLOADED | created_date=2024-01-17 19:03:47 | created_by=System Administrator | updated_date= | updated_by= | for_client_id=',1,'2024-01-17 21:22:56','10'),(132,'STOCK RECEIPT','Deleted Row Detail','id=27 | stock_receipt_header_id=10 | transaction_number=RCV00000010 | item_id=10 | item_name=0.150 X 870 X 885 | uom_id=3 | uom_description=SHEETS | quantity=500 | base_quantity=500 | lot_number=BATCH002 | expiry_date=2024-12-30 | remarks=UPLOADED | created_date=2024-01-17 19:03:47 | created_by=System Administrator | updated_date= | updated_by= | for_client_id=',1,'2024-01-17 21:22:56','10'),(133,'STOCK RECEIPT','Deleted Row Detail','id=28 | stock_receipt_header_id=10 | transaction_number=RCV00000010 | item_id=10 | item_name=0.150 X 870 X 885 | uom_id=3 | uom_description=SHEETS | quantity=500 | base_quantity=500 | lot_number=BATCH002 | expiry_date=2024-12-30 | remarks=UPLOADED | created_date=2024-01-17 19:03:47 | created_by=System Administrator | updated_date= | updated_by= | for_client_id=',1,'2024-01-17 21:22:56','10'),(134,'STOCK RECEIPT','Deleted Row Detail','id=29 | stock_receipt_header_id=10 | transaction_number=RCV00000010 | item_id=10 | item_name=0.150 X 870 X 885 | uom_id=3 | uom_description=SHEETS | quantity=500 | base_quantity=500 | lot_number=BATCH002 | expiry_date=2024-12-30 | remarks=UPLOADED | created_date=2024-01-17 19:03:47 | created_by=System Administrator | updated_date= | updated_by= | for_client_id=',1,'2024-01-17 21:22:56','10'),(135,'STOCK RECEIPT','Deleted Row Detail','id=30 | stock_receipt_header_id=10 | transaction_number=RCV00000010 | item_id=10 | item_name=0.150 X 870 X 885 | uom_id=3 | uom_description=SHEETS | quantity=500 | base_quantity=500 | lot_number=BATCH002 | expiry_date=2024-12-30 | remarks=UPLOADED | created_date=2024-01-17 19:03:47 | created_by=System Administrator | updated_date= | updated_by= | for_client_id=',1,'2024-01-17 21:22:56','10'),(136,'ITEM','Edited Item Info','OLD VALUES: id=9 | active_flag=1 | code=AAA | name=0.150 X 783 X 880 | description=0.150 X 783 X 880 | item_type_id=2 | category_id= | expiry_flag=1 | reorder_quantity=0 | quantity_per_pallet=0 | created_date=2023-11-13 08:49:25 | created_by= | updated_date=2024-01-17 18:39:16 | updated_by=1 | label= | brand_id= | origin_id= | sku_type_id= | subcategory1_id= | subcategory2_id= | fda_reference_number= | validity_date= | ax_code= | packaging_id= | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id= | shelf_life_in_months= | user_defined_field1= | user_defined_field2= | user_defined_field3= | user_defined_field4= | user_defined_field5= <br>NEW VALUES: active_flag=1 | code=AAA | name=0.150 X 783 X 880 | description=0.150 X 783 X 880 | item_type_id=2 | category_id=NULL | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet=0 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2024-01-17 21:23:32 | label=NULL | brand_id=NULL | origin_id=NULL | sku_type_id=NULL | subcategory1_id=NULL | subcategory2_id=NULL | ax_code=NULL | fda_reference_number=NULL | validity_date=NULL | packaging_id=NULL | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id=NULL | shelf_life_in_months=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-17 21:23:32','9'),(137,'STOCK RECEIPT','Added Row Detail: New Line','id=31 | stock_receipt_header_id=10 | item_id=9 | lot_number=240117 | expiry_date=NULL | uom_id=3 | quantity=1000 | base_quantity=1000 | remarks=NULL | created_date=2024-01-17 21:24:14 | created_by=1 | updated_date=2024-01-17 21:24:14 | updated_by=1 | pallet_number=NULL | weight=0 | mfg_date=NULL | box_number=',1,'2024-01-17 21:24:14','10'),(138,'PICKLIST','Manual Stock Reservation','INSERTROW -> picklist_number=PKL00000005 | item_id=9 | location_id=20 | lot_number=2-1140-2 | expiry_date=NULL | base_quantity=25 | pallet_number= | for_client_id=',1,'2024-01-18 00:17:16','5'),(139,'PICKLIST','Manual Stock Reservation','UPDATEROW -> picklist_number=PKL00000005 | item_id=9 | location_id=20 | lot_number=2-1140-2 | expiry_date=NULL | before_update_rsv_qty=25 | after_update_rsv_qty=1000 | base_quantity=975',1,'2024-01-18 00:18:08','5'),(140,'STOCK RECEIPT','Deleted Row Detail','id=31 | stock_receipt_header_id=10 | transaction_number=RCV00000010 | item_id=9 | item_name=0.150 X 783 X 880 | uom_id=3 | uom_description=SHEETS | quantity=1000 | base_quantity=1000 | lot_number=240117 | expiry_date= | remarks= | created_date=2024-01-17 21:24:14 | created_by=System Administrator | updated_date=2024-01-17 21:24:14 | updated_by=System Administrator | for_client_id=',1,'2024-01-18 00:24:16','10'),(141,'ITEM','Edited Item Info','OLD VALUES: id=9 | active_flag=1 | code=AAA | name=0.150 X 783 X 880 | description=0.150 X 783 X 880 | item_type_id=2 | category_id= | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet=0 | created_date=2023-11-13 08:49:25 | created_by= | updated_date=2024-01-17 21:23:32 | updated_by=1 | label= | brand_id= | origin_id= | sku_type_id= | subcategory1_id= | subcategory2_id= | fda_reference_number= | validity_date= | ax_code= | packaging_id= | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id= | shelf_life_in_months= | user_defined_field1= | user_defined_field2= | user_defined_field3= | user_defined_field4= | user_defined_field5= <br>NEW VALUES: active_flag=1 | code=AAA | name=0.150 X 783 X 880 | description=0.150 X 783 X 880 | item_type_id=2 | category_id=NULL | expiry_flag=1 | reorder_quantity=0 | quantity_per_pallet=0 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2024-01-18 00:24:44 | label=NULL | brand_id=NULL | origin_id=NULL | sku_type_id=NULL | subcategory1_id=NULL | subcategory2_id=NULL | ax_code=NULL | fda_reference_number=NULL | validity_date=NULL | packaging_id=NULL | srp=0 | dfp_po_cost=0 | excise=0 | vat=0 | currency_id=NULL | shelf_life_in_months=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-18 00:24:44','9'),(142,'STOCK RECEIPT','Posted Transaction','Transaction No.: RCV00000010',1,'2024-01-18 00:25:02','10'),(143,'PURCHASE ORDER','Closed Transaction - RCV Completed','Transaction No.: PO00000002; Triggered by: RCV00000010',1,'2024-01-18 00:25:02','2'),(144,'STOCK RECEIPT','Closed Transaction','Transaction No.: RCV00000010; Complete Mobile Putaway - Closed RCV Automatically',1,'2024-01-17 16:34:45','10'),(145,'TRANSFER ORDER','Created Transfer Order Header','id=5 | transaction_number=TO00000005 | status=LOGGED | type=TRANSFER | warehouse_origin_id=53 | warehouse_destination_id=48 | reference=TEST1234 | remarks=NULL | document_date=2024-01-18 | created_date=2024-01-18 00:38:10 | created_by=1 | updated_date=NULL | updated_by=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-18 00:38:10','5'),(146,'TRANSFER ORDER','Added Row Detail: New Line','id=6 | transfer_order_header_id=5 | item_id=10 | uom_id=3 | quantity=2000 | base_quantity=2000 | remarks=NULL | created_date=2024-01-18 00:38:29 | created_by=1 | updated_date=2024-01-18 00:38:29 | updated_by=1',1,'2024-01-18 00:38:29','5'),(147,'TRANSFER ORDER','Posted Transaction','Transaction No.: TO00000005',1,'2024-01-18 00:38:35','5'),(148,'PICKLIST','Created Picklist Header','id=6 | transaction_number=PKL00000006 | status=LOGGED | document_date=2024-01-18 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2024-01-18 00:39:18 | created_by=1 | updated_date=NULL | updated_by=NULL',1,'2024-01-18 00:39:18','6'),(149,'PICKLIST','Added Transfer Order','picklist_number=PKL00000006 | transfer_order_number=TO00000005',1,'2024-01-18 00:39:20','6'),(150,'PICKLIST','Posted Transaction','Transaction No.: PKL00000006',1,'2024-01-18 00:39:24','6'),(151,'PICKLIST','Manual Stock Reservation','INSERTROW -> picklist_number=PKL00000006 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | base_quantity=2000 | pallet_number= | for_client_id=',1,'2024-01-18 00:40:01','6'),(152,'PICKLIST','Deleted Reservation Detail','picklist_number=PKL00000006 | deleted_row_id=7 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | reserved_quantity=2000 | picked_quantity=0 | picked_quantity_details=0',1,'2024-01-18 00:42:27','6'),(153,'PICKLIST','Manual Stock Reservation','INSERTROW -> picklist_number=PKL00000006 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | base_quantity=23 | pallet_number= | for_client_id=',1,'2024-01-18 00:42:40','6'),(154,'PICKLIST','Manual Stock Reservation','UPDATEROW -> picklist_number=PKL00000006 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | before_update_rsv_qty=23 | after_update_rsv_qty=2000 | base_quantity=1977',1,'2024-01-18 00:42:56','6'),(155,'PICKLIST','Deleted Reservation Detail','picklist_number=PKL00000006 | deleted_row_id=8 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | reserved_quantity=2000 | picked_quantity=0 | picked_quantity_details=0',1,'2024-01-19 01:00:42','6'),(156,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=4 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=test | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:07:05','6'),(157,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=5 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=test | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:09:57','6'),(158,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=6 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=e | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:10:55','6'),(159,'PICKLIST','Deleted Reservation Detail','picklist_number=PKL00000006 | deleted_row_id=9 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | reserved_quantity=500 | picked_quantity=0 | picked_quantity_details=0',1,'2024-01-19 02:11:07','6'),(160,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=8 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=wer | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:12:31','6'),(161,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=7 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=werwe | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:12:34','6'),(162,'PICKLIST','Deleted Reservation Detail','picklist_number=PKL00000006 | deleted_row_id=10 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | reserved_quantity=500 | picked_quantity=0 | picked_quantity_details=0',1,'2024-01-19 02:12:52','6'),(163,'PICKLIST','Deleted Reservation Detail','picklist_number=PKL00000006 | deleted_row_id=11 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | reserved_quantity=500 | picked_quantity=0 | picked_quantity_details=0',1,'2024-01-19 02:12:52','6'),(164,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=10 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=f | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:14:17','6'),(165,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=9 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=asd | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:14:20','6'),(166,'PICKLIST','Deleted Reservation Detail','picklist_number=PKL00000006 | deleted_row_id=12 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | reserved_quantity=500 | picked_quantity=0 | picked_quantity_details=0',1,'2024-01-19 02:14:28','6'),(167,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=13 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=werwe | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:16:55','6'),(168,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=12 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=wer | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:16:58','6'),(169,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=11 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=werwe | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:17:01','6'),(170,'PICKLIST','Deleted Reservation Detail','picklist_number=PKL00000006 | deleted_row_id=13 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | reserved_quantity=500 | picked_quantity=0 | picked_quantity_details=0',1,'2024-01-19 02:17:11','6'),(171,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=17 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=dfg | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:39:19','6'),(172,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=16 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=dfg | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:39:21','6'),(173,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=15 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=dfg | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:39:24','6'),(174,'PICKING','Deleted Row Detail','picklist_number=PKL00000006 | picklist_header_id=6 | picking_details_id=14 | location_id=11 | item_id=10 | lot_number=BATCH002 | expiry_date=2024-12-30 | uom_id=3 | quanity=500 | base_quantity=500 | Reason=dfg | pallet_number= | for_client_id=NULL',1,'2024-01-19 02:39:26','6'),(175,'PICKLIST','Deleted Reservation Detail','picklist_number=PKL00000006 | deleted_row_id=14 | item_id=10 | location_id=11 | lot_number=BATCH002 | expiry_date=2024-12-30 | reserved_quantity=2000 | picked_quantity=0 | picked_quantity_details=0',1,'2024-01-19 02:42:43','6'),(176,'TRANSFER ORDER','Created Transfer Order Header','id=6 | transaction_number=TO00000006 | status=LOGGED | type=TRANSFER | warehouse_origin_id=53 | warehouse_destination_id=49 | reference=TESTTTTT | remarks=NULL | document_date=2024-01-24 | created_date=2024-01-24 17:43:37 | created_by=1 | updated_date=NULL | updated_by=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL',1,'2024-01-24 17:43:37','6'),(177,'TRANSFER ORDER','Added Row Detail: New Line','id=7 | transfer_order_header_id=6 | item_id=15 | uom_id=4 | quantity=29 | base_quantity=29 | remarks=NULL | created_date=2024-01-24 17:43:50 | created_by=1 | updated_date=2024-01-24 17:43:50 | updated_by=1',1,'2024-01-24 17:43:50','6'),(178,'PURCHASE ORDER','Edited Purchase Order Detail','OLD VALUES: id=7 | transfer_order_header_id=6 | item_id=15 | uom_id=4 | quantity=29 | base_quantity=29 | issued_quantity=0 | remarks= | created_date=2024-01-24 17:43:50 | created_by=1 | updated_date=2024-01-24 17:43:50 | updated_by=1 <br>NEW VALUES: transfer_order_header_id=6 | item_id=15 | uom_id=4 | quantity=28.25 | base_quantity=28.25 | remarks=NULL | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2024-01-24 17:48:36 | updated_by=1',1,'2024-01-24 17:48:36','6'),(179,'TRANSFER ORDER','Posted Transaction','Transaction No.: TO00000006',1,'2024-01-24 17:48:50','6'),(180,'PICKLIST','Created Picklist Header','id=7 | transaction_number=PKL00000007 | status=LOGGED | document_date=2024-01-24 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2024-01-24 17:48:59 | created_by=1 | updated_date=NULL | updated_by=NULL',1,'2024-01-24 17:48:59','7'),(181,'PICKLIST','Added Transfer Order','picklist_number=PKL00000007 | transfer_order_number=TO00000006',1,'2024-01-24 17:49:01','7'),(182,'PICKLIST','Posted Transaction','Transaction No.: PKL00000007',1,'2024-01-24 17:49:11','7'),(183,'PICKLIST','Manual Stock Reservation','INSERTROW -> picklist_number=PKL00000007 | item_id=15 | location_id=12 | lot_number=GOP134274 | expiry_date=2023-10-25 | base_quantity=28.25 | pallet_number= | for_client_id=',1,'2024-01-24 17:49:19','7'),(184,'CYCLE COUNT','Created Cycle Count Header','id=2 | transaction_number=CC00000002 | status=LOGGED | document_date=2024-02-01 | warehouse_id=49 | reference=NULL | remarks=NULL | created_date=2024-02-01 14:10:38 | created_by=1 | updated_date=NULL | updated_by=NULL | cycle_count_type_code=ITEM | date_from=ITEM | date_to=NULL',1,'2024-02-01 14:10:38','2'),(185,'PICKLIST','Created Picklist Header','id=8 | transaction_number=PKL00000008 | status=LOGGED | document_date=2024-02-05 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2024-02-05 18:55:38 | created_by=1 | updated_date=NULL | updated_by=NULL',1,'2024-02-05 18:55:38','8'),(186,'PICKLIST','Edited Picklist Header','OLD VALUES: id=8 | transaction_number=PKL00000008 | status=LOGGED | document_date=2024-02-05 00:00:00 | warehouse_id=53 | picklist_type_code=TO | remarks= | created_date=2024-02-05 18:55:38 | created_by=1 | updated_date= | updated_by= | posted_date= | posted_by= | closed_date= | closed_by= | cancelled_date= | cancelled_by= | picking_group_id= | last_status_update_remarks= | issued_date= | issued_by= | printed_flag=0 <br>NEW VALUES: transaction_number=PKL00000008 | status=LOGGED | document_date=2024-02-05 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2024-02-05 18:55:38 | created_by=1 | updated_date=2024-02-05 18:55:41 | updated_by=1',1,'2024-02-05 18:55:41','8'),(187,'PICKLIST','Edited Picklist Header','OLD VALUES: id=8 | transaction_number=PKL00000008 | status=LOGGED | document_date=2024-02-05 00:00:00 | warehouse_id=53 | picklist_type_code=TO | remarks= | created_date=2024-02-05 18:55:38 | created_by=1 | updated_date=2024-02-05 18:55:41 | updated_by=1 | posted_date= | posted_by= | closed_date= | closed_by= | cancelled_date= | cancelled_by= | picking_group_id= | last_status_update_remarks= | issued_date= | issued_by= | printed_flag=0 <br>NEW VALUES: transaction_number=PKL00000008 | status=LOGGED | document_date=2024-02-05 | warehouse_id=53 | picklist_type_code=TO | picking_group_id=NULL | remarks=NULL | created_date=2024-02-05 18:55:38 | created_by=1 | updated_date=2024-02-05 18:57:42 | updated_by=1',1,'2024-02-05 18:57:42','8'),(188,'PICKLIST','Edited Picklist Header','OLD VALUES: id=8 | transaction_number=PKL00000008 | status=LOGGED | document_date=2024-02-05 00:00:00 | warehouse_id=53 | picklist_type_code=TO | remarks= | created_date=2024-02-05 18:55:38 | created_by=1 | updated_date=2024-02-05 18:57:42 | updated_by=1 | posted_date= | posted_by= | closed_date= | closed_by= | cancelled_date= | cancelled_by= | picking_group_id= | last_status_update_remarks= | issued_date= | issued_by= | printed_flag=0 <br>NEW VALUES: transaction_number=PKL00000008 | status=LOGGED | document_date=2024-02-05 | warehouse_id=49 | picklist_type_code=SO | picking_group_id=NULL | remarks=NULL | created_date=2024-02-05 18:55:38 | created_by=1 | updated_date=2024-02-05 18:57:50 | updated_by=1',1,'2024-02-05 18:57:50','8'),(189,'STOCK RECEIPT','Created Stock Receipt Header','id=11 | transaction_number=RCV00000011 | status=LOGGED | document_date=2024-02-14 | warehouse_id=53 | source_type=UD | purchase_order_header_id=NULL | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=SUPPLIER | source_client_id=NULL | source_supplier_id=1 | source_warehouse_id=NULL | reference_1=NULL | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2024-02-14 02:51:17 | created_by=1 | updated_date=NULL | updated_by=NULL | ie_number=NULL | arr_date=2024-02-14 | stripping_date=2024-02-14 | dr_date=2024-02-14 | pbi_number=NULL | container_number=NULL | boat_note_number=NULL | broker_name=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | user_defined_field6=NULL | user_defined_field7=NULL | user_defined_field8=NULL | for_client_id=NULL | client_transaction_number=NULL',1,'2024-02-14 02:51:17','11'),(190,'STOCK RECEIPT','Added Row Detail: New Line','id=37 | stock_receipt_header_id=11 | item_id=6 | lot_number=20240214 | expiry_date=NULL | uom_id=3 | quantity=1 | base_quantity=1 | remarks=NULL | created_date=2024-02-14 02:51:28 | created_by=1 | updated_date=2024-02-14 02:51:28 | updated_by=1 | pallet_number=NULL | weight=12 | mfg_date=2024-02-29 | box_number=',1,'2024-02-14 02:51:28','11'),(191,'STOCK RECEIPT','Deleted Row Detail','id=37 | stock_receipt_header_id=11 | transaction_number=RCV00000011 | item_id=6 | item_name=0.150 X 846.5 X 848 | uom_id=3 | uom_description=SHEETS | quantity=1 | base_quantity=1 | lot_number=20240214 | expiry_date= | remarks= | created_date=2024-02-14 02:51:28 | created_by=System Administrator | updated_date=2024-02-14 02:51:28 | updated_by=System Administrator | for_client_id=',1,'2024-02-14 03:17:37','11'),(192,'STOCK RECEIPT','Added Row Detail: New Line','id=38 | stock_receipt_header_id=11 | item_id=9 | lot_number=20240214 | expiry_date=2024-02-14 | uom_id=3 | quantity=12 | base_quantity=12 | remarks=NULL | created_date=2024-02-14 03:17:46 | created_by=1 | updated_date=2024-02-14 03:17:46 | updated_by=1 | pallet_number=NULL | weight=12 | mfg_date=2024-02-29 | box_number=',1,'2024-02-14 03:17:46','11'),(193,'PURCHASE ORDER','Created Purchase Order Header','id=3 | transaction_number=PO00000003 | status=LOGGED | reference=TEST | supplier_id=1 | supplier_street_address=NULL | supplier_district_address=NULL | supplier_city_address=NULL | supplier_region_address=NULL | supplier_zip_code_address=NULL | supplier_country_address=NULL | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=53 | client_id=NULL | ship_to_street_address=NULL | ship_to_district_address=NULL | ship_to_city_address=NULL | ship_to_region_address=NULL | ship_to_zip_code_address=NULL | ship_to_country_address=NULL | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2024-02-14 | delivery_date=2024-03-01 | created_date=2024-02-14 03:18:33 | created_by=1 | updated_date=NULL | updated_by=NULL | proforma_invoice=NULL | shipment_terms_id=19 | currency_id=1 | approved_by=DEFAULT PO APPROVER | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | for_client_id=NULL',1,'2024-02-14 03:18:33','3'),(194,'PURCHASE ORDER','Added Row Detail: New Line','id=5 | purchase_order_header_id=3 | item_id=9 | uom_id=3 | quantity=12 | base_quantity=12 | unit_price=0 | net_price=0 | amount=0 | remarks=NULL | created_date=2024-02-14 03:18:55 | created_by=1 | updated_date=2024-02-14 03:18:55 | updated_by=1 | active_flag=1 | bpc=1 | weight=0 | expected_expiry_date=NULL | expected_mfg_date=NULL | expected_lot_number=NULL',1,'2024-02-14 03:18:55','3'),(195,'PURCHASE ORDER','Posted Transaction','Transaction No.: PO00000003',1,'2024-02-14 03:18:57','3'),(196,'STOCK RECEIPT','Created Stock Receipt Header','id=12 | transaction_number=RCV00000012 | status=LOGGED | document_date=2024-02-14 | warehouse_id=53 | source_type=PO | purchase_order_header_id=3 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=NULL | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2024-02-14 03:19:03 | created_by=1 | updated_date=NULL | updated_by=NULL | ie_number=NULL | arr_date=2024-02-14 | stripping_date=2024-02-14 | dr_date=2024-02-14 | pbi_number=NULL | container_number=NULL | boat_note_number=NULL | broker_name=NULL | user_defined_field1=NULL | user_defined_field2=NULL | user_defined_field3=NULL | user_defined_field4=NULL | user_defined_field5=NULL | user_defined_field6=NULL | user_defined_field7=NULL | user_defined_field8=NULL | for_client_id=NULL | client_transaction_number=NULL',1,'2024-02-14 03:19:03','12'),(197,'STOCK RECEIPT','Added Row Detail: New Line','id=39 | stock_receipt_header_id=12 | item_id=9 | lot_number=240214 | expiry_date=2024-03-09 | uom_id=3 | quantity=12 | base_quantity=12 | remarks=NULL | created_date=2024-02-14 03:19:12 | created_by=1 | updated_date=2024-02-14 03:19:12 | updated_by=1 | pallet_number=NULL | weight=0 | mfg_date=2024-02-14 | box_number=',1,'2024-02-14 03:19:12','12'),(198,'CYCLE COUNT','Created Cycle Count Header','id=3 | transaction_number=CC00000003 | status=LOGGED | document_date=2024-02-14 | warehouse_id=50 | reference=NULL | remarks=NULL | created_date=2024-02-14 03:41:54 | created_by=1 | updated_date=NULL | updated_by=NULL | cycle_count_type_code=ITEM | date_from=ITEM | date_to=NULL',1,'2024-02-14 03:41:54','3'),(199,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000003 | ax_code: RM-CTG-007-002 | description: W-48 LUG TOYO INK WHITE | prev_count:  | actual_count: 1',1,'2024-02-14 03:42:04','3'),(200,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000003 | ax_code: RM-CTG-007-002 | description: W-48 LUG TOYO INK WHITE | prev_count: 1 | actual_count: 2',1,'2024-02-14 03:42:16','3'),(201,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000003 | ax_code: RM-CTG-007-002 | description: W-48 LUG TOYO INK WHITE | prev_count: 2 | actual_count: 20',1,'2024-02-14 03:42:17','3'),(202,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000003 | ax_code: RM-CTG-007-002 | description: W-48 LUG TOYO INK WHITE | prev_weight:  | actual_weight: 2',1,'2024-02-14 03:55:00','3'),(203,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000003 | ax_code: RM-CTG-007-002 | description: W-48 LUG TOYO INK WHITE | prev_weight: 2 | actual_weight: 20',1,'2024-02-14 03:55:00','3'),(204,'STOCK ADJUSTMENT','Created Stock Adjustment Header','id=3 | transaction_number=ADJ00000003 | status=LOGGED | document_date=2024-02-14 | warehouse_id=50 | reference=NULL | remarks=NULL | created_date=2024-02-14 04:36:08 | created_by=1 | updated_date=NULL | updated_by=NULL | overall_inventory=0',1,'2024-02-14 04:36:08','3'),(205,'STOCK ADJUSTMENT','Added Row Detail','id= | stock_adjustment_header_id=3 | item_id=9 | location_id=6 | lot_number=BATCH001 | expiry_date=2025-02-01 | uom_id=3 | quantity=15 | base_quantity=15 | created_date=2024-02-14 04:36:36 | created_by=1 | updated_date=2024-02-14 04:36:36 | updated_by=1 | reason=Wrong Quantity | for_client_id=NULL | mfg_date=2024-02-01 | weight=15 | pallet_number=NULL | adjustment_type=INCREASE',1,'2024-02-14 04:36:36','3'),(206,'STOCK ADJUSTMENT','Added Row Detail','id= | stock_adjustment_header_id=3 | item_id=9 | location_id=6 | lot_number=BATCH002 | expiry_date=2025-02-01 | uom_id=3 | quantity=5 | base_quantity=5 | created_date=2024-02-14 04:36:56 | created_by=1 | updated_date=2024-02-14 04:36:56 | updated_by=1 | reason=Wrong Quantity | for_client_id=NULL | mfg_date=2024-02-01 | weight=5 | pallet_number=NULL | adjustment_type=INCREASE',1,'2024-02-14 04:36:56','3'),(207,'STOCK ADJUSTMENT','Added Row Detail','id= | stock_adjustment_header_id=3 | item_id=10 | location_id=6 | lot_number=BATCH003 | expiry_date=2026-02-01 | uom_id=3 | quantity=30 | base_quantity=30 | created_date=2024-02-14 04:37:21 | created_by=1 | updated_date=2024-02-14 04:37:21 | updated_by=1 | reason=Wrong Quantity | for_client_id=NULL | mfg_date=2024-02-01 | weight=30 | pallet_number=NULL | adjustment_type=INCREASE',1,'2024-02-14 04:37:21','3'),(208,'STOCK ADJUSTMENT','Added Row Detail','id= | stock_adjustment_header_id=3 | item_id=10 | location_id=6 | lot_number=BATCH004 | expiry_date=2026-02-02 | uom_id=3 | quantity=20 | base_quantity=20 | created_date=2024-02-14 04:37:49 | created_by=1 | updated_date=2024-02-14 04:37:49 | updated_by=1 | reason=Wrong Quantity | for_client_id=NULL | mfg_date=2024-02-02 | weight=20 | pallet_number=NULL | adjustment_type=INCREASE',1,'2024-02-14 04:37:49','3'),(209,'WAREHOUSE','Edited Warehouse Info','OLD VALUES: id=50 | code=ROWELL | description=ROWELL | created_by= | created_date=2023-11-13 08:49:00 | updated_by=1 | updated_date=2023-12-14 13:56:46 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=6 | street= | city= | district= | region= | zip_code= | country= | pallet_prefix= | pallet_number_series=1 | stock_adjustment_approver_id= | mpo_default_bin_location_id= | rpo_default_bin_location_id= | generate_receiving_upon_dispatch=1 <br>NEW VALUES: code=ROWELL | description=ROWELL | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2024-02-14 04:38:07 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=6 | street=NULL | district=NULL | city=NULL | region=NULL | zip_code=NULL | country=NULL | stock_adjustment_approver_id=1 | rpo_default_bin_location_id=NULL | mpo_default_bin_location_id=NULL | generate_receiving_upon_dispatch=1',1,'2024-02-14 04:38:07','50'),(210,'STOCK ADJUSTMENT','Posted For Approval Transaction','Transaction No.: ADJ00000003; Assigned Approver: System Administrator',1,'2024-02-14 04:38:10','3'),(211,'STOCK ADJUSTMENT','Approved Transaction','Transaction No.: ADJ00000003 | Assigned Approver: System Administrator',1,'2024-02-14 04:38:12','3'),(212,'CYCLE COUNT','Created Cycle Count Header','id=4 | transaction_number=CC00000004 | status=LOGGED | document_date=2024-02-14 | warehouse_id=50 | reference=NULL | remarks=NULL | created_date=2024-02-14 04:38:21 | created_by=1 | updated_date=NULL | updated_by=NULL | cycle_count_type_code=ITEM | date_from=ITEM | date_to=NULL',1,'2024-02-14 04:38:21','4'),(213,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: RM-CTG-007-002 | description: W-48 LUG TOYO INK WHITE | prev_count:  | actual_count: 21',1,'2024-02-14 04:38:27','4'),(214,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: RM-CTG-007-002 | description: W-48 LUG TOYO INK WHITE | prev_count: 21 | actual_count: 21',1,'2024-02-14 04:38:27','4'),(215,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count:  | actual_count: 1',1,'2024-02-14 04:38:34','4'),(216,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count: 1 | actual_count: 15',1,'2024-02-14 04:38:34','4'),(217,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_weight:  | actual_weight: NULL',1,'2024-02-14 04:38:35','4'),(218,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_weight:  | actual_weight: 1',1,'2024-02-14 04:38:35','4'),(219,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_weight: 1 | actual_weight: 15',1,'2024-02-14 04:38:35','4'),(220,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count:  | actual_count: NULL',1,'2024-02-14 04:38:36','4'),(221,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count:  | actual_count: 5',1,'2024-02-14 04:38:38','4'),(222,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_weight:  | actual_weight: NULL',1,'2024-02-14 04:38:39','4'),(223,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_count: 5 | actual_count: 4',1,'2024-02-14 04:38:41','4'),(224,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: AAA | description: 0.150 X 783 X 880 | prev_weight:  | actual_weight: 4',1,'2024-02-14 04:38:42','4'),(225,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_count:  | actual_count: 3',1,'2024-02-14 04:38:44','4'),(226,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_count: 3 | actual_count: 30',1,'2024-02-14 04:38:44','4'),(227,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_weight:  | actual_weight: NULL',1,'2024-02-14 04:38:44','4'),(228,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_weight:  | actual_weight: 34',1,'2024-02-14 04:38:45','4'),(229,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_weight: 34 | actual_weight: 3',1,'2024-02-14 04:38:45','4'),(230,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_weight: 3 | actual_weight: 30',1,'2024-02-14 04:38:45','4'),(231,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_count:  | actual_count: NULL',1,'2024-02-14 04:38:46','4'),(232,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_count:  | actual_count: 2',1,'2024-02-14 04:38:46','4'),(233,'CYCLE COUNT','Update Actual Count','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_count: 2 | actual_count: 20',1,'2024-02-14 04:38:47','4'),(234,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_weight:  | actual_weight: NULL',1,'2024-02-14 04:38:48','4'),(235,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_weight:  | actual_weight: 1',1,'2024-02-14 04:38:49','4'),(236,'CYCLE COUNT','Update Actual Weight','Transaction No.: CC00000004 | ax_code: BBB | description: 0.150 X 870 X 885 | prev_weight: 1 | actual_weight: 10',1,'2024-02-14 04:38:49','4');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_barcode_printing`
--

DROP TABLE IF EXISTS `temp_barcode_printing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_barcode_printing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lot_number` varchar(200) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `net_weight` double DEFAULT NULL,
  `box_number` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `upload_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  CONSTRAINT `temp_barcode_printing_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `temp_barcode_printing_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `temp_barcode_printing_ibfk_3` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44847 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_barcode_printing`
--

LOCK TABLES `temp_barcode_printing` WRITE;
/*!40000 ALTER TABLE `temp_barcode_printing` DISABLE KEYS */;
INSERT INTO `temp_barcode_printing` VALUES (1371,17,8,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000001371','2023-11-17 07:04:27','COATINGS'),(1372,17,8,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000001372','2023-11-17 07:04:27','COATINGS'),(1373,24,8,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000001373','2023-11-17 07:04:27','COATINGS'),(1374,24,8,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000001374','2023-11-17 07:04:27','COATINGS'),(1375,25,8,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000001375','2023-11-17 07:04:27','COATINGS'),(1376,25,8,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000001376','2023-11-17 07:04:27','COATINGS'),(1377,8,8,'','2022-07-20',NULL,1240,3,1240,'BG000000001377','2023-11-17 07:05:08','TINPLATE'),(2625,16,6,'BDC370458','2022-08-01','2023-01-28',200,4,200,'BG000000002625','2023-11-17 07:06:41','COATINGS'),(2626,16,6,'BDC370458','2022-08-01','2023-01-28',200,4,200,'BG000000002626','2023-11-17 07:06:41','COATINGS'),(2627,16,6,'BDC370458','2022-08-01','2023-01-28',200,4,200,'BG000000002627','2023-11-17 07:06:41','COATINGS'),(2628,16,6,'BDC370458','2022-08-01','2023-01-28',122,4,122,'BG000000002628','2023-11-17 07:06:41','COATINGS'),(2629,15,6,'GOP130047','2022-09-07','2023-03-06',190,4,190,'BG000000002629','2023-11-17 07:06:42','COATINGS'),(2630,15,6,'GOP130047','2022-09-07','2023-03-06',190,4,190,'BG000000002630','2023-11-17 07:06:42','COATINGS'),(2631,15,6,'GOP130047','2022-09-07','2023-03-06',190,4,190,'BG000000002631','2023-11-17 07:06:42','COATINGS'),(2632,15,6,'GOP130047','2022-09-07','2023-03-06',190,4,190,'BG000000002632','2023-11-17 07:06:42','COATINGS'),(2633,15,6,'GOP130047','2022-09-07','2023-03-06',88.21,4,88.21,'BG000000002633','2023-11-17 07:06:42','COATINGS'),(2634,17,6,'BDC378564','2023-07-14','2024-01-10',27,4,27,'BG000000002634','2023-11-17 07:06:42','COATINGS'),(2635,17,6,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000002635','2023-11-17 07:06:42','COATINGS'),(2636,17,6,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000002636','2023-11-17 07:06:42','COATINGS'),(2637,17,6,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000002637','2023-11-17 07:06:42','COATINGS'),(2638,33,6,'BDC370793','2022-09-19','2023-03-15',158,4,158,'BG000000002638','2023-11-17 07:06:42','COATINGS'),(2639,33,6,'BDC370793','2022-09-19','2023-03-15',270,4,270,'BG000000002639','2023-11-17 07:06:42','COATINGS'),(2640,18,6,'2594123057','2022-05-23','2023-05-23',127.97,4,127.97,'BG000000002640','2023-11-17 07:06:42','COATINGS'),(2641,18,6,'2V35127471','2022-11-12','2023-11-12',18.3,4,18.3,'BG000000002641','2023-11-17 07:06:42','COATINGS'),(2642,18,6,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000002642','2023-11-17 07:06:42','COATINGS'),(2643,18,6,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000002643','2023-11-17 07:06:42','COATINGS'),(2644,18,6,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000002644','2023-11-17 07:06:42','COATINGS'),(2645,18,6,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000002645','2023-11-17 07:06:42','COATINGS'),(2646,18,6,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000002646','2023-11-17 07:06:42','COATINGS'),(2647,18,6,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000002647','2023-11-17 07:06:42','COATINGS'),(2648,20,6,'2T3A054618','2022-10-16','2023-10-11',56,4,56,'BG000000002648','2023-11-17 07:06:42','COATINGS'),(2649,21,6,'2T3A054618','2022-10-16','2023-10-11',200,4,200,'BG000000002649','2023-11-17 07:06:42','COATINGS'),(2650,21,6,'2T3A054618','2022-10-16','2023-10-11',200,4,200,'BG000000002650','2023-11-17 07:06:42','COATINGS'),(2651,21,6,'2T3A054618','2022-10-16','2023-10-11',210,4,210,'BG000000002651','2023-11-17 07:06:42','COATINGS'),(2652,21,6,'2T3A054618','2022-10-16','2023-10-11',210,4,210,'BG000000002652','2023-11-17 07:06:42','COATINGS'),(2653,21,6,'VP033IL','2023-02-02','2024-01-28',210,4,210,'BG000000002653','2023-11-17 07:06:42','COATINGS'),(2654,21,6,'321H060810','2023-02-02','2024-02-02',200,4,200,'BG000000002654','2023-11-17 07:06:42','COATINGS'),(2655,21,6,'291H059963','2022-06-30','2023-06-30',48,4,48,'BG000000002655','2023-11-17 07:06:42','COATINGS'),(2656,21,6,'321H060764','2022-11-05','2023-11-05',190,4,190,'BG000000002656','2023-11-17 07:06:42','COATINGS'),(2657,21,6,'321H060764','2022-11-05','2023-11-05',250,4,250,'BG000000002657','2023-11-17 07:06:42','COATINGS'),(2658,21,6,'321H060764','2022-11-05','2023-11-05',250,4,250,'BG000000002658','2023-11-17 07:06:42','COATINGS'),(2659,21,6,'321H060764','2022-11-05','2023-11-05',250,4,250,'BG000000002659','2023-11-17 07:06:42','COATINGS'),(2660,24,6,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000002660','2023-11-17 07:06:42','COATINGS'),(2661,24,6,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000002661','2023-11-17 07:06:42','COATINGS'),(2662,24,6,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000002662','2023-11-17 07:06:42','COATINGS'),(2663,24,6,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000002663','2023-11-17 07:06:42','COATINGS'),(2664,24,6,'QD0129','2022-04-15','2023-01-31',240,4,240,'BG000000002664','2023-11-17 07:06:42','COATINGS'),(2665,25,6,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000002665','2023-11-17 07:06:42','COATINGS'),(2666,25,6,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000002666','2023-11-17 07:06:42','COATINGS'),(2667,6,6,'05-482300','2022-05-13',NULL,2000,3,0,'BG000000002667','2023-11-17 07:06:49','TINPLATE'),(2668,6,6,'05-482300','2022-05-13',NULL,2000,3,0,'BG000000002668','2023-11-17 07:06:49','TINPLATE'),(2669,6,6,'05-482300','2022-05-13',NULL,2000,3,0,'BG000000002669','2023-11-17 07:06:49','TINPLATE'),(2670,6,6,'05-482300','2022-05-13',NULL,2000,3,0,'BG000000002670','2023-11-17 07:06:49','TINPLATE'),(2671,6,6,'05-482300','2022-05-13',NULL,1922,3,0,'BG000000002671','2023-11-17 07:06:49','TINPLATE'),(2672,11,6,'Y-0937-2','2022-07-06',NULL,630,3,0,'BG000000002672','2023-11-17 07:06:49','TINPLATE'),(2673,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002673','2023-11-17 07:06:49','TINPLATE'),(2674,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002674','2023-11-17 07:06:49','TINPLATE'),(2675,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002675','2023-11-17 07:06:49','TINPLATE'),(2676,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002676','2023-11-17 07:06:49','TINPLATE'),(2677,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002677','2023-11-17 07:06:49','TINPLATE'),(2678,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002678','2023-11-17 07:06:49','TINPLATE'),(2679,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002679','2023-11-17 07:06:49','TINPLATE'),(2680,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002680','2023-11-17 07:06:49','TINPLATE'),(2681,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002681','2023-11-17 07:06:49','TINPLATE'),(2682,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002682','2023-11-17 07:06:49','TINPLATE'),(2683,10,6,'6-0953','2022-07-07',NULL,1800,3,0,'BG000000002683','2023-11-17 07:06:49','TINPLATE'),(2684,10,6,'6-0953','2022-07-07',NULL,1208,3,0,'BG000000002684','2023-11-17 07:06:49','TINPLATE'),(2685,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002685','2023-11-17 07:06:49','TINPLATE'),(2686,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002686','2023-11-17 07:06:49','TINPLATE'),(2687,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002687','2023-11-17 07:06:49','TINPLATE'),(2688,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002688','2023-11-17 07:06:49','TINPLATE'),(2689,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002689','2023-11-17 07:06:49','TINPLATE'),(2690,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002690','2023-11-17 07:06:49','TINPLATE'),(2691,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002691','2023-11-17 07:06:49','TINPLATE'),(2692,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002692','2023-11-17 07:06:49','TINPLATE'),(2693,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002693','2023-11-17 07:06:49','TINPLATE'),(2694,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002694','2023-11-17 07:06:49','TINPLATE'),(2695,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002695','2023-11-17 07:06:49','TINPLATE'),(2696,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002696','2023-11-17 07:06:49','TINPLATE'),(2697,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002697','2023-11-17 07:06:49','TINPLATE'),(2698,12,6,'09-482146','2022-09-16',NULL,2000,3,0,'BG000000002698','2023-11-17 07:06:49','TINPLATE'),(2699,12,6,'09-482146','2022-09-16',NULL,1714,3,0,'BG000000002699','2023-11-17 07:06:49','TINPLATE'),(2700,9,6,'05-482293','2023-01-24',NULL,2000,3,0,'BG000000002700','2023-11-17 07:06:49','TINPLATE'),(2701,9,6,'05-482293','2023-01-24',NULL,2000,3,0,'BG000000002701','2023-11-17 07:06:49','TINPLATE'),(2702,9,6,'05-482293','2023-01-24',NULL,2000,3,0,'BG000000002702','2023-11-17 07:06:49','TINPLATE'),(2703,9,6,'05-482293','2023-01-24',NULL,2000,3,0,'BG000000002703','2023-11-17 07:06:49','TINPLATE'),(2704,9,6,'05-482293','2023-01-24',NULL,225,3,0,'BG000000002704','2023-11-17 07:06:49','TINPLATE'),(2705,8,6,'8-0934','2022-08-24',NULL,1700,3,0,'BG000000002705','2023-11-17 07:06:49','TINPLATE'),(2706,8,6,'8-0934','2022-08-24',NULL,1700,3,0,'BG000000002706','2023-11-17 07:06:49','TINPLATE'),(2707,8,6,'6-0924','2022-07-05',NULL,1700,3,0,'BG000000002707','2023-11-17 07:06:49','TINPLATE'),(2708,8,6,'6-0924','2022-07-05',NULL,1700,3,0,'BG000000002708','2023-11-17 07:06:49','TINPLATE'),(2709,8,6,'6-0924','2022-07-05',NULL,1700,3,0,'BG000000002709','2023-11-17 07:06:49','TINPLATE'),(2710,42,6,'6-0924','2022-07-05',NULL,1700,3,0,'BG000000002710','2023-11-17 07:06:49','TINPLATE'),(2711,43,6,'6-0924','2022-07-05',NULL,1700,3,0,'BG000000002711','2023-11-17 07:06:49','TINPLATE'),(2712,43,6,'6-0924','2022-07-05',NULL,1700,3,0,'BG000000002712','2023-11-17 07:06:49','TINPLATE'),(2713,43,6,'6-0924','2022-07-05',NULL,400,3,0,'BG000000002713','2023-11-17 07:06:49','TINPLATE'),(2714,7,6,'Y-0639','2023-01-03',NULL,1500,3,0,'BG000000002714','2023-11-17 07:06:49','TINPLATE'),(2715,7,6,'Y-0639','2023-01-03',NULL,1500,3,0,'BG000000002715','2023-11-17 07:06:49','TINPLATE'),(2716,7,6,'Y-0639','2023-01-03',NULL,1500,3,0,'BG000000002716','2023-11-17 07:06:49','TINPLATE'),(2717,7,6,'Y-0639','2023-01-03',NULL,1500,3,0,'BG000000002717','2023-11-17 07:06:49','TINPLATE'),(2718,7,6,'Y-0639','2023-01-03',NULL,1500,3,0,'BG000000002718','2023-11-17 07:06:49','TINPLATE'),(2719,7,6,'06-482383','2022-06-19',NULL,2000,3,0,'BG000000002719','2023-11-17 07:06:49','TINPLATE'),(2720,7,6,'06-482385','2022-06-19',NULL,2000,3,0,'BG000000002720','2023-11-17 07:06:49','TINPLATE'),(2721,7,6,'06-482385','2022-06-19',NULL,2000,3,0,'BG000000002721','2023-11-17 07:06:49','TINPLATE'),(2722,7,6,'06-482385','2022-06-19',NULL,2000,3,0,'BG000000002722','2023-11-17 07:06:49','TINPLATE'),(2723,7,6,'06-482385','2022-06-19',NULL,1795,3,0,'BG000000002723','2023-11-17 07:06:49','TINPLATE'),(2724,44,6,'N/A',NULL,NULL,5.37,4,5.37,'BG000000002724','2023-11-17 07:06:55','INK'),(2725,45,6,'N/A',NULL,NULL,10,4,10,'BG000000002725','2023-11-17 07:06:55','INK'),(2726,46,6,'N/A',NULL,NULL,16,4,16,'BG000000002726','2023-11-17 07:06:55','INK'),(2727,47,6,'N/A',NULL,NULL,6.08,4,6.08,'BG000000002727','2023-11-17 07:06:55','INK'),(2728,44,6,'N/A',NULL,NULL,5.37,4,5.37,'BG000000002728','2023-11-17 09:00:21','INK'),(2729,45,6,'N/A',NULL,NULL,10,4,10,'BG000000002729','2023-11-17 09:00:21','INK'),(2730,46,6,'N/A',NULL,NULL,16,4,16,'BG000000002730','2023-11-17 09:00:21','INK'),(2731,47,6,'N/A',NULL,NULL,6.08,4,6.08,'BG000000002731','2023-11-17 09:00:21','INK'),(43600,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043600','2023-11-21 15:04:30','PM'),(43601,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043601','2023-11-21 15:04:30','PM'),(43602,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043602','2023-11-21 15:04:30','PM'),(43603,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043603','2023-11-21 15:04:30','PM'),(43604,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043604','2023-11-21 15:04:30','PM'),(43605,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043605','2023-11-21 15:04:30','PM'),(43606,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043606','2023-11-21 15:04:30','PM'),(43607,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043607','2023-11-21 15:04:30','PM'),(43608,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043608','2023-11-21 15:04:30','PM'),(43609,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043609','2023-11-21 15:04:30','PM'),(43610,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043610','2023-11-21 15:04:30','PM'),(43611,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043611','2023-11-21 15:04:30','PM'),(43612,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043612','2023-11-21 15:04:30','PM'),(43613,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043613','2023-11-21 15:04:30','PM'),(43614,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043614','2023-11-21 15:04:30','PM'),(43615,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043615','2023-11-21 15:04:30','PM'),(43616,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043616','2023-11-21 15:04:30','PM'),(43617,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043617','2023-11-21 15:04:30','PM'),(43618,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043618','2023-11-21 15:04:30','PM'),(43619,1,11,'SC001','2023-10-07',NULL,600,1,0,'BG000000043619','2023-11-21 15:04:30','PM'),(43620,1,11,'SC001','2023-10-07',NULL,200,1,0,'BG000000043620','2023-11-21 15:04:30','PM'),(43621,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043621','2023-11-21 15:04:30','PM'),(43622,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043622','2023-11-21 15:04:30','PM'),(43623,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043623','2023-11-21 15:04:30','PM'),(43624,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043624','2023-11-21 15:04:30','PM'),(43625,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043625','2023-11-21 15:04:30','PM'),(43626,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043626','2023-11-21 15:04:30','PM'),(43627,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043627','2023-11-21 15:04:30','PM'),(43628,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043628','2023-11-21 15:04:30','PM'),(43629,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043629','2023-11-21 15:04:31','PM'),(43630,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043630','2023-11-21 15:04:31','PM'),(43631,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043631','2023-11-21 15:04:31','PM'),(43632,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043632','2023-11-21 15:04:31','PM'),(43633,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043633','2023-11-21 15:04:31','PM'),(43634,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043634','2023-11-21 15:04:31','PM'),(43635,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043635','2023-11-21 15:04:31','PM'),(43636,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043636','2023-11-21 15:04:31','PM'),(43637,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043637','2023-11-21 15:04:31','PM'),(43638,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043638','2023-11-21 15:04:31','PM'),(43639,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043639','2023-11-21 15:04:31','PM'),(43640,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043640','2023-11-21 15:04:31','PM'),(43641,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043641','2023-11-21 15:04:31','PM'),(43642,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043642','2023-11-21 15:04:31','PM'),(43643,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043643','2023-11-21 15:04:31','PM'),(43644,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043644','2023-11-21 15:04:31','PM'),(43645,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043645','2023-11-21 15:04:31','PM'),(43646,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043646','2023-11-21 15:04:31','PM'),(43647,2,11,'PPMC001','2023-10-06',NULL,300,1,0,'BG000000043647','2023-11-21 15:04:31','PM'),(43648,2,11,'PPMC001','2023-10-06',NULL,200,1,0,'BG000000043648','2023-11-21 15:04:31','PM'),(43649,2,11,'PPMC001','2023-10-06',NULL,200,1,0,'BG000000043649','2023-11-21 15:04:31','PM'),(43650,2,11,'PPMC001','2023-10-06',NULL,10,1,0,'BG000000043650','2023-11-21 15:04:31','PM'),(43651,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043651','2023-11-21 15:04:31','PM'),(43652,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043652','2023-11-21 15:04:31','PM'),(43653,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043653','2023-11-21 15:04:31','PM'),(43654,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043654','2023-11-21 15:04:31','PM'),(43655,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043655','2023-11-21 15:04:31','PM'),(43656,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043656','2023-11-21 15:04:31','PM'),(43657,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043657','2023-11-21 15:04:31','PM'),(43658,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043658','2023-11-21 15:04:31','PM'),(43659,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043659','2023-11-21 15:04:31','PM'),(43660,3,11,'SL001','2023-10-25',NULL,80,2,0,'BG000000043660','2023-11-21 15:04:31','PM'),(43661,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043661','2023-11-21 15:04:31','PM'),(43662,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043662','2023-11-21 15:04:31','PM'),(43663,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043663','2023-11-21 15:04:31','PM'),(43664,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043664','2023-11-21 15:04:31','PM'),(43665,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043665','2023-11-21 15:04:31','PM'),(43666,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043666','2023-11-21 15:04:31','PM'),(43667,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043667','2023-11-21 15:04:31','PM'),(43668,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043668','2023-11-21 15:04:31','PM'),(43669,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043669','2023-11-21 15:04:31','PM'),(43670,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043670','2023-11-21 15:04:31','PM'),(43671,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043671','2023-11-21 15:04:31','PM'),(43672,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043672','2023-11-21 15:04:31','PM'),(43673,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043673','2023-11-21 15:04:31','PM'),(43674,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043674','2023-11-21 15:04:31','PM'),(43675,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043675','2023-11-21 15:04:31','PM'),(43676,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043676','2023-11-21 15:04:31','PM'),(43677,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043677','2023-11-21 15:04:31','PM'),(43678,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043678','2023-11-21 15:04:31','PM'),(43679,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043679','2023-11-21 15:04:31','PM'),(43680,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043680','2023-11-21 15:04:31','PM'),(43681,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043681','2023-11-21 15:04:31','PM'),(43682,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043682','2023-11-21 15:04:31','PM'),(43683,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043683','2023-11-21 15:04:31','PM'),(43684,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043684','2023-11-21 15:04:31','PM'),(43685,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043685','2023-11-21 15:04:31','PM'),(43686,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043686','2023-11-21 15:04:31','PM'),(43687,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043687','2023-11-21 15:04:31','PM'),(43688,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043688','2023-11-21 15:04:31','PM'),(43689,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043689','2023-11-21 15:04:31','PM'),(43690,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043690','2023-11-21 15:04:31','PM'),(43691,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043691','2023-11-21 15:04:31','PM'),(43692,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043692','2023-11-21 15:04:31','PM'),(43693,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043693','2023-11-21 15:04:31','PM'),(43694,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043694','2023-11-21 15:04:31','PM'),(43695,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043695','2023-11-21 15:04:31','PM'),(43696,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043696','2023-11-21 15:04:31','PM'),(43697,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043697','2023-11-21 15:04:31','PM'),(43698,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043698','2023-11-21 15:04:31','PM'),(43699,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043699','2023-11-21 15:04:31','PM'),(43700,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043700','2023-11-21 15:04:31','PM'),(43701,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043701','2023-11-21 15:04:31','PM'),(43702,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043702','2023-11-21 15:04:31','PM'),(43703,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043703','2023-11-21 15:04:31','PM'),(43704,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043704','2023-11-21 15:04:31','PM'),(43705,4,11,'LBL001','2023-10-24',NULL,1,2,0,'BG000000043705','2023-11-21 15:04:31','PM'),(43706,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043706','2023-11-21 15:04:31','PM'),(43707,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043707','2023-11-21 15:04:31','PM'),(43708,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043708','2023-11-21 15:04:31','PM'),(43709,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043709','2023-11-21 15:04:31','PM'),(43710,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043710','2023-11-21 15:04:31','PM'),(43711,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043711','2023-11-21 15:04:31','PM'),(43712,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043712','2023-11-21 15:04:31','PM'),(43713,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043713','2023-11-21 15:04:31','PM'),(43714,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043714','2023-11-21 15:04:31','PM'),(43715,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043715','2023-11-21 15:04:31','PM'),(43716,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043716','2023-11-21 15:04:31','PM'),(43717,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043717','2023-11-21 15:04:31','PM'),(43718,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043718','2023-11-21 15:04:31','PM'),(43719,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043719','2023-11-21 15:04:31','PM'),(43720,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043720','2023-11-21 15:04:31','PM'),(43721,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043721','2023-11-21 15:04:31','PM'),(43722,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043722','2023-11-21 15:04:31','PM'),(43723,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043723','2023-11-21 15:04:31','PM'),(43724,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043724','2023-11-21 15:04:31','PM'),(43725,5,11,'RBN001','2023-10-24',NULL,1,2,0,'BG000000043725','2023-11-21 15:04:31','PM'),(43726,6,16,'6-1038','2022-07-04',NULL,2100,3,1777,'BG000000043726','2023-11-21 15:04:31','TINPLATE'),(43727,6,16,'6-1037','2022-07-04',NULL,2100,3,1777,'BG000000043727','2023-11-21 15:04:31','TINPLATE'),(43728,6,16,'6-1038','2022-07-04',NULL,2100,3,1777,'BG000000043728','2023-11-21 15:04:31','TINPLATE'),(43729,6,16,'6-1038','2022-07-04',NULL,2100,3,1777,'BG000000043729','2023-11-21 15:04:31','TINPLATE'),(43730,6,16,'6-1038','2022-07-04',NULL,2100,3,1777,'BG000000043730','2023-11-21 15:04:31','TINPLATE'),(43731,6,16,'6-1038','2022-07-04',NULL,2100,3,1777,'BG000000043731','2023-11-21 15:04:32','TINPLATE'),(43732,6,16,'6-1069','2022-07-04',NULL,2100,3,1777,'BG000000043732','2023-11-21 15:04:32','TINPLATE'),(43733,6,16,'6-1040','2022-07-04',NULL,2100,3,1777,'BG000000043733','2023-11-21 15:04:32','TINPLATE'),(43734,6,16,'6-1039','2022-07-04',NULL,2100,3,1777,'BG000000043734','2023-11-21 15:04:32','TINPLATE'),(43735,6,16,'6-1040','2022-07-04',NULL,2100,3,1777,'BG000000043735','2023-11-21 15:04:32','TINPLATE'),(43736,6,16,'6-1040','2022-07-04',NULL,2100,3,1777,'BG000000043736','2023-11-21 15:04:32','TINPLATE'),(43737,6,16,'6-1040','2022-07-04',NULL,2100,3,1777,'BG000000043737','2023-11-21 15:04:32','TINPLATE'),(43738,6,16,'6-1040','2022-07-04',NULL,2100,3,1777,'BG000000043738','2023-11-21 15:04:32','TINPLATE'),(43739,6,16,'6-1039','2022-07-04',NULL,2100,3,1777,'BG000000043739','2023-11-21 15:04:32','TINPLATE'),(43740,6,16,'6-1040','2022-07-04',NULL,2100,3,1777,'BG000000043740','2023-11-21 15:04:32','TINPLATE'),(43741,6,16,'6-1037','2022-07-04',NULL,2100,3,1777,'BG000000043741','2023-11-21 15:04:32','TINPLATE'),(43742,6,16,'6-1038','2022-07-04',NULL,2100,3,1777,'BG000000043742','2023-11-21 15:04:32','TINPLATE'),(43743,6,16,'6-1039','2022-07-04',NULL,2100,3,1777,'BG000000043743','2023-11-21 15:04:32','TINPLATE'),(43744,6,16,'6-1033','2022-07-04',NULL,2100,3,1777,'BG000000043744','2023-11-21 15:04:32','TINPLATE'),(43745,6,16,'6-1037','2022-07-04',NULL,2100,3,1777,'BG000000043745','2023-11-21 15:04:32','TINPLATE'),(43746,6,16,'6-1037','2022-07-04',NULL,2100,3,1777,'BG000000043746','2023-11-21 15:04:32','TINPLATE'),(43747,6,16,'6-1039','2022-07-04',NULL,2100,3,1777,'BG000000043747','2023-11-21 15:04:32','TINPLATE'),(43748,6,16,'6-1039','2022-07-04',NULL,2100,3,1777,'BG000000043748','2023-11-21 15:04:32','TINPLATE'),(43749,6,16,'6-1038','2022-07-04',NULL,2100,3,1777,'BG000000043749','2023-11-21 15:04:32','TINPLATE'),(43750,6,16,'6-1038','2022-07-04',NULL,2100,3,1777,'BG000000043750','2023-11-21 15:04:32','TINPLATE'),(43751,6,16,'6-1034','2022-07-01',NULL,2100,3,1777,'BG000000043751','2023-11-21 15:04:32','TINPLATE'),(43752,6,16,'6-1033','2022-07-01',NULL,2100,3,1777,'BG000000043752','2023-11-21 15:04:32','TINPLATE'),(43753,6,16,'6-1034','2022-07-01',NULL,2100,3,1777,'BG000000043753','2023-11-21 15:04:32','TINPLATE'),(43754,7,18,'6-0926','2022-07-06',NULL,1500,3,1707,'BG000000043754','2023-11-21 15:04:32','TINPLATE'),(43755,7,18,'6-0926','2022-07-06',NULL,1500,3,1707,'BG000000043755','2023-11-21 15:04:32','TINPLATE'),(43756,7,18,'6-0925','2022-07-06',NULL,1500,3,1707,'BG000000043756','2023-11-21 15:04:32','TINPLATE'),(43757,7,18,'6-0926','2022-07-06',NULL,1500,3,1707,'BG000000043757','2023-11-21 15:04:32','TINPLATE'),(43758,7,18,'6-0925','2022-07-06',NULL,1500,3,1707,'BG000000043758','2023-11-21 15:04:32','TINPLATE'),(43759,7,18,'6-0925','2022-07-06',NULL,1500,3,1707,'BG000000043759','2023-11-21 15:04:32','TINPLATE'),(43760,7,18,'6-0925','2022-07-06',NULL,1500,3,1707,'BG000000043760','2023-11-21 15:04:32','TINPLATE'),(43761,7,18,'6-0925','2022-07-06',NULL,1500,3,1707,'BG000000043761','2023-11-21 15:04:32','TINPLATE'),(43762,7,18,'6-0926','2022-07-06',NULL,1500,3,1707,'BG000000043762','2023-11-21 15:04:32','TINPLATE'),(43763,7,18,'6-0925','2022-07-06',NULL,1500,3,1707,'BG000000043763','2023-11-21 15:04:32','TINPLATE'),(43764,7,18,'6-0925','2022-07-06',NULL,1500,3,1707,'BG000000043764','2023-11-21 15:04:32','TINPLATE'),(43765,7,18,'6-0912','2022-07-06',NULL,1500,3,1707,'BG000000043765','2023-11-21 15:04:32','TINPLATE'),(43766,7,18,'6-0912','2022-07-06',NULL,1500,3,1707,'BG000000043766','2023-11-21 15:04:32','TINPLATE'),(43767,7,18,'6-0912','2022-07-06',NULL,1500,3,1707,'BG000000043767','2023-11-21 15:04:32','TINPLATE'),(43768,7,18,'6-0925','2022-07-06',NULL,1500,3,1707,'BG000000043768','2023-11-21 15:04:32','TINPLATE'),(43769,7,18,'6-0912','2022-07-06',NULL,1500,3,1707,'BG000000043769','2023-11-21 15:04:32','TINPLATE'),(43770,7,18,'6-0912','2022-07-06',NULL,1500,3,1707,'BG000000043770','2023-11-21 15:04:32','TINPLATE'),(43771,7,18,'6-0925','2022-07-06',NULL,1500,3,1707,'BG000000043771','2023-11-21 15:04:32','TINPLATE'),(43772,7,18,'4-0864','2022-04-23',NULL,1500,3,1707,'BG000000043772','2023-11-21 15:04:32','TINPLATE'),(43773,7,18,'4-0864','2022-04-23',NULL,1500,3,1707,'BG000000043773','2023-11-21 15:04:32','TINPLATE'),(43774,7,18,'6-0912','2022-04-23',NULL,1500,3,1707,'BG000000043774','2023-11-21 15:04:32','TINPLATE'),(43775,7,18,'4-0864','2022-04-23',NULL,1500,3,1707,'BG000000043775','2023-11-21 15:04:32','TINPLATE'),(43776,7,18,'4-0864','2022-04-23',NULL,1500,3,1707,'BG000000043776','2023-11-21 15:04:32','TINPLATE'),(43777,7,18,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000043777','2023-11-21 15:04:32','TINPLATE'),(43778,7,18,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000043778','2023-11-21 15:04:32','TINPLATE'),(43779,7,18,'6-0930','2022-07-06',NULL,1500,3,1707,'BG000000043779','2023-11-21 15:04:32','TINPLATE'),(43780,7,18,'6-0926','2022-07-06',NULL,1500,3,1707,'BG000000043780','2023-11-21 15:04:32','TINPLATE'),(43781,7,18,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000043781','2023-11-21 15:04:32','TINPLATE'),(43782,7,18,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000043782','2023-11-21 15:04:32','TINPLATE'),(43783,7,18,'6-0930','2022-07-06',NULL,1500,3,1707,'BG000000043783','2023-11-21 15:04:32','TINPLATE'),(43784,7,18,'6-0930','2022-07-06',NULL,1500,3,1707,'BG000000043784','2023-11-21 15:04:32','TINPLATE'),(43785,7,18,'6-0930','2022-07-06',NULL,1500,3,1707,'BG000000043785','2023-11-21 15:04:32','TINPLATE'),(43786,7,18,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000043786','2023-11-21 15:04:32','TINPLATE'),(43787,7,18,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000043787','2023-11-21 15:04:32','TINPLATE'),(43788,7,18,'6-0921','2022-07-06',NULL,1500,3,1707,'BG000000043788','2023-11-21 15:04:32','TINPLATE'),(43789,8,19,'8-0937','2022-08-24',NULL,1700,3,1783,'BG000000043789','2023-11-21 15:04:32','TINPLATE'),(43790,8,19,'8-0937','2022-08-24',NULL,1700,3,1783,'BG000000043790','2023-11-21 15:04:32','TINPLATE'),(43791,8,19,'8-0989','2022-08-24',NULL,1700,3,1783,'BG000000043791','2023-11-21 15:04:32','TINPLATE'),(43792,8,19,'8-0989','2022-08-24',NULL,1700,3,1783,'BG000000043792','2023-11-21 15:04:32','TINPLATE'),(43793,8,19,'8-0937','2022-08-24',NULL,1700,3,1783,'BG000000043793','2023-11-21 15:04:32','TINPLATE'),(43794,8,19,'8-0989','2022-08-24',NULL,1700,3,1783,'BG000000043794','2023-11-21 15:04:32','TINPLATE'),(43795,8,19,'8-0937','2022-08-24',NULL,1700,3,1783,'BG000000043795','2023-11-21 15:04:32','TINPLATE'),(43796,8,19,'8-0937','2022-08-24',NULL,1700,3,1783,'BG000000043796','2023-11-21 15:04:32','TINPLATE'),(43797,8,19,'8-0937','2022-08-24',NULL,1700,3,1783,'BG000000043797','2023-11-21 15:04:32','TINPLATE'),(43798,8,19,'8-0937','2022-08-24',NULL,1700,3,1783,'BG000000043798','2023-11-21 15:04:32','TINPLATE'),(43799,8,19,'8-0937','2022-08-24',NULL,1700,3,1783,'BG000000043799','2023-11-21 15:04:32','TINPLATE'),(43800,8,19,'8-0937','2022-08-24',NULL,1700,3,1783,'BG000000043800','2023-11-21 15:04:32','TINPLATE'),(43801,8,19,'8-0990','2022-08-25',NULL,1700,3,1783,'BG000000043801','2023-11-21 15:04:32','TINPLATE'),(43802,8,19,'8-0992','2022-08-25',NULL,1700,3,1783,'BG000000043802','2023-11-21 15:04:32','TINPLATE'),(43803,8,19,'8-0992','2022-08-25',NULL,1700,3,1783,'BG000000043803','2023-11-21 15:04:32','TINPLATE'),(43804,8,19,'8-0991','2022-08-25',NULL,1700,3,1783,'BG000000043804','2023-11-21 15:04:32','TINPLATE'),(43805,8,19,'8-0991','2022-08-25',NULL,1700,3,1783,'BG000000043805','2023-11-21 15:04:32','TINPLATE'),(43806,8,19,'8-0992','2022-08-25',NULL,1700,3,1783,'BG000000043806','2023-11-21 15:04:32','TINPLATE'),(43807,8,19,'8-0990','2022-08-25',NULL,1700,3,1783,'BG000000043807','2023-11-21 15:04:32','TINPLATE'),(43808,8,19,'8-0992','2022-08-25',NULL,1700,3,1783,'BG000000043808','2023-11-21 15:04:32','TINPLATE'),(43809,8,19,'8-0990','2022-08-25',NULL,1700,3,1783,'BG000000043809','2023-11-21 15:04:32','TINPLATE'),(43810,8,19,'8-0990','2022-08-25',NULL,1700,3,1783,'BG000000043810','2023-11-21 15:04:32','TINPLATE'),(43811,8,19,'8-0938','2022-08-25',NULL,1700,3,1783,'BG000000043811','2023-11-21 15:04:32','TINPLATE'),(43812,8,19,'8-0938','2022-08-25',NULL,1700,3,1783,'BG000000043812','2023-11-21 15:04:32','TINPLATE'),(43813,8,19,'8-0938','2022-08-25',NULL,1700,3,1783,'BG000000043813','2023-11-21 15:04:32','TINPLATE'),(43814,8,19,'8-0992','2022-08-24',NULL,1700,3,1783,'BG000000043814','2023-11-21 15:04:32','TINPLATE'),(43815,8,19,'8-0988-1','2022-08-24',NULL,1700,3,1783,'BG000000043815','2023-11-21 15:04:32','TINPLATE'),(43816,8,19,'8-0989','2022-08-24',NULL,1700,3,1783,'BG000000043816','2023-11-21 15:04:32','TINPLATE'),(43817,8,19,'8-0989','2022-08-25',NULL,1700,3,1783,'BG000000043817','2023-11-21 15:04:32','TINPLATE'),(43818,8,19,'8-0938','2022-08-25',NULL,1700,3,1783,'BG000000043818','2023-11-21 15:04:32','TINPLATE'),(43819,8,19,'8-0938','2022-08-24',NULL,1700,3,1783,'BG000000043819','2023-11-21 15:04:32','TINPLATE'),(43820,8,19,'8-0938','2022-08-24',NULL,1700,3,1783,'BG000000043820','2023-11-21 15:04:32','TINPLATE'),(43821,8,19,'8-0992','2022-08-25',NULL,1700,3,1783,'BG000000043821','2023-11-21 15:04:32','TINPLATE'),(43822,8,19,'8-0989','2022-08-24',NULL,1700,3,1783,'BG000000043822','2023-11-21 15:04:32','TINPLATE'),(43823,8,19,'8-0989','2022-08-25',NULL,1700,3,1783,'BG000000043823','2023-11-21 15:04:32','TINPLATE'),(43824,8,19,'8-0989','2022-08-24',NULL,1700,3,1783,'BG000000043824','2023-11-21 15:04:32','TINPLATE'),(43825,9,20,'6-0966','2022-06-30',NULL,2100,3,1705,'BG000000043825','2023-11-21 15:04:32','TINPLATE'),(43826,9,20,'6-0966','2022-06-30',NULL,2100,3,1705,'BG000000043826','2023-11-21 15:04:32','TINPLATE'),(43827,9,20,'6-0966','2022-06-30',NULL,2100,3,1705,'BG000000043827','2023-11-21 15:04:33','TINPLATE'),(43828,9,20,'6-0966','2022-06-30',NULL,2100,3,1705,'BG000000043828','2023-11-21 15:04:33','TINPLATE'),(43829,9,20,'6-0966','2022-06-30',NULL,2100,3,1705,'BG000000043829','2023-11-21 15:04:33','TINPLATE'),(43830,9,20,'6-0965','2022-06-30',NULL,2100,3,1705,'BG000000043830','2023-11-21 15:04:33','TINPLATE'),(43831,9,20,'6-0965','2022-06-30',NULL,2100,3,1705,'BG000000043831','2023-11-21 15:04:33','TINPLATE'),(43832,9,20,'6-0966','2022-06-30',NULL,2100,3,1705,'BG000000043832','2023-11-21 15:04:33','TINPLATE'),(43833,9,20,'6-0966','2022-06-30',NULL,2100,3,1705,'BG000000043833','2023-11-21 15:04:33','TINPLATE'),(43834,9,20,'6-0966','2022-06-30',NULL,2100,3,1705,'BG000000043834','2023-11-21 15:04:33','TINPLATE'),(43835,9,20,'6-0966','2022-06-30',NULL,2100,3,1705,'BG000000043835','2023-11-21 15:04:33','TINPLATE'),(43836,9,20,'2-1154','2022-03-07',NULL,2100,3,1705,'BG000000043836','2023-11-21 15:04:33','TINPLATE'),(43837,9,20,'2-1140-2','2022-03-07',NULL,2100,3,1705,'BG000000043837','2023-11-21 15:04:33','TINPLATE'),(43838,9,20,'2-1140-2','2022-03-07',NULL,2100,3,1705,'BG000000043838','2023-11-21 15:04:33','TINPLATE'),(43839,8,21,'6-0920','2022-07-05',NULL,1700,3,1783,'BG000000043839','2023-11-21 15:04:33','TINPLATE'),(43840,8,21,'6-0920','2022-07-05',NULL,1700,3,1783,'BG000000043840','2023-11-21 15:04:33','TINPLATE'),(43841,8,21,'6-0920','2022-07-05',NULL,1700,3,1783,'BG000000043841','2023-11-21 15:04:33','TINPLATE'),(43842,8,21,'6-0916','2022-07-05',NULL,1700,3,1783,'BG000000043842','2023-11-21 15:04:33','TINPLATE'),(43843,8,21,'6-0920','2022-07-05',NULL,1700,3,1783,'BG000000043843','2023-11-21 15:04:33','TINPLATE'),(43844,8,21,'6-0920','2022-07-05',NULL,1700,3,1783,'BG000000043844','2023-11-21 15:04:33','TINPLATE'),(43845,8,21,'6-0922','2022-07-05',NULL,1700,3,1783,'BG000000043845','2023-11-21 15:04:33','TINPLATE'),(43846,8,21,'6-0922','2022-07-05',NULL,1700,3,1783,'BG000000043846','2023-11-21 15:04:33','TINPLATE'),(43847,8,21,'6-0922','2022-07-05',NULL,1700,3,1783,'BG000000043847','2023-11-21 15:04:33','TINPLATE'),(43848,8,21,'6-0922','2022-07-05',NULL,1700,3,1783,'BG000000043848','2023-11-21 15:04:33','TINPLATE'),(43849,8,21,'6-0915','2022-07-05',NULL,1700,3,1783,'BG000000043849','2023-11-21 15:04:33','TINPLATE'),(43850,8,21,'6-0915','2022-07-05',NULL,1700,3,1783,'BG000000043850','2023-11-21 15:04:33','TINPLATE'),(43851,8,21,'6-0915','2022-07-05',NULL,1700,3,1783,'BG000000043851','2023-11-21 15:04:33','TINPLATE'),(43852,8,21,'6-0922','2022-07-05',NULL,1700,3,1783,'BG000000043852','2023-11-21 15:04:33','TINPLATE'),(43853,8,21,'6-0921','2022-07-05',NULL,1700,3,1783,'BG000000043853','2023-11-21 15:04:33','TINPLATE'),(43854,8,21,'6-0922','2022-07-05',NULL,1700,3,1783,'BG000000043854','2023-11-21 15:04:33','TINPLATE'),(43855,8,21,'6-0923','2022-07-05',NULL,1700,3,1783,'BG000000043855','2023-11-21 15:04:33','TINPLATE'),(43856,8,21,'6-0922','2022-07-05',NULL,1700,3,1783,'BG000000043856','2023-11-21 15:04:33','TINPLATE'),(43857,8,21,'6-0923','2022-07-05',NULL,1700,3,1783,'BG000000043857','2023-11-21 15:04:33','TINPLATE'),(43858,8,21,'6-0922','2022-07-05',NULL,1700,3,1783,'BG000000043858','2023-11-21 15:04:33','TINPLATE'),(43859,8,21,'6-0922','2022-07-05',NULL,1700,3,1783,'BG000000043859','2023-11-21 15:04:33','TINPLATE'),(43860,8,21,'6-0924','2022-07-05',NULL,1700,3,1783,'BG000000043860','2023-11-21 15:04:33','TINPLATE'),(43861,8,21,'6-0924','2022-07-05',NULL,1700,3,1783,'BG000000043861','2023-11-21 15:04:33','TINPLATE'),(43862,8,21,'6-0923','2022-07-05',NULL,1700,3,1783,'BG000000043862','2023-11-21 15:04:33','TINPLATE'),(43863,8,21,'6-0923','2022-07-05',NULL,1700,3,1783,'BG000000043863','2023-11-21 15:04:33','TINPLATE'),(43864,8,21,'6-0923','2022-07-05',NULL,1700,3,1783,'BG000000043864','2023-11-21 15:04:33','TINPLATE'),(43865,8,21,'6-0923','2022-07-05',NULL,1700,3,1783,'BG000000043865','2023-11-21 15:04:33','TINPLATE'),(43866,8,21,'6-0923','2022-07-05',NULL,1700,3,1783,'BG000000043866','2023-11-21 15:04:33','TINPLATE'),(43867,8,21,'6-0923','2022-07-05',NULL,1700,3,1783,'BG000000043867','2023-11-21 15:04:33','TINPLATE'),(43868,8,21,'6-0923','2022-07-05',NULL,1700,3,1783,'BG000000043868','2023-11-21 15:04:33','TINPLATE'),(43869,8,21,'8-0988','2022-08-25',NULL,1700,3,1783,'BG000000043869','2023-11-21 15:04:33','TINPLATE'),(43870,8,21,'8-0990','2022-08-25',NULL,1700,3,1783,'BG000000043870','2023-11-21 15:04:33','TINPLATE'),(43871,8,21,'8-0990','2022-08-25',NULL,1700,3,1783,'BG000000043871','2023-11-21 15:04:33','TINPLATE'),(43872,9,22,'3-1220','2022-03-25',NULL,2100,3,1783,'BG000000043872','2023-11-21 15:04:33','TINPLATE'),(43873,9,22,'3-1219','2022-03-25',NULL,2100,3,1783,'BG000000043873','2023-11-21 15:04:33','TINPLATE'),(43874,9,22,'3-1219','2022-03-25',NULL,2100,3,1783,'BG000000043874','2023-11-21 15:04:33','TINPLATE'),(43875,9,22,'3-1219','2022-03-25',NULL,2100,3,1783,'BG000000043875','2023-11-21 15:04:33','TINPLATE'),(43876,9,22,'3-1220','2022-03-25',NULL,2100,3,1705,'BG000000043876','2023-11-21 15:04:33','TINPLATE'),(43877,9,22,'3-1219','2022-03-25',NULL,2100,3,1705,'BG000000043877','2023-11-21 15:04:33','TINPLATE'),(43878,9,22,'3-1219','2022-03-25',NULL,2100,3,1705,'BG000000043878','2023-11-21 15:04:33','TINPLATE'),(43879,9,22,'3-1220','2022-03-25',NULL,2100,3,1705,'BG000000043879','2023-11-21 15:04:33','TINPLATE'),(43880,9,22,'3-1219','2022-03-25',NULL,2100,3,1705,'BG000000043880','2023-11-21 15:04:33','TINPLATE'),(43881,9,22,'3-1219','2022-03-25',NULL,2100,3,1705,'BG000000043881','2023-11-21 15:04:33','TINPLATE'),(43882,9,22,'3-1219','2022-03-25',NULL,2100,3,1705,'BG000000043882','2023-11-21 15:04:33','TINPLATE'),(43883,9,22,'3-1220','2022-03-25',NULL,2100,3,1705,'BG000000043883','2023-11-21 15:04:33','TINPLATE'),(43884,9,22,'3-1221','2022-03-26',NULL,2100,3,1705,'BG000000043884','2023-11-21 15:04:33','TINPLATE'),(43885,9,22,'3-1221','2022-03-26',NULL,2100,3,1705,'BG000000043885','2023-11-21 15:04:33','TINPLATE'),(43886,9,22,'2-1154','2022-03-07',NULL,2100,3,1705,'BG000000043886','2023-11-21 15:04:33','TINPLATE'),(43887,9,22,'2-1140-2','2022-03-07',NULL,2100,3,1705,'BG000000043887','2023-11-21 15:04:33','TINPLATE'),(43888,9,22,'2-1140-2','2022-03-07',NULL,2100,3,1705,'BG000000043888','2023-11-21 15:04:33','TINPLATE'),(43889,9,22,'2-1154','2022-03-07',NULL,2100,3,1705,'BG000000043889','2023-11-21 15:04:33','TINPLATE'),(43890,9,22,'2-1154','2022-03-07',NULL,2100,3,1705,'BG000000043890','2023-11-21 15:04:33','TINPLATE'),(43891,9,22,'2-1154','2022-03-07',NULL,2100,3,1705,'BG000000043891','2023-11-21 15:04:33','TINPLATE'),(43892,9,22,'2-1154','2022-03-07',NULL,2100,3,1705,'BG000000043892','2023-11-21 15:04:33','TINPLATE'),(43893,6,23,'6-1036','2022-07-04',NULL,2100,3,1777,'BG000000043893','2023-11-21 15:04:33','TINPLATE'),(43894,6,23,'6-1035','2022-07-01',NULL,2100,3,1777,'BG000000043894','2023-11-21 15:04:33','TINPLATE'),(43895,6,23,'6-1034','2022-07-01',NULL,2100,3,1777,'BG000000043895','2023-11-21 15:04:33','TINPLATE'),(43896,6,23,'6-1035','2022-07-01',NULL,2100,3,1777,'BG000000043896','2023-11-21 15:04:33','TINPLATE'),(43897,6,23,'6-1035','2022-07-01',NULL,2100,3,1777,'BG000000043897','2023-11-21 15:04:33','TINPLATE'),(43898,6,23,'6-1034','2022-07-01',NULL,2100,3,1777,'BG000000043898','2023-11-21 15:04:33','TINPLATE'),(43899,6,23,'6-1034','2022-07-01',NULL,2100,3,1777,'BG000000043899','2023-11-21 15:04:33','TINPLATE'),(43900,6,23,'6-1035','2022-07-01',NULL,2100,3,1777,'BG000000043900','2023-11-21 15:04:33','TINPLATE'),(43901,6,23,'6-1036','2022-07-04',NULL,2100,3,1777,'BG000000043901','2023-11-21 15:04:33','TINPLATE'),(43902,6,23,'6-1036','2022-07-04',NULL,2100,3,1777,'BG000000043902','2023-11-21 15:04:33','TINPLATE'),(43903,6,23,'6-1033','2022-07-01',NULL,2100,3,1777,'BG000000043903','2023-11-21 15:04:33','TINPLATE'),(43904,6,23,'6-1034','2022-07-01',NULL,2100,3,1777,'BG000000043904','2023-11-21 15:04:33','TINPLATE'),(43905,6,23,'6-1033','2022-07-01',NULL,2100,3,1777,'BG000000043905','2023-11-21 15:04:33','TINPLATE'),(43906,6,23,'6-1034','2022-07-01',NULL,2100,3,1777,'BG000000043906','2023-11-21 15:04:33','TINPLATE'),(43907,6,23,'6-1033','2022-07-01',NULL,2100,3,1777,'BG000000043907','2023-11-21 15:04:33','TINPLATE'),(43908,6,23,'6-1035','2022-07-04',NULL,2100,3,1777,'BG000000043908','2023-11-21 15:04:33','TINPLATE'),(43909,6,23,'6-1035','2022-07-01',NULL,2100,3,1777,'BG000000043909','2023-11-21 15:04:33','TINPLATE'),(43910,6,23,'6-1035','2022-07-01',NULL,2100,3,1777,'BG000000043910','2023-11-21 15:04:33','TINPLATE'),(43911,6,23,'6-1035','2022-07-04',NULL,2100,3,1777,'BG000000043911','2023-11-21 15:04:33','TINPLATE'),(43912,6,23,'6-1034','2022-07-01',NULL,2100,3,1777,'BG000000043912','2023-11-21 15:04:33','TINPLATE'),(43913,6,23,'6-1036','2022-07-04',NULL,2100,3,1777,'BG000000043913','2023-11-21 15:04:33','TINPLATE'),(43914,6,23,'6-1037','2022-07-04',NULL,2100,3,1777,'BG000000043914','2023-11-21 15:04:33','TINPLATE'),(43915,6,23,'6-1035','2022-07-01',NULL,2100,3,1777,'BG000000043915','2023-11-21 15:04:33','TINPLATE'),(43916,6,23,'6-1036','2022-07-01',NULL,2100,3,1777,'BG000000043916','2023-11-21 15:04:33','TINPLATE'),(43917,6,23,'6-1036','2022-07-01',NULL,2100,3,1777,'BG000000043917','2023-11-21 15:04:33','TINPLATE'),(43918,6,23,'6-1037','2022-07-01',NULL,2100,3,1777,'BG000000043918','2023-11-21 15:04:33','TINPLATE'),(43919,6,23,'6-1036','2022-07-01',NULL,2100,3,1777,'BG000000043919','2023-11-21 15:04:33','TINPLATE'),(43920,6,23,'6-1036','2022-07-01',NULL,2100,3,1777,'BG000000043920','2023-11-21 15:04:34','TINPLATE'),(43921,6,23,'6-1037','2022-07-01',NULL,2100,3,1777,'BG000000043921','2023-11-21 15:04:34','TINPLATE'),(43922,6,23,'6-1037','2022-07-01',NULL,2100,3,1777,'BG000000043922','2023-11-21 15:04:34','TINPLATE'),(43923,8,24,'8-0935','2022-08-24',NULL,1700,3,1783,'BG000000043923','2023-11-21 15:04:34','TINPLATE'),(43924,8,24,'8-0935','2022-08-24',NULL,1700,3,1783,'BG000000043924','2023-11-21 15:04:34','TINPLATE'),(43925,8,24,'8-0935-1','2022-08-24',NULL,1700,3,1783,'BG000000043925','2023-11-21 15:04:34','TINPLATE'),(43926,8,24,'6-0924','2022-07-05',NULL,1700,3,1783,'BG000000043926','2023-11-21 15:04:34','TINPLATE'),(43927,8,24,'6-0924','2022-07-05',NULL,1700,3,1783,'BG000000043927','2023-11-21 15:04:34','TINPLATE'),(43928,8,24,'6-0924','2022-07-05',NULL,1700,3,1783,'BG000000043928','2023-11-21 15:04:34','TINPLATE'),(43929,8,24,'6-0924','2022-07-05',NULL,1700,3,1783,'BG000000043929','2023-11-21 15:04:34','TINPLATE'),(43930,8,24,'6-0924','2022-07-05',NULL,1700,3,1783,'BG000000043930','2023-11-21 15:04:34','TINPLATE'),(43931,8,24,'6-0921','2022-07-05',NULL,1700,3,1783,'BG000000043931','2023-11-21 15:04:34','TINPLATE'),(43932,8,24,'8-0935','2022-08-24',NULL,1700,3,1783,'BG000000043932','2023-11-21 15:04:34','TINPLATE'),(43933,8,24,'8-0935','2022-08-24',NULL,1700,3,1783,'BG000000043933','2023-11-21 15:04:34','TINPLATE'),(43934,8,24,'8-0935-1','2022-08-24',NULL,1700,3,1783,'BG000000043934','2023-11-21 15:04:34','TINPLATE'),(43935,8,24,'8-0934','2022-08-24',NULL,1700,3,1783,'BG000000043935','2023-11-21 15:04:34','TINPLATE'),(43936,8,24,'8-0934','2022-08-24',NULL,1700,3,1783,'BG000000043936','2023-11-21 15:04:34','TINPLATE'),(43937,8,24,'8-0934','2022-08-24',NULL,1700,3,1783,'BG000000043937','2023-11-21 15:04:34','TINPLATE'),(43938,8,24,'8-0935-1','2022-08-24',NULL,1700,3,1783,'BG000000043938','2023-11-21 15:04:34','TINPLATE'),(43939,8,24,'8-0935-1','2022-08-24',NULL,1700,3,1783,'BG000000043939','2023-11-21 15:04:34','TINPLATE'),(43940,8,24,'8-0934','2022-08-24',NULL,1700,3,1783,'BG000000043940','2023-11-21 15:04:34','TINPLATE'),(43941,9,25,'2-1154','2022-03-07',NULL,2100,3,1705,'BG000000043941','2023-11-21 15:04:34','TINPLATE'),(43942,9,25,'2-1152','2022-03-07',NULL,2100,3,1705,'BG000000043942','2023-11-21 15:04:34','TINPLATE'),(43943,9,25,'3-1221','2022-03-26',NULL,2100,3,1705,'BG000000043943','2023-11-21 15:04:34','TINPLATE'),(43944,9,25,'3-1221','2022-03-26',NULL,2100,3,1705,'BG000000043944','2023-11-21 15:04:34','TINPLATE'),(43945,9,25,'3-1221','2022-03-26',NULL,2100,3,1705,'BG000000043945','2023-11-21 15:04:34','TINPLATE'),(43946,9,25,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000043946','2023-11-21 15:04:34','TINPLATE'),(43947,9,25,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000043947','2023-11-21 15:04:34','TINPLATE'),(43948,9,25,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000043948','2023-11-21 15:04:34','TINPLATE'),(43949,9,25,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000043949','2023-11-21 15:04:34','TINPLATE'),(43950,9,25,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000043950','2023-11-21 15:04:34','TINPLATE'),(43951,9,25,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000043951','2023-11-21 15:04:34','TINPLATE'),(43952,9,25,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000043952','2023-11-21 15:04:34','TINPLATE'),(43953,9,25,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000043953','2023-11-21 15:04:34','TINPLATE'),(43954,9,25,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000043954','2023-11-21 15:04:34','TINPLATE'),(43955,9,25,'6-0968','2022-06-30',NULL,2100,3,1705,'BG000000043955','2023-11-21 15:04:34','TINPLATE'),(43956,9,25,'6-0968','2022-06-30',NULL,2100,3,1705,'BG000000043956','2023-11-21 15:04:34','TINPLATE'),(43957,9,25,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000043957','2023-11-21 15:04:34','TINPLATE'),(43958,9,25,'6-0968','2022-06-30',NULL,2100,3,1705,'BG000000043958','2023-11-21 15:04:34','TINPLATE'),(43959,9,25,'6-0967','2022-06-30',NULL,2100,3,1705,'BG000000043959','2023-11-21 15:04:34','TINPLATE'),(43960,9,25,'6-0968','2022-06-30',NULL,2100,3,1705,'BG000000043960','2023-11-21 15:04:34','TINPLATE'),(43961,9,25,'6-0967','2022-06-30',NULL,2100,3,1705,'BG000000043961','2023-11-21 15:04:34','TINPLATE'),(43962,9,25,'6-0967','2022-06-30',NULL,2100,3,1705,'BG000000043962','2023-11-21 15:04:34','TINPLATE'),(43963,9,25,'6-0968','2022-06-30',NULL,2100,3,1705,'BG000000043963','2023-11-21 15:04:34','TINPLATE'),(43964,9,25,'6-0967','2022-06-30',NULL,2100,3,1705,'BG000000043964','2023-11-21 15:04:34','TINPLATE'),(43965,9,25,'6-0967','2022-06-30',NULL,2100,3,1705,'BG000000043965','2023-11-21 15:04:34','TINPLATE'),(43966,9,25,'6-0967','2022-06-30',NULL,2100,3,1705,'BG000000043966','2023-11-21 15:04:34','TINPLATE'),(43967,9,25,'6-0967','2022-06-30',NULL,2100,3,1705,'BG000000043967','2023-11-21 15:04:34','TINPLATE'),(43968,9,25,'6-0967','2022-06-30',NULL,2100,3,1705,'BG000000043968','2023-11-21 15:04:34','TINPLATE'),(43969,9,25,'6-0968','2022-06-30',NULL,2100,3,1705,'BG000000043969','2023-11-21 15:04:34','TINPLATE'),(43970,9,25,'6-0967','2022-06-30',NULL,2100,3,1705,'BG000000043970','2023-11-21 15:04:34','TINPLATE'),(43971,9,26,'6-0968','2022-06-30',NULL,2100,3,1705,'BG000000043971','2023-11-21 15:04:34','TINPLATE'),(43972,9,26,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000043972','2023-11-21 15:04:34','TINPLATE'),(43973,9,26,'6-0968','2022-06-30',NULL,2100,3,1705,'BG000000043973','2023-11-21 15:04:34','TINPLATE'),(43974,9,26,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000043974','2023-11-21 15:04:34','TINPLATE'),(43975,9,26,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000043975','2023-11-21 15:04:34','TINPLATE'),(43976,9,26,'6-0968','2022-06-30',NULL,2100,3,1705,'BG000000043976','2023-11-21 15:04:34','TINPLATE'),(43977,9,26,'6-0965','2022-06-30',NULL,2100,3,1705,'BG000000043977','2023-11-21 15:04:34','TINPLATE'),(43978,9,26,'6-0964','2022-06-29',NULL,2100,3,1705,'BG000000043978','2023-11-21 15:04:34','TINPLATE'),(43979,9,26,'6-0965','2022-06-30',NULL,2100,3,1705,'BG000000043979','2023-11-21 15:04:34','TINPLATE'),(43980,9,26,'6-0964','2022-06-30',NULL,2100,3,1705,'BG000000043980','2023-11-21 15:04:34','TINPLATE'),(43981,9,26,'6-0965','2022-06-30',NULL,2100,3,1705,'BG000000043981','2023-11-21 15:04:34','TINPLATE'),(43982,9,26,'6-0964','2022-06-30',NULL,2100,3,1705,'BG000000043982','2023-11-21 15:04:34','TINPLATE'),(43983,9,26,'6-0965','2022-06-30',NULL,2100,3,1705,'BG000000043983','2023-11-21 15:04:34','TINPLATE'),(43984,9,26,'6-0964','2022-06-29',NULL,2100,3,1705,'BG000000043984','2023-11-21 15:04:34','TINPLATE'),(43985,9,26,'6-0965','2022-06-30',NULL,2100,3,1705,'BG000000043985','2023-11-21 15:04:34','TINPLATE'),(43986,9,26,'6-0964','2022-06-29',NULL,2100,3,1705,'BG000000043986','2023-11-21 15:04:34','TINPLATE'),(43987,9,26,'6-0965','2022-06-30',NULL,2100,3,1705,'BG000000043987','2023-11-21 15:04:34','TINPLATE'),(43988,9,26,'6-0965','2022-06-30',NULL,2100,3,1705,'BG000000043988','2023-11-21 15:04:34','TINPLATE'),(43989,9,26,'6-0963','2022-06-29',NULL,2100,3,1705,'BG000000043989','2023-11-21 15:04:34','TINPLATE'),(43990,9,26,'6-0963','2022-06-29',NULL,2100,3,1705,'BG000000043990','2023-11-21 15:04:34','TINPLATE'),(43991,9,26,'6-0963','2022-06-29',NULL,2100,3,1705,'BG000000043991','2023-11-21 15:04:34','TINPLATE'),(43992,9,26,'6-0963','2022-06-29',NULL,2100,3,1705,'BG000000043992','2023-11-21 15:04:34','TINPLATE'),(43993,9,26,'6-0964','2022-06-29',NULL,2100,3,1705,'BG000000043993','2023-11-21 15:04:34','TINPLATE'),(43994,9,26,'6-0963','2022-06-29',NULL,2100,3,1705,'BG000000043994','2023-11-21 15:04:34','TINPLATE'),(43995,9,26,'6-0963','2022-06-29',NULL,2100,3,1705,'BG000000043995','2023-11-21 15:04:34','TINPLATE'),(43996,9,26,'6-0963','2022-06-29',NULL,2100,3,1705,'BG000000043996','2023-11-21 15:04:34','TINPLATE'),(43997,9,26,'6-0963','2022-06-29',NULL,2100,3,1705,'BG000000043997','2023-11-21 15:04:34','TINPLATE'),(43998,9,26,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000043998','2023-11-21 15:04:34','TINPLATE'),(43999,9,26,'6-0964','2022-06-29',NULL,2100,3,1705,'BG000000043999','2023-11-21 15:04:34','TINPLATE'),(44000,9,26,'4-0891','2022-04-24',NULL,2100,3,1705,'BG000000044000','2023-11-21 15:04:34','TINPLATE'),(44001,10,27,'8-0998','2022-08-25',NULL,1800,3,1633,'BG000000044001','2023-11-21 15:04:34','TINPLATE'),(44002,10,27,'8-1007','2022-08-26',NULL,1800,3,1633,'BG000000044002','2023-11-21 15:04:34','TINPLATE'),(44003,10,27,'8-1007','2022-08-26',NULL,1800,3,1633,'BG000000044003','2023-11-21 15:04:34','TINPLATE'),(44004,10,27,'8-1009','2022-08-26',NULL,1800,3,1633,'BG000000044004','2023-11-21 15:04:34','TINPLATE'),(44005,10,27,'8-1009','2022-08-26',NULL,1800,3,1633,'BG000000044005','2023-11-21 15:04:34','TINPLATE'),(44006,10,27,'8-1009','2022-08-26',NULL,1800,3,1633,'BG000000044006','2023-11-21 15:04:34','TINPLATE'),(44007,10,27,'8-1009','2022-08-26',NULL,1800,3,1633,'BG000000044007','2023-11-21 15:04:34','TINPLATE'),(44008,10,27,'8-1009','2022-08-26',NULL,1800,3,1633,'BG000000044008','2023-11-21 15:04:34','TINPLATE'),(44009,10,28,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044009','2023-11-21 15:04:34','TINPLATE'),(44010,10,28,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044010','2023-11-21 15:04:34','TINPLATE'),(44011,10,28,'8-1004','2022-08-26',NULL,1800,3,1633,'BG000000044011','2023-11-21 15:04:34','TINPLATE'),(44012,10,28,'8-1004','2022-08-26',NULL,1800,3,1633,'BG000000044012','2023-11-21 15:04:34','TINPLATE'),(44013,10,28,'8-1004','2022-08-26',NULL,1800,3,1633,'BG000000044013','2023-11-21 15:04:34','TINPLATE'),(44014,10,28,'8-1004','2022-08-26',NULL,1800,3,1633,'BG000000044014','2023-11-21 15:04:34','TINPLATE'),(44015,10,28,'8-1003','2022-08-26',NULL,1800,3,1633,'BG000000044015','2023-11-21 15:04:34','TINPLATE'),(44016,10,28,'8-1003','2022-08-26',NULL,1800,3,1633,'BG000000044016','2023-11-21 15:04:34','TINPLATE'),(44017,10,28,'8-1004','2022-08-26',NULL,1800,3,1633,'BG000000044017','2023-11-21 15:04:34','TINPLATE'),(44018,10,28,'8-1004','2022-08-26',NULL,1800,3,1633,'BG000000044018','2023-11-21 15:04:34','TINPLATE'),(44019,10,28,'8-1003','2022-08-26',NULL,1800,3,1633,'BG000000044019','2023-11-21 15:04:34','TINPLATE'),(44020,10,28,'6-0953','2022-07-07',NULL,1800,3,1633,'BG000000044020','2023-11-21 15:04:34','TINPLATE'),(44021,10,28,'8-1003','2022-08-26',NULL,1800,3,1633,'BG000000044021','2023-11-21 15:04:34','TINPLATE'),(44022,10,28,'8-1003','2022-08-26',NULL,1800,3,1633,'BG000000044022','2023-11-21 15:04:34','TINPLATE'),(44023,10,28,'8-1003','2022-08-26',NULL,1800,3,1633,'BG000000044023','2023-11-21 15:04:35','TINPLATE'),(44024,10,28,'8-1003','2022-08-26',NULL,1800,3,1633,'BG000000044024','2023-11-21 15:04:35','TINPLATE'),(44025,10,28,'8-1003','2022-08-26',NULL,1800,3,1633,'BG000000044025','2023-11-21 15:04:35','TINPLATE'),(44026,10,28,'6-0953','2022-07-04',NULL,1800,3,1633,'BG000000044026','2023-11-21 15:04:35','TINPLATE'),(44027,10,28,'8-1003','2022-08-26',NULL,1800,3,1633,'BG000000044027','2023-11-21 15:04:35','TINPLATE'),(44028,10,28,'8-1001','2022-08-25',NULL,1800,3,1633,'BG000000044028','2023-11-21 15:04:35','TINPLATE'),(44029,10,28,'6-0953','2022-07-07',NULL,1800,3,1633,'BG000000044029','2023-11-21 15:04:35','TINPLATE'),(44030,10,28,'6-0953','2022-07-07',NULL,1800,3,1633,'BG000000044030','2023-11-21 15:04:35','TINPLATE'),(44031,10,28,'6-0953','2022-07-07',NULL,1800,3,1633,'BG000000044031','2023-11-21 15:04:35','TINPLATE'),(44032,10,28,'6-0954','2022-07-07',NULL,1800,3,1633,'BG000000044032','2023-11-21 15:04:35','TINPLATE'),(44033,10,28,'6-0953','2022-07-07',NULL,1800,3,1633,'BG000000044033','2023-11-21 15:04:35','TINPLATE'),(44034,10,28,'6-0953','2022-07-07',NULL,1800,3,1633,'BG000000044034','2023-11-21 15:04:35','TINPLATE'),(44035,10,28,'6-0953','2022-07-07',NULL,1800,3,1633,'BG000000044035','2023-11-21 15:04:35','TINPLATE'),(44036,10,28,'6-0955','2022-07-07',NULL,1800,3,1633,'BG000000044036','2023-11-21 15:04:35','TINPLATE'),(44037,10,28,'6-0952-1','2022-07-07',NULL,1800,3,1633,'BG000000044037','2023-11-21 15:04:35','TINPLATE'),(44038,10,28,'6-0951','2022-07-07',NULL,1800,3,1633,'BG000000044038','2023-11-21 15:04:35','TINPLATE'),(44039,10,28,'6-0953','2022-07-07',NULL,1800,3,1633,'BG000000044039','2023-11-21 15:04:35','TINPLATE'),(44040,10,28,'6-0954','2022-07-07',NULL,1800,3,1633,'BG000000044040','2023-11-21 15:04:35','TINPLATE'),(44041,10,28,'6-0953','2022-07-07',NULL,1800,3,1633,'BG000000044041','2023-11-21 15:04:35','TINPLATE'),(44042,10,28,'6-0951','2022-07-07',NULL,1800,3,1633,'BG000000044042','2023-11-21 15:04:35','TINPLATE'),(44043,10,28,'6-0952-1','2022-07-07',NULL,1800,3,1633,'BG000000044043','2023-11-21 15:04:35','TINPLATE'),(44044,11,29,'Y-0937-2','2022-07-06',NULL,1800,3,1753,'BG000000044044','2023-11-21 15:04:35','TINPLATE'),(44045,11,29,'Y-0645','2023-01-03',NULL,1800,3,1753,'BG000000044045','2023-11-21 15:04:35','TINPLATE'),(44046,11,29,'Y-0647-2','2023-01-03',NULL,1800,3,1753,'BG000000044046','2023-11-21 15:04:35','TINPLATE'),(44047,11,29,'Y-0645','2023-01-03',NULL,1800,3,1753,'BG000000044047','2023-11-21 15:04:35','TINPLATE'),(44048,11,29,'Y-0645','2023-01-03',NULL,1800,3,1753,'BG000000044048','2023-11-21 15:04:35','TINPLATE'),(44049,11,29,'Y-0645','2023-01-03',NULL,1800,3,1753,'BG000000044049','2023-11-21 15:04:35','TINPLATE'),(44050,11,29,'Y-0645','2023-01-03',NULL,1800,3,1753,'BG000000044050','2023-11-21 15:04:35','TINPLATE'),(44051,11,29,'Y-0647-2','2023-01-03',NULL,1800,3,1753,'BG000000044051','2023-11-21 15:04:35','TINPLATE'),(44052,11,29,'Y-0645','2023-01-03',NULL,1800,3,1753,'BG000000044052','2023-11-21 15:04:35','TINPLATE'),(44053,11,29,'Y-0645','2023-01-03',NULL,1800,3,1753,'BG000000044053','2023-11-21 15:04:35','TINPLATE'),(44054,11,29,'Y-0645','2023-01-03',NULL,1800,3,1753,'BG000000044054','2023-11-21 15:04:35','TINPLATE'),(44055,11,29,'Y-0645','2023-01-03',NULL,1800,3,1753,'BG000000044055','2023-11-21 15:04:35','TINPLATE'),(44056,11,29,'Y-0647-2','2023-01-03',NULL,1800,3,1753,'BG000000044056','2023-11-21 15:04:35','TINPLATE'),(44057,6,30,'05-482300','2022-05-13',NULL,2000,3,1692,'BG000000044057','2023-11-21 15:04:35','TINPLATE'),(44058,6,30,'05-482300','2022-05-13',NULL,2000,3,1692,'BG000000044058','2023-11-21 15:04:35','TINPLATE'),(44059,6,30,'05-482300','2022-05-13',NULL,2000,3,1692,'BG000000044059','2023-11-21 15:04:35','TINPLATE'),(44060,6,30,'05-482300','2022-05-13',NULL,2000,3,1692,'BG000000044060','2023-11-21 15:04:35','TINPLATE'),(44061,6,30,'05-482297','2022-05-13',NULL,2000,3,1692,'BG000000044061','2023-11-21 15:04:35','TINPLATE'),(44062,6,30,'05-482297','2022-05-13',NULL,2000,3,1692,'BG000000044062','2023-11-21 15:04:35','TINPLATE'),(44063,6,30,'05-482297','2022-05-13',NULL,2000,3,1692,'BG000000044063','2023-11-21 15:04:35','TINPLATE'),(44064,6,30,'05-482300','2022-05-13',NULL,2000,3,1692,'BG000000044064','2023-11-21 15:04:35','TINPLATE'),(44065,6,30,'05-482301','2022-05-13',NULL,2000,3,1692,'BG000000044065','2023-11-21 15:04:35','TINPLATE'),(44066,6,30,'05-482300','2022-05-13',NULL,2000,3,1692,'BG000000044066','2023-11-21 15:04:35','TINPLATE'),(44067,6,30,'05-482301','2022-05-13',NULL,2000,3,1692,'BG000000044067','2023-11-21 15:04:35','TINPLATE'),(44068,6,30,'05-482301','2022-05-13',NULL,2000,3,1692,'BG000000044068','2023-11-21 15:04:35','TINPLATE'),(44069,6,30,'05-482299','2022-05-13',NULL,2000,3,1692,'BG000000044069','2023-11-21 15:04:35','TINPLATE'),(44070,6,30,'05-482299','2022-05-13',NULL,2000,3,1692,'BG000000044070','2023-11-21 15:04:35','TINPLATE'),(44071,6,30,'05-482299','2022-05-13',NULL,2000,3,1692,'BG000000044071','2023-11-21 15:04:35','TINPLATE'),(44072,6,30,'05-482299','2022-05-13',NULL,2000,3,1692,'BG000000044072','2023-11-21 15:04:35','TINPLATE'),(44073,6,30,'05-482299','2022-05-13',NULL,2000,3,1692,'BG000000044073','2023-11-21 15:04:35','TINPLATE'),(44074,6,30,'05-482301','2022-05-13',NULL,2000,3,1692,'BG000000044074','2023-11-21 15:04:35','TINPLATE'),(44075,6,30,'05-482299','2022-05-13',NULL,2000,3,1692,'BG000000044075','2023-11-21 15:04:35','TINPLATE'),(44076,9,31,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000044076','2023-11-21 15:04:35','TINPLATE'),(44077,9,31,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000044077','2023-11-21 15:04:35','TINPLATE'),(44078,9,31,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000044078','2023-11-21 15:04:35','TINPLATE'),(44079,9,31,'Y-0400','2023-01-03',NULL,2100,3,1705,'BG000000044079','2023-11-21 15:04:35','TINPLATE'),(44080,9,31,'Y-0400','2023-01-03',NULL,2100,3,1705,'BG000000044080','2023-11-21 15:04:35','TINPLATE'),(44081,9,31,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000044081','2023-11-21 15:04:35','TINPLATE'),(44082,9,31,'6-0969','2022-06-30',NULL,2100,3,1705,'BG000000044082','2023-11-21 15:04:35','TINPLATE'),(44083,9,31,'Y-0400','2023-01-03',NULL,2100,3,1705,'BG000000044083','2023-11-21 15:04:35','TINPLATE'),(44084,9,31,'Y-0400','2023-01-03',NULL,2100,3,1705,'BG000000044084','2023-11-21 15:04:35','TINPLATE'),(44085,9,31,'Y-0649','2023-01-03',NULL,2100,3,1705,'BG000000044085','2023-11-21 15:04:35','TINPLATE'),(44086,9,31,'Y-0649','2023-01-03',NULL,2100,3,1705,'BG000000044086','2023-11-21 15:04:35','TINPLATE'),(44087,9,31,'Y-0400','2023-01-03',NULL,2100,3,1705,'BG000000044087','2023-11-21 15:04:35','TINPLATE'),(44088,9,31,'Y-0649','2023-01-03',NULL,2100,3,1705,'BG000000044088','2023-11-21 15:04:35','TINPLATE'),(44089,9,31,'Y-0649','2023-01-03',NULL,2100,3,1705,'BG000000044089','2023-11-21 15:04:35','TINPLATE'),(44090,9,31,'Y-0649','2023-01-03',NULL,2100,3,1705,'BG000000044090','2023-11-21 15:04:35','TINPLATE'),(44091,9,31,'Y-0649','2023-01-03',NULL,2100,3,1705,'BG000000044091','2023-11-21 15:04:35','TINPLATE'),(44092,9,31,'Y-0649','2023-01-03',NULL,2100,3,1705,'BG000000044092','2023-11-21 15:04:35','TINPLATE'),(44093,9,31,'Y-0649','2023-01-03',NULL,2100,3,1705,'BG000000044093','2023-11-21 15:04:35','TINPLATE'),(44094,9,31,'Y-0649','2023-01-03',NULL,2100,3,1705,'BG000000044094','2023-11-21 15:04:35','TINPLATE'),(44095,7,32,'06-482393','2022-06-17',NULL,2000,3,2276,'BG000000044095','2023-11-21 15:04:35','TINPLATE'),(44096,7,32,'06-482196','2022-06-17',NULL,2000,3,2276,'BG000000044096','2023-11-21 15:04:35','TINPLATE'),(44097,7,32,'06-482194','2022-06-17',NULL,2000,3,2276,'BG000000044097','2023-11-21 15:04:35','TINPLATE'),(44098,7,32,'06-482196','2022-06-19',NULL,2000,3,2276,'BG000000044098','2023-11-21 15:04:35','TINPLATE'),(44099,7,32,'06-482383','2022-06-19',NULL,2000,3,2276,'BG000000044099','2023-11-21 15:04:35','TINPLATE'),(44100,7,32,'06-482385','2022-06-19',NULL,2000,3,2276,'BG000000044100','2023-11-21 15:04:35','TINPLATE'),(44101,7,32,'06-482383','2022-06-19',NULL,2000,3,2276,'BG000000044101','2023-11-21 15:04:35','TINPLATE'),(44102,7,32,'06-482383','2022-06-19',NULL,2000,3,2276,'BG000000044102','2023-11-21 15:04:35','TINPLATE'),(44103,7,32,'06-482383','2022-06-19',NULL,2000,3,2276,'BG000000044103','2023-11-21 15:04:35','TINPLATE'),(44104,7,32,'06-482385','2022-06-19',NULL,2000,3,2276,'BG000000044104','2023-11-21 15:04:35','TINPLATE'),(44105,7,32,'06-482385','2022-06-19',NULL,2000,3,2276,'BG000000044105','2023-11-21 15:04:35','TINPLATE'),(44106,10,33,'8-1009','2022-08-26',NULL,1800,3,1633,'BG000000044106','2023-11-21 15:04:35','TINPLATE'),(44107,10,33,'X-0732','2022-11-22',NULL,1800,3,1633,'BG000000044107','2023-11-21 15:04:35','TINPLATE'),(44108,10,33,'X-0732-1','2022-11-22',NULL,1800,3,1633,'BG000000044108','2023-11-21 15:04:35','TINPLATE'),(44109,10,33,'X-0732-1','2022-11-22',NULL,1800,3,1633,'BG000000044109','2023-11-21 15:04:35','TINPLATE'),(44110,10,33,'X-0734','2022-11-22',NULL,1800,3,1633,'BG000000044110','2023-11-21 15:04:35','TINPLATE'),(44111,10,33,'X-0734','2022-11-22',NULL,1800,3,1633,'BG000000044111','2023-11-21 15:04:35','TINPLATE'),(44112,10,33,'X-0734','2022-11-22',NULL,1800,3,1633,'BG000000044112','2023-11-21 15:04:35','TINPLATE'),(44113,10,33,'X-0732-1','2022-11-22',NULL,1800,3,1633,'BG000000044113','2023-11-21 15:04:35','TINPLATE'),(44114,10,33,'X-0733','2022-11-22',NULL,1800,3,1633,'BG000000044114','2023-11-21 15:04:35','TINPLATE'),(44115,10,33,'X-0734','2022-11-22',NULL,1800,3,1633,'BG000000044115','2023-11-21 15:04:35','TINPLATE'),(44116,10,33,'X-0733','2022-11-22',NULL,1800,3,1633,'BG000000044116','2023-11-21 15:04:35','TINPLATE'),(44117,10,33,'X-0733','2022-11-22',NULL,1800,3,1633,'BG000000044117','2023-11-21 15:04:35','TINPLATE'),(44118,10,33,'X-0732-1','2022-11-22',NULL,1800,3,1633,'BG000000044118','2023-11-21 15:04:35','TINPLATE'),(44119,10,33,'X-0734','2022-11-22',NULL,1800,3,1633,'BG000000044119','2023-11-21 15:04:35','TINPLATE'),(44120,10,33,'X-0734','2022-11-22',NULL,1800,3,1633,'BG000000044120','2023-11-21 15:04:35','TINPLATE'),(44121,10,33,'X-0732-1','2022-11-22',NULL,1800,3,1633,'BG000000044121','2023-11-21 15:04:35','TINPLATE'),(44122,10,33,'X-0734','2022-11-22',NULL,1800,3,1633,'BG000000044122','2023-11-21 15:04:35','TINPLATE'),(44123,10,33,'X-0734','2022-11-22',NULL,1800,3,1633,'BG000000044123','2023-11-21 15:04:36','TINPLATE'),(44124,10,33,'X-0733','2022-11-22',NULL,1800,3,1633,'BG000000044124','2023-11-21 15:04:36','TINPLATE'),(44125,10,33,'X-0732-1','2022-11-22',NULL,1800,3,1633,'BG000000044125','2023-11-21 15:04:36','TINPLATE'),(44126,10,33,'X-0734','2022-11-22',NULL,1800,3,1633,'BG000000044126','2023-11-21 15:04:36','TINPLATE'),(44127,10,33,'X-0732','2022-11-22',NULL,1800,3,1633,'BG000000044127','2023-11-21 15:04:36','TINPLATE'),(44128,10,33,'X-0732-1','2022-11-22',NULL,1800,3,1633,'BG000000044128','2023-11-21 15:04:36','TINPLATE'),(44129,8,34,'X-0717','2022-11-22',NULL,1700,3,1783,'BG000000044129','2023-11-21 15:04:36','TINPLATE'),(44130,8,34,'X-0717','2022-11-22',NULL,1700,3,1783,'BG000000044130','2023-11-21 15:04:36','TINPLATE'),(44131,8,34,'X-0717','2022-11-22',NULL,1700,3,1783,'BG000000044131','2023-11-21 15:04:36','TINPLATE'),(44132,8,34,'X-0717','2022-11-22',NULL,1700,3,1783,'BG000000044132','2023-11-21 15:04:36','TINPLATE'),(44133,8,34,'X-0717','2022-11-22',NULL,1700,3,1783,'BG000000044133','2023-11-21 15:04:36','TINPLATE'),(44134,8,34,'X-0717','2022-11-22',NULL,1700,3,1783,'BG000000044134','2023-11-21 15:04:36','TINPLATE'),(44135,8,34,'X-0718','2022-11-22',NULL,1700,3,1783,'BG000000044135','2023-11-21 15:04:36','TINPLATE'),(44136,8,34,'X-0717','2022-11-22',NULL,1700,3,1783,'BG000000044136','2023-11-21 15:04:36','TINPLATE'),(44137,8,34,'X-0717','2022-11-22',NULL,1700,3,1783,'BG000000044137','2023-11-21 15:04:36','TINPLATE'),(44138,8,34,'X-0718','2022-11-22',NULL,1700,3,1783,'BG000000044138','2023-11-21 15:04:36','TINPLATE'),(44139,8,34,'X-0718','2022-11-22',NULL,1700,3,1783,'BG000000044139','2023-11-21 15:04:36','TINPLATE'),(44140,8,34,'8-0993','2022-08-25',NULL,1700,3,1783,'BG000000044140','2023-11-21 15:04:36','TINPLATE'),(44141,8,34,'8-0993','2022-08-25',NULL,1700,3,1783,'BG000000044141','2023-11-21 15:04:36','TINPLATE'),(44142,8,34,'8-0992','2022-08-25',NULL,1700,3,1783,'BG000000044142','2023-11-21 15:04:36','TINPLATE'),(44143,8,34,'X-0718','2022-11-22',NULL,1700,3,1783,'BG000000044143','2023-11-21 15:04:36','TINPLATE'),(44144,8,34,'8-0992','2022-08-25',NULL,1700,3,1783,'BG000000044144','2023-11-21 15:04:36','TINPLATE'),(44145,8,34,'X-0718','2022-11-22',NULL,1700,3,1783,'BG000000044145','2023-11-21 15:04:36','TINPLATE'),(44146,8,34,'X-0718','2022-11-22',NULL,1700,3,1783,'BG000000044146','2023-11-21 15:04:36','TINPLATE'),(44147,8,34,'8-0993','2022-08-25',NULL,1700,3,1783,'BG000000044147','2023-11-21 15:04:36','TINPLATE'),(44148,8,34,'X-0716','2022-11-22',NULL,1700,3,1783,'BG000000044148','2023-11-21 15:04:36','TINPLATE'),(44149,8,34,'8-0993','2022-08-25',NULL,1700,3,1783,'BG000000044149','2023-11-21 15:04:36','TINPLATE'),(44150,8,34,'8-0993','2022-08-25',NULL,1700,3,1783,'BG000000044150','2023-11-21 15:04:36','TINPLATE'),(44151,8,34,'X-0716-1','2022-11-22',NULL,1700,3,1783,'BG000000044151','2023-11-21 15:04:36','TINPLATE'),(44152,8,34,'8-0993','2022-08-25',NULL,1700,3,1783,'BG000000044152','2023-11-21 15:04:36','TINPLATE'),(44153,8,34,'8-0993','2022-08-25',NULL,1700,3,1783,'BG000000044153','2023-11-21 15:04:36','TINPLATE'),(44154,8,34,'8-0993','2022-08-25',NULL,1700,3,1783,'BG000000044154','2023-11-21 15:04:36','TINPLATE'),(44155,8,34,'X-0718','2022-11-22',NULL,1700,3,1783,'BG000000044155','2023-11-21 15:04:36','TINPLATE'),(44156,8,34,'X-0717','2022-11-22',NULL,1700,3,1783,'BG000000044156','2023-11-21 15:04:36','TINPLATE'),(44157,8,34,'X-0716-1','2022-11-22',NULL,1700,3,1783,'BG000000044157','2023-11-21 15:04:36','TINPLATE'),(44158,8,34,'X-0716-1','2022-11-22',NULL,1700,3,1783,'BG000000044158','2023-11-21 15:04:36','TINPLATE'),(44159,8,34,'X-0716','2022-11-22',NULL,1700,3,1783,'BG000000044159','2023-11-21 15:04:36','TINPLATE'),(44160,8,34,'X-0718','2022-11-22',NULL,1700,3,1783,'BG000000044160','2023-11-21 15:04:36','TINPLATE'),(44161,8,34,'X-0718','2022-11-22',NULL,1700,3,1783,'BG000000044161','2023-11-21 15:04:36','TINPLATE'),(44162,8,34,'X-0716','2022-11-22',NULL,1700,3,1783,'BG000000044162','2023-11-21 15:04:36','TINPLATE'),(44163,8,34,'8-0989','2022-08-24',NULL,1700,3,1783,'BG000000044163','2023-11-21 15:04:36','TINPLATE'),(44164,7,35,'2-1114','2022-03-06',NULL,1500,3,1707,'BG000000044164','2023-11-21 15:04:36','TINPLATE'),(44165,7,35,'2-1112-2','2022-03-06',NULL,1500,3,1707,'BG000000044165','2023-11-21 15:04:36','TINPLATE'),(44166,7,35,'2-1112-2','2022-03-06',NULL,1500,3,1707,'BG000000044166','2023-11-21 15:04:36','TINPLATE'),(44167,7,35,'2-1114','2022-03-06',NULL,1500,3,1707,'BG000000044167','2023-11-21 15:04:36','TINPLATE'),(44168,7,35,'2-1114','2022-03-06',NULL,1500,3,1707,'BG000000044168','2023-11-21 15:04:36','TINPLATE'),(44169,7,35,'2-1114','2022-03-06',NULL,1500,3,1707,'BG000000044169','2023-11-21 15:04:36','TINPLATE'),(44170,7,35,'2-1114','2022-03-06',NULL,1500,3,1707,'BG000000044170','2023-11-21 15:04:36','TINPLATE'),(44171,7,35,'2-1114','2022-03-06',NULL,1500,3,1707,'BG000000044171','2023-11-21 15:04:36','TINPLATE'),(44172,7,35,'2-1114','2022-03-06',NULL,1500,3,1707,'BG000000044172','2023-11-21 15:04:36','TINPLATE'),(44173,7,35,'4-0862','2022-04-23',NULL,1500,3,1707,'BG000000044173','2023-11-21 15:04:36','TINPLATE'),(44174,7,35,'4-0864','2022-04-23',NULL,1500,3,1707,'BG000000044174','2023-11-21 15:04:36','TINPLATE'),(44175,7,35,'4-0864','2022-04-23',NULL,1500,3,1707,'BG000000044175','2023-11-21 15:04:36','TINPLATE'),(44176,7,35,'4-0864','2022-04-23',NULL,1500,3,1707,'BG000000044176','2023-11-21 15:04:36','TINPLATE'),(44177,7,35,'4-0864','2022-04-23',NULL,1500,3,1707,'BG000000044177','2023-11-21 15:04:36','TINPLATE'),(44178,7,35,'4-0864','2022-04-23',NULL,1500,3,1707,'BG000000044178','2023-11-21 15:04:36','TINPLATE'),(44179,7,35,'4-0862','2022-04-23',NULL,1500,3,1707,'BG000000044179','2023-11-21 15:04:36','TINPLATE'),(44180,7,35,'4-0863','2022-04-23',NULL,1500,3,1707,'BG000000044180','2023-11-21 15:04:36','TINPLATE'),(44181,7,35,'4-0863','2022-04-23',NULL,1500,3,1707,'BG000000044181','2023-11-21 15:04:36','TINPLATE'),(44182,7,35,'4-0862','2022-04-23',NULL,1500,3,1707,'BG000000044182','2023-11-21 15:04:36','TINPLATE'),(44183,7,35,'4-0862','2022-04-23',NULL,1500,3,1707,'BG000000044183','2023-11-21 15:04:36','TINPLATE'),(44184,7,35,'4-0862','2022-04-23',NULL,1500,3,1707,'BG000000044184','2023-11-21 15:04:36','TINPLATE'),(44185,7,35,'4-0863','2022-04-23',NULL,1500,3,1707,'BG000000044185','2023-11-21 15:04:36','TINPLATE'),(44186,7,35,'4-0863','2022-04-23',NULL,1500,3,1707,'BG000000044186','2023-11-21 15:04:36','TINPLATE'),(44187,7,35,'4-0863','2022-04-23',NULL,1500,3,1707,'BG000000044187','2023-11-21 15:04:36','TINPLATE'),(44188,7,35,'4-0863','2022-04-23',NULL,1500,3,1707,'BG000000044188','2023-11-21 15:04:36','TINPLATE'),(44189,7,35,'4-0862','2022-04-23',NULL,1500,3,1707,'BG000000044189','2023-11-21 15:04:36','TINPLATE'),(44190,7,35,'4-0862','2022-04-23',NULL,1500,3,1707,'BG000000044190','2023-11-21 15:04:36','TINPLATE'),(44191,7,35,'4-0863','2022-04-23',NULL,1500,3,1707,'BG000000044191','2023-11-21 15:04:36','TINPLATE'),(44192,7,35,'4-0863','2022-04-23',NULL,1500,3,1707,'BG000000044192','2023-11-21 15:04:36','TINPLATE'),(44193,7,35,'4-0862','2022-04-23',NULL,1500,3,1707,'BG000000044193','2023-11-21 15:04:36','TINPLATE'),(44194,7,35,'4-0863','2022-04-23',NULL,1500,3,1707,'BG000000044194','2023-11-21 15:04:36','TINPLATE'),(44195,10,36,'8-1007','2022-08-26',NULL,1800,3,1633,'BG000000044195','2023-11-21 15:04:36','TINPLATE'),(44196,10,36,'8-1006','2022-08-26',NULL,1800,3,1633,'BG000000044196','2023-11-21 15:04:36','TINPLATE'),(44197,10,36,'8-1006','2022-08-26',NULL,1800,3,1633,'BG000000044197','2023-11-21 15:04:36','TINPLATE'),(44198,10,36,'8-1001','2022-08-25',NULL,1800,3,1633,'BG000000044198','2023-11-21 15:04:36','TINPLATE'),(44199,10,36,'8-1002','2022-08-25',NULL,1800,3,1633,'BG000000044199','2023-11-21 15:04:36','TINPLATE'),(44200,10,36,'8-1001','2022-08-25',NULL,1800,3,1633,'BG000000044200','2023-11-21 15:04:36','TINPLATE'),(44201,10,36,'8-1007','2022-08-26',NULL,1800,3,1633,'BG000000044201','2023-11-21 15:04:36','TINPLATE'),(44202,10,36,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044202','2023-11-21 15:04:36','TINPLATE'),(44203,10,36,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044203','2023-11-21 15:04:36','TINPLATE'),(44204,10,36,'8-1004','2022-08-26',NULL,1800,3,1633,'BG000000044204','2023-11-21 15:04:36','TINPLATE'),(44205,10,36,'8-1007','2022-08-26',NULL,1800,3,1633,'BG000000044205','2023-11-21 15:04:36','TINPLATE'),(44206,10,36,'8-1007','2022-08-26',NULL,1800,3,1633,'BG000000044206','2023-11-21 15:04:36','TINPLATE'),(44207,10,36,'8-1001','2022-08-25',NULL,1800,3,1633,'BG000000044207','2023-11-21 15:04:36','TINPLATE'),(44208,10,36,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044208','2023-11-21 15:04:36','TINPLATE'),(44209,10,36,'8-1006','2022-08-26',NULL,1800,3,1633,'BG000000044209','2023-11-21 15:04:36','TINPLATE'),(44210,10,36,'8-1002','2022-08-25',NULL,1800,3,1633,'BG000000044210','2023-11-21 15:04:36','TINPLATE'),(44211,10,36,'8-1001','2022-08-25',NULL,1800,3,1633,'BG000000044211','2023-11-21 15:04:36','TINPLATE'),(44212,10,36,'8-1002','2022-08-25',NULL,1800,3,1633,'BG000000044212','2023-11-21 15:04:36','TINPLATE'),(44213,10,36,'8-1002','2022-08-25',NULL,1800,3,1633,'BG000000044213','2023-11-21 15:04:36','TINPLATE'),(44214,10,36,'8-1001','2022-08-25',NULL,1800,3,1633,'BG000000044214','2023-11-21 15:04:36','TINPLATE'),(44215,10,36,'8-1002','2022-08-25',NULL,1800,3,1633,'BG000000044215','2023-11-21 15:04:36','TINPLATE'),(44216,10,36,'8-1001','2022-08-25',NULL,1800,3,1633,'BG000000044216','2023-11-21 15:04:36','TINPLATE'),(44217,10,36,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044217','2023-11-21 15:04:36','TINPLATE'),(44218,10,36,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044218','2023-11-21 15:04:36','TINPLATE'),(44219,10,36,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044219','2023-11-21 15:04:36','TINPLATE'),(44220,10,36,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044220','2023-11-21 15:04:36','TINPLATE'),(44221,10,36,'8-1006','2022-08-26',NULL,1800,3,1633,'BG000000044221','2023-11-21 15:04:36','TINPLATE'),(44222,10,36,'8-1006','2022-08-26',NULL,1800,3,1633,'BG000000044222','2023-11-21 15:04:36','TINPLATE'),(44223,10,36,'8-1007','2022-08-26',NULL,1800,3,1633,'BG000000044223','2023-11-21 15:04:36','TINPLATE'),(44224,10,36,'8-1004','2022-08-26',NULL,1800,3,1633,'BG000000044224','2023-11-21 15:04:36','TINPLATE'),(44225,10,36,'8-1004','2022-08-26',NULL,1800,3,1633,'BG000000044225','2023-11-21 15:04:37','TINPLATE'),(44226,10,36,'8-0999','2022-08-25',NULL,1800,3,1633,'BG000000044226','2023-11-21 15:04:37','TINPLATE'),(44227,10,36,'8-1005','2022-08-26',NULL,1800,3,1633,'BG000000044227','2023-11-21 15:04:37','TINPLATE'),(44228,10,36,'8-1002','2022-08-25',NULL,1800,3,1633,'BG000000044228','2023-11-21 15:04:37','TINPLATE'),(44229,10,36,'8-1001','2022-08-25',NULL,1800,3,1633,'BG000000044229','2023-11-21 15:04:37','TINPLATE'),(44230,10,36,'8-1002','2022-08-25',NULL,1800,3,1633,'BG000000044230','2023-11-21 15:04:37','TINPLATE'),(44231,12,37,'09-484379','2022-09-24',NULL,2000,3,1814,'BG000000044231','2023-11-21 15:04:37','TINPLATE'),(44232,12,37,'09-484389','2022-09-24',NULL,2000,3,1814,'BG000000044232','2023-11-21 15:04:37','TINPLATE'),(44233,12,37,'09-484389','2022-09-24',NULL,2000,3,1814,'BG000000044233','2023-11-21 15:04:37','TINPLATE'),(44234,12,37,'10-484128','2022-10-05',NULL,2000,3,1814,'BG000000044234','2023-11-21 15:04:37','TINPLATE'),(44235,12,37,'10-484128','2022-10-05',NULL,2000,3,1814,'BG000000044235','2023-11-21 15:04:37','TINPLATE'),(44236,12,37,'09-484385','2022-09-24',NULL,2000,3,1814,'BG000000044236','2023-11-21 15:04:37','TINPLATE'),(44237,12,37,'09-484384','2022-09-29',NULL,2000,3,1814,'BG000000044237','2023-11-21 15:04:37','TINPLATE'),(44238,12,37,'09-482305','2022-09-24',NULL,2000,3,1814,'BG000000044238','2023-11-21 15:04:37','TINPLATE'),(44239,12,37,'09-484684','2022-09-24',NULL,2000,3,1814,'BG000000044239','2023-11-21 15:04:37','TINPLATE'),(44240,12,37,'09-484389','2022-10-05',NULL,2000,3,1814,'BG000000044240','2023-11-21 15:04:37','TINPLATE'),(44241,12,37,'10-484128','2022-09-24',NULL,2000,3,1814,'BG000000044241','2023-11-21 15:04:37','TINPLATE'),(44242,12,37,'09-484381','2022-09-24',NULL,2000,3,1814,'BG000000044242','2023-11-21 15:04:37','TINPLATE'),(44243,12,37,'09-484382','2022-09-24',NULL,2000,3,1814,'BG000000044243','2023-11-21 15:04:37','TINPLATE'),(44244,12,37,'09-484379','2022-09-24',NULL,2000,3,1814,'BG000000044244','2023-11-21 15:04:37','TINPLATE'),(44245,12,37,'09-484379','2022-09-24',NULL,2000,3,1814,'BG000000044245','2023-11-21 15:04:37','TINPLATE'),(44246,12,37,'09-484384','2022-09-24',NULL,2000,3,1814,'BG000000044246','2023-11-21 15:04:37','TINPLATE'),(44247,12,37,'09-484387','2022-09-24',NULL,2000,3,1814,'BG000000044247','2023-11-21 15:04:37','TINPLATE'),(44248,12,37,'09-484384','2022-09-24',NULL,2000,3,1814,'BG000000044248','2023-11-21 15:04:37','TINPLATE'),(44249,12,37,'09-484384','2022-09-24',NULL,2000,3,1814,'BG000000044249','2023-11-21 15:04:37','TINPLATE'),(44250,12,37,'09-484385','2022-09-24',NULL,2000,3,1814,'BG000000044250','2023-11-21 15:04:37','TINPLATE'),(44251,12,37,'09-484384','2022-09-24',NULL,2000,3,1814,'BG000000044251','2023-11-21 15:04:37','TINPLATE'),(44252,12,37,'09-484381','2022-09-24',NULL,2000,3,1814,'BG000000044252','2023-11-21 15:04:37','TINPLATE'),(44253,12,37,'09-484381','2022-09-24',NULL,2000,3,1814,'BG000000044253','2023-11-21 15:04:37','TINPLATE'),(44254,12,37,'09-484381','2022-09-24',NULL,2000,3,1814,'BG000000044254','2023-11-21 15:04:37','TINPLATE'),(44255,12,37,'09-484381','2022-09-24',NULL,2000,3,1814,'BG000000044255','2023-11-21 15:04:37','TINPLATE'),(44256,12,37,'09-484381','2022-09-24',NULL,2000,3,1814,'BG000000044256','2023-11-21 15:04:37','TINPLATE'),(44257,12,37,'09-484387','2022-09-24',NULL,2000,3,1814,'BG000000044257','2023-11-21 15:04:37','TINPLATE'),(44258,6,39,'6-1040','2022-07-04',NULL,2100,3,1777,'BG000000044258','2023-11-21 15:04:37','TINPLATE'),(44259,6,39,'Y-0664','2023-01-04',NULL,2100,3,1777,'BG000000044259','2023-11-21 15:04:37','TINPLATE'),(44260,6,39,'Y-0664','2023-01-04',NULL,2100,3,1777,'BG000000044260','2023-11-21 15:04:37','TINPLATE'),(44261,6,39,'Y-0666','2023-01-04',NULL,2100,3,1777,'BG000000044261','2023-11-21 15:04:37','TINPLATE'),(44262,6,39,'6-1040','2023-01-04',NULL,2100,3,1777,'BG000000044262','2023-11-21 15:04:37','TINPLATE'),(44263,6,39,'Y-0665','2023-01-04',NULL,2100,3,1777,'BG000000044263','2023-11-21 15:04:37','TINPLATE'),(44264,6,39,'Y-0665','2023-01-04',NULL,2100,3,1777,'BG000000044264','2023-11-21 15:04:37','TINPLATE'),(44265,6,39,'Y-0664','2023-01-04',NULL,2100,3,1777,'BG000000044265','2023-11-21 15:04:37','TINPLATE'),(44266,6,39,'Y-0665','2023-01-04',NULL,2100,3,1777,'BG000000044266','2023-11-21 15:04:37','TINPLATE'),(44267,6,39,'Y-0664','2023-01-04',NULL,2100,3,1777,'BG000000044267','2023-11-21 15:04:37','TINPLATE'),(44268,6,39,'Y-0668','2023-01-04',NULL,2100,3,1777,'BG000000044268','2023-11-21 15:04:37','TINPLATE'),(44269,6,39,'Y-0666','2023-01-04',NULL,2100,3,1777,'BG000000044269','2023-11-21 15:04:37','TINPLATE'),(44270,6,39,'Y-0667','2023-01-04',NULL,2100,3,1777,'BG000000044270','2023-11-21 15:04:37','TINPLATE'),(44271,6,39,'Y-0667','2023-01-04',NULL,2100,3,1777,'BG000000044271','2023-11-21 15:04:37','TINPLATE'),(44272,6,39,'Y-0667','2023-01-04',NULL,2100,3,1777,'BG000000044272','2023-11-21 15:04:37','TINPLATE'),(44273,6,39,'Y-0667','2023-01-04',NULL,2100,3,1777,'BG000000044273','2023-11-21 15:04:37','TINPLATE'),(44274,6,39,'Y-0666','2023-01-04',NULL,2100,3,1777,'BG000000044274','2023-11-21 15:04:37','TINPLATE'),(44275,7,42,'Y-0638','2022-12-31',NULL,1500,3,1707,'BG000000044275','2023-11-21 15:04:37','TINPLATE'),(44276,7,42,'2-1112-2','2022-03-06',NULL,1500,3,1707,'BG000000044276','2023-11-21 15:04:37','TINPLATE'),(44277,7,42,'Y-0638','2022-12-31',NULL,1500,3,1707,'BG000000044277','2023-11-21 15:04:37','TINPLATE'),(44278,7,42,'Y-0638','2022-12-31',NULL,1500,3,1707,'BG000000044278','2023-11-21 15:04:37','TINPLATE'),(44279,7,42,'Y-0638','2022-12-31',NULL,1500,3,1707,'BG000000044279','2023-11-21 15:04:37','TINPLATE'),(44280,7,42,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000044280','2023-11-21 15:04:37','TINPLATE'),(44281,7,42,'Y-0638','2022-12-31',NULL,1500,3,1707,'BG000000044281','2023-11-21 15:04:37','TINPLATE'),(44282,7,42,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000044282','2023-11-21 15:04:37','TINPLATE'),(44283,7,42,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000044283','2023-11-21 15:04:37','TINPLATE'),(44284,7,42,'6-0931','2022-07-06',NULL,1500,3,1707,'BG000000044284','2023-11-21 15:04:37','TINPLATE'),(44285,7,42,'Y-0639','2023-01-03',NULL,1500,3,1707,'BG000000044285','2023-11-21 15:04:37','TINPLATE'),(44286,7,42,'Y-0639','2023-01-03',NULL,1500,3,1707,'BG000000044286','2023-11-21 15:04:37','TINPLATE'),(44287,7,42,'Y-0638','2023-01-03',NULL,1500,3,1707,'BG000000044287','2023-11-21 15:04:37','TINPLATE'),(44288,7,42,'Y-0639','2023-01-03',NULL,1500,3,1707,'BG000000044288','2023-11-21 15:04:37','TINPLATE'),(44289,6,43,'Y-0666','2023-01-04',NULL,2100,3,1777,'BG000000044289','2023-11-21 15:04:37','TINPLATE'),(44290,6,43,'Y-0666','2023-01-04',NULL,2100,3,1777,'BG000000044290','2023-11-21 15:04:37','TINPLATE'),(44291,6,43,'Y-0665','2023-01-04',NULL,2100,3,1777,'BG000000044291','2023-11-21 15:04:37','TINPLATE'),(44292,6,43,'Y-0666','2023-01-04',NULL,2100,3,1777,'BG000000044292','2023-11-21 15:04:37','TINPLATE'),(44293,6,43,'Y-0666','2023-01-04',NULL,2100,3,1777,'BG000000044293','2023-11-21 15:04:37','TINPLATE'),(44294,6,43,'Y-0666','2023-01-04',NULL,2100,3,1777,'BG000000044294','2023-11-21 15:04:37','TINPLATE'),(44295,6,43,'Y-0665','2023-01-04',NULL,2100,3,1777,'BG000000044295','2023-11-21 15:04:37','TINPLATE'),(44296,6,43,'6-1040','2023-01-04',NULL,2100,3,1777,'BG000000044296','2023-11-21 15:04:37','TINPLATE'),(44297,6,43,'Y-0664','2023-01-04',NULL,2100,3,1777,'BG000000044297','2023-11-21 15:04:37','TINPLATE'),(44298,6,43,'Y-0664','2023-01-04',NULL,2100,3,1777,'BG000000044298','2023-11-21 15:04:37','TINPLATE'),(44299,6,43,'Y-0665','2023-01-04',NULL,2100,3,1777,'BG000000044299','2023-11-21 15:04:37','TINPLATE'),(44300,6,43,'Y-0664','2023-01-04',NULL,2100,3,1777,'BG000000044300','2023-11-21 15:04:37','TINPLATE'),(44301,6,43,'Y-0665','2023-01-04',NULL,2100,3,1777,'BG000000044301','2023-11-21 15:04:37','TINPLATE'),(44302,6,43,'Y-0664','2023-01-04',NULL,2100,3,1777,'BG000000044302','2023-11-21 15:04:37','TINPLATE'),(44303,6,43,'Y-0668-1','2023-01-04',NULL,2100,3,1777,'BG000000044303','2023-11-21 15:04:37','TINPLATE'),(44304,6,43,'Y-0668-1','2023-01-04',NULL,2100,3,1777,'BG000000044304','2023-11-21 15:04:37','TINPLATE'),(44305,6,43,'Y-0667','2023-01-04',NULL,2100,3,1777,'BG000000044305','2023-11-21 15:04:37','TINPLATE'),(44306,6,43,'Y-0668-1','2023-01-04',NULL,2100,3,1777,'BG000000044306','2023-11-21 15:04:37','TINPLATE'),(44307,6,43,'Y-0669','2023-01-04',NULL,2100,3,1777,'BG000000044307','2023-11-21 15:04:37','TINPLATE'),(44308,6,43,'Y-0668-1','2023-01-04',NULL,2100,3,1777,'BG000000044308','2023-11-21 15:04:37','TINPLATE'),(44309,6,43,'Y-0669','2023-01-04',NULL,2100,3,1777,'BG000000044309','2023-11-21 15:04:37','TINPLATE'),(44310,6,43,'Y-0669','2023-01-04',NULL,2100,3,1777,'BG000000044310','2023-11-21 15:04:37','TINPLATE'),(44311,6,43,'Y-0669','2023-01-04',NULL,2100,3,1777,'BG000000044311','2023-11-21 15:04:37','TINPLATE'),(44312,6,43,'Y-0669','2023-01-04',NULL,2100,3,1777,'BG000000044312','2023-11-21 15:04:37','TINPLATE'),(44313,6,43,'Y-0669','2023-01-04',NULL,2100,3,1777,'BG000000044313','2023-11-21 15:04:37','TINPLATE'),(44314,6,43,'Y-0668','2023-01-04',NULL,2100,3,1777,'BG000000044314','2023-11-21 15:04:37','TINPLATE'),(44315,6,43,'Y-0666','2023-01-04',NULL,2100,3,1777,'BG000000044315','2023-11-21 15:04:37','TINPLATE'),(44316,6,43,'Y-0667','2023-01-04',NULL,2100,3,1777,'BG000000044316','2023-11-21 15:04:37','TINPLATE'),(44317,6,43,'Y-0667','2023-01-04',NULL,2100,3,1777,'BG000000044317','2023-11-21 15:04:37','TINPLATE'),(44318,6,43,'Y-0667','2023-01-04',NULL,2100,3,1777,'BG000000044318','2023-11-21 15:04:37','TINPLATE'),(44319,9,44,'07-482341','2022-07-27',NULL,2000,3,1624,'BG000000044319','2023-11-21 15:04:37','TINPLATE'),(44320,9,44,'07-482341','2022-07-27',NULL,2000,3,1624,'BG000000044320','2023-11-21 15:04:37','TINPLATE'),(44321,9,44,'07-482341','2022-07-27',NULL,2000,3,1624,'BG000000044321','2023-11-21 15:04:37','TINPLATE'),(44322,9,44,'05-482294','2022-05-13',NULL,2000,3,1624,'BG000000044322','2023-11-21 15:04:37','TINPLATE'),(44323,9,44,'05-482294','2022-05-13',NULL,2000,3,1624,'BG000000044323','2023-11-21 15:04:37','TINPLATE'),(44324,9,44,'07-482341','2022-07-27',NULL,2000,3,1624,'BG000000044324','2023-11-21 15:04:37','TINPLATE'),(44325,9,44,'05-482292','2022-05-13',NULL,2000,3,1624,'BG000000044325','2023-11-21 15:04:37','TINPLATE'),(44326,9,44,'05-482292','2022-05-13',NULL,2000,3,1624,'BG000000044326','2023-11-21 15:04:37','TINPLATE'),(44327,9,44,'05-482293','2022-05-13',NULL,2000,3,1624,'BG000000044327','2023-11-21 15:04:37','TINPLATE'),(44328,9,44,'05-482293','2022-05-13',NULL,2000,3,1624,'BG000000044328','2023-11-21 15:04:38','TINPLATE'),(44329,9,44,'05-482293','2022-05-13',NULL,2000,3,1624,'BG000000044329','2023-11-21 15:04:38','TINPLATE'),(44330,9,44,'05-482293','2022-05-13',NULL,2000,3,1624,'BG000000044330','2023-11-21 15:04:38','TINPLATE'),(44331,9,44,'05-482292','2022-05-13',NULL,2000,3,1624,'BG000000044331','2023-11-21 15:04:38','TINPLATE'),(44332,9,44,'05-482292','2022-05-13',NULL,2000,3,1624,'BG000000044332','2023-11-21 15:04:38','TINPLATE'),(44333,9,44,'05-482292','2022-05-13',NULL,2000,3,1624,'BG000000044333','2023-11-21 15:04:38','TINPLATE'),(44334,9,44,'05-482293','2022-05-13',NULL,2000,3,1624,'BG000000044334','2023-11-21 15:04:38','TINPLATE'),(44335,9,44,'05-482292','2022-05-13',NULL,2000,3,1624,'BG000000044335','2023-11-21 15:04:38','TINPLATE'),(44336,9,44,'05-482292','2022-05-13',NULL,2000,3,1624,'BG000000044336','2023-11-21 15:04:38','TINPLATE'),(44337,9,44,'05-482292','2022-05-13',NULL,2000,3,1624,'BG000000044337','2023-11-21 15:04:38','TINPLATE'),(44338,9,44,'05-482292','2022-05-13',NULL,2000,3,1624,'BG000000044338','2023-11-21 15:04:38','TINPLATE'),(44339,9,44,'05-482293','2022-05-13',NULL,2000,3,1624,'BG000000044339','2023-11-21 15:04:38','TINPLATE'),(44340,12,45,'09-482147','2022-09-16',NULL,2000,3,1814,'BG000000044340','2023-11-21 15:04:38','TINPLATE'),(44341,12,45,'09-482322','2022-09-23',NULL,2000,3,1814,'BG000000044341','2023-11-21 15:04:38','TINPLATE'),(44342,12,45,'09-482322','2022-09-23',NULL,2000,3,1814,'BG000000044342','2023-11-21 15:04:38','TINPLATE'),(44343,12,45,'09-482149','2022-09-16',NULL,2000,3,1814,'BG000000044343','2023-11-21 15:04:38','TINPLATE'),(44344,12,45,'09-482151','2022-09-16',NULL,2000,3,1814,'BG000000044344','2023-11-21 15:04:38','TINPLATE'),(44345,12,45,'09-482125','2022-09-13',NULL,2000,3,1814,'BG000000044345','2023-11-21 15:04:38','TINPLATE'),(44346,12,45,'09-482125','2022-09-13',NULL,2000,3,1814,'BG000000044346','2023-11-21 15:04:38','TINPLATE'),(44347,12,45,'09-482125','2022-09-13',NULL,2000,3,1814,'BG000000044347','2023-11-21 15:04:38','TINPLATE'),(44348,12,45,'09-482125','2022-09-13',NULL,2000,3,1814,'BG000000044348','2023-11-21 15:04:38','TINPLATE'),(44349,12,45,'09-482125','2022-09-13',NULL,2000,3,1814,'BG000000044349','2023-11-21 15:04:38','TINPLATE'),(44350,12,45,'09-482147','2022-09-16',NULL,2000,3,1814,'BG000000044350','2023-11-21 15:04:38','TINPLATE'),(44351,12,45,'09-482147','2022-09-16',NULL,2000,3,1814,'BG000000044351','2023-11-21 15:04:38','TINPLATE'),(44352,12,45,'09-482147','2022-09-16',NULL,2000,3,1814,'BG000000044352','2023-11-21 15:04:38','TINPLATE'),(44353,12,45,'09-482147','2022-09-16',NULL,2000,3,1814,'BG000000044353','2023-11-21 15:04:38','TINPLATE'),(44354,12,46,'09-484385','2022-09-24',NULL,2000,3,1814,'BG000000044354','2023-11-21 15:04:38','TINPLATE'),(44355,12,46,'09-484382','2022-09-24',NULL,2000,3,1814,'BG000000044355','2023-11-21 15:04:38','TINPLATE'),(44356,12,46,'09-482319','2022-09-29',NULL,2000,3,1814,'BG000000044356','2023-11-21 15:04:38','TINPLATE'),(44357,12,46,'09-484382','2022-09-24',NULL,2000,3,1814,'BG000000044357','2023-11-21 15:04:38','TINPLATE'),(44358,12,46,'09-482305','2022-09-29',NULL,2000,3,1814,'BG000000044358','2023-11-21 15:04:38','TINPLATE'),(44359,12,46,'09-484387','2022-09-24',NULL,2000,3,1814,'BG000000044359','2023-11-21 15:04:38','TINPLATE'),(44360,12,46,'09-484387','2022-09-24',NULL,2000,3,1814,'BG000000044360','2023-11-21 15:04:38','TINPLATE'),(44361,12,46,'09-484387','2022-09-24',NULL,2000,3,1814,'BG000000044361','2023-11-21 15:04:38','TINPLATE'),(44362,12,46,'09-484385','2022-09-24',NULL,2000,3,1814,'BG000000044362','2023-11-21 15:04:38','TINPLATE'),(44363,12,46,'09-484389','2022-09-24',NULL,2000,3,1814,'BG000000044363','2023-11-21 15:04:38','TINPLATE'),(44364,12,46,'09-484385','2022-09-24',NULL,2000,3,1814,'BG000000044364','2023-11-21 15:04:38','TINPLATE'),(44365,12,46,'09-484389','2022-09-24',NULL,2000,3,1814,'BG000000044365','2023-11-21 15:04:38','TINPLATE'),(44366,12,46,'09-484381','2022-09-24',NULL,2000,3,1814,'BG000000044366','2023-11-21 15:04:38','TINPLATE'),(44367,12,46,'09-484381','2022-09-24',NULL,2000,3,1814,'BG000000044367','2023-11-21 15:04:38','TINPLATE'),(44368,12,46,'09-484379','2022-09-24',NULL,2000,3,1814,'BG000000044368','2023-11-21 15:04:38','TINPLATE'),(44369,12,46,'09-484379','2022-09-24',NULL,2000,3,1814,'BG000000044369','2023-11-21 15:04:38','TINPLATE'),(44370,12,46,'09-482146','2022-09-16',NULL,2000,3,1814,'BG000000044370','2023-11-21 15:04:38','TINPLATE'),(44371,12,46,'09-482146','2022-09-16',NULL,2000,3,1814,'BG000000044371','2023-11-21 15:04:38','TINPLATE'),(44372,12,46,'09-482146','2022-09-16',NULL,2000,3,1814,'BG000000044372','2023-11-21 15:04:38','TINPLATE'),(44373,12,46,'09-482146','2022-09-16',NULL,2000,3,1814,'BG000000044373','2023-11-21 15:04:38','TINPLATE'),(44374,12,46,'09-482146','2022-09-16',NULL,2000,3,1814,'BG000000044374','2023-11-21 15:04:38','TINPLATE'),(44375,12,46,'09-482147','2022-09-16',NULL,2000,3,1814,'BG000000044375','2023-11-21 15:04:38','TINPLATE'),(44376,12,46,'09-482146','2022-09-16',NULL,2000,3,1814,'BG000000044376','2023-11-21 15:04:38','TINPLATE'),(44377,12,46,'09-482146','2022-09-16',NULL,2000,3,1814,'BG000000044377','2023-11-21 15:04:38','TINPLATE'),(44378,7,47,'6-0930','2022-07-06',NULL,1500,3,1707,'BG000000044378','2023-11-21 15:04:38','TINPLATE'),(44379,7,47,'6-0930','2022-07-06',NULL,1500,3,1707,'BG000000044379','2023-11-21 15:04:38','TINPLATE'),(44380,7,47,'6-0929','2022-07-06',NULL,1500,3,1707,'BG000000044380','2023-11-21 15:04:38','TINPLATE'),(44381,7,47,'6-0929','2022-07-06',NULL,1500,3,1707,'BG000000044381','2023-11-21 15:04:38','TINPLATE'),(44382,7,47,'6-0930','2022-07-06',NULL,1500,3,1707,'BG000000044382','2023-11-21 15:04:38','TINPLATE'),(44383,7,47,'6-0930','2022-07-06',NULL,1500,3,1707,'BG000000044383','2023-11-21 15:04:38','TINPLATE'),(44384,7,47,'6-0930','2022-07-06',NULL,1500,3,1707,'BG000000044384','2023-11-21 15:04:38','TINPLATE'),(44385,7,47,'6-0929','2022-07-06',NULL,1500,3,1707,'BG000000044385','2023-11-21 15:04:38','TINPLATE'),(44386,7,47,'6-0929','2022-07-06',NULL,1500,3,1707,'BG000000044386','2023-11-21 15:04:38','TINPLATE'),(44387,7,47,'6-0929','2022-07-06',NULL,1500,3,1707,'BG000000044387','2023-11-21 15:04:38','TINPLATE'),(44388,7,47,'6-0929','2022-07-06',NULL,1500,3,1707,'BG000000044388','2023-11-21 15:04:38','TINPLATE'),(44389,7,47,'6-0929','2022-07-06',NULL,1500,3,1707,'BG000000044389','2023-11-21 15:04:38','TINPLATE'),(44390,7,47,'6-0926-1','2022-07-06',NULL,1500,3,1707,'BG000000044390','2023-11-21 15:04:38','TINPLATE'),(44391,7,47,'6-0928','2022-07-06',NULL,1500,3,1707,'BG000000044391','2023-11-21 15:04:38','TINPLATE'),(44392,7,47,'6-0928','2022-07-06',NULL,1500,3,1707,'BG000000044392','2023-11-21 15:04:38','TINPLATE'),(44393,7,47,'6-0927','2022-07-06',NULL,1500,3,1707,'BG000000044393','2023-11-21 15:04:38','TINPLATE'),(44394,7,47,'6-0926-1','2022-07-06',NULL,1500,3,1707,'BG000000044394','2023-11-21 15:04:38','TINPLATE'),(44395,7,47,'6-0926-1','2022-07-06',NULL,1500,3,1707,'BG000000044395','2023-11-21 15:04:38','TINPLATE'),(44396,7,47,'6-0928','2022-07-06',NULL,1500,3,1707,'BG000000044396','2023-11-21 15:04:38','TINPLATE'),(44397,7,47,'6-0929','2022-07-06',NULL,1500,3,1707,'BG000000044397','2023-11-21 15:04:38','TINPLATE'),(44398,7,47,'6-0928','2022-07-06',NULL,1500,3,1707,'BG000000044398','2023-11-21 15:04:38','TINPLATE'),(44399,7,47,'6-0927','2022-07-06',NULL,1500,3,1707,'BG000000044399','2023-11-21 15:04:38','TINPLATE'),(44400,7,47,'6-0927','2022-07-06',NULL,1500,3,1707,'BG000000044400','2023-11-21 15:04:38','TINPLATE'),(44401,7,47,'6-0927','2022-07-06',NULL,1500,3,1707,'BG000000044401','2023-11-21 15:04:38','TINPLATE'),(44402,7,47,'6-0928','2022-07-06',NULL,1500,3,1707,'BG000000044402','2023-11-21 15:04:38','TINPLATE'),(44403,7,47,'6-0926-1','2022-07-06',NULL,1500,3,1707,'BG000000044403','2023-11-21 15:04:38','TINPLATE'),(44404,7,47,'6-0928','2022-07-06',NULL,1500,3,1707,'BG000000044404','2023-11-21 15:04:38','TINPLATE'),(44405,7,47,'6-0928','2022-07-06',NULL,1500,3,1707,'BG000000044405','2023-11-21 15:04:38','TINPLATE'),(44406,7,47,'6-0928','2022-07-06',NULL,1500,3,1707,'BG000000044406','2023-11-21 15:04:38','TINPLATE'),(44407,7,47,'6-0927','2022-07-06',NULL,1500,3,1707,'BG000000044407','2023-11-21 15:04:38','TINPLATE'),(44408,7,47,'6-0928','2022-07-06',NULL,1500,3,1707,'BG000000044408','2023-11-21 15:04:38','TINPLATE'),(44409,7,47,'6-0927','2022-07-06',NULL,1500,3,1707,'BG000000044409','2023-11-21 15:04:38','TINPLATE'),(44410,7,47,'6-0927','2022-07-06',NULL,1500,3,1707,'BG000000044410','2023-11-21 15:04:38','TINPLATE'),(44411,7,47,'6-0927','2022-07-06',NULL,1500,3,1707,'BG000000044411','2023-11-21 15:04:38','TINPLATE'),(44412,7,47,'6-0927','2022-07-06',NULL,1500,3,1707,'BG000000044412','2023-11-21 15:04:38','TINPLATE'),(44413,6,48,'6-1030','2022-07-01',NULL,2100,3,1777,'BG000000044413','2023-11-21 15:04:38','TINPLATE'),(44414,6,48,'6-1030','2022-07-01',NULL,2100,3,1777,'BG000000044414','2023-11-21 15:04:38','TINPLATE'),(44415,6,48,'6-1031','2022-07-01',NULL,2100,3,1777,'BG000000044415','2023-11-21 15:04:38','TINPLATE'),(44416,6,48,'6-1031','2022-07-01',NULL,2100,3,1777,'BG000000044416','2023-11-21 15:04:38','TINPLATE'),(44417,6,48,'6-1031','2022-07-01',NULL,2100,3,1777,'BG000000044417','2023-11-21 15:04:38','TINPLATE'),(44418,6,48,'6-1031','2022-04-25',NULL,2100,3,1777,'BG000000044418','2023-11-21 15:04:38','TINPLATE'),(44419,6,48,'4-0906','2022-07-01',NULL,2100,3,1777,'BG000000044419','2023-11-21 15:04:38','TINPLATE'),(44420,6,48,'6-1032','2022-07-01',NULL,2100,3,1777,'BG000000044420','2023-11-21 15:04:38','TINPLATE'),(44421,6,48,'6-1031','2022-07-01',NULL,2100,3,1777,'BG000000044421','2023-11-21 15:04:38','TINPLATE'),(44422,6,48,'6-1031','2022-07-01',NULL,2100,3,1777,'BG000000044422','2023-11-21 15:04:38','TINPLATE'),(44423,6,48,'6-1030','2022-07-01',NULL,2100,3,1777,'BG000000044423','2023-11-21 15:04:38','TINPLATE'),(44424,6,48,'4-0906','2022-04-25',NULL,2100,3,1777,'BG000000044424','2023-11-21 15:04:38','TINPLATE'),(44425,6,48,'4-0906','2022-04-25',NULL,2100,3,1777,'BG000000044425','2023-11-21 15:04:38','TINPLATE'),(44426,6,48,'4-0906','2022-04-25',NULL,2100,3,1777,'BG000000044426','2023-11-21 15:04:38','TINPLATE'),(44427,6,48,'6-1030','2022-07-01',NULL,2100,3,1777,'BG000000044427','2023-11-21 15:04:38','TINPLATE'),(44428,6,48,'4-0906','2022-04-25',NULL,2100,3,1777,'BG000000044428','2023-11-21 15:04:38','TINPLATE'),(44429,6,48,'6-1033','2022-07-01',NULL,2100,3,1777,'BG000000044429','2023-11-21 15:04:38','TINPLATE'),(44430,6,48,'6-1032','2022-07-01',NULL,2100,3,1777,'BG000000044430','2023-11-21 15:04:39','TINPLATE'),(44431,6,48,'6-1033','2022-07-01',NULL,2100,3,1777,'BG000000044431','2023-11-21 15:04:39','TINPLATE'),(44432,6,48,'6-1031','2022-07-01',NULL,2100,3,1777,'BG000000044432','2023-11-21 15:04:39','TINPLATE'),(44433,6,48,'6-1030','2022-07-01',NULL,2100,3,1777,'BG000000044433','2023-11-21 15:04:39','TINPLATE'),(44434,6,48,'6-1030','2022-07-01',NULL,2100,3,1777,'BG000000044434','2023-11-21 15:04:39','TINPLATE'),(44435,6,48,'6-1030','2022-07-01',NULL,2100,3,1777,'BG000000044435','2023-11-21 15:04:39','TINPLATE'),(44436,6,48,'6-1032','2022-07-01',NULL,2100,3,1777,'BG000000044436','2023-11-21 15:04:39','TINPLATE'),(44437,6,48,'6-1032','2022-07-01',NULL,2100,3,1777,'BG000000044437','2023-11-21 15:04:39','TINPLATE'),(44438,6,48,'6-1033','2022-07-01',NULL,2100,3,1777,'BG000000044438','2023-11-21 15:04:39','TINPLATE'),(44439,6,48,'6-1031','2022-07-01',NULL,2100,3,1777,'BG000000044439','2023-11-21 15:04:39','TINPLATE'),(44440,6,48,'6-1033','2022-07-01',NULL,2100,3,1777,'BG000000044440','2023-11-21 15:04:39','TINPLATE'),(44441,6,48,'6-1032','2022-07-01',NULL,2100,3,1777,'BG000000044441','2023-11-21 15:04:39','TINPLATE'),(44442,6,48,'6-1032','2022-07-01',NULL,2100,3,1777,'BG000000044442','2023-11-21 15:04:39','TINPLATE'),(44443,8,49,'8-0936','2022-08-24',NULL,1700,3,1783,'BG000000044443','2023-11-21 15:04:39','TINPLATE'),(44444,8,49,'8-0936','2022-08-24',NULL,1700,3,1783,'BG000000044444','2023-11-21 15:04:39','TINPLATE'),(44445,8,49,'8-0934','2022-08-24',NULL,1700,3,1783,'BG000000044445','2023-11-21 15:04:39','TINPLATE'),(44446,8,49,'8-0934','2022-08-24',NULL,1700,3,1783,'BG000000044446','2023-11-21 15:04:39','TINPLATE'),(44447,8,49,'8-0938','2022-08-24',NULL,1700,3,1783,'BG000000044447','2023-11-21 15:04:39','TINPLATE'),(44448,8,49,'8-0936','2022-08-24',NULL,1700,3,1783,'BG000000044448','2023-11-21 15:04:39','TINPLATE'),(44449,8,49,'8-0936','2022-08-24',NULL,1700,3,1783,'BG000000044449','2023-11-21 15:04:39','TINPLATE'),(44450,8,49,'8-0936','2022-08-24',NULL,1700,3,1783,'BG000000044450','2023-11-21 15:04:39','TINPLATE'),(44451,8,49,'8-0934','2022-08-24',NULL,1700,3,1783,'BG000000044451','2023-11-21 15:04:39','TINPLATE'),(44452,8,49,'8-0936','2022-08-24',NULL,1700,3,1783,'BG000000044452','2023-11-21 15:04:39','TINPLATE'),(44453,8,49,'8-0934','2022-08-24',NULL,1700,3,1783,'BG000000044453','2023-11-21 15:04:39','TINPLATE'),(44454,8,49,'8-0934','2022-08-24',NULL,1700,3,1783,'BG000000044454','2023-11-21 15:04:39','TINPLATE'),(44455,8,49,'8-0938','2022-08-24',NULL,1700,3,1783,'BG000000044455','2023-11-21 15:04:39','TINPLATE'),(44456,8,49,'8-0936','2022-08-24',NULL,1700,3,1783,'BG000000044456','2023-11-21 15:04:39','TINPLATE'),(44457,8,49,'8-0938','2022-08-24',NULL,1700,3,1783,'BG000000044457','2023-11-21 15:04:39','TINPLATE'),(44458,8,49,'8-0988','2022-08-25',NULL,1700,3,1783,'BG000000044458','2023-11-21 15:04:39','TINPLATE'),(44459,8,49,'8-0988-1','2022-08-25',NULL,1700,3,1783,'BG000000044459','2023-11-21 15:04:39','TINPLATE'),(44460,8,49,'8-0991','2022-08-25',NULL,1700,3,1783,'BG000000044460','2023-11-21 15:04:39','TINPLATE'),(44461,8,49,'8-0991','2022-08-25',NULL,1700,3,1783,'BG000000044461','2023-11-21 15:04:39','TINPLATE'),(44462,8,49,'8-0988','2022-08-25',NULL,1700,3,1783,'BG000000044462','2023-11-21 15:04:39','TINPLATE'),(44463,8,49,'8-0988','2022-08-25',NULL,1700,3,1783,'BG000000044463','2023-11-21 15:04:39','TINPLATE'),(44464,8,49,'8-0991','2022-08-25',NULL,1700,3,1783,'BG000000044464','2023-11-21 15:04:39','TINPLATE'),(44465,8,49,'8-0988','2022-08-25',NULL,1700,3,1783,'BG000000044465','2023-11-21 15:04:39','TINPLATE'),(44466,8,49,'8-0988','2022-08-25',NULL,1700,3,1783,'BG000000044466','2023-11-21 15:04:39','TINPLATE'),(44467,8,49,'8-0990','2022-08-25',NULL,1700,3,1783,'BG000000044467','2023-11-21 15:04:39','TINPLATE'),(44468,8,49,'8-0990','2022-08-25',NULL,1700,3,1783,'BG000000044468','2023-11-21 15:04:39','TINPLATE'),(44469,8,49,'8-0990','2022-08-25',NULL,1700,3,1783,'BG000000044469','2023-11-21 15:04:39','TINPLATE'),(44470,8,49,'8-0992','2022-08-25',NULL,1700,3,1783,'BG000000044470','2023-11-21 15:04:39','TINPLATE'),(44471,8,49,'8-0991','2022-08-25',NULL,1700,3,1783,'BG000000044471','2023-11-21 15:04:39','TINPLATE'),(44472,8,49,'8-0991','2022-08-25',NULL,1700,3,1783,'BG000000044472','2023-11-21 15:04:39','TINPLATE'),(44473,8,49,'8-0991','2022-08-25',NULL,1700,3,1783,'BG000000044473','2023-11-21 15:04:39','TINPLATE'),(44474,8,49,'8-0991','2022-08-25',NULL,1700,3,1783,'BG000000044474','2023-11-21 15:04:39','TINPLATE'),(44475,13,50,'01-484731','2019-02-05',NULL,1910,3,1790,'BG000000044475','2023-11-21 15:04:39','TINPLATE'),(44476,13,50,'01-484731','2019-01-31',NULL,2000,3,1874,'BG000000044476','2023-11-21 15:04:39','TINPLATE'),(44477,13,50,'01-484731','2019-01-31',NULL,2000,3,1874,'BG000000044477','2023-11-21 15:04:39','TINPLATE'),(44478,13,50,'01-484731','2019-01-31',NULL,2000,3,1874,'BG000000044478','2023-11-21 15:04:39','TINPLATE'),(44479,13,50,'01-484731','2019-01-31',NULL,2000,3,1874,'BG000000044479','2023-11-21 15:04:39','TINPLATE'),(44480,14,50,'RETURN-001','2021-06-01',NULL,1510,3,1510,'BG000000044480','2023-11-21 15:04:39','TINPLATE'),(44481,14,50,'RETURN-002','2021-06-01',NULL,490,3,490,'BG000000044481','2023-11-21 15:04:39','TINPLATE'),(44482,14,50,'RETURN-003','2021-06-01',NULL,635,3,635,'BG000000044482','2023-11-21 15:04:39','TINPLATE'),(44483,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044483','2023-11-21 15:04:39','COATING'),(44484,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044484','2023-11-21 15:04:39','COATING'),(44485,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044485','2023-11-21 15:04:39','COATING'),(44486,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044486','2023-11-21 15:04:39','COATING'),(44487,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044487','2023-11-21 15:04:39','COATING'),(44488,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044488','2023-11-21 15:04:39','COATING'),(44489,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044489','2023-11-21 15:04:39','COATING'),(44490,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044490','2023-11-21 15:04:39','COATING'),(44491,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044491','2023-11-21 15:04:39','COATING'),(44492,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044492','2023-11-21 15:04:39','COATING'),(44493,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044493','2023-11-21 15:04:39','COATING'),(44494,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044494','2023-11-21 15:04:39','COATING'),(44495,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044495','2023-11-21 15:04:39','COATING'),(44496,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044496','2023-11-21 15:04:39','COATING'),(44497,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044497','2023-11-21 15:04:39','COATING'),(44498,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044498','2023-11-21 15:04:39','COATING'),(44499,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044499','2023-11-21 15:04:39','COATING'),(44500,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044500','2023-11-21 15:04:39','COATING'),(44501,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044501','2023-11-21 15:04:39','COATING'),(44502,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044502','2023-11-21 15:04:39','COATING'),(44503,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044503','2023-11-21 15:04:39','COATING'),(44504,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044504','2023-11-21 15:04:39','COATING'),(44505,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044505','2023-11-21 15:04:39','COATING'),(44506,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044506','2023-11-21 15:04:39','COATING'),(44507,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044507','2023-11-21 15:04:39','COATING'),(44508,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044508','2023-11-21 15:04:39','COATING'),(44509,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044509','2023-11-21 15:04:39','COATING'),(44510,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044510','2023-11-21 15:04:39','COATING'),(44511,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044511','2023-11-21 15:04:39','COATING'),(44512,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044512','2023-11-21 15:04:39','COATING'),(44513,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044513','2023-11-21 15:04:39','COATING'),(44514,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044514','2023-11-21 15:04:39','COATING'),(44515,15,12,'GOP134274','2023-01-26','2023-10-25',190,4,190,'BG000000044515','2023-11-21 15:04:39','COATING'),(44516,16,12,'BDC370458','2022-08-01','2023-01-28',200,4,200,'BG000000044516','2023-11-21 15:04:39','COATING'),(44517,16,12,'BDC370458','2022-08-01','2023-01-28',200,4,200,'BG000000044517','2023-11-21 15:04:39','COATING'),(44518,16,12,'BDC370458','2022-08-01','2023-01-28',200,4,200,'BG000000044518','2023-11-21 15:04:39','COATING'),(44519,16,12,'BDC370458','2022-08-01','2023-01-28',200,4,200,'BG000000044519','2023-11-21 15:04:39','COATING'),(44520,16,12,'BDC370458','2022-08-01','2023-01-28',200,4,200,'BG000000044520','2023-11-21 15:04:39','COATING'),(44521,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044521','2023-11-21 15:04:39','COATING'),(44522,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044522','2023-11-21 15:04:39','COATING'),(44523,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044523','2023-11-21 15:04:39','COATING'),(44524,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044524','2023-11-21 15:04:39','COATING'),(44525,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044525','2023-11-21 15:04:39','COATING'),(44526,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044526','2023-11-21 15:04:39','COATING'),(44527,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044527','2023-11-21 15:04:39','COATING'),(44528,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044528','2023-11-21 15:04:39','COATING'),(44529,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044529','2023-11-21 15:04:39','COATING'),(44530,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044530','2023-11-21 15:04:39','COATING'),(44531,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044531','2023-11-21 15:04:39','COATING'),(44532,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044532','2023-11-21 15:04:40','COATING'),(44533,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044533','2023-11-21 15:04:40','COATING'),(44534,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044534','2023-11-21 15:04:40','COATING'),(44535,17,12,'BDC378564','2023-07-14','2024-01-10',220,4,220,'BG000000044535','2023-11-21 15:04:40','COATING'),(44536,18,12,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000044536','2023-11-21 15:04:40','COATING'),(44537,18,12,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000044537','2023-11-21 15:04:40','COATING'),(44538,18,12,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000044538','2023-11-21 15:04:40','COATING'),(44539,18,12,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000044539','2023-11-21 15:04:40','COATING'),(44540,18,12,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000044540','2023-11-21 15:04:40','COATING'),(44541,18,12,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000044541','2023-11-21 15:04:40','COATING'),(44542,18,12,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000044542','2023-11-21 15:04:40','COATING'),(44543,18,12,'2V35127471','2022-11-12','2023-11-12',195.25,4,195.25,'BG000000044543','2023-11-21 15:04:40','COATING'),(44544,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044544','2023-11-21 15:04:40','COATING'),(44545,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044545','2023-11-21 15:04:40','COATING'),(44546,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044546','2023-11-21 15:04:40','COATING'),(44547,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044547','2023-11-21 15:04:40','COATING'),(44548,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044548','2023-11-21 15:04:40','COATING'),(44549,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044549','2023-11-21 15:04:40','COATING'),(44550,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044550','2023-11-21 15:04:40','COATING'),(44551,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044551','2023-11-21 15:04:40','COATING'),(44552,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044552','2023-11-21 15:04:40','COATING'),(44553,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044553','2023-11-21 15:04:40','COATING'),(44554,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044554','2023-11-21 15:04:40','COATING'),(44555,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044555','2023-11-21 15:04:40','COATING'),(44556,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044556','2023-11-21 15:04:40','COATING'),(44557,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044557','2023-11-21 15:04:40','COATING'),(44558,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044558','2023-11-21 15:04:40','COATING'),(44559,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044559','2023-11-21 15:04:40','COATING'),(44560,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044560','2023-11-21 15:04:40','COATING'),(44561,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044561','2023-11-21 15:04:40','COATING'),(44562,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044562','2023-11-21 15:04:40','COATING'),(44563,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044563','2023-11-21 15:04:40','COATING'),(44564,18,12,'3394127754','2023-03-06','2024-03-06',195.25,4,195.25,'BG000000044564','2023-11-21 15:04:40','COATING'),(44565,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044565','2023-11-21 15:04:40','COATING'),(44566,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044566','2023-11-21 15:04:40','COATING'),(44567,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044567','2023-11-21 15:04:40','COATING'),(44568,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044568','2023-11-21 15:04:40','COATING'),(44569,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044569','2023-11-21 15:04:40','COATING'),(44570,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044570','2023-11-21 15:04:40','COATING'),(44571,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044571','2023-11-21 15:04:40','COATING'),(44572,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044572','2023-11-21 15:04:40','COATING'),(44573,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044573','2023-11-21 15:04:40','COATING'),(44574,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044574','2023-11-21 15:04:40','COATING'),(44575,20,12,'321H060810','2023-02-02','2024-02-02',200,4,200,'BG000000044575','2023-11-21 15:04:40','COATING'),(44576,20,12,'321H060810','2023-02-02','2024-02-02',200,4,200,'BG000000044576','2023-11-21 15:04:40','COATING'),(44577,20,12,'321H060810','2023-02-02','2024-02-02',200,4,200,'BG000000044577','2023-11-21 15:04:40','COATING'),(44578,20,12,'321H060810','2023-02-02','2024-02-02',200,4,200,'BG000000044578','2023-11-21 15:04:40','COATING'),(44579,20,12,'321H060810','2023-02-02','2024-02-02',200,4,200,'BG000000044579','2023-11-21 15:04:40','COATING'),(44580,20,12,'321H060810','2023-02-02','2024-02-02',200,4,200,'BG000000044580','2023-11-21 15:04:40','COATING'),(44581,20,12,'321H060810','2023-02-02','2024-02-02',200,4,200,'BG000000044581','2023-11-21 15:04:40','COATING'),(44582,20,12,'321H060810','2023-02-02','2024-02-02',200,4,200,'BG000000044582','2023-11-21 15:04:40','COATING'),(44583,21,12,'321H060764','2022-11-05','2023-11-05',250,4,250,'BG000000044583','2023-11-21 15:04:40','COATING'),(44584,21,12,'321H060764','2022-11-05','2023-11-05',250,4,250,'BG000000044584','2023-11-21 15:04:40','COATING'),(44585,22,12,'P131337098','2021-09-22','2022-03-22',220,4,220,'BG000000044585','2023-11-21 15:04:40','COATING'),(44586,22,12,'P131337098','2021-09-22','2022-03-22',220,4,220,'BG000000044586','2023-11-21 15:04:40','COATING'),(44587,23,12,'P140339688','2021-10-26','2022-04-26',220,4,220,'BG000000044587','2023-11-21 15:04:40','COATING'),(44588,23,12,'P140339688','2021-10-26','2022-04-26',220,4,220,'BG000000044588','2023-11-21 15:04:40','COATING'),(44589,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044589','2023-11-21 15:04:40','COATING'),(44590,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044590','2023-11-21 15:04:40','COATING'),(44591,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044591','2023-11-21 15:04:40','COATING'),(44592,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044592','2023-11-21 15:04:40','COATING'),(44593,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044593','2023-11-21 15:04:40','COATING'),(44594,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044594','2023-11-21 15:04:40','COATING'),(44595,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044595','2023-11-21 15:04:40','COATING'),(44596,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044596','2023-11-21 15:04:40','COATING'),(44597,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044597','2023-11-21 15:04:40','COATING'),(44598,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044598','2023-11-21 15:04:40','COATING'),(44599,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044599','2023-11-21 15:04:40','COATING'),(44600,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044600','2023-11-21 15:04:40','COATING'),(44601,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044601','2023-11-21 15:04:40','COATING'),(44602,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044602','2023-11-21 15:04:40','COATING'),(44603,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044603','2023-11-21 15:04:40','COATING'),(44604,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044604','2023-11-21 15:04:40','COATING'),(44605,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044605','2023-11-21 15:04:40','COATING'),(44606,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044606','2023-11-21 15:04:40','COATING'),(44607,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044607','2023-11-21 15:04:40','COATING'),(44608,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044608','2023-11-21 15:04:40','COATING'),(44609,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044609','2023-11-21 15:04:40','COATING'),(44610,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044610','2023-11-21 15:04:40','COATING'),(44611,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044611','2023-11-21 15:04:40','COATING'),(44612,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044612','2023-11-21 15:04:40','COATING'),(44613,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044613','2023-11-21 15:04:40','COATING'),(44614,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044614','2023-11-21 15:04:40','COATING'),(44615,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044615','2023-11-21 15:04:40','COATING'),(44616,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044616','2023-11-21 15:04:40','COATING'),(44617,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044617','2023-11-21 15:04:40','COATING'),(44618,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044618','2023-11-21 15:04:40','COATING'),(44619,24,12,'TEO407','2023-05-26','2023-11-22',240,4,240,'BG000000044619','2023-11-21 15:04:40','COATING'),(44620,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044620','2023-11-21 15:04:40','COATING'),(44621,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044621','2023-11-21 15:04:40','COATING'),(44622,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044622','2023-11-21 15:04:40','COATING'),(44623,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044623','2023-11-21 15:04:40','COATING'),(44624,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044624','2023-11-21 15:04:40','COATING'),(44625,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044625','2023-11-21 15:04:40','COATING'),(44626,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044626','2023-11-21 15:04:40','COATING'),(44627,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044627','2023-11-21 15:04:40','COATING'),(44628,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044628','2023-11-21 15:04:40','COATING'),(44629,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044629','2023-11-21 15:04:40','COATING'),(44630,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044630','2023-11-21 15:04:40','COATING'),(44631,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044631','2023-11-21 15:04:40','COATING'),(44632,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044632','2023-11-21 15:04:40','COATING'),(44633,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044633','2023-11-21 15:04:40','COATING'),(44634,25,12,'TEO154','2023-06-01','2023-11-08',200,4,200,'BG000000044634','2023-11-21 15:04:40','COATING'),(44635,25,12,'TFO167','2023-06-16','2023-12-13',200,4,200,'BG000000044635','2023-11-21 15:04:41','COATING'),(44636,25,12,'TFO167','2023-06-16','2023-12-13',200,4,200,'BG000000044636','2023-11-21 15:04:41','COATING'),(44637,25,12,'TFO167','2023-06-16','2023-12-13',200,4,200,'BG000000044637','2023-11-21 15:04:41','COATING'),(44638,25,12,'TFO167','2023-06-16','2023-12-13',200,4,200,'BG000000044638','2023-11-21 15:04:41','COATING'),(44639,25,12,'TFO167','2023-06-16','2023-12-13',200,4,200,'BG000000044639','2023-11-21 15:04:41','COATING'),(44640,26,12,'TEO361','2023-06-09','2023-12-06',200,4,200,'BG000000044640','2023-11-21 15:04:41','COATING'),(44641,26,12,'TEO361','2023-06-09','2023-12-06',200,4,200,'BG000000044641','2023-11-21 15:04:41','COATING'),(44642,27,12,'TFO429','2023-06-19','2023-12-16',200,4,200,'BG000000044642','2023-11-21 15:04:41','COATING'),(44643,27,12,'TFO429','2023-06-19','2023-12-16',200,4,200,'BG000000044643','2023-11-21 15:04:41','COATING'),(44644,28,12,'875C016011','2018-07-26','2019-01-22',197,4,197,'BG000000044644','2023-11-21 15:04:41','COATING'),(44645,28,12,'875C016011','2018-07-26','2019-01-22',197,4,197,'BG000000044645','2023-11-21 15:04:41','COATING'),(44646,29,12,'1808083654','2018-08-15','2019-02-15',96,4,96,'BG000000044646','2023-11-21 15:04:41','COATING'),(44647,30,12,'1808083655','2018-08-15','2019-02-15',104,4,104,'BG000000044647','2023-11-21 15:04:41','COATING'),(44648,30,12,'1808083655','2018-08-15','2019-02-15',63,4,63,'BG000000044648','2023-11-21 15:04:41','COATING'),(44649,18,12,'8635099570','2018-05-10','2019-05-10',195.25,4,195.25,'BG000000044649','2023-11-21 15:04:41','COATING'),(44650,18,12,'8635099570','2018-05-10','2019-05-10',195.25,4,195.25,'BG000000044650','2023-11-21 15:04:41','COATING'),(44651,18,12,'8635099570','2018-05-10','2019-05-10',71,4,71,'BG000000044651','2023-11-21 15:04:41','COATING'),(44652,21,12,'8W1H045295','2018-09-14','2019-09-14',250,4,250,'BG000000044652','2023-11-21 15:04:41','COATING'),(44653,21,12,'8W1H045295','2018-09-14','2019-09-14',250,4,250,'BG000000044653','2023-11-21 15:04:41','COATING'),(44654,17,12,'BDC338650','2019-05-19','2019-11-12',220,4,220,'BG000000044654','2023-11-21 15:04:41','COATING'),(44655,21,12,'8W1H045295','2018-09-14','2019-09-14',250,4,250,'BG000000044655','2023-11-21 15:04:41','COATING'),(44656,21,12,'8W1H045295','2018-09-14','2019-09-14',250,4,250,'BG000000044656','2023-11-21 15:04:41','COATING'),(44657,21,12,'8W1H045295','2018-09-14','2019-09-14',250,4,250,'BG000000044657','2023-11-21 15:04:41','COATING'),(44658,21,12,'9T1H048489','2019-06-26','2020-06-26',119,4,119,'BG000000044658','2023-11-21 15:04:41','COATING'),(44659,21,12,'181H055343','2021-04-04','2022-04-04',76,4,76,'BG000000044659','2023-11-21 15:04:41','COATING'),(44660,18,12,'8635099570','2018-05-10','2019-05-10',64,4,64,'BG000000044660','2023-11-21 15:04:41','COATING'),(44661,18,12,'8635099570','2018-05-10','2019-05-10',18,4,18,'BG000000044661','2023-11-21 15:04:41','COATING'),(44662,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044662','2023-11-21 15:04:41','COATING'),(44663,19,12,'2835126287','2022-08-26','2023-08-26',72,4,72,'BG000000044663','2023-11-21 15:04:41','COATING'),(44664,30,12,'F1808083655','2018-08-15','2019-02-15',219.8,4,219.8,'BG000000044664','2023-11-21 15:04:41','COATING'),(44665,29,12,'F1808083654','2018-08-15','2019-02-15',108,4,108,'BG000000044665','2023-11-21 15:04:41','COATING'),(44666,29,12,'F1808083654','2018-08-15','2019-02-15',86.8,4,86.8,'BG000000044666','2023-11-21 15:04:41','COATING'),(44667,31,12,'1318Y1910','2018-11-19','2019-05-18',81,4,81,'BG000000044667','2023-11-21 15:04:41','COATING'),(44668,32,12,'1318Y1909','2018-11-19','2019-05-18',76.8,4,76.8,'BG000000044668','2023-11-21 15:04:41','COATING'),(44669,17,12,'BDC338650','2019-05-19','2019-11-12',220,4,220,'BG000000044669','2023-11-21 15:04:41','COATING'),(44670,17,12,'BDC338650','2019-05-19','2019-11-12',220,4,220,'BG000000044670','2023-11-21 15:04:41','COATING'),(44671,17,12,'BDC338650','2019-05-19','2019-11-12',126.9,4,126.9,'BG000000044671','2023-11-21 15:04:41','COATING'),(44672,17,12,'BDC351308','2020-07-22','2021-01-18',220,4,220,'BG000000044672','2023-11-21 15:04:41','COATING'),(44673,21,12,'8W1H045295','2018-09-14','2019-09-14',225.3,4,225.3,'BG000000044673','2023-11-21 15:04:41','COATING'),(44674,28,12,'FH3310XA3','2020-11-27','2021-11-27',93.65,4,93.65,'BG000000044674','2023-11-21 15:04:41','COATING'),(44675,33,12,'BDC351252','2020-07-22','2021-01-18',252.5,4,252.5,'BG000000044675','2023-11-21 15:04:41','COATING'),(44676,18,12,'8635099570','2018-05-10','2019-05-10',25.8,4,25.8,'BG000000044676','2023-11-21 15:04:41','COATING'),(44677,34,12,'9V1A040676','2019-11-03','2020-05-03',210,4,210,'BG000000044677','2023-11-21 15:04:41','COATING'),(44678,34,12,'9V1A040676','2019-11-03','2020-05-03',210,4,210,'BG000000044678','2023-11-21 15:04:41','COATING'),(44679,35,12,'BDC347233','2020-03-18','2020-09-14',28,4,28,'BG000000044679','2023-11-21 15:04:41','COATING'),(44680,36,12,'BDC356440','2021-03-03','2021-08-30',200,4,200,'BG000000044680','2023-11-21 15:04:41','COATING'),(44681,36,12,'BDC356440','2021-03-03','2021-08-30',200,4,200,'BG000000044681','2023-11-21 15:04:41','COATING'),(44682,36,12,'BDC356440','2021-03-03','2021-08-30',200,4,200,'BG000000044682','2023-11-21 15:04:41','COATING'),(44683,36,12,'BDC356440','2021-03-03','2021-08-30',200,4,200,'BG000000044683','2023-11-21 15:04:41','COATING'),(44684,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044684','2023-11-21 15:04:41','COATING'),(44685,19,12,'2835126287','2022-08-26','2023-08-26',196.86,4,196.86,'BG000000044685','2023-11-21 15:04:41','COATING'),(44686,17,12,'BDC369082','2022-07-28','2023-01-24',103.95,4,103.95,'BG000000044686','2023-11-21 15:04:41','COATING'),(44687,33,12,'BDC370729','2022-08-08','2023-02-04',88.14,4,88.14,'BG000000044687','2023-11-21 15:04:41','COATING'),(44688,34,12,'961A039173','2019-05-30','2019-11-30',123,4,123,'BG000000044688','2023-11-21 15:04:41','COATING'),(44689,17,12,'BDC338650','2019-05-19','2019-11-12',202,4,202,'BG000000044689','2023-11-21 15:04:41','COATING'),(44690,21,12,'8W1H045295','2018-09-14','2019-09-14',160,4,160,'BG000000044690','2023-11-21 15:04:41','COATING'),(44691,37,14,'2749980112','2023-03-03','2024-02-26',247,4,247,'BG000000044691','2023-11-21 15:04:41','COMPOUND'),(44692,37,14,'2749980112','2023-03-03','2024-02-26',247,4,247,'BG000000044692','2023-11-21 15:04:41','COMPOUND'),(44693,37,14,'2749980112','2023-03-03','2024-02-26',247,4,247,'BG000000044693','2023-11-21 15:04:41','COMPOUND'),(44694,37,14,'2749980112','2023-03-03','2024-02-26',247,4,247,'BG000000044694','2023-11-21 15:04:41','COMPOUND'),(44695,37,14,'2749980117','2023-03-03','2024-02-26',253,4,253,'BG000000044695','2023-11-21 15:04:41','COMPOUND'),(44696,37,14,'2749980117','2023-03-03','2024-02-26',253,4,253,'BG000000044696','2023-11-21 15:04:41','COMPOUND'),(44697,37,14,'2749980117','2023-03-03','2024-02-26',253,4,253,'BG000000044697','2023-11-21 15:04:41','COMPOUND'),(44698,37,14,'2749980111','2023-03-03','2024-02-26',253,4,253,'BG000000044698','2023-11-21 15:04:41','COMPOUND'),(44699,37,14,'2749980111','2023-03-03','2024-02-26',252,4,252,'BG000000044699','2023-11-21 15:04:41','COMPOUND'),(44700,37,14,'2749980111','2023-03-03','2024-02-26',252,4,252,'BG000000044700','2023-11-21 15:04:41','COMPOUND'),(44701,37,14,'2749980111','2023-03-03','2024-02-26',252,4,252,'BG000000044701','2023-11-21 15:04:41','COMPOUND'),(44702,37,14,'2749980111','2023-03-03','2024-02-26',252,4,252,'BG000000044702','2023-11-21 15:04:41','COMPOUND'),(44703,37,14,'2749980116','2023-03-03','2024-02-26',251,4,251,'BG000000044703','2023-11-21 15:04:41','COMPOUND'),(44704,37,14,'2749980116','2023-03-03','2024-02-26',251,4,251,'BG000000044704','2023-11-21 15:04:41','COMPOUND'),(44705,37,14,'2749980116','2023-03-03','2024-02-26',251,4,251,'BG000000044705','2023-11-21 15:04:41','COMPOUND'),(44706,37,14,'2749980116','2023-03-03','2024-02-26',251,4,251,'BG000000044706','2023-11-21 15:04:41','COMPOUND'),(44707,38,14,'2733230199','2022-11-03','2023-05-02',246,4,246,'BG000000044707','2023-11-21 15:04:41','COMPOUND'),(44708,38,14,'2733230199','2022-11-03','2023-05-02',246,4,246,'BG000000044708','2023-11-21 15:04:41','COMPOUND'),(44709,38,14,'2733230199','2022-11-03','2023-05-02',246,4,246,'BG000000044709','2023-11-21 15:04:41','COMPOUND'),(44710,38,14,'2733230199','2022-11-03','2023-05-02',246,4,246,'BG000000044710','2023-11-21 15:04:41','COMPOUND'),(44711,38,14,'2733230202','2022-11-03','2023-05-02',246,4,246,'BG000000044711','2023-11-21 15:04:41','COMPOUND'),(44712,38,14,'2733230202','2022-11-03','2023-05-02',246,4,246,'BG000000044712','2023-11-21 15:04:41','COMPOUND'),(44713,38,14,'2733230202','2022-11-03','2023-05-02',246,4,246,'BG000000044713','2023-11-21 15:04:41','COMPOUND'),(44714,38,14,'2733230202','2022-11-03','2023-05-02',246,4,246,'BG000000044714','2023-11-21 15:04:41','COMPOUND'),(44715,38,14,'2733230201','2022-11-03','2023-05-02',244,4,244,'BG000000044715','2023-11-21 15:04:41','COMPOUND'),(44716,38,14,'2733230201','2022-11-03','2023-05-02',244,4,244,'BG000000044716','2023-11-21 15:04:41','COMPOUND'),(44717,38,14,'2733230201','2022-11-03','2023-05-02',244,4,244,'BG000000044717','2023-11-21 15:04:41','COMPOUND'),(44718,38,14,'2733230201','2022-11-03','2023-05-02',244,4,244,'BG000000044718','2023-11-21 15:04:41','COMPOUND'),(44719,38,14,'2731990011','2023-01-19','2023-07-18',246,4,246,'BG000000044719','2023-11-21 15:04:41','COMPOUND'),(44720,38,14,'2731990011','2023-01-19','2023-07-18',246,4,246,'BG000000044720','2023-11-21 15:04:41','COMPOUND'),(44721,38,14,'2731990011','2023-01-19','2023-07-18',246,4,246,'BG000000044721','2023-11-21 15:04:41','COMPOUND'),(44722,38,14,'2731990011','2023-01-19','2023-07-18',246,4,246,'BG000000044722','2023-11-21 15:04:41','COMPOUND'),(44723,38,14,'2731990165','2023-01-18','2023-07-17',246,4,246,'BG000000044723','2023-11-21 15:04:41','COMPOUND'),(44724,38,14,'2731990165','2023-01-18','2023-07-17',246,4,246,'BG000000044724','2023-11-21 15:04:41','COMPOUND'),(44725,38,14,'2731990165','2023-01-18','2023-07-17',246,4,246,'BG000000044725','2023-11-21 15:04:41','COMPOUND'),(44726,38,14,'2731990165','2023-01-18','2023-07-17',246,4,246,'BG000000044726','2023-11-21 15:04:41','COMPOUND'),(44727,38,14,'2731990009','2023-01-19','2023-07-18',247,4,247,'BG000000044727','2023-11-21 15:04:41','COMPOUND'),(44728,38,14,'2731990009','2023-01-19','2023-07-18',247,4,247,'BG000000044728','2023-11-21 15:04:41','COMPOUND'),(44729,38,14,'2731990009','2023-01-19','2023-07-18',247,4,247,'BG000000044729','2023-11-21 15:04:41','COMPOUND'),(44730,38,14,'2731990009','2023-01-19','2023-07-18',247,4,247,'BG000000044730','2023-11-21 15:04:41','COMPOUND'),(44731,38,14,'2731990010','2023-01-19','2023-07-18',247,4,247,'BG000000044731','2023-11-21 15:04:41','COMPOUND'),(44732,38,14,'2731990010','2023-01-19','2023-07-18',247,4,247,'BG000000044732','2023-11-21 15:04:41','COMPOUND'),(44733,38,14,'2731990010','2023-01-19','2023-07-18',247,4,247,'BG000000044733','2023-11-21 15:04:41','COMPOUND'),(44734,38,14,'2731990010','2023-01-19','2023-07-18',247,4,247,'BG000000044734','2023-11-21 15:04:41','COMPOUND'),(44735,38,14,'2731990014','2023-01-19','2023-07-18',248,4,248,'BG000000044735','2023-11-21 15:04:41','COMPOUND'),(44736,38,14,'2731990014','2023-01-19','2023-07-18',248,4,248,'BG000000044736','2023-11-21 15:04:41','COMPOUND'),(44737,38,14,'2731990014','2023-01-19','2023-07-18',248,4,248,'BG000000044737','2023-11-21 15:04:42','COMPOUND'),(44738,38,14,'2731990014','2023-01-19','2023-07-18',248,4,248,'BG000000044738','2023-11-21 15:04:42','COMPOUND'),(44739,38,14,'2731990012','2023-01-19','2023-07-18',249,4,249,'BG000000044739','2023-11-21 15:04:42','COMPOUND'),(44740,38,14,'2731990012','2023-01-19','2023-07-18',249,4,249,'BG000000044740','2023-11-21 15:04:42','COMPOUND'),(44741,38,14,'2731990012','2023-01-19','2023-07-18',249,4,249,'BG000000044741','2023-11-21 15:04:42','COMPOUND'),(44742,38,14,'2731990012','2023-01-19','2023-07-18',249,4,249,'BG000000044742','2023-11-21 15:04:42','COMPOUND'),(44743,38,14,'2731990015','2023-01-19','2023-07-18',249,4,249,'BG000000044743','2023-11-21 15:04:42','COMPOUND'),(44744,38,14,'2731990015','2023-01-19','2023-07-18',249,4,249,'BG000000044744','2023-11-21 15:04:42','COMPOUND'),(44745,38,14,'2731990015','2023-01-19','2023-07-18',249,4,249,'BG000000044745','2023-11-21 15:04:42','COMPOUND'),(44746,38,14,'2731990015','2023-01-19','2023-07-18',249,4,249,'BG000000044746','2023-11-21 15:04:42','COMPOUND'),(44747,38,14,'2731990013','2023-01-19','2023-07-18',248,4,248,'BG000000044747','2023-11-21 15:04:42','COMPOUND'),(44748,38,14,'2731990013','2023-01-19','2023-07-18',248,4,248,'BG000000044748','2023-11-21 15:04:42','COMPOUND'),(44749,38,14,'2731990013','2023-01-19','2023-07-18',248,4,248,'BG000000044749','2023-11-21 15:04:42','COMPOUND'),(44750,38,14,'2731990013','2023-01-19','2023-07-18',248,4,248,'BG000000044750','2023-11-21 15:04:42','COMPOUND'),(44751,39,14,'2773861026','2023-07-21','2024-01-17',245,4,245,'BG000000044751','2023-11-21 15:04:42','COMPOUND'),(44752,39,14,'2773861026','2023-07-21','2024-01-17',245,4,245,'BG000000044752','2023-11-21 15:04:42','COMPOUND'),(44753,39,14,'2773861026','2023-07-21','2024-01-17',245,4,245,'BG000000044753','2023-11-21 15:04:42','COMPOUND'),(44754,39,14,'2773861026','2023-07-21','2024-01-17',245,4,245,'BG000000044754','2023-11-21 15:04:42','COMPOUND'),(44755,39,14,'2773860997','2023-07-17','2024-01-13',249,4,249,'BG000000044755','2023-11-21 15:04:42','COMPOUND'),(44756,39,14,'2773860997','2023-07-17','2024-01-13',249,4,249,'BG000000044756','2023-11-21 15:04:42','COMPOUND'),(44757,39,14,'2773860997','2023-07-17','2024-01-13',249,4,249,'BG000000044757','2023-11-21 15:04:42','COMPOUND'),(44758,39,14,'2773860997','2023-07-17','2024-01-13',249,4,249,'BG000000044758','2023-11-21 15:04:42','COMPOUND'),(44759,39,14,'2773861091','2023-07-29','2024-01-25',246,4,246,'BG000000044759','2023-11-21 15:04:42','COMPOUND'),(44760,39,14,'2773861091','2023-07-29','2024-01-25',246,4,246,'BG000000044760','2023-11-21 15:04:42','COMPOUND'),(44761,39,14,'2773861091','2023-07-29','2024-01-25',246,4,246,'BG000000044761','2023-11-21 15:04:42','COMPOUND'),(44762,39,14,'2773861091','2023-07-29','2024-01-25',246,4,246,'BG000000044762','2023-11-21 15:04:42','COMPOUND'),(44763,39,14,'2773861047','2023-07-24','2024-01-20',245,4,245,'BG000000044763','2023-11-21 15:04:42','COMPOUND'),(44764,39,14,'2773861047','2023-07-24','2024-01-20',245,4,245,'BG000000044764','2023-11-21 15:04:42','COMPOUND'),(44765,39,14,'2773861047','2023-07-24','2024-01-20',245,4,245,'BG000000044765','2023-11-21 15:04:42','COMPOUND'),(44766,39,14,'2773861047','2023-07-24','2024-01-20',245,4,245,'BG000000044766','2023-11-21 15:04:42','COMPOUND'),(44767,39,14,'2773861010','2023-07-19','2024-01-15',245,4,245,'BG000000044767','2023-11-21 15:04:42','COMPOUND'),(44768,39,14,'2773861010','2023-07-19','2024-01-15',245,4,245,'BG000000044768','2023-11-21 15:04:42','COMPOUND'),(44769,39,14,'2773861010','2023-07-19','2024-01-15',245,4,245,'BG000000044769','2023-11-21 15:04:42','COMPOUND'),(44770,39,14,'2773861010','2023-07-19','2024-01-15',245,4,245,'BG000000044770','2023-11-21 15:04:42','COMPOUND'),(44771,39,14,'2773861001','2023-07-18','2024-01-14',245,4,245,'BG000000044771','2023-11-21 15:04:42','COMPOUND'),(44772,39,14,'2773861001','2023-07-18','2024-01-14',245,4,245,'BG000000044772','2023-11-21 15:04:42','COMPOUND'),(44773,39,14,'2773861001','2023-07-18','2024-01-14',245,4,245,'BG000000044773','2023-11-21 15:04:42','COMPOUND'),(44774,39,14,'2773861001','2023-07-18','2024-01-14',245,4,245,'BG000000044774','2023-11-21 15:04:42','COMPOUND'),(44775,39,14,'2773861009','2023-07-19','2024-01-15',245,4,245,'BG000000044775','2023-11-21 15:04:42','COMPOUND'),(44776,39,14,'2773861009','2023-07-19','2024-01-15',245,4,245,'BG000000044776','2023-11-21 15:04:42','COMPOUND'),(44777,39,14,'2773861009','2023-07-19','2024-01-15',245,4,245,'BG000000044777','2023-11-21 15:04:42','COMPOUND'),(44778,39,14,'2773861009','2023-07-19','2024-01-15',245,4,245,'BG000000044778','2023-11-21 15:04:42','COMPOUND'),(44779,39,14,'2773861016','2023-07-20','2024-01-16',244,4,244,'BG000000044779','2023-11-21 15:04:42','COMPOUND'),(44780,39,14,'2773861016','2023-07-20','2024-01-16',244,4,244,'BG000000044780','2023-11-21 15:04:42','COMPOUND'),(44781,39,14,'2773861016','2023-07-20','2024-01-16',244,4,244,'BG000000044781','2023-11-21 15:04:42','COMPOUND'),(44782,39,14,'2773861016','2023-07-20','2024-01-16',244,4,244,'BG000000044782','2023-11-21 15:04:42','COMPOUND'),(44783,39,14,'2773861017','2023-07-20','2024-01-16',244,4,244,'BG000000044783','2023-11-21 15:04:42','COMPOUND'),(44784,39,14,'2773861017','2023-07-20','2024-01-16',244,4,244,'BG000000044784','2023-11-21 15:04:42','COMPOUND'),(44785,39,14,'2773861017','2023-07-20','2024-01-16',244,4,244,'BG000000044785','2023-11-21 15:04:42','COMPOUND'),(44786,39,14,'2773861017','2023-07-20','2024-01-16',244,4,244,'BG000000044786','2023-11-21 15:04:42','COMPOUND'),(44787,39,14,'2773861002','2023-07-18','2024-01-14',244,4,244,'BG000000044787','2023-11-21 15:04:42','COMPOUND'),(44788,39,14,'2773861002','2023-07-18','2024-01-14',244,4,244,'BG000000044788','2023-11-21 15:04:42','COMPOUND'),(44789,39,14,'2773861002','2023-07-18','2024-01-14',244,4,244,'BG000000044789','2023-11-21 15:04:42','COMPOUND'),(44790,39,14,'2773861002','2023-07-18','2024-01-14',244,4,244,'BG000000044790','2023-11-21 15:04:42','COMPOUND'),(44791,39,14,'2773861039','2023-07-22','2024-01-18',245,4,245,'BG000000044791','2023-11-21 15:04:42','COMPOUND'),(44792,39,14,'2773861039','2023-07-22','2024-01-18',245,4,245,'BG000000044792','2023-11-21 15:04:42','COMPOUND'),(44793,39,14,'2773861039','2023-07-22','2024-01-18',245,4,245,'BG000000044793','2023-11-21 15:04:42','COMPOUND'),(44794,39,14,'2773861039','2023-07-22','2024-01-18',245,4,245,'BG000000044794','2023-11-21 15:04:42','COMPOUND'),(44795,39,14,'2773861040','2023-07-22','2024-01-18',245,4,245,'BG000000044795','2023-11-21 15:04:42','COMPOUND'),(44796,39,14,'2773861040','2023-07-22','2024-01-18',245,4,245,'BG000000044796','2023-11-21 15:04:42','COMPOUND'),(44797,39,14,'2773861040','2023-07-22','2024-01-18',245,4,245,'BG000000044797','2023-11-21 15:04:42','COMPOUND'),(44798,39,14,'2773861040','2023-07-22','2024-01-18',245,4,245,'BG000000044798','2023-11-21 15:04:42','COMPOUND'),(44799,39,14,'2773861048','2023-07-24','2024-01-20',243,4,243,'BG000000044799','2023-11-21 15:04:42','COMPOUND'),(44800,39,14,'2773861048','2023-07-24','2024-01-20',243,4,243,'BG000000044800','2023-11-21 15:04:42','COMPOUND'),(44801,39,14,'2773861048','2023-07-24','2024-01-20',243,4,243,'BG000000044801','2023-11-21 15:04:42','COMPOUND'),(44802,39,14,'2773861048','2023-07-24','2024-01-20',243,4,243,'BG000000044802','2023-11-21 15:04:42','COMPOUND'),(44803,39,14,'2773861104','2023-08-01','2024-01-28',246,4,246,'BG000000044803','2023-11-21 15:04:42','COMPOUND'),(44804,39,14,'2773861104','2023-08-01','2024-01-28',246,4,246,'BG000000044804','2023-11-21 15:04:42','COMPOUND'),(44805,39,14,'2773861104','2023-08-01','2024-01-28',246,4,246,'BG000000044805','2023-11-21 15:04:42','COMPOUND'),(44806,39,14,'2773861104','2023-08-01','2024-01-28',246,4,246,'BG000000044806','2023-11-21 15:04:42','COMPOUND'),(44807,39,14,'2773861105','2023-08-01','2024-01-28',243,4,243,'BG000000044807','2023-11-21 15:04:42','COMPOUND'),(44808,39,14,'2773861105','2023-08-01','2024-01-28',243,4,243,'BG000000044808','2023-11-21 15:04:42','COMPOUND'),(44809,39,14,'2773861105','2023-08-01','2024-01-28',243,4,243,'BG000000044809','2023-11-21 15:04:42','COMPOUND'),(44810,39,14,'2773861105','2023-08-01','2024-01-28',243,4,243,'BG000000044810','2023-11-21 15:04:42','COMPOUND'),(44811,39,14,'2773861025','2023-07-21','2024-01-17',245,4,245,'BG000000044811','2023-11-21 15:04:42','COMPOUND'),(44812,39,14,'2773861025','2023-07-21','2024-01-17',245,4,245,'BG000000044812','2023-11-21 15:04:42','COMPOUND'),(44813,39,14,'2773861025','2023-07-21','2024-01-17',245,4,245,'BG000000044813','2023-11-21 15:04:42','COMPOUND'),(44814,39,14,'2773861025','2023-07-21','2024-01-17',245,4,245,'BG000000044814','2023-11-21 15:04:42','COMPOUND'),(44815,39,14,'2773861092','2023-07-29','2024-01-25',246,4,246,'BG000000044815','2023-11-21 15:04:42','COMPOUND'),(44816,39,14,'2773861092','2023-07-29','2024-01-25',246,4,246,'BG000000044816','2023-11-21 15:04:42','COMPOUND'),(44817,39,14,'2773861092','2023-07-29','2024-01-25',246,4,246,'BG000000044817','2023-11-21 15:04:42','COMPOUND'),(44818,39,14,'2773861092','2023-07-29','2024-01-25',246,4,246,'BG000000044818','2023-11-21 15:04:42','COMPOUND'),(44819,39,14,'2773861101','2023-07-31','2024-01-27',247,4,247,'BG000000044819','2023-11-21 15:04:42','COMPOUND'),(44820,39,14,'2773861101','2023-07-31','2024-01-27',247,4,247,'BG000000044820','2023-11-21 15:04:42','COMPOUND'),(44821,39,14,'2773861101','2023-07-31','2024-01-27',247,4,247,'BG000000044821','2023-11-21 15:04:42','COMPOUND'),(44822,39,14,'2773861101','2023-07-31','2024-01-27',247,4,247,'BG000000044822','2023-11-21 15:04:42','COMPOUND'),(44823,39,14,'2773861100','2023-07-31','2024-01-27',247,4,247,'BG000000044823','2023-11-21 15:04:42','COMPOUND'),(44824,39,14,'2773861100','2023-07-31','2024-01-27',247,4,247,'BG000000044824','2023-11-21 15:04:42','COMPOUND'),(44825,39,14,'2773861100','2023-07-31','2024-01-27',247,4,247,'BG000000044825','2023-11-21 15:04:42','COMPOUND'),(44826,39,14,'2773861100','2023-07-31','2024-01-27',247,4,247,'BG000000044826','2023-11-21 15:04:42','COMPOUND'),(44827,40,14,'2698100157','2022-05-05','2023-04-30',256,4,256,'BG000000044827','2023-11-21 15:04:42','COMPOUND'),(44828,40,14,'2698100157','2022-05-05','2023-04-30',256,4,256,'BG000000044828','2023-11-21 15:04:42','COMPOUND'),(44829,40,14,'2698100157','2022-05-05','2023-04-30',256,4,256,'BG000000044829','2023-11-21 15:04:42','COMPOUND'),(44830,40,14,'2698100157','2022-05-05','2023-04-30',256,4,256,'BG000000044830','2023-11-21 15:04:42','COMPOUND'),(44831,40,14,'2698100155','2022-05-05','2023-04-30',256,4,256,'BG000000044831','2023-11-21 15:04:42','COMPOUND'),(44832,40,14,'2698100155','2022-05-05','2023-04-30',256,4,256,'BG000000044832','2023-11-21 15:04:42','COMPOUND'),(44833,40,14,'2698100155','2022-05-05','2023-04-30',256,4,256,'BG000000044833','2023-11-21 15:04:42','COMPOUND'),(44834,40,14,'2698100155','2022-05-05','2023-04-30',256,4,256,'BG000000044834','2023-11-21 15:04:42','COMPOUND'),(44835,40,14,'2698100160','2022-05-06','2023-05-01',255,4,255,'BG000000044835','2023-11-21 15:04:42','COMPOUND'),(44836,40,14,'2698100160','2022-05-06','2023-05-01',255,4,255,'BG000000044836','2023-11-21 15:04:42','COMPOUND'),(44837,40,14,'2698100160','2022-05-06','2023-05-01',255,4,255,'BG000000044837','2023-11-21 15:04:42','COMPOUND'),(44838,40,14,'2698100160','2022-05-06','2023-05-01',255,4,255,'BG000000044838','2023-11-21 15:04:42','COMPOUND'),(44839,41,14,'2415360001','2019-03-19','2019-09-15',244,4,244,'BG000000044839','2023-11-21 15:04:42','COMPOUND'),(44840,41,14,'2415360003','2019-03-19','2019-09-15',246,4,246,'BG000000044840','2023-11-21 15:04:43','COMPOUND'),(44841,41,14,'2415360003','2019-03-19','2019-09-15',246,4,246,'BG000000044841','2023-11-21 15:04:43','COMPOUND'),(44842,41,14,'2415360003','2019-03-19','2019-09-15',246,4,246,'BG000000044842','2023-11-21 15:04:43','COMPOUND'),(44843,41,14,'2415360003','2019-03-19','2019-09-15',246,4,246,'BG000000044843','2023-11-21 15:04:43','COMPOUND'),(44844,41,14,'2415360002','2019-03-19','2019-09-15',245,4,245,'BG000000044844','2023-11-21 15:04:43','COMPOUND'),(44845,41,14,'2415360002','2019-03-19','2019-09-15',245,4,245,'BG000000044845','2023-11-21 15:04:43','COMPOUND'),(44846,41,14,'2415360002','2019-03-19','2019-09-15',245,4,245,'BG000000044846','2023-11-21 15:04:43','COMPOUND');
/*!40000 ALTER TABLE `temp_barcode_printing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `days` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_numbers_used`
--

DROP TABLE IF EXISTS `transaction_numbers_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_numbers_used` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_numbers_used`
--

LOCK TABLES `transaction_numbers_used` WRITE;
/*!40000 ALTER TABLE `transaction_numbers_used` DISABLE KEYS */;
INSERT INTO `transaction_numbers_used` VALUES (23,'ADJ00000001'),(25,'ADJ00000002'),(112,'ADJ00000003'),(30,'BM00000001'),(31,'BM00000002'),(32,'BM00000003'),(33,'BM00000004'),(34,'BM00000005'),(35,'BM00000006'),(36,'BM00000007'),(37,'BM00000008'),(38,'BM00000009'),(39,'BM00000010'),(40,'BM00000011'),(41,'BM00000012'),(42,'BM00000013'),(43,'BM00000014'),(44,'BM00000015'),(45,'BM00000016'),(46,'BM00000017'),(47,'BM00000018'),(48,'BM00000019'),(49,'BM00000020'),(50,'BM00000021'),(51,'BM00000022'),(52,'BM00000023'),(53,'BM00000024'),(54,'BM00000025'),(55,'BM00000026'),(56,'BM00000027'),(57,'BM00000028'),(58,'BM00000029'),(59,'BM00000030'),(60,'BM00000031'),(61,'BM00000032'),(62,'BM00000033'),(63,'BM00000034'),(64,'BM00000035'),(65,'BM00000036'),(66,'BM00000037'),(67,'BM00000038'),(68,'BM00000039'),(69,'BM00000040'),(70,'BM00000041'),(71,'BM00000042'),(72,'BM00000043'),(73,'BM00000044'),(74,'BM00000045'),(75,'BM00000046'),(76,'BM00000047'),(77,'BM00000048'),(78,'BM00000049'),(79,'BM00000050'),(80,'BM00000051'),(81,'BM00000052'),(82,'BM00000053'),(83,'BM00000054'),(84,'BM00000055'),(85,'BM00000056'),(86,'BM00000057'),(87,'BM00000058'),(88,'BM00000059'),(89,'BM00000060'),(90,'BM00000061'),(91,'BM00000062'),(92,'BM00000063'),(93,'BM00000064'),(94,'BM00000065'),(95,'BM00000066'),(96,'BM00000067'),(97,'BM00000068'),(98,'BM00000069'),(99,'BM00000070'),(100,'BM00000071'),(101,'BM00000072'),(24,'CC00000001'),(106,'CC00000002'),(111,'CC00000003'),(113,'CC00000004'),(4,'DR00000001'),(22,'DR00000002'),(3,'ISS00000001'),(13,'ISS00000002'),(21,'ISS00000003'),(2,'PKL00000001'),(10,'PKL00000002'),(12,'PKL00000003'),(20,'PKL00000004'),(27,'PKL00000005'),(103,'PKL00000006'),(105,'PKL00000007'),(107,'PKL00000008'),(17,'PO00000001'),(28,'PO00000002'),(109,'PO00000003'),(5,'RCV00000001'),(6,'RCV00000002'),(7,'RCV00000003'),(8,'RCV00000004'),(9,'RCV00000005'),(14,'RCV00000006'),(15,'RCV00000007'),(16,'RCV00000008'),(18,'RCV00000009'),(29,'RCV00000010'),(108,'RCV00000011'),(110,'RCV00000012'),(1,'TO00000001'),(11,'TO00000002'),(19,'TO00000003'),(26,'TO00000004'),(102,'TO00000005'),(104,'TO00000006');
/*!40000 ALTER TABLE `transaction_numbers_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(35) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `prefix` varchar(20) NOT NULL,
  `next_number_series` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
INSERT INTO `transaction_type` VALUES (1,'ITEM','ITEM','ITM',1,1,'2020-06-05 13:33:07'),(2,'PO','PURCHASE ORDER','PO',4,1,'2020-08-10 12:55:11'),(3,'RCV','STOCK RECEIPT','RCV',13,1,'2020-08-10 12:55:17'),(4,'TO','TRANSFER ORDER','TO',7,1,'2020-08-10 12:55:21'),(5,'PKL','PICKLIST','PKL',9,1,'2020-08-10 12:55:25'),(6,'ISS','STOCK ISSUANCE','ISS',4,1,'2020-08-10 12:55:30'),(7,'SO','SALES ORDER','SO',1,1,'2020-08-10 12:55:34'),(8,'PR','PURCHASE RETURN','PR',1,1,'2019-12-11 06:04:14'),(9,'CUSTOMER','CUSTOMER','',1,1,'2019-10-17 13:35:35'),(10,'SUPPLIER','SUPPLIER','',1,NULL,NULL),(11,'ADJ','Stock Adjustment','ADJ',4,1,'2020-08-10 12:55:45'),(12,'RECLASS','Reclass','RCL',1,1,'2020-08-10 12:55:42'),(13,'DR','DELIVERY RECEIPT','DR',3,1,'2020-08-10 12:55:49'),(14,'CDRCV','CROSSDOCK RECEIVING','XRCV',1,1,'2023-05-21 18:10:41'),(15,'CDTRF','CD TRF','CDTRF',1,NULL,NULL),(16,'CDPKL','CD Picklist','CDPKL',1,NULL,NULL),(17,'XLP','Crossdock Load Plan','XLP',1,NULL,NULL),(18,'XSHP','Crossdock Shipment','XSHP',1,NULL,NULL),(19,'SW','STOCK WITHDRAWAL','SW',1,NULL,NULL),(20,'CC','CYCLE COUNT','CC',5,NULL,NULL),(21,'BCODEPRNT','Barcode Printing','BM',73,NULL,NULL);
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_order_attachments`
--

DROP TABLE IF EXISTS `transfer_order_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_order_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_order_header_id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `path` tinytext NOT NULL,
  `uploaded_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_order_attachments`
--

LOCK TABLES `transfer_order_attachments` WRITE;
/*!40000 ALTER TABLE `transfer_order_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_order_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_order_details`
--

DROP TABLE IF EXISTS `transfer_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_order_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `issued_quantity` double NOT NULL DEFAULT '0',
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_order_header_id` (`transfer_order_header_id`),
  KEY `item_id` (`item_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_order_details`
--

LOCK TABLES `transfer_order_details` WRITE;
/*!40000 ALTER TABLE `transfer_order_details` DISABLE KEYS */;
INSERT INTO `transfer_order_details` VALUES (1,1,9,3,400,400,0,NULL,'2023-12-14 13:57:11',1,'2023-12-14 13:57:11',1),(2,1,31,4,21,21,0,NULL,'2023-12-14 13:57:22',1,'2023-12-14 13:57:22',1),(3,2,9,3,400,400,0,NULL,'2023-12-14 17:09:08',1,'2023-12-14 17:09:08',1),(4,3,12,3,15,15,0,NULL,'2024-01-08 20:05:56',1,'2024-01-08 20:05:56',1),(5,4,9,3,1000,1000,0,NULL,'2024-01-17 17:07:14',1,'2024-01-17 17:07:14',1),(6,5,10,3,2000,2000,0,NULL,'2024-01-18 00:38:29',1,'2024-01-18 00:38:29',1),(7,6,15,4,28.25,28.25,0,NULL,'2024-01-24 17:43:50',1,'2024-01-24 17:48:36',1);
/*!40000 ALTER TABLE `transfer_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_order_header`
--

DROP TABLE IF EXISTS `transfer_order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_order_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(80) DEFAULT NULL,
  `status` varchar(80) NOT NULL,
  `type` varchar(20) NOT NULL,
  `warehouse_origin_id` int(11) NOT NULL,
  `warehouse_destination_id` int(11) NOT NULL,
  `reference` varchar(80) DEFAULT NULL,
  `document_date` date NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  `remarks` text,
  `user_defined_field1` varchar(128) DEFAULT NULL,
  `user_defined_field2` varchar(128) DEFAULT NULL,
  `user_defined_field3` varchar(128) DEFAULT NULL,
  `user_defined_field4` varchar(128) DEFAULT NULL,
  `user_defined_field5` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `warehouse_origin_id` (`warehouse_origin_id`),
  KEY `warehouse_destination_id` (`warehouse_destination_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `posted_by` (`posted_by`),
  KEY `closed_by` (`closed_by`),
  KEY `cancelled_by` (`cancelled_by`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_order_header`
--

LOCK TABLES `transfer_order_header` WRITE;
/*!40000 ALTER TABLE `transfer_order_header` DISABLE KEYS */;
INSERT INTO `transfer_order_header` VALUES (1,'TO00000001','POSTED','TRANSFER',53,50,'TEST','2023-12-14','2023-12-14 13:56:56',1,NULL,NULL,'2023-12-14 14:00:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'TO00000002','CLOSED','TRANSFER',53,48,'TEST12','2023-12-14','2023-12-14 17:08:52',1,NULL,NULL,'2023-12-14 17:09:11',1,'2023-12-14 17:11:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'TO00000003','CLOSED','TRANSFER',53,48,'TF01345','2024-01-08','2024-01-08 19:35:13',1,NULL,NULL,'2024-01-08 20:42:35',1,'2024-01-08 23:33:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'TO00000004','POSTED','TRANSFER',53,49,'TEST231','2024-01-17','2024-01-17 17:07:03',1,NULL,NULL,'2024-01-17 17:07:17',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'TO00000005','POSTED','TRANSFER',53,48,'TEST1234','2024-01-18','2024-01-18 00:38:10',1,NULL,NULL,'2024-01-18 00:38:35',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'TO00000006','POSTED','TRANSFER',53,49,'TESTTTTT','2024-01-24','2024-01-24 17:43:37',1,NULL,NULL,'2024-01-24 17:48:50',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `transfer_order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucking`
--

DROP TABLE IF EXISTS `trucking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trucking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucking`
--

LOCK TABLES `trucking` WRITE;
/*!40000 ALTER TABLE `trucking` DISABLE KEYS */;
/*!40000 ALTER TABLE `trucking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucking_vehicle`
--

DROP TABLE IF EXISTS `trucking_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trucking_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_type_id` int(11) NOT NULL,
  `plate_number` varchar(45) DEFAULT NULL,
  `manufacturer` varchar(128) DEFAULT NULL,
  `model` varchar(128) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `cbm_capacity` double NOT NULL DEFAULT '0',
  `weight_capacity` double NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate_number` (`plate_number`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `vehicle_type_id` (`vehicle_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucking_vehicle`
--

LOCK TABLES `trucking_vehicle` WRITE;
/*!40000 ALTER TABLE `trucking_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `trucking_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_of_measure`
--

DROP TABLE IF EXISTS `unit_of_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_of_measure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_of_measure`
--

LOCK TABLES `unit_of_measure` WRITE;
/*!40000 ALTER TABLE `unit_of_measure` DISABLE KEYS */;
INSERT INTO `unit_of_measure` VALUES (1,'PCS','PCS','2023-11-13 08:49:14',1,NULL,NULL,1),(2,'ROLL','ROLL','2023-11-13 08:49:14',1,NULL,NULL,1),(3,'SHEETS','SHEETS','2023-11-13 08:49:24',1,NULL,NULL,1),(4,'KG','KG','2023-11-13 08:49:50',1,NULL,NULL,1),(5,'UOM','UOM','2023-11-21 13:54:57',1,NULL,NULL,1);
/*!40000 ALTER TABLE `unit_of_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `email_address` varchar(128) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `user_group_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `admin_flag` tinyint(1) DEFAULT '0',
  `warehouse_id` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `hash_password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_group_id` (`user_group_id`),
  KEY `created_by` (`created_by`),
  KEY `location_id` (`warehouse_id`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'System','','Administrator','admin','827ccb0eea8a706c4c34a16891f84e7b','',1,3,'2023-11-13 08:52:14',1,0,53,NULL,NULL,'$2b$10$EA3xHEm//aGg0zJfeq8CgeZ6mJ/KtdwOF.K/ZtJMJLlzb3fh0SDou'),(92,'Romeo',NULL,'Mallari','romeo.mallari','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(93,'Odette',NULL,'Laygo','odette.laygo','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(94,'Dorina',NULL,'Sacristia','dorina.sacristia','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(95,'Receiving','','Ilp Logistics','receiving.ilplogistics','827ccb0eea8a706c4c34a16891f84e7b','',1,3,'2023-11-14 11:32:07',1,0,53,NULL,NULL,NULL),(96,'Roque',NULL,'Centeno','roque.centeno','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,48,NULL,NULL,NULL),(97,'Jing',NULL,'Escasio','jing.escasio','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,48,NULL,NULL,NULL),(98,'Roel',NULL,'Punongbayan','roel.punongbayan','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,48,NULL,NULL,NULL),(99,'Marjhon',NULL,'Rongavilla','marjhon.rongavilla','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,48,NULL,NULL,NULL),(100,'Myra',NULL,'Sideno','myra.sideno','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(101,'Samuel',NULL,'Galapon','samuel.galapon','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(102,'Carwena',NULL,'Alvarez','carwena.alvarez','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(103,'Maryann',NULL,'Evangelista','maryann.evangelista','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(104,'Abegail',NULL,'Sabanal','abegail.sabanal','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(105,'Froilan',NULL,'Retrita','froilan.retrita','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(106,'John',NULL,'Huang','john.huang','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(107,'Jeffry',NULL,'Flores','jeffry.flores','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(108,'Rozen',NULL,'Cano','rozen.cano','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL),(109,'Jc',NULL,'Magnaye','jc.magnaye','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,NULL,NULL,NULL,0,53,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_defined_fields`
--

DROP TABLE IF EXISTS `user_defined_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_defined_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_type_id` int(11) NOT NULL,
  `display_name` varchar(80) NOT NULL,
  `field_selector` varchar(80) NOT NULL,
  `required_flag` tinyint(1) DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `field_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_type_id` (`transaction_type_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_defined_fields`
--

LOCK TABLES `user_defined_fields` WRITE;
/*!40000 ALTER TABLE `user_defined_fields` DISABLE KEYS */;
INSERT INTO `user_defined_fields` VALUES (1,1,'Client Code','itemuserdefinedfield1',0,'2020-08-13 15:53:22',1,'2021-01-14 14:01:32',1,1),(2,1,'Field 2','itemuserdefinedfield2',0,'2020-08-13 15:53:22',1,NULL,NULL,2),(3,1,'Field 3','itemuserdefinedfield3',0,'2020-08-13 15:53:22',1,NULL,NULL,3),(4,1,'Field 4','itemuserdefinedfield4',0,'2020-08-13 15:53:22',1,NULL,NULL,4),(5,1,'Field 5','itemuserdefinedfield5',0,'2020-08-13 15:53:22',1,NULL,NULL,5),(6,9,'Field 1','clientuserdefinedfield1',0,'2020-08-13 15:53:22',1,'2020-08-26 16:17:42',1,1),(7,9,'Field 2','clientuserdefinedfield2',0,'2020-08-13 15:53:22',1,'2020-08-26 16:18:55',1,2),(8,9,'Field 3','clientuserdefinedfield3',0,'2020-08-13 15:53:22',1,'2020-08-26 16:16:59',1,3),(9,9,'Field 4','clientuserdefinedfield4',0,'2020-08-13 15:53:22',1,'2020-08-26 16:17:06',1,4),(10,9,'Field 5','clientuserdefinedfield5',0,'2020-08-13 15:53:22',1,'2020-08-26 16:17:46',1,5),(11,10,'Field 1','supplieruserdefinedfield1',0,'2020-08-13 15:53:22',1,'2020-08-30 16:02:27',1,1),(12,10,'Field 2','supplieruserdefinedfield2',0,'2020-08-13 15:53:22',1,'2020-08-30 16:00:30',1,2),(13,10,'Field 3','supplieruserdefinedfield3',0,'2020-08-13 15:53:22',1,'2020-08-30 16:02:33',1,3),(14,10,'Field 4','supplieruserdefinedfield4',0,'2020-08-13 15:53:22',1,'2020-08-30 16:02:36',1,4),(15,10,'Field 5','supplieruserdefinedfield5',0,'2020-08-13 15:53:22',1,'2020-08-30 16:00:25',1,5),(16,2,'Field 1','pouserdefinedfield1',0,'2020-08-13 15:53:22',1,NULL,NULL,1),(17,2,'Field 2','pouserdefinedfield2',0,'2020-08-13 15:53:22',1,NULL,NULL,2),(18,2,'Field Name Text Here','pouserdefinedfield3',0,'2020-08-13 15:53:22',1,'2020-08-20 10:53:52',1,3),(19,2,'Field 4','pouserdefinedfield4',0,'2020-08-13 15:53:22',1,NULL,NULL,4),(20,2,'Field 5','pouserdefinedfield5',0,'2020-08-13 15:53:22',1,NULL,NULL,5),(21,4,'Field 1','touserdefinedfield1',0,'2020-08-13 15:53:22',1,NULL,NULL,1),(22,4,'Field 2','touserdefinedfield2',0,'2020-08-13 15:53:22',1,NULL,NULL,2),(23,4,'Field 3','touserdefinedfield3',0,'2020-08-13 15:53:22',1,NULL,NULL,3),(24,4,'Field 4','touserdefinedfield4',0,'2020-08-13 15:53:22',1,NULL,NULL,4),(25,4,'Field 5','touserdefinedfield5',0,'2020-08-13 15:53:22',1,NULL,NULL,5),(26,8,'Field 1','pruserdefinedfield1',0,'2020-08-13 18:39:47',1,NULL,NULL,1),(27,8,'Field 2','pruserdefinedfield2',0,'2020-08-13 18:39:47',1,NULL,NULL,2),(28,8,'Field 3','pruserdefinedfield3',0,'2020-08-13 18:39:47',1,NULL,NULL,3),(29,8,'Field 4','pruserdefinedfield4',0,'2020-08-13 18:39:47',1,NULL,NULL,4),(30,8,'Field 5','pruserdefinedfield5',0,'2020-08-13 18:39:47',1,NULL,NULL,5),(31,7,'Field 1','souserdefinedfield1',0,'2020-08-13 18:39:47',1,NULL,NULL,1),(32,7,'Field 2','souserdefinedfield2',0,'2020-08-13 18:39:47',1,NULL,NULL,2),(33,7,'Field 3','souserdefinedfield3',0,'2020-08-13 18:39:47',1,NULL,NULL,3),(34,7,'Field 4','souserdefinedfield4',0,'2020-08-13 18:39:47',1,NULL,NULL,4),(35,7,'Field 5','souserdefinedfield5',0,'2020-08-13 18:39:47',1,NULL,NULL,5),(36,3,'Unloading Start Date & Time','rcvuserdefinedfield1',0,'2020-08-13 18:39:47',1,'2020-11-10 16:16:11',1,1),(37,3,'Unloading End Date & Time','rcvuserdefinedfield2',0,'2020-08-13 18:39:47',1,'2020-11-10 16:16:26',1,2),(38,3,'Seal No.','rcvuserdefinedfield3',0,'2020-08-13 18:39:47',1,'2020-11-16 13:57:10',1,3),(39,3,'Trucker','rcvuserdefinedfield4',0,'2020-08-13 18:39:47',1,'2020-11-16 13:57:22',1,4),(40,3,'Plate No.','rcvuserdefinedfield5',0,'2020-08-13 18:39:47',1,'2020-11-16 13:57:29',1,5),(41,6,'Container No.','issuserdefinedfield1',0,'2020-08-13 18:39:47',1,'2020-11-16 18:34:06',1,1),(42,6,'Loading Start','issuserdefinedfield2',0,'2020-08-13 18:39:47',1,'2020-11-16 18:34:23',1,2),(43,6,'Loading End','issuserdefinedfield3',0,'2020-08-13 18:39:47',1,'2020-11-16 18:34:36',1,3),(44,6,'Warehouse Checker','issuserdefinedfield4',0,'2020-08-13 18:39:47',1,'2020-11-16 18:34:58',1,4),(45,6,'TBD','issuserdefinedfield5',0,'2020-08-13 18:39:47',1,'2020-11-16 18:35:07',1,5),(46,3,'Driver','rcvuserdefinedfield6',0,'2020-11-16 14:42:53',NULL,NULL,NULL,6),(47,3,'Field 7','rcvuserdefinedfield7',0,'2020-11-16 14:42:53',NULL,NULL,NULL,7),(48,3,'Field 8','rcvuserdefinedfield8',0,'2020-11-16 14:42:53',NULL,NULL,NULL,8),(52,6,'Field 6','issuserdefinedfield6',0,'2020-11-21 16:37:05',NULL,NULL,NULL,6),(53,6,'Field 7','issuserdefinedfield7',0,'2020-11-21 16:37:05',NULL,NULL,NULL,7),(54,6,'Field 8','issuserdefinedfield8',0,'2020-11-21 16:37:05',NULL,NULL,NULL,8),(55,14,'Field 1','cdrcvuserdefinedfield1',0,'2021-03-25 06:35:24',1,NULL,NULL,1),(56,14,'Field 2','cdrcvuserdefinedfield2',0,'2021-03-25 06:35:24',1,NULL,NULL,2),(57,14,'Field 3','cdrcvuserdefinedfield3',0,'2021-03-25 06:35:24',1,NULL,NULL,3),(58,14,'Field 4','cdrcvuserdefinedfield4',0,'2021-03-25 06:35:24',1,NULL,NULL,4),(59,14,'Field 5','cdrcvuserdefinedfield5',0,'2021-03-25 06:35:24',1,NULL,NULL,5),(60,16,'Field 1','cdpkluserdefinedfield1',0,'2021-03-25 06:35:24',1,NULL,NULL,1),(61,16,'Field 2','cdpkluserdefinedfield2',0,'2021-03-25 06:35:24',1,NULL,NULL,2),(62,16,'Field 3','cdpkluserdefinedfield3',0,'2021-03-25 06:35:24',1,NULL,NULL,3),(63,16,'Field 4','cdpkluserdefinedfield4',0,'2021-03-25 06:35:24',1,NULL,NULL,4),(64,16,'Field 5','cdpkluserdefinedfield5',0,'2021-03-25 06:35:24',1,NULL,NULL,5),(65,14,'Field 1','cdrcvuserdefinedfield1',0,'2021-04-27 05:56:46',1,NULL,NULL,1),(66,14,'Field 2','cdrcvuserdefinedfield2',0,'2021-04-27 05:56:46',1,NULL,NULL,2),(67,14,'Field 3','cdrcvuserdefinedfield3',0,'2021-04-27 05:56:46',1,NULL,NULL,3),(68,14,'Field 4','cdrcvuserdefinedfield4',0,'2021-04-27 05:56:46',1,NULL,NULL,4),(69,14,'Field 5','cdrcvuserdefinedfield5',0,'2021-04-27 05:56:46',1,NULL,NULL,5),(70,16,'Field 1','cdpkluserdefinedfield1',0,'2021-04-27 05:56:47',1,NULL,NULL,1),(71,16,'Field 2','cdpkluserdefinedfield2',0,'2021-04-27 05:56:47',1,NULL,NULL,2),(72,16,'Field 3','cdpkluserdefinedfield3',0,'2021-04-27 05:56:47',1,NULL,NULL,3),(73,16,'Field 4','cdpkluserdefinedfield4',0,'2021-04-27 05:56:47',1,NULL,NULL,4),(74,16,'Field 5','cdpkluserdefinedfield5',0,'2021-04-27 05:56:47',1,NULL,NULL,5),(75,19,'Field 1','swuserdefinedfield1',0,'2023-05-21 18:15:21',1,NULL,NULL,1),(76,19,'Field 2','swuserdefinedfield2',0,'2023-05-21 18:15:21',1,NULL,NULL,2),(77,19,'Field 3','swuserdefinedfield3',0,'2023-05-21 18:15:21',1,NULL,NULL,3),(78,19,'Field 4','swuserdefinedfield4',0,'2023-05-21 18:15:21',1,NULL,NULL,4),(79,19,'Field 5','swuserdefinedfield5',0,'2023-05-21 18:15:21',1,NULL,NULL,5);
/*!40000 ALTER TABLE `user_defined_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,'DATA MASTER','DATA MASTER','2018-06-21 20:13:06',1,'2018-06-22 00:35:18',1),(2,'PICKER','PICKER','2018-06-21 20:13:39',1,NULL,NULL),(3,'WAREHOUSE','WAREHOUSE','2019-12-16 10:27:45',1,'2019-12-18 14:33:38',17),(4,'ADMIN','ADMIN','2021-02-11 10:47:44',1,NULL,NULL),(5,'PO','Purchasing','2023-07-11 13:48:07',1,NULL,NULL),(6,'RM','Raw Materials','2023-07-11 15:26:29',1,NULL,NULL);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_rights`
--

DROP TABLE IF EXISTS `user_group_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_rights` (
  `user_group_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_group_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_rights`
--

LOCK TABLES `user_group_rights` WRITE;
/*!40000 ALTER TABLE `user_group_rights` DISABLE KEYS */;
INSERT INTO `user_group_rights` VALUES (1,'#configuration-menu'),(1,'#systemlog-menu'),(1,'#transactiontype-menu'),(1,'#usergroup-menu'),(1,'.addusergroupbtn'),(1,'.deleteusergroupbtn'),(1,'.editusergroupbtn'),(1,'viewusergroup'),(4,'#configuration-menu'),(4,'#system-section'),(4,'#systemlog-menu'),(4,'#transactiontype-menu'),(4,'#user-menu'),(4,'#usergroup-menu'),(4,'.adduserbtn'),(4,'.addusergroupbtn'),(4,'.deleteuserbtn'),(4,'.deleteusergroupbtn'),(4,'.edituserbtn'),(4,'.editusergroupbtn'),(4,'.resetpasswordbtn'),(4,'viewuser'),(4,'viewusergroup'),(5,'#brand-menu'),(5,'#category-menu'),(5,'#cdbinlocation-menu'),(5,'#cdinventory-menu'),(5,'#cdloadplan-menu'),(5,'#cdloadplan-trans-postbtn'),(5,'#cdloadplan-trans-unpostbtn'),(5,'#cdloadplantransaction-enableeditbtn'),(5,'#cdpicklist-menu'),(5,'#cdpicklist-trans-postbtn'),(5,'#cdpicklist-trans-unpostbtn'),(5,'#cdpicklisttransaction-enableeditbtn'),(5,'#cdposummaryreport-menu'),(5,'#cdpurchaseorder-menu'),(5,'#cdpurchaseorder-trans-postbtn'),(5,'#cdpurchaseorder-trans-unpostbtn'),(5,'#cdreceiving-menu'),(5,'#cdreceiving-trans-postbtn'),(5,'#cdreceiving-trans-unpostbtn'),(5,'#cdreceivingtransaction-enableeditbtn'),(5,'#cdshipment-menu'),(5,'#cdshipmenttransaction-enableeditbtn'),(5,'#cdshipmenttransaction-trans-postbtn'),(5,'#cdshipmenttransaction-trans-unpostbtn'),(5,'#cdtrf-menu'),(5,'#cdtrf-trans-postbtn'),(5,'#cdtrf-trans-unpostbtn'),(5,'#charges-menu'),(5,'#clientgroup-menu'),(5,'#configuration-menu'),(5,'#costing-menu'),(5,'#costing-trans-addbtn'),(5,'#costing-trans-deletebtn'),(5,'#crossdock-section'),(5,'#currency-menu'),(5,'#disposition-menu'),(5,'#location-menu'),(5,'#modeoftransport-menu'),(5,'#origin-menu'),(5,'#packaging-menu'),(5,'#picking-menu'),(5,'#picking-trans-addbtn'),(5,'#pickinggroup-menu'),(5,'#picklist-menu'),(5,'#picklist-trans-editbtn'),(5,'#picklist-trans-newbtn'),(5,'#picklist-trans-postbtn'),(5,'#picklist-trans-printbtn'),(5,'#picklist-trans-unpostbtn'),(5,'#picklist-trans-viewlogbtn'),(5,'#picklist-trans-voidbtn'),(5,'#purchasereturn-menu'),(5,'#purchasereturn-trans-closebtn'),(5,'#purchasereturn-trans-editbtn'),(5,'#purchasereturn-trans-newbtn'),(5,'#purchasereturn-trans-postbtn'),(5,'#purchasereturn-trans-printbtn'),(5,'#purchasereturn-trans-unclosebtn'),(5,'#purchasereturn-trans-unpostbtn'),(5,'#purchasereturn-trans-viewlogbtn'),(5,'#purchasereturn-trans-voidbtn'),(5,'#putaway-trans-addbtn'),(5,'#reclass-menu'),(5,'#reclass-trans-editbtn'),(5,'#reclass-trans-newbtn'),(5,'#reclass-trans-postbtn'),(5,'#reclass-trans-printbtn'),(5,'#reclass-trans-viewlogbtn'),(5,'#reclass-trans-voidbtn'),(5,'#salesorder-menu'),(5,'#salesorder-trans-closebtn'),(5,'#salesorder-trans-editbtn'),(5,'#salesorder-trans-newbtn'),(5,'#salesorder-trans-postbtn'),(5,'#salesorder-trans-printbtn'),(5,'#salesorder-trans-unclosebtn'),(5,'#salesorder-trans-unpostbtn'),(5,'#salesorder-trans-viewlogbtn'),(5,'#salesorder-trans-voidbtn'),(5,'#salesrepresentative-menu'),(5,'#shipmentterms-menu'),(5,'#shippinggroup-menu'),(5,'#skutype-menu'),(5,'#stockadjustment-menu'),(5,'#stockadjustment-trans-editbtn'),(5,'#stockadjustment-trans-newbtn'),(5,'#stockadjustment-trans-postbtn'),(5,'#stockadjustment-trans-printbtn'),(5,'#stockadjustment-trans-viewlogbtn'),(5,'#stockadjustment-trans-voidbtn'),(5,'#stockissuance-menu'),(5,'#stockissuance-trans-deliveredbtn'),(5,'#stockissuance-trans-dispatchbtn'),(5,'#stockissuance-trans-editbtn'),(5,'#stockissuance-trans-printbtn'),(5,'#stockissuance-trans-viewlogbtn'),(5,'#stockissuance-trans-voidbtn'),(5,'#stockreceipt-trans-adddiscountbtn'),(5,'#stockreceipt-trans-closebtn'),(5,'#stockreceipt-trans-editbtn'),(5,'#stockreceipt-trans-newbtn'),(5,'#stockreceipt-trans-postbtn'),(5,'#stockreceipt-trans-printbtn'),(5,'#stockreceipt-trans-unclosebtn'),(5,'#stockreceipt-trans-unpostbtn'),(5,'#stockreceipt-trans-viewlogbtn'),(5,'#stockreceipt-trans-voidbtn'),(5,'#subcategory1-menu'),(5,'#subcategory2-menu'),(5,'#suppliergroup-menu'),(5,'#system-section'),(5,'#systemlog-menu'),(5,'#transactiontype-menu'),(5,'#transferorder-menu'),(5,'#transferorder-trans-closebtn'),(5,'#transferorder-trans-editbtn'),(5,'#transferorder-trans-newbtn'),(5,'#transferorder-trans-postbtn'),(5,'#transferorder-trans-printbtn'),(5,'#transferorder-trans-unclosebtn'),(5,'#transferorder-trans-unpostbtn'),(5,'#transferorder-trans-viewlogbtn'),(5,'#transferorder-trans-voidbtn'),(5,'#trucking-menu'),(5,'#unitofmeasure-menu'),(5,'#user-menu'),(5,'#usergroup-menu'),(5,'#vehicletype-menu'),(5,'#xshp-trans-editbtn'),(5,'#zone-menu'),(5,'.addbrandbtn'),(5,'.addcategorybtn'),(5,'.addcdloadplanheaderbtn'),(5,'.addcdpicklistheaderbtn'),(5,'.addcdpurchaseorderdetailsbtn'),(5,'.addcdreceivingheaderbtn'),(5,'.addcdshipmentheaderbtn'),(5,'.addcdtrfdetailsbtn'),(5,'.addchargesbtn'),(5,'.addclientgroupbtn'),(5,'.addcostingrcvbtn'),(5,'.addcurrencybtn'),(5,'.adddispositionbtn'),(5,'.addlocationbtn'),(5,'.addmodeoftransportbtn'),(5,'.addoriginbtn'),(5,'.addpackagingbtn'),(5,'.addpickinggroupbtn'),(5,'.addsalesrepresentativebtn'),(5,'.addshipmenttermsbtn'),(5,'.addshippinggroupbtn'),(5,'.addskutypebtn'),(5,'.addsubcategory1btn'),(5,'.addsubcategory2btn'),(5,'.addsuppliergroupbtn'),(5,'.addtruckingbtn'),(5,'.addunitofmeasurebtn'),(5,'.adduserbtn'),(5,'.addusergroupbtn'),(5,'.addvehicletypebtn'),(5,'.addzonebtn'),(5,'.cdloadplan-trans-printbtn'),(5,'.cdloadplan-trans-voidbtn'),(5,'.cdpicklist-trans-printbtn'),(5,'.cdpicklist-trans-voidbtn'),(5,'.cdpurchaseorder-trans-editbtn'),(5,'.cdpurchaseorder-trans-printbtn'),(5,'.cdreceiving-trans-printbtn'),(5,'.cdreceiving-trans-voidbtn'),(5,'.cdshipmenttransaction-trans-printbtn'),(5,'.cdshipmenttransaction-trans-updatestatusbtn'),(5,'.cdshipmenttransaction-trans-voidbtn'),(5,'.cdtrf-trans-editbtn'),(5,'.cdtrf-trans-printbtn'),(5,'.deletebrandbtn'),(5,'.deletecategorybtn'),(5,'.deletechargesbtn'),(5,'.deleteclientgroupbtn'),(5,'.deletecostingrcvbtn'),(5,'.deletecurrencybtn'),(5,'.deletedispositionbtn'),(5,'.deletelocationbtn'),(5,'.deletemodeoftransportbtn'),(5,'.deleteoriginbtn'),(5,'.deletepackagingbtn'),(5,'.deletepickinggroupbtn'),(5,'.deletesalesrepresentativebtn'),(5,'.deleteshipmenttermsbtn'),(5,'.deleteshippinggroupbtn'),(5,'.deleteskutypebtn'),(5,'.deletesubcategory1btn'),(5,'.deletesubcategory2btn'),(5,'.deletesuppliergroupbtn'),(5,'.deletetruckingbtn'),(5,'.deleteunitofmeasurebtn'),(5,'.deleteuserbtn'),(5,'.deleteusergroupbtn'),(5,'.deletevehicletypebtn'),(5,'.deletezonebtn'),(5,'.editbrandbtn'),(5,'.editcategorybtn'),(5,'.editchargesbtn'),(5,'.editclientgroupbtn'),(5,'.editcostingbtn'),(5,'.editcostingrcvbtn'),(5,'.editcurrencybtn'),(5,'.editdispositionbtn'),(5,'.editlocationbtn'),(5,'.editmodeoftransportbtn'),(5,'.editoriginbtn'),(5,'.editpackagingbtn'),(5,'.editpickinggroupbtn'),(5,'.editsalesrepresentativebtn'),(5,'.editshipmenttermsbtn'),(5,'.editshippinggroupbtn'),(5,'.editskutypebtn'),(5,'.editsubcategory1btn'),(5,'.editsubcategory2btn'),(5,'.editsuppliergroupbtn'),(5,'.edittruckingbtn'),(5,'.editunitofmeasurebtn'),(5,'.edituserbtn'),(5,'.editusergroupbtn'),(5,'.editvehicletypebtn'),(5,'.editzonebtn'),(5,'.picking-trans-deletebtn'),(5,'.putaway-trans-deletebtn'),(5,'.resetpasswordbtn'),(5,'.stockreceiptcostingdetail-editbtn'),(5,'.transferitembtn'),(5,'.txnpcklreservationdetail-editbtn'),(5,'.viewcdloadplansystemlogbtn'),(5,'.viewcdpicklistsystemlogbtn'),(5,'.viewcdpurchaseordersystemlogbtn'),(5,'.viewcdreceivingsystemlogbtn'),(5,'.viewcdshipmentsystemlogbtn'),(5,'.viewcdtrfsystemlogbtn'),(5,'.voidcdpurchaseorderdetailsbtn'),(5,'.voidcdtrfdetailsbtn'),(5,'cdloadplan-otheruserstransaction'),(5,'cdpicklist-otheruserstransaction'),(5,'cdpurchaseorder-otheruserstransaction'),(5,'cdreceiving-otheruserstransaction'),(5,'cdshipment-otheruserstransaction'),(5,'cdtrf-otheruserstransaction'),(5,'picking-otheruserstransaction'),(5,'picklist-otheruserstransaction'),(5,'purchasereturn-otheruserstransaction'),(5,'putaway-otheruserstransaction'),(5,'reclass-otheruserstransaction'),(5,'salesorder-otheruserstransaction'),(5,'stockadjustment-otheruserstransaction'),(5,'stockissuance-otheruserstransaction'),(5,'stockreceipt-otheruserstransaction'),(5,'transferorder-otheruserstransaction'),(5,'viewbrand'),(5,'viewcategory'),(5,'viewcharges'),(5,'viewclientgroup'),(5,'viewcosting'),(5,'viewcurrency'),(5,'viewdisposition'),(5,'vieworigin'),(5,'viewpackaging'),(5,'viewpicking'),(5,'viewpickinggroup'),(5,'viewpicklist'),(5,'viewport'),(5,'viewpurchasereturn'),(5,'viewrcvcosting'),(5,'viewreclass'),(5,'viewroute'),(5,'viewsalesorder'),(5,'viewsalesrepresentative'),(5,'viewshipmentterms'),(5,'viewshipper'),(5,'viewshippinggroup'),(5,'viewskutype'),(5,'viewstockadjustment'),(5,'viewstockissuance'),(5,'viewsubcategory1'),(5,'viewsubcategory2'),(5,'viewsuppliergroup'),(5,'viewtransferorder'),(5,'viewtrucking'),(5,'viewunitofmeasure'),(5,'viewuser'),(5,'viewusergroup'),(5,'viewxbinassignment'),(5,'viewxinv'),(5,'viewxlp'),(5,'viewxpkl'),(5,'viewxposummaryreport'),(5,'viewxpurchaseorder'),(5,'viewxrcv'),(5,'viewxshp'),(5,'viewxtrf'),(5,'viewzone'),(6,'#cdbinlocation-menu'),(6,'#cdinventory-menu'),(6,'#cdloadplan-menu'),(6,'#cdloadplan-trans-postbtn'),(6,'#cdloadplan-trans-unpostbtn'),(6,'#cdloadplantransaction-enableeditbtn'),(6,'#cdpicklist-menu'),(6,'#cdpicklist-trans-postbtn'),(6,'#cdpicklist-trans-unpostbtn'),(6,'#cdpicklisttransaction-enableeditbtn'),(6,'#cdposummaryreport-menu'),(6,'#cdpurchaseorder-menu'),(6,'#cdpurchaseorder-trans-postbtn'),(6,'#cdpurchaseorder-trans-unpostbtn'),(6,'#cdreceiving-menu'),(6,'#cdreceiving-trans-postbtn'),(6,'#cdreceiving-trans-unpostbtn'),(6,'#cdreceivingtransaction-enableeditbtn'),(6,'#cdshipment-menu'),(6,'#cdshipmenttransaction-enableeditbtn'),(6,'#cdshipmenttransaction-trans-postbtn'),(6,'#cdshipmenttransaction-trans-unpostbtn'),(6,'#cdtrf-menu'),(6,'#cdtrf-trans-postbtn'),(6,'#cdtrf-trans-unpostbtn'),(6,'#configuration-menu'),(6,'#crossdock-section'),(6,'#system-section'),(6,'#systemlog-menu'),(6,'#transactiontype-menu'),(6,'#user-menu'),(6,'#usergroup-menu'),(6,'#xshp-trans-editbtn'),(6,'.addcdloadplanheaderbtn'),(6,'.addcdpicklistheaderbtn'),(6,'.addcdpurchaseorderdetailsbtn'),(6,'.addcdreceivingheaderbtn'),(6,'.addcdshipmentheaderbtn'),(6,'.addcdtrfdetailsbtn'),(6,'.adduserbtn'),(6,'.addusergroupbtn'),(6,'.cdloadplan-trans-printbtn'),(6,'.cdloadplan-trans-voidbtn'),(6,'.cdpicklist-trans-printbtn'),(6,'.cdpicklist-trans-voidbtn'),(6,'.cdpurchaseorder-trans-editbtn'),(6,'.cdpurchaseorder-trans-printbtn'),(6,'.cdreceiving-trans-printbtn'),(6,'.cdreceiving-trans-voidbtn'),(6,'.cdshipmenttransaction-trans-printbtn'),(6,'.cdshipmenttransaction-trans-updatestatusbtn'),(6,'.cdshipmenttransaction-trans-voidbtn'),(6,'.cdtrf-trans-editbtn'),(6,'.cdtrf-trans-printbtn'),(6,'.deleteuserbtn'),(6,'.deleteusergroupbtn'),(6,'.edituserbtn'),(6,'.editusergroupbtn'),(6,'.resetpasswordbtn'),(6,'.transferitembtn'),(6,'.viewcdloadplansystemlogbtn'),(6,'.viewcdpicklistsystemlogbtn'),(6,'.viewcdpurchaseordersystemlogbtn'),(6,'.viewcdreceivingsystemlogbtn'),(6,'.viewcdshipmentsystemlogbtn'),(6,'.viewcdtrfsystemlogbtn'),(6,'.voidcdpurchaseorderdetailsbtn'),(6,'.voidcdtrfdetailsbtn'),(6,'cdloadplan-otheruserstransaction'),(6,'cdpicklist-otheruserstransaction'),(6,'cdpurchaseorder-otheruserstransaction'),(6,'cdreceiving-otheruserstransaction'),(6,'cdshipment-otheruserstransaction'),(6,'cdtrf-otheruserstransaction'),(6,'viewuser'),(6,'viewusergroup'),(6,'viewxbinassignment'),(6,'viewxinv'),(6,'viewxlp'),(6,'viewxpkl'),(6,'viewxposummaryreport'),(6,'viewxpurchaseorder'),(6,'viewxrcv'),(6,'viewxshp'),(6,'viewxtrf');
/*!40000 ALTER TABLE `user_group_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rights`
--

DROP TABLE IF EXISTS `user_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rights` (
  `user_id` int(11) NOT NULL,
  `menu_id` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rights`
--

LOCK TABLES `user_rights` WRITE;
/*!40000 ALTER TABLE `user_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_warehouse`
--

DROP TABLE IF EXISTS `user_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_warehouse` (
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`warehouse_id`),
  KEY `location_id` (`warehouse_id`),
  CONSTRAINT `user_warehouse_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_warehouse_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_warehouse`
--

LOCK TABLES `user_warehouse` WRITE;
/*!40000 ALTER TABLE `user_warehouse` DISABLE KEYS */;
INSERT INTO `user_warehouse` VALUES (1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(92,48),(92,49),(92,50),(92,51),(92,52),(93,48),(93,49),(93,50),(93,51),(93,52),(94,48),(94,49),(94,50),(94,51),(94,52),(96,49),(97,49),(98,49),(99,49),(100,48),(100,49),(100,50),(100,51),(100,52),(101,48),(101,49),(101,50),(101,51),(101,52),(102,48),(102,49),(102,50),(102,51),(102,52),(103,48),(103,49),(103,50),(103,51),(103,52),(104,48),(104,49),(104,50),(104,51),(104,52),(105,48),(105,49),(105,50),(105,51),(105,52),(106,48),(106,49),(106,50),(106,51),(106,52),(108,48),(108,49),(108,50),(108,51),(108,52),(109,48),(109,49),(109,50),(109,51),(109,52);
/*!40000 ALTER TABLE `user_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_booking`
--

DROP TABLE IF EXISTS `v_booking`;
/*!50001 DROP VIEW IF EXISTS `v_booking`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_booking` (
  `ID` tinyint NOT NULL,
  `SapCode` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `CS_Available` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_booking_cs`
--

DROP TABLE IF EXISTS `v_booking_cs`;
/*!50001 DROP VIEW IF EXISTS `v_booking_cs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_booking_cs` (
  `ID` tinyint NOT NULL,
  `SapCode` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `CS_Available` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_checking_details`
--

DROP TABLE IF EXISTS `v_checking_details`;
/*!50001 DROP VIEW IF EXISTS `v_checking_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_checking_details` (
  `Picking` tinyint NOT NULL,
  `CheckingID` tinyint NOT NULL,
  `Code` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `DisplayQty` tinyint NOT NULL,
  `Qty` tinyint NOT NULL,
  `Lot` tinyint NOT NULL,
  `Expiry` tinyint NOT NULL,
  `TimeStamp` tinyint NOT NULL,
  `CheckedBy` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_checking_required`
--

DROP TABLE IF EXISTS `v_checking_required`;
/*!50001 DROP VIEW IF EXISTS `v_checking_required`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_checking_required` (
  `pon` tinyint NOT NULL,
  `iid` tinyint NOT NULL,
  `icode` tinyint NOT NULL,
  `iname` tinyint NOT NULL,
  `required` tinyint NOT NULL,
  `Lot` tinyint NOT NULL,
  `Expiry` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_checking_summary`
--

DROP TABLE IF EXISTS `v_checking_summary`;
/*!50001 DROP VIEW IF EXISTS `v_checking_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_checking_summary` (
  `Picking Number` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `CODE` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `Barcode` tinyint NOT NULL,
  `LOT` tinyint NOT NULL,
  `EXPIRY` tinyint NOT NULL,
  `Checked` tinyint NOT NULL,
  `Required` tinyint NOT NULL,
  `Remaining` tinyint NOT NULL,
  `Rem` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_cycle_headers`
--

DROP TABLE IF EXISTS `v_cycle_headers`;
/*!50001 DROP VIEW IF EXISTS `v_cycle_headers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_cycle_headers` (
  `warehouse` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `cycle_count_number` tinyint NOT NULL,
  `remarks` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_getreservedqty`
--

DROP TABLE IF EXISTS `v_getreservedqty`;
/*!50001 DROP VIEW IF EXISTS `v_getreservedqty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_getreservedqty` (
  `status` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `loc_description` tinyint NOT NULL,
  `item_id` tinyint NOT NULL,
  `picklist_number` tinyint NOT NULL,
  `itm_reference` tinyint NOT NULL,
  `reserved_quantity` tinyint NOT NULL,
  `picked_quantity` tinyint NOT NULL,
  `itm_name` tinyint NOT NULL,
  `uom_id` tinyint NOT NULL,
  `code` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_inquiry`
--

DROP TABLE IF EXISTS `v_inquiry`;
/*!50001 DROP VIEW IF EXISTS `v_inquiry`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_inquiry` (
  `Location` tinyint NOT NULL,
  `Item` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Lot` tinyint NOT NULL,
  `Expiry` tinyint NOT NULL,
  `Inventory` tinyint NOT NULL,
  `Barcode` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_item_bal_booking`
--

DROP TABLE IF EXISTS `v_item_bal_booking`;
/*!50001 DROP VIEW IF EXISTS `v_item_bal_booking`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_item_bal_booking` (
  `itm_name` tinyint NOT NULL,
  `itm_reference` tinyint NOT NULL,
  `item_id` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `uom_id` tinyint NOT NULL,
  `totalqty` tinyint NOT NULL,
  `lot_number` tinyint NOT NULL,
  `expiry_date` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `loc_code` tinyint NOT NULL,
  `loc_description` tinyint NOT NULL,
  `warehouse_name` tinyint NOT NULL,
  `totalreservedquantity` tinyint NOT NULL,
  `totalpickedquantity` tinyint NOT NULL,
  `on_hold` tinyint NOT NULL,
  `classification` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_item_bal_booking_inv`
--

DROP TABLE IF EXISTS `v_item_bal_booking_inv`;
/*!50001 DROP VIEW IF EXISTS `v_item_bal_booking_inv`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_item_bal_booking_inv` (
  `warehouse_id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `lot_number` tinyint NOT NULL,
  `item_id` tinyint NOT NULL,
  `uom_id` tinyint NOT NULL,
  `expiry_date` tinyint NOT NULL,
  `stockqty` tinyint NOT NULL,
  `on_hold` tinyint NOT NULL,
  `classification` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_item_bal_booking_pi`
--

DROP TABLE IF EXISTS `v_item_bal_booking_pi`;
/*!50001 DROP VIEW IF EXISTS `v_item_bal_booking_pi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_item_bal_booking_pi` (
  `warehouse_id` tinyint NOT NULL,
  `warehouse_name` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `loc_code` tinyint NOT NULL,
  `loc_description` tinyint NOT NULL,
  `lot_number` tinyint NOT NULL,
  `expiry_date` tinyint NOT NULL,
  `itm_name` tinyint NOT NULL,
  `itm_reference` tinyint NOT NULL,
  `item_id` tinyint NOT NULL,
  `uom_id` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `stockqty` tinyint NOT NULL,
  `totalreservedqty` tinyint NOT NULL,
  `totalpickedqty` tinyint NOT NULL,
  `on_hold` tinyint NOT NULL,
  `classification` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_item_bal_booking_res`
--

DROP TABLE IF EXISTS `v_item_bal_booking_res`;
/*!50001 DROP VIEW IF EXISTS `v_item_bal_booking_res`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_item_bal_booking_res` (
  `item_id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `lot_number` tinyint NOT NULL,
  `expiry_date` tinyint NOT NULL,
  `totalreservedqty` tinyint NOT NULL,
  `totalpickedqty` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_loading_details`
--

DROP TABLE IF EXISTS `v_loading_details`;
/*!50001 DROP VIEW IF EXISTS `v_loading_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_loading_details` (
  `ID` tinyint NOT NULL,
  `Pckl` tinyint NOT NULL,
  `Issn` tinyint NOT NULL,
  `Item` tinyint NOT NULL,
  `Code` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Load` tinyint NOT NULL,
  `User` tinyint NOT NULL,
  `TimeStamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_loading_headers`
--

DROP TABLE IF EXISTS `v_loading_headers`;
/*!50001 DROP VIEW IF EXISTS `v_loading_headers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_loading_headers` (
  `picklist` tinyint NOT NULL,
  `issuances` tinyint NOT NULL,
  `references` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `remarks` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_loading_required`
--

DROP TABLE IF EXISTS `v_loading_required`;
/*!50001 DROP VIEW IF EXISTS `v_loading_required`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_loading_required` (
  `picklist_number` tinyint NOT NULL,
  `issuance_number` tinyint NOT NULL,
  `item` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `barcode` tinyint NOT NULL,
  `req` tinyint NOT NULL,
  `lot` tinyint NOT NULL,
  `expiry` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_picklist_details`
--

DROP TABLE IF EXISTS `v_picklist_details`;
/*!50001 DROP VIEW IF EXISTS `v_picklist_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_picklist_details` (
  `Picklist` tinyint NOT NULL,
  `Picking` tinyint NOT NULL,
  `Item` tinyint NOT NULL,
  `Code` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `UOM` tinyint NOT NULL,
  `Qty` tinyint NOT NULL,
  `DisplayQty` tinyint NOT NULL,
  `Loc` tinyint NOT NULL,
  `DisplayLoc` tinyint NOT NULL,
  `Lot` tinyint NOT NULL,
  `Expiry` tinyint NOT NULL,
  `DisplayExpiry` tinyint NOT NULL,
  `Timestamp` tinyint NOT NULL,
  `PickedBy` tinyint NOT NULL,
  `PickingID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_picklist_headers`
--

DROP TABLE IF EXISTS `v_picklist_headers`;
/*!50001 DROP VIEW IF EXISTS `v_picklist_headers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_picklist_headers` (
  `picklist_number` tinyint NOT NULL,
  `picklist_header_id` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `clients` tinyint NOT NULL,
  `SOs` tinyint NOT NULL,
  `warehouses` tinyint NOT NULL,
  `TOs` tinyint NOT NULL,
  `suppliers` tinyint NOT NULL,
  `PRs` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `ware` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_picklist_summary`
--

DROP TABLE IF EXISTS `v_picklist_summary`;
/*!50001 DROP VIEW IF EXISTS `v_picklist_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_picklist_summary` (
  `pckl` tinyint NOT NULL,
  `item` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `loc` tinyint NOT NULL,
  `lot` tinyint NOT NULL,
  `expiry` tinyint NOT NULL,
  `barcode` tinyint NOT NULL,
  `Reserved` tinyint NOT NULL,
  `Picked` tinyint NOT NULL,
  `Remaining` tinyint NOT NULL,
  `BaseRem` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `brand` tinyint NOT NULL,
  `divs` tinyint NOT NULL,
  `subdiv` tinyint NOT NULL,
  `market` tinyint NOT NULL,
  `sector` tinyint NOT NULL,
  `mattype` tinyint NOT NULL,
  `expiryDisplay` tinyint NOT NULL,
  `WholeFlag` tinyint NOT NULL,
  `LooseFlag` tinyint NOT NULL,
  `locid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_picklist_whole_loose`
--

DROP TABLE IF EXISTS `v_picklist_whole_loose`;
/*!50001 DROP VIEW IF EXISTS `v_picklist_whole_loose`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_picklist_whole_loose` (
  `picklist_number` tinyint NOT NULL,
  `itm_reference` tinyint NOT NULL,
  `itm_name` tinyint NOT NULL,
  `loc_code` tinyint NOT NULL,
  `lot_number` tinyint NOT NULL,
  `expiry` tinyint NOT NULL,
  `Whole` tinyint NOT NULL,
  `Loose` tinyint NOT NULL,
  `Base` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_putaway_details`
--

DROP TABLE IF EXISTS `v_putaway_details`;
/*!50001 DROP VIEW IF EXISTS `v_putaway_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_putaway_details` (
  `rcvn` tinyint NOT NULL,
  `psID` tinyint NOT NULL,
  `item` tinyint NOT NULL,
  `loc` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `stored` tinyint NOT NULL,
  `lot` tinyint NOT NULL,
  `expiry` tinyint NOT NULL,
  `storedby` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_putaway_summary`
--

DROP TABLE IF EXISTS `v_putaway_summary`;
/*!50001 DROP VIEW IF EXISTS `v_putaway_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_putaway_summary` (
  `rcvn` tinyint NOT NULL,
  `item` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `barcode` tinyint NOT NULL,
  `lot` tinyint NOT NULL,
  `expiry` tinyint NOT NULL,
  `received` tinyint NOT NULL,
  `stored` tinyint NOT NULL,
  `remaining` tinyint NOT NULL,
  `baserem` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_receiving_details`
--

DROP TABLE IF EXISTS `v_receiving_details`;
/*!50001 DROP VIEW IF EXISTS `v_receiving_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_receiving_details` (
  `rcvn` tinyint NOT NULL,
  `srdID` tinyint NOT NULL,
  `item` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `received` tinyint NOT NULL,
  `lot` tinyint NOT NULL,
  `expiry` tinyint NOT NULL,
  `receivedby` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_receiving_summary_po`
--

DROP TABLE IF EXISTS `v_receiving_summary_po`;
/*!50001 DROP VIEW IF EXISTS `v_receiving_summary_po`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_receiving_summary_po` (
  `PONumber` tinyint NOT NULL,
  `ItemID` tinyint NOT NULL,
  `Item` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Barcode` tinyint NOT NULL,
  `Required` tinyint NOT NULL,
  `Received` tinyint NOT NULL,
  `Remaining` tinyint NOT NULL,
  `BaseRem` tinyint NOT NULL,
  `ExpiryFlag` tinyint NOT NULL,
  `shelf_life` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_receiving_summary_to`
--

DROP TABLE IF EXISTS `v_receiving_summary_to`;
/*!50001 DROP VIEW IF EXISTS `v_receiving_summary_to`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_receiving_summary_to` (
  `ISSNumber` tinyint NOT NULL,
  `ItemID` tinyint NOT NULL,
  `Item` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Barcode` tinyint NOT NULL,
  `Required` tinyint NOT NULL,
  `Received` tinyint NOT NULL,
  `Remaining` tinyint NOT NULL,
  `BaseRem` tinyint NOT NULL,
  `ExpiryFlag` tinyint NOT NULL,
  `shelf_life` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_required_po`
--

DROP TABLE IF EXISTS `v_required_po`;
/*!50001 DROP VIEW IF EXISTS `v_required_po`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_required_po` (
  `PONumber` tinyint NOT NULL,
  `ItemID` tinyint NOT NULL,
  `Item` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `ExpiryFlag` tinyint NOT NULL,
  `shelf_life` tinyint NOT NULL,
  `BaseQty` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_required_rcv`
--

DROP TABLE IF EXISTS `v_required_rcv`;
/*!50001 DROP VIEW IF EXISTS `v_required_rcv`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_required_rcv` (
  `rcvn` tinyint NOT NULL,
  `item` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `barcode` tinyint NOT NULL,
  `lot` tinyint NOT NULL,
  `expiry` tinyint NOT NULL,
  `received` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_required_to`
--

DROP TABLE IF EXISTS `v_required_to`;
/*!50001 DROP VIEW IF EXISTS `v_required_to`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_required_to` (
  `ISSNumber` tinyint NOT NULL,
  `ItemID` tinyint NOT NULL,
  `Item` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `ExpiryFlag` tinyint NOT NULL,
  `shelf_life` tinyint NOT NULL,
  `BaseQty` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_tw_copy`
--

DROP TABLE IF EXISTS `v_tw_copy`;
/*!50001 DROP VIEW IF EXISTS `v_tw_copy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_tw_copy` (
  `picklist_number` tinyint NOT NULL,
  `itm_reference` tinyint NOT NULL,
  `itm_name` tinyint NOT NULL,
  `Qty CS` tinyint NOT NULL,
  `CS` tinyint NOT NULL,
  `Qty IT` tinyint NOT NULL,
  `IT` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vdispatchqty`
--

DROP TABLE IF EXISTS `vdispatchqty`;
/*!50001 DROP VIEW IF EXISTS `vdispatchqty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vdispatchqty` (
  `issuance_number` tinyint NOT NULL,
  `item_id` tinyint NOT NULL,
  `itm_reference` tinyint NOT NULL,
  `itm_name` tinyint NOT NULL,
  `issued_qty` tinyint NOT NULL,
  `item_qty` tinyint NOT NULL,
  `code` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES (1,'10 WHEELER TRUCK','10 WHEELER TRUCK','2020-06-10 10:37:19',1,NULL,NULL,1),(2,'VAN','VAN','2020-06-10 10:37:29',1,NULL,NULL,1),(3,'AUV','AUV','2020-06-10 10:37:34',1,NULL,NULL,1),(4,'2 TONNER','2 TONNER','2020-11-16 15:59:30',1,NULL,NULL,1),(5,'4 WHEELER TRUCK','4 WHEELER TRUCK','2021-03-11 14:09:53',6,NULL,NULL,1),(6,'6 WHEELER TRUCK','6 WHEELER TRUCK','2021-03-11 14:10:03',6,NULL,NULL,1),(7,'6W FORWARD','6W FORWARD','2021-04-15 08:00:32',8,'2021-04-15 08:01:47',8,1),(8,'40 FTR','40 FTR','2021-09-08 22:54:35',5,'2022-02-18 15:49:06',4,1),(9,'20 FTR','20 FTR','2022-05-07 04:25:40',5,NULL,NULL,1),(10,'MOTOR','MOTOR','2022-09-12 10:39:00',7,NULL,NULL,1),(11,'8TONS','8TONS','2023-03-15 04:16:02',6,NULL,NULL,1);
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vgetpicking_balance`
--

DROP TABLE IF EXISTS `vgetpicking_balance`;
/*!50001 DROP VIEW IF EXISTS `vgetpicking_balance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vgetpicking_balance` (
  `item_id` tinyint NOT NULL,
  `picklist_number` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `lot_number` tinyint NOT NULL,
  `reserved_quantity` tinyint NOT NULL,
  `picked_quantity` tinyint NOT NULL,
  `pickbalance` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `warehouse_type_id` int(11) DEFAULT NULL,
  `auto_putaway_flag` tinyint(1) NOT NULL DEFAULT '0',
  `default_location_id` int(11) DEFAULT NULL,
  `street` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `district` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `pallet_prefix` varchar(30) DEFAULT NULL,
  `pallet_number_series` int(11) NOT NULL DEFAULT '1',
  `stock_adjustment_approver_id` int(11) DEFAULT NULL,
  `mpo_default_bin_location_id` int(11) DEFAULT NULL,
  `rpo_default_bin_location_id` int(11) DEFAULT NULL,
  `generate_receiving_upon_dispatch` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `warehouse_type_id` (`warehouse_type_id`),
  KEY `default_location_id` (`default_location_id`),
  KEY `stock_adjustment_approver_id` (`stock_adjustment_approver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (48,'PRODUCTION','PRODUCTION',NULL,'2023-11-13 08:49:00',1,'2023-12-14 16:50:15',1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0),(49,'LITHOGRAPHY IN-HOUSE','LITHOGRAPHY IN-HOUSE',NULL,'2023-11-13 08:49:00',NULL,NULL,1,1,0,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0),(50,'ROWELL','ROWELL',NULL,'2023-11-13 08:49:00',1,'2024-02-14 04:38:07',1,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,1),(51,'OTC','OTC',NULL,'2023-11-13 08:49:00',NULL,NULL,1,1,0,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0),(52,'BCC','BCC',NULL,'2023-11-13 08:49:00',NULL,NULL,1,1,0,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0),(53,'SILGAN WAREHOUSE','SILGAN WAREHOUSE',NULL,'2023-11-13 08:49:00',1,'2024-01-09 02:25:34',1,1,0,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,0);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_store_default_bin_location`
--

DROP TABLE IF EXISTS `warehouse_store_default_bin_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_store_default_bin_location` (
  `warehouse_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`warehouse_id`,`store_id`,`location_id`),
  KEY `store_id` (`store_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_store_default_bin_location`
--

LOCK TABLES `warehouse_store_default_bin_location` WRITE;
/*!40000 ALTER TABLE `warehouse_store_default_bin_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse_store_default_bin_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_type`
--

DROP TABLE IF EXISTS `warehouse_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `default_flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_type`
--

LOCK TABLES `warehouse_type` WRITE;
/*!40000 ALTER TABLE `warehouse_type` DISABLE KEYS */;
INSERT INTO `warehouse_type` VALUES (1,'WAREHOUSE','2018-07-17 16:34:20',1),(2,'PRODUCTION','2018-07-17 16:34:20',0),(3,'STORE','2018-08-17 06:51:02',0);
/*!40000 ALTER TABLE `warehouse_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'RM01','RM01','2020-10-15 15:19:33',1,NULL,NULL,1),(2,'RM02','RM02','2020-10-15 15:19:33',1,NULL,NULL,1),(3,'RM03','RM03','2020-10-15 15:19:33',1,NULL,NULL,1),(4,'RM04','RM04','2020-10-15 15:19:33',1,NULL,NULL,1),(5,'RM05','RM05','2020-10-15 15:19:33',1,NULL,NULL,1),(6,'RM06','RM06','2020-10-15 15:19:33',1,NULL,NULL,1),(7,'RM07','RM07','2020-10-15 15:19:33',1,NULL,NULL,1),(8,'RM08','RM08','2020-10-15 15:19:33',1,NULL,NULL,1),(9,'RM09','RM09','2021-05-10 15:29:29',1,NULL,NULL,1),(10,'RM10','RM10','2021-05-10 15:29:29',1,NULL,NULL,1),(11,'ANTERM A','ANTERM A','2021-05-10 15:29:29',1,'2021-10-19 09:15:17',4,1),(12,'ANTERM B','ANTERM B','2021-10-19 09:15:31',4,NULL,NULL,1),(13,'ANTERM C','ANTERM C','2022-05-31 09:38:43',4,NULL,NULL,1);
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `stock_receipt_received`
--

/*!50001 DROP TABLE IF EXISTS `stock_receipt_received`*/;
/*!50001 DROP VIEW IF EXISTS `stock_receipt_received`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_receipt_received` AS select 1 AS `id`,1 AS `receipt_number`,1 AS `item_id`,1 AS `itm_reference`,1 AS `itm_name`,1 AS `itm_description`,1 AS `lot_number`,1 AS `expiry_date`,1 AS `Received`,1 AS `BaseReceived` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_receipt_remaining_po`
--

/*!50001 DROP TABLE IF EXISTS `stock_receipt_remaining_po`*/;
/*!50001 DROP VIEW IF EXISTS `stock_receipt_remaining_po`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_receipt_remaining_po` AS select 1 AS `ponum`,1 AS `code`,1 AS `name`,1 AS `description`,1 AS `required`,1 AS `rcvd`,1 AS `remaining`,1 AS `baseunit`,1 AS `itemid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_receipt_remaining_to`
--

/*!50001 DROP TABLE IF EXISTS `stock_receipt_remaining_to`*/;
/*!50001 DROP VIEW IF EXISTS `stock_receipt_remaining_to`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_receipt_remaining_to` AS select `pod`.`issuance_header_id` AS `tonum`,`i`.`code` AS `code`,`i`.`name` AS `name`,`i`.`description` AS `description`,ifnull(`CONVERTTOBASE`(`pod`.`item_id`,`pod`.`uom_id`,`pod`.`quantity`),0) AS `required`,ifnull(sum(`CONVERTTOBASE`(`srd`.`item_id`,`srd`.`uom_id`,`srd`.`quantity`)),0) AS `rcvd`,(ifnull(`CONVERTTOBASE`(`pod`.`item_id`,`pod`.`uom_id`,`pod`.`quantity`),0) - ifnull(sum(`CONVERTTOBASE`(`srd`.`item_id`,`srd`.`uom_id`,`srd`.`quantity`)),0)) AS `remaining`,(select `item_plu`.`uom_id` from `item_plu` where ((`item_plu`.`inventory_unit_flag` = 1) and (`item_plu`.`item_id` = `i`.`id`))) AS `baseunit`,`i`.`id` AS `itemid` from (((`issuance_dispatch` `pod` left join `item` `i` on((`i`.`id` = `pod`.`item_id`))) left join `stock_receipt_header` `srh` on((`srh`.`stock_issuance_header_id` = `pod`.`issuance_header_id`))) left join `stock_receipt_details` `srd` on(((`srd`.`stock_receipt_header_id` = `srh`.`id`) and (`srd`.`item_id` = `pod`.`item_id`)))) group by `pod`.`item_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_booking`
--

/*!50001 DROP TABLE IF EXISTS `v_booking`*/;
/*!50001 DROP VIEW IF EXISTS `v_booking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_booking` AS select 1 AS `ID`,1 AS `SapCode`,1 AS `Description`,1 AS `CS_Available` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_booking_cs`
--

/*!50001 DROP TABLE IF EXISTS `v_booking_cs`*/;
/*!50001 DROP VIEW IF EXISTS `v_booking_cs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_booking_cs` AS select 1 AS `ID`,1 AS `SapCode`,1 AS `Description`,1 AS `CS_Available` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_checking_details`
--

/*!50001 DROP TABLE IF EXISTS `v_checking_details`*/;
/*!50001 DROP VIEW IF EXISTS `v_checking_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_checking_details` AS select 1 AS `Picking`,1 AS `CheckingID`,1 AS `Code`,1 AS `Name`,1 AS `DisplayQty`,1 AS `Qty`,1 AS `Lot`,1 AS `Expiry`,1 AS `TimeStamp`,1 AS `CheckedBy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_checking_required`
--

/*!50001 DROP TABLE IF EXISTS `v_checking_required`*/;
/*!50001 DROP VIEW IF EXISTS `v_checking_required`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_checking_required` AS select 1 AS `pon`,1 AS `iid`,1 AS `icode`,1 AS `iname`,1 AS `required`,1 AS `Lot`,1 AS `Expiry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_checking_summary`
--

/*!50001 DROP TABLE IF EXISTS `v_checking_summary`*/;
/*!50001 DROP VIEW IF EXISTS `v_checking_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_checking_summary` AS select 1 AS `Picking Number`,1 AS `id`,1 AS `CODE`,1 AS `DESCRIPTION`,1 AS `Barcode`,1 AS `LOT`,1 AS `EXPIRY`,1 AS `Checked`,1 AS `Required`,1 AS `Remaining`,1 AS `Rem` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_cycle_headers`
--

/*!50001 DROP TABLE IF EXISTS `v_cycle_headers`*/;
/*!50001 DROP VIEW IF EXISTS `v_cycle_headers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cycle_headers` AS select 1 AS `warehouse`,1 AS `name`,1 AS `cycle_count_number`,1 AS `remarks` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_getreservedqty`
--

/*!50001 DROP TABLE IF EXISTS `v_getreservedqty`*/;
/*!50001 DROP VIEW IF EXISTS `v_getreservedqty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_getreservedqty` AS select 1 AS `status`,1 AS `location_id`,1 AS `loc_description`,1 AS `item_id`,1 AS `picklist_number`,1 AS `itm_reference`,1 AS `reserved_quantity`,1 AS `picked_quantity`,1 AS `itm_name`,1 AS `uom_id`,1 AS `code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_inquiry`
--

/*!50001 DROP TABLE IF EXISTS `v_inquiry`*/;
/*!50001 DROP VIEW IF EXISTS `v_inquiry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_inquiry` AS select `l`.`code` AS `Location`,`i`.`code` AS `Item`,`i`.`name` AS `Name`,`pi`.`lot_number` AS `Lot`,ifnull(date_format(`pi`.`expiry_date`,'%b %d, %Y'),'N/A') AS `Expiry`,`WHOLELOOSE`(`pi`.`item_id`,(select `item_plu`.`uom_id` from `item_plu` where ((`item_plu`.`item_id` = `pi`.`item_id`) and (`item_plu`.`inventory_unit_flag` = 1))),`pi`.`base_quantity`) AS `Inventory`,(select group_concat(`item_plu`.`barcode` separator ',') from `item_plu` where (`item_plu`.`item_id` = `pi`.`item_id`)) AS `Barcode` from ((`physical_inventory` `pi` left join `item` `i` on((`i`.`id` = `pi`.`item_id`))) left join `bin_location` `l` on((`l`.`id` = `pi`.`location_id`))) where (`pi`.`base_quantity` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_item_bal_booking`
--

/*!50001 DROP TABLE IF EXISTS `v_item_bal_booking`*/;
/*!50001 DROP VIEW IF EXISTS `v_item_bal_booking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_item_bal_booking` AS select 1 AS `itm_name`,1 AS `itm_reference`,1 AS `item_id`,1 AS `code`,1 AS `uom_id`,1 AS `totalqty`,1 AS `lot_number`,1 AS `expiry_date`,1 AS `location_id`,1 AS `loc_code`,1 AS `loc_description`,1 AS `warehouse_name`,1 AS `totalreservedquantity`,1 AS `totalpickedquantity`,1 AS `on_hold`,1 AS `classification` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_item_bal_booking_inv`
--

/*!50001 DROP TABLE IF EXISTS `v_item_bal_booking_inv`*/;
/*!50001 DROP VIEW IF EXISTS `v_item_bal_booking_inv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_item_bal_booking_inv` AS select 1 AS `warehouse_id`,1 AS `location_id`,1 AS `lot_number`,1 AS `item_id`,1 AS `uom_id`,1 AS `expiry_date`,1 AS `stockqty`,1 AS `on_hold`,1 AS `classification` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_item_bal_booking_pi`
--

/*!50001 DROP TABLE IF EXISTS `v_item_bal_booking_pi`*/;
/*!50001 DROP VIEW IF EXISTS `v_item_bal_booking_pi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_item_bal_booking_pi` AS select 1 AS `warehouse_id`,1 AS `warehouse_name`,1 AS `location_id`,1 AS `loc_code`,1 AS `loc_description`,1 AS `lot_number`,1 AS `expiry_date`,1 AS `itm_name`,1 AS `itm_reference`,1 AS `item_id`,1 AS `uom_id`,1 AS `code`,1 AS `stockqty`,1 AS `totalreservedqty`,1 AS `totalpickedqty`,1 AS `on_hold`,1 AS `classification` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_item_bal_booking_res`
--

/*!50001 DROP TABLE IF EXISTS `v_item_bal_booking_res`*/;
/*!50001 DROP VIEW IF EXISTS `v_item_bal_booking_res`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_item_bal_booking_res` AS select `picklist_reservation`.`item_id` AS `item_id`,`picklist_reservation`.`location_id` AS `location_id`,`picklist_reservation`.`lot_number` AS `lot_number`,`picklist_reservation`.`expiry_date` AS `expiry_date`,sum(`picklist_reservation`.`reserved_quantity`) AS `totalreservedqty`,sum(`picklist_reservation`.`picked_quantity`) AS `totalpickedqty` from `picklist_reservation` group by `picklist_reservation`.`item_id`,`picklist_reservation`.`location_id`,`picklist_reservation`.`lot_number`,`picklist_reservation`.`expiry_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_loading_details`
--

/*!50001 DROP TABLE IF EXISTS `v_loading_details`*/;
/*!50001 DROP VIEW IF EXISTS `v_loading_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_loading_details` AS select 1 AS `ID`,1 AS `Pckl`,1 AS `Issn`,1 AS `Item`,1 AS `Code`,1 AS `Name`,1 AS `Load`,1 AS `User`,1 AS `TimeStamp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_loading_headers`
--

/*!50001 DROP TABLE IF EXISTS `v_loading_headers`*/;
/*!50001 DROP VIEW IF EXISTS `v_loading_headers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_loading_headers` AS select `ph`.`transaction_number` AS `picklist`,group_concat(`ish`.`id` separator ',') AS `issuances`,group_concat(`ish`.`reference_number` separator ',') AS `references`,`ish`.`reference_type` AS `type`,`ph`.`remarks` AS `remarks` from (`picklist_header` `ph` left join `issuance_header` `ish` on((`ish`.`picklist_header_id` = `ph`.`transaction_number`))) where ((`ph`.`status` = 'ISSUED') and (`ish`.`status` = 'POSTED') and (`ish`.`id` is not null) and (`ish`.`status` <> 'DISPATCHED')) group by `ph`.`transaction_number` order by `ph`.`transaction_number` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_loading_required`
--

/*!50001 DROP TABLE IF EXISTS `v_loading_required`*/;
/*!50001 DROP VIEW IF EXISTS `v_loading_required`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_loading_required` AS select `ih`.`picklist_header_id` AS `picklist_number`,`id`.`issuance_header_id` AS `issuance_number`,`id`.`item_id` AS `item`,`i`.`code` AS `code`,`i`.`name` AS `name`,(select group_concat(`item_plu`.`barcode` separator ',') from `item_plu` where (`item_plu`.`item_id` = `id`.`item_id`)) AS `barcode`,sum((ifnull(`id`.`base_quantity`,0) * `ip`.`quantity`)) AS `req`,`id`.`lot_number` AS `lot`,cast(`id`.`expiry_date` as char charset utf8) AS `expiry` from (((`issuance_details` `id` left join `issuance_header` `ih` on((`ih`.`id` = `id`.`issuance_header_id`))) left join `item` `i` on((`i`.`id` = `id`.`item_id`))) left join `item_plu` `ip` on((`ip`.`item_id` = `id`.`item_id`))) where (`ih`.`status` = 'POSTED') group by `ih`.`picklist_header_id`,`id`.`item_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_picklist_details`
--

/*!50001 DROP TABLE IF EXISTS `v_picklist_details`*/;
/*!50001 DROP VIEW IF EXISTS `v_picklist_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_picklist_details` AS select 1 AS `Picklist`,1 AS `Picking`,1 AS `Item`,1 AS `Code`,1 AS `Name`,1 AS `UOM`,1 AS `Qty`,1 AS `DisplayQty`,1 AS `Loc`,1 AS `DisplayLoc`,1 AS `Lot`,1 AS `Expiry`,1 AS `DisplayExpiry`,1 AS `Timestamp`,1 AS `PickedBy`,1 AS `PickingID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_picklist_headers`
--

/*!50001 DROP TABLE IF EXISTS `v_picklist_headers`*/;
/*!50001 DROP VIEW IF EXISTS `v_picklist_headers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_picklist_headers` AS select 1 AS `picklist_number`,1 AS `picklist_header_id`,1 AS `remarks`,1 AS `clients`,1 AS `SOs`,1 AS `warehouses`,1 AS `TOs`,1 AS `suppliers`,1 AS `PRs`,1 AS `type`,1 AS `ware`,1 AS `status` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_picklist_summary`
--

/*!50001 DROP TABLE IF EXISTS `v_picklist_summary`*/;
/*!50001 DROP VIEW IF EXISTS `v_picklist_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_picklist_summary` AS select 1 AS `pckl`,1 AS `item`,1 AS `code`,1 AS `name`,1 AS `loc`,1 AS `lot`,1 AS `expiry`,1 AS `barcode`,1 AS `Reserved`,1 AS `Picked`,1 AS `Remaining`,1 AS `BaseRem`,1 AS `category`,1 AS `brand`,1 AS `divs`,1 AS `subdiv`,1 AS `market`,1 AS `sector`,1 AS `mattype`,1 AS `expiryDisplay`,1 AS `WholeFlag`,1 AS `LooseFlag`,1 AS `locid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_picklist_whole_loose`
--

/*!50001 DROP TABLE IF EXISTS `v_picklist_whole_loose`*/;
/*!50001 DROP VIEW IF EXISTS `v_picklist_whole_loose`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_picklist_whole_loose` AS select `pr`.`picklist_header_id` AS `picklist_number`,`i`.`code` AS `itm_reference`,`i`.`name` AS `itm_name`,`loc`.`code` AS `loc_code`,`pr`.`lot_number` AS `lot_number`,cast(`pr`.`expiry_date` as char charset utf8) AS `expiry`,floor((sum(`pr`.`reserved_quantity`) / `ip`.`quantity`)) AS `Whole`,if((sum(`pr`.`reserved_quantity`) >= `ip`.`quantity`),(sum(`pr`.`reserved_quantity`) % `ip`.`quantity`),sum(`pr`.`reserved_quantity`)) AS `Loose`,`pr`.`reserved_quantity` AS `Base` from (((`picklist_reservation` `pr` left join `item` `i` on((`i`.`id` = `pr`.`item_id`))) left join `item_plu` `ip` on(((`ip`.`item_id` = `pr`.`item_id`) and (`ip`.`uom_id` = (select `item_plu`.`uom_id` from `item_plu` where (`item_plu`.`item_id` = `pr`.`item_id`) order by `item_plu`.`quantity` desc,`item_plu`.`uom_id` limit 1))))) left join `bin_location` `loc` on((`loc`.`id` = `pr`.`location_id`))) group by `pr`.`picklist_header_id`,`i`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_putaway_details`
--

/*!50001 DROP TABLE IF EXISTS `v_putaway_details`*/;
/*!50001 DROP VIEW IF EXISTS `v_putaway_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_putaway_details` AS select `ps`.`stock_receipt_header_id` AS `rcvn`,`ps`.`id` AS `psID`,`ps`.`item_id` AS `item`,`l`.`code` AS `loc`,`i`.`code` AS `code`,`i`.`name` AS `description`,`WHOLELOOSE`(`ps`.`item_id`,`ps`.`uom_id`,`ps`.`quantity`) AS `stored`,`ps`.`lot_number` AS `lot`,cast(date_format(`ps`.`expiry_date`,'%b %d, %Y') as char charset utf8) AS `expiry`,ifnull(`u`.`first_name`,'') AS `storedby`,date_format(`ps`.`created_date`,'%c/%d/%Y %l:%i%p') AS `timestamp` from (((`putaway_details` `ps` left join `item` `i` on((`i`.`id` = `ps`.`item_id`))) left join `bin_location` `l` on((`l`.`id` = `ps`.`location_id`))) left join `user` `u` on((`u`.`id` = `ps`.`created_by`))) order by `ps`.`created_date` desc,`i`.`code`,`i`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_putaway_summary`
--

/*!50001 DROP TABLE IF EXISTS `v_putaway_summary`*/;
/*!50001 DROP VIEW IF EXISTS `v_putaway_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_putaway_summary` AS select `srd`.`rcvn` AS `rcvn`,`srd`.`item` AS `item`,`srd`.`code` AS `code`,`srd`.`description` AS `description`,`srd`.`barcode` AS `barcode`,`srd`.`lot` AS `lot`,cast(`srd`.`expiry` as char charset utf8) AS `expiry`,`WHOLELOOSE`(`srd`.`item`,`INVENTORYUNIT`(`srd`.`item`),`srd`.`received`) AS `received`,`WHOLELOOSE`(`srd`.`item`,`INVENTORYUNIT`(`srd`.`item`),ifnull(sum((`ps`.`quantity` * `ip`.`quantity`)),0)) AS `stored`,`WHOLELOOSE`(`srd`.`item`,`INVENTORYUNIT`(`srd`.`item`),(`srd`.`received` - ifnull(sum((`ps`.`quantity` * `ip`.`quantity`)),0))) AS `remaining`,(`srd`.`received` - ifnull(sum((`ps`.`quantity` * `ip`.`quantity`)),0)) AS `baserem` from (((`v_required_rcv` `srd` left join `putaway_details` `ps` on(((`ps`.`stock_receipt_header_id` = `srd`.`rcvn`) and (`ps`.`item_id` = `srd`.`item`) and (`ps`.`lot_number` = `srd`.`lot`) and (`ps`.`expiry_date` = `srd`.`expiry`)))) left join `item` `i` on((`i`.`id` = `srd`.`item`))) left join `item_plu` `ip` on(((`ip`.`item_id` = `ps`.`item_id`) and (`ip`.`uom_id` = `ps`.`uom_id`)))) where ((`srd`.`item` is not null) and (`srd`.`rcvn` is not null)) group by `srd`.`rcvn`,`srd`.`item`,`srd`.`lot`,`srd`.`expiry` order by `srd`.`description`,`srd`.`code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_receiving_details`
--

/*!50001 DROP TABLE IF EXISTS `v_receiving_details`*/;
/*!50001 DROP VIEW IF EXISTS `v_receiving_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_receiving_details` AS select `srd`.`stock_receipt_header_id` AS `rcvn`,`srd`.`id` AS `srdID`,`srd`.`item_id` AS `item`,`i`.`code` AS `code`,`i`.`name` AS `description`,`WHOLELOOSE`(`srd`.`item_id`,`srd`.`uom_id`,`srd`.`quantity`) AS `received`,`srd`.`lot_number` AS `lot`,cast(date_format(`srd`.`expiry_date`,'%b %d, %Y') as char charset utf8) AS `expiry`,ifnull(`u`.`first_name`,'') AS `receivedby`,date_format(`srd`.`created_date`,'%c/%d/%Y %l:%i%p') AS `timestamp` from ((`stock_receipt_details` `srd` left join `item` `i` on((`i`.`id` = `srd`.`item_id`))) left join `user` `u` on((`u`.`id` = `srd`.`created_by`))) order by `srd`.`created_date` desc,`i`.`code`,`i`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_receiving_summary_po`
--

/*!50001 DROP TABLE IF EXISTS `v_receiving_summary_po`*/;
/*!50001 DROP VIEW IF EXISTS `v_receiving_summary_po`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_receiving_summary_po` AS select `reqpo`.`PONumber` AS `PONumber`,`reqpo`.`ItemID` AS `ItemID`,`reqpo`.`Item` AS `Item`,`reqpo`.`Description` AS `Description`,(select group_concat(`item_plu`.`barcode` separator ',') from `item_plu` where (`item_plu`.`item_id` = `reqpo`.`ItemID`)) AS `Barcode`,`WHOLELOOSE`(`reqpo`.`ItemID`,`INVENTORYUNIT`(`reqpo`.`ItemID`),`reqpo`.`BaseQty`) AS `Required`,`WHOLELOOSE`(`reqpo`.`ItemID`,`INVENTORYUNIT`(`reqpo`.`ItemID`),ifnull(sum((`srd`.`quantity` * `ip`.`quantity`)),0)) AS `Received`,`WHOLELOOSE`(`reqpo`.`ItemID`,`INVENTORYUNIT`(`reqpo`.`ItemID`),(`reqpo`.`BaseQty` - ifnull(sum((`srd`.`quantity` * `ip`.`quantity`)),0))) AS `Remaining`,(`reqpo`.`BaseQty` - ifnull(sum((`srd`.`quantity` * `ip`.`quantity`)),0)) AS `BaseRem`,`reqpo`.`ExpiryFlag` AS `ExpiryFlag`,`reqpo`.`shelf_life` AS `shelf_life` from (((`v_required_po` `reqpo` left join `stock_receipt_header` `srh` on((`srh`.`transaction_number` = `reqpo`.`PONumber`))) left join `stock_receipt_details` `srd` on(((`srd`.`stock_receipt_header_id` = `srh`.`id`) and (`srd`.`item_id` = `reqpo`.`ItemID`)))) left join `item_plu` `ip` on(((`ip`.`item_id` = `srd`.`item_id`) and (`ip`.`uom_id` = `srd`.`uom_id`)))) where (`srh`.`status` = 'LOGGED') group by `reqpo`.`PONumber`,`reqpo`.`ItemID` order by `reqpo`.`Item`,`reqpo`.`Description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_receiving_summary_to`
--

/*!50001 DROP TABLE IF EXISTS `v_receiving_summary_to`*/;
/*!50001 DROP VIEW IF EXISTS `v_receiving_summary_to`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_receiving_summary_to` AS select 1 AS `ISSNumber`,1 AS `ItemID`,1 AS `Item`,1 AS `Description`,1 AS `Barcode`,1 AS `Required`,1 AS `Received`,1 AS `Remaining`,1 AS `BaseRem`,1 AS `ExpiryFlag`,1 AS `shelf_life` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_required_po`
--

/*!50001 DROP TABLE IF EXISTS `v_required_po`*/;
/*!50001 DROP VIEW IF EXISTS `v_required_po`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_required_po` AS select 1 AS `PONumber`,1 AS `ItemID`,1 AS `Item`,1 AS `Description`,1 AS `ExpiryFlag`,1 AS `shelf_life`,1 AS `BaseQty` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_required_rcv`
--

/*!50001 DROP TABLE IF EXISTS `v_required_rcv`*/;
/*!50001 DROP VIEW IF EXISTS `v_required_rcv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_required_rcv` AS select 1 AS `rcvn`,1 AS `item`,1 AS `code`,1 AS `description`,1 AS `barcode`,1 AS `lot`,1 AS `expiry`,1 AS `received` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_required_to`
--

/*!50001 DROP TABLE IF EXISTS `v_required_to`*/;
/*!50001 DROP VIEW IF EXISTS `v_required_to`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rfuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_required_to` AS select `pod`.`issuance_header_id` AS `ISSNumber`,`i`.`id` AS `ItemID`,`i`.`code` AS `Item`,`i`.`name` AS `Description`,`i`.`expiry_flag` AS `ExpiryFlag`,ifnull(`i`.`reorder_quantity`,0) AS `shelf_life`,sum((`pod`.`quantity` * `ip`.`quantity`)) AS `BaseQty` from ((`issuance_dispatch` `pod` left join `item` `i` on((`i`.`id` = `pod`.`item_id`))) left join `item_plu` `ip` on(((`ip`.`item_id` = `pod`.`item_id`) and (`ip`.`uom_id` = (select `item_plu`.`uom_id` from `item_plu` where (`item_plu`.`item_id` = `pod`.`item_id`) order by `item_plu`.`quantity` desc,`item_plu`.`uom_id` limit 1))))) group by `pod`.`issuance_header_id`,`i`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tw_copy`
--

/*!50001 DROP TABLE IF EXISTS `v_tw_copy`*/;
/*!50001 DROP VIEW IF EXISTS `v_tw_copy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tw_copy` AS select 1 AS `picklist_number`,1 AS `itm_reference`,1 AS `itm_name`,1 AS `Qty CS`,1 AS `CS`,1 AS `Qty IT`,1 AS `IT` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vdispatchqty`
--

/*!50001 DROP TABLE IF EXISTS `vdispatchqty`*/;
/*!50001 DROP VIEW IF EXISTS `vdispatchqty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vdispatchqty` AS select 1 AS `issuance_number`,1 AS `item_id`,1 AS `itm_reference`,1 AS `itm_name`,1 AS `issued_qty`,1 AS `item_qty`,1 AS `code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vgetpicking_balance`
--

/*!50001 DROP TABLE IF EXISTS `vgetpicking_balance`*/;
/*!50001 DROP VIEW IF EXISTS `vgetpicking_balance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vgetpicking_balance` AS select 1 AS `item_id`,1 AS `picklist_number`,1 AS `location_id`,1 AS `lot_number`,1 AS `reserved_quantity`,1 AS `picked_quantity`,1 AS `pickbalance` */;
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

-- Dump completed on 2024-02-15  9:58:31
