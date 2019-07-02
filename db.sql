-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: 127.0.0.1	Database: bhs_inggris_
-- ------------------------------------------------------
-- Server version 	5.5.5-10.1.38-MariaDB
-- Date: Tue, 02 Jul 2019 10:41:05 +0700

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `files` VALUES (2,3,'absensiMei 2019.pdf'),(3,4,'Absensi Pegawai BAPPEDA Pringsewu Februari 2002.pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `files` with 2 row(s)
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi`
--

LOCK TABLES `materi` WRITE;
/*!40000 ALTER TABLE `materi` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `materi` VALUES (3,'Unit Satu','Ini Unit Satu','1'),(4,'Unit Dua','Ini Unit Dua','2');
/*!40000 ALTER TABLE `materi` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `materi` with 2 row(s)
--

--
-- Table structure for table `soal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materi` int(11) NOT NULL,
  `jawaban_a` varchar(191) NOT NULL,
  `jawaban_b` varchar(191) NOT NULL,
  `jawaban_c` varchar(191) NOT NULL,
  `jawaban_d` varchar(191) NOT NULL,
  `jawaban_e` varchar(191) NOT NULL,
  `kunci` enum('a','b','c','d','e') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materi` (`id_materi`),
  CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soal`
--

LOCK TABLES `soal` WRITE;
/*!40000 ALTER TABLE `soal` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `soal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `soal` with 0 row(s)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `user` with 0 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Tue, 02 Jul 2019 10:41:05 +0700
