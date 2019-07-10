-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: 127.0.0.1	Database: bhs_inggris_skripsi
-- ------------------------------------------------------
-- Server version 	5.5.5-10.3.16-MariaDB
-- Date: Wed, 10 Jul 2019 11:44:02 +0700

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
-- Table structure for table `akhir`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akhir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `waktu` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `akhir_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akhir`
--

LOCK TABLES `akhir` WRITE;
/*!40000 ALTER TABLE `akhir` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `akhir` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `akhir` with 0 row(s)
--

--
-- Table structure for table `files`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materi` int(11) NOT NULL,
  `filename` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_materi` (`id_materi`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `files` VALUES (4,5,'Motherboard - GIGABYTE Indonesia.pdf'),(5,6,'Motherboard - GIGABYTE Indonesia.pdf'),(6,7,'Motherboard - GIGABYTE Indonesia.pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `files` with 3 row(s)
--

--
-- Table structure for table `materi`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materi` varchar(191) NOT NULL,
  `deskripsi` varchar(191) NOT NULL,
  `unit` varchar(191) NOT NULL,
  `jumlah_pertanyaan_ujian` int(11) NOT NULL,
  `jumlah_pertanyaan_mid` int(11) NOT NULL,
  `jumlah_pertanyaan_akhir` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi`
--

LOCK TABLES `materi` WRITE;
/*!40000 ALTER TABLE `materi` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `materi` VALUES (5,'Ini Unit 1','Ini Deskripsi Unit 1','1',20,5,10),(6,'Unit 2','Ini Unit 2','2',15,10,15),(7,'Unit 3','ini adalah unit 3','3',15,0,12);
/*!40000 ALTER TABLE `materi` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `materi` with 3 row(s)
--

--
-- Table structure for table `mid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `waktu` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `mid_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mid`
--

LOCK TABLES `mid` WRITE;
/*!40000 ALTER TABLE `mid` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mid` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `mid` with 0 row(s)
--

--
-- Table structure for table `soal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materi` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `jawaban_a` varchar(191) NOT NULL,
  `jawaban_b` varchar(191) NOT NULL,
  `jawaban_c` varchar(191) NOT NULL,
  `jawaban_d` varchar(191) NOT NULL,
  `jawaban_e` varchar(191) NOT NULL,
  `kunci` enum('a','b','c','d','e') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materi` (`id_materi`),
  CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soal`
--

LOCK TABLES `soal` WRITE;
/*!40000 ALTER TABLE `soal` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `soal` VALUES (17,5,'a','b','c','d','e','f','c'),(18,5,'a','b','c','d','e','f','c'),(19,5,'1','2','3','4','5','6','b'),(20,5,'a','b','c','d','e','f','c'),(21,5,'1','2','3','4','5','6','b'),(22,5,'a','b','c','d','e','f','c'),(23,5,'1','2','3','4','5','6','b'),(24,5,'a','b','c','d','e','f','c'),(25,5,'1','2','3','4','5','6','b'),(26,5,'a','b','c','d','e','f','c'),(27,5,'1','2','3','4','5','6','b'),(28,5,'a','b','c','d','e','f','c'),(29,5,'1','2','3','4','5','6','b'),(30,5,'a','b','c','d','e','f','c'),(31,5,'1','2','3','4','5','6','b'),(32,5,'a','b','c','d','e','f','c'),(33,5,'1','2','3','4','5','6','b'),(34,5,'a','b','c','d','e','f','c'),(35,5,'1','2','3','4','5','6','b'),(36,5,'a','b','c','d','e','f','c'),(37,5,'1','2','3','4','5','6','b'),(38,5,'a','b','c','d','e','f','c'),(39,5,'1','2','3','4','5','6','b'),(40,5,'a','b','c','d','e','f','c'),(41,5,'1','2','3','4','5','6','b'),(42,5,'a','b','c','d','e','f','c'),(43,5,'1','2','3','4','5','6','b'),(44,5,'a','b','c','d','e','f','c'),(45,5,'1','2','3','4','5','6','b'),(46,5,'a','b','c','d','e','f','c'),(47,5,'1','2','3','4','5','6','b'),(48,5,'a','b','c','d','e','f','c'),(49,5,'1','2','3','4','5','6','b'),(50,5,'a','b','c','d','e','f','c'),(51,5,'1','2','3','4','5','6','b'),(52,5,'a','b','c','d','e','f','c'),(53,5,'1','2','3','4','5','6','b'),(54,5,'a','b','c','d','e','f','c'),(55,5,'1','2','3','4','5','6','b'),(56,5,'a','b','c','d','e','f','c'),(57,5,'1','2','3','4','5','6','b'),(58,5,'a','b','c','d','e','f','c'),(59,5,'1','2','3','4','5','6','b'),(60,5,'a','b','c','d','e','f','c'),(61,5,'1','2','3','4','5','6','b'),(62,5,'a','b','c','d','e','f','c'),(63,5,'1','2','3','4','5','6','b'),(64,6,'test aaa','12','4','14124','124','241','d'),(65,6,'test aaa','12','4','14124','124','241','d'),(66,6,'test aaa','12','4','14124','124','241','d'),(67,6,'test aaa','12','4','14124','124','241','d'),(68,6,'test aaa','12','4','14124','124','241','d'),(69,6,'test aaa','12','4','14124','124','241','d'),(70,6,'test aaa','12','4','14124','124','241','d'),(71,6,'test aaa','12','4','14124','124','241','d'),(72,6,'test aaa','12','4','14124','124','241','d'),(73,6,'test aaa','12','4','14124','124','241','d'),(74,6,'test aaa','12','4','14124','124','241','d'),(75,6,'test aaa','12','4','14124','124','241','d'),(76,6,'test aaa','12','4','14124','124','241','d'),(77,6,'test aaa','12','4','14124','124','241','d'),(78,6,'test aaa','12','4','14124','124','241','d'),(79,6,'test aaa','12','4','14124','124','241','d'),(80,6,'test aaa','12','4','14124','124','241','d'),(81,6,'test aaa','12','4','14124','124','241','d'),(82,6,'test aaa','12','4','14124','124','241','d'),(83,6,'test aaa','12','4','14124','124','241','d'),(84,6,'test aaa','12','4','14124','124','241','d'),(85,6,'test aaa','12','4','14124','124','241','d'),(86,6,'test aaa','12','4','14124','124','241','d'),(87,6,'test aaa','12','4','14124','124','241','d'),(88,6,'test aaa','12','4','14124','124','241','d'),(89,6,'test aaa','12','4','14124','124','241','d'),(90,6,'test aaa','12','4','14124','124','241','d'),(91,6,'test aaa','12','4','14124','124','241','d'),(92,6,'test aaa','12','4','14124','124','241','d'),(93,6,'test aaa','12','4','14124','124','241','d'),(94,6,'test aaa','12','4','14124','124','241','d'),(95,6,'test aaa','12','4','14124','124','241','d'),(96,6,'test aaa','12','4','14124','124','241','d'),(97,6,'test aaa','12','4','14124','124','241','d'),(98,6,'test aaa','12','4','14124','124','241','d'),(99,6,'test aaa','12','4','14124','124','241','d'),(100,6,'test aaa','12','4','14124','124','241','d'),(101,6,'test aaa','12','4','14124','124','241','d'),(102,6,'test aaa','12','4','14124','124','241','d'),(103,6,'test aaa','12','4','14124','124','241','d'),(104,6,'test aaa','12','4','14124','124','241','d'),(105,6,'test aaa','12','4','14124','124','241','d');
/*!40000 ALTER TABLE `soal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `soal` with 89 row(s)
--

--
-- Table structure for table `ujian`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `waktu` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_materi` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materi` (`id_materi`),
  KEY `ujian_ibfk_2` (`id_user`),
  CONSTRAINT `ujian_ibfk_1` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`),
  CONSTRAINT `ujian_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian`
--

LOCK TABLES `ujian` WRITE;
/*!40000 ALTER TABLE `ujian` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ujian` VALUES (14,'2019-07-10 11:22:27',3,5,35);
/*!40000 ALTER TABLE `ujian` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ujian` with 1 row(s)
--

--
-- Table structure for table `user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `level` enum('a','s') NOT NULL,
  `nama` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `user` VALUES (1,'admin','$2y$12$83K/WnkWWoEbcd5KEvvouOMHQ.hk6LjyYzDP1V97FZQ/LbcVfdd/u','a','Administrator'),(3,'siswa1','$2y$10$v2CeJIK0c8rxckC/dVyBSOhcW2aM6z8lgCpnb1oFc1KBa2g/8.dnO','s','Siswa 1'),(4,'siswa2','$2y$10$VBLNvf9fyce3AVLzeD5xpOJ/62tnu56ieHNgWOa6be7l38eeSEkrW','s','Siswa 2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `user` with 3 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Wed, 10 Jul 2019 11:44:02 +0700
