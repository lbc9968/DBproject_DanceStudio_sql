-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: mysqldbserver.csqhym8yrvzj.us-east-2.rds.amazonaws.com    Database: DanceStudio
-- ------------------------------------------------------
-- Server version	8.0.28

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `booking_status`
--

DROP TABLE IF EXISTS `booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_status`
--

LOCK TABLES `booking_status` WRITE;
/*!40000 ALTER TABLE `booking_status` DISABLE KEYS */;
INSERT INTO `booking_status` VALUES (1,'FULL'),(2,'AVAILABLE');
/*!40000 ALTER TABLE `booking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_details`
--

DROP TABLE IF EXISTS `class_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_details` (
  `class_reservation_id` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int NOT NULL,
  `student_id` int NOT NULL,
  `room_reservation_id` int NOT NULL,
  `reservation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`class_reservation_id`),
  KEY `fk_Students_has_DanceClass_Students1` (`student_id`),
  KEY `fk_Students_has_DanceClass_DanceClass1` (`instructor_id`),
  KEY `fk_classreservations_roomreservation` (`room_reservation_id`),
  CONSTRAINT `fk_classreservations_roomreservation` FOREIGN KEY (`room_reservation_id`) REFERENCES `room_reservations` (`reservation_id`),
  CONSTRAINT `fk_Students_has_DanceClass_DanceClass1` FOREIGN KEY (`instructor_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_Students_has_DanceClass_Students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_details`
--

LOCK TABLES `class_details` WRITE;
/*!40000 ALTER TABLE `class_details` DISABLE KEYS */;
INSERT INTO `class_details` VALUES (3,3,3,1,'2023-05-03 00:00:00'),(4,3,4,1,'2023-05-03 00:00:00'),(5,3,5,1,'2023-05-03 00:00:00'),(6,3,6,1,'2023-05-03 00:00:00'),(7,3,7,1,'2023-05-03 00:00:00'),(8,3,8,1,'2023-05-03 00:00:00'),(10,8,3,2,'2023-05-03 00:00:00'),(11,8,4,2,'2023-05-03 00:00:00'),(12,8,5,2,'2023-05-03 00:00:00'),(13,8,6,2,'2023-05-03 00:00:00'),(14,8,7,2,'2023-05-03 00:00:00'),(15,11,4,10,'0000-00-00 00:00:00'),(16,8,5,15,'0000-00-00 00:00:00'),(17,11,7,5,'0000-00-00 00:00:00'),(18,8,4,6,'0000-00-00 00:00:00'),(19,11,8,8,'0000-00-00 00:00:00'),(20,11,6,15,'0000-00-00 00:00:00'),(21,8,8,6,'2023-05-05 05:48:41'),(22,8,8,6,'2023-05-05 22:23:54'),(23,8,8,1,'2023-05-06 01:07:48'),(24,3,8,5,'2023-05-06 01:29:14');
/*!40000 ALTER TABLE `class_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `t_class_details` AFTER INSERT ON `class_details` FOR EACH ROW BEGIN
    CALL `DanceStudio`.sp_check_class_availability (
       NEW.class_reservation_id
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `class_status`
--

DROP TABLE IF EXISTS `class_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_status`
--

LOCK TABLES `class_status` WRITE;
/*!40000 ALTER TABLE `class_status` DISABLE KEYS */;
INSERT INTO `class_status` VALUES (3,'Cancelled'),(4,'Active'),(5,'Completed');
/*!40000 ALTER TABLE `class_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dance_class`
--

DROP TABLE IF EXISTS `dance_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dance_class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `style_id` int NOT NULL,
  `fees` int DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `fk_DanceClass_DanceStyle1` (`style_id`),
  CONSTRAINT `fk_DanceClass_DanceStyle1` FOREIGN KEY (`style_id`) REFERENCES `dance_style` (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dance_class`
--

LOCK TABLES `dance_class` WRITE;
/*!40000 ALTER TABLE `dance_class` DISABLE KEYS */;
INSERT INTO `dance_class` VALUES (1,'Ballet',1,1,30),(2,'Belly',1,2,25),(3,'Hip-hop',1,3,40),(4,'Breaking',1,3,45),(5,'Folk',1,5,35),(6,'Salsa',1,4,55),(7,'Kuchipudi',1,6,70),(8,'Bharata Natyam',1,6,70),(9,'Disco',1,7,60);
/*!40000 ALTER TABLE `dance_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dance_style`
--

DROP TABLE IF EXISTS `dance_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dance_style` (
  `style_id` int NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) NOT NULL,
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dance_style`
--

LOCK TABLES `dance_style` WRITE;
/*!40000 ALTER TABLE `dance_style` DISABLE KEYS */;
INSERT INTO `dance_style` VALUES (1,'Ballroom'),(2,'African'),(3,'American'),(4,'Latin'),(5,'Modern'),(6,'Indian'),(7,'Western');
/*!40000 ALTER TABLE `dance_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `salary` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (3,'Martin Blank','25, Rue Lauriston, Paris',8000),(8,'Bugz Bunny','123 Downtown Street',25799),(10,'Bhanu','ssd345',400000),(11,'Roland Mendel','C/ Araquil, 67, Madrid',5000),(12,'Victoria Ashworth','35 King George, London',6500);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_reservations`
--

DROP TABLE IF EXISTS `room_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `class_id` int NOT NULL,
  `class_start` datetime DEFAULT NULL,
  `class_end` datetime DEFAULT NULL,
  `class_start_time` time DEFAULT NULL,
  `class_end_time` time DEFAULT NULL,
  `class_duration` int NOT NULL,
  `status_id` int DEFAULT NULL,
  `booking_status_id` int DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `fk_Instructors_has_StudioRoom_StudioRoom1_idx` (`room_id`),
  KEY `fk_Instructors_has_StudioRoom_Instructors1_idx` (`class_id`),
  KEY `fk_roomreservations_status` (`status_id`),
  KEY `fk_roomreservations_bookingstatus` (`booking_status_id`),
  CONSTRAINT `fk_Instructors_has_StudioRoom_Instructors1` FOREIGN KEY (`room_id`) REFERENCES `studio_room` (`room_id`),
  CONSTRAINT `fk_Instructors_has_StudioRoom_StudioRoom1` FOREIGN KEY (`class_id`) REFERENCES `dance_class` (`class_id`),
  CONSTRAINT `fk_roomreservations_bookingstatus` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`status_id`),
  CONSTRAINT `fk_roomreservations_status` FOREIGN KEY (`status_id`) REFERENCES `class_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_reservations`
--

LOCK TABLES `room_reservations` WRITE;
/*!40000 ALTER TABLE `room_reservations` DISABLE KEYS */;
INSERT INTO `room_reservations` VALUES (1,1,1,'2023-05-03 00:00:00','2023-05-05 00:00:00','10:00:00','11:00:00',60,5,1),(2,1,3,'2023-05-03 00:00:00','2023-05-23 00:00:00','11:00:00','12:00:00',60,4,1),(3,1,7,'2023-05-03 00:00:00','2023-05-23 00:00:00','13:00:00','14:00:00',60,4,2),(4,1,8,'2023-05-03 00:00:00','2023-05-23 00:00:00','15:00:00','16:00:00',60,4,2),(5,1,9,'2023-05-03 00:00:00','2023-05-23 00:00:00','16:00:00','17:00:00',60,4,2),(6,2,4,'2023-05-03 00:00:00','2023-05-23 00:00:00','10:00:00','11:00:00',60,4,2),(7,2,5,'2023-05-03 00:00:00','2023-05-23 00:00:00','09:00:00','10:00:00',60,4,2),(8,2,6,'2023-05-03 00:00:00','2023-05-23 00:00:00','11:00:00','12:00:00',60,4,2),(9,2,7,'2023-05-03 00:00:00','2023-05-23 00:00:00','13:00:00','14:00:00',60,4,2),(10,2,8,'2023-05-03 00:00:00','2023-05-23 00:00:00','15:00:00','16:00:00',60,4,2),(11,2,9,'2023-05-03 00:00:00','2023-05-23 00:00:00','16:00:00','17:00:00',60,4,2),(12,3,1,'2023-05-03 00:00:00','2023-05-23 00:00:00','10:00:00','11:00:00',60,4,2),(13,3,2,'2023-05-03 00:00:00','2023-05-23 00:00:00','09:00:00','10:00:00',60,4,2),(14,3,3,'2023-05-03 00:00:00','2023-05-23 00:00:00','11:00:00','12:00:00',60,4,2),(15,3,4,'2023-05-03 00:00:00','2023-05-23 00:00:00','13:00:00','14:00:00',60,4,2),(16,3,5,'2023-05-03 00:00:00','2023-05-23 00:00:00','15:00:00','16:00:00',60,4,2),(17,3,6,'2023-05-03 00:00:00','2023-05-23 00:00:00','16:00:00','17:00:00',60,4,2),(20,3,8,'0000-00-00 00:00:00','0000-00-00 00:00:00','06:00:00','07:00:00',60,4,2);
/*!40000 ALTER TABLE `room_reservations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `t_room_reservations` AFTER INSERT ON `room_reservations` FOR EACH ROW BEGIN
    CALL `DanceStudio`.sp_update_class_status (NEW.reservation_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` int NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (3,'Bhanu','Chavali','bhanu@gmail.com',123456789),(4,'Ravi','Vakk','sdfs@dsfs',123456),(5,'Surya','Vakk','suryavakk@gmail.com',1234567890),(6,'Tom','Maddy','tom.maddy@gmail.com',12346572),(7,'Lis','Morgan','lis.morgan@gmail.com',2147483647),(8,'Mike','Fred','mike.fred@gmail.com',2147483647);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_room`
--

DROP TABLE IF EXISTS `studio_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) NOT NULL,
  `max_capacity` int NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_room`
--

LOCK TABLES `studio_room` WRITE;
/*!40000 ALTER TABLE `studio_room` DISABLE KEYS */;
INSERT INTO `studio_room` VALUES (1,'101',5),(2,'102',5),(3,'103',5),(4,'104',5),(5,'105',40);
/*!40000 ALTER TABLE `studio_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_room_reservations`
--

DROP TABLE IF EXISTS `v_room_reservations`;
/*!50001 DROP VIEW IF EXISTS `v_room_reservations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_room_reservations` AS SELECT 
 1 AS `class_name`,
 1 AS `Style_name`,
 1 AS `room_name`,
 1 AS `class_start`,
 1 AS `class_end`,
 1 AS `class_start_time`,
 1 AS `class_end_time`,
 1 AS `max_capacity`,
 1 AS `class_status`,
 1 AS `booking_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_student_reservations`
--

DROP TABLE IF EXISTS `v_student_reservations`;
/*!50001 DROP VIEW IF EXISTS `v_student_reservations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_student_reservations` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `class_name`,
 1 AS `name`,
 1 AS `room_name`,
 1 AS `max_capacity`,
 1 AS `class_start`,
 1 AS `class_end`,
 1 AS `class_start_time`,
 1 AS `class_end_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'DanceStudio'
--

--
-- Dumping routines for database 'DanceStudio'
--
/*!50003 DROP FUNCTION IF EXISTS `f_get_class_strength` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` FUNCTION `f_get_class_strength`( room_reservation_id_in INT ) RETURNS int
BEGIN
   DECLARE class_strength INT; 
    -- get total number of students enrolled in a particular class
    SELECT COUNT(student_id) INTO class_strength
		FROM class_details
			WHERE room_reservation_id = room_reservation_id_in;
   RETURN class_strength;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_is_class_valid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` FUNCTION `f_is_class_valid`( room_reservation_id_in INT ) RETURNS tinyint(1)
BEGIN
   DECLARE isactive boolean; 
   DECLARE status varchar(50);
    -- class is valid if class is Active as long as it is Not Cancelled or Completed    
    SELECT cs.status_name INTO status
		FROM room_reservations rr inner join class_status cs
			on rr.status_id = cs.status_id
			WHERE reservation_id = room_reservation_id_in;
	IF status = 'Active' THEN
		SET isactive = 1;
    ELSE
		SET isactive = 0; 
	END IF;
    RETURN isactive;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_check_class_availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `sp_check_class_availability`(
    IN_class_reservation_id INT    
)
BEGIN
    DECLARE capacity INT;
    DECLARE local_room_reservation_id INT;
    DECLARE students_enrolled INT;
   

    -- Get Room details from Class Reservation iD
    SELECT room_reservation_id INTO local_room_reservation_id 
		FROM `DanceStudio`.class_details 
			WHERE class_reservation_id = IN_class_reservation_id;

    -- get total number of students enrolled in a particular class
    SELECT COUNT(student_id) INTO students_enrolled
		FROM class_details
			WHERE room_reservation_id = local_room_reservation_id;
	
    -- get max capacity of the input room id
    SELECT sr.max_capacity room_reservations INTO capacity
    FROM room_reservations rr inner join studio_room sr
		ON rr.room_id = sr.room_id
    WHERE rr.reservation_id = local_room_reservation_id;
    
    -- if the total participants < max capacity then update the class status to AVAILABLE
    -- if the toal participants >= max capacity then update the class status to FULL
    IF students_enrolled < capacity THEN
        UPDATE room_reservations set booking_status_id = 2 WHERE reservation_id = local_room_reservation_id;
	ELSE
        UPDATE room_reservations set booking_status_id = 1 WHERE reservation_id = local_room_reservation_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_class_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `sp_update_class_status`(IN_class_reservation_id INT)
BEGIN
    DECLARE reservation_id_for_update INT;
    DECLARE done INT DEFAULT FALSE;    
    DECLARE class_end_temp datetime;
    
	DECLARE update_status_cur CURSOR FOR 
  
	-- Get all Room Reservations which are in Active Status 
    SELECT reservation_id FROM room_reservations WHERE status_id = 4 and reservation_id != IN_class_reservation_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;

  OPEN update_status_cur;
  read_loop: LOOP
    FETCH update_status_cur INTO reservation_id_for_update;

    IF done THEN
      LEAVE read_loop;
    END IF;
    
    SELECT class_end into class_end_temp FROM room_reservations WHERE reservation_id = reservation_id_for_update;

	-- For each record check if the Current Date > End Date, then mark the Class as Completed
    IF (CURDATE() > class_end_temp)  THEN
		UPDATE room_reservations SET status_id = 5 WHERE reservation_id = reservation_id_for_update;        
	END IF;
    SET done=FALSE;
  END LOOP;

  CLOSE update_status_cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_room_reservations`
--

/*!50001 DROP VIEW IF EXISTS `v_room_reservations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_room_reservations` AS select `dc`.`class_name` AS `class_name`,`ds`.`style_name` AS `Style_name`,`sr`.`room_name` AS `room_name`,cast(`rr`.`class_start` as date) AS `class_start`,cast(`rr`.`class_end` as date) AS `class_end`,`rr`.`class_start_time` AS `class_start_time`,`rr`.`class_end_time` AS `class_end_time`,`sr`.`max_capacity` AS `max_capacity`,`cs`.`status_name` AS `class_status`,`bs`.`status_name` AS `booking_status` from (((((`room_reservations` `rr` join `studio_room` `sr` on((`rr`.`room_id` = `sr`.`room_id`))) join `dance_class` `dc` on((`rr`.`class_id` = `dc`.`class_id`))) join `dance_style` `ds` on((`dc`.`style_id` = `ds`.`style_id`))) join `class_status` `cs` on((`rr`.`status_id` = `cs`.`status_id`))) join `booking_status` `bs` on((`rr`.`booking_status_id` = `bs`.`status_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_student_reservations`
--

/*!50001 DROP VIEW IF EXISTS `v_student_reservations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_student_reservations` AS select `s`.`first_name` AS `first_name`,`s`.`last_name` AS `last_name`,`dc`.`class_name` AS `class_name`,`e`.`name` AS `name`,`sr`.`room_name` AS `room_name`,`sr`.`max_capacity` AS `max_capacity`,cast(`rr`.`class_start` as date) AS `class_start`,cast(`rr`.`class_end` as date) AS `class_end`,`rr`.`class_start_time` AS `class_start_time`,`rr`.`class_end_time` AS `class_end_time` from (((((`class_details` `cd` join `students` `s` on((`cd`.`student_id` = `s`.`student_id`))) join `employees` `e` on((`cd`.`instructor_id` = `e`.`id`))) join `room_reservations` `rr` on((`cd`.`room_reservation_id` = `rr`.`reservation_id`))) join `studio_room` `sr` on((`rr`.`room_id` = `sr`.`room_id`))) join `dance_class` `dc` on((`rr`.`class_id` = `dc`.`class_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07  0:01:26
