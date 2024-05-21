-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.23.10.1

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
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int DEFAULT '0',
  `years_exp` int DEFAULT '0',
  `rank` enum('C Cook','B Cook','A Cook','Helper Cook','Chef') NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chef_image1_idx` (`image_id`),
  CONSTRAINT `fk_chef_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES (1,'Alexander','Updatopoulos','+1-493-262-9094x205','1978-10-21',45,17,'Helper Cook',0),(2,'Jessica','Garcia','904-977-9775x507','1987-05-16',37,19,'B Cook',1),(3,'Michael','Hall','336-596-0562','1971-11-04',52,29,'Chef',1),(4,'Colleen','Faulkner','+1-601-532-4090x784','1986-08-30',37,16,'A Cook',1),(5,'Francis','Mitchell','369-473-1881','1989-11-04',34,27,'C Cook',1),(6,'Laura','Cooper','411.498.4108','1974-05-26',49,43,'C Cook',1),(7,'Jeffrey','Rojas','449.815.5576x5363','1992-07-15',31,20,'B Cook',1),(8,'Jesus','Lopez','640.532.4737','2002-04-20',22,21,'C Cook',1),(9,'Jessica','Myers','8149868134','1987-02-24',37,18,'A Cook',1),(10,'Hannah','Castillo','001-502-346-4109x3601','1982-06-01',41,15,'C Cook',1),(11,'Jeremy','Willis','994.924.6005x3430','1997-11-25',26,16,'C Cook',1),(12,'Justin','Gray','452-812-3060x7446','1998-04-20',26,25,'Helper Cook',1),(13,'Ricardo','Richardson','742-550-3850x14513','1979-04-22',45,41,'C Cook',1),(14,'Kimberly','Robertson','001-408-300-7639','1992-06-15',31,14,'B Cook',1),(15,'Victor','Miller','964.479.3597','1992-01-09',32,15,'Helper Cook',1),(16,'Evan','Webb','450.646.6835x662','1986-02-11',38,27,'Chef',1),(17,'Julie','Fuller','001-832-317-2282x9862','1978-01-19',46,43,'Helper Cook',1),(18,'Anne','Mitchell','243-240-4189','1970-03-07',54,27,'Chef',1),(19,'Jody','Ramsey','+1-431-764-9825','1980-07-12',43,25,'Helper Cook',1),(20,'Danielle','Watkins','870.732.5774x481','1999-03-18',25,13,'B Cook',1),(21,'Karen','Murray','+1-285-923-4646x9147','1979-01-25',45,28,'C Cook',1),(22,'Derrick','Roberts','526.620.1880','2001-11-28',22,7,'C Cook',1),(23,'Anna','Moore','226.567.2915x61697','1997-10-15',26,21,'B Cook',1),(24,'Sara','White','296-830-9894','1990-01-09',34,9,'Helper Cook',1),(25,'Leslie','Potter','656-327-8438x651','1985-09-23',38,9,'Helper Cook',1),(26,'Steven','Rivers','(360)679-1509x85337','1985-01-31',39,25,'Helper Cook',1),(27,'Johnny','Ball','266-798-0922','1978-01-09',46,8,'A Cook',1),(28,'Rodney','Edwards','001-783-228-6651','1971-12-25',52,36,'A Cook',1),(29,'Barbara','Barker','001-205-847-2382x78374','2002-04-03',22,10,'A Cook',1),(30,'Ryan','White','675.793.1298x319','1983-09-21',40,16,'Chef',1),(31,'Russell','Rodgers','593.584.2853','1996-06-18',27,20,'Helper Cook',1),(32,'Kelly','Perez','369-601-5938','1982-08-23',41,14,'Chef',1),(33,'Ryan','Brewer','766-753-4646x720','1994-03-22',30,30,'C Cook',1),(34,'Katelyn','Espinoza','332.633.8457x92402','1990-08-22',33,15,'A Cook',1),(35,'Jennifer','Jackson','+1-360-480-4789x7164','2000-07-19',23,13,'Chef',1),(36,'Jeff','Jones','001-672-489-8230x285','1992-09-25',31,20,'Chef',1),(37,'Julie','Cook','001-663-377-3964x928','2000-04-12',24,18,'B Cook',1),(38,'Sandy','Hicks','001-371-981-5114x616','1970-04-10',54,48,'A Cook',1),(39,'Larry','Bailey','(541)753-2064','1988-03-19',36,12,'B Cook',1),(40,'Shane','Lopez','220.283.2297x31935','1983-08-08',40,28,'C Cook',1),(41,'Katherine','Dominguez','669.480.4151','1981-07-18',42,32,'A Cook',1),(42,'Sara','Williams','+1-980-368-7782x265','1973-01-18',51,44,'C Cook',1),(43,'Kevin','Moore','001-464-307-9758','2000-11-10',23,14,'A Cook',1),(44,'Norman','Hicks','659.531.7517','1994-08-07',29,24,'Chef',1),(45,'Jennifer','Thompson','711.297.6742x1456','1970-10-30',53,43,'Helper Cook',1),(46,'Anthony','Cardenas','498.734.5507x9915','1997-05-21',26,12,'A Cook',1),(47,'Kim','Cross','646.506.5548','1994-10-27',29,14,'Chef',1),(48,'Deborah','Ramirez','203.434.6892x9666','1982-07-05',41,8,'Helper Cook',1),(49,'Andrew','Roth','338-438-5418','1985-01-19',39,28,'Chef',1),(50,'Veronica','Murphy','4635127661','1995-03-03',29,25,'Helper Cook',1),(51,'Yvonne','Patterson','896.919.1569x27457','1986-12-15',37,27,'C Cook',1),(52,'Scott','Walsh','964-557-4644x6289','1972-03-06',52,51,'Chef',1),(53,'Judith','Perez','(217)590-9027','2000-10-17',23,14,'A Cook',1),(54,'Dale','Valdez','288-299-8326x5381','1971-10-06',52,24,'Helper Cook',1),(55,'Pamela','Bell','837-610-6809x696','1983-08-07',40,22,'Chef',1),(56,'Tiffany','Parker','765.353.9594x82157','2002-07-28',21,20,'Chef',1),(57,'Regina','Norris','001-548-776-2873x1900','2001-07-01',22,22,'C Cook',1),(58,'Brian','Reed','469-368-9444x34517','1980-02-14',44,21,'C Cook',1),(59,'William','Ryan','800-769-5288x5039','1990-11-18',33,20,'Chef',1),(60,'Andrew','Pineda','376.382.8297','1997-04-12',27,22,'Helper Cook',1),(61,'Cody','Zhang','898.874.8130','1999-12-18',24,8,'C Cook',1),(62,'Meredith','Winters','980-349-2816','1988-01-11',36,24,'Chef',1),(63,'Joseph','West','001-636-212-7483x777','2001-06-28',22,20,'B Cook',1),(64,'Sheila','Johnson','4847959446','1975-10-25',48,23,'A Cook',1),(65,'Paula','Smith','(959)859-5842x82655','2000-09-13',23,11,'Helper Cook',1),(66,'Douglas','Bailey','(527)276-3313x1644','1993-06-01',30,30,'Chef',1),(67,'John','Fisher','001-380-215-3072x0397','1994-05-26',29,12,'Helper Cook',1),(68,'Elizabeth','Pace','649-975-3476','1992-03-14',32,28,'A Cook',1),(69,'Douglas','Thomas','5455702043','1977-04-16',47,27,'B Cook',1),(70,'Miranda','Robinson','250.932.4334','1980-07-31',43,42,'Chef',1),(71,'Janet','Fitzpatrick','8083212941','1971-10-07',52,21,'B Cook',1),(72,'Richard','Oneal','400-904-6920x7897','1970-06-25',53,44,'Chef',1),(73,'Jackie','Farrell','300.741.2326x5889','1992-07-27',31,9,'C Cook',1),(74,'Kim','Mcintosh','001-304-610-6638x99506','2003-05-07',21,7,'B Cook',1),(75,'Christopher','Whitaker','3963231528','2002-05-13',22,10,'C Cook',1),(76,'Eric','Welch','686.933.6473','1999-07-19',24,12,'Chef',1),(77,'Crystal','Sanchez','+1-561-311-3370x155','1971-10-16',52,34,'Chef',1),(78,'Chris','Mccoy','772-343-8271','1977-06-29',46,9,'B Cook',1),(79,'Philip','Torres','+1-704-802-0127x58868','1982-01-15',42,42,'B Cook',1),(80,'Mark','Coleman','001-345-883-3764x01139','1976-02-12',48,11,'B Cook',1),(81,'Darren','Larsen','001-551-700-2972x960','1992-11-10',31,22,'Chef',1),(82,'Steven','Jackson','383.503.1134','2001-05-11',23,23,'Helper Cook',1),(83,'Diana','Warren','261-407-6933x440','1981-07-03',42,29,'Chef',1),(84,'Anthony','Foley','(418)758-0444','1985-12-22',38,26,'B Cook',1),(85,'Chad','Gonzalez','(400)985-1758x0853','1984-03-29',40,37,'B Cook',1),(86,'Briana','Hawkins','001-398-558-7095x3240','1975-12-18',48,22,'A Cook',1),(87,'Vanessa','Williamson','6146436265','1971-02-01',53,25,'C Cook',1),(88,'Sergio','Mason','001-967-977-5959x0981','1991-09-06',32,14,'Chef',1),(89,'Katherine','Schmitt','496-932-2097','2000-06-13',23,8,'Chef',1),(90,'Nancy','Solis','403-789-5992x127','1982-06-29',41,25,'C Cook',1),(91,'Patricia','Clark','370-801-2203x64838','1982-01-13',42,15,'Helper Cook',1),(92,'Michael','Morgan','711.340.1133','1970-11-17',53,38,'A Cook',1),(93,'Jack','Ray','001-960-481-1769x4531','1970-09-10',53,18,'A Cook',1),(94,'Ashley','Olson','(510)512-6778x67662','1975-05-20',48,28,'C Cook',1),(95,'Joshua','Walker','833.746.7456x47134','1979-06-30',44,43,'B Cook',1),(96,'Lawrence','Jones','001-444-814-1608x956','1980-12-30',43,37,'C Cook',1),(97,'David','Herrera','+1-991-764-0458x8495','1994-09-30',29,7,'Helper Cook',1),(98,'Dean','Watts','+1-239-395-5935x69847','1981-07-11',42,28,'A Cook',1),(99,'Patricia','Anderson','218.227.3335','1989-04-05',35,23,'B Cook',1),(100,'Diane','Johnson','001-550-595-0712','1988-05-16',36,13,'Helper Cook',1);
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calculate_chef_age` BEFORE INSERT ON `chef` FOR EACH ROW BEGIN
    SET new.age = DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), new.date_of_birth)), "%Y")+0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `chef_has_cuisine`
--

DROP TABLE IF EXISTS `chef_has_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef_has_cuisine` (
  `chef_id` int NOT NULL,
  `cuisine_name` varchar(128) NOT NULL,
  PRIMARY KEY (`chef_id`,`cuisine_name`),
  KEY `fk_chef_has_cuisine_cuisine1_idx` (`cuisine_name`),
  KEY `fk_chef_has_cuisine_chef1_idx` (`chef_id`),
  CONSTRAINT `fk_chef_has_cuisine_chef1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_chef_has_cuisine_cuisine1` FOREIGN KEY (`cuisine_name`) REFERENCES `cuisine` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef_has_cuisine`
--

