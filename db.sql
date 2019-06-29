-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: 127.0.0.1	Database: pemakaianmobil
-- ------------------------------------------------------
-- Server version 	5.5.5-10.1.38-MariaDB
-- Date: Mon, 22 Apr 2019 06:29:40 +0700

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
-- Table structure for table `bidang_sektor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bidang_sektor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidang_sektor` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `bidang_sektor_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `bidang_sektor_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidang_sektor`
--

LOCK TABLES `bidang_sektor` WRITE;
/*!40000 ALTER TABLE `bidang_sektor` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `bidang_sektor` VALUES (2,'BS 12','2019-04-19 01:53:08',1,'2019-04-19 01:53:16',1);
/*!40000 ALTER TABLE `bidang_sektor` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `bidang_sektor` with 1 row(s)
--

--
-- Table structure for table `gaji`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gaji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `gaji` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`),
  CONSTRAINT `gaji_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `gaji_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaji`
--

LOCK TABLES `gaji` WRITE;
/*!40000 ALTER TABLE `gaji` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `gaji` VALUES (3,4,3,'2001',2000000,'2019-04-22 00:56:54',1,'2019-04-22 00:58:20',1),(4,4,3,'2000',200000,'2019-04-22 00:57:33',1,'2019-04-22 00:57:33',1);
/*!40000 ALTER TABLE `gaji` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `gaji` with 2 row(s)
--

--
-- Table structure for table `kendaraan`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kendaraan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plat_nomor` varchar(191) NOT NULL,
  `deskripsi` text,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plat_nomor` (`plat_nomor`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `kendaraan_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kendaraan`
--

LOCK TABLES `kendaraan` WRITE;
/*!40000 ALTER TABLE `kendaraan` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `kendaraan` VALUES (2,'BE 1337 EZ','Toyota Land Cruiser VZR 2019','2019-04-19 01:49:59',1,'2019-04-19 01:50:22',1);
/*!40000 ALTER TABLE `kendaraan` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `kendaraan` with 1 row(s)
--

--
-- Table structure for table `pegawai`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bidang_sektor` int(11) DEFAULT NULL,
  `nama` varchar(191) NOT NULL,
  `npp` varchar(191) NOT NULL,
  `tipe` enum('pw','pj','pg','fu') NOT NULL COMMENT '''pw'' => ''pegawai'', ''pj'' => ''petugas jaga (satpam)'', ''pg'' => ''pengemudi'', ''fu'' => ''fungsi umum''',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `npp` (`npp`),
  KEY `id_bidang_sektor` (`id_bidang_sektor`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_bidang_sektor`) REFERENCES `bidang_sektor` (`id`),
  CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `pegawai_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `pegawai` VALUES (2,NULL,'Fungsi Umum 1','FU0001','fu','2019-04-19 01:53:52',1,'2019-04-19 01:54:05',1),(3,NULL,'Petugas Jaga 1','PJ0001','pj','2019-04-19 01:56:13',1,'2019-04-19 01:56:21',1),(4,NULL,'Supir 1','S0001','pg','2019-04-19 01:56:43',1,'2019-04-19 01:56:52',1),(5,2,'Pegawai 1','P0001','pw','2019-04-19 01:57:08',1,'2019-04-19 01:57:21',1);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `pegawai` with 4 row(s)
--

--
-- Table structure for table `pemakaian`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemakaian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) NOT NULL,
  `keperluan` enum('d','p') NOT NULL,
  `keterangan` text,
  `tujuan` enum('d','l') NOT NULL,
  `luar_kota` text,
  `rencana_mulai` datetime NOT NULL,
  `rencana_kembali` datetime NOT NULL,
  `id_pegawai_atasan_langsung` int(11) NOT NULL,
  `tanggal_permohonan` date NOT NULL,
  `ketersediaan_kendaraan` enum('t','tt') NOT NULL,
  `id_kendaraan` int(11) DEFAULT NULL,
  `id_pengemudi` int(11) DEFAULT NULL,
  `tanggal_persetujuan_fungsi_umum` date DEFAULT NULL,
  `id_pegawai_fungsi_umum` int(11) DEFAULT NULL,
  `catatan` text,
  `biaya_tidak_tersedia_kendaraan` int(11) DEFAULT NULL,
  `realisasi_mulai_waktu` datetime NOT NULL,
  `realisasi_mulai_km` int(11) NOT NULL,
  `realisasi_mulai_bbm` enum('e','1/4','1/2','3/4','f') NOT NULL,
  `realisasi_mulai_kondisi` enum('b','t') NOT NULL,
  `id_pegawai_realisasi_mulai_petugas_jaga` int(11) NOT NULL,
  `realisasi_kembali_waktu` datetime NOT NULL,
  `realisasi_kembali_km` int(11) NOT NULL,
  `realisasi_kembali_bbm` enum('e','1/4','1/2','3/4','f') NOT NULL,
  `realisasi_kembali_kondisi` enum('b','t') NOT NULL,
  `id_pegawai_realisasi_kembali_petugas_jaga` int(11) NOT NULL,
  `pengisian_bbm_spbu` text NOT NULL,
  `pengisian_bbm_liter` int(11) NOT NULL,
  `pengisian_bbm_biaya` int(11) NOT NULL,
  `no_voucher` varchar(191) NOT NULL,
  `jarak` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_voucher` (`no_voucher`),
  KEY `id_kendaraan` (`id_kendaraan`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `id_pengemudi` (`id_pengemudi`),
  KEY `id_pegawai_fungsi_umum` (`id_pegawai_fungsi_umum`),
  KEY `id_pegawai_realisasi_kembali_petugas_jaga` (`id_pegawai_realisasi_kembali_petugas_jaga`),
  KEY `id_pegawai_realisasi_mulai_petugas_jaga` (`id_pegawai_realisasi_mulai_petugas_jaga`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `pemakaian_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id`),
  CONSTRAINT `pemakaian_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`),
  CONSTRAINT `pemakaian_ibfk_3` FOREIGN KEY (`id_pengemudi`) REFERENCES `pegawai` (`id`),
  CONSTRAINT `pemakaian_ibfk_4` FOREIGN KEY (`id_pegawai_fungsi_umum`) REFERENCES `pegawai` (`id`),
  CONSTRAINT `pemakaian_ibfk_5` FOREIGN KEY (`id_pegawai_realisasi_kembali_petugas_jaga`) REFERENCES `pegawai` (`id`),
  CONSTRAINT `pemakaian_ibfk_6` FOREIGN KEY (`id_pegawai_realisasi_mulai_petugas_jaga`) REFERENCES `pegawai` (`id`),
  CONSTRAINT `pemakaian_ibfk_7` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `pemakaian_ibfk_8` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemakaian`
