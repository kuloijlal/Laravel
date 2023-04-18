-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: belajar-rest-api
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `alat`
--

DROP TABLE IF EXISTS `alat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alat` (
  `idalat` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_alat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resep_idresep` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idalat`),
  KEY `alat_resep_idresep_foreign` (`resep_idresep`),
  CONSTRAINT `alat_resep_idresep_foreign` FOREIGN KEY (`resep_idresep`) REFERENCES `resep` (`idresep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alat`
--

LOCK TABLES `alat` WRITE;
/*!40000 ALTER TABLE `alat` DISABLE KEYS */;
INSERT INTO `alat` VALUES (2,'pisau','keterangan',2,'2023-04-08 23:45:49','2023-04-08 23:45:49'),(3,'wajan','keterangan',2,'2023-04-08 23:45:49','2023-04-08 23:45:49'),(4,'pisau','keterangan',3,'2023-04-09 00:23:26','2023-04-09 00:23:26'),(5,'wajan','keterangan',3,'2023-04-09 00:23:26','2023-04-09 00:23:26');
/*!40000 ALTER TABLE `alat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bahan`
--

DROP TABLE IF EXISTS `bahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bahan` (
  `idbahan` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banyak` decimal(8,2) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resep_idresep` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idbahan`),
  KEY `bahan_resep_idresep_foreign` (`resep_idresep`),
  CONSTRAINT `bahan_resep_idresep_foreign` FOREIGN KEY (`resep_idresep`) REFERENCES `resep` (`idresep`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bahan`
--

LOCK TABLES `bahan` WRITE;
/*!40000 ALTER TABLE `bahan` DISABLE KEYS */;
INSERT INTO `bahan` VALUES (2,'ayam','kg',1.00,'keterangan',2,'2023-04-08 23:45:49','2023-04-08 23:45:49'),(3,'ikan','kg',1.00,'keterangan',2,'2023-04-08 23:45:49','2023-04-08 23:45:49'),(4,'ayam','kg',1.00,'keterangan',3,'2023-04-09 00:23:25','2023-04-09 00:23:25'),(5,'ikan','kg',1.00,'keterangan',3,'2023-04-09 00:23:25','2023-04-09 00:23:25');
/*!40000 ALTER TABLE `bahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `idlog` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `useraccess` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idlog`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'register','register akun','ijlal@ijlal.com','2023-04-08 22:44:13','2023-04-08 22:44:13'),(2,'login','login_akun','ijlal@ijlal.com','2023-04-08 22:44:13','2023-04-08 22:44:13'),(3,'register','register akun','admin@admin.com','2023-04-08 22:49:42','2023-04-08 22:49:42'),(4,'register','register akun','hakim.dina@example.com','2023-04-08 22:49:52','2023-04-08 22:49:52'),(5,'register','register akun','gagustina@example.com','2023-04-08 22:49:52','2023-04-08 22:49:52'),(6,'register','register akun','lazuardi.ella@example.net','2023-04-08 22:49:52','2023-04-08 22:49:52'),(7,'register','register akun','gina.wasita@example.org','2023-04-08 22:49:52','2023-04-08 22:49:52'),(8,'register','register akun','opung62@example.com','2023-04-08 22:49:52','2023-04-08 22:49:52'),(9,'register','register akun','marbun.rizki@example.org','2023-04-08 22:49:52','2023-04-08 22:49:52'),(10,'register','register akun','dian.purnawati@example.org','2023-04-08 22:49:52','2023-04-08 22:49:52'),(11,'register','register akun','bsihombing@example.org','2023-04-08 22:49:53','2023-04-08 22:49:53'),(12,'register','register akun','zthamrin@example.net','2023-04-08 22:49:53','2023-04-08 22:49:53'),(13,'register','register akun','csihombing@example.com','2023-04-08 22:49:53','2023-04-08 22:49:53'),(14,'register','register akun','zrajasa@example.com','2023-04-08 22:49:53','2023-04-08 22:49:53'),(15,'register','register akun','restu61@example.net','2023-04-08 22:49:53','2023-04-08 22:49:53'),(16,'register','register akun','rina.simbolon@example.com','2023-04-08 22:49:53','2023-04-08 22:49:53'),(17,'register','register akun','hprastuti@example.net','2023-04-08 22:49:53','2023-04-08 22:49:53'),(18,'register','register akun','suryono.paris@example.org','2023-04-08 22:49:53','2023-04-08 22:49:53'),(19,'register','register akun','tomi00@example.net','2023-04-08 22:49:53','2023-04-08 22:49:53'),(20,'register','register akun','almira.megantara@example.net','2023-04-08 22:49:54','2023-04-08 22:49:54'),(21,'register','register akun','siti77@example.org','2023-04-08 22:49:54','2023-04-08 22:49:54'),(22,'register','register akun','salsabila41@example.com','2023-04-08 22:49:54','2023-04-08 22:49:54'),(23,'register','register akun','kmandasari@example.org','2023-04-08 22:49:54','2023-04-08 22:49:54'),(24,'register','register akun','kambali00@example.org','2023-04-08 22:49:54','2023-04-08 22:49:54'),(25,'register','register akun','gaduh60@example.com','2023-04-08 22:49:55','2023-04-08 22:49:55'),(26,'register','register akun','girawan@example.org','2023-04-08 22:49:55','2023-04-08 22:49:55'),(27,'register','register akun','yani44@example.com','2023-04-08 22:49:55','2023-04-08 22:49:55'),(28,'register','register akun','wsirait@example.net','2023-04-08 22:49:55','2023-04-08 22:49:55'),(29,'register','register akun','mila.prakasa@example.net','2023-04-08 22:49:55','2023-04-08 22:49:55'),(30,'register','register akun','uwais.darijan@example.org','2023-04-08 22:49:55','2023-04-08 22:49:55'),(31,'register','register akun','csuryatmi@example.net','2023-04-08 22:49:55','2023-04-08 22:49:55'),(32,'register','register akun','queen75@example.com','2023-04-08 22:49:55','2023-04-08 22:49:55'),(33,'register','register akun','uli68@example.com','2023-04-08 22:49:55','2023-04-08 22:49:55'),(34,'register','register akun','hendri.ramadan@example.com','2023-04-08 22:49:56','2023-04-08 22:49:56'),(35,'register','register akun','riyanti.aurora@example.net','2023-04-08 22:49:56','2023-04-08 22:49:56'),(36,'register','register akun','uadriansyah@example.org','2023-04-08 22:49:56','2023-04-08 22:49:56'),(37,'register','register akun','awijaya@example.net','2023-04-08 22:49:56','2023-04-08 22:49:56'),(38,'register','register akun','kriyanti@example.com','2023-04-08 22:49:56','2023-04-08 22:49:56'),(39,'register','register akun','dagustina@example.net','2023-04-08 22:49:56','2023-04-08 22:49:56'),(40,'register','register akun','yoga.putra@example.net','2023-04-08 22:49:56','2023-04-08 22:49:56'),(41,'register','register akun','firgantoro.ana@example.net','2023-04-08 22:49:56','2023-04-08 22:49:56'),(42,'register','register akun','mandala.najam@example.net','2023-04-08 22:49:56','2023-04-08 22:49:56'),(43,'register','register akun','suci.megantara@example.net','2023-04-08 22:49:57','2023-04-08 22:49:57'),(44,'register','register akun','prayogo.hutapea@example.org','2023-04-08 22:49:57','2023-04-08 22:49:57'),(45,'register','register akun','oanggraini@example.com','2023-04-08 22:49:57','2023-04-08 22:49:57'),(46,'register','register akun','darmaji55@example.org','2023-04-08 22:49:57','2023-04-08 22:49:57'),(47,'register','register akun','genta.yuniar@example.net','2023-04-08 22:49:57','2023-04-08 22:49:57'),(48,'register','register akun','wardi77@example.net','2023-04-08 22:49:57','2023-04-08 22:49:57'),(49,'register','register akun','cakrajiya.pradana@example.com','2023-04-08 22:49:57','2023-04-08 22:49:57'),(50,'register','register akun','wsaragih@example.com','2023-04-08 22:49:57','2023-04-08 22:49:57'),(51,'register','register akun','lulut.nasyiah@example.org','2023-04-08 22:49:57','2023-04-08 22:49:57'),(52,'register','register akun','diah.aryani@example.org','2023-04-08 22:49:57','2023-04-08 22:49:57'),(53,'register','register akun','ymarpaung@example.net','2023-04-08 22:49:58','2023-04-08 22:49:58'),(54,'login','login_akun','ijlal@ijlal.com','2023-04-08 22:51:22','2023-04-08 22:51:22'),(55,'login','login_akun','admin@admin.com','2023-04-08 22:53:38','2023-04-08 22:53:38'),(56,'register','register akun','email@email.com','2023-04-08 22:54:55','2023-04-08 22:54:55'),(57,'delete','delete akun','wsaragih@example.com','2023-04-08 23:01:42','2023-04-08 23:01:42'),(58,'tambah resep','tambah resep ayam geprek dengan id 1','admin@admin.com','2023-04-08 23:42:25','2023-04-08 23:42:25'),(59,'tambah bahan','tambah bahan untuk id resep 1 dengan bahan ayam','','2023-04-08 23:42:25','2023-04-08 23:42:25'),(60,'tambah alat','tambah alat 1 dengan nama alat pisau','','2023-04-08 23:42:25','2023-04-08 23:42:25'),(61,'tambah resep','tambah resep ayam geprek dengan id 2','admin@admin.com','2023-04-08 23:45:49','2023-04-08 23:45:49'),(62,'tambah bahan','tambah bahan untuk id resep 2 dengan bahan ayam','','2023-04-08 23:45:49','2023-04-08 23:45:49'),(63,'tambah bahan','tambah bahan untuk id resep 2 dengan bahan ikan','','2023-04-08 23:45:49','2023-04-08 23:45:49'),(64,'tambah alat','tambah alat 2 dengan nama alat pisau','','2023-04-08 23:45:49','2023-04-08 23:45:49'),(65,'tambah alat','tambah alat 2 dengan nama alat wajan','','2023-04-08 23:45:49','2023-04-08 23:45:49'),(66,'publish','publish resep dengan id 2','administrator','2023-04-08 23:49:04','2023-04-08 23:49:04'),(67,'publish','unpublish resep dengan id 2','administrator','2023-04-08 23:50:30','2023-04-08 23:50:30'),(68,'login','login_akun','admin@admin.com','2023-04-09 00:22:12','2023-04-09 00:22:12'),(69,'login','login_akun','ijlal@ijlal.com','2023-04-09 00:23:01','2023-04-09 00:23:01'),(70,'tambah resep','tambah resep ayam bakar dengan id 3','admin@admin.com','2023-04-09 00:23:25','2023-04-09 00:23:25'),(71,'tambah bahan','tambah bahan untuk id resep 3 dengan bahan ayam','','2023-04-09 00:23:25','2023-04-09 00:23:25'),(72,'tambah bahan','tambah bahan untuk id resep 3 dengan bahan ikan','','2023-04-09 00:23:25','2023-04-09 00:23:25'),(73,'tambah alat','tambah alat 3 dengan nama alat pisau','','2023-04-09 00:23:26','2023-04-09 00:23:26'),(74,'tambah alat','tambah alat 3 dengan nama alat wajan','','2023-04-09 00:23:26','2023-04-09 00:23:26'),(75,'login','login_akun','ijlal@ijlal.com','2023-04-09 23:31:32','2023-04-09 23:31:32'),(76,'login','login_akun','ijlal@ijlal.com','2023-04-11 03:51:56','2023-04-11 03:51:56'),(77,'login','login_akun','ijlal@ijlal.com','2023-04-11 04:15:45','2023-04-11 04:15:45');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_03_13_133159_create_resep_table',1),(6,'2023_03_13_135435_create_alat_table',1),(7,'2023_03_13_140729_create_resep_view_table',1),(8,'2023_03_13_141317_create_rating_table',1),(9,'2023_03_13_142210_create_log_table',1),(10,'2023_03_14_000628_create_bahan_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `idrating` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resep_idresep` bigint(20) unsigned NOT NULL,
  `email_users` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idrating`),
  KEY `rating_resep_idresep_foreign` (`resep_idresep`),
  KEY `rating_email_users_foreign` (`email_users`),
  CONSTRAINT `rating_email_users_foreign` FOREIGN KEY (`email_users`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rating_resep_idresep_foreign` FOREIGN KEY (`resep_idresep`) REFERENCES `resep` (`idresep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (3,5,'resepnya mantap',2,'admin@admin.com','2023-04-09 00:16:04','2023-04-09 00:16:04');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resep`
--

DROP TABLE IF EXISTS `resep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resep` (
  `idresep` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cara_pembuatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_resep` enum('draft','submit','publish','unpublished') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idresep`),
  KEY `resep_users_email_foreign` (`users_email`),
  CONSTRAINT `resep_users_email_foreign` FOREIGN KEY (`users_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resep`
--

LOCK TABLES `resep` WRITE;
/*!40000 ALTER TABLE `resep` DISABLE KEYS */;
INSERT INTO `resep` VALUES (2,'ayam geprek','uploads/1680997549_linux0.png','geprek','begini','admin@admin.com','publish','2023-04-08 23:45:49','2023-04-08 23:50:30'),(3,'ayam bakar','uploads/1680999805_linux .png','bakar','video','admin@admin.com','submit','2023-04-09 00:23:25','2023-04-09 00:23:25');
/*!40000 ALTER TABLE `resep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resep_view`
--

DROP TABLE IF EXISTS `resep_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resep_view` (
  `idresep_view` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `resep_idresep` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idresep_view`),
  KEY `resep_view_resep_idresep_foreign` (`resep_idresep`),
  CONSTRAINT `resep_view_resep_idresep_foreign` FOREIGN KEY (`resep_idresep`) REFERENCES `resep` (`idresep`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resep_view`
--

LOCK TABLES `resep_view` WRITE;
/*!40000 ALTER TABLE `resep_view` DISABLE KEYS */;
INSERT INTO `resep_view` VALUES (1,NULL,'2023-04-09',2,'2023-04-08 23:59:13','2023-04-08 23:59:13');
/*!40000 ALTER TABLE `resep_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_validate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('aktif','non-aktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'non-aktif',
  `last_login` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ijlal','ijlal@ijlal.com','user','$2y$10$hjYukpSYdXZr1YjnV9q7P.g6wVt4FH0KGIDoXXGJvJQ3w6IV1Jmjq',NULL,'non-aktif','2023-04-09 05:44:13','2023-04-08 22:44:13','2023-04-08 22:44:13'),(2,'Administrator','admin@admin.com','admin','$2y$10$aqkWIXch3cz3yxaqEE8OYuS9BY6ZIREKeJ0DdNOL6KgjEGsd89sOS',NULL,'aktif','2023-04-09 05:49:42','2023-04-08 22:49:42','2023-04-08 22:49:42'),(3,'Dalima Namaga S.IP','hakim.dina@example.com','user','$2y$10$FMmCQbayFYLtqUTufXpGVu5KL7JaoyHI36XQMjYpktW3H171hc0ga',NULL,'aktif','2023-04-09 05:49:52','2023-04-08 22:49:52','2023-04-08 22:49:52'),(4,'Vino Wijaya','gagustina@example.com','user','$2y$10$Vys4ctwHIqA4dPKsx/TOAOoavnIBl.ppjAX5JWdPBacH6LWiyGR8W',NULL,'aktif','2023-04-09 05:49:52','2023-04-08 22:49:52','2023-04-08 22:49:52'),(5,'Ami Uchita Widiastuti','lazuardi.ella@example.net','user','$2y$10$dKfZ6/NeEbjtaKqHu4Fubul5K9heW9UEjfk/ayVRv0BtEzHRwZe9u',NULL,'non-aktif','2023-04-09 05:49:52','2023-04-08 22:49:52','2023-04-08 23:03:29'),(6,'Tari Melinda Nasyidah','gina.wasita@example.org','user','$2y$10$xqeQ5pJnkcRZD/RCiy8G9O6Dh0QTAKF7FCLWT5AhgTRsN/eHBfefK',NULL,'aktif','2023-04-09 05:49:52','2023-04-08 22:49:52','2023-04-08 22:49:52'),(7,'Maria Pertiwi S.Sos','opung62@example.com','user','$2y$10$OywHyeYJiEqlr3eLAyLSM.NTWhpMnJFKh9YyY0llkMtz4nrvEYytC',NULL,'aktif','2023-04-09 05:49:52','2023-04-08 22:49:52','2023-04-08 22:49:52'),(8,'Raina Uchita Oktaviani M.M.','marbun.rizki@example.org','user','$2y$10$EkNu6r6CmhUdCRre172YlufwOZCNmrqWj5H3SYHTLLAbOgiAvWeY.',NULL,'aktif','2023-04-09 05:49:52','2023-04-08 22:49:52','2023-04-08 22:49:52'),(9,'Janet Halimah','dian.purnawati@example.org','user','$2y$10$F0heubVBLkNryc083I/kz.4bxP3mDTSYQZ9bOi8DraRBPjt7LviV2',NULL,'aktif','2023-04-09 05:49:52','2023-04-08 22:49:52','2023-04-08 22:49:52'),(10,'test','bsihombing@example.org','admin','$2y$10$3il/J5NSXssp4Mi.p2AP7.4ZCCkigs9JnWSZ1SaiKy4nD/NmceuIm','admin@admin.com','non-aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 23:00:29'),(11,'Salimah Kuswandari','zthamrin@example.net','user','$2y$10$V2RUao0KpvJeG0M1rPUf5eoJkymyOC4DZLd1EpcR/YrzUVF.MvrWq',NULL,'aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 22:49:53'),(12,'Viman Hutasoit M.Farm','csihombing@example.com','user','$2y$10$3atDqgOM9cdJTV13RDh2t.c8eoeW4643Z7SKmZv1woCKY6FkObQcu',NULL,'aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 22:49:53'),(13,'Latika Lalita Pudjiastuti','zrajasa@example.com','user','$2y$10$UOU9Q1n.YtJw4bIouTC8HehdBOrsOHCDm5kJK.O7HbLavYaDEl77C',NULL,'aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 22:49:53'),(14,'Ellis Padmasari','restu61@example.net','user','$2y$10$IQHh5d4vqNngJC9921I85.WJ5reSbWS/1tcPdgQY2YG.nYAM6bEwC',NULL,'aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 22:49:53'),(15,'Ade Namaga','rina.simbolon@example.com','user','$2y$10$7YMT5IHa2A3y9VLnc0/yOehRH1phYr3pzZYuiXEA9peg67fE6Kxha',NULL,'aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 22:49:53'),(16,'Yono Hidayat','hprastuti@example.net','user','$2y$10$U6J2AZb.SGEG84ItEJmuDe/JB7D.PSDAVs89YSd9eejTylxfb8Nci',NULL,'aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 22:49:53'),(17,'Baktiono Firgantoro','suryono.paris@example.org','user','$2y$10$wp9wlC.khJ9CFiCw5SvTCOF4aF7A7FPMP7S0Y7Dsg7rOvFzU8LQhm',NULL,'aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 22:49:53'),(18,'Ciaobella Uchita Zulaika S.H.','tomi00@example.net','user','$2y$10$wQ7LCkz0s3krbmbTYzpIwORuiFkWl71O5Nd4BGyr8d9zKuNhFY3ra',NULL,'aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 22:49:53'),(19,'Diah Lintang Purwanti S.Psi','almira.megantara@example.net','user','$2y$10$yVPXvbDat5fP2srjmHI6He0wtnVfgVjC9i3b9d26zOtigxDcZ0QDa',NULL,'aktif','2023-04-09 05:49:53','2023-04-08 22:49:53','2023-04-08 22:49:53'),(20,'Wahyu Prasetya','siti77@example.org','user','$2y$10$DVbLW6sivQVBZ1eU.YF8OeYMYP2eQhYsz03Q1MqBrjgg7p4Ck8qci',NULL,'aktif','2023-04-09 05:49:54','2023-04-08 22:49:54','2023-04-08 22:49:54'),(21,'Ajiono Paiman Sinaga M.Pd','salsabila41@example.com','user','$2y$10$v5INRUiKJ1U7XqwiEdhbCuvLEacMVrLjoR2Zg2xdGgNbgmRImcLEC',NULL,'aktif','2023-04-09 05:49:54','2023-04-08 22:49:54','2023-04-08 22:49:54'),(22,'Johan Prasetya Jailani','kmandasari@example.org','user','$2y$10$mRchmvSaafcuhkRRVx3erOIdqymFrOhd1PomNIzHX0BkJULDjJAty',NULL,'aktif','2023-04-09 05:49:54','2023-04-08 22:49:54','2023-04-08 22:49:54'),(23,'Cemplunk Zulkarnain','kambali00@example.org','user','$2y$10$r9FHW3OMmm0RkWuPmGdKm.WVozZza1p.OUTd8PPLX6RUds/xVXkba',NULL,'aktif','2023-04-09 05:49:54','2023-04-08 22:49:54','2023-04-08 22:49:54'),(24,'Purwanto Mujur Adriansyah','gaduh60@example.com','user','$2y$10$BuTAjngmbrwIA8Q3o.w7te306H.aB1KooZBhH.r8OzDLr26rCtvNO',NULL,'aktif','2023-04-09 05:49:55','2023-04-08 22:49:55','2023-04-08 22:49:55'),(25,'Nurul Cinthia Hastuti M.Pd','girawan@example.org','user','$2y$10$MV4QbEys5vigLZBvYKlqzu8U5k2uy8QA/Plyrjn6mHbzQ0SOMrkHu',NULL,'aktif','2023-04-09 05:49:55','2023-04-08 22:49:55','2023-04-08 22:49:55'),(26,'Putri Mayasari','yani44@example.com','user','$2y$10$0ZyLr2pu3OjM8qa06PR0N.KUVtfhrLG7t1R5SxJj8qyeNRYibXFvq',NULL,'aktif','2023-04-09 05:49:55','2023-04-08 22:49:55','2023-04-08 22:49:55'),(27,'Malika Salsabila Usada','wsirait@example.net','user','$2y$10$vLeT4RG37IqePXFK5uZo8urMdXnL45idzBgpJ2OKTYprMouLSrAji',NULL,'aktif','2023-04-09 05:49:55','2023-04-08 22:49:55','2023-04-08 22:49:55'),(28,'Salsabila Talia Wastuti','mila.prakasa@example.net','user','$2y$10$Fvbjt5/vdyzVHGosmFzI4e51szQr0K3a.Y9cfC0RLDHDs1qQEvxAG',NULL,'aktif','2023-04-09 05:49:55','2023-04-08 22:49:55','2023-04-08 22:49:55'),(29,'Danang Among Wacana S.I.Kom','uwais.darijan@example.org','user','$2y$10$/bkpGbarnRbuLGmX2m38I.AJLEqIU0SizpbhQ2Pc93OTdTZOqQJz.',NULL,'aktif','2023-04-09 05:49:55','2023-04-08 22:49:55','2023-04-08 22:49:55'),(30,'Irfan Rajasa','csuryatmi@example.net','user','$2y$10$0XJ6LcvsujDmnrZHwy021.E5j24pASf00yDnm/BgyEKfGw01nkic6',NULL,'aktif','2023-04-09 05:49:55','2023-04-08 22:49:55','2023-04-08 22:49:55'),(31,'Margana Lanang Utama S.Kom','queen75@example.com','user','$2y$10$9/JgaxWSQOQnfF9qw82KcuNLufwRH6diQv4glYVmaSkFhv87RSZIu',NULL,'aktif','2023-04-09 05:49:55','2023-04-08 22:49:55','2023-04-08 22:49:55'),(32,'Amelia Anita Laksmiwati M.Kom.','uli68@example.com','user','$2y$10$6aojGZ56RBwpS6f76IT2jedIazMKTEkZutF2AyCokZix32yJRIHBu',NULL,'aktif','2023-04-09 05:49:55','2023-04-08 22:49:55','2023-04-08 22:49:55'),(33,'Usyi Ilsa Hariyah','hendri.ramadan@example.com','user','$2y$10$f79FH3dhXL3qpuITnHNpXuJZu5T6OHwmc10fVwl9Qgc8E7IaML2Qi',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(34,'Nugraha Pranowo','riyanti.aurora@example.net','user','$2y$10$HPrW3Ctv7PdbHsvZaLFNZ.MXo1PRXBflqjMPH/wdeMOHIr54u7FWy',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(35,'Lili Namaga','uadriansyah@example.org','user','$2y$10$87HJOOl/vwM3sm0vAdWhN.c/ysWfyb8T7B1kbqTwM4AdChlGhJAzS',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(36,'Mahfud Prabowo Ramadan','awijaya@example.net','user','$2y$10$OPqEYzxsR.qbzg9GRADlqeo8hpH/En7gSB6e4eawT1mJxSILfFBva',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(37,'Kurnia Sihotang S.IP','kriyanti@example.com','user','$2y$10$NxXyaV9X/WmGERddK/jG7.x72Ou4stZlPtXE15bOhRvJ6YL6Ht1Ay',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(38,'Alika Genta Hartati','dagustina@example.net','user','$2y$10$V2secM/NNZ.iaYCyZjPtBOtLcbd0zBMuVWguitmTetkUuVIY2tt1G',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(39,'Cinta Nuraini','yoga.putra@example.net','user','$2y$10$I8MvAkzw/CtxJ2hCNGgapuGzNZq4/X5riTr4rjkFP565NqV0iDppK',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(40,'Laila Kusmawati M.Pd','firgantoro.ana@example.net','user','$2y$10$iyUj6uYEsg3v2ST078sZyOzFrZyxjtmYlFFM61Kr7rbaHfHoU9Z2q',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(41,'Bagiya Radit Latupono','mandala.najam@example.net','user','$2y$10$ZEDsKhU1QWRjkAiUjbc/9eBc/LwqvcoTzQ4T8OIK.zNCeHF9Ct4/.',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(42,'Raisa Purnawati','suci.megantara@example.net','user','$2y$10$TYUDDEcAORYQUnq2jQCS3OxBGpi0tMGnnjeJCUmF1JBjvhGNgNs9W',NULL,'aktif','2023-04-09 05:49:56','2023-04-08 22:49:56','2023-04-08 22:49:56'),(43,'Cengkir Tarihoran','prayogo.hutapea@example.org','user','$2y$10$mZTr97AQDVgqhFcvng9XFuzIrjpOFE.BSd5ukakD7yH4mYhztB3KC',NULL,'aktif','2023-04-09 05:49:57','2023-04-08 22:49:57','2023-04-08 22:49:57'),(44,'Asirwada Wacana','oanggraini@example.com','user','$2y$10$XqM22YOc2Ggnjf0EjJ3W7uhBpnMegHTKUFZFJZxpwsDRi93.piUyi',NULL,'aktif','2023-04-09 05:49:57','2023-04-08 22:49:57','2023-04-08 22:49:57'),(45,'Ellis Winarsih S.Kom','darmaji55@example.org','user','$2y$10$BG/OwHhDyvz7y.OahOYtH.QhTmB6OBXJyTTP29DmWBTXsnPg6DgeO',NULL,'aktif','2023-04-09 05:49:57','2023-04-08 22:49:57','2023-04-08 22:49:57'),(46,'Gilda Dina Oktaviani S.E.I','genta.yuniar@example.net','user','$2y$10$uSioRFnvIZ4BfkuLMSX1CO44mJL.CeIvbrGTFK7Na51cT5qw9S6mK',NULL,'aktif','2023-04-09 05:49:57','2023-04-08 22:49:57','2023-04-08 22:49:57'),(47,'Raisa Zulaika S.H.','wardi77@example.net','user','$2y$10$bWnuLrR0hthsLzlf6SW6cO1/rjJJ/HHZ6FTzMe6nZ3SNvm398EB9C',NULL,'aktif','2023-04-09 05:49:57','2023-04-08 22:49:57','2023-04-08 22:49:57'),(48,'Ida Sudiati','cakrajiya.pradana@example.com','user','$2y$10$6T8qWWnLs.n9thgruiGUCuIiwEHbE3SfXm8.CWA26XcjcS/fNwWq2',NULL,'aktif','2023-04-09 05:49:57','2023-04-08 22:49:57','2023-04-08 22:49:57'),(50,'Vega Putra S.Gz','lulut.nasyiah@example.org','user','$2y$10$OhYprgJwX75brgaiimyIkeWU5kei/dt.CFfKDMw1asnrJp976X88i',NULL,'aktif','2023-04-09 05:49:57','2023-04-08 22:49:57','2023-04-08 22:49:57'),(51,'Shania Andriani','diah.aryani@example.org','user','$2y$10$BbEjsTvZ6RNOBfRS81F94eTzN1EbjpDTNSLzhY7QAQJQ/CPfyqeOK',NULL,'aktif','2023-04-09 05:49:57','2023-04-08 22:49:57','2023-04-08 22:49:57'),(52,'Nasab Garan Natsir','ymarpaung@example.net','user','$2y$10$0tuvXlXDHHXS1yiSsxiT0utYJZ7LxrrrJkaAQAaE5sZBhdAGimOl2',NULL,'aktif','2023-04-09 05:49:58','2023-04-08 22:49:58','2023-04-08 22:49:58'),(53,'ijlal','email@email.com','user','$2y$10$ElXJMmgn96K5DNTH0hfYPu60HLIq2TbiuGmj3Iv3e0skSouqzeLui','admin@admin.com','aktif','2023-04-09 05:54:55','2023-04-08 22:54:55','2023-04-08 22:54:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'belajar-rest-api'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11 18:53:51