LOCK TABLES `chef_has_cuisine` WRITE;
/*!40000 ALTER TABLE `chef_has_cuisine` DISABLE KEYS */;
INSERT INTO `chef_has_cuisine` VALUES (1,'Bulgarian'),(2,'German'),(2,'Greek'),(2,'Italian'),(3,'Mexican'),(3,'Russian'),(4,'German'),(4,'Japanese'),(4,'Mexican'),(5,'Bulgarian'),(5,'Mexican'),(6,'Greek'),(7,'American'),(7,'Greek'),(7,'Indian'),(8,'Chinese'),(8,'Italian'),(8,'Turkish'),(9,'Chinese'),(9,'French'),(10,'Italian'),(11,'German'),(11,'Russian'),(12,'Chinese'),(13,'Italian'),(13,'Russian'),(14,'Bulgarian'),(14,'Italian'),(15,'Chinese'),(16,'Bulgarian'),(16,'Japanese'),(16,'Russian'),(17,'Indian'),(18,'French'),(18,'Indian'),(19,'Japanese'),(20,'German'),(20,'Mexican'),(21,'American'),(21,'Japanese'),(21,'Mexican'),(22,'Bulgarian'),(22,'Greek'),(23,'Bulgarian'),(23,'Italian'),(24,'American'),(24,'Chinese'),(25,'Mexican'),(26,'Greek'),(26,'Italian'),(27,'Korean'),(28,'Chinese'),(28,'German'),(28,'Japanese'),(29,'Italian'),(29,'Turkish'),(30,'French'),(30,'Russian'),(31,'Japanese'),(32,'Turkish'),(33,'Italian'),(33,'Korean'),(33,'Mexican'),(34,'Bulgarian'),(34,'Mexican'),(35,'Mexican'),(35,'Russian'),(36,'Mexican'),(37,'German'),(37,'Mexican'),(38,'Bulgarian'),(38,'German'),(39,'American'),(39,'Indian'),(39,'Korean'),(40,'Italian'),(40,'Turkish'),(41,'Albanian'),(42,'Japanese'),(43,'German'),(43,'Korean'),(44,'German'),(44,'Indian'),(44,'Japanese'),(45,'French'),(45,'German'),(45,'Mexican'),(46,'American'),(46,'Bulgarian'),(47,'German'),(47,'Indian'),(47,'Korean'),(48,'Italian'),(49,'Italian'),(50,'Bulgarian'),(50,'Indian'),(51,'Korean'),(52,'Albanian'),(53,'Mexican'),(54,'Chinese'),(54,'German'),(54,'Indian'),(55,'German'),(55,'Japanese'),(55,'Turkish'),(56,'Bulgarian'),(56,'French'),(56,'Italian'),(57,'Bulgarian'),(57,'French'),(57,'German'),(58,'Indian'),(58,'Italian'),(58,'Mexican'),(59,'German'),(60,'Russian'),(61,'French'),(62,'German'),(62,'Indian'),(62,'Turkish'),(63,'Russian'),(64,'Bulgarian'),(64,'Korean'),(65,'Bulgarian'),(65,'Greek'),(65,'Japanese'),(66,'Chinese'),(66,'German'),(66,'Greek'),(67,'French'),(67,'German'),(67,'Turkish'),(68,'Italian'),(68,'Turkish'),(69,'Albanian'),(69,'French'),(70,'American'),(70,'Bulgarian'),(70,'Italian'),(71,'German'),(71,'Italian'),(72,'Chinese'),(72,'Indian'),(72,'Russian'),(73,'Albanian'),(73,'French'),(73,'Russian'),(74,'Indian'),(75,'Indian'),(75,'Mexican'),(76,'Turkish'),(77,'Chinese'),(77,'Mexican'),(77,'Russian'),(78,'American'),(78,'Indian'),(79,'American'),(80,'Japanese'),(81,'Italian'),(82,'American'),(82,'Bulgarian'),(82,'Korean'),(83,'German'),(83,'Korean'),(84,'German'),(84,'Turkish'),(85,'Bulgarian'),(85,'Italian'),(85,'Mexican'),(86,'Bulgarian'),(87,'German'),(87,'Indian'),(88,'French'),(88,'Mexican'),(88,'Russian'),(89,'Korean'),(90,'German'),(90,'Japanese'),(91,'Indian'),(92,'Bulgarian'),(92,'Russian'),(92,'Turkish'),(93,'Turkish'),(94,'French'),(95,'Chinese'),(96,'American'),(96,'Russian'),(97,'Greek'),(97,'Russian'),(98,'French'),(99,'Indian'),(100,'Albanian');
/*!40000 ALTER TABLE `chef_has_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `name` varchar(128) NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`name`),
  KEY `fk_cuisine_image1_idx` (`image_id`),
  CONSTRAINT `fk_cuisine_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
INSERT INTO `cuisine` VALUES ('Greek',1),('French',2),('Indian',3),('Italian',4),('Japanese',5),('Chinese',6),('Mexican',7),('German',8),('Korean',9),('Turkish',10),('Albanian',11),('American',12),('Bulgarian',13),('Russian',14);
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `id` int NOT NULL,
  `year` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`id`,`year`),
  KEY `fk_episode_image1_idx` (`image_id`),
  CONSTRAINT `fk_episode_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,2022,0),(1,2023,0),(1,2024,0),(2,2022,0),(2,2023,0),(2,2024,0),(3,2022,0),(3,2023,0),(3,2024,0),(4,2022,0),(4,2023,0),(4,2024,0),(5,2022,0),(5,2023,0),(5,2024,0),(6,2022,0),(6,2023,0),(6,2024,0),(7,2022,0),(7,2023,0),(7,2024,0),(8,2022,0),(8,2023,0),(8,2024,0),(9,2022,0),(9,2023,0),(9,2024,0),(10,2022,0),(10,2023,0),(10,2024,0);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode_has_recipe`
--

DROP TABLE IF EXISTS `episode_has_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode_has_recipe` (
  `episode_id` int NOT NULL,
  `episode_year` int NOT NULL,
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  `chef_id` int NOT NULL,
  PRIMARY KEY (`episode_id`,`episode_year`,`recipe_name`,`recipe_cuisine_name`,`chef_id`),
  KEY `fk_episode_has_recipe_recipe1_idx` (`recipe_name`,`recipe_cuisine_name`),
  KEY `fk_episode_has_recipe_episode1_idx` (`episode_id`,`episode_year`),
  KEY `fk_episode_has_recipe_chef1_idx` (`chef_id`),
  CONSTRAINT `fk_episode_has_recipe_chef1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_episode_has_recipe_episode1` FOREIGN KEY (`episode_id`, `episode_year`) REFERENCES `episode` (`id`, `year`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_episode_has_recipe_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode_has_recipe`
--

LOCK TABLES `episode_has_recipe` WRITE;
/*!40000 ALTER TABLE `episode_has_recipe` DISABLE KEYS */;
INSERT INTO `episode_has_recipe` VALUES (10,2023,'Mekitsa','Turkish',1),(4,2022,'BLT Sandwich','Italian',2),(4,2024,'BLT Sandwich','Italian',2),(9,2023,'Borscht','Japanese',2),(1,2023,'Clam Chowder','Japanese',3),(2,2022,'Byrek me Spinaq','Japanese',3),(7,2022,'Medovik','Italian',3),(7,2023,'Borscht','Japanese',3),(4,2022,'Macaroni and Cheese','Russian',4),(8,2022,'Macaroni and Cheese','Russian',4),(2,2024,'Pryaniki','Korean',5),(4,2023,'Beef Stroganoff','Indian',5),(10,2024,'Përime në zgare','Korean',5),(1,2023,'Garash Cake','Greek',6),(5,2022,'Musaka','Albanian',6),(6,2024,'Olivier Salad','Albanian',6),(7,2024,'Olivier Salad','Albanian',6),(8,2024,'Tavë Kosi','Greek',6),(9,2023,'Tavë Kosi','Greek',6),(9,2024,'Musaka','Albanian',6),(1,2023,'Medovik','Italian',8),(1,2024,'Speca të mbushur','Italian',8),(2,2022,'Speca të mbushur','Italian',8),(7,2023,'Banitsa','Korean',8),(8,2022,'Tavë Kosi','Greek',8),(10,2022,'Garash Cake','Greek',8),(5,2022,'Speca të mbushur','Italian',9),(8,2022,'Speca të mbushur','Italian',9),(4,2024,'Barbecue Ribs','Greek',10),(6,2024,'Fërgesë','Indian',10),(9,2022,'Bulgarian Cheese Toast','Russian',10),(10,2024,'Beef Stroganoff','Indian',10),(3,2023,'Bakllasarem','French',11),(3,2024,'Bulgarian Cheese Toast','Russian',11),(4,2023,'Bakllasarem','French',11),(4,2024,'Bulgarian Cheese Toast','Russian',11),(6,2023,'Macaroni and Cheese','Russian',11),(9,2022,'Sarmi','French',11),(9,2024,'Pancakes','French',11),(4,2024,'Borscht','Japanese',12),(5,2024,'Byrek me Spinaq','Japanese',12),(5,2022,'Mish me midhje','Turkish',13),(2,2023,'Tarator','American',14),(2,2024,'Medovik','Italian',14),(3,2023,'Speca të mbushur','Italian',14),(5,2024,'Përime në zgare','Korean',15),(7,2024,'Banitsa','Korean',15),(3,2022,'Pelmeni','Chinese',16),(4,2023,'Brownies','Chinese',16),(6,2022,'Pelmeni','Chinese',16),(6,2024,'Qifqi','German',16),(7,2023,'Kasha','German',16),(7,2024,'Pelmeni','Chinese',16),(2,2023,'Jani me fasule','Chinese',17),(4,2022,'Mish me midhje','Turkish',17),(6,2024,'Zefir','Turkish',17),(7,2024,'Shchi','American',17),(8,2022,'Mish me midhje','Turkish',17),(1,2024,'Syrniki','Mexican',18),(2,2024,'Shchi','American',18),(6,2022,'Macaroni and Cheese','Russian',18),(7,2022,'Apple Pie','American',18),(8,2023,'Shopska Salata','Mexican',18),(8,2024,'Syrniki','Mexican',18),(3,2022,'Chocolate Chip Cookies','Indian',19),(5,2024,'Fërgesë','Indian',19),(6,2023,'Musaka','Albanian',19),(6,2024,'Jani me fasule','Chinese',19),(8,2022,'Brownies','Chinese',19),(1,2023,'Shopska Salata','Mexican',20),(1,2024,'Borscht','Japanese',20),(2,2022,'Musaka','Albanian',20),(2,2023,'Clam Chowder','Japanese',20),(7,2022,'Syrniki','Mexican',20),(8,2023,'Cheeseburger','Albanian',20),(6,2023,'Jani me fasule','Chinese',21),(7,2022,'Pelmeni','Chinese',21),(8,2023,'Jani me fasule','Chinese',21),(2,2022,'Tarator','American',22),(4,2024,'Tarator','American',22),(5,2023,'Shchi','American',22),(6,2024,'Shchi','American',22),(2,2024,'Kasha','German',23),(5,2023,'Kasha','German',23),(5,2024,'Kavarma','German',23),(8,2023,'Kavarma','German',23),(2,2024,'Byrek me Spinaq','Japanese',24),(3,2022,'Garash Cake','Greek',24),(6,2024,'Byrek me Spinaq','Japanese',24),(5,2022,'Shopska Salata','Mexican',25),(5,2023,'Shopska Salata','Mexican',25),(6,2022,'Shëndetli','Mexican',25),(7,2023,'Shopska Salata','Mexican',25),(7,2024,'Shëndetli','Mexican',25),(8,2022,'Musaka','Albanian',25),(9,2022,'Banitsa','Korean',25),(10,2022,'Banitsa','Korean',25),(1,2022,'Fried Chicken','Bulgarian',26),(3,2024,'Fried Chicken','Bulgarian',26),(4,2022,'Kadaif','Bulgarian',26),(6,2023,'Fried Chicken','Bulgarian',26),(7,2022,'Fried Chicken','Bulgarian',26),(8,2022,'Fried Chicken','Bulgarian',26),(8,2024,'Fried Chicken','Bulgarian',26),(1,2022,'Pryaniki','Korean',27),(2,2023,'Pryaniki','Korean',27),(5,2023,'Banitsa','Korean',27),(6,2024,'Banitsa','Korean',27),(8,2024,'Pryaniki','Korean',27),(5,2024,'Tavë Kosi','Greek',28),(7,2022,'Barbecue Ribs','Greek',28),(3,2023,'Pryaniki','Korean',29),(4,2023,'Borscht','Japanese',30),(2,2024,'Mish me midhje','Turkish',32),(9,2024,'Zefir','Turkish',32),(3,2024,'Banitsa','Korean',33),(10,2023,'Byrek me Spinaq','Japanese',34),(1,2022,'Syrniki','Mexican',35),(3,2022,'Shëndetli','Mexican',35),(4,2024,'Syrniki','Mexican',35),(9,2022,'Syrniki','Mexican',35),(2,2024,'Shëndetli','Mexican',37),(3,2024,'Tavë Kosi','Greek',37),(10,2022,'Syrniki','Mexican',37),(10,2023,'Shopska Salata','Mexican',37),(1,2024,'Olivier Salad','Albanian',38),(4,2023,'Macaroni and Cheese','Russian',38),(5,2022,'Sarmi','French',38),(8,2022,'Bakllasarem','French',38),(8,2023,'Bakllasarem','French',38),(9,2023,'Macaroni and Cheese','Russian',38),(10,2022,'Olivier Salad','Albanian',38),(10,2023,'Bulgarian Cheese Toast','Russian',38),(10,2023,'Shchi','American',39),(3,2022,'Macaroni and Cheese','Russian',40),(1,2024,'Mekitsa','Turkish',41),(3,2024,'Shëndetli','Mexican',41),(4,2023,'Syrniki','Mexican',41),(8,2023,'Macaroni and Cheese','Russian',41),(10,2022,'Zefir','Turkish',41),(4,2024,'Chocolate Chip Cookies','Indian',42),(6,2022,'Chocolate Chip Cookies','Indian',42),(8,2024,'Cheeseburger','Albanian',42),(5,2022,'Macaroni and Cheese','Russian',43),(9,2024,'Bulgarian Cheese Toast','Russian',43),(10,2024,'Macaroni and Cheese','Russian',43),(4,2022,'Qifqi','German',44),(4,2024,'Kasha','German',44),(2,2023,'Fried Chicken','Bulgarian',45),(5,2024,'Sarmi','French',45),(8,2023,'Fried Chicken','Bulgarian',45),(9,2022,'Musaka','Albanian',45),(1,2022,'Shchi','American',46),(1,2023,'Apple Pie','American',46),(2,2023,'Zefir','Turkish',46),(6,2022,'Përime në zgare','Korean',46),(10,2024,'Tarator','American',46),(1,2024,'Kasha','German',48),(7,2022,'Qifqi','German',48),(10,2022,'Qifqi','German',48),(3,2024,'Byrek me Spinaq','Japanese',49),(4,2023,'BLT Sandwich','Italian',49),(6,2022,'Medovik','Italian',49),(6,2023,'Borscht','Japanese',49),(7,2024,'Medovik','Italian',49),(8,2023,'Banitsa','Korean',49),(10,2023,'Banitsa','Korean',49),(2,2022,'Shopska Salata','Mexican',50),(2,2024,'Jani me fasule','Chinese',50),(4,2022,'Syrniki','Mexican',50),(5,2022,'Brownies','Chinese',50),(7,2023,'Fërgesë','Indian',50),(9,2023,'Shëndetli','Mexican',50),(1,2023,'Fried Chicken','Bulgarian',51),(3,2024,'Shchi','American',51),(5,2024,'Fried Chicken','Bulgarian',51),(6,2023,'Shchi','American',51),(10,2023,'Fried Chicken','Bulgarian',51),(10,2024,'Fried Chicken','Bulgarian',51),(3,2024,'Cheeseburger','Albanian',52),(4,2024,'Musaka','Albanian',52),(5,2024,'Cheeseburger','Albanian',52),(7,2024,'Beef Stroganoff','Indian',53),(9,2023,'Fërgesë','Indian',53),(1,2022,'Medovik','Italian',54),(9,2022,'Apple Pie','American',54),(10,2023,'Speca të mbushur','Italian',54),(10,2024,'BLT Sandwich','Italian',54),(4,2024,'Sarmi','French',55),(5,2023,'Chocolate Chip Cookies','Indian',55),(8,2022,'Pryaniki','Korean',55),(1,2024,'Pryaniki','Korean',56),(9,2024,'Pryaniki','Korean',56),(6,2023,'Bakllasarem','French',57),(1,2022,'Tavë Kosi','Greek',58),(2,2022,'Zefir','Turkish',58),(2,2023,'Barbecue Ribs','Greek',58),(3,2022,'Mekitsa','Turkish',58),(6,2023,'Mekitsa','Turkish',59),(7,2022,'Mish me midhje','Turkish',59),(1,2022,'Mekitsa','Turkish',60),(4,2022,'Barbecue Ribs','Greek',60),(9,2024,'Garash Cake','Greek',60),(1,2022,'Borscht','Japanese',61),(3,2022,'Kasha','German',62),(3,2023,'Kavarma','German',62),(1,2024,'Bakllasarem','French',63),(3,2023,'Kadaif','Bulgarian',65),(9,2022,'Kadaif','Bulgarian',65),(5,2024,'Syrniki','Mexican',66),(2,2022,'Kadaif','Bulgarian',67),(6,2022,'Fried Chicken','Bulgarian',67),(7,2023,'Fried Chicken','Bulgarian',67),(7,2022,'Pryaniki','Korean',68),(3,2023,'Fërgesë','Indian',69),(4,2022,'Fërgesë','Indian',69),(9,2022,'Chocolate Chip Cookies','Indian',69),(3,2024,'Pancakes','French',71),(8,2024,'Pancakes','French',71),(10,2022,'Bakllasarem','French',71),(1,2023,'Olivier Salad','Albanian',72),(3,2023,'Cheeseburger','Albanian',72),(4,2022,'Shchi','American',72),(8,2022,'Tarator','American',72),(10,2023,'Cheeseburger','Albanian',72),(1,2022,'Kasha','German',73),(3,2024,'Kavarma','German',73),(4,2023,'Cheeseburger','Albanian',73),(8,2024,'Kasha','German',73),(5,2024,'Zefir','Turkish',74),(7,2023,'Mekitsa','Turkish',74),(8,2024,'Shchi','American',74),(9,2023,'Tarator','American',74),(9,2024,'Byrek me Spinaq','Japanese',74),(10,2024,'Byrek me Spinaq','Japanese',74),(8,2024,'Zefir','Turkish',76),(3,2023,'Clam Chowder','Japanese',77),(8,2024,'Byrek me Spinaq','Japanese',77),(7,2024,'Mish me midhje','Turkish',78),(10,2024,'Mish me midhje','Turkish',78),(7,2023,'Barbecue Ribs','Greek',79),(1,2024,'Pelmeni','Chinese',81),(4,2023,'Përime në zgare','Korean',81),(5,2023,'Jani me fasule','Chinese',81),(6,2023,'Përime në zgare','Korean',81),(10,2023,'Beef Stroganoff','Indian',81),(6,2024,'Pancakes','French',82),(1,2023,'Beef Stroganoff','Indian',83),(2,2023,'Chocolate Chip Cookies','Indian',83),(2,2022,'Fërgesë','Indian',84),(9,2022,'Kasha','German',84),(10,2022,'Fërgesë','Indian',84),(9,2023,'Mekitsa','Turkish',85),(1,2024,'Bulgarian Cheese Toast','Russian',86),(3,2023,'Garash Cake','Greek',86),(2,2022,'Banitsa','Korean',89),(4,2023,'Mekitsa','Turkish',89),(5,2023,'Mish me midhje','Turkish',89),(1,2023,'Bakllasarem','French',90),(3,2023,'Brownies','Chinese',90),(5,2023,'Olivier Salad','Albanian',90),(6,2022,'Olivier Salad','Albanian',90),(7,2023,'Olivier Salad','Albanian',90),(9,2024,'Brownies','Chinese',90),(2,2024,'Barbecue Ribs','Greek',92),(10,2024,'Barbecue Ribs','Greek',92),(1,2022,'Pancakes','French',93),(8,2023,'BLT Sandwich','Italian',93),(10,2022,'Speca të mbushur','Italian',93),(2,2023,'Macaroni and Cheese','Russian',94),(3,2022,'Kadaif','Bulgarian',94),(7,2022,'Macaroni and Cheese','Russian',94),(9,2023,'Fried Chicken','Bulgarian',94),(9,2024,'Fried Chicken','Bulgarian',94),(2,2022,'Bulgarian Cheese Toast','Russian',95),(3,2022,'Tarator','American',95),(7,2023,'Bulgarian Cheese Toast','Russian',95),(9,2022,'Jani me fasule','Chinese',95),(5,2022,'Fried Chicken','Bulgarian',96),(5,2023,'Kadaif','Bulgarian',96),(4,2022,'Musaka','Albanian',97),(5,2022,'Qifqi','German',97),(6,2022,'Kavarma','German',97),(6,2023,'Qifqi','German',97),(7,2024,'Kasha','German',97),(9,2023,'Olivier Salad','Albanian',97),(10,2024,'Qifqi','German',97),(1,2023,'Bulgarian Cheese Toast','Russian',98),(2,2024,'Macaroni and Cheese','Russian',98),(3,2022,'Pancakes','French',98),(5,2023,'Pancakes','French',98),(6,2022,'Sarmi','French',98),(6,2024,'Bulgarian Cheese Toast','Russian',98),(7,2024,'Bulgarian Cheese Toast','Russian',98),(9,2023,'Pancakes','French',98),(10,2022,'Bulgarian Cheese Toast','Russian',98),(5,2022,'Shchi','American',99),(8,2023,'Tavë Kosi','Greek',99),(9,2024,'Shchi','American',99),(2,2023,'Syrniki','Mexican',100);
/*!40000 ALTER TABLE `episode_has_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode_judges`
--

DROP TABLE IF EXISTS `episode_judges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode_judges` (
  `episode_id` int NOT NULL,
  `episode_year` int NOT NULL,
  `chef_id` int NOT NULL,
  PRIMARY KEY (`episode_id`,`episode_year`,`chef_id`),
  KEY `fk_episode_has_chef1_chef1_idx` (`chef_id`),
  KEY `fk_episode_has_chef1_episode1_idx` (`episode_id`,`episode_year`),
  CONSTRAINT `fk_episode_has_chef1_chef1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_episode_has_chef1_episode1` FOREIGN KEY (`episode_id`, `episode_year`) REFERENCES `episode` (`id`, `year`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode_judges`
--

LOCK TABLES `episode_judges` WRITE;
/*!40000 ALTER TABLE `episode_judges` DISABLE KEYS */;
INSERT INTO `episode_judges` VALUES (8,2022,1),(1,2022,4),(8,2024,4),(1,2022,5),(1,2023,5),(5,2023,5),(3,2024,6),(4,2023,7),(7,2022,7),(9,2023,7),(8,2022,10),(9,2024,10),(7,2024,11),(3,2023,12),(2,2022,13),(4,2022,14),(10,2024,15),(5,2024,17),(8,2024,17),(6,2022,21),(5,2022,23),(4,2023,24),(7,2023,24),(5,2023,26),(4,2024,30),(10,2024,30),(10,2023,32),(3,2022,33),(5,2022,34),(9,2023,35),(1,2023,40),(6,2022,41),(9,2024,41),(5,2023,42),(1,2024,43),(1,2024,47),(6,2024,48),(7,2023,48),(1,2023,53),(2,2024,54),(3,2023,54),(10,2022,54),(3,2022,55),(1,2024,57),(8,2023,58),(7,2024,60),(9,2022,61),(9,2023,63),(5,2024,64),(2,2023,67),(3,2024,67),(4,2022,67),(3,2024,68),(4,2022,70),(2,2022,71),(8,2023,71),(7,2023,72),(9,2024,73),(10,2023,73),(6,2023,75),(2,2024,76),(9,2022,76),(1,2022,78),(2,2023,78),(5,2022,78),(10,2022,79),(7,2022,81),(5,2024,82),(4,2023,83),(9,2022,83),(2,2024,84),(6,2022,84),(4,2024,85),(7,2022,85),(6,2023,86),(6,2024,87),(10,2023,87),(10,2024,87),(2,2023,89),(3,2022,89),(3,2023,89),(10,2022,89),(8,2023,91),(4,2024,94),(6,2024,94),(6,2023,95),(8,2022,95),(2,2022,97),(8,2024,99),(7,2024,100);
/*!40000 ALTER TABLE `episode_judges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `name` varchar(64) NOT NULL,
  `manual` text,
  `image_id` int NOT NULL,
  PRIMARY KEY (`name`),
  KEY `fk_equipment_image1_idx` (`image_id`),
  CONSTRAINT `fk_equipment_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES ('aluminum foil','used for cooking',0),('baking dish','used for cooking',0),('baking pan','used for cooking',0),('baking sheet','used for cooking',0),('basting brush','used for cooking',0),('blender','used for cooking',0),('bowl','used for cooking',0),('brush','used for cooking',0),('cake pan','used for cooking',0),('cookie cutter','used for cooking',0),('cutting board','used for cooking',0),('deep fryer','used for cooking',0),('frying pan','used for cooking',0),('garlic press','used for cooking',0),('griddle or skillet','used for cooking',0),('grill','used for cooking',0),('knife','used for cooking',0),('mixing bowl','used for cooking',0),('mixing bowls','used for cooking',0),('oven','used for cooking',0),('pan','used for cooking',0),('paper towels','used for cooking',0),('pie dish','used for cooking',0),('piping bag','used for cooking',0),('pot','used for cooking',0),('rolling pin','used for cooking',0),('saucepan','used for cooking',0),('skillet','used for cooking',0),('spatula','used for cooking',0),('stove','used for cooking',0),('strainer','used for cooking',0),('toaster','used for cooking',0),('tongs','used for cooking',0),('tray','used for cooking',0),('whisk','used for cooking',0),('wire rack','used for cooking',0);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_info`
--

DROP TABLE IF EXISTS `food_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_info` (
  `fat` int DEFAULT NULL,
  `protein` int DEFAULT NULL,
  `carbohydrate` int DEFAULT NULL,
  `total_calories` int DEFAULT NULL,
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  PRIMARY KEY (`recipe_name`,`recipe_cuisine_name`),
  CONSTRAINT `fk_food_info_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_info`
--

LOCK TABLES `food_info` WRITE;
/*!40000 ALTER TABLE `food_info` DISABLE KEYS */;
INSERT INTO `food_info` VALUES (9,2,453,0,'Apple Pie','American'),(44,46,645,0,'Bakllasarem','French'),(10,33,232,0,'Banitsa','Korean'),(31,2,31,0,'Barbecue Ribs','Greek'),(19,39,23,0,'Beef Stroganoff','Indian'),(40,22,59,0,'BLT Sandwich','Italian'),(45,19,208,0,'Borscht','Japanese'),(15,17,393,0,'Brownies','Chinese'),(30,20,61,0,'Bulgarian Cheese Toast','Russian'),(48,43,235,0,'Byrek me Spinaq','Japanese'),(29,48,106,0,'Cheeseburger','Albanian'),(12,19,836,0,'Chocolate Chip Cookies','Indian'),(36,23,139,0,'Clam Chowder','Japanese'),(32,12,40,0,'Fërgesë','Indian'),(36,42,193,0,'Fried Chicken','Bulgarian'),(4,26,305,0,'Garash Cake','Greek'),(41,45,297,0,'Jani me fasule','Chinese'),(14,36,691,0,'Kadaif','Bulgarian'),(39,50,123,0,'Kasha','German'),(47,47,47,0,'Kavarma','German'),(33,25,236,0,'Macaroni and Cheese','Russian'),(16,21,609,0,'Medovik','Italian'),(7,10,396,0,'Mekitsa','Turkish'),(43,33,43,0,'Mish me midhje','Turkish'),(35,46,267,0,'Musaka','Albanian'),(43,20,106,0,'Olivier Salad','Albanian'),(49,31,187,0,'Pancakes','French'),(46,28,203,0,'Pelmeni','Chinese'),(36,32,62,0,'Përime në zgare','Korean'),(39,8,678,0,'Pryaniki','Korean'),(34,48,154,0,'Qifqi','German'),(23,9,260,0,'Sarmi','French'),(10,25,164,0,'Shchi','American'),(14,22,412,0,'Shëndetli','Mexican'),(12,41,41,0,'Shopska Salata','Mexican'),(24,49,188,0,'Speca të mbushur','Italian'),(45,34,49,0,'Syrniki','Mexican'),(49,32,40,0,'Tarator','American'),(42,6,187,0,'Tavë Kosi','Greek'),(9,39,300,0,'Zefir','Turkish');
/*!40000 ALTER TABLE `food_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_team`
--

DROP TABLE IF EXISTS `food_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_team` (
  `short_name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `long_name` varchar(64) NOT NULL COMMENT 'category',
  `image_id` int NOT NULL,
  PRIMARY KEY (`short_name`),
  KEY `fk_food_team_image1_idx` (`image_id`),
  CONSTRAINT `fk_food_team_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_team`
--

LOCK TABLES `food_team` WRITE;
/*!40000 ALTER TABLE `food_team` DISABLE KEYS */;
INSERT INTO `food_team` VALUES ('dairy','Milk, cheese etc','Milk and Dairy products',2004),('eggy','Eggs (come on)','Eggs',2008),('fruity','Apples bananas etc','Fruit',2002),('legumy','Peas beans etc','Legumes',2005),('oil-nuts','Olives Nuts etc','Fat Oils and Nuts',2010),('potatoy','Potato cereal etc','Cereal and Potatoes',2003),('red-carnivorous','Beef pork etc','Red Meat',2006),('seafood','fish shrimps etc','Fish and Seafood',2009),('vegetarian','Cabbage carrots etc','Vegetables',2001),('white-carnivorous','Chicken etc','White Meat',2007);
/*!40000 ALTER TABLE `food_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grading`
--

DROP TABLE IF EXISTS `grading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grading` (
  `episode_id` int NOT NULL,
  `episode_year` int NOT NULL,
  `judge_chef_id` int NOT NULL,
  `participant_chef_id` int NOT NULL,
  `grade` int DEFAULT NULL,
  PRIMARY KEY (`episode_id`,`episode_year`,`judge_chef_id`,`participant_chef_id`),
  KEY `fk_episode_judges_has_episode_has_chef_episode_judges1_idx` (`episode_id`,`episode_year`,`judge_chef_id`),
  KEY `fk_grading_episode_has_recipe1_idx` (`participant_chef_id`),
  CONSTRAINT `fk_episode_judges_has_episode_has_chef_episode_judges1` FOREIGN KEY (`episode_id`, `episode_year`, `judge_chef_id`) REFERENCES `episode_judges` (`episode_id`, `episode_year`, `chef_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_grading_episode_has_recipe1` FOREIGN KEY (`participant_chef_id`) REFERENCES `episode_has_recipe` (`chef_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grading`
--

LOCK TABLES `grading` WRITE;
/*!40000 ALTER TABLE `grading` DISABLE KEYS */;
INSERT INTO `grading` VALUES (1,2022,4,26,4),(1,2022,4,27,4),(1,2022,4,35,3),(1,2022,4,46,4),(1,2022,4,54,3),(1,2022,4,58,1),(1,2022,4,60,5),(1,2022,4,61,1),(1,2022,4,73,5),(1,2022,4,93,5),(1,2022,5,26,3),(1,2022,5,27,2),(1,2022,5,35,3),(1,2022,5,46,5),(1,2022,5,54,2),(1,2022,5,58,2),(1,2022,5,60,4),(1,2022,5,61,5),(1,2022,5,73,1),(1,2022,5,93,1),(1,2022,78,26,4),(1,2022,78,27,4),(1,2022,78,35,1),(1,2022,78,46,4),(1,2022,78,54,5),(1,2022,78,58,5),(1,2022,78,60,2),(1,2022,78,61,5),(1,2022,78,73,1),(1,2022,78,93,4),(1,2023,5,3,2),(1,2023,5,6,3),(1,2023,5,8,5),(1,2023,5,20,4),(1,2023,5,46,3),(1,2023,5,51,4),(1,2023,5,72,3),(1,2023,5,83,4),(1,2023,5,90,3),(1,2023,5,98,1),(1,2023,40,3,3),(1,2023,40,6,5),(1,2023,40,8,4),(1,2023,40,20,5),(1,2023,40,46,5),(1,2023,40,51,4),(1,2023,40,72,2),(1,2023,40,83,5),(1,2023,40,90,3),(1,2023,40,98,1),(1,2023,53,3,3),(1,2023,53,6,5),(1,2023,53,8,4),(1,2023,53,20,3),(1,2023,53,46,4),(1,2023,53,51,5),(1,2023,53,72,3),(1,2023,53,83,5),(1,2023,53,90,1),(1,2023,53,98,4),(1,2024,43,8,3),(1,2024,43,18,4),(1,2024,43,20,4),(1,2024,43,38,4),(1,2024,43,41,4),(1,2024,43,48,4),(1,2024,43,56,3),(1,2024,43,63,4),(1,2024,43,81,2),(1,2024,43,86,5),(1,2024,47,8,2),(1,2024,47,18,3),(1,2024,47,20,1),(1,2024,47,38,2),(1,2024,47,41,4),(1,2024,47,48,1),(1,2024,47,56,3),(1,2024,47,63,3),(1,2024,47,81,2),(1,2024,47,86,1),(1,2024,57,8,1),(1,2024,57,18,5),(1,2024,57,20,1),(1,2024,57,38,5),(1,2024,57,41,2),(1,2024,57,48,2),(1,2024,57,56,5),(1,2024,57,63,4),(1,2024,57,81,5),(1,2024,57,86,5),(2,2022,13,3,1),(2,2022,13,8,2),(2,2022,13,20,3),(2,2022,13,22,3),(2,2022,13,50,1),(2,2022,13,58,5),(2,2022,13,67,3),(2,2022,13,84,5),(2,2022,13,89,1),(2,2022,13,95,2),(2,2022,71,3,4),(2,2022,71,8,3),(2,2022,71,20,1),(2,2022,71,22,2),(2,2022,71,50,3),(2,2022,71,58,4),(2,2022,71,67,5),(2,2022,71,84,3),(2,2022,71,89,5),(2,2022,71,95,1),(2,2022,97,3,3),(2,2022,97,8,5),(2,2022,97,20,4),(2,2022,97,22,4),(2,2022,97,50,2),(2,2022,97,58,4),(2,2022,97,67,2),(2,2022,97,84,4),(2,2022,97,89,3),(2,2022,97,95,3),(2,2023,67,14,5),(2,2023,67,17,5),(2,2023,67,20,5),(2,2023,67,27,1),(2,2023,67,45,5),(2,2023,67,46,1),(2,2023,67,58,2),(2,2023,67,83,3),(2,2023,67,94,1),(2,2023,67,100,3),(2,2023,78,14,3),(2,2023,78,17,3),(2,2023,78,20,1),(2,2023,78,27,2),(2,2023,78,45,5),(2,2023,78,46,3),(2,2023,78,58,1),(2,2023,78,83,1),(2,2023,78,94,4),(2,2023,78,100,5),(2,2023,89,14,2),(2,2023,89,17,2),(2,2023,89,20,5),(2,2023,89,27,4),(2,2023,89,45,1),(2,2023,89,46,1),(2,2023,89,58,2),(2,2023,89,83,3),(2,2023,89,94,1),(2,2023,89,100,1),(2,2024,54,5,4),(2,2024,54,14,3),(2,2024,54,18,1),(2,2024,54,23,1),(2,2024,54,24,5),(2,2024,54,32,5),(2,2024,54,37,4),(2,2024,54,50,3),(2,2024,54,92,4),(2,2024,54,98,2),(2,2024,76,5,1),(2,2024,76,14,1),(2,2024,76,18,2),(2,2024,76,23,4),(2,2024,76,24,3),(2,2024,76,32,1),(2,2024,76,37,1),(2,2024,76,50,2),(2,2024,76,92,2),(2,2024,76,98,1),(2,2024,84,5,5),(2,2024,84,14,3),(2,2024,84,18,2),(2,2024,84,23,2),(2,2024,84,24,3),(2,2024,84,32,4),(2,2024,84,37,3),(2,2024,84,50,3),(2,2024,84,92,2),(2,2024,84,98,5),(3,2022,33,16,4),(3,2022,33,19,2),(3,2022,33,24,1),(3,2022,33,35,5),(3,2022,33,40,2),(3,2022,33,58,3),(3,2022,33,62,2),(3,2022,33,94,3),(3,2022,33,95,3),(3,2022,33,98,5),(3,2022,55,16,5),(3,2022,55,19,4),(3,2022,55,24,5),(3,2022,55,35,5),(3,2022,55,40,4),(3,2022,55,58,3),(3,2022,55,62,3),(3,2022,55,94,3),(3,2022,55,95,4),(3,2022,55,98,5),(3,2022,89,16,1),(3,2022,89,19,4),(3,2022,89,24,2),(3,2022,89,35,1),(3,2022,89,40,4),(3,2022,89,58,3),(3,2022,89,62,2),(3,2022,89,94,4),(3,2022,89,95,1),(3,2022,89,98,3),(3,2023,12,11,5),(3,2023,12,14,1),(3,2023,12,29,1),(3,2023,12,62,3),(3,2023,12,65,1),(3,2023,12,69,4),(3,2023,12,72,4),(3,2023,12,77,4),(3,2023,12,86,2),(3,2023,12,90,1),(3,2023,54,11,1),(3,2023,54,14,2),(3,2023,54,29,5),(3,2023,54,62,1),(3,2023,54,65,3),(3,2023,54,69,5),(3,2023,54,72,4),(3,2023,54,77,2),(3,2023,54,86,5),(3,2023,54,90,1),(3,2023,89,11,4),(3,2023,89,14,4),(3,2023,89,29,4),(3,2023,89,62,5),(3,2023,89,65,5),(3,2023,89,69,1),(3,2023,89,72,3),(3,2023,89,77,2),(3,2023,89,86,5),(3,2023,89,90,2),(3,2024,6,11,4),(3,2024,6,26,2),(3,2024,6,33,2),(3,2024,6,37,1),(3,2024,6,41,4),(3,2024,6,49,1),(3,2024,6,51,5),(3,2024,6,52,3),(3,2024,6,71,4),(3,2024,6,73,5),(3,2024,67,11,5),(3,2024,67,26,4),(3,2024,67,33,2),(3,2024,67,37,3),(3,2024,67,41,2),(3,2024,67,49,2),(3,2024,67,51,5),(3,2024,67,52,2),(3,2024,67,71,2),(3,2024,67,73,1),(3,2024,68,11,2),(3,2024,68,26,4),(3,2024,68,33,4),(3,2024,68,37,2),(3,2024,68,41,2),(3,2024,68,49,5),(3,2024,68,51,2),(3,2024,68,52,1),(3,2024,68,71,4),(3,2024,68,73,2),(4,2022,14,2,1),(4,2022,14,4,2),(4,2022,14,17,4),(4,2022,14,26,2),(4,2022,14,44,3),(4,2022,14,50,2),(4,2022,14,60,5),(4,2022,14,69,1),(4,2022,14,72,5),(4,2022,14,97,4),(4,2022,67,2,4),(4,2022,67,4,4),(4,2022,67,17,5),(4,2022,67,26,3),(4,2022,67,44,5),(4,2022,67,50,4),(4,2022,67,60,5),(4,2022,67,69,2),(4,2022,67,72,5),(4,2022,67,97,4),(4,2022,70,2,4),(4,2022,70,4,3),(4,2022,70,17,4),(4,2022,70,26,4),(4,2022,70,44,5),(4,2022,70,50,1),(4,2022,70,60,2),(4,2022,70,69,1),(4,2022,70,72,3),(4,2022,70,97,2),(4,2023,7,5,5),(4,2023,7,11,5),(4,2023,7,16,2),(4,2023,7,30,1),(4,2023,7,38,5),(4,2023,7,41,3),(4,2023,7,49,4),(4,2023,7,73,4),(4,2023,7,81,5),(4,2023,7,89,1),(4,2023,24,5,4),(4,2023,24,11,3),(4,2023,24,16,1),(4,2023,24,30,4),(4,2023,24,38,4),(4,2023,24,41,3),(4,2023,24,49,3),(4,2023,24,73,5),(4,2023,24,81,3),(4,2023,24,89,4),(4,2023,83,5,4),(4,2023,83,11,4),(4,2023,83,16,2),(4,2023,83,30,4),(4,2023,83,38,5),(4,2023,83,41,3),(4,2023,83,49,1),(4,2023,83,73,1),(4,2023,83,81,3),(4,2023,83,89,4),(4,2024,30,2,5),(4,2024,30,10,4),(4,2024,30,11,5),(4,2024,30,12,2),(4,2024,30,22,1),(4,2024,30,35,2),(4,2024,30,42,5),(4,2024,30,44,5),(4,2024,30,52,4),(4,2024,30,55,4),(4,2024,85,2,2),(4,2024,85,10,2),(4,2024,85,11,1),(4,2024,85,12,3),(4,2024,85,22,3),(4,2024,85,35,4),(4,2024,85,42,5),(4,2024,85,44,1),(4,2024,85,52,4),(4,2024,85,55,1),(4,2024,94,2,5),(4,2024,94,10,2),(4,2024,94,11,4),(4,2024,94,12,5),(4,2024,94,22,5),(4,2024,94,35,4),(4,2024,94,42,4),(4,2024,94,44,3),(4,2024,94,52,5),(4,2024,94,55,1),(5,2022,23,6,1),(5,2022,23,9,4),(5,2022,23,13,5),(5,2022,23,25,5),(5,2022,23,38,3),(5,2022,23,43,2),(5,2022,23,50,2),(5,2022,23,96,4),(5,2022,23,97,1),(5,2022,23,99,4),(5,2022,34,6,2),(5,2022,34,9,3),(5,2022,34,13,3),(5,2022,34,25,1),(5,2022,34,38,3),(5,2022,34,43,3),(5,2022,34,50,4),(5,2022,34,96,1),(5,2022,34,97,2),(5,2022,34,99,4),(5,2022,78,6,4),(5,2022,78,9,5),(5,2022,78,13,5),(5,2022,78,25,2),(5,2022,78,38,3),(5,2022,78,43,5),(5,2022,78,50,5),(5,2022,78,96,5),(5,2022,78,97,4),(5,2022,78,99,2),(5,2023,5,22,2),(5,2023,5,23,5),(5,2023,5,25,3),(5,2023,5,27,1),(5,2023,5,55,1),(5,2023,5,81,1),(5,2023,5,89,2),(5,2023,5,90,1),(5,2023,5,96,5),(5,2023,5,98,4),(5,2023,26,22,4),(5,2023,26,23,1),(5,2023,26,25,5),(5,2023,26,27,1),(5,2023,26,55,1),(5,2023,26,81,4),(5,2023,26,89,2),(5,2023,26,90,2),(5,2023,26,96,2),(5,2023,26,98,4),(5,2023,42,22,5),(5,2023,42,23,2),(5,2023,42,25,5),(5,2023,42,27,2),(5,2023,42,55,5),(5,2023,42,81,5),(5,2023,42,89,1),(5,2023,42,90,1),(5,2023,42,96,5),(5,2023,42,98,2),(5,2024,17,12,1),(5,2024,17,15,1),(5,2024,17,19,1),(5,2024,17,23,2),(5,2024,17,28,2),(5,2024,17,45,1),(5,2024,17,51,4),(5,2024,17,52,4),(5,2024,17,66,5),(5,2024,17,74,5),(5,2024,64,12,5),(5,2024,64,15,4),(5,2024,64,19,3),(5,2024,64,23,3),(5,2024,64,28,1),(5,2024,64,45,4),(5,2024,64,51,5),(5,2024,64,52,3),(5,2024,64,66,4),(5,2024,64,74,3),(5,2024,82,12,4),(5,2024,82,15,1),(5,2024,82,19,2),(5,2024,82,23,3),(5,2024,82,28,5),(5,2024,82,45,4),(5,2024,82,51,3),(5,2024,82,52,3),(5,2024,82,66,1),(5,2024,82,74,5),(6,2022,21,16,4),(6,2022,21,18,3),(6,2022,21,25,4),(6,2022,21,42,4),(6,2022,21,46,1),(6,2022,21,49,4),(6,2022,21,67,3),(6,2022,21,90,5),(6,2022,21,97,5),(6,2022,21,98,5),(6,2022,41,16,5),(6,2022,41,18,4),(6,2022,41,25,1),(6,2022,41,42,2),(6,2022,41,46,2),(6,2022,41,49,2),(6,2022,41,67,3),(6,2022,41,90,2),(6,2022,41,97,1),(6,2022,41,98,2),(6,2022,84,16,5),(6,2022,84,18,1),(6,2022,84,25,5),(6,2022,84,42,3),(6,2022,84,46,1),(6,2022,84,49,4),(6,2022,84,67,2),(6,2022,84,90,5),(6,2022,84,97,4),(6,2022,84,98,2),(6,2023,75,11,1),(6,2023,75,19,1),(6,2023,75,21,3),(6,2023,75,26,2),(6,2023,75,49,5),(6,2023,75,51,1),(6,2023,75,57,5),(6,2023,75,59,3),(6,2023,75,81,5),(6,2023,75,97,1),(6,2023,86,11,5),(6,2023,86,19,4),(6,2023,86,21,3),(6,2023,86,26,2),(6,2023,86,49,4),(6,2023,86,51,3),(6,2023,86,57,5),(6,2023,86,59,5),(6,2023,86,81,1),(6,2023,86,97,5),(6,2023,95,11,1),(6,2023,95,19,5),(6,2023,95,21,1),(6,2023,95,26,5),(6,2023,95,49,4),(6,2023,95,51,2),(6,2023,95,57,3),(6,2023,95,59,5),(6,2023,95,81,5),(6,2023,95,97,4),(6,2024,48,6,1),(6,2024,48,10,1),(6,2024,48,16,4),(6,2024,48,17,1),(6,2024,48,19,4),(6,2024,48,22,3),(6,2024,48,24,4),(6,2024,48,27,1),(6,2024,48,82,5),(6,2024,48,98,4),(6,2024,87,6,4),(6,2024,87,10,5),(6,2024,87,16,2),(6,2024,87,17,4),(6,2024,87,19,4),(6,2024,87,22,5),(6,2024,87,24,1),(6,2024,87,27,2),(6,2024,87,82,4),(6,2024,87,98,3),(6,2024,94,6,1),(6,2024,94,10,4),(6,2024,94,16,3),(6,2024,94,17,1),(6,2024,94,19,5),(6,2024,94,22,4),(6,2024,94,24,4),(6,2024,94,27,3),(6,2024,94,82,2),(6,2024,94,98,5),(7,2022,7,3,1),(7,2022,7,18,1),(7,2022,7,20,3),(7,2022,7,21,4),(7,2022,7,26,1),(7,2022,7,28,4),(7,2022,7,48,3),(7,2022,7,59,1),(7,2022,7,68,4),(7,2022,7,94,3),(7,2022,81,3,1),(7,2022,81,18,4),(7,2022,81,20,5),(7,2022,81,21,1),(7,2022,81,26,2),(7,2022,81,28,5),(7,2022,81,48,4),(7,2022,81,59,2),(7,2022,81,68,2),(7,2022,81,94,5),(7,2022,85,3,1),(7,2022,85,18,2),(7,2022,85,20,4),(7,2022,85,21,2),(7,2022,85,26,5),(7,2022,85,28,4),(7,2022,85,48,2),(7,2022,85,59,2),(7,2022,85,68,4),(7,2022,85,94,4),(7,2023,24,3,3),(7,2023,24,8,2),(7,2023,24,16,2),(7,2023,24,25,5),(7,2023,24,50,5),(7,2023,24,67,5),(7,2023,24,74,5),(7,2023,24,79,5),(7,2023,24,90,4),(7,2023,24,95,3),(7,2023,48,3,3),(7,2023,48,8,2),(7,2023,48,16,1),(7,2023,48,25,5),(7,2023,48,50,4),(7,2023,48,67,3),(7,2023,48,74,2),(7,2023,48,79,4),(7,2023,48,90,5),(7,2023,48,95,2),(7,2023,72,3,2),(7,2023,72,8,1),(7,2023,72,16,5),(7,2023,72,25,1),(7,2023,72,50,4),(7,2023,72,67,2),(7,2023,72,74,3),(7,2023,72,79,3),(7,2023,72,90,3),(7,2023,72,95,5),(7,2024,11,6,3),(7,2024,11,15,1),(7,2024,11,16,2),(7,2024,11,17,3),(7,2024,11,25,5),(7,2024,11,49,3),(7,2024,11,53,4),(7,2024,11,78,5),(7,2024,11,97,2),(7,2024,11,98,1),(7,2024,60,6,3),(7,2024,60,15,5),(7,2024,60,16,3),(7,2024,60,17,2),(7,2024,60,25,1),(7,2024,60,49,4),(7,2024,60,53,3),(7,2024,60,78,4),(7,2024,60,97,1),(7,2024,60,98,2),(7,2024,100,6,1),(7,2024,100,15,1),(7,2024,100,16,3),(7,2024,100,17,3),(7,2024,100,25,1),(7,2024,100,49,3),(7,2024,100,53,2),(7,2024,100,78,4),(7,2024,100,97,2),(7,2024,100,98,4),(8,2022,1,4,1),(8,2022,1,8,2),(8,2022,1,9,2),(8,2022,1,17,3),(8,2022,1,19,1),(8,2022,1,25,5),(8,2022,1,26,2),(8,2022,1,38,5),(8,2022,1,55,1),(8,2022,1,72,3),(8,2022,10,4,3),(8,2022,10,8,3),(8,2022,10,9,2),(8,2022,10,17,4),(8,2022,10,19,3),(8,2022,10,25,2),(8,2022,10,26,1),(8,2022,10,38,5),(8,2022,10,55,4),(8,2022,10,72,1),(8,2022,95,4,5),(8,2022,95,8,4),(8,2022,95,9,3),(8,2022,95,17,2),(8,2022,95,19,2),(8,2022,95,25,4),(8,2022,95,26,4),(8,2022,95,38,3),(8,2022,95,55,1),(8,2022,95,72,2),(8,2023,58,18,2),(8,2023,58,20,5),(8,2023,58,21,3),(8,2023,58,23,4),(8,2023,58,38,3),(8,2023,58,41,1),(8,2023,58,45,2),(8,2023,58,49,1),(8,2023,58,93,2),(8,2023,58,99,2),(8,2023,71,18,5),(8,2023,71,20,2),(8,2023,71,21,5),(8,2023,71,23,1),(8,2023,71,38,1),(8,2023,71,41,2),(8,2023,71,45,3),(8,2023,71,49,1),(8,2023,71,93,4),(8,2023,71,99,5),(8,2023,91,18,3),(8,2023,91,20,1),(8,2023,91,21,5),(8,2023,91,23,5),(8,2023,91,38,1),(8,2023,91,41,5),(8,2023,91,45,3),(8,2023,91,49,1),(8,2023,91,93,1),(8,2023,91,99,2),(8,2024,4,6,1),(8,2024,4,18,3),(8,2024,4,26,2),(8,2024,4,27,1),(8,2024,4,42,4),(8,2024,4,71,5),(8,2024,4,73,3),(8,2024,4,74,3),(8,2024,4,76,2),(8,2024,4,77,2),(8,2024,17,6,1),(8,2024,17,18,5),(8,2024,17,26,2),(8,2024,17,27,2),(8,2024,17,42,4),(8,2024,17,71,2),(8,2024,17,73,3),(8,2024,17,74,1),(8,2024,17,76,4),(8,2024,17,77,4),(8,2024,99,6,5),(8,2024,99,18,5),(8,2024,99,26,2),(8,2024,99,27,5),(8,2024,99,42,5),(8,2024,99,71,2),(8,2024,99,73,1),(8,2024,99,74,3),(8,2024,99,76,3),(8,2024,99,77,1),(9,2022,61,10,4),(9,2022,61,11,4),(9,2022,61,25,5),(9,2022,61,35,3),(9,2022,61,45,4),(9,2022,61,54,2),(9,2022,61,65,5),(9,2022,61,69,1),(9,2022,61,84,4),(9,2022,61,95,4),(9,2022,76,10,1),(9,2022,76,11,1),(9,2022,76,25,5),(9,2022,76,35,2),(9,2022,76,45,1),(9,2022,76,54,5),(9,2022,76,65,5),(9,2022,76,69,5),(9,2022,76,84,5),(9,2022,76,95,4),(9,2022,83,10,3),(9,2022,83,11,3),(9,2022,83,25,5),(9,2022,83,35,2),(9,2022,83,45,1),(9,2022,83,54,1),(9,2022,83,65,3),(9,2022,83,69,3),(9,2022,83,84,3),(9,2022,83,95,2),(9,2023,7,2,3),(9,2023,7,6,5),(9,2023,7,38,1),(9,2023,7,50,4),(9,2023,7,53,1),(9,2023,7,74,2),(9,2023,7,85,5),(9,2023,7,94,2),(9,2023,7,97,2),(9,2023,7,98,4),(9,2023,35,2,2),(9,2023,35,6,4),(9,2023,35,38,4),(9,2023,35,50,1),(9,2023,35,53,1),(9,2023,35,74,2),(9,2023,35,85,3),(9,2023,35,94,5),(9,2023,35,97,4),(9,2023,35,98,1),(9,2023,63,2,2),(9,2023,63,6,2),(9,2023,63,38,1),(9,2023,63,50,4),(9,2023,63,53,5),(9,2023,63,74,5),(9,2023,63,85,4),(9,2023,63,94,3),(9,2023,63,97,4),(9,2023,63,98,5),(9,2024,10,6,3),(9,2024,10,11,1),(9,2024,10,32,2),(9,2024,10,43,3),(9,2024,10,56,4),(9,2024,10,60,4),(9,2024,10,74,1),(9,2024,10,90,5),(9,2024,10,94,3),(9,2024,10,99,4),(9,2024,41,6,4),(9,2024,41,11,1),(9,2024,41,32,1),(9,2024,41,43,3),(9,2024,41,56,5),(9,2024,41,60,2),(9,2024,41,74,4),(9,2024,41,90,1),(9,2024,41,94,3),(9,2024,41,99,1),(9,2024,73,6,2),(9,2024,73,11,4),(9,2024,73,32,3),(9,2024,73,43,5),(9,2024,73,56,1),(9,2024,73,60,1),(9,2024,73,74,3),(9,2024,73,90,4),(9,2024,73,94,4),(9,2024,73,99,3),(10,2022,54,8,4),(10,2022,54,25,5),(10,2022,54,37,4),(10,2022,54,38,4),(10,2022,54,41,5),(10,2022,54,48,5),(10,2022,54,71,4),(10,2022,54,84,3),(10,2022,54,93,5),(10,2022,54,98,3),(10,2022,79,8,1),(10,2022,79,25,3),(10,2022,79,37,1),(10,2022,79,38,1),(10,2022,79,41,3),(10,2022,79,48,4),(10,2022,79,71,3),(10,2022,79,84,1),(10,2022,79,93,3),(10,2022,79,98,3),(10,2022,89,8,2),(10,2022,89,25,1),(10,2022,89,37,3),(10,2022,89,38,4),(10,2022,89,41,4),(10,2022,89,48,2),(10,2022,89,71,3),(10,2022,89,84,4),(10,2022,89,93,2),(10,2022,89,98,5),(10,2023,32,1,5),(10,2023,32,34,2),(10,2023,32,37,2),(10,2023,32,38,5),(10,2023,32,39,2),(10,2023,32,49,1),(10,2023,32,51,3),(10,2023,32,54,2),(10,2023,32,72,2),(10,2023,32,81,1),(10,2023,73,1,2),(10,2023,73,34,5),(10,2023,73,37,5),(10,2023,73,38,1),(10,2023,73,39,5),(10,2023,73,49,1),(10,2023,73,51,4),(10,2023,73,54,4),(10,2023,73,72,4),(10,2023,73,81,1),(10,2023,87,1,5),(10,2023,87,34,5),(10,2023,87,37,5),(10,2023,87,38,2),(10,2023,87,39,1),(10,2023,87,49,4),(10,2023,87,51,4),(10,2023,87,54,1),(10,2023,87,72,3),(10,2023,87,81,4),(10,2024,15,5,1),(10,2024,15,10,4),(10,2024,15,43,3),(10,2024,15,46,2),(10,2024,15,51,5),(10,2024,15,54,2),(10,2024,15,74,1),(10,2024,15,78,1),(10,2024,15,92,4),(10,2024,15,97,4),(10,2024,30,5,3),(10,2024,30,10,3),(10,2024,30,43,5),(10,2024,30,46,3),(10,2024,30,51,4),(10,2024,30,54,2),(10,2024,30,74,3),(10,2024,30,78,1),(10,2024,30,92,5),(10,2024,30,97,3),(10,2024,87,5,5),(10,2024,87,10,1),(10,2024,87,43,1),(10,2024,87,46,2),(10,2024,87,51,3),(10,2024,87,54,2),(10,2024,87,74,5),(10,2024,87,78,4),(10,2024,87,92,1),(10,2024,87,97,4);
/*!40000 ALTER TABLE `grading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `image_url` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3011 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (0,'error image not found','no url found'),(1,'greek cuisine','https://thumbs.dreamstime.com/b/greek-food-table-scene-top-down-view-dark-background-souvlaki-gyros-wraps-salad-spanakopita-dolmades-pita-lemon-potatoes-225466730.jpg'),(2,'french cuisine','https://media.istockphoto.com/id/584597902/vector/french-cuisine-icons.jpg?s=612x612&w=0&k=20&c=-mAbhivcSqKAoTyHFZ27fH5XmlSgS-f9EUrl9Hf10IE='),(3,'indian cuisine','https://t4.ftcdn.net/jpg/02/84/46/89/360_F_284468940_1bg6BwgOfjCnE3W0wkMVMVqddJgtMynE.jpg'),(4,'italian cuisine','https://media.istockphoto.com/id/1227415751/photo/full-table-of-italian-meals-on-plates-pizza-pasta-ravioli-carpaccio-caprese-salad-and-tomato.jpg?s=612x612&w=0&k=20&c=0qCRhYGQw0w6ahhVX-4ezayA9r81A81cwbPDbgRlC5s='),(5,'japanese cuisine','https://media.gettyimages.com/id/1300135479/photo/traditional-japanese-dishes-sushi-and-sushi-roll-set-rice-bowls-tuna-tataki.jpg?s=612x612&w=gi&k=20&c=gCZVauon73_wj5BThVQP3axU062jV1udZwApn4yZzEI='),(6,'chinese cuisine','https://media.istockphoto.com/id/545286388/photo/chinese-food-blank-background.jpg?s=612x612&w=0&k=20&c=pqOIy07YKO5PlU5VxjscwTGRrrZ8PluKMUjSOz-II60='),(7,'mexican cuisine','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlt4IkGPmtzTYHsFrhUfHZsl7D9oR_XoDeKyEGRJEPMw&s'),(8,'german cuisine','https://t3.ftcdn.net/jpg/02/90/54/44/360_F_290544453_eut3D4HHoR9DnZaLqFJLgPhyj25mMLFq.jpg'),(9,'korean cuisine','https://www.shutterstock.com/shutterstock/photos/2327701667/display_1500/stock-photo-korean-foods-served-on-a-dining-table-perfect-for-photo-illustration-article-or-any-cooking-2327701667.jpg'),(10,'turkish cuisine','https://t3.ftcdn.net/jpg/02/72/40/16/360_F_272401663_Oz1FHbPJjmTSsOArkkb4X8pUeiVxDueR.jpg'),(11,'albanian cuisine','https://irp.cdn-website.com/560b6587/dms3rep/multi/image20-f1109880.png'),(12,'american cuisine','https://t3.ftcdn.net/jpg/01/92/00/86/360_F_192008611_KrKZcq3NyiNSksLVPc76SQyBeXOfq1o0.jpg'),(13,'bulgarian cuisine','https://www.shutterstock.com/image-photo/traditional-uzbek-oriental-cuisine-family-600nw-1146169040.jpg'),(14,'russian cuisine','https://t3.ftcdn.net/jpg/03/00/22/82/360_F_300228239_Fb5WbnaOmvjdPLOieoxlpiR9hBaz4PL9.jpg'),(2001,'Cabbage carrots etc','https://img.freepik.com/free-vector/vegetables-icons-set_1284-21276.jpg?size=338&ext=jpg&ga=GA1.1.2082370165.1715904000&semt=sph'),(2002,'Apples bananas etc','https://img.freepik.com/free-photo/vibrant-collection-healthy-fruit-vegetables-generated-by-ai_24640-80425.jpg'),(2003,'Potato cereal etc','https://media02.stockfood.com/largepreviews/Mzk5Mzg4NQ==/00128835-Cereals-bread-spaghetti-potatoes-and-rice.jpg'),(2004,'Milk, cheese etc','https://img.freepik.com/free-photo/view-allergens-commonly-found-dairy_23-2150170319.jpg'),(2005,'Peas beans etc','https://publish.purewow.net/wp-content/uploads/sites/2/2022/07/types-of-legumes-hero.jpg?resize=720%2C780'),(2006,'Beef pork etc','https://www.shutterstock.com/image-photo/fresh-raw-beef-steaks-on-260nw-1457200706.jpg'),(2007,'Chicken etc','https://media.istockphoto.com/id/93456512/photo/raw-chicken.jpg?s=612x612&w=0&k=20&c=UuvFL4g04JjBtrBdF9dAVReSUxELJey3CHEZv5z9OyE='),(2008,'Eggs (come on)','https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg'),(2009,'fish shrimps etc','https://media.istockphoto.com/id/520490716/photo/seafood-on-ice.jpg?s=612x612&w=0&k=20&c=snyxGY26viNQ6BWqW-ez4U7tAO65Z_tmAFPMobiZ9Q4='),(2010,'Olives Nuts etc','https://media.istockphoto.com/id/1332649193/photo/oil-hazelnut-in-sauceboat-on-board.jpg?s=612x612&w=0&k=20&c=jv7yA9YdXRHSBcJEqayZjQqRctZZGmD_WbX1jFMsHfE='),(3001,'A vibrant and festive theme featuring a taco bar','https://media-cdn.tripadvisor.com/media/photo-s/19/a5/2b/8a/taco-fiesta-bali.jpg'),(3002,'A theme inspired by the flavors of the Mediterranean','https://www.shutterstock.com/image-illustration/set-delicious-tasty-spanish-delights-260nw-609078893.jpg'),(3003,'Classic Italian fare with a cozy trattoria ambiance','https://www.shutterstock.com/shutterstock/photos/1054754711/display_1500/stock-photo-view-of-a-small-local-restaurant-or-trattoria-in-italy-1054754711.jpg'),(3004,'A hearty barbecue feast with grilled meats','https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F702364939%2F1334550967343%2F1%2Foriginal.20240221-201702?w=1000&auto=format%2Ccompress&q=75&sharp=10&s=af66148673e16cfa8cf0d7a496ae94a3'),(3005,'A mix of popular dishes from different Asian cuisines','https://media.istockphoto.com/id/1317255793/photo/rijsttafel-nusantara-an-elaborate-meal-of-indonesian-dishes.jpg?s=612x612&w=0&k=20&c=F_CtvP1w7CMbth0vyT-aqzkB3D5TqZbnwgLc7tbpnsc='),(3006,'A theme centered around fresh locally-sourced ingredients','https://media.istockphoto.com/id/1346744481/photo/anonymous-chef-harvesting-fresh-vegetables-on-a-farm.jpg?s=612x612&w=0&k=20&c=U9h4fAi68nwVndAJW8TF-f2lFFCO2Y-XrZWA2gah1Xw='),(3007,'A feast for seafood lovers','https://st.depositphotos.com/20827338/57620/i/450/depositphotos_576201884-stock-photo-seafood-plate-shrimp-shellfish-crab.jpg'),(3008,'Elegant and classic French dishes','https://www.shutterstock.com/image-photo/cozy-street-tables-cafe-paris-260nw-1078952957.jpg'),(3009,'Comfort food from the American South','https://vintagemattituck.com/cdn/shop/products/Southern-Comfort-Whiskey-750ml_1024x1024.jpg?v=1577747836'),(3010,'An array of street food from around the world','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWEqUB0xkb-EHP0I9Ev9mYy6cf3idzoaX6I0vyxlTVkA&s');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `name` varchar(64) NOT NULL,
  `cal_per_100` int DEFAULT NULL,
  `food_team_short_name` varchar(64) NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`name`),
  KEY `fk_ingredient_food_team1_idx` (`food_team_short_name`),
  KEY `fk_ingredient_image1_idx` (`image_id`),
  CONSTRAINT `fk_ingredient_food_team1` FOREIGN KEY (`food_team_short_name`) REFERENCES `food_team` (`short_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ingredient_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES ('apple',0,'vegetarian',0),('bacon',300,'vegetarian',0),('baking powder',0,'dairy',0),('baking soda',0,'fruity',0),('barbecue sauce',0,'dairy',0),('bay leaf',300,'eggy',0),('beef',100,'white-carnivorous',0),('beef broth',0,'dairy',0),('beets',0,'fruity',0),('black pepper',200,'fruity',0),('bread',200,'seafood',0),('breadcrumbs',300,'dairy',0),('brown sugar',300,'vegetarian',0),('buckwheat groat',300,'dairy',0),('butter',700,'oil-nuts',0),('cabbage',0,'legumy',0),('canned shrimp',100,'red-carnivorous',0),('carrots',0,'oil-nuts',0),('celery',0,'legumy',0),('cheddar cheese',400,'potatoy',0),('chicken',200,'white-carnivorous',0),('chili powder',0,'oil-nuts',0),('chocolate',400,'vegetarian',0),('chocolate chip',500,'oil-nuts',0),('cinnamon',200,'fruity',0),('clams',100,'dairy',0),('cloves',200,'red-carnivorous',0),('cooked chicken',100,'legumy',0),('cottage cheese',0,'fruity',0),('cream',300,'oil-nuts',0),('cucumber',0,'dairy',0),('dark chocolate',500,'vegetarian',0),('dill weed',0,'red-carnivorous',0),('dough',200,'seafood',0),('dried thyme',200,'oil-nuts',0),('egg',100,'legumy',0),('egg white',0,'oil-nuts',0),('eggplant',0,'white-carnivorous',0),('feta cheese',200,'seafood',0),('flour',300,'potatoy',0),('garlic',100,'red-carnivorous',0),('garlic powder',300,'eggy',0),('ginger',0,'vegetarian',0),('green peas',0,'red-carnivorous',0),('ground beef',200,'eggy',0),('hamburger buns',200,'eggy',0),('heavy whipping cream',300,'red-carnivorous',0),('honey',300,'dairy',0),('lamb',600,'legumy',0),('lemon',0,'potatoy',0),('lemon juice',0,'oil-nuts',0),('lettuce',0,'oil-nuts',0),('maple syrup',200,'dairy',0),('mayonnaise',0,'dairy',0),('mint',0,'white-carnivorous',0),('mussels',0,'legumy',0),('mustard',0,'seafood',0),('nuts',600,'white-carnivorous',0),('oil',9800,'red-carnivorous',0),('olive oil',800,'fruity',0),('onions',0,'seafood',0),('paprika',200,'oil-nuts',0),('parsley',0,'dairy',0),('pasta',300,'seafood',0),('phyllo dough',200,'eggy',0),('pickle',0,'red-carnivorous',0),('pork',100,'eggy',0),('potato',0,'eggy',0),('powdered sugar',300,'white-carnivorous',0),('red bell pepper',0,'vegetarian',0),('ribs',200,'legumy',0),('rice',300,'vegetarian',0),('salt',0,'eggy',0),('saltine crackers',400,'seafood',0),('sirloin steak',200,'red-carnivorous',0),('sour cream',100,'seafood',0),('spinach',0,'eggy',0),('sugar',300,'legumy',0),('tomato',0,'red-carnivorous',0),('tomato paste',0,'eggy',0),('tomato sauce',0,'oil-nuts',0),('unbleached flour',300,'red-carnivorous',0),('unsweetened cocoa powder',200,'eggy',0),('vanilla extract',200,'red-carnivorous',0),('vegetable oil',9800,'fruity',0),('walnuts',600,'red-carnivorous',0),('water',0,'seafood',0),('white bean',300,'legumy',0),('white mushroom',0,'dairy',0),('white vinegar',0,'oil-nuts',0),('white wine',0,'red-carnivorous',0),('whole milk',0,'seafood',0),('yeast',300,'eggy',0),('yogurt',0,'seafood',0),('zucchini',0,'fruity',0);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `my_profile`
--

DROP TABLE IF EXISTS `my_profile`;
/*!50001 DROP VIEW IF EXISTS `my_profile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_profile` AS SELECT 
 1 AS `id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `phone`,
 1 AS `date_of_birth`,
 1 AS `age`,
 1 AS `years_exp`,
 1 AS `rank`,
 1 AS `image_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `my_recipes`
--

DROP TABLE IF EXISTS `my_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_recipes` (
  `type` enum('Cooking','Pastry') NOT NULL,
  `difficulty` tinyint NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `prep_time_m` int NOT NULL,
  `cook_time_m` int NOT NULL COMMENT 'in minutes\n',
  `cuisine_name` varchar(128) NOT NULL,
  `ingredient_name` varchar(64) NOT NULL,
  `portions` int NOT NULL,
  `image_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_recipes`
--

LOCK TABLES `my_recipes` WRITE;
/*!40000 ALTER TABLE `my_recipes` DISABLE KEYS */;
INSERT INTO `my_recipes` VALUES ('Cooking',2,'Mekitsa','A traditional Bulgarian breakfast, mekitsa is a deep-fried dough pastry, served with powdered sugar, honey, or jam.',30,15,'Turkish','flour',1,0),('Cooking',2,'Mish me midhje','A seafood dish featuring sautéed mussels with garlic, wine, and fresh herbs, often served over pasta or with crusty bread.',15,30,'Turkish','mussels',1,0),('Pastry',4,'Zefir','A type of soft confectionery made by whipping fruit and berry purée with sugar and egg whites, similar to marshmallows.',45,0,'Turkish','apple',1,0),('Pastry',1,'Testitsio','An insert test recipe',42,7,'Greek','water',4,0);
/*!40000 ALTER TABLE `my_recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_recipes_insert` AFTER INSERT ON `my_recipes` FOR EACH ROW BEGIN
	INSERT INTO recipe (type, difficulty, name, description, prep_time_m, cook_time_m, cuisine_name, ingredient_name, portions, image_id)
		VALUES (NEW.type, NEW.difficulty, NEW.name, NEW.description, NEW.prep_time_m, NEW.cook_time_m, NEW.cuisine_name, NEW.ingredient_name, NEW.portions, NEW.image_id);
    INSERT INTO recipe_has_chef (recipe_name, recipe_cuisine_name, chef_id) VALUES (NEW.name, NEW.cuisine_name, 1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_recipes_update` AFTER UPDATE ON `my_recipes` FOR EACH ROW BEGIN
	DELETE FROM recipe_has_chef WHERE recipe_name=OLD.name AND recipe_cuisine_name=OLD.cuisine_name AND chef_id=1;
	DELETE FROM recipe WHERE name=OLD.name AND cuisine_name=OLD.cuisine_name;
    INSERT INTO recipe (type, difficulty, name, description, prep_time_m, cook_time_m, cuisine_name, ingredient_name, portions, image_id)
		VALUES (NEW.type, NEW.difficulty, NEW.name, NEW.description, NEW.prep_time_m, NEW.cook_time_m, NEW.cuisine_name, NEW.ingredient_name, NEW.portions, NEW.image_id);
    INSERT INTO recipe_has_chef (recipe_name, recipe_cuisine_name, chef_id) VALUES (NEW.name, NEW.cuisine_name, 1);
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `my_recipes_equipment`
--

DROP TABLE IF EXISTS `my_recipes_equipment`;
/*!50001 DROP VIEW IF EXISTS `my_recipes_equipment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_recipes_equipment` AS SELECT 
 1 AS `recipe_name`,
 1 AS `recipe_cuisine_name`,
 1 AS `name`,
 1 AS `manual`,
 1 AS `image_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `my_recipes_ingredients`
--

DROP TABLE IF EXISTS `my_recipes_ingredients`;
/*!50001 DROP VIEW IF EXISTS `my_recipes_ingredients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_recipes_ingredients` AS SELECT 
 1 AS `recipe_name`,
 1 AS `recipe_cuisine_name`,
 1 AS `ingredient_name`,
 1 AS `quantity`,
 1 AS `cal_per_100`,
 1 AS `food_team_short_name`,
 1 AS `image_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `my_recipes_labels`
--

DROP TABLE IF EXISTS `my_recipes_labels`;
/*!50001 DROP VIEW IF EXISTS `my_recipes_labels`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_recipes_labels` AS SELECT 
 1 AS `recipe_name`,
 1 AS `recipe_cuisine_name`,
 1 AS `label_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `my_recipes_meals`
--

DROP TABLE IF EXISTS `my_recipes_meals`;
/*!50001 DROP VIEW IF EXISTS `my_recipes_meals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_recipes_meals` AS SELECT 
 1 AS `recipe_name`,
 1 AS `recipe_cuisine_name`,
 1 AS `meal_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `my_recipes_steps`
--

DROP TABLE IF EXISTS `my_recipes_steps`;
/*!50001 DROP VIEW IF EXISTS `my_recipes_steps`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_recipes_steps` AS SELECT 
 1 AS `recipe_name`,
 1 AS `recipe_cuisine_name`,
 1 AS `number`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `my_recipes_themes`
--

DROP TABLE IF EXISTS `my_recipes_themes`;
/*!50001 DROP VIEW IF EXISTS `my_recipes_themes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_recipes_themes` AS SELECT 
 1 AS `recipe_name`,
 1 AS `recipe_cuisine_name`,
 1 AS `theme_name`,
 1 AS `description`,
 1 AS `image_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `my_recipes_tips`
--

DROP TABLE IF EXISTS `my_recipes_tips`;
/*!50001 DROP VIEW IF EXISTS `my_recipes_tips`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_recipes_tips` AS SELECT 
 1 AS `recipe_name`,
 1 AS `recipe_cuisine_name`,
 1 AS `tip_id`,
 1 AS `tip`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `type` enum('Cooking','Pastry') NOT NULL,
  `difficulty` tinyint NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `prep_time_m` int NOT NULL,
  `cook_time_m` int NOT NULL COMMENT 'in minutes\n',
  `cuisine_name` varchar(128) NOT NULL,
  `ingredient_name` varchar(64) NOT NULL,
  `portions` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`name`,`cuisine_name`),
  KEY `fk_recipe_cuisine_idx` (`cuisine_name`),
  KEY `fk_recipe_ingredient1_idx` (`ingredient_name`),
  KEY `fk_recipe_image1_idx` (`image_id`),
  CONSTRAINT `fk_recipe_cuisine` FOREIGN KEY (`cuisine_name`) REFERENCES `cuisine` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_ingredient1` FOREIGN KEY (`ingredient_name`) REFERENCES `ingredient` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `recipe_chk_1` CHECK (((`difficulty` > 0) and (`difficulty` < 6)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES ('Pastry',3,'Apple Pie','A traditional American dessert, this apple pie features a flaky pastry crust filled with sweet and spicy cinnamon apple filling.',30,45,'American','unbleached flour',1,0),('Pastry',4,'Bakllasarem','A sweet pastry filled with a mixture of walnuts, sugar, and cinnamon, similar to baklava.',30,45,'French','phyllo dough',1,0),('Cooking',3,'Banitsa','A traditional Bulgarian pastry made from layers of phyllo dough filled with eggs and cheese.',20,40,'Korean','phyllo dough',1,0),('Cooking',3,'Barbecue Ribs','Slow-cooked pork ribs slathered in barbecue sauce, grilled until tender and caramelized.',15,180,'Greek','ribs',1,0),('Cooking',3,'Beef Stroganoff','A classic rich and creamy Russian dish featuring sautéed pieces of beef served in a sauce with smetana (sour cream).',15,30,'Indian','sirloin steak',1,0),('Cooking',1,'BLT Sandwich','A simple but delicious sandwich with bacon, lettuce, and tomato, served on toasted bread with mayonnaise.',5,10,'Italian','bacon',1,0),('Cooking',2,'Borscht','A hearty beet soup traditionally served hot or cold with a dollop of sour cream.',20,120,'Japanese','beets',1,0),('Pastry',2,'Brownies','Rich, fudgy chocolate brownies with a moist center and crispy edges, filled with chunks of chocolate.',10,25,'Chinese','butter',1,0),('Cooking',1,'Bulgarian Cheese Toast','A quick and satisfying breakfast item made with bread, Bulgarian cheese, and often topped with a fried egg.',5,5,'Russian','bread',1,0),('Cooking',3,'Byrek me Spinaq','A savory pie made with phyllo dough, filled with spinach and feta cheese.',20,30,'Japanese','phyllo dough',1,0),('Cooking',2,'Cheeseburger','A classic American cheeseburger with a juicy beef patty, topped with cheddar cheese, lettuce, tomato, onions, and pickles, served on a toasted bun.',10,10,'Albanian','ground beef',1,0),('Pastry',2,'Chocolate Chip Cookies','Classic soft and chewy chocolate chip cookies, loaded with chocolate chips and baked to perfection.',15,10,'Indian','unbleached flour',1,0),('Cooking',3,'Clam Chowder','A creamy New England clam chowder, rich with clams, potatoes, onions, and celery, thickened with cream and served with oyster crackers.',20,45,'Japanese','bacon',1,0),('Cooking',2,'Fërgesë','A hearty dish of peppers, tomatoes, and cottage cheese, often served as a warm side dish or main course.',15,30,'Indian','red bell pepper',1,0),('Cooking',2,'Fried Chicken','Crispy fried chicken, seasoned with a blend of spices and fried to a perfect golden brown.',20,20,'Bulgarian','chicken',1,0),('Pastry',4,'Garash Cake','A rich chocolate cake made with layers of walnut sponge cake and dark chocolate ganache, named after the Hungarian pastry chef Garash.',30,30,'Greek','egg white',1,0),('Cooking',2,'Jani me fasule','A traditional bean stew slowly cooked with onions, tomatoes, and spices.',15,120,'Chinese','white bean',1,0),('Pastry',3,'Kadaif','A dessert of shredded phyllo dough, baked with nuts and saturated with syrup.',20,40,'Bulgarian','dough',1,0),('Cooking',1,'Kasha','A staple of Russian cuisine, kasha refers to any grain cooked in water or milk, often served as a side dish.',5,25,'German','buckwheat groat',1,0),('Cooking',3,'Kavarma','A hearty Bulgarian stew made with meat (typically pork or chicken), onions, mushrooms, and peppers, seasoned with paprika and herbs.',20,60,'German','pork',1,0),('Cooking',2,'Macaroni and Cheese','A creamy, cheesy macaroni and cheese dish, baked until bubbly and golden.',10,20,'Russian','pasta',1,0),('Pastry',4,'Medovik','A popular Russian honey cake featuring several thin layers of cake filled with sweetened sour cream.',30,60,'Italian','honey',1,0),('Cooking',2,'Mekitsa','A traditional Bulgarian breakfast, mekitsa is a deep-fried dough pastry, served with powdered sugar, honey, or jam.',30,15,'Turkish','flour',1,0),('Cooking',2,'Mish me midhje','A seafood dish featuring sautéed mussels with garlic, wine, and fresh herbs, often served over pasta or with crusty bread.',15,30,'Turkish','mussels',1,0),('Cooking',3,'Musaka','Bulgarian style moussaka is a baked dish of potatoes, minced meat, and a topping of yogurt and eggs, similar to the Greek version but without eggplant.',30,90,'Albanian','potato',1,0),('Cooking',2,'Olivier Salad','Also known as Russian Salad, this dish is a combination of diced potatoes, vegetables, eggs, and meat dressed with mayonnaise.',30,20,'Albanian','potato',1,0),('Cooking',1,'Pancakes','Fluffy American pancakes, served hot with butter and maple syrup.',10,15,'French','unbleached flour',1,0),('Cooking',4,'Pelmeni','Traditional Russian dumplings filled with minced meat and wrapped in a thin dough, served with butter or sour cream.',60,10,'Chinese','flour',1,0),('Cooking',1,'Përime në zgare','A variety of grilled vegetables, typically seasoned with olive oil, salt, and herbs.',10,15,'Korean','zucchini',1,0),('Pastry',3,'Pryaniki','Traditional Russian honey bread cookies spiced with ginger and cloves, often glazed with sugar icing.',20,25,'Korean','honey',1,0),('Cooking',2,'Qifqi','Rice balls seasoned with mint and fried until crispy, a popular dish from Gjirokastër.',15,10,'German','rice',1,0),('Cooking',3,'Sarmi','Traditional Bulgarian stuffed cabbage rolls filled with a mix of minced meats, rice, and herbs, cooked in a tomato-based sauce.',30,60,'French','cabbage',1,0),('Cooking',2,'Shchi','A traditional Russian soup made with cabbage, meat, and various vegetables, known for its hearty and comforting qualities.',15,60,'American','onions',1,0),('Pastry',3,'Shëndetli','A walnut cake soaked in syrup, often served during special occasions and holidays.',20,30,'Mexican','walnuts',1,0),('Cooking',1,'Shopska Salata','A traditional Bulgarian salad made from tomatoes, cucumbers, onions, and topped with a generous amount of sirene cheese.',15,0,'Mexican','tomato',1,0),('Cooking',3,'Speca të mbushur','Bell peppers stuffed with rice, herbs, and seafood, baked until tender.',20,40,'Italian','red bell pepper',1,0),('Cooking',2,'Syrniki','Sweet cheese pancakes made from tvorog (cottage cheese), typically served with sour cream or jam.',10,15,'Mexican','cheddar cheese',1,0),('Cooking',1,'Tarator','A cold yogurt soup popular in the summer, made with cucumbers, garlic, dill, and walnuts.',10,0,'American','yogurt',1,0),('Cooking',3,'Tavë Kosi','A traditional Albanian dish of baked lamb and rice, topped with a yogurt and egg mixture.',20,60,'Greek','lamb',1,0),('Pastry',1,'Testitsio','An insert test recipe',42,7,'Greek','water',4,0),('Pastry',4,'Zefir','A type of soft confectionery made by whipping fruit and berry purée with sugar and egg whites, similar to marshmallows.',45,0,'Turkish','apple',1,0);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_has_chef`
--

DROP TABLE IF EXISTS `recipe_has_chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_has_chef` (
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  `chef_id` int NOT NULL,
  PRIMARY KEY (`recipe_name`,`recipe_cuisine_name`,`chef_id`),
  KEY `fk_recipe_has_chef_chef1_idx` (`chef_id`),
  KEY `fk_recipe_has_chef_recipe1_idx` (`recipe_name`,`recipe_cuisine_name`),
  CONSTRAINT `fk_recipe_has_chef_chef1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_chef_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_has_chef`
--

LOCK TABLES `recipe_has_chef` WRITE;
/*!40000 ALTER TABLE `recipe_has_chef` DISABLE KEYS */;
INSERT INTO `recipe_has_chef` VALUES ('Mekitsa','Turkish',1),('Mish me midhje','Turkish',1),('Testitsio','Greek',1),('Zefir','Turkish',1),('BLT Sandwich','Italian',2),('Borscht','Japanese',2),('Byrek me Spinaq','Japanese',2),('Clam Chowder','Japanese',2),('Medovik','Italian',2),('Speca të mbushur','Italian',2),('BLT Sandwich','Italian',3),('Borscht','Japanese',3),('Byrek me Spinaq','Japanese',3),('Clam Chowder','Japanese',3),('Medovik','Italian',3),('Speca të mbushur','Italian',3),('Borscht','Japanese',4),('Bulgarian Cheese Toast','Russian',4),('Byrek me Spinaq','Japanese',4),('Clam Chowder','Japanese',4),('Macaroni and Cheese','Russian',4),('Banitsa','Korean',5),('Beef Stroganoff','Indian',5),('Chocolate Chip Cookies','Indian',5),('Fërgesë','Indian',5),('Përime në zgare','Korean',5),('Pryaniki','Korean',5),('Barbecue Ribs','Greek',6),('Beef Stroganoff','Indian',6),('Cheeseburger','Albanian',6),('Chocolate Chip Cookies','Indian',6),('Fërgesë','Indian',6),('Garash Cake','Greek',6),('Musaka','Albanian',6),('Olivier Salad','Albanian',6),('Tavë Kosi','Greek',6),('Cheeseburger','Albanian',7),('Musaka','Albanian',7),('Olivier Salad','Albanian',7),('Banitsa','Korean',8),('Barbecue Ribs','Greek',8),('BLT Sandwich','Italian',8),('Garash Cake','Greek',8),('Medovik','Italian',8),('Përime në zgare','Korean',8),('Pryaniki','Korean',8),('Speca të mbushur','Italian',8),('Tavë Kosi','Greek',8),('BLT Sandwich','Italian',9),('Medovik','Italian',9),('Speca të mbushur','Italian',9),('Barbecue Ribs','Greek',10),('Beef Stroganoff','Indian',10),('Bulgarian Cheese Toast','Russian',10),('Chocolate Chip Cookies','Indian',10),('Fërgesë','Indian',10),('Garash Cake','Greek',10),('Macaroni and Cheese','Russian',10),('Tavë Kosi','Greek',10),('Bakllasarem','French',11),('Bulgarian Cheese Toast','Russian',11),('Macaroni and Cheese','Russian',11),('Pancakes','French',11),('Sarmi','French',11),('Borscht','Japanese',12),('Byrek me Spinaq','Japanese',12),('Clam Chowder','Japanese',12),('Mekitsa','Turkish',13),('Mish me midhje','Turkish',13),('Zefir','Turkish',13),('Apple Pie','American',14),('BLT Sandwich','Italian',14),('Medovik','Italian',14),('Shchi','American',14),('Speca të mbushur','Italian',14),('Tarator','American',14),('Banitsa','Korean',15),('Përime në zgare','Korean',15),('Pryaniki','Korean',15),('Brownies','Chinese',16),('Jani me fasule','Chinese',16),('Kasha','German',16),('Kavarma','German',16),('Pelmeni','Chinese',16),('Qifqi','German',16),('Apple Pie','American',17),('Brownies','Chinese',17),('Jani me fasule','Chinese',17),('Mekitsa','Turkish',17),('Mish me midhje','Turkish',17),('Pelmeni','Chinese',17),('Shchi','American',17),('Tarator','American',17),('Zefir','Turkish',17),('Apple Pie','American',18),('Bulgarian Cheese Toast','Russian',18),('Macaroni and Cheese','Russian',18),('Shchi','American',18),('Shëndetli','Mexican',18),('Shopska Salata','Mexican',18),('Syrniki','Mexican',18),('Tarator','American',18),('Beef Stroganoff','Indian',19),('Brownies','Chinese',19),('Cheeseburger','Albanian',19),('Chocolate Chip Cookies','Indian',19),('Fërgesë','Indian',19),('Jani me fasule','Chinese',19),('Musaka','Albanian',19),('Olivier Salad','Albanian',19),('Pelmeni','Chinese',19),('Borscht','Japanese',20),('Byrek me Spinaq','Japanese',20),('Cheeseburger','Albanian',20),('Clam Chowder','Japanese',20),('Musaka','Albanian',20),('Olivier Salad','Albanian',20),('Shëndetli','Mexican',20),('Shopska Salata','Mexican',20),('Syrniki','Mexican',20),('Brownies','Chinese',21),('Jani me fasule','Chinese',21),('Pelmeni','Chinese',21),('Apple Pie','American',22),('Banitsa','Korean',22),('BLT Sandwich','Italian',22),('Medovik','Italian',22),('Përime në zgare','Korean',22),('Pryaniki','Korean',22),('Shchi','American',22),('Speca të mbushur','Italian',22),('Tarator','American',22),('Kasha','German',23),('Kavarma','German',23),('Qifqi','German',23),('Apple Pie','American',24),('Barbecue Ribs','Greek',24),('Borscht','Japanese',24),('Byrek me Spinaq','Japanese',24),('Clam Chowder','Japanese',24),('Garash Cake','Greek',24),('Shchi','American',24),('Tarator','American',24),('Tavë Kosi','Greek',24),('Banitsa','Korean',25),('Cheeseburger','Albanian',25),('Musaka','Albanian',25),('Olivier Salad','Albanian',25),('Përime në zgare','Korean',25),('Pryaniki','Korean',25),('Shëndetli','Mexican',25),('Shopska Salata','Mexican',25),('Syrniki','Mexican',25),('Fried Chicken','Bulgarian',26),('Kadaif','Bulgarian',26),('Banitsa','Korean',27),('Përime në zgare','Korean',27),('Pryaniki','Korean',27),('Barbecue Ribs','Greek',28),('Garash Cake','Greek',28),('Tavë Kosi','Greek',28),('Banitsa','Korean',29),('Përime në zgare','Korean',29),('Pryaniki','Korean',29),('Borscht','Japanese',30),('Byrek me Spinaq','Japanese',30),('Cheeseburger','Albanian',30),('Clam Chowder','Japanese',30),('Musaka','Albanian',30),('Olivier Salad','Albanian',30),('Brownies','Chinese',31),('Jani me fasule','Chinese',31),('Pelmeni','Chinese',31),('Mekitsa','Turkish',32),('Mish me midhje','Turkish',32),('Zefir','Turkish',32),('Banitsa','Korean',33),('Borscht','Japanese',33),('Byrek me Spinaq','Japanese',33),('Clam Chowder','Japanese',33),('Përime në zgare','Korean',33),('Pryaniki','Korean',33),('Apple Pie','American',34),('Borscht','Japanese',34),('Byrek me Spinaq','Japanese',34),('Clam Chowder','Japanese',34),('Shchi','American',34),('Shëndetli','Mexican',34),('Shopska Salata','Mexican',34),('Syrniki','Mexican',34),('Tarator','American',34),('Shëndetli','Mexican',35),('Shopska Salata','Mexican',35),('Syrniki','Mexican',35),('Borscht','Japanese',36),('Byrek me Spinaq','Japanese',36),('Clam Chowder','Japanese',36),('Barbecue Ribs','Greek',37),('Garash Cake','Greek',37),('Shëndetli','Mexican',37),('Shopska Salata','Mexican',37),('Syrniki','Mexican',37),('Tavë Kosi','Greek',37),('Bakllasarem','French',38),('Bulgarian Cheese Toast','Russian',38),('Cheeseburger','Albanian',38),('Macaroni and Cheese','Russian',38),('Musaka','Albanian',38),('Olivier Salad','Albanian',38),('Pancakes','French',38),('Sarmi','French',38),('Apple Pie','American',39),('Shchi','American',39),('Tarator','American',39),('Bakllasarem','French',40),('Bulgarian Cheese Toast','Russian',40),('Macaroni and Cheese','Russian',40),('Pancakes','French',40),('Sarmi','French',40),('Bulgarian Cheese Toast','Russian',41),('Macaroni and Cheese','Russian',41),('Mekitsa','Turkish',41),('Mish me midhje','Turkish',41),('Shëndetli','Mexican',41),('Shopska Salata','Mexican',41),('Syrniki','Mexican',41),('Zefir','Turkish',41),('Bakllasarem','French',42),('Beef Stroganoff','Indian',42),('Cheeseburger','Albanian',42),('Chocolate Chip Cookies','Indian',42),('Fërgesë','Indian',42),('Musaka','Albanian',42),('Olivier Salad','Albanian',42),('Pancakes','French',42),('Sarmi','French',42),('Bulgarian Cheese Toast','Russian',43),('Macaroni and Cheese','Russian',43),('Banitsa','Korean',44),('Kasha','German',44),('Kavarma','German',44),('Përime në zgare','Korean',44),('Pryaniki','Korean',44),('Qifqi','German',44),('Bakllasarem','French',45),('Cheeseburger','Albanian',45),('Fried Chicken','Bulgarian',45),('Kadaif','Bulgarian',45),('Musaka','Albanian',45),('Olivier Salad','Albanian',45),('Pancakes','French',45),('Sarmi','French',45),('Apple Pie','American',46),('Banitsa','Korean',46),('Mekitsa','Turkish',46),('Mish me midhje','Turkish',46),('Përime në zgare','Korean',46),('Pryaniki','Korean',46),('Shchi','American',46),('Tarator','American',46),('Zefir','Turkish',46),('Bakllasarem','French',47),('Pancakes','French',47),('Sarmi','French',47),('Kasha','German',48),('Kavarma','German',48),('Qifqi','German',48),('Banitsa','Korean',49),('BLT Sandwich','Italian',49),('Borscht','Japanese',49),('Byrek me Spinaq','Japanese',49),('Clam Chowder','Japanese',49),('Medovik','Italian',49),('Përime në zgare','Korean',49),('Pryaniki','Korean',49),('Speca të mbushur','Italian',49),('Beef Stroganoff','Indian',50),('Brownies','Chinese',50),('Chocolate Chip Cookies','Indian',50),('Fërgesë','Indian',50),('Jani me fasule','Chinese',50),('Pelmeni','Chinese',50),('Shëndetli','Mexican',50),('Shopska Salata','Mexican',50),('Syrniki','Mexican',50),('Apple Pie','American',51),('Fried Chicken','Bulgarian',51),('Kadaif','Bulgarian',51),('Shchi','American',51),('Tarator','American',51),('Cheeseburger','Albanian',52),('Musaka','Albanian',52),('Olivier Salad','Albanian',52),('Apple Pie','American',53),('Beef Stroganoff','Indian',53),('BLT Sandwich','Italian',53),('Chocolate Chip Cookies','Indian',53),('Fërgesë','Indian',53),('Medovik','Italian',53),('Shchi','American',53),('Speca të mbushur','Italian',53),('Tarator','American',53),('Apple Pie','American',54),('BLT Sandwich','Italian',54),('Medovik','Italian',54),('Shchi','American',54),('Speca të mbushur','Italian',54),('Tarator','American',54),('Bakllasarem','French',55),('Banitsa','Korean',55),('Beef Stroganoff','Indian',55),('Chocolate Chip Cookies','Indian',55),('Fërgesë','Indian',55),('Pancakes','French',55),('Përime në zgare','Korean',55),('Pryaniki','Korean',55),('Sarmi','French',55),('Banitsa','Korean',56),('Kasha','German',56),('Kavarma','German',56),('Përime në zgare','Korean',56),('Pryaniki','Korean',56),('Qifqi','German',56),('Bakllasarem','French',57),('Bulgarian Cheese Toast','Russian',57),('Macaroni and Cheese','Russian',57),('Pancakes','French',57),('Sarmi','French',57),('Barbecue Ribs','Greek',58),('Brownies','Chinese',58),('Garash Cake','Greek',58),('Jani me fasule','Chinese',58),('Mekitsa','Turkish',58),('Mish me midhje','Turkish',58),('Pelmeni','Chinese',58),('Tavë Kosi','Greek',58),('Zefir','Turkish',58),('Apple Pie','American',59),('Banitsa','Korean',59),('Mekitsa','Turkish',59),('Mish me midhje','Turkish',59),('Përime në zgare','Korean',59),('Pryaniki','Korean',59),('Shchi','American',59),('Tarator','American',59),('Zefir','Turkish',59),('Apple Pie','American',60),('Barbecue Ribs','Greek',60),('Garash Cake','Greek',60),('Mekitsa','Turkish',60),('Mish me midhje','Turkish',60),('Shchi','American',60),('Tarator','American',60),('Tavë Kosi','Greek',60),('Zefir','Turkish',60),('Borscht','Japanese',61),('Byrek me Spinaq','Japanese',61),('Clam Chowder','Japanese',61),('Kasha','German',62),('Kavarma','German',62),('Qifqi','German',62),('Bakllasarem','French',63),('Brownies','Chinese',63),('Jani me fasule','Chinese',63),('Pancakes','French',63),('Pelmeni','Chinese',63),('Sarmi','French',63),('Bakllasarem','French',64),('Pancakes','French',64),('Sarmi','French',64),('Fried Chicken','Bulgarian',65),('Kadaif','Bulgarian',65),('Banitsa','Korean',66),('Bulgarian Cheese Toast','Russian',66),('Macaroni and Cheese','Russian',66),('Përime në zgare','Korean',66),('Pryaniki','Korean',66),('Shëndetli','Mexican',66),('Shopska Salata','Mexican',66),('Syrniki','Mexican',66),('Beef Stroganoff','Indian',67),('Bulgarian Cheese Toast','Russian',67),('Chocolate Chip Cookies','Indian',67),('Fërgesë','Indian',67),('Fried Chicken','Bulgarian',67),('Kadaif','Bulgarian',67),('Macaroni and Cheese','Russian',67),('Banitsa','Korean',68),('Cheeseburger','Albanian',68),('Musaka','Albanian',68),('Olivier Salad','Albanian',68),('Përime në zgare','Korean',68),('Pryaniki','Korean',68),('Beef Stroganoff','Indian',69),('Chocolate Chip Cookies','Indian',69),('Fërgesë','Indian',69),('Shëndetli','Mexican',69),('Shopska Salata','Mexican',69),('Syrniki','Mexican',69),('Beef Stroganoff','Indian',70),('Chocolate Chip Cookies','Indian',70),('Fërgesë','Indian',70),('Bakllasarem','French',71),('Pancakes','French',71),('Sarmi','French',71),('Apple Pie','American',72),('Cheeseburger','Albanian',72),('Musaka','Albanian',72),('Olivier Salad','Albanian',72),('Shchi','American',72),('Tarator','American',72),('Bulgarian Cheese Toast','Russian',73),('Cheeseburger','Albanian',73),('Kasha','German',73),('Kavarma','German',73),('Macaroni and Cheese','Russian',73),('Musaka','Albanian',73),('Olivier Salad','Albanian',73),('Qifqi','German',73),('Apple Pie','American',74),('Borscht','Japanese',74),('Byrek me Spinaq','Japanese',74),('Clam Chowder','Japanese',74),('Mekitsa','Turkish',74),('Mish me midhje','Turkish',74),('Shchi','American',74),('Tarator','American',74),('Zefir','Turkish',74),('Brownies','Chinese',75),('Jani me fasule','Chinese',75),('Pelmeni','Chinese',75),('Barbecue Ribs','Greek',76),('Garash Cake','Greek',76),('Mekitsa','Turkish',76),('Mish me midhje','Turkish',76),('Tavë Kosi','Greek',76),('Zefir','Turkish',76),('Bakllasarem','French',77),('Borscht','Japanese',77),('Byrek me Spinaq','Japanese',77),('Clam Chowder','Japanese',77),('Pancakes','French',77),('Sarmi','French',77),('Mekitsa','Turkish',78),('Mish me midhje','Turkish',78),('Zefir','Turkish',78),('Barbecue Ribs','Greek',79),('Brownies','Chinese',79),('Garash Cake','Greek',79),('Jani me fasule','Chinese',79),('Pelmeni','Chinese',79),('Tavë Kosi','Greek',79),('BLT Sandwich','Italian',80),('Bulgarian Cheese Toast','Russian',80),('Macaroni and Cheese','Russian',80),('Medovik','Italian',80),('Speca të mbushur','Italian',80),('Banitsa','Korean',81),('Beef Stroganoff','Indian',81),('Brownies','Chinese',81),('Chocolate Chip Cookies','Indian',81),('Fërgesë','Indian',81),('Jani me fasule','Chinese',81),('Pelmeni','Chinese',81),('Përime në zgare','Korean',81),('Pryaniki','Korean',81),('Bakllasarem','French',82),('Pancakes','French',82),('Sarmi','French',82),('Beef Stroganoff','Indian',83),('Chocolate Chip Cookies','Indian',83),('Fërgesë','Indian',83),('Beef Stroganoff','Indian',84),('Chocolate Chip Cookies','Indian',84),('Fërgesë','Indian',84),('Kasha','German',84),('Kavarma','German',84),('Qifqi','German',84),('Mekitsa','Turkish',85),('Mish me midhje','Turkish',85),('Zefir','Turkish',85),('Barbecue Ribs','Greek',86),('Bulgarian Cheese Toast','Russian',86),('Garash Cake','Greek',86),('Macaroni and Cheese','Russian',86),('Tavë Kosi','Greek',86),('Brownies','Chinese',87),('Jani me fasule','Chinese',87),('Pelmeni','Chinese',87),('Banitsa','Korean',88),('Përime në zgare','Korean',88),('Pryaniki','Korean',88),('Banitsa','Korean',89),('Mekitsa','Turkish',89),('Mish me midhje','Turkish',89),('Përime në zgare','Korean',89),('Pryaniki','Korean',89),('Zefir','Turkish',89),('Bakllasarem','French',90),('Brownies','Chinese',90),('Cheeseburger','Albanian',90),('Jani me fasule','Chinese',90),('Musaka','Albanian',90),('Olivier Salad','Albanian',90),('Pancakes','French',90),('Pelmeni','Chinese',90),('Sarmi','French',90),('Barbecue Ribs','Greek',91),('Garash Cake','Greek',91),('Tavë Kosi','Greek',91),('Barbecue Ribs','Greek',92),('Garash Cake','Greek',92),('Tavë Kosi','Greek',92),('Bakllasarem','French',93),('BLT Sandwich','Italian',93),('Medovik','Italian',93),('Pancakes','French',93),('Sarmi','French',93),('Speca të mbushur','Italian',93),('Bulgarian Cheese Toast','Russian',94),('Fried Chicken','Bulgarian',94),('Kadaif','Bulgarian',94),('Macaroni and Cheese','Russian',94),('Apple Pie','American',95),('Brownies','Chinese',95),('Bulgarian Cheese Toast','Russian',95),('Jani me fasule','Chinese',95),('Macaroni and Cheese','Russian',95),('Pelmeni','Chinese',95),('Shchi','American',95),('Tarator','American',95),('Fried Chicken','Bulgarian',96),('Kadaif','Bulgarian',96),('Cheeseburger','Albanian',97),('Kasha','German',97),('Kavarma','German',97),('Musaka','Albanian',97),('Olivier Salad','Albanian',97),('Qifqi','German',97),('Bakllasarem','French',98),('Bulgarian Cheese Toast','Russian',98),('Macaroni and Cheese','Russian',98),('Pancakes','French',98),('Sarmi','French',98),('Apple Pie','American',99),('Barbecue Ribs','Greek',99),('Garash Cake','Greek',99),('Shchi','American',99),('Tarator','American',99),('Tavë Kosi','Greek',99),('Shëndetli','Mexican',100),('Shopska Salata','Mexican',100),('Syrniki','Mexican',100);
/*!40000 ALTER TABLE `recipe_has_chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_has_equipment`
--

DROP TABLE IF EXISTS `recipe_has_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_has_equipment` (
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  `equipment_name` varchar(64) NOT NULL,
  PRIMARY KEY (`recipe_name`,`recipe_cuisine_name`,`equipment_name`),
  KEY `fk_recipe_has_equipment_equipment1_idx` (`equipment_name`),
  KEY `fk_recipe_has_equipment_recipe1_idx` (`recipe_name`,`recipe_cuisine_name`),
  CONSTRAINT `fk_recipe_has_equipment_equipment1` FOREIGN KEY (`equipment_name`) REFERENCES `equipment` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_equipment_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_has_equipment`
--

LOCK TABLES `recipe_has_equipment` WRITE;
/*!40000 ALTER TABLE `recipe_has_equipment` DISABLE KEYS */;
INSERT INTO `recipe_has_equipment` VALUES ('Barbecue Ribs','Greek','aluminum foil'),('Bakllasarem','French','baking dish'),('Banitsa','Korean','baking dish'),('Macaroni and Cheese','Russian','baking dish'),('Musaka','Albanian','baking dish'),('Speca të mbushur','Italian','baking dish'),('Tavë Kosi','Greek','baking dish'),('Brownies','Chinese','baking pan'),('Byrek me Spinaq','Japanese','baking pan'),('Chocolate Chip Cookies','Indian','baking sheet'),('Medovik','Italian','baking sheet'),('Barbecue Ribs','Greek','basting brush'),('Zefir','Turkish','blender'),('Fried Chicken','Bulgarian','bowl'),('Mekitsa','Turkish','bowl'),('Olivier Salad','Albanian','bowl'),('Pancakes','French','bowl'),('Pelmeni','Chinese','bowl'),('Përime në zgare','Korean','bowl'),('Qifqi','German','bowl'),('Shopska Salata','Mexican','bowl'),('Tarator','American','bowl'),('Banitsa','Korean','brush'),('Garash Cake','Greek','cake pan'),('Shëndetli','Mexican','cake pan'),('Pryaniki','Korean','cookie cutter'),('Beef Stroganoff','Indian','cutting board'),('BLT Sandwich','Italian','cutting board'),('Borscht','Japanese','cutting board'),('Cheeseburger','Albanian','cutting board'),('Clam Chowder','Japanese','cutting board'),('Kavarma','German','cutting board'),('Sarmi','French','cutting board'),('Shchi','American','cutting board'),('Shopska Salata','Mexican','cutting board'),('Fried Chicken','Bulgarian','deep fryer'),('Mekitsa','Turkish','deep fryer'),('Bulgarian Cheese Toast','Russian','frying pan'),('Tarator','American','garlic press'),('Pancakes','French','griddle or skillet'),('Barbecue Ribs','Greek','grill'),('Cheeseburger','Albanian','grill'),('Përime në zgare','Korean','grill'),('Beef Stroganoff','Indian','knife'),('BLT Sandwich','Italian','knife'),('Borscht','Japanese','knife'),('Cheeseburger','Albanian','knife'),('Clam Chowder','Japanese','knife'),('Kavarma','German','knife'),('Olivier Salad','Albanian','knife'),('Pelmeni','Chinese','knife'),('Përime në zgare','Korean','knife'),('Sarmi','French','knife'),('Shchi','American','knife'),('Shopska Salata','Mexican','knife'),('Tarator','American','knife'),('Apple Pie','American','mixing bowl'),('Brownies','Chinese','mixing bowl'),('Chocolate Chip Cookies','Indian','mixing bowl'),('Medovik','Italian','mixing bowl'),('Pryaniki','Korean','mixing bowl'),('Syrniki','Mexican','mixing bowl'),('Zefir','Turkish','mixing bowl'),('Garash Cake','Greek','mixing bowls'),('Apple Pie','American','oven'),('Bakllasarem','French','oven'),('Banitsa','Korean','oven'),('Barbecue Ribs','Greek','oven'),('Brownies','Chinese','oven'),('Bulgarian Cheese Toast','Russian','oven'),('Byrek me Spinaq','Japanese','oven'),('Chocolate Chip Cookies','Indian','oven'),('Garash Cake','Greek','oven'),('Kadaif','Bulgarian','oven'),('Macaroni and Cheese','Russian','oven'),('Medovik','Italian','oven'),('Musaka','Albanian','oven'),('Pryaniki','Korean','oven'),('Shëndetli','Mexican','oven'),('Speca të mbushur','Italian','oven'),('Tavë Kosi','Greek','oven'),('Beef Stroganoff','Indian','pan'),('BLT Sandwich','Italian','pan'),('Syrniki','Mexican','pan'),('Fried Chicken','Bulgarian','paper towels'),('Apple Pie','American','pie dish'),('Zefir','Turkish','piping bag'),('Borscht','Japanese','pot'),('Clam Chowder','Japanese','pot'),('Jani me fasule','Chinese','pot'),('Kasha','German','pot'),('Kavarma','German','pot'),('Macaroni and Cheese','Russian','pot'),('Mish me midhje','Turkish','pot'),('Olivier Salad','Albanian','pot'),('Pelmeni','Chinese','pot'),('Qifqi','German','pot'),('Sarmi','French','pot'),('Shchi','American','pot'),('Speca të mbushur','Italian','pot'),('Apple Pie','American','rolling pin'),('Medovik','Italian','rolling pin'),('Mekitsa','Turkish','rolling pin'),('Pelmeni','Chinese','rolling pin'),('Pryaniki','Korean','rolling pin'),('Bakllasarem','French','saucepan'),('Kadaif','Bulgarian','saucepan'),('Macaroni and Cheese','Russian','saucepan'),('Shëndetli','Mexican','saucepan'),('Byrek me Spinaq','Japanese','skillet'),('Fërgesë','Indian','skillet'),('Mish me midhje','Turkish','skillet'),('Qifqi','German','skillet'),('Tavë Kosi','Greek','skillet'),('Pancakes','French','spatula'),('Syrniki','Mexican','spatula'),('Fërgesë','Indian','stove'),('Jani me fasule','Chinese','stove'),('Kasha','German','strainer'),('BLT Sandwich','Italian','toaster'),('Bulgarian Cheese Toast','Russian','toaster'),('Fried Chicken','Bulgarian','tongs'),('Kadaif','Bulgarian','tray'),('Garash Cake','Greek','whisk'),('Medovik','Italian','whisk'),('Pancakes','French','whisk'),('Tavë Kosi','Greek','whisk'),('Chocolate Chip Cookies','Indian','wire rack');
/*!40000 ALTER TABLE `recipe_has_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_has_ingredient`
--

DROP TABLE IF EXISTS `recipe_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_has_ingredient` (
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  `ingredient_name` varchar(64) NOT NULL,
  `quantity` int DEFAULT '20',
  PRIMARY KEY (`recipe_name`,`recipe_cuisine_name`,`ingredient_name`),
  KEY `fk_recipe_has_ingredient_ingredient1_idx` (`ingredient_name`),
  KEY `fk_recipe_has_ingredient_recipe1_idx` (`recipe_name`,`recipe_cuisine_name`),
  CONSTRAINT `fk_recipe_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_name`) REFERENCES `ingredient` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_ingredient_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_has_ingredient`
--

LOCK TABLES `recipe_has_ingredient` WRITE;
/*!40000 ALTER TABLE `recipe_has_ingredient` DISABLE KEYS */;
INSERT INTO `recipe_has_ingredient` VALUES ('Apple Pie','American','apple',728),('Apple Pie','American','butter',113),('Apple Pie','American','cinnamon',2),('Apple Pie','American','salt',7),('Apple Pie','American','sugar',150),('Apple Pie','American','unbleached flour',250),('Apple Pie','American','water',0),('Bakllasarem','French','butter',227),('Bakllasarem','French','cinnamon',2),('Bakllasarem','French','lemon juice',15),('Bakllasarem','French','phyllo dough',400),('Bakllasarem','French','sugar',200),('Bakllasarem','French','walnuts',234),('Bakllasarem','French','water',236),('Banitsa','Korean','butter',100),('Banitsa','Korean','cheddar cheese',300),('Banitsa','Korean','egg',258),('Banitsa','Korean','phyllo dough',400),('Banitsa','Korean','yogurt',245),('Barbecue Ribs','Greek','barbecue sauce',0),('Barbecue Ribs','Greek','brown sugar',18),('Barbecue Ribs','Greek','garlic powder',9),('Barbecue Ribs','Greek','paprika',13),('Barbecue Ribs','Greek','ribs',2594),('Barbecue Ribs','Greek','salt',15),('Beef Stroganoff','Indian','beef broth',202),('Beef Stroganoff','Indian','mustard',31),('Beef Stroganoff','Indian','onions',125),('Beef Stroganoff','Indian','salt',6),('Beef Stroganoff','Indian','sirloin steak',500),('Beef Stroganoff','Indian','sour cream',194),('Beef Stroganoff','Indian','vegetable oil',28),('BLT Sandwich','Italian','bacon',232),('BLT Sandwich','Italian','bread',116),('BLT Sandwich','Italian','lettuce',5),('BLT Sandwich','Italian','mayonnaise',0),('BLT Sandwich','Italian','tomato',123),('Borscht','Japanese','beets',246),('Borscht','Japanese','cabbage',476),('Borscht','Japanese','carrots',122),('Borscht','Japanese','dill weed',0),('Borscht','Japanese','onions',150),('Borscht','Japanese','potato',738),('Borscht','Japanese','salt',10),('Borscht','Japanese','sour cream',0),('Borscht','Japanese','sugar',4),('Borscht','Japanese','white vinegar',14),('Brownies','Chinese','butter',113),('Brownies','Chinese','chocolate',173),('Brownies','Chinese','egg',86),('Brownies','Chinese','salt',3),('Brownies','Chinese','sugar',200),('Brownies','Chinese','unbleached flour',93),('Brownies','Chinese','unsweetened cocoa powder',21),('Brownies','Chinese','vanilla extract',4),('Bulgarian Cheese Toast','Russian','bread',116),('Bulgarian Cheese Toast','Russian','butter',5),('Bulgarian Cheese Toast','Russian','cheddar cheese',200),('Bulgarian Cheese Toast','Russian','egg',86),('Byrek me Spinaq','Japanese','egg',129),('Byrek me Spinaq','Japanese','feta cheese',200),('Byrek me Spinaq','Japanese','olive oil',16),('Byrek me Spinaq','Japanese','phyllo dough',400),('Byrek me Spinaq','Japanese','spinach',500),('Cheeseburger','Albanian','cheddar cheese',112),('Cheeseburger','Albanian','ground beef',453),('Cheeseburger','Albanian','hamburger buns',176),('Cheeseburger','Albanian','lettuce',5),('Cheeseburger','Albanian','onions',125),('Cheeseburger','Albanian','pickle',0),('Cheeseburger','Albanian','salt',5),('Cheeseburger','Albanian','tomato',123),('Chocolate Chip Cookies','Indian','baking soda',2),('Chocolate Chip Cookies','Indian','brown sugar',220),('Chocolate Chip Cookies','Indian','butter',227),('Chocolate Chip Cookies','Indian','chocolate chip',448),('Chocolate Chip Cookies','Indian','egg',86),('Chocolate Chip Cookies','Indian','sugar',100),('Chocolate Chip Cookies','Indian','unbleached flour',281),('Chocolate Chip Cookies','Indian','vanilla extract',8),('Clam Chowder','Japanese','bacon',116),('Clam Chowder','Japanese','celery',80),('Clam Chowder','Japanese','clams',600),('Clam Chowder','Japanese','cream',238),('Clam Chowder','Japanese','onions',125),('Clam Chowder','Japanese','potato',426),('Clam Chowder','Japanese','salt',11),('Clam Chowder','Japanese','saltine crackers',15),('Clam Chowder','Japanese','water',236),('Fërgesë','Indian','cottage cheese',200),('Fërgesë','Indian','olive oil',11),('Fërgesë','Indian','onions',125),('Fërgesë','Indian','red bell pepper',238),('Fërgesë','Indian','salt',4),('Fërgesë','Indian','tomato',246),('Fried Chicken','Bulgarian','chicken',715),('Fried Chicken','Bulgarian','egg',43),('Fried Chicken','Bulgarian','flour',250),('Fried Chicken','Bulgarian','garlic powder',3),('Fried Chicken','Bulgarian','oil',13),('Fried Chicken','Bulgarian','paprika',2),('Fried Chicken','Bulgarian','salt',6),('Garash Cake','Greek','dark chocolate',200),('Garash Cake','Greek','egg white',158),('Garash Cake','Greek','flour',50),('Garash Cake','Greek','heavy whipping cream',201),('Garash Cake','Greek','sugar',150),('Garash Cake','Greek','walnuts',150),('Jani me fasule','Chinese','chili powder',0),('Jani me fasule','Chinese','garlic',6),('Jani me fasule','Chinese','olive oil',11),('Jani me fasule','Chinese','onions',150),('Jani me fasule','Chinese','salt',5),('Jani me fasule','Chinese','tomato',246),('Jani me fasule','Chinese','white bean',453),('Kadaif','Bulgarian','butter',100),('Kadaif','Bulgarian','dough',500),('Kadaif','Bulgarian','lemon',84),('Kadaif','Bulgarian','nuts',200),('Kadaif','Bulgarian','sugar',400),('Kadaif','Bulgarian','water',236),('Kasha','German','buckwheat groat',164),('Kasha','German','salt',3),('Kasha','German','water',473),('Kasha','German','whole milk',0),('Kavarma','German','onions',250),('Kavarma','German','paprika',6),('Kavarma','German','parsley',12),('Kavarma','German','pork',500),('Kavarma','German','red bell pepper',119),('Kavarma','German','salt',7),('Kavarma','German','tomato paste',32),('Kavarma','German','white mushroom',200),('Kavarma','German','white wine',99),('Macaroni and Cheese','Russian','breadcrumbs',54),('Macaroni and Cheese','Russian','butter',28),('Macaroni and Cheese','Russian','cheddar cheese',264),('Macaroni and Cheese','Russian','pasta',210),('Macaroni and Cheese','Russian','salt',6),('Macaroni and Cheese','Russian','unbleached flour',15),('Macaroni and Cheese','Russian','whole milk',488),('Medovik','Italian','baking soda',4),('Medovik','Italian','egg',129),('Medovik','Italian','flour',375),('Medovik','Italian','honey',63),('Medovik','Italian','sour cream',486),('Medovik','Italian','sugar',150),('Medovik','Italian','vanilla extract',4),('Mekitsa','Turkish','flour',500),('Mekitsa','Turkish','oil',10),('Mekitsa','Turkish','powdered sugar',3),('Mekitsa','Turkish','water',0),('Mekitsa','Turkish','yeast',7),('Mekitsa','Turkish','yogurt',245),('Mish me midhje','Turkish','garlic',6),('Mish me midhje','Turkish','mussels',1000),('Mish me midhje','Turkish','olive oil',16),('Mish me midhje','Turkish','parsley',12),('Mish me midhje','Turkish','salt',7),('Mish me midhje','Turkish','white wine',235),('Musaka','Albanian','beef',500),('Musaka','Albanian','egg',86),('Musaka','Albanian','potato',1476),('Musaka','Albanian','salt',13),('Musaka','Albanian','yogurt',200),('Olivier Salad','Albanian','carrots',122),('Olivier Salad','Albanian','cooked chicken',280),('Olivier Salad','Albanian','egg',172),('Olivier Salad','Albanian','green peas',145),('Olivier Salad','Albanian','mayonnaise',231),('Olivier Salad','Albanian','pickle',0),('Olivier Salad','Albanian','potato',426),('Olivier Salad','Albanian','salt',8),('Pancakes','French','baking powder',9),('Pancakes','French','butter',28),('Pancakes','French','egg',43),('Pancakes','French','maple syrup',83),('Pancakes','French','salt',3),('Pancakes','French','sugar',24),('Pancakes','French','unbleached flour',125),('Pancakes','French','whole milk',244),('Pelmeni','Chinese','beef',300),('Pelmeni','Chinese','black pepper',3),('Pelmeni','Chinese','egg',43),('Pelmeni','Chinese','flour',250),('Pelmeni','Chinese','onions',125),('Pelmeni','Chinese','pork',300),('Pelmeni','Chinese','salt',6),('Pelmeni','Chinese','water',118),('Përime në zgare','Korean','eggplant',548),('Përime në zgare','Korean','garlic',3),('Përime në zgare','Korean','olive oil',16),('Përime në zgare','Korean','parsley',12),('Përime në zgare','Korean','red bell pepper',238),('Përime në zgare','Korean','salt',7),('Përime në zgare','Korean','tomato',246),('Përime në zgare','Korean','zucchini',196),('Pryaniki','Korean','butter',113),('Pryaniki','Korean','cloves',2),('Pryaniki','Korean','egg',86),('Pryaniki','Korean','flour',375),('Pryaniki','Korean','ginger',2),('Pryaniki','Korean','honey',339),('Pryaniki','Korean','lemon juice',0),('Pryaniki','Korean','powdered sugar',12),('Pryaniki','Korean','sugar',100),('Qifqi','German','egg',86),('Qifqi','German','mint',0),('Qifqi','German','rice',195),('Qifqi','German','salt',1),('Qifqi','German','vegetable oil',3),('Sarmi','French','beef',500),('Sarmi','French','cabbage',952),('Sarmi','French','dried thyme',22),('Sarmi','French','onions',125),('Sarmi','French','rice',195),('Sarmi','French','salt',13),('Sarmi','French','tomato sauce',490),('Shchi','American','bay leaf',5),('Shchi','American','beef',500),('Shchi','American','cabbage',476),('Shchi','American','carrots',122),('Shchi','American','dill weed',0),('Shchi','American','onions',125),('Shchi','American','potato',639),('Shchi','American','salt',11),('Shchi','American','sour cream',0),('Shëndetli','Mexican','egg',172),('Shëndetli','Mexican','lemon juice',15),('Shëndetli','Mexican','sugar',200),('Shëndetli','Mexican','walnuts',80),('Shëndetli','Mexican','water',236),('Shopska Salata','Mexican','cheddar cheese',200),('Shopska Salata','Mexican','cucumber',301),('Shopska Salata','Mexican','olive oil',13),('Shopska Salata','Mexican','onions',125),('Shopska Salata','Mexican','parsley',9),('Shopska Salata','Mexican','salt',5),('Shopska Salata','Mexican','tomato',369),('Speca të mbushur','Italian','canned shrimp',128),('Speca të mbushur','Italian','dried thyme',8),('Speca të mbushur','Italian','garlic',6),('Speca të mbushur','Italian','lemon',7),('Speca të mbushur','Italian','red bell pepper',476),('Speca të mbushur','Italian','rice',195),('Speca të mbushur','Italian','salt',4),('Syrniki','Mexican','cheddar cheese',250),('Syrniki','Mexican','egg',86),('Syrniki','Mexican','flour',23),('Syrniki','Mexican','sugar',24),('Syrniki','Mexican','vanilla extract',4),('Tarator','American','cucumber',301),('Tarator','American','dill weed',1),('Tarator','American','garlic',6),('Tarator','American','olive oil',11),('Tarator','American','salt',5),('Tarator','American','walnuts',50),('Tarator','American','water',0),('Tarator','American','yogurt',500),('Tavë Kosi','Greek','egg',129),('Tavë Kosi','Greek','flour',15),('Tavë Kosi','Greek','lamb',500),('Tavë Kosi','Greek','olive oil',24),('Tavë Kosi','Greek','rice',195),('Tavë Kosi','Greek','salt',10),('Tavë Kosi','Greek','water',473),('Tavë Kosi','Greek','yogurt',490),('Zefir','Turkish','apple',728),('Zefir','Turkish','egg white',52),('Zefir','Turkish','sugar',200);
/*!40000 ALTER TABLE `recipe_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_has_label`
--

DROP TABLE IF EXISTS `recipe_has_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_has_label` (
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  `label_name` varchar(32) NOT NULL,
  PRIMARY KEY (`recipe_name`,`recipe_cuisine_name`,`label_name`),
  KEY `fk_recipe_has_label_recipe1_idx` (`recipe_name`,`recipe_cuisine_name`),
  CONSTRAINT `fk_recipe_has_label_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_has_label`
--

LOCK TABLES `recipe_has_label` WRITE;
/*!40000 ALTER TABLE `recipe_has_label` DISABLE KEYS */;
INSERT INTO `recipe_has_label` VALUES ('Apple Pie','American','dessert'),('Apple Pie','American','traditional'),('Bakllasarem','French','dessert'),('Bakllasarem','French','traditional'),('Banitsa','Korean','lunch'),('Banitsa','Korean','traditional'),('Barbecue Ribs','Greek','BBQ'),('Barbecue Ribs','Greek','dinner'),('Beef Stroganoff','Indian','dinner'),('Beef Stroganoff','Indian','traditional'),('BLT Sandwich','Italian','lunch'),('BLT Sandwich','Italian','sandwich'),('Borscht','Japanese','hearty'),('Borscht','Japanese','lunch'),('Brownies','Chinese','classic'),('Brownies','Chinese','dessert'),('Bulgarian Cheese Toast','Russian','breakfast'),('Bulgarian Cheese Toast','Russian','hearty'),('Byrek me Spinaq','Japanese','breakfast'),('Byrek me Spinaq','Japanese','quick'),('Cheeseburger','Albanian','classic'),('Cheeseburger','Albanian','dinner'),('Chocolate Chip Cookies','Indian','chocolate'),('Chocolate Chip Cookies','Indian','dessert'),('Clam Chowder','Japanese','dinner'),('Clam Chowder','Japanese','seafood'),('Fërgesë','Indian','lunch'),('Fërgesë','Indian','traditional'),('Fried Chicken','Bulgarian','fast food'),('Fried Chicken','Bulgarian','lunch'),('Garash Cake','Greek','dessert'),('Garash Cake','Greek','festive'),('Jani me fasule','Chinese','dinner'),('Jani me fasule','Chinese','hearty'),('Kadaif','Bulgarian','dessert'),('Kadaif','Bulgarian','traditional'),('Kasha','German','dinner'),('Kasha','German','filling'),('Kavarma','German','dinner'),('Kavarma','German','hearty'),('Macaroni and Cheese','Russian','comfort food'),('Macaroni and Cheese','Russian','dinner'),('Medovik','Italian','dessert'),('Medovik','Italian','holiday'),('Mekitsa','Turkish','breakfast'),('Mekitsa','Turkish','quick'),('Mish me midhje','Turkish','brunch'),('Mish me midhje','Turkish','seafood'),('Musaka','Albanian','comfort'),('Musaka','Albanian','dinner'),('Olivier Salad','Albanian','brunch'),('Olivier Salad','Albanian','hearty'),('Pancakes','French','breakfast'),('Pancakes','French','quick'),('Pelmeni','Chinese','dinner'),('Pelmeni','Chinese','winter'),('Përime në zgare','Korean','dinner'),('Përime në zgare','Korean','traditional'),('Pryaniki','Korean','dessert'),('Pryaniki','Korean','festive'),('Qifqi','German','light'),('Qifqi','German','lunch'),('Sarmi','French','dinner'),('Sarmi','French','traditional'),('Shchi','American','lunch'),('Shchi','American','traditional'),('Shëndetli','Mexican','dessert'),('Shëndetli','Mexican','traditional'),('Shopska Salata','Mexican','dinner'),('Shopska Salata','Mexican','traditional'),('Speca të mbushur','Italian','dinner'),('Speca të mbushur','Italian','seafood'),('Syrniki','Mexican','breakfast'),('Syrniki','Mexican','quick'),('Tarator','American','lunch'),('Tarator','American','soup'),('Tavë Kosi','Greek','dinner'),('Tavë Kosi','Greek','traditional'),('Zefir','Turkish','dessert'),('Zefir','Turkish','simple');
/*!40000 ALTER TABLE `recipe_has_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_has_meal`
--

DROP TABLE IF EXISTS `recipe_has_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_has_meal` (
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  `meal_type` varchar(32) NOT NULL,
  PRIMARY KEY (`recipe_name`,`recipe_cuisine_name`,`meal_type`),
  KEY `fk_recipe_has_meal_recipe1_idx` (`recipe_name`,`recipe_cuisine_name`),
  CONSTRAINT `fk_recipe_has_meal_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_has_meal`
--

LOCK TABLES `recipe_has_meal` WRITE;
/*!40000 ALTER TABLE `recipe_has_meal` DISABLE KEYS */;
INSERT INTO `recipe_has_meal` VALUES ('Apple Pie','American','dessert'),('Bakllasarem','French','dessert'),('Banitsa','Korean','lunch'),('Barbecue Ribs','Greek','dinner'),('Beef Stroganoff','Indian','dinner'),('BLT Sandwich','Italian','lunch'),('Borscht','Japanese','lunch'),('Brownies','Chinese','dessert'),('Bulgarian Cheese Toast','Russian','breakfast'),('Byrek me Spinaq','Japanese','breakfast'),('Cheeseburger','Albanian','dinner'),('Chocolate Chip Cookies','Indian','dessert'),('Clam Chowder','Japanese','dinner'),('Fërgesë','Indian','lunch'),('Fried Chicken','Bulgarian','lunch'),('Garash Cake','Greek','dessert'),('Jani me fasule','Chinese','dinner'),('Kadaif','Bulgarian','dessert'),('Kasha','German','dinner'),('Kavarma','German','dinner'),('Macaroni and Cheese','Russian','dinner'),('Medovik','Italian','dessert'),('Mekitsa','Turkish','breakfast'),('Mish me midhje','Turkish','brunch'),('Musaka','Albanian','dinner'),('Olivier Salad','Albanian','brunch'),('Pancakes','French','breakfast'),('Pelmeni','Chinese','dinner'),('Përime në zgare','Korean','dinner'),('Pryaniki','Korean','dessert'),('Qifqi','German','lunch'),('Sarmi','French','dinner'),('Shchi','American','lunch'),('Shëndetli','Mexican','dessert'),('Shopska Salata','Mexican','dinner'),('Speca të mbushur','Italian','dinner'),('Syrniki','Mexican','breakfast'),('Tarator','American','lunch'),('Tavë Kosi','Greek','dinner'),('Zefir','Turkish','dessert');
/*!40000 ALTER TABLE `recipe_has_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_has_theme`
--

DROP TABLE IF EXISTS `recipe_has_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_has_theme` (
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  `theme_name` varchar(64) NOT NULL,
  PRIMARY KEY (`recipe_name`,`recipe_cuisine_name`,`theme_name`),
  KEY `fk_recipe_has_theme_theme1_idx` (`theme_name`),
  KEY `fk_recipe_has_theme_recipe1_idx` (`recipe_name`,`recipe_cuisine_name`),
  CONSTRAINT `fk_recipe_has_theme_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_theme_theme1` FOREIGN KEY (`theme_name`) REFERENCES `theme` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_has_theme`
--

LOCK TABLES `recipe_has_theme` WRITE;
/*!40000 ALTER TABLE `recipe_has_theme` DISABLE KEYS */;
INSERT INTO `recipe_has_theme` VALUES ('BLT Sandwich','Italian','Asian Fusion'),('Kasha','German','Asian Fusion'),('Kavarma','German','Asian Fusion'),('Mish me midhje','Turkish','Asian Fusion'),('Beef Stroganoff','Indian','BBQ Bash'),('Clam Chowder','Japanese','BBQ Bash'),('Medovik','Italian','BBQ Bash'),('Musaka','Albanian','BBQ Bash'),('Sarmi','French','BBQ Bash'),('Tarator','American','BBQ Bash'),('Brownies','Chinese','Farm-to-Table'),('Byrek me Spinaq','Japanese','Farm-to-Table'),('Pelmeni','Chinese','Farm-to-Table'),('Shchi','American','Farm-to-Table'),('Barbecue Ribs','Greek','French Bistro'),('Shopska Salata','Mexican','French Bistro'),('Speca të mbushur','Italian','French Bistro'),('Garash Cake','Greek','Italian Trattoria'),('Pancakes','French','Italian Trattoria'),('Përime në zgare','Korean','Italian Trattoria'),('Kadaif','Bulgarian','Mediterranean Delight'),('Mekitsa','Turkish','Mediterranean Delight'),('Cheeseburger','Albanian','Seafood Extravaganza'),('Pryaniki','Korean','Seafood Extravaganza'),('Qifqi','German','Seafood Extravaganza'),('Syrniki','Mexican','Seafood Extravaganza'),('Tavë Kosi','Greek','Seafood Extravaganza'),('Bakllasarem','French','Southern Comfort'),('Banitsa','Korean','Southern Comfort'),('Fërgesë','Indian','Southern Comfort'),('Zefir','Turkish','Southern Comfort'),('Borscht','Japanese','Street Food Festival'),('Fried Chicken','Bulgarian','Street Food Festival'),('Olivier Salad','Albanian','Street Food Festival'),('Shëndetli','Mexican','Street Food Festival'),('Apple Pie','American','Taco Fiesta'),('Bulgarian Cheese Toast','Russian','Taco Fiesta'),('Chocolate Chip Cookies','Indian','Taco Fiesta'),('Jani me fasule','Chinese','Taco Fiesta'),('Macaroni and Cheese','Russian','Taco Fiesta');
/*!40000 ALTER TABLE `recipe_has_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_has_tip`
--

DROP TABLE IF EXISTS `recipe_has_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_has_tip` (
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  `tip_id` int NOT NULL,
  PRIMARY KEY (`recipe_name`,`recipe_cuisine_name`,`tip_id`),
  KEY `fk_recipe_has_tip_tip1_idx` (`tip_id`),
  KEY `fk_recipe_has_tip_recipe1_idx` (`recipe_name`,`recipe_cuisine_name`),
  CONSTRAINT `fk_recipe_has_tip_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_tip_tip1` FOREIGN KEY (`tip_id`) REFERENCES `tip` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_has_tip`
--

LOCK TABLES `recipe_has_tip` WRITE;
/*!40000 ALTER TABLE `recipe_has_tip` DISABLE KEYS */;
INSERT INTO `recipe_has_tip` VALUES ('Tavë Kosi','Greek',1),('Tavë Kosi','Greek',2),('Tavë Kosi','Greek',3),('Bakllasarem','French',4),('Bakllasarem','French',5),('Bakllasarem','French',6),('Fërgesë','Indian',7),('Fërgesë','Indian',8),('Fërgesë','Indian',9),('Speca të mbushur','Italian',10),('Speca të mbushur','Italian',11),('Speca të mbushur','Italian',12),('Byrek me Spinaq','Japanese',13),('Byrek me Spinaq','Japanese',14),('Byrek me Spinaq','Japanese',15),('Jani me fasule','Chinese',16),('Jani me fasule','Chinese',17),('Jani me fasule','Chinese',18),('Shëndetli','Mexican',19),('Shëndetli','Mexican',20),('Shëndetli','Mexican',21),('Qifqi','German',22),('Qifqi','German',23),('Qifqi','German',24),('Përime në zgare','Korean',25),('Përime në zgare','Korean',26),('Përime në zgare','Korean',27),('Mish me midhje','Turkish',28),('Mish me midhje','Turkish',29),('Mish me midhje','Turkish',30),('Cheeseburger','Albanian',31),('Cheeseburger','Albanian',32),('Cheeseburger','Albanian',33),('Apple Pie','American',34),('Apple Pie','American',35),('Apple Pie','American',36),('Fried Chicken','Bulgarian',37),('Fried Chicken','Bulgarian',38),('Fried Chicken','Bulgarian',39),('Macaroni and Cheese','Russian',40),('Macaroni and Cheese','Russian',41),('Macaroni and Cheese','Russian',42),('Barbecue Ribs','Greek',43),('Barbecue Ribs','Greek',44),('Barbecue Ribs','Greek',45),('Pancakes','French',46),('Pancakes','French',47),('Pancakes','French',48),('Chocolate Chip Cookies','Indian',49),('Chocolate Chip Cookies','Indian',50),('Chocolate Chip Cookies','Indian',51),('BLT Sandwich','Italian',52),('BLT Sandwich','Italian',53),('BLT Sandwich','Italian',54),('Clam Chowder','Japanese',55),('Clam Chowder','Japanese',56),('Clam Chowder','Japanese',57),('Brownies','Chinese',58),('Brownies','Chinese',59),('Brownies','Chinese',60),('Shopska Salata','Mexican',61),('Shopska Salata','Mexican',62),('Shopska Salata','Mexican',63),('Kavarma','German',64),('Kavarma','German',65),('Kavarma','German',66),('Banitsa','Korean',67),('Banitsa','Korean',68),('Banitsa','Korean',69),('Mekitsa','Turkish',70),('Mekitsa','Turkish',71),('Mekitsa','Turkish',72),('Musaka','Albanian',73),('Musaka','Albanian',74),('Musaka','Albanian',75),('Tarator','American',76),('Tarator','American',77),('Tarator','American',78),('Kadaif','Bulgarian',79),('Kadaif','Bulgarian',80),('Kadaif','Bulgarian',81),('Bulgarian Cheese Toast','Russian',82),('Bulgarian Cheese Toast','Russian',83),('Bulgarian Cheese Toast','Russian',84),('Garash Cake','Greek',85),('Garash Cake','Greek',86),('Garash Cake','Greek',87),('Sarmi','French',88),('Sarmi','French',89),('Sarmi','French',90),('Beef Stroganoff','Indian',91),('Beef Stroganoff','Indian',92),('Beef Stroganoff','Indian',93),('Medovik','Italian',94),('Medovik','Italian',95),('Medovik','Italian',96),('Borscht','Japanese',97),('Borscht','Japanese',98),('Borscht','Japanese',99),('Pelmeni','Chinese',100),('Pelmeni','Chinese',101),('Pelmeni','Chinese',102),('Syrniki','Mexican',103),('Syrniki','Mexican',104),('Syrniki','Mexican',105),('Kasha','German',106),('Kasha','German',107),('Kasha','German',108),('Pryaniki','Korean',109),('Pryaniki','Korean',110),('Pryaniki','Korean',111),('Zefir','Turkish',112),('Zefir','Turkish',113),('Zefir','Turkish',114),('Olivier Salad','Albanian',115),('Olivier Salad','Albanian',116),('Olivier Salad','Albanian',117),('Shchi','American',118),('Shchi','American',119),('Shchi','American',120);
/*!40000 ALTER TABLE `recipe_has_tip` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `up_to_3_tips` BEFORE INSERT ON `recipe_has_tip` FOR EACH ROW BEGIN
    DECLARE tip_count INT;
    SELECT COUNT(*) INTO tip_count FROM recipe_has_tip WHERE recipe_name = NEW.recipe_name AND recipe_cuisine_name = NEW.recipe_cuisine_name;
    IF tip_count >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A recipe can have up to 3 useful tips';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step` (
  `number` int NOT NULL,
  `description` text NOT NULL,
  `recipe_name` varchar(128) NOT NULL,
  `recipe_cuisine_name` varchar(128) NOT NULL,
  PRIMARY KEY (`recipe_name`,`recipe_cuisine_name`,`number`),
  KEY `fk_step_recipe1_idx` (`recipe_name`,`recipe_cuisine_name`),
  CONSTRAINT `fk_step_recipe1` FOREIGN KEY (`recipe_name`, `recipe_cuisine_name`) REFERENCES `recipe` (`name`, `cuisine_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` VALUES (1,'Prepare the pie crust and line a pie dish with one layer of crust.','Apple Pie','American'),(2,'Mix sliced apples with sugar, cinnamon, and flour.','Apple Pie','American'),(3,'Fill the pie crust with the apple mixture.','Apple Pie','American'),(4,'Cover with the second layer of crust, seal edges, and cut small slits in the top.','Apple Pie','American'),(5,'Bake at 375°F until the crust is golden and the filling is bubbly.','Apple Pie','American'),(6,'Serve warm with vanilla ice cream.','Apple Pie','American'),(1,'Prepare phyllo dough and layer half in a greased baking dish.','Bakllasarem','French'),(2,'Mix chopped walnuts, sugar, and cinnamon; spread over the phyllo.','Bakllasarem','French'),(3,'Top with the remaining phyllo, brushing each layer with melted butter.','Bakllasarem','French'),(4,'Cut into diamonds and bake at 350°F until golden and crisp.','Bakllasarem','French'),(5,'Pour syrup made from sugar, water, and lemon juice over the hot pastry.','Bakllasarem','French'),(6,'Allow to cool before serving.','Bakllasarem','French'),(1,'Mix beaten eggs with crumbled sirene cheese and yogurt.','Banitsa','Korean'),(2,'Layer sheets of phyllo dough in a greased baking dish, brushing each with melted butter.','Banitsa','Korean'),(3,'Spread the egg and cheese mixture between layers of phyllo.','Banitsa','Korean'),(4,'Bake at 375°F until golden brown and puffed.','Banitsa','Korean'),(5,'Cut into squares and serve hot.','Banitsa','Korean'),(1,'Rub ribs with a mixture of paprika, garlic powder, salt, and sugar.','Barbecue Ribs','Greek'),(2,'Wrap ribs in foil and bake at 275°F for 3 hours until tender.','Barbecue Ribs','Greek'),(3,'Remove ribs from foil, brush with barbecue sauce, and grill for 10 minutes on each side.','Barbecue Ribs','Greek'),(4,'Serve with extra barbecue sauce.','Barbecue Ribs','Greek'),(1,'Slice beef into thin strips.','Beef Stroganoff','Indian'),(2,'Season beef with salt and pepper.','Beef Stroganoff','Indian'),(3,'Heat oil in a pan over medium heat and sauté onions until translucent.','Beef Stroganoff','Indian'),(4,'Add beef to the pan and brown.','Beef Stroganoff','Indian'),(5,'Reduce heat and add mustard and beef broth. Simmer for 10 minutes.','Beef Stroganoff','Indian'),(6,'Stir in sour cream and cook for another 5 minutes without boiling.','Beef Stroganoff','Indian'),(7,'Serve hot over noodles or rice.','Beef Stroganoff','Indian'),(1,'Cook bacon until crispy.','BLT Sandwich','Italian'),(2,'Toast slices of bread.','BLT Sandwich','Italian'),(3,'Spread mayonnaise on one side of each slice of bread.','BLT Sandwich','Italian'),(4,'Layer crispy bacon, sliced tomatoes, and lettuce leaves on one slice, then top with another slice of bread.','BLT Sandwich','Italian'),(5,'Cut in half and serve.','BLT Sandwich','Italian'),(1,'Peel and chop all vegetables.','Borscht','Japanese'),(2,'Sauté onions and carrots in a pot.','Borscht','Japanese'),(3,'Add beets and continue to sauté for a few minutes.','Borscht','Japanese'),(4,'Add water, cabbage, and potatoes and bring to a boil.','Borscht','Japanese'),(5,'Simmer until all vegetables are tender.','Borscht','Japanese'),(6,'Add vinegar, sugar, and salt to taste.','Borscht','Japanese'),(7,'Serve with sour cream and fresh dill.','Borscht','Japanese'),(1,'Melt butter and chocolate together.','Brownies','Chinese'),(2,'Stir in sugar, eggs, and vanilla extract.','Brownies','Chinese'),(3,'Mix in flour, cocoa powder, and salt.','Brownies','Chinese'),(4,'Fold in additional chocolate chunks.','Brownies','Chinese'),(5,'Pour batter into a greased baking pan and bake at 350°F for 25 minutes.','Brownies','Chinese'),(6,'Cool in pan before cutting into squares and serving.','Brownies','Chinese'),(1,'Toast bread slices lightly.','Bulgarian Cheese Toast','Russian'),(2,'Spread a thick layer of grated Bulgarian cheese on each slice.','Bulgarian Cheese Toast','Russian'),(3,'Broil in the oven until the cheese is bubbly and golden.','Bulgarian Cheese Toast','Russian'),(4,'Optionally top with a fried egg and serve immediately.','Bulgarian Cheese Toast','Russian'),(1,'Preheat oven to 350°F.','Byrek me Spinaq','Japanese'),(2,'Sauté spinach until wilted, then mix with crumbled feta cheese and eggs.','Byrek me Spinaq','Japanese'),(3,'Layer phyllo sheets in a greased baking pan, brushing each with oil.','Byrek me Spinaq','Japanese'),(4,'Spread spinach mixture over phyllo, then cover with more phyllo sheets.','Byrek me Spinaq','Japanese'),(5,'Bake until golden brown.','Byrek me Spinaq','Japanese'),(6,'Cut into squares and serve.','Byrek me Spinaq','Japanese'),(1,'Form ground beef into patties and season with salt and pepper.','Cheeseburger','Albanian'),(2,'Grill patties on medium-high heat until desired doneness.','Cheeseburger','Albanian'),(3,'Place a slice of cheese on each patty in the last minute of cooking to melt.','Cheeseburger','Albanian'),(4,'Toast hamburger buns on the grill.','Cheeseburger','Albanian'),(5,'Assemble the burgers by placing lettuce, tomato, patty with cheese, onions, and pickles on the bun.','Cheeseburger','Albanian'),(6,'Serve with ketchup, mustard, or mayonnaise.','Cheeseburger','Albanian'),(1,'Cream together butter and sugars until fluffy.','Chocolate Chip Cookies','Indian'),(2,'Beat in eggs and vanilla extract.','Chocolate Chip Cookies','Indian'),(3,'Mix in flour, baking soda, and salt.','Chocolate Chip Cookies','Indian'),(4,'Stir in chocolate chips.','Chocolate Chip Cookies','Indian'),(5,'Drop spoonfuls of dough onto a baking sheet and bake at 350°F for 10 minutes or until golden.','Chocolate Chip Cookies','Indian'),(6,'Cool on a wire rack before serving.','Chocolate Chip Cookies','Indian'),(1,'Cook chopped bacon until crisp; set aside.','Clam Chowder','Japanese'),(2,'In the same pot, sauté onions and celery until soft.','Clam Chowder','Japanese'),(3,'Add potatoes, clams with juice, water, and seasonings; simmer until potatoes are tender.','Clam Chowder','Japanese'),(4,'Stir in cream and heat through without boiling.','Clam Chowder','Japanese'),(5,'Serve garnished with crispy bacon and oyster crackers.','Clam Chowder','Japanese'),(1,'Sauté chopped onions and bell peppers in olive oil until soft.','Fërgesë','Indian'),(2,'Add chopped tomatoes and simmer until the mixture thickens.','Fërgesë','Indian'),(3,'Stir in crumbled cottage cheese and season with salt and pepper.','Fërgesë','Indian'),(4,'Cook until everything is heated through.','Fërgesë','Indian'),(5,'Serve warm with crusty bread.','Fërgesë','Indian'),(1,'Combine flour, salt, pepper, paprika, and garlic powder in a bowl.','Fried Chicken','Bulgarian'),(2,'Dip chicken pieces in beaten eggs, then dredge in flour mixture.','Fried Chicken','Bulgarian'),(3,'Heat oil in a deep fryer or large skillet to 350°F.','Fried Chicken','Bulgarian'),(4,'Fry chicken until crispy and cooked through, about 10 minutes per side.','Fried Chicken','Bulgarian'),(5,'Drain on paper towels and serve.','Fried Chicken','Bulgarian'),(1,'Prepare walnut sponge layers by beating egg whites with sugar and folding in ground walnuts and flour.','Garash Cake','Greek'),(2,'Bake each layer separately until set.','Garash Cake','Greek'),(3,'Prepare chocolate ganache with heavy cream and dark chocolate.','Garash Cake','Greek'),(4,'Assemble the cake by layering sponge and ganache, finishing with a ganache topping.','Garash Cake','Greek'),(5,'Chill in the fridge to set before serving.','Garash Cake','Greek'),(1,'Soak beans overnight, then drain and rinse.','Jani me fasule','Chinese'),(2,'Sauté onions and garlic in a pot until translucent.','Jani me fasule','Chinese'),(3,'Add beans, water, and chopped tomatoes. Bring to a boil, then reduce to a simmer.','Jani me fasule','Chinese'),(4,'Cook covered on low heat for 2 hours until beans are tender.','Jani me fasule','Chinese'),(5,'Season with salt, pepper, and a pinch of chili powder.','Jani me fasule','Chinese'),(6,'Serve hot with bread.','Jani me fasule','Chinese'),(1,'Layer kadaif dough in a tray, interspersing with mixed nuts.','Kadaif','Bulgarian'),(2,'Bake until golden brown.','Kadaif','Bulgarian'),(3,'Pour a hot syrup made of sugar, water, and lemon juice over the baked kadaif.','Kadaif','Bulgarian'),(4,'Let it cool and absorb the syrup before serving.','Kadaif','Bulgarian'),(1,'Rinse buckwheat groats under cold water.','Kasha','German'),(2,'Bring water to a boil and add groats.','Kasha','German'),(3,'Reduce heat to low, cover, and simmer until groats are tender and water is absorbed.','Kasha','German'),(4,'Serve hot with milk or as a side dish to meat.','Kasha','German'),(1,'Brown the meat in a pot with some oil.','Kavarma','German'),(2,'Add chopped onions, peppers, and mushrooms to the pot and sauté until soft.','Kavarma','German'),(3,'Stir in paprika, a splash of white wine, and tomato paste. Cover and simmer for an hour.','Kavarma','German'),(4,'Season with salt, pepper, and fresh herbs before serving.','Kavarma','German'),(1,'Cook macaroni according to package instructions; drain.','Macaroni and Cheese','Russian'),(2,'In a saucepan, melt butter and stir in flour to make a roux.','Macaroni and Cheese','Russian'),(3,'Gradually add milk to the roux, stirring constantly until thickened.','Macaroni and Cheese','Russian'),(4,'Remove from heat and mix in grated cheese until melted.','Macaroni and Cheese','Russian'),(5,'Combine cheese sauce with macaroni, transfer to a baking dish, and bake at 375°F for 20 minutes.','Macaroni and Cheese','Russian'),(6,'Optionally, top with breadcrumbs and bake until golden.','Macaroni and Cheese','Russian'),(1,'Mix honey, sugar, and eggs in a bowl.','Medovik','Italian'),(2,'Add baking soda and melt mixture over steam until it increases in volume.','Medovik','Italian'),(3,'Mix flour into the warm honey mixture to form dough.','Medovik','Italian'),(4,'Divide the dough into 8 parts, roll out each and bake for 5 minutes at 350°F.','Medovik','Italian'),(5,'Whisk sour cream with sugar and vanilla.','Medovik','Italian'),(6,'Spread cream between each cooled cake layer.','Medovik','Italian'),(7,'Coat the outside with leftover cream and crumble a baked dough layer on top.','Medovik','Italian'),(8,'Chill in fridge overnight before serving.','Medovik','Italian'),(1,'Mix flour, yeast, and yogurt to form a soft dough. Let it rise until doubled.','Mekitsa','Turkish'),(2,'Heat oil in a deep fryer.','Mekitsa','Turkish'),(3,'Roll out small pieces of dough and fry until golden brown on both sides.','Mekitsa','Turkish'),(4,'Drain on paper towels and sprinkle with powdered sugar, or serve with honey or jam.','Mekitsa','Turkish'),(1,'Clean mussels and discard any that are open and do not close when tapped.','Mish me midhje','Turkish'),(2,'Heat olive oil in a large skillet, add minced garlic, and sauté until fragrant.','Mish me midhje','Turkish'),(3,'Add mussels and cover with white wine, simmer until mussels open.','Mish me midhje','Turkish'),(4,'Sprinkle with chopped parsley and serve hot.','Mish me midhje','Turkish'),(5,'Serve with pasta or fresh bread.','Mish me midhje','Turkish'),(1,'Layer thinly sliced potatoes and seasoned minced meat in a baking dish.','Musaka','Albanian'),(2,'Mix eggs with yogurt and pour over the layers.','Musaka','Albanian'),(3,'Bake at 350°F until the top is golden and the potatoes are tender.','Musaka','Albanian'),(4,'Allow to set before serving.','Musaka','Albanian'),(1,'Boil potatoes, carrots, and eggs until cooked.','Olivier Salad','Albanian'),(2,'Dice all cooked ingredients and pickles.','Olivier Salad','Albanian'),(3,'Combine in a bowl with peas and diced chicken.','Olivier Salad','Albanian'),(4,'Mix thoroughly with mayonnaise.','Olivier Salad','Albanian'),(5,'Chill before serving.','Olivier Salad','Albanian'),(1,'Mix flour, sugar, baking powder, and salt in a bowl.','Pancakes','French'),(2,'In another bowl, whisk together milk, egg, and melted butter.','Pancakes','French'),(3,'Combine the wet and dry ingredients until just mixed; some lumps are okay.','Pancakes','French'),(4,'Heat a griddle or skillet over medium heat and pour batter to form pancakes.','Pancakes','French'),(5,'Cook until bubbles form on the surface, then flip and cook until golden.','Pancakes','French'),(6,'Serve with butter and maple syrup.','Pancakes','French'),(1,'Mix flour, eggs, water, and salt to form a dough.','Pelmeni','Chinese'),(2,'Roll dough thin and cut into circles.','Pelmeni','Chinese'),(3,'Place a small amount of meat filling in the center of each circle.','Pelmeni','Chinese'),(4,'Fold dough over and seal edges to form a dumpling.','Pelmeni','Chinese'),(5,'Boil dumplings in salted water until they float to the surface.','Pelmeni','Chinese'),(6,'Serve hot with melted butter or sour cream.','Pelmeni','Chinese'),(1,'Slice zucchini, bell peppers, eggplants, and tomatoes into even pieces.','Përime në zgare','Korean'),(2,'Marinate with olive oil, garlic, and herbs.','Përime në zgare','Korean'),(3,'Grill on high heat until vegetables are tender and have grill marks.','Përime në zgare','Korean'),(4,'Serve hot or at room temperature, garnished with fresh basil.','Përime në zgare','Korean'),(1,'Mix honey, sugar, and spices in a bowl.','Pryaniki','Korean'),(2,'Add eggs and melted butter, then blend in flour to form a stiff dough.','Pryaniki','Korean'),(3,'Roll out dough and cut into shapes.','Pryaniki','Korean'),(4,'Bake at 350°F for 15-20 minutes.','Pryaniki','Korean'),(5,'Mix powdered sugar with lemon juice to make icing.','Pryaniki','Korean'),(6,'Glaze cookies after they have cooled.','Pryaniki','Korean'),(1,'Cook rice until tender, then mix with beaten eggs, chopped mint, and salt.','Qifqi','German'),(2,'Heat oil in a deep skillet.','Qifqi','German'),(3,'Form rice mixture into small balls and fry until golden and crispy.','Qifqi','German'),(4,'Drain on paper towels and serve hot.','Qifqi','German'),(1,'Prepare cabbage leaves by boiling until tender.','Sarmi','French'),(2,'Mix minced meat with rice, onions, and spices.','Sarmi','French'),(3,'Place a spoonful of the filling on each leaf and roll tightly.','Sarmi','French'),(4,'Arrange the rolls in a pot, cover with tomato sauce and water.','Sarmi','French'),(5,'Simmer on low heat until the meat and rice are fully cooked.','Sarmi','French'),(6,'Serve hot, garnished with fresh herbs.','Sarmi','French'),(1,'Sauté onions and carrots in a pot.','Shchi','American'),(2,'Add meat (beef or pork) and sauté until browned.','Shchi','American'),(3,'Add water and bring to a boil.','Shchi','American'),(4,'Add chopped cabbage and potatoes, simmer until all ingredients are tender.','Shchi','American'),(5,'Season with salt, pepper, and herbs before serving.','Shchi','American'),(6,'Serve with a dollop of sour cream.','Shchi','American'),(1,'Preheat oven to 350°F.','Shëndetli','Mexican'),(2,'Prepare cake batter with eggs, sugar, and ground walnuts.','Shëndetli','Mexican'),(3,'Pour into a greased pan and bake until a toothpick comes out clean.','Shëndetli','Mexican'),(4,'Simultaneously, prepare syrup with sugar, water, and lemon juice.','Shëndetli','Mexican'),(5,'Pour hot syrup over the hot cake after removing from oven.','Shëndetli','Mexican'),(6,'Let absorb and cool before serving.','Shëndetli','Mexican'),(1,'Chop tomatoes, cucumbers, and onions into bite-sized pieces.','Shopska Salata','Mexican'),(2,'Combine in a bowl and season with salt and olive oil.','Shopska Salata','Mexican'),(3,'Top with grated sirene cheese and a sprinkle of parsley before serving.','Shopska Salata','Mexican'),(1,'Prepare rice according to package instructions.','Speca të mbushur','Italian'),(2,'Mix cooked rice with chopped herbs, garlic, and precooked shrimp.','Speca të mbushur','Italian'),(3,'Cut tops off bell peppers and remove seeds.','Speca të mbushur','Italian'),(4,'Stuff peppers with rice mixture, place in a baking dish.','Speca të mbushur','Italian'),(5,'Bake at 375°F until peppers are soft and filling is hot.','Speca të mbushur','Italian'),(6,'Serve with lemon wedges.','Speca të mbushur','Italian'),(1,'Mix tvorog, eggs, flour, sugar, and vanilla.','Syrniki','Mexican'),(2,'Form small patties from the mixture.','Syrniki','Mexican'),(3,'Fry patties in a hot, oiled pan until golden brown on both sides.','Syrniki','Mexican'),(4,'Serve hot with sour cream or jam.','Syrniki','Mexican'),(1,'Combine yogurt with water to a soup-like consistency.','Tarator','American'),(2,'Add finely chopped cucumbers, crushed garlic, chopped dill, and crushed walnuts.','Tarator','American'),(3,'Season with salt and olive oil.','Tarator','American'),(4,'Chill in the fridge for at least an hour before serving.','Tarator','American'),(1,'Brown lamb pieces in a skillet with a little oil.','Tavë Kosi','Greek'),(2,'Place lamb in a baking dish and cover with rice and water.','Tavë Kosi','Greek'),(3,'Bake in the oven at 375°F for 30 minutes.','Tavë Kosi','Greek'),(4,'Whisk together yogurt, eggs, and flour; pour over the lamb and rice.','Tavë Kosi','Greek'),(5,'Return to oven and bake until the topping is golden and set.','Tavë Kosi','Greek'),(6,'Serve hot.','Tavë Kosi','Greek'),(1,'Puree apples and mix with sugar.','Zefir','Turkish'),(2,'Heat mixture until sugar dissolves.','Zefir','Turkish'),(3,'Whip egg whites to stiff peaks.','Zefir','Turkish'),(4,'Gradually combine hot fruit mixture with egg whites.','Zefir','Turkish'),(5,'Pipe onto parchment paper into desired shapes.','Zefir','Turkish'),(6,'Let dry at room temperature for 12 hours.','Zefir','Turkish');
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme` (
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`name`),
  KEY `fk_theme_image1_idx` (`image_id`),
  CONSTRAINT `fk_theme_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES ('Asian Fusion','A mix of popular dishes from different Asian cuisines',3005),('BBQ Bash','A hearty barbecue feast with grilled meats',3004),('Farm-to-Table','A theme centered around fresh locally-sourced ingredients',3006),('French Bistro','Elegant and classic French dishes',3008),('Italian Trattoria','Classic Italian fare with a cozy trattoria ambiance',3003),('Mediterranean Delight','A theme inspired by the flavors of the Mediterranean',3002),('Seafood Extravaganza','A feast for seafood lovers',3007),('Southern Comfort','Comfort food from the American South',3009),('Street Food Festival','An array of street food from around the world',3010),('Taco Fiesta','A vibrant and festive theme featuring a taco bar',3001);
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip`
--

DROP TABLE IF EXISTS `tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tip` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip`
--

LOCK TABLES `tip` WRITE;
/*!40000 ALTER TABLE `tip` DISABLE KEYS */;
INSERT INTO `tip` VALUES (1,'Ensure the lamb is tender before adding the yogurt mixture.'),(2,'Serve with a side of fresh salad to balance the richness of the dish.'),(3,'Can substitute lamb with chicken for a different flavor.'),(4,'Cut the pastry before baking to make serving easier.'),(5,'Ensure the syrup is hot when poured over the cooled pastry to absorb properly.'),(6,'Can add clove or cardamom to the syrup for extra flavor.'),(7,'Add chili flakes for a spicy kick.'),(8,'Can be made ahead and reheated, enhancing the flavors.'),(9,'Perfect as a vegetarian main course.'),(10,'Ensure the rice is not overcooked as it will bake further in the oven.'),(11,'Can use a mix of seafood like shrimp and scallops.'),(12,'Top with cheese for the last 10 minutes of baking for a melty crust.'),(13,'Keep the phyllo dough covered with a damp towel while working to prevent it from drying out.'),(14,'Add onions to the spinach mixture for extra flavor.'),(15,'Serve with yogurt for breakfast or a light lunch.'),(16,'Check water level during cooking and add more if needed to prevent sticking.'),(17,'Can be served with pickled vegetables for added flavor.'),(18,'Leftovers taste even better the next day as flavors meld.'),(19,'Do not underbake the cake; ensure it is fully set to absorb the syrup.'),(20,'Pierce the cake with a fork before pouring syrup to enhance absorption.'),(21,'Serve with a dollop of whipped cream or vanilla ice cream.'),(22,'Use short-grain rice for better stickiness and forming.'),(23,'Add finely chopped onions to the rice mixture for extra flavor.'),(24,'Serve with plain yogurt or tzatziki for dipping.'),(25,'Ensure the grill is very hot before adding vegetables to get good sear marks.'),(26,'Can be served as a side dish or as a vegetarian main course.'),(27,'Drizzle with balsamic vinegar before serving for added flavor.'),(28,'Always use fresh mussels for the best flavor.'),(29,'Discard any mussels that do not open after cooking.'),(30,'Add a pinch of chili flakes for a spicy version.'),(31,'Do not press down on the patties while grilling to keep the juices inside.'),(32,'For extra flavor, add a slice of bacon on top of the cheese.'),(33,'Use high-quality meat with a bit of fat for juicier patties.'),(34,'Keep all ingredients, especially the butter and water, cold when making the crust.'),(35,'Let the pie cool for at least 20 minutes after baking to set the filling.'),(36,'Sprinkle a little sugar on top of the crust before baking for a sweet crunch.'),(37,'Keep the oil temperature consistent for the best results.'),(38,'Add a bit of hot sauce to the egg wash for a spicy kick.'),(39,'Let the chicken rest for a few minutes after frying for extra crispiness.'),(40,'For extra creamy macaroni, add a dollop of cream cheese to the sauce.'),(41,'Use a mix of different cheeses for more depth of flavor.'),(42,'Add cooked bacon or ham for a heartier dish.'),(43,'Let the ribs marinate with the dry rub overnight for deeper flavor.'),(44,'Keep a water pan in the grill to maintain moisture during the final grilling.'),(45,'Apply multiple layers of barbecue sauce for a richer flavor.'),(46,'Do not overmix the batter to keep pancakes fluffy.'),(47,'Add blueberries or chocolate chips to the batter for variety.'),(48,'Test griddle temperature with a small amount of batter; it should sizzle.'),(49,'Chill the dough for 30 minutes before baking to prevent spreading.'),(50,'Use a combination of chocolate chip types (milk, dark, white) for extra flavor.'),(51,'Store cookies in an airtight container to keep them soft.'),(52,'Add a slice of avocado or a fried egg to elevate this classic sandwich.'),(53,'Use thick-cut bacon for more texture and flavor.'),(54,'Toast the bread lightly to keep it from getting soggy from the tomato.'),(55,'Do not let the chowder boil after adding the cream to prevent curdling.'),(56,'For a thicker chowder, mash some of the potatoes slightly before adding the cream.'),(57,'Enhance the flavor by adding a bay leaf during simmering.'),(58,'Do not overmix the batter to keep the brownies fudgy.'),(59,'Add nuts like walnuts or pecans for a crunchy texture.'),(60,'Serve warm with a scoop of ice cream for a decadent dessert.'),(61,'Chill the vegetables before preparing for a refreshing starter.'),(62,'Serve alongside a loaf of crusty bread.'),(63,'Add roasted red peppers for additional flavor and color.'),(64,'Serve with a side of Bulgarian bread or over cooked rice.'),(65,'Adjust the amount of paprika to taste for a spicier version.'),(66,'Can be made ahead and reheated, as it tastes even better the next day.'),(67,'Keep phyllo dough covered with a damp towel to prevent drying out.'),(68,'Serve with plain yogurt or a hot drink for a traditional breakfast.'),(69,'Add spinach or leeks to the filling for a variation.'),(70,'Do not overcrowd the fryer to maintain a consistent temperature.'),(71,'Serve immediately while hot for the best texture.'),(72,'Experiment with savory versions by adding cheese or garlic to the dough.'),(73,'Let the musaka sit for 10-15 minutes after baking to firm up for easier serving.'),(74,'Add a layer of sautéed onions and carrots for extra flavor and moisture.'),(75,'Serve with a side salad of cucumbers and tomatoes.'),(76,'Serve very cold for a refreshing summer dish.'),(77,'Add ice cubes just before serving to keep it chilled.'),(78,'Experiment with adding other herbs like mint for a different flavor profile.'),(79,'Ensure the syrup is hot when poured over to soak the kadaif thoroughly.'),(80,'Allow the kadaif to sit for several hours to fully absorb the syrup and enhance the flavors.'),(81,'Serve with a dollop of whipped cream or a scoop of ice cream.'),(82,'Serve with a side of tomato slices or olives.'),(83,'For extra flavor, add a sprinkle of paprika or black pepper on the cheese before broiling.'),(84,'Ensure the bread is toasted first to prevent it from becoming soggy.'),(85,'Make sure each sponge layer is cooled before applying ganache.'),(86,'If the ganache is too runny, chill it before spreading on the cake layers.'),(87,'Decorate with walnut pieces or chocolate shavings for an elegant finish.'),(88,'Ensure the cabbage leaves are not ripped to prevent filling from leaking out.'),(89,'Add a bit of smoked meat to the pot for a deeper flavor.'),(90,'Serve with a dollop of yogurt or sour cream.'),(91,'Use high-quality beef for the best texture.'),(92,'Do not let the sour cream boil to prevent curdling.'),(93,'Serve with a side of pickles for an authentic Russian experience.'),(94,'Ensure each layer is evenly rolled to cook uniformly.'),(95,'The cake tastes better after it soaks overnight, plan accordingly.'),(96,'Use a serrated knife for easier slicing of the soft layers.'),(97,'Adjust the amount of vinegar and sugar to balance the sweetness and acidity.'),(98,'Can be served with a slice of rye bread.'),(99,'Add a beef bone to the pot for extra flavor.'),(100,'Make sure to seal the dumplings well to prevent them from opening while boiling.'),(101,'Pelmeni can be frozen for future use before boiling.'),(102,'Serve with vinegar or mustard for added flavor.'),(103,'Ensure the tvorog is well-drained to make the patties easier to form.'),(104,'Adjust the amount of flour to achieve the desired thickness.'),(105,'Try different jams as toppings for variety.'),(106,'For a richer flavor, toast the groats in a dry pan before boiling.'),(107,'Can be served with sautéed onions for added taste.'),(108,'Excellent base for adding vegetables or meat for a heartier meal.'),(109,'Allow the dough to rest before rolling for easier handling.'),(110,'Adjust spice amounts to taste.'),(111,'The icing sets better if cookies are completely cool.'),(112,'Use a silicone mat for easier removal after drying.'),(113,'Experiment with different fruit purées for variety.'),(114,'Ensure the mixture is very stiff before piping to maintain shape.'),(115,'Dice all ingredients to the same size for a uniform texture.'),(116,'Can be made a day ahead to enhance the flavors.'),(117,'Add a little mustard to the mayonnaise for extra zest.'),(118,'Using a mix of pork and beef can enhance the flavor.'),(119,'Serve with rye bread for an authentic Russian meal.'),(120,'Add a splash of vinegar or lemon juice for added zest.');
/*!40000 ALTER TABLE `tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `my_profile`
--

/*!50001 DROP VIEW IF EXISTS `my_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_profile` AS select `chef`.`id` AS `id`,`chef`.`first_name` AS `first_name`,`chef`.`last_name` AS `last_name`,`chef`.`phone` AS `phone`,`chef`.`date_of_birth` AS `date_of_birth`,`chef`.`age` AS `age`,`chef`.`years_exp` AS `years_exp`,`chef`.`rank` AS `rank`,`chef`.`image_id` AS `image_id` from `chef` where (`chef`.`id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_recipes_equipment`
--

/*!50001 DROP VIEW IF EXISTS `my_recipes_equipment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_recipes_equipment` AS select `rhe`.`recipe_name` AS `recipe_name`,`rhe`.`recipe_cuisine_name` AS `recipe_cuisine_name`,`eq`.`name` AS `name`,`eq`.`manual` AS `manual`,`eq`.`image_id` AS `image_id` from ((`recipe_has_chef` `rhc` join `recipe_has_equipment` `rhe` on(((`rhc`.`recipe_name` = `rhe`.`recipe_name`) and (`rhc`.`recipe_cuisine_name` = `rhe`.`recipe_cuisine_name`)))) join `equipment` `eq` on((`eq`.`name` = `rhe`.`equipment_name`))) where (`rhc`.`chef_id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_recipes_ingredients`
--

/*!50001 DROP VIEW IF EXISTS `my_recipes_ingredients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_recipes_ingredients` AS select `rhi`.`recipe_name` AS `recipe_name`,`rhi`.`recipe_cuisine_name` AS `recipe_cuisine_name`,`rhi`.`ingredient_name` AS `ingredient_name`,`rhi`.`quantity` AS `quantity`,`ing`.`cal_per_100` AS `cal_per_100`,`ing`.`food_team_short_name` AS `food_team_short_name`,`ing`.`image_id` AS `image_id` from ((`recipe_has_chef` `rhc` join `recipe_has_ingredient` `rhi` on(((`rhc`.`recipe_name` = `rhi`.`recipe_name`) and (`rhc`.`recipe_cuisine_name` = `rhi`.`recipe_cuisine_name`)))) join `ingredient` `ing` on((`ing`.`name` = `rhi`.`ingredient_name`))) where (`rhc`.`chef_id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_recipes_labels`
--

/*!50001 DROP VIEW IF EXISTS `my_recipes_labels`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_recipes_labels` AS select `rhl`.`recipe_name` AS `recipe_name`,`rhl`.`recipe_cuisine_name` AS `recipe_cuisine_name`,`rhl`.`label_name` AS `label_name` from (`recipe_has_chef` `rhc` join `recipe_has_label` `rhl` on(((`rhc`.`recipe_name` = `rhl`.`recipe_name`) and (`rhc`.`recipe_cuisine_name` = `rhl`.`recipe_cuisine_name`)))) where (`rhc`.`chef_id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_recipes_meals`
--

/*!50001 DROP VIEW IF EXISTS `my_recipes_meals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_recipes_meals` AS select `rhm`.`recipe_name` AS `recipe_name`,`rhm`.`recipe_cuisine_name` AS `recipe_cuisine_name`,`rhm`.`meal_type` AS `meal_type` from (`recipe_has_chef` `rhc` join `recipe_has_meal` `rhm` on(((`rhc`.`recipe_name` = `rhm`.`recipe_name`) and (`rhc`.`recipe_cuisine_name` = `rhm`.`recipe_cuisine_name`)))) where (`rhc`.`chef_id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_recipes_steps`
--

/*!50001 DROP VIEW IF EXISTS `my_recipes_steps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_recipes_steps` AS select `rhc`.`recipe_name` AS `recipe_name`,`rhc`.`recipe_cuisine_name` AS `recipe_cuisine_name`,`s`.`number` AS `number`,`s`.`description` AS `description` from (`recipe_has_chef` `rhc` join `step` `s` on(((`rhc`.`recipe_name` = `s`.`recipe_name`) and (`rhc`.`recipe_cuisine_name` = `s`.`recipe_cuisine_name`)))) where (`rhc`.`chef_id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_recipes_themes`
--

/*!50001 DROP VIEW IF EXISTS `my_recipes_themes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_recipes_themes` AS select `rht`.`recipe_name` AS `recipe_name`,`rht`.`recipe_cuisine_name` AS `recipe_cuisine_name`,`rht`.`theme_name` AS `theme_name`,`th`.`description` AS `description`,`th`.`image_id` AS `image_id` from ((`recipe_has_chef` `rhc` join `recipe_has_theme` `rht` on(((`rhc`.`recipe_name` = `rht`.`recipe_name`) and (`rhc`.`recipe_cuisine_name` = `rht`.`recipe_cuisine_name`)))) join `theme` `th` on((`th`.`name` = `rht`.`theme_name`))) where (`rhc`.`chef_id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_recipes_tips`
--

/*!50001 DROP VIEW IF EXISTS `my_recipes_tips`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_recipes_tips` AS select `rht`.`recipe_name` AS `recipe_name`,`rht`.`recipe_cuisine_name` AS `recipe_cuisine_name`,`rht`.`tip_id` AS `tip_id`,`t`.`tip` AS `tip` from ((`recipe_has_chef` `rhc` join `recipe_has_tip` `rht` on(((`rhc`.`recipe_name` = `rht`.`recipe_name`) and (`rhc`.`recipe_cuisine_name` = `rht`.`recipe_cuisine_name`)))) join `tip` `t` on((`t`.`id` = `rht`.`tip_id`))) where (`rhc`.`chef_id` = 1) */;
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

-- Dump completed on 2024-05-21 21:06:35
