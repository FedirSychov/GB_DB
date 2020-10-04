-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_communities_users1_idx` (`admin_id`),
  CONSTRAINT `fk_communities_users1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'et',54),(2,'voluptatem',83),(3,'exercitationem',28),(4,'eius',85),(5,'ut',79),(6,'consequatur',21),(7,'voluptatem',33),(8,'velit',27),(9,'est',25),(10,'perferendis',13),(11,'necessitatibus',40),(12,'ut',91),(13,'qui',24),(14,'vero',35),(15,'sit',64),(16,'impedit',66),(17,'cum',20),(18,'dolorem',33),(19,'nihil',5),(20,'reiciendis',89),(21,'consequatur',82),(22,'libero',81),(23,'in',72),(24,'earum',60),(25,'tempore',66),(26,'vero',95),(27,'qui',32),(28,'aut',66),(29,'quos',67),(30,'qui',84),(31,'dolor',17),(32,'illo',20),(33,'maxime',66),(34,'qui',45),(35,'vel',4),(36,'eligendi',45),(37,'minus',66),(38,'explicabo',37),(39,'minus',71),(40,'amet',90),(41,'et',49),(42,'dolorem',11),(43,'deserunt',80),(44,'reprehenderit',73),(45,'voluptatem',46),(46,'enim',44),(47,'excepturi',39),(48,'eos',66),(49,'cupiditate',77),(50,'magnam',43),(51,'laboriosam',54),(52,'expedita',58),(53,'odit',24),(54,'quam',25),(55,'in',17),(56,'omnis',89),(57,'rerum',20),(58,'vero',48),(59,'perspiciatis',55),(60,'est',87),(61,'ipsam',32),(62,'aut',71),(63,'laborum',6),(64,'quidem',98),(65,'asperiores',16),(66,'deserunt',10),(67,'aspernatur',42),(68,'id',81),(69,'molestiae',47),(70,'autem',13),(71,'est',70),(72,'officia',95),(73,'velit',23),(74,'sint',50),(75,'ullam',68),(76,'quo',69),(77,'optio',94),(78,'inventore',6),(79,'modi',34),(80,'ipsa',70),(81,'ad',49),(82,'atque',88),(83,'voluptatibus',27),(84,'quidem',72),(85,'ut',13),(86,'asperiores',44),(87,'et',61),(88,'laudantium',32),(89,'quibusdam',92),(90,'excepturi',16),(91,'voluptatem',18),(92,'iusto',23),(93,'quasi',87),(94,'nostrum',24),(95,'qui',20),(96,'aspernatur',2),(97,'illo',34),(98,'mollitia',62),(99,'eveniet',82),(100,'animi',80);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `status` tinyint unsigned NOT NULL COMMENT 'статус: 0 - запрос, 1 - подтвержден, 2 - отклонен',
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_requests_users1_idx` (`from_user_id`),
  KEY `fk_friend_requests_users2_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_requests_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,10,1),(1,24,0),(1,73,0),(1,78,0),(1,88,0),(2,4,1),(2,55,0),(3,7,2),(3,80,2),(4,8,2),(4,19,2),(4,42,0),(4,85,1),(5,24,2),(5,33,0),(5,40,1),(6,53,0),(7,18,1),(7,43,0),(7,60,0),(8,15,2),(8,17,0),(8,64,1),(9,7,0),(9,16,1),(9,31,1),(10,11,1),(10,69,1),(10,90,2),(11,48,0),(11,70,1),(12,15,1),(12,17,0),(12,49,0),(14,45,2),(14,59,0),(14,82,2),(15,22,2),(15,77,2),(15,97,2),(16,56,2),(16,71,0),(16,88,0),(18,32,0),(18,38,0),(19,4,0),(19,26,1),(19,38,2),(20,50,0),(21,31,1),(21,56,0),(21,83,2),(22,58,2),(22,71,2),(23,59,2),(24,83,1),(25,58,2),(26,10,0),(26,44,0),(27,19,1),(29,2,2),(29,78,1),(29,80,2),(29,98,0),(30,68,2),(30,69,2),(31,8,1),(31,9,0),(32,76,1),(32,100,0),(34,54,2),(35,16,1),(35,71,1),(36,2,2),(36,83,1),(37,17,2),(37,65,1),(40,15,2),(40,64,1),(40,73,0),(41,3,2),(41,21,0),(41,22,1),(41,60,1),(43,5,1),(43,20,1),(43,65,1),(43,71,0),(44,16,2),(44,74,0),(44,90,1),(45,58,2),(45,96,1),(46,7,1),(46,87,0),(47,4,0),(47,18,2),(47,95,0),(48,44,0),(48,50,0),(48,59,0),(49,99,2),(50,60,2),(50,97,1),(51,37,0),(51,84,2),(51,86,1),(51,88,0),(52,35,2),(53,21,0),(53,87,0),(56,48,2),(57,12,2),(58,24,1),(58,47,0),(59,71,2),(59,84,0),(60,15,2),(61,54,0),(61,79,2),(62,57,1),(63,14,2),(63,22,1),(63,49,0),(64,40,1),(64,58,2),(64,69,1),(64,97,1),(65,61,1),(65,66,1),(65,100,2),(66,25,2),(67,30,2),(67,39,0),(67,67,2),(69,20,1),(69,59,1),(69,75,1),(69,91,2),(70,11,0),(70,67,2),(70,81,1),(71,46,2),(71,49,2),(72,22,0),(72,26,2),(72,44,0),(74,31,1),(74,36,0),(74,61,1),(74,63,2),(74,91,0),(75,8,2),(75,12,2),(75,71,2),(76,59,0),(77,15,0),(78,1,1),(78,83,0),(79,28,2),(79,75,2),(79,85,2),(80,18,0),(80,56,2),(81,39,1),(81,53,2),(81,76,1),(81,98,0),(82,2,1),(83,25,2),(84,2,1),(85,14,1),(85,64,2),(85,88,2),(85,90,2),(86,70,1),(87,1,0),(87,45,2),(88,25,2),(88,74,1),(88,93,1),(89,93,0),(90,18,2),(92,74,2),(93,10,1),(94,23,1),(95,11,0),(95,28,0),(96,86,2),(96,87,0),(98,48,2),(98,93,2),(99,19,0),(99,43,1),(100,11,2),(100,77,2),(100,84,2);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `users_id` int NOT NULL,
  `photos_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  `messages_id` int DEFAULT NULL,
  UNIQUE KEY `like_message` (`users_id`,`messages_id`) /*!80000 INVISIBLE */,
  UNIQUE KEY `like_photos` (`users_id`,`photos_id`) /*!80000 INVISIBLE */,
  UNIQUE KEY `like_media` (`users_id`,`media_id`),
  KEY `fk_like_users1_idx` (`users_id`),
  KEY `fk_like_photos1_idx` (`photos_id`),
  KEY `fk_like_media1_idx` (`media_id`),
  KEY `fk_like_messages1_idx` (`messages_id`),
  CONSTRAINT `fk_like_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_like_messages1` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `fk_like_photos1` FOREIGN KEY (`photos_id`) REFERENCES `photos` (`id`),
  CONSTRAINT `fk_like_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `media_type_id` int NOT NULL,
  `text` text,
  `file` blob COMMENT '/files/img/01.jpg',
  `size` int DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_types1_idx` (`media_type_id`),
  CONSTRAINT `fk_media_media_types1` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,2,'new_text',_binary 'eee',123,'123');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'Video'),(2,'Music'),(3,'Message'),(4,'Photo');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`from_user_id`),
  KEY `fk_messages_users2_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,74,54,'Id enim odit sunt. Qui quibusdam ipsa sit ratione cum quibusdam praesentium consequatur. Temporibus qui voluptatum assumenda.','2007-04-18 21:59:40'),(2,54,97,'Molestiae id blanditiis aspernatur est amet distinctio. Corporis aspernatur occaecati autem iure. Et nesciunt dignissimos alias qui. Iste iusto qui molestias natus dolorum optio aut.','1991-11-13 19:58:43'),(3,24,17,'Ipsum vero delectus similique velit voluptas voluptatem ad voluptatem. Ut aliquid modi odio veritatis quos. Accusamus fugiat et excepturi dolorum commodi. Sint ullam voluptas mollitia occaecati.','2000-01-09 02:20:24'),(4,47,52,'Quaerat sit fugiat corporis molestiae qui consequatur corrupti. Voluptates porro laudantium consequatur quia. Ut quas at officiis.','2020-07-23 23:20:39'),(5,44,26,'Repellendus tenetur quibusdam voluptatum sint. Reiciendis quia praesentium ut eum pariatur ut odio. Sed id magnam excepturi non aspernatur quia earum.','1995-11-05 12:28:18'),(6,8,53,'Facilis officiis officia rerum eveniet. Dolorem omnis nemo omnis excepturi in.','1972-09-28 08:27:37'),(7,47,78,'Perferendis iste aut eos molestiae. Id qui corporis possimus itaque quo voluptatem aut sed. Voluptatem voluptates sint occaecati impedit aut. Voluptates excepturi mollitia eos.','1999-03-18 23:49:52'),(8,97,20,'Non asperiores at optio nisi sit ipsam. Repellat debitis eaque occaecati quidem veritatis. Et ut cum quia in porro distinctio. Veniam necessitatibus rerum ut et.','1986-03-19 20:19:34'),(9,99,11,'Repellat debitis veritatis nisi et et. Voluptate porro aperiam repellat sunt et deleniti voluptates. Enim ex qui tenetur et doloremque. Ut laborum qui possimus quod consectetur suscipit quis.','2010-10-03 23:08:00'),(10,23,40,'Iste et temporibus perspiciatis fuga. Labore in soluta aliquam nisi autem iusto assumenda ut. Asperiores repellat dolor dolorum dignissimos quis voluptatem est.','1997-10-16 06:19:00'),(11,75,61,'Eligendi et velit repellendus cupiditate. Quasi inventore perferendis est officia. Delectus eveniet sed consequuntur aliquid eum officia sunt.','1994-06-18 04:28:53'),(12,52,64,'Libero velit quia ex perspiciatis et aut earum. Omnis saepe praesentium ipsam nihil deleniti aut. Deserunt mollitia non ex. Nisi unde voluptates laborum autem soluta delectus.','1991-11-05 21:41:11'),(13,83,23,'Ut molestiae rem vel non. Dolor autem sunt ipsa et perferendis consequatur. Eveniet ut iusto consequuntur sit cumque. Sint necessitatibus molestiae maiores quia iusto.','1989-10-31 02:05:38'),(14,65,64,'Et suscipit sit quo. Vel illum earum quia officiis. Voluptatum ex earum veritatis adipisci et sit. Error dolor qui voluptatibus laborum est.','1988-12-29 17:49:10'),(15,2,57,'Quo delectus culpa deleniti consequatur. Enim est amet consequatur fugiat. Illum earum ut sed explicabo quo illum aut.','1984-10-05 17:48:38'),(16,38,76,'Vel eum et eius et aspernatur dolores. Magni accusamus ipsa alias voluptas. Id deserunt voluptatum quis impedit quas voluptas. Fugiat neque et tempore eveniet.','2005-05-11 09:29:43'),(17,10,92,'Expedita consequatur doloribus pariatur. Itaque enim voluptatem sed dolorem laboriosam hic. Nam pariatur optio enim vero.','1997-06-17 15:46:13'),(18,73,34,'Quia neque unde adipisci cum ad sit. Eum rerum sunt sit vel magni. Est ut accusamus ad quaerat maxime quia iusto.','1978-09-22 20:59:06'),(19,8,19,'Dignissimos delectus architecto iure iure. Dolores facere ut sit. Aut occaecati ut autem omnis molestiae blanditiis nesciunt eaque.','1998-12-03 21:38:29'),(20,85,52,'Consequuntur et deleniti cum minus repellendus beatae animi. Aliquam eum qui expedita cumque. Voluptatem dolorem a amet ex.','1999-07-30 11:09:09'),(21,45,92,'Quod quos voluptatibus distinctio. Nam quasi et sint beatae in odio. Vel voluptatem nesciunt ut nihil illo sed veniam. Quod nostrum quos debitis quo. Ullam a rerum sint sed aut quia.','1983-03-03 21:01:06'),(22,4,91,'Ad sint totam veritatis quisquam. Nobis quae et nobis est fuga dicta enim. Est id autem non qui a.','1989-11-15 10:29:14'),(23,70,100,'Ullam aut nemo quam dolor alias et. Sed omnis labore odit error et at.','1970-04-17 23:57:04'),(24,10,68,'Quae laborum sequi recusandae consequuntur veritatis consequatur aut. Magnam dolores corrupti porro libero vitae. Autem velit explicabo quia.','1988-06-06 01:40:42'),(25,11,33,'Sunt sit reprehenderit ullam modi autem aut. Nesciunt iure tenetur tempora numquam.','2012-03-15 11:03:52'),(26,7,85,'Doloremque consequuntur commodi possimus possimus veritatis facere molestiae. Id veniam esse officia inventore ut in voluptates. Labore et quae vero in.','1995-04-29 20:17:24'),(27,94,59,'Ipsa eaque maxime est ad. Tempora at rerum enim distinctio. Quasi consequatur ipsam ullam.','2013-08-16 07:07:07'),(28,49,76,'Et voluptas nobis necessitatibus sequi quam voluptas. Quia eaque eos qui fugiat. Et in similique iste facere. Eos ipsa officia qui repudiandae pariatur nulla tempore.','1973-04-24 06:53:08'),(29,82,13,'Sint deserunt nostrum quod. Explicabo impedit doloremque nam est eum quam suscipit. Qui quidem sit omnis repellat. Mollitia sit et necessitatibus sed porro dolor et non.','2017-07-22 10:23:41'),(30,39,83,'Repudiandae repellendus est sed natus rerum. Earum veniam alias quam illum ab. Recusandae illo facere nihil ratione.','1996-11-02 01:34:22'),(31,69,77,'Corporis odit enim aut vel. Dicta non provident voluptas amet ad et qui. Esse rem voluptatem soluta ut. Sunt fuga hic molestias inventore.','1975-03-29 18:13:13'),(32,59,79,'Consectetur esse dolores repellendus perspiciatis dolorem ut. Non in provident quibusdam quo quam nesciunt dolore. A cumque sit dignissimos autem rerum consequatur.','1993-04-26 18:20:43'),(33,69,31,'Error et quis neque quia odio. Maiores minima aliquam illo nesciunt vero harum maxime iure. Sit aperiam quas exercitationem sequi enim voluptates. Sequi et facere veniam saepe ea qui.','1987-10-23 09:05:02'),(34,12,77,'Ea at repellat voluptatem qui sed. Eum nulla quisquam dignissimos. Delectus occaecati amet natus. Ipsum et in adipisci et sunt repellendus possimus aut.','1977-06-04 09:16:48'),(35,49,97,'Earum repellat voluptatem itaque nam. Minima quas ex amet culpa molestiae aperiam. Consequatur amet incidunt delectus dolores earum.','1992-01-26 04:51:44'),(36,28,93,'Omnis illo sed consequatur assumenda rerum amet modi enim. Atque similique qui voluptas libero quia. Distinctio aut architecto voluptates at eum odio. Quo aspernatur voluptatibus deserunt.','2020-08-04 18:56:30'),(37,88,31,'Aut commodi hic numquam aliquid beatae sapiente omnis. Beatae libero qui molestias.','2007-12-01 13:54:48'),(38,84,58,'Doloremque atque repellendus minima. Ipsam aut at ratione minus. Magni debitis placeat ipsa non qui et. Soluta earum quos consequatur veritatis nostrum iste.','2014-09-02 03:50:04'),(39,31,93,'Voluptatem veritatis saepe aut et ratione eius excepturi. Ea quisquam et voluptas quibusdam pariatur ab. Aut harum necessitatibus non. Nobis consequuntur vel quia.','2003-05-24 21:44:40'),(40,26,41,'Voluptas necessitatibus aperiam consectetur iure ut vero. Enim explicabo occaecati voluptatum ducimus impedit. Amet qui aut saepe asperiores. Quis quo voluptate sint tenetur aut porro.','2015-10-05 02:33:19'),(41,26,33,'Ut ullam nemo aperiam. Magni in explicabo rem qui quasi dolor qui. Nulla inventore et enim explicabo velit tempore nisi.','1978-09-05 21:26:32'),(42,26,19,'In voluptate unde nulla sit autem omnis facilis est. Ut alias labore amet illo. Aspernatur optio ex doloremque itaque id.','1970-06-26 03:52:32'),(43,91,74,'Ducimus est repudiandae corrupti rerum eos cum. Totam alias aut expedita omnis temporibus. Odit praesentium animi similique. Voluptatibus quisquam ut voluptatem voluptatem odio et vel.','2010-02-15 20:39:12'),(44,94,72,'Qui in impedit iure qui. Et magnam aut ut repellat ut totam qui. Reiciendis ratione qui ipsa autem possimus rerum quidem officia.','2018-03-30 01:54:01'),(45,86,33,'Voluptatibus animi ut est. Sed non quod omnis cupiditate officiis. Ut dolorem cumque velit quidem aut asperiores reiciendis non. Voluptate modi nesciunt quo.','2018-08-29 03:47:57'),(46,55,54,'Quod vero incidunt sint qui. Aut possimus ex voluptas voluptate sint officiis quae. Vel et voluptas ut iste quia sit. Autem provident quia quibusdam rerum explicabo explicabo reiciendis.','1990-05-15 14:48:31'),(47,10,13,'Explicabo corrupti quia animi quaerat eos libero. Totam beatae dolores illum quis quisquam ex. Expedita nostrum et ducimus et cumque excepturi reprehenderit.','1984-02-15 11:30:49'),(48,33,78,'Aut ut quibusdam error et. Iusto consectetur molestiae nisi saepe non suscipit omnis. Reprehenderit voluptatem delectus ea voluptatum.','2007-10-03 00:28:03'),(49,43,44,'Fugit autem culpa et rem et sed vel eius. Facere dolore esse deleniti possimus.','2004-10-22 18:08:30'),(50,55,92,'Expedita inventore laudantium sed qui eos. Et debitis autem aperiam qui. Numquam blanditiis sed debitis fugiat maxime. Tempora dolor sit eum qui sequi sint tempore.','2013-09-02 17:06:56'),(51,40,82,'Dolorem pariatur numquam aut cupiditate est. Harum odio architecto illo quis earum. Ut dicta eaque consequatur quia et iure. Omnis esse reiciendis sapiente earum voluptatem maiores maxime.','1998-12-20 20:33:00'),(52,84,28,'Enim velit corporis voluptatem totam. Quae maxime sapiente ipsa nisi veritatis at. Et temporibus sed et facere aperiam veritatis.','2014-04-07 08:54:08'),(53,13,67,'Consequatur velit labore dolore adipisci. Sit odio accusantium unde nihil dolorem suscipit. Reiciendis eaque eos assumenda. Nisi temporibus a voluptatem at.','1982-04-22 18:03:09'),(54,85,43,'Similique libero molestiae dolores dolorem porro voluptas maxime reprehenderit. Nemo aut officia veniam aut veritatis iste. Ex in inventore commodi nemo quos.','2002-10-15 20:51:03'),(55,60,10,'Porro expedita consequatur rerum rerum ab ut aperiam. Asperiores possimus ullam fugit minus sunt. Necessitatibus sunt nesciunt laboriosam in.','2010-05-28 05:25:29'),(56,83,86,'Dolore nesciunt quasi et. Repellendus unde in nisi aperiam quos. Ut culpa rem a iste. Voluptas eos sequi vero laboriosam architecto rerum dolorem.','2003-08-07 02:52:56'),(57,42,9,'Distinctio soluta maiores iste voluptatum similique nemo laborum. A numquam aut odit dicta error aliquid sed. Voluptatum consectetur eos impedit quidem sunt ut.','2012-11-11 19:00:09'),(58,4,33,'Et asperiores quo mollitia consequatur nemo. Dolor nemo non harum ex incidunt ut. Quo quia corrupti quam aut sit.','1970-04-19 08:19:24'),(59,82,98,'Nemo sed voluptas officia in nihil illo ex quasi. Magnam quam ipsa voluptas quia. Est praesentium aliquid aut rem.','1978-12-31 08:48:11'),(60,4,68,'Perspiciatis harum nihil iste debitis ut aliquam. Repellat itaque facere dolores amet minima. Consequatur quia eius velit laudantium iste repudiandae.','2019-10-22 05:54:53'),(61,31,58,'Veritatis culpa vero nostrum magni. Totam earum maxime eligendi incidunt tenetur nulla.','1983-02-05 14:07:02'),(62,22,41,'Ratione id ab tenetur est. Ad id quibusdam nemo. Qui neque voluptas facilis ipsa.','2007-08-22 06:47:07'),(63,70,54,'Est quidem adipisci voluptas adipisci. Provident laudantium accusantium enim tempora eos molestiae quos.','1974-02-04 20:09:23'),(64,18,13,'A ut consequatur corporis ratione autem. Tempora autem dolore tempora iusto voluptatem. Officia dolorem non et nihil repellendus molestiae ad voluptatibus.','1972-02-03 09:41:56'),(65,97,73,'Numquam corrupti consequatur alias facere. Facilis sit nisi nesciunt ratione rerum nemo et magni. Doloribus minima aliquam asperiores voluptatem. Animi totam explicabo quae dolor minus.','2005-03-01 10:44:04'),(66,4,36,'Sunt cumque possimus fugiat laborum. Odio quo corporis quia. In consequuntur totam dignissimos. Perferendis alias quia voluptate voluptate sed minus.','2012-07-20 17:41:53'),(67,54,88,'Velit animi nostrum odit est doloribus facere. Et ipsa perferendis id illo nam porro molestias. Aspernatur aut libero labore magnam qui est dolorem velit.','1989-10-24 11:44:23'),(68,63,66,'Ea adipisci saepe voluptatibus dolores neque nihil. Est ut sunt et.','2018-05-20 07:38:26'),(69,55,48,'In unde neque voluptatem et in exercitationem laborum. Cum qui est molestiae facere modi. Eaque autem repellendus natus dolorem ut autem ut quam. Earum vitae minima consequatur fugit iusto est.','1975-10-12 16:53:13'),(70,9,15,'Sit consequatur facilis molestias laboriosam rem aut. A reprehenderit itaque consequatur voluptatibus laudantium molestias ducimus. Magnam incidunt eligendi minima id quam quasi.','1980-05-14 16:11:04'),(71,58,92,'Molestiae accusamus dolorem iusto maxime dolores quo esse. Voluptatibus atque aut et. Corrupti repellat sapiente quis tempora rerum asperiores consequatur nobis. Ullam odit culpa sunt aut.','2006-03-30 13:23:48'),(72,100,99,'Enim quisquam temporibus delectus id. Tempora quia laudantium possimus exercitationem. Omnis necessitatibus cupiditate earum dolorem nisi est.','2004-10-23 08:00:17'),(73,100,4,'Maxime animi est autem voluptatem. Quia rem magnam consequatur illo neque qui consequatur. Placeat labore at explicabo ullam minima et et.','1998-03-16 05:41:17'),(74,32,82,'Reprehenderit perspiciatis veritatis illum quaerat dolore. Suscipit exercitationem voluptatem aut quo beatae architecto. Aut commodi illo dolor.','2019-09-14 05:54:47'),(75,2,35,'Rem hic soluta autem quaerat. At et aut repudiandae ipsa animi vero qui. In qui nesciunt id pariatur ea. Odio est facilis aliquam omnis possimus autem.','1985-11-14 09:41:05'),(76,49,32,'Et aut earum at esse facilis autem at. Optio et ea incidunt velit ipsum temporibus. Reprehenderit ipsa iste modi consequatur veniam repellat quibusdam. Provident ipsam sint est odio qui nihil et.','1995-08-19 23:38:36'),(77,93,71,'Nemo accusamus impedit accusamus consequatur eaque itaque dolorem. Quo necessitatibus doloribus iste aut nesciunt quia distinctio. Cupiditate sequi debitis sapiente perspiciatis quos est cumque iste.','1996-12-29 06:42:07'),(78,72,63,'Ut doloremque eius at. Odio et eaque ut. Beatae est voluptas suscipit est necessitatibus.','1998-01-18 15:04:34'),(79,24,90,'Sequi ea commodi perspiciatis blanditiis. Consectetur natus adipisci deserunt perferendis. Illum similique ad magnam accusamus aut aut cum.','2018-10-12 13:11:35'),(80,75,21,'Rem voluptas ad sed numquam facere labore accusantium illo. Tempora voluptatem nihil rerum. Sit sit iure natus sit. Tempora non nulla nostrum nam voluptas.','1999-03-31 23:17:26'),(81,62,78,'Quidem eum quo odio dignissimos. Consectetur vel deserunt quos exercitationem et.\nPariatur at reprehenderit velit consequatur perferendis. Laboriosam qui illum velit consequatur est et.','2013-04-01 15:30:41'),(82,56,16,'Est impedit neque temporibus suscipit in et. Repellendus sed dolores ratione natus ut reprehenderit. Unde minus sunt cum.','1980-07-30 12:38:16'),(83,66,19,'Accusantium qui modi esse dicta quidem repellendus. Occaecati ut corrupti quae esse repudiandae. Sint velit autem modi vitae. Nulla sint beatae enim.','1970-03-21 11:52:12'),(84,81,20,'Dolor saepe voluptas quia vel qui quo inventore. Vel explicabo sunt quisquam iusto. Officia sed dolores sint rerum sed esse et. Ut doloremque sed explicabo dicta.','2010-01-10 01:35:48'),(85,67,90,'Non qui sint at non qui facilis explicabo. Odit maxime molestiae rem totam voluptas tempore nesciunt. Aut velit voluptate facilis rerum modi reiciendis. Rerum voluptates et vel praesentium.','1985-09-15 10:36:13'),(86,34,24,'Quibusdam sint est aliquam cumque consequuntur qui eveniet in. Beatae nihil deserunt delectus. Temporibus est ipsa autem in et iste.','2018-04-30 02:58:55'),(87,81,34,'Recusandae facilis veritatis libero. Illo enim voluptate debitis et. Consequuntur atque consequatur qui expedita minus ut. Corporis omnis hic assumenda nemo dignissimos.','1993-02-18 04:36:25'),(88,23,81,'Ut inventore qui impedit ratione voluptatum eveniet. Id dolorum vel eum sint enim voluptatibus architecto. Id voluptatem dolore blanditiis dolore.','1995-10-08 22:17:58'),(89,37,54,'Totam praesentium eligendi et fugit. Maxime vel neque facere hic. Necessitatibus dicta itaque sunt esse autem. Et eum rerum sint ut voluptate corrupti aliquid animi.','2016-11-27 00:42:49'),(90,62,38,'Ut sed consequatur ad est et. Sed vel vel inventore assumenda sint non. Omnis illo impedit esse. Iure nisi possimus asperiores dolore.','2020-05-15 10:19:55'),(91,89,11,'Harum ut et incidunt quo. Aut vitae labore quis omnis voluptatibus animi perferendis.','1977-12-15 09:27:10'),(92,69,81,'Magnam et consequuntur doloremque. Hic vel molestias asperiores ut. Harum nulla fugiat temporibus unde et. Facere ea consequatur dolores quas autem ipsam.','1992-12-29 00:58:04'),(93,81,41,'Omnis rerum vel id et nostrum reprehenderit in. Officiis iste sequi et quia.','2011-09-02 23:00:16'),(94,43,4,'Voluptatibus voluptas alias dolorem doloremque in. Molestiae ea atque aut placeat eos in tempore. Dolorem error nobis eaque recusandae sint aut corporis sed. Et dolorem dicta deleniti.','2017-12-09 10:10:31'),(95,30,17,'Molestiae perferendis pariatur vero quis ex eos recusandae. Molestiae eum aut ullam excepturi nihil et. Culpa a doloremque voluptate vero quod qui. Voluptates temporibus beatae magni sunt ad.','1985-02-28 01:00:35'),(96,25,92,'Et consequatur ab non voluptas maiores cum et libero. Asperiores voluptatem amet dolorem ratione sit. Consectetur ad amet in occaecati nisi illum. Velit quia et alias non.','1993-04-21 10:12:52'),(97,95,80,'Cum accusantium sunt molestiae ut in suscipit velit excepturi. Non a doloremque sit deleniti quas repellendus. Quis voluptatibus consequatur est pariatur.','1998-03-15 23:14:37'),(98,7,60,'Minus ipsa architecto ab quae. Quas nam ea vitae qui. Enim enim culpa provident quae dolores ut et et.','2019-08-12 13:23:57'),(99,99,88,'Est odit et itaque. Nam et qui quia error et. Consequatur ea exercitationem doloremque voluptas. Sapiente quo qui sunt eius sunt eos laudantium omnis.','1976-03-08 21:49:06'),(100,80,65,'Dolorem aliquam nulla maiores rerum neque vel. Quo perferendis sunt doloribus consectetur. Repudiandae possimus repellendus quod et.','2007-09-12 22:04:38');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `author` varchar(145) NOT NULL,
  `music_albom_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_music_music_albom1_idx` (`music_albom_id`),
  CONSTRAINT `fk_music_music_albom1` FOREIGN KEY (`music_albom_id`) REFERENCES `music_albom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,'laudantium','Selina Rice',5),(2,'est','Mohammad Veum',38),(3,'dolor','Dannie Dooley',30),(4,'est','Meggie Raynor',37),(5,'mollitia','Zack Bartell',24),(6,'odit','Dr. Furman Sawayn III',43),(7,'dignissimos','Alana Aufderhar',42),(8,'distinctio','Hazle Harvey',28),(9,'velit','Miss Sarina Nienow DVM',41),(10,'unde','Charles Runte Jr.',47),(11,'excepturi','Nicolette Kling',34),(12,'sed','Tod O\'Reilly',3),(13,'aspernatur','Cathy Hermiston',23),(14,'vitae','Kennith Weimann',39),(15,'autem','Miss Pink Stanton',17),(16,'repellat','Ms. Lauren Schmidt DVM',1),(17,'voluptatum','Jabari Greenfelder',7),(18,'aut','Prof. Beth Schmitt V',12),(19,'facilis','Lyla Davis',26),(20,'laboriosam','Silas Frami',11),(21,'sequi','Dr. Tyreek Bahringer MD',15),(22,'est','Leone Rutherford',13),(23,'adipisci','Elinore Waters',47),(24,'eius','Miss Pinkie Brakus I',45),(25,'quia','Miss Fatima Fay',39),(26,'quae','Rozella Konopelski',41),(27,'nesciunt','Estel Schulist',27),(28,'id','Liliana Schaden',23),(29,'ipsam','Dr. Samir Hackett',23),(30,'aut','Lelah Bradtke DDS',40),(31,'est','Vida Von',29),(32,'repellat','Dr. Margaretta Kling Sr.',27),(33,'voluptatum','Minnie Bins',28),(34,'molestiae','Lorena Cronin',9),(35,'neque','Mrs. Else Ritchie Sr.',14),(36,'vero','Prof. Roslyn Kohler',1),(37,'ab','Miss Alanna Blanda',1),(38,'iste','Kade Cole',6),(39,'omnis','Mrs. Lora Hyatt Jr.',29),(40,'ipsum','Raoul Bayer',41),(41,'ut','Chris Schiller',2),(42,'alias','Dr. Arvid Will V',12),(43,'quo','Concepcion Thompson',44),(44,'atque','Emmet Gerhold',25),(45,'facilis','Thalia White',1),(46,'aperiam','Dr. Brad Pagac Sr.',10),(47,'et','Dr. Brittany Oberbrunner',25),(48,'et','Mr. Olin Rogahn',8),(49,'natus','Mr. Geo Bosco Sr.',21),(50,'repudiandae','Miss Avis Robel',50),(51,'quae','Dr. Paolo Schneider IV',18),(52,'non','Rogers Nienow',35),(53,'voluptatem','Gregg Hilpert',13),(54,'facilis','Miss Nya Dooley MD',15),(55,'laboriosam','Jerod Lockman',30),(56,'et','Judy Feeney',2),(57,'eos','Hazle Funk I',6),(58,'tempora','Gwen Schimmel',6),(59,'accusantium','Ramiro Kihn',24),(60,'saepe','Kiana Reynolds',29),(61,'deleniti','Mr. Barrett O\'Conner Jr.',45),(62,'similique','Ressie Deckow',3),(63,'reiciendis','Nicholas Gaylord',6),(64,'officia','Prof. Adolphus Klein',22),(65,'distinctio','Corrine Johnston',12),(66,'dolores','Dorian Pouros',19),(67,'quisquam','Tyree Abernathy MD',23),(68,'possimus','Sophia Champlin DVM',12),(69,'nam','Miss Macy Kertzmann',25),(70,'vel','Elijah Cruickshank',1),(71,'nostrum','Darrel Johns II',3),(72,'perspiciatis','Donnell Shanahan',27),(73,'laboriosam','Iva Stoltenberg',13),(74,'ut','Mrs. Jody Walter',46),(75,'et','Leilani O\'Conner',1),(76,'voluptas','Helmer Hahn',14),(77,'exercitationem','Louvenia Bayer',6),(78,'nemo','Miss Lindsay Kirlin',25),(79,'nesciunt','Eleonore Christiansen DVM',22),(80,'ratione','Kayley Keebler',26),(81,'voluptatem','Ines Schmidt III',25),(82,'qui','Tressa Swaniawski',39),(83,'doloribus','Richard Halvorson',11),(84,'alias','Eunice Schoen',38),(85,'velit','Darryl Lang',4),(86,'deleniti','Gideon Morissette I',40),(87,'non','Maye Rath',39),(88,'aut','Malachi Klocko',9),(89,'dolores','Barbara Rempel',45),(90,'et','Ephraim Schroeder',13),(91,'quisquam','Jared Mayert',37),(92,'mollitia','Walker Schiller',40),(93,'qui','Marcus Littel',16),(94,'qui','Jacinto Larkin',42),(95,'dolore','Anissa O\'Connell DVM',11),(96,'id','Rylee Corkery III',27),(97,'voluptatem','Mr. Mikel Predovic',11),(98,'temporibus','Dr. Jeramy Anderson',34),(99,'rem','Mitchell Schuster',39),(100,'repellendus','Annetta O\'Reilly Sr.',36);
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_albom`
--