--

LOCK TABLES `pemakaian` WRITE;
/*!40000 ALTER TABLE `pemakaian` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `pemakaian` VALUES (1,5,'d','qw qwrwqr','d',NULL,'2018-04-20 01:58:21','2019-04-20 01:58:22',5,'2019-04-20','t',2,4,'2019-04-07',2,NULL,21414,'2019-04-20 01:58:34',124,'1/2','t',3,'2019-04-20 01:58:34',124,'3/4','b',3,'14',124,1242141,'124 qrwefads f',12414,'2019-04-19 01:58:48',1,'2019-04-19 01:59:15',1);
/*!40000 ALTER TABLE `pemakaian` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `pemakaian` with 1 row(s)
--

--
-- Table structure for table `sewa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sewa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kendaraan` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `sewa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kendaraan` (`id_kendaraan`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id`),
  CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `sewa_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sewa`
--

LOCK TABLES `sewa` WRITE;
/*!40000 ALTER TABLE `sewa` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `sewa` VALUES (3,2,12,'2003',124124,'2019-04-20 21:26:08',1,'2019-04-20 21:26:08',1),(5,2,12,'2014',100000,'2019-04-21 18:06:06',1,'2019-04-21 18:06:06',1),(6,2,11,'2005',250000,'2019-04-21 23:46:04',1,'2019-04-22 00:37:33',1);
/*!40000 ALTER TABLE `sewa` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `sewa` with 3 row(s)
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
  `id_pegawai` int(11) DEFAULT NULL,
  `level` enum('pw','pj','pg','fu','a') NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `id_pegawai` (`id_pegawai`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `user` VALUES (1,'admin','$2y$10$R79bBvx34p2gx5aqoWY8leIjHUr6xBgtpIAjfQHyHyqW2NoTu8Rpi',NULL,'a','2019-04-19 00:00:00',NULL,'2019-04-22 00:49:22',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `user` with 1 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Mon, 22 Apr 2019 06:29:41 +0700
