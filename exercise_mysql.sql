-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: belajar_mysql
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Eko','Khannedy'),(2,'Budi','Nugraha'),(4,'Joko','Morro'),(5,'Rully','Hidayat');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang` (
  `nama` varchar(200) NOT NULL,
  `id` int NOT NULL,
  `harga` int NOT NULL DEFAULT '0',
  `jumlah` int NOT NULL DEFAULT '0',
  `deskripsi` text,
  `waktu_dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('C0001','Makanan'),('C0002','Minuman'),('C0003','Lain-lain'),('C0004','Oleh-oleh'),('C0005','Gadget');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'eko@gmail.com','Eko','Kurniawan'),(3,'kurniawan@gmail.com','Eko','Kurniawan');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbooks`
--

DROP TABLE IF EXISTS `guestbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbooks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbooks`
--

LOCK TABLES `guestbooks` WRITE;
/*!40000 ALTER TABLE `guestbooks` DISABLE KEYS */;
INSERT INTO `guestbooks` VALUES (1,'guest@gmail.com','Hello','Hello'),(2,'guest2@gmail.com','Hello','Hello'),(3,'guest3@gmail.com','Hello','Hello'),(4,'eko@gmail.com','Hello','Hello'),(5,'eko@gmail.com','Hello','Hello'),(6,'eko@gmail.com','Hello','Hello'),(7,'contoh@gmail.com','Diubah Oleh User 2','Contoh'),(8,'contoh2@gmail.com','Diubah Oleh User 1','Contoh'),(9,'contoh3@gmail.com','Diuabh Oleh User 1','Contoh');
/*!40000 ALTER TABLE `guestbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mahasiswa` (
  `nim` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (19102001,'Raya','Kelautan','Banjarmasin'),(19102002,'Jessica','Matematika','Sampit'),(19102003,'Imada Ramadhanti','Informatika','Tegal'),(19102008,'Julian','Informatika','Purwokerto'),(19102009,'Julius','Sistem Informasi','Waingapu');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numbers` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numbers`
--

LOCK TABLES `numbers` WRITE;
/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
INSERT INTO `numbers` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,50000,'2023-08-27 13:55:59'),(2,50000,'2023-08-27 13:56:13'),(3,50000,'2023-08-27 13:56:14');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_detail` (
  `id_product` varchar(10) NOT NULL,
  `id_order` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id_product`,`id_order`),
  KEY `fk_orders_detail_order` (`id_order`),
  CONSTRAINT `fk_orders_detail_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_orders_detail_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES ('P0001',1,25000,1),('P0001',2,25000,1),('P0002',1,25000,1),('P0003',2,25000,1),('P0003',3,25000,1),('P0004',3,25000,1);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pegawai` (
  `id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES (1,'julian',1),(2,'agi',0),(3,'imada',4);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_category` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_categories` (`id_category`),
  FULLTEXT KEY `products_fulltext` (`name`,`description`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`),
  CONSTRAINT `price_check` CHECK ((`price` >= 1000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('P0001','Mie Ayam Original',NULL,15000,300,'2023-08-24 10:47:26','C0001'),('P0002','Mie Ayam Bakso','Mie Ayam Original + Bakso',20000,300,'2023-08-24 10:54:25','C0001'),('P0003','Mie Ayam Ceker','Mie Ayam Original + Ceker',20000,300,'2023-08-24 11:30:01','C0001'),('P0004','Mie Ayam Spesial',NULL,25000,300,'2023-08-24 11:30:01','C0001'),('P0005','Mie Ayam Yamin',NULL,20000,300,'2023-08-24 11:30:01','C0001'),('P0006','Mie Ayam Polos',NULL,17000,300,'2023-08-24 11:48:46','C0001'),('P0007','Mie Ayam Pangsit',NULL,15000,300,'2023-08-24 11:48:46','C0001'),('P0008','Mie Ayam Bakso Urat (1 pc)',NULL,16500,300,'2023-08-24 11:48:46','C0001'),('P0009','Mie Ayam Bakso Urat (2 pc)',NULL,18000,100,'2023-08-24 11:48:46','C0001'),('P0010','Mie Ayam Jumbo',NULL,24000,100,'2023-08-24 11:48:46','C0001'),('P0011','Mie Ayam Komplit',NULL,22500,100,'2023-08-24 11:48:46','C0001'),('P0012','Bakso Kuah',NULL,15000,100,'2023-08-24 11:48:46','C0001'),('P0013','Bakso + Mie',NULL,16500,100,'2023-08-24 11:48:46','C0001'),('P0014','Bakso + Mihun',NULL,16500,100,'2023-08-24 11:48:46','C0001'),('P0015','Bakso + Babat',NULL,18000,150,'2023-08-24 11:48:46','C0001'),('P0016','Bakso + Daging',NULL,19000,150,'2023-08-24 11:48:46','C0001'),('P0017','Bakso + Kikil',NULL,17000,150,'2023-08-24 11:48:46','C0001'),('P0018','Bakso + Lidah',NULL,17000,150,'2023-08-24 11:48:46','C0001'),('P0019','Bakso + Ginjal',NULL,17500,150,'2023-08-24 11:48:46','C0001'),('P0020','Bakso + Usus Goreng',NULL,16000,150,'2023-08-24 11:48:46','C0001'),('P0021','Bakso + Pangsit Goreng/Kuah',NULL,18000,150,'2023-08-24 11:48:46','C0001'),('P0022','Bakso + Tahu Goreng/Kukus',NULL,16500,150,'2023-08-24 11:48:46','C0001'),('P0023','Bakso + Sosis',NULL,16000,150,'2023-08-24 11:48:46','C0001'),('P0024','Bakso + Siomay',NULL,16500,150,'2023-08-24 11:48:46','C0001'),('P0025','Bakso Kasar',NULL,17500,150,'2023-08-24 11:48:46','C0001'),('P0026','Bakso Beranak',NULL,18000,150,'2023-08-24 11:48:46','C0001'),('P0027','Bakso Sapi Halus',NULL,19000,150,'2023-08-24 11:48:46','C0001'),('P0028','Bakso Sapi Urat',NULL,20000,150,'2023-08-24 11:48:46','C0001'),('P0029','Soto Ayam',NULL,18000,150,'2023-08-24 11:48:46','C0001'),('P0030','Soto Daging',NULL,20000,150,'2023-08-24 11:48:46','C0001'),('P0031','Es Teh',NULL,4000,400,'2023-08-26 04:46:15','C0002'),('P0032','Es Jeruk',NULL,6000,350,'2023-08-26 04:46:15','C0002'),('P0033','Es Kelapa',NULL,5500,250,'2023-08-26 04:46:15','C0002'),('P0034','Es Cincau',NULL,10000,230,'2023-08-26 04:46:15','C0002'),('P0035','Es Durian',NULL,28000,150,'2023-08-26 04:46:15','C0002'),('P0036','Jus Mangga',NULL,8000,340,'2023-08-26 04:46:15','C0002'),('P0037','Ketupat',NULL,1500,500,'2023-08-26 04:46:15','C0003'),('P0038','Pangsit',NULL,3000,400,'2023-08-26 04:46:15','C0003'),('P0039','Keripik',NULL,3500,320,'2023-08-26 04:46:15','C0003'),('P0040','Kerupuk',NULL,3000,350,'2023-08-26 04:46:15','C0003'),('P0041','Pisang',NULL,1000,900,'2023-08-26 09:37:19','C0003'),('X0001','X Satu',NULL,10000,200,'2023-08-27 07:19:03',NULL),('X0002','X Dua',NULL,25000,300,'2023-08-27 07:19:03',NULL),('X0003','X Tiga',NULL,1000000,400,'2023-08-27 07:19:03',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `name2` varchar(100) DEFAULT NULL,
  `name3` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `name2_index` (`name2`),
  KEY `name3_index` (`name3`),
  KEY `name1_name2_name3_index` (`name`,`name2`,`name3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_customer_unique` (`id_customer`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,1,0),(2,3,0);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_products` varchar(10) NOT NULL,
  `description` text,
  `id_customer` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wishlist_product` (`id_products`),
  KEY `fk_wishlist_customer` (`id_customer`),
  CONSTRAINT `fk_wishlist_customer` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`id_products`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,'P0001','Makanan Kesukaan',1);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-28 13:40:05