DROP TABLE IF EXISTS `music_albom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music_albom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `author` varchar(145) NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_music_albom_users1_idx` (`users_id`),
  CONSTRAINT `fk_music_albom_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_albom`
--

LOCK TABLES `music_albom` WRITE;
/*!40000 ALTER TABLE `music_albom` DISABLE KEYS */;
INSERT INTO `music_albom` VALUES (1,'fugit','Harry',52),(2,'magnam','Jammie',38),(3,'debitis','Keegan',64),(4,'ratione','Leo',32),(5,'facilis','Jan',56),(6,'qui','Lydia',79),(7,'ad','Louie',19),(8,'ipsum','Montana',90),(9,'tempora','Ismael',92),(10,'voluptatem','Norberto',50),(11,'quibusdam','Herta',33),(12,'natus','Harley',63),(13,'esse','Krystal',48),(14,'accusantium','Lane',54),(15,'temporibus','Christy',3),(16,'repellat','Brennon',88),(17,'non','Zackery',89),(18,'dolorum','Sterling',14),(19,'unde','Dorothy',44),(20,'dolore','Felix',28),(21,'animi','Raleigh',76),(22,'illo','Nettie',83),(23,'nobis','Joy',88),(24,'dolorum','Eunice',77),(25,'ullam','Orlo',17),(26,'et','Theresa',25),(27,'nihil','Vern',54),(28,'porro','Alverta',36),(29,'fuga','Mose',1),(30,'nihil','Kiara',67),(31,'ex','Edwina',80),(32,'quam','Nora',52),(33,'qui','Isidro',5),(34,'quidem','Mae',44),(35,'voluptas','Juana',83),(36,'at','Cecile',60),(37,'labore','Maria',22),(38,'doloremque','Samara',2),(39,'aut','Nathanial',50),(40,'harum','Neoma',14),(41,'nam','Gust',52),(42,'qui','Henry',82),(43,'molestiae','Emanuel',76),(44,'totam','Katlyn',99),(45,'non','Kristin',36),(46,'asperiores','Ervin',78),(47,'molestiae','Virgie',86),(48,'voluptas','Melany',25),(49,'ea','Nasir',92),(50,'molestiae','Maxwell',30);
/*!40000 ALTER TABLE `music_albom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `decs` text,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_albums_users1_idx` (`user_id`),
  CONSTRAINT `fk_photo_albums_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'velit','ut',71),(2,'enim','assumenda',60),(3,'labore','perspiciatis',26),(4,'perferendis','sint',86),(5,'tempora','aperiam',8),(6,'voluptatem','natus',81),(7,'mollitia','quos',30),(8,'itaque','eum',25),(9,'tempore','quibusdam',84),(10,'hic','iste',74),(11,'odio','voluptatem',38),(12,'adipisci','omnis',17),(13,'magnam','id',1),(14,'quidem','minus',49),(15,'est','vel',72),(16,'est','eos',24),(17,'suscipit','neque',26),(18,'iste','molestiae',23),(19,'consectetur','fuga',10),(20,'earum','ex',64),(21,'qui','officiis',42),(22,'quis','ipsam',47),(23,'similique','sunt',4),(24,'dolores','ut',62),(25,'atque','voluptas',6),(26,'sunt','repellendus',10),(27,'eum','molestiae',49),(28,'sequi','eos',59),(29,'vero','ex',97),(30,'nam','consequuntur',34),(31,'et','in',27),(32,'quo','nostrum',67),(33,'libero','autem',94),(34,'aperiam','qui',53),(35,'et','ipsum',52),(36,'odit','aspernatur',1),(37,'aut','voluptas',34),(38,'non','dicta',82),(39,'est','laboriosam',26),(40,'vel','hic',17),(41,'aut','labore',55),(42,'dolorem','amet',63),(43,'dolores','ullam',33),(44,'velit','pariatur',56),(45,'neque','eius',11),(46,'dolore','qui',5),(47,'explicabo','iure',79),(48,'molestiae','et',36),(49,'est','eum',27),(50,'eos','blanditiis',89),(51,'necessitatibus','et',100),(52,'qui','pariatur',68),(53,'itaque','ipsum',35),(54,'rerum','error',3),(55,'quam','voluptatem',29),(56,'non','eos',41),(57,'excepturi','nam',12),(58,'consequatur','voluptatem',78),(59,'quia','quaerat',100),(60,'alias','quibusdam',9),(61,'facilis','repellendus',12),(62,'velit','officia',26),(63,'dolorum','vel',75),(64,'quidem','quasi',5),(65,'tempore','temporibus',78),(66,'ipsum','illo',27),(67,'enim','sunt',6),(68,'cupiditate','qui',11),(69,'aut','aliquid',8),(70,'eaque','laboriosam',31),(71,'autem','expedita',28),(72,'totam','quisquam',63),(73,'ea','qui',93),(74,'sapiente','qui',60),(75,'at','quod',18),(76,'molestias','illum',3),(77,'enim','vitae',64),(78,'aut','vel',97),(79,'consequatur','accusantium',39),(80,'ut','veritatis',90),(81,'aliquam','nostrum',85),(82,'cumque','nemo',38),(83,'sunt','non',57),(84,'aliquid','aspernatur',20),(85,'inventore','sunt',41),(86,'voluptatem','animi',86),(87,'aut','omnis',60),(88,'at','quia',53),(89,'error','reiciendis',63),(90,'sit','temporibus',60),(91,'aspernatur','sunt',61),(92,'et','velit',74),(93,'temporibus','ab',86),(94,'cupiditate','accusamus',36),(95,'dicta','autem',78),(96,'est','numquam',63),(97,'voluptas','dolorum',63),(98,'assumenda','in',83),(99,'iusto','natus',74),(100,'occaecati','ad',71);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL,
  `album_id` int NOT NULL,
  `media_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photos_photo_albums1_idx` (`album_id`),
  KEY `fk_photos_media1_idx` (`media_id`),
  CONSTRAINT `fk_photos_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_photos_photo_albums1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `users_id` int NOT NULL,
  `gender` enum('m','f','x') NOT NULL,
  `birthday` date NOT NULL,
  `location` varchar(245) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`),
  KEY `fk_profiles_users_idx` (`users_id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1994-05-12','651 Jermey Land Apt. 785\nPort Montehaven, IN 83877-5007','1997-07-23 20:43:50'),(2,'f','2003-01-12','774 Satterfield Crossroad Apt. 643\nBernhardhaven, AR 04709','1980-10-23 23:07:26'),(4,'f','2020-03-08','18451 Heathcote Stream\nSauerbury, SD 04828','2015-12-11 22:37:18'),(5,'m','1986-08-24','648 Elyssa Plaza Suite 296\nLynchmouth, CT 12682-0330','1993-09-29 22:40:05'),(7,'x','1998-07-05','4437 Pacocha Locks\nPort Demetris, NY 61138','1992-07-13 02:29:32'),(12,'m','1974-04-09','130 Howe Trafficway Apt. 451\nSouth Alethahaven, NY 51383-5921','1982-11-30 07:48:01'),(13,'f','1985-06-07','79376 McKenzie Canyon Suite 134\nSouth Alejandra, ME 72774','1978-04-11 06:54:02'),(14,'m','1990-02-20','3907 Wunsch Shores\nKrisport, AL 47072-8339','2012-05-05 10:56:16'),(15,'m','1997-03-28','31688 Wilhelmine Meadows Apt. 818\nEast Chasefort, CO 71090-2765','2016-05-05 17:01:13'),(17,'f','2014-04-20','1630 Champlin Bridge Suite 899\nWest Bethelstad, UT 99215-4671','1979-03-13 01:57:04'),(18,'f','1993-08-14','451 Javonte Creek\nSouth Sashaview, MN 23821','1992-03-06 22:05:08'),(20,'m','1980-07-29','401 Zackery Stream Apt. 407\nGusikowskibury, LA 30822','1983-04-27 14:25:44'),(21,'m','2018-06-05','8794 Mitchel Ports\nMelyssaside, HI 89328','2001-02-05 22:19:32'),(24,'m','1970-04-09','708 Sawayn Grove Suite 446\nOceaneport, AR 78655-3199','2012-05-31 06:55:54'),(27,'m','1970-05-21','182 Hannah Gardens Apt. 076\nEthanport, MS 90247-8367','2018-05-28 15:39:13'),(32,'f','1993-11-03','19563 Bosco Fields Apt. 719\nWest Toni, MD 85868','1979-10-21 20:56:05'),(33,'x','2016-02-27','0674 Martin Trail\nJayceside, DC 96605-9622','2013-12-30 23:18:27'),(35,'m','1980-08-11','160 Corbin Forges\nAugustashire, WA 99663','1973-08-27 14:16:16'),(36,'m','1991-11-15','84640 Halvorson Square Suite 195\nDejonside, CO 76962','1985-01-19 15:53:17'),(37,'f','1980-05-19','4888 Ziemann Valley\nAustinville, CO 76289','1991-08-01 18:55:41'),(39,'x','2012-03-17','02333 Kole Corner Suite 983\nEast Carolinamouth, RI 29856-0587','1999-03-23 03:09:58'),(40,'f','1982-06-23','45015 Runolfsdottir Ville Suite 607\nNew Jimmy, VA 83302','2015-11-30 03:01:49'),(43,'m','1994-01-09','049 Farrell Parkways\nEast Rowena, IL 62230','1997-03-30 01:51:32'),(46,'f','1986-09-12','6309 Adams Passage Suite 564\nLeoniemouth, OR 78717','2003-11-26 13:42:04'),(47,'m','1990-12-02','320 Quinton Key Suite 769\nWest Nonatown, MT 26705','2012-03-06 01:51:00'),(48,'m','1978-02-10','9516 Rubie Pine Suite 570\nAdalinemouth, SD 23755','1977-07-25 12:42:38'),(49,'m','1971-02-02','4259 Olson Extensions Suite 527\nEast Pollyhaven, IA 76693-7833','1980-02-08 19:10:11'),(50,'f','1991-07-11','8400 Walker Courts Apt. 619\nEthanberg, FL 40536','2012-10-28 03:39:09'),(51,'f','1985-09-20','01083 Ayla Coves Suite 388\nSouth Amie, UT 36631','1977-11-06 04:59:41'),(54,'x','2002-12-04','74165 Javonte Union\nWest Colby, DE 58051-4933','1994-10-07 22:53:35'),(55,'m','1999-09-26','738 Triston Vista\nEast Winfieldshire, VA 10598-8412','1985-10-19 02:25:37'),(59,'x','1981-04-23','685 O\'Connell Mountain\nNew Jovanyfurt, AK 86954','2019-01-21 19:39:52'),(60,'x','1993-03-26','23138 Briana Wells\nLarsonton, MO 17200-7446','1973-02-10 02:27:42'),(61,'f','1991-08-29','3269 Murazik Station Apt. 808\nEast Taylor, GA 36242','1985-02-05 20:23:04'),(62,'m','1977-03-31','161 Darrell Park Apt. 639\nWest Elmirachester, NH 47048-0659','2012-04-03 21:02:37'),(63,'m','1971-05-23','2621 Willow Mount Suite 283\nWest Denis, NJ 57681-5275','2001-02-04 04:51:08'),(64,'f','1986-06-26','36700 Rau Walk\nEast Anahi, ND 37295','1977-03-15 07:19:55'),(66,'m','1972-07-13','00800 Thiel Locks\nNorth Hillardport, ID 66576-8315','2010-11-02 12:39:22'),(67,'m','2000-12-28','61012 Bogisich Drive\nSouth Edisonview, WV 11832-6628','1985-06-07 08:54:13'),(68,'f','1994-12-03','295 Lakin Stravenue Apt. 365\nSchmelertown, RI 81968-0285','1971-03-31 07:55:43'),(69,'f','1998-06-23','344 Kristofer Mission Apt. 569\nWizaville, NY 20326-2926','1971-02-27 09:45:33'),(70,'x','2004-04-01','7175 Pedro Fords\nPort Gaylordberg, PA 47022','1994-02-01 09:19:07'),(71,'x','1980-10-12','90664 Kolby Street\nBartellhaven, MI 69176-9377','1986-07-20 21:58:21'),(72,'f','1983-05-05','14416 Roxanne Haven\nLehnerhaven, AZ 89138-3718','2016-12-08 00:31:51'),(73,'f','1998-01-28','98072 Rebeka Brooks\nRicochester, MD 21351','2010-12-24 11:00:35'),(77,'m','1974-04-01','75540 Hane Street Suite 366\nReubenport, IL 85612','1990-12-12 04:13:50'),(78,'m','2018-01-07','22320 Preston Oval\nRaynorhaven, MO 82323','1995-07-10 01:24:34'),(79,'m','1979-01-03','76161 Yessenia Overpass Suite 018\nWilfredfort, CT 48282','1978-12-14 05:16:35'),(80,'m','2009-05-29','12324 Arnold Canyon\nKoreyfurt, IA 30031-2229','1994-12-15 07:39:30'),(81,'x','1988-06-19','81296 Hoeger Green\nPort Madisynside, DE 85676','1979-04-29 07:37:03'),(82,'m','2005-01-09','635 Modesto Via Apt. 561\nBroderickburgh, UT 40447-4100','2010-06-11 02:02:24'),(84,'m','2018-06-07','8250 Dayne Plains Suite 645\nEmilioside, LA 69903-1238','2020-06-28 12:54:06'),(88,'m','2015-03-06','30804 Vita Brooks\nJosiahton, NV 73421','2001-06-22 02:46:48'),(89,'x','1989-07-31','595 Collier Coves Suite 719\nTiannastad, CT 45450-5870','2009-01-17 17:50:08'),(91,'x','2006-04-08','0962 Kshlerin Trail\nPort Eloiseborough, MO 70885-0804','1994-10-02 22:28:03'),(92,'f','2005-08-17','64574 Scottie Pass\nWest Laurel, NY 40177-5847','2010-03-12 01:57:54'),(95,'x','2010-09-29','5496 Jackie Mills Apt. 228\nKautzerfurt, VT 65352-0397','2003-04-26 20:56:11'),(97,'m','1995-06-12','8439 Cronin Land Suite 610\nLake Alf, AL 53764-0063','1983-08-25 14:59:00'),(99,'x','2012-08-25','619 Lenny Land\nFunkton, MA 38695-0027','1975-07-21 07:58:06'),(100,'x','1997-02-05','793 Lavada Haven Suite 529\nPort Jonathonborough, AL 32733-1185','1970-12-23 07:08:30');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(245) NOT NULL COMMENT 'имя',
  `lastname` varchar(245) NOT NULL COMMENT 'фамилия',
  `email` varchar(245) NOT NULL,
  `phone` bigint NOT NULL COMMENT 'телефон',
  `password_hash` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `firstname_lastname_idx` (`lastname`,`firstname`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Vickie','Macejkovic','oswaldo.becker@example.org',89371988667,'eb25a42818e86b5c1cb504f1603232ae73075712'),(2,'Sincere','Emard','skiles.shakira@example.com',89646180359,'f3e1fe07cc8cbdb7c115bb85946b6732f422f147'),(3,'Aric','Upton','huel.cleo@example.net',89351712970,'027a91cbb2cf815445c77e7ec4e23e045bdf3978'),(4,'Kennedi','Simonis','csipes@example.net',89516768728,'510f04315807bb4fea1d803e920ebcef6f053249'),(5,'Carmela','Hayes','pwelch@example.com',89712265964,'2f566b0a660ef423949c74b057f8a8c961a13be9'),(6,'Ona','Schulist','schinner.mayra@example.org',89927348743,'1f597fcb9ec2ade7c1b67e2950550b20ada5605d'),(7,'Makayla','Ebert','nbednar@example.net',89024451511,'44fcb49f886dfd42c81ca13dd7553ade9f6d3877'),(8,'Nettie','Ratke','johathan.kunze@example.com',89599083324,'e5f1c8a744e5ebe8debcdd7555a2561c8397e829'),(9,'Dina','Rowe','wmarvin@example.org',89109655819,'bdd719efdc594a6d98e12ae25ffed0835a0a8e54'),(10,'Agustin','Pfeffer','ydach@example.com',89210289535,'c89cf9c18c6d96aef4732a18d188a563cbfaf8e7'),(11,'Carley','Torphy','svandervort@example.com',89920537386,'60a5f4fce52bfb09c27afe1665db6997c014126e'),(12,'Alford','Schmitt','berge.rocky@example.com',89605107024,'0f05156adcc55aa7c0cdfd19ab29921aed61e0c4'),(13,'Tara','Morar','lkiehn@example.com',89833523755,'5227547117d135a337384b597d02232dee661d3b'),(14,'Jerald','Ankunding','marisa.dickinson@example.net',89030835338,'5b6474b95b99beda4d8ebae1f3edd060d6645519'),(15,'Onie','Cartwright','jackeline.daniel@example.com',89490671508,'9ad7e73019fe3adc5890944305b2bf203cc1bbb5'),(16,'Berniece','Konopelski','adrienne.krajcik@example.com',89698408898,'76ac0db21f89869814d54d17e37f56b6b3aa6cc7'),(17,'Paris','Volkman','bkoss@example.org',89669288933,'c3b544fdd2b3e17b6567df0f3585295dacd64c39'),(18,'Jeffrey','Mayert','vivianne74@example.org',89107646971,'5e03146915b1ec86c94a74ae683f27d972b11262'),(19,'Rahul','Renner','eschuster@example.com',89495653713,'979cb38c95a401e2e9ef949a3e8fb5b2dc5b3846'),(20,'Alyson','Deckow','hortense.harber@example.net',89085790160,'df8f6c975f645445df468a2994850940e91f0755'),(21,'Zechariah','Wuckert','howell.zachery@example.com',89257017714,'9bda10626f2c91d6fdce60cab5176699f2c352f7'),(22,'Miguel','Barton','ahills@example.org',89676159977,'1d98c0f1858d2dfdfc7fa25299b9d3bf4ef2c42d'),(23,'Juliana','Marquardt','jazmin80@example.com',89121305657,'8979860c5d5f2dd0f907567e9617875d49c419e1'),(24,'Cecile','Hauck','orin19@example.net',89349086550,'7d51fa280a4bc127b5cfc91a6cf44693434e9081'),(25,'Luciano','Kulas','felipe88@example.net',89059762269,'63b2bbe00c0446bccf40079ea1b7cc68f9cac48f'),(26,'Manuel','Torphy','daren02@example.com',89777921225,'09a0faceb71d8a335d2eabdbeed9a0779bac784b'),(27,'Isidro','Huel','chloe.howe@example.org',89871307361,'2e0bd87f0f0e6bb1878563d579de2e23ac36f73a'),(28,'Arely','Wilkinson','joelle.kuphal@example.net',89591574964,'2b0c8c22ee7554d76bfdb14ec516468c2e1cd9ae'),(29,'Carey','Maggio','bechtelar.jocelyn@example.org',89005775854,'0f3fcb2a7adf549fd2559de191b8d83d81d15b00'),(30,'Marquise','Jakubowski','murl.gleichner@example.org',89801272264,'a0ef970dfc32cc4830b5576ddb7b49f0dd3209d6'),(31,'Jayce','Eichmann','toni87@example.net',89605721937,'ed3bcec9eb0a8433a89727b3c5b02efde1652a54'),(32,'Elinor','Davis','margret.kutch@example.org',89767459763,'908fd29f38df4c390dc685d7f6598763ae549a06'),(33,'Lavon','Prohaska','braeden.white@example.org',89590712355,'837ffe0a005a0cf07f32a246334e1f5c2031aee4'),(34,'Tina','Sipes','lessie09@example.com',89315931574,'e4d537a1c3e2878be96ba3db4bb42e672de795ac'),(35,'Marilou','Davis','selena.wehner@example.com',89616474179,'2c46eeaddb1c3494e284997f6be1d4ea3d795853'),(36,'Brock','Leannon','patsy.kreiger@example.org',89343757866,'4af933bae512dfab648ffa79c610c368bf455ba8'),(37,'Gwendolyn','Fisher','daniela.sporer@example.net',89409060131,'727152bd6c1ec07e52fe434c423850c36d98e3f2'),(38,'Christiana','Fisher','idella.reynolds@example.com',89662564110,'24c74d1ed2b8f1f8508676526d760f57820946d2'),(39,'Cora','Kuvalis','major39@example.net',89893143643,'a5e13791012b03bf627e99280b661b02302a26cf'),(40,'Kelton','Baumbach','von.lavina@example.net',89655705565,'cd70777ce3c8f345c818d9ef858f24d82a16d747'),(41,'Rosamond','Baumbach','jolie.krajcik@example.org',89140973757,'29b6d21bb62c82d604a5e840cce20c5f40e788be'),(42,'Eusebio','Fritsch','bbogisich@example.net',89906954225,'bade8dd3789808e0b1699f4c38a008b40f018a59'),(43,'Kathryne','Walsh','olga42@example.net',89672990334,'3f0929a60c13a83b292adf948659aa98392d3e1c'),(44,'Willa','Hammes','murphy.darwin@example.com',89411372894,'1df5b3c7303a0e0ff2486c9d5e6be30e4722093c'),(45,'Rhiannon','Schaden','maeve98@example.org',89361421019,'b0e9fc2605a7d6bdecec4fd6363aa65e2dfe023d'),(46,'Royal','Shanahan','mitchell.anabelle@example.net',89173152986,'6c0916f96cab35958fb9d2d9fc5e1ebef5eaf465'),(47,'Gerald','Miller','eryn.dickinson@example.org',89083797453,'56d4e0121aeb0db95866727eab897915fbd6201e'),(48,'Stanton','Dickens','blaise24@example.net',89832888659,'d0fc73cb32dffb50d357ef3bed6ee298a9a9d8d3'),(49,'Orlo','Schuster','fisher.lafayette@example.com',89718371162,'f959e526463851dfae6976e12e160647a34894f5'),(50,'Clay','Rohan','durgan.damian@example.com',89375693450,'ce812abff8e7a36cfea9e82c067154efb239520a'),(51,'Hudson','Cole','haylee16@example.org',89497153224,'24c076116fb8c2eb20b16a1650dd0cc53c188b50'),(52,'Jalyn','McDermott','stanley.veum@example.net',89465395469,'2cd05c6544f8653f29b673a865c8496cffa5fa54'),(53,'Renee','Kuphal','brandyn.littel@example.net',89994164892,'6830706852733b078b83dd3e76664e815e00ec21'),(54,'Sophie','Jenkins','lexie.wolf@example.com',89268040786,'f57c3d6927cc507c36fa995d52e1d1fa12a1c4f4'),(55,'Fausto','Lowe','nigel75@example.net',89519608716,'02407c846a2230080b0e1156c2a277a0c3ed60a3'),(56,'Madonna','Parisian','rgrady@example.net',89676806764,'5b6511353c576c46824f233eb26353506f4e4c41'),(57,'Dean','Reynolds','cathy.lubowitz@example.com',89641271604,'bb06e071158249ef25b42d170942040d9c924819'),(58,'Rodrick','Becker','schmidt.estell@example.com',89706357660,'4d665d62b1d4435f333d8f65cb767b1802c90fc3'),(59,'Maxie','Lockman','jkoelpin@example.com',89662193119,'48fa5b012eb0c77a1209b6aef1578b546ec52ac3'),(60,'Angie','Volkman','rcrooks@example.com',89793805676,'0c3dbe0b16900e020280ca7442c54c482ef1e37e'),(61,'Keshaun','Block','golda63@example.com',89884067906,'39a953a3020b8c33718485b7bd5df58142463694'),(62,'Lindsey','Ruecker','concepcion37@example.net',89623846240,'7be8b40512bbf70a546a25a6aad689fac880b617'),(63,'Destinee','Bergnaum','cornell83@example.com',89724263026,'e307a7784d019a34f565602c3c9661fcfbce7409'),(64,'Davonte','Feest','tomas48@example.org',89497106754,'f0d2aa9c8e6d2a9f055b7d2a86636e0d5ddffa4a'),(65,'Kiana','Kovacek','ottilie.raynor@example.net',89919912159,'8f939d26ae48a30dd38b0a50b31c466eddc80331'),(66,'Jeremie','Crooks','trisha08@example.org',89519785073,'b4e7571146ed10a51ca926e66f486c091dcc35f9'),(67,'Myrtie','Rath','gleichner.trenton@example.org',89779530257,'5714d98db1ddcb385e5a90391b36d1b3ced49461'),(68,'Elyse','Kulas','walker.wilfred@example.com',89720609623,'96d3ff10749659401d2ae0966489eada97eb96a6'),(69,'Tiara','Wintheiser','gladys28@example.net',89269302641,'b859f1b5d3d7b1a51b80fe68e387afca86ae6a0b'),(70,'Rocky','McCullough','qpredovic@example.org',89008592498,'95785c3508f3f0d393a6b3bb8d3e0b5777156944'),(71,'Amira','Hilpert','felix.donnelly@example.com',89785995076,'28ccc093bc950f01260ecde223e6648f493ac85f'),(72,'Bella','Grady','arturo.ward@example.org',89231839605,'f90f870d7dd7d661c37e925a03c59b5fdba351c5'),(73,'Donato','Kemmer','shields.miracle@example.com',89997476788,'e9d1eccc262bba7f93f275bd024b0371e74b4692'),(74,'Sunny','Marquardt','felix.dietrich@example.net',89577565582,'1953ddff6af8ff5947089f88ed64a03e9499c670'),(75,'Israel','Nader','lowe.garfield@example.org',89073205903,'0131ff7b7683cfb4defd217071edcdd0165949da'),(76,'Philip','Donnelly','omarvin@example.org',89126608559,'51b4acb08f7fabba1ee6e297a2ab1071f3e61e2f'),(77,'Shanie','Mann','yhagenes@example.com',89053004301,'d480a33b045430ba07f2665e834882572a0450e2'),(78,'Pansy','Casper','fahey.nasir@example.net',89811100119,'43a68793f2a874c8a0f59d74e346127127db3b2a'),(79,'Jaron','Corwin','xmayer@example.net',89860977876,'0adf5f68ff81c1de4ac612c407d41e9355642e3e'),(80,'Ted','Sipes','jamal.mueller@example.org',89359265216,'c501b72d27e1f65af93a2df198333f0b8df5b56a'),(81,'Demarco','Hegmann','ron50@example.com',89464865019,'bb64c21f939d1618a67981255efd8d80dc185475'),(82,'Nina','Ondricka','dedric38@example.org',89172824912,'9de6280f5cfa2886869914b3efb8bf15daaa7ee2'),(83,'Daryl','Bauch','cruickshank.cheyanne@example.org',89477324074,'68e2a9c5ddcbff127af213fb11046db4eb9a2efb'),(84,'Madison','Schiller','vdickens@example.org',89850781740,'e33361b39c99c9dd9026c6429150b0fb6532c74a'),(85,'Delphine','Cremin','reynolds.reinhold@example.com',89159118914,'fd61305bbe5890314bc526c756e958e909b98002'),(86,'Delmer','Waelchi','ondricka.frieda@example.org',89139052154,'63d3adf5d361d272d4b65e9a850869eeb68072bb'),(87,'Harold','Lang','gislason.dannie@example.com',89325650280,'66f92919097103ed73a51b73f599dd4d5c62e59c'),(88,'Daisha','Murray','ernser.cleve@example.net',89011253459,'a5b9777bdff11a40397c199ed5ba325235ee4490'),(89,'Chauncey','Moen','gwest@example.com',89703354761,'c9e1aee5cca77d91eb6790f4983a24cc80d2e545'),(90,'Dion','Nader','phagenes@example.com',89294980842,'b8122b72cc761c61ace184f6d7609cb2650f639c'),(91,'Tristin','Mante','howell99@example.com',89027370450,'c122fb186423c9a1ce23ef9dc317e5f1c0596937'),(92,'Titus','Cole','ilesch@example.com',89779528159,'aa1be38ea65492c906301a33ebaeecefe136ce20'),(93,'Keith','Collier','garrett.gusikowski@example.net',89425408857,'552e18e500559f1e6d9d4563680ac7a5f7328c10'),(94,'Lazaro','Rath','shanelle.nolan@example.com',89744811849,'774aeab854651a5a44f7e56fe2b44a949593fdb7'),(95,'Kacey','McLaughlin','ischmitt@example.org',89186469292,'e11543ad4c9de3c648423cef103323635f994040'),(96,'Brown','Schmidt','ptremblay@example.com',89055863119,'00fd236ee82694753470041b32bfa7a3a728ae6e'),(97,'Oscar','Jacobson','kirlin.evie@example.net',89383706745,'3fc189710e789c883fc1271071a23ed518a134a4'),(98,'Hyman','Feeney','brown.danielle@example.com',89838075085,'6949df3ce70fdaa3cd7ee72598ea682ed06d8ab3'),(99,'Odell','Turner','nienow.yazmin@example.net',89832352959,'d6808f801719d5cd187ab8e3c9b7a788e692788b'),(100,'Stephany','Bayer','acollier@example.org',89747182836,'3ba32956c4bfe19ceb5dbd2c9dd7cc21f5919c41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communities` (
  `community_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `fk_users_communities_users1_idx` (`user_id`),
  KEY `fk_users_communities_communities1_idx` (`community_id`),
  CONSTRAINT `fk_users_communities_communities1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_users_communities_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (21,2),(81,2),(100,3),(47,4),(58,4),(80,4),(60,5),(1,6),(38,8),(77,9),(94,11),(99,13),(36,18),(53,18),(1,19),(41,21),(49,21),(26,23),(61,23),(7,24),(60,24),(70,24),(97,25),(42,26),(98,26),(49,27),(94,27),(98,28),(85,29),(94,30),(26,31),(28,33),(70,33),(54,34),(92,34),(40,35),(100,35),(60,36),(79,37),(67,40),(1,42),(98,43),(31,46),(52,46),(64,46),(69,47),(57,49),(58,49),(90,49),(1,50),(52,51),(67,51),(6,52),(100,52),(41,53),(49,53),(76,53),(12,58),(25,59),(60,60),(98,60),(24,63),(100,64),(38,67),(32,68),(20,69),(76,69),(19,70),(20,71),(27,71),(52,71),(54,73),(41,75),(59,76),(19,77),(77,77),(26,78),(82,78),(86,78),(22,80),(76,80),(40,81),(9,83),(40,88),(57,88),(99,88),(48,89),(4,90),(5,90),(28,91),(98,91),(53,95),(80,96),(7,97),(59,97),(80,97),(82,97),(99,97),(97,98),(6,99);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-05  0:53:44
