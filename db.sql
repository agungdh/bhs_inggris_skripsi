-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: 127.0.0.1	Database: english
-- ------------------------------------------------------
-- Server version 	5.5.5-10.3.13-MariaDB-2
-- Date: Mon, 22 Jul 2019 23:22:39 +0700

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
-- Table structure for table `materi`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materi` varchar(191) NOT NULL,
  `deskripsi` varchar(191) NOT NULL,
  `unit` varchar(191) NOT NULL,
  `jumlah_narasi` int(11) NOT NULL,
  `durasi` int(11) NOT NULL COMMENT 'dalam menit',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi`
--

LOCK TABLES `materi` WRITE;
/*!40000 ALTER TABLE `materi` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `materi` VALUES (11,'Intro','This is intro','1',5,90);
/*!40000 ALTER TABLE `materi` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `materi` with 1 row(s)
--

--
-- Table structure for table `cerita`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cerita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materi` int(11) NOT NULL,
  `isi_cerita` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materi` (`id_materi`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cerita`
--

LOCK TABLES `cerita` WRITE;
/*!40000 ALTER TABLE `cerita` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `cerita` VALUES (111,11,'ini adalah narasi');
/*!40000 ALTER TABLE `cerita` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `cerita` with 1 row(s)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `user` VALUES (1,'admin','$2y$12$83K/WnkWWoEbcd5KEvvouOMHQ.hk6LjyYzDP1V97FZQ/LbcVfdd/u','a','Administrator'),(3,'siswa1','$2y$10$v2CeJIK0c8rxckC/dVyBSOhcW2aM6z8lgCpnb1oFc1KBa2g/8.dnO','s','Siswa 1'),(4,'siswa2','$2y$10$VBLNvf9fyce3AVLzeD5xpOJ/62tnu56ieHNgWOa6be7l38eeSEkrW','s','Siswa 2'),(5,'guru','$2y$10$UIHxN5Zo2lMkqKBwQlT/wuP2fKHoYmwCKRp9grk9ocOHlkGhPbLtq','a','Guru'),(6,'12345','$2y$10$BeXuNbBMWgxsHBFcr39uFO2K/SkUlrCk/QRFPK.RtDd5vspXrPFEe','s','budiman');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `user` with 5 row(s)
--

--
-- Table structure for table `soal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cerita` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `jawaban_a` varchar(191) NOT NULL,
  `jawaban_b` varchar(191) NOT NULL,
  `jawaban_c` varchar(191) NOT NULL,
  `jawaban_d` varchar(191) NOT NULL,
  `jawaban_e` varchar(191) NOT NULL,
  `kunci` enum('a','b','c','d','e') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cerita` (`id_cerita`),
  CONSTRAINT `soal_ibfk_2` FOREIGN KEY (`id_cerita`) REFERENCES `cerita` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soal`
--

LOCK TABLES `soal` WRITE;
/*!40000 ALTER TABLE `soal` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `soal` VALUES (117,111,'a','1','2','3','4','5','a'),(118,111,'b','1','2','3','4','5','b'),(119,111,'c','1','2','3','4','5','c'),(120,111,'d','1','2','3','4','5','d'),(121,111,'e','1','2','3','4','5','e');
/*!40000 ALTER TABLE `soal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `soal` with 5 row(s)
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `files` VALUES (10,11,'Screenshot from 2019-07-22 22-40-38.png.pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `files` with 1 row(s)
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian`
--

LOCK TABLES `ujian` WRITE;
/*!40000 ALTER TABLE `ujian` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `ujian` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ujian` with 0 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Mon, 22 Jul 2019 23:22:39 +0700
