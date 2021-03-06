-- MySQL dump 10.19  Distrib 10.3.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: sbrsmfmthosting_du_an_tot_nghiep_fpoly
-- ------------------------------------------------------
-- Server version	10.3.32-MariaDB-log-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sbrsmfmthosting_du_an_tot_nghiep_fpoly`
--


--
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `coupon_id` int(11) DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_start_date` timestamp NULL DEFAULT NULL,
  `discount_end_date` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` (`id`, `name`, `category_id`, `user_id`, `slug`, `image`, `price`, `coupon_id`, `discount`, `discount_type`, `discount_start_date`, `discount_end_date`, `status`, `quantity`, `detail`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'B??ng ????? ch??i cho ch??',4,2,'bong-do-choi-cho-cho','uploads/accessories/61b9bce0b1d40-67_810x810.jpg',102310,NULL,'1200','1','2021-12-14 13:50:00','2021-12-16 13:50:00',1,20,NULL,'2021-10-30 08:17:48','2021-12-15 14:10:30',NULL),(2,'Khay ?????ng n?????c cho Huy',5,1,'khay-dung-nuoc-cho-huy','uploads/accessories/61a731af57997-bird-2.jpg',102310,NULL,NULL,NULL,NULL,NULL,1,122,'test','2021-10-30 08:21:50','2021-12-15 06:01:51',NULL);
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accessory_galleries`
--

DROP TABLE IF EXISTS `accessory_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessory_galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `accessory_id` int(11) NOT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessory_galleries`
--

LOCK TABLES `accessory_galleries` WRITE;
/*!40000 ALTER TABLE `accessory_galleries` DISABLE KEYS */;
INSERT INTO `accessory_galleries` (`id`, `accessory_id`, `image_url`, `order_no`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,1,'uploads/accessories/galleries/5/618a271c96642-banner-muitl.png','1','2021-11-09 07:45:32','2021-12-15 10:01:04','2021-12-15 10:01:04'),(14,1,'uploads/accessories/galleries/1/61b8a6dd401f2-dang-ky.png','1','2021-12-14 14:14:53','2021-12-15 10:01:04','2021-12-15 10:01:04'),(15,1,'uploads/accessories/galleries/1/61b8a833d99cd-bird1-1.jpg','1','2021-12-14 14:20:35','2021-12-15 10:01:04','2021-12-15 10:01:04'),(16,1,'uploads/accessories/galleries/1/61b8a833d9ef0-bird-1-2.jpg','2','2021-12-14 14:20:35','2021-12-15 10:01:04','2021-12-15 10:01:04'),(17,1,'uploads/accessories/galleries/1/61b8a8396fca5-bird1-1.jpg','1','2021-12-14 14:20:41','2021-12-15 10:01:04','2021-12-15 10:01:04'),(18,1,'uploads/accessories/galleries/1/61b8a839700fd-bird-1-2.jpg','2','2021-12-14 14:20:41','2021-12-15 10:01:04','2021-12-15 10:01:04'),(19,1,'uploads/accessories/galleries/1/61b8aa1a4d760-1200px-Mangekyou_Sharingan_Itachi.svg.png','1','2021-12-14 14:28:42','2021-12-15 10:01:04','2021-12-15 10:01:04');
/*!40000 ALTER TABLE `accessory_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ages`
--

DROP TABLE IF EXISTS `ages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ages`
--

LOCK TABLES `ages` WRITE;
/*!40000 ALTER TABLE `ages` DISABLE KEYS */;
INSERT INTO `ages` (`id`, `age`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'T??? 1 ?????n 5 th??ng tu???i','2021-10-28 16:17:53','2021-10-28 16:17:53',NULL),(2,'T??? 6 ?????n 8 th??ng tu???i','2021-10-28 16:17:53','2021-10-28 16:17:53',NULL),(9,'1 n??m tu???i','2021-11-28 08:15:30','2021-11-28 08:15:30',NULL),(10,'11 tu???i','2021-11-28 08:27:05','2021-12-12 16:55:39',NULL);
/*!40000 ALTER TABLE `ages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'Ch??m s??c th?? c??ng','cham-soc-thu-cung','2021-10-30 08:35:10','2021-11-17 07:54:48',NULL),(2,'D???u hi???n nh???n bi???t ch?? b??? b???nh d???i','dau-hieu-nhan-biet-cho-bi-benh-dai','2021-10-30 08:35:10','2021-10-30 08:35:10',NULL),(3,'Testla','testla','2021-10-30 09:26:54','2021-11-22 08:18:34',NULL),(6,'Tr??? ch???y r???n tr??n c?? th??? c???a th?? c??ng','tri-chay-ran-tren-co-the-cua-thu-cung','2021-11-22 08:29:00','2021-11-22 08:39:10',NULL);
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_blog_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` (`id`, `title`, `slug`, `user_id`, `category_blog_id`, `image`, `content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'Testla','testla',2,1,'','adsad',0,'2021-10-30 08:45:55','2021-12-14 15:25:43',NULL),(2,'Sad Sdasd 2','sad-sdasd-2',2,2,'uploads/blog//617d070e54399-cate-cat.jpg','??dasd',0,'2021-10-30 08:49:18','2021-12-14 15:25:43',NULL),(3,'Asda Dsad','df',1,2,'uploads/blog//617d074fd8e4f-hinh-anh-cho-pitbull-deo-kinh-ram-ngau.jpg','??dsad',1,'2021-10-30 08:50:23','2021-12-14 09:39:34',NULL),(4,'??d','ss',1,1,'uploads/blog//617d076241797-204918_29103313_4123971411264945_6910818101047676291_n.jpg','??dasd',1,'2021-10-30 08:50:42','2021-12-14 09:39:34',NULL),(7,'??dd','add',1,2,'uploads/blog//617d096ac3250-cate-bight.jpg','??d',1,'2021-10-30 08:59:22','2021-12-14 09:39:34',NULL),(8,'Trang ch???','trang-chu',1,1,'uploads/blog//618cce62474a5-1200px-Mangekyou_Sharingan_Itachi.svg.png','<p><img src=\"/storage/images/kLs10wVk65bR76Pq2F3gmf0WMnqti1PptB7kma4M.png\" alt=\"\" width=\"1200\" height=\"1200\" /></p>',1,'2021-11-11 08:03:46','2021-12-14 09:39:34',NULL),(9,'Huyffh','huyffh',1,2,'uploads/blog//618cce9c71831-logololipet.png','<p>xcvbnm</p>',1,'2021-11-11 08:04:44','2021-12-14 09:39:34',NULL),(12,'Tesltg','tesltg',1,1,'uploads/blog//619539ad811a1-Screenshot (7).png','<p>sdfgbhnm</p>',1,'2021-11-17 17:19:41','2021-12-14 09:39:34',NULL),(13,'ti??u d','tieu-d',1,1,'uploads/blog//61953a5b6c639-Screenshot (2).png','<p style=\"text-align: center;\">dfghj</p>\r\n<p style=\"text-align: center;\"><img src=\"/storage/images/79pYtXgxA0pIpMt6iAjRJTv3MUJzJZBgile7Wu0C.png\" alt=\"\" width=\"607\" height=\"341\" /></p>',1,'2021-11-17 17:22:35','2021-12-14 09:39:34',NULL),(18,'Ngu???n g???c c???a Huy','nguon-goc-cua-huy',1,1,'uploads/blog//61b8e22ce78f7-hinh-anh-cho-pitbull-deo-kinh-ram-ngau.jpg','<h2 style=\"text-align: center;\"><strong>Ngu???n g???c ch&oacute; Pit Bull</strong></h2>\r\n<p><img class=\"i-amphtml-intrinsic-sizer\" role=\"presentation\" src=\"/storage/images/zW3KkOhicenTd0EWfoZphVtCNKOFPf98bLW8aaOw.svg\" alt=\"\" aria-hidden=\"true\" /><img class=\"i-amphtml-fill-content i-amphtml-replaced-content\" title=\"Ch&oacute; Pitbull\" src=\"https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull.jpg\" sizes=\"(max-width: 771px) 100vw, 771px\" srcset=\"https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull.jpg?v=1611290772 771w, https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-300x142.jpg?v=1611290772 300w, https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-768x365.jpg?v=1611290772 768w\" alt=\"Ch&oacute; Pitbull\" /></p>\r\n<p>Pit Bull l&agrave; gi???ng ch&oacute; ???????c l???i t???o gi???a ch&oacute; ngao Anh v&agrave; ch&oacute; s???c, ???????c nu&ocirc;i l???n ?????u ti&ecirc;n ??? Anh v&agrave;o th??? k??? 18. Pit Bull l&agrave; t&ecirc;n g???i chung c???a ch&oacute; s???c Pit Bull m???, Staffordshire Bull Terrier, American Staffordshire Terrier&hellip; Gi???ng ch&oacute; ngu???n g???c t??? Ch&acirc;u M??? n&agrave;y ??ang d???n ???????c nu&ocirc;i ph??? bi???n t???i Vi???t Nam.</p>\r\n<h2><span id=\"Dac_diem_cua_giong_cho_pit_bull\" class=\"ez-toc-section\"></span>?????c ??i???m c???a&nbsp;<a href=\"https://www.2thucung.com/cho-pit-bull.html\">gi???ng ch&oacute; pit bull</a></h2>\r\n<p><strong>V??? ngo???i h&igrave;nh v&agrave; th??? ch???t</strong>, Pit Bull l&agrave; d&ograve;ng ch&oacute; t???m nh??? v&agrave; trung b&igrave;nh, cao 45 &ndash; 55 cm, n???ng t??? 18 &ndash; 22kg v???i m???t ch&uacute; ch&oacute; tr?????ng th&agrave;nh. Nh&igrave;n qua c&oacute; th??? th???y lo&agrave;i ch&oacute; n&agrave;y kh&aacute; d??? t???n, ch&uacute;ng c&oacute; khung x????ng v???ng ch&atilde;i, vai tr?????c v???m v???, c?? b???p s??n ch???c, tr&aacute;n to g??? v???i ??&ocirc;i m???t ????? ng???u. Gi???ng ch&oacute; n&agrave;y n???i ti???ng v???i v??? ngo&agrave;i h???m h??? v&agrave; hung d???. V???y n&ecirc;n gi???ng ch&oacute; n&agrave;y ???????c nhi???u ng?????i ch???n nu&ocirc;i ????? gi??? nh&agrave; d&ugrave; nguy hi???m, v&igrave; v??? ngo&agrave;i h&ugrave;ng h??? s???n s&agrave;ng t???n c&ocirc;ng m&agrave; c&oacute; th??? uy hi???p ???????c ng?????i kh&aacute;c.</p>\r\n<p>?????c bi???t c???a ch&oacute; Pit Bull c&oacute; c???u t???o c?? h&agrave;m nh?? kh???p kh&oacute;a, v&igrave; v???y khi c???n v???t g&igrave; ho???c ?????i th??? th&igrave; kh&ocirc;ng d??? nh??? ra. N???u b??? Pit Bull c???n, v???t th????ng ????? l???i r???t s&acirc;u v&agrave; r???ng v&igrave; r??ng ch&uacute;ng kh&aacute; d&agrave;i v&agrave; c???c k&igrave; s???c nh???n, nh??? th&igrave; c&oacute; th??? mang t???t, n???ng h??n c&oacute; th??? g&acirc;y nguy hi???m ?????n t&iacute;nh m???ng. L???c c???n c???a ch&uacute;ng l&ecirc;n ?????n 107kg c&oacute; th??? gi???t ch???t ngay m???t con ch&oacute; kh&aacute;c. M???t con Pit Bull b&igrave;nh th?????ng c&oacute; th??? c???n v&agrave; ??u m&igrave;nh trong 30 ph&uacute;t, xu???t ph???t t??? th??? tr???ng kh???e v&agrave; th???n kinh th&eacute;p, c???ng v???i s???c m???nh c?? b???p tuy???t v???i, m???t s??? con c&oacute; th??? k&eacute;o c??? m???t chi???c &ocirc; t&ocirc; 4 b&aacute;nh nh?? v???n ?????ng vi&ecirc;n h???ng n???ng.</p>\r\n<p><img class=\"i-amphtml-intrinsic-sizer\" role=\"presentation\" src=\"/storage/images/o4NxX2WzjC0vTkvkZvrwkBisMBaJpNqd2xh4w1RG.svg\" alt=\"\" aria-hidden=\"true\" /><img class=\"i-amphtml-fill-content i-amphtml-replaced-content\" title=\"Ch&oacute; Pitbull\" src=\"https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-1.jpg\" sizes=\"(max-width: 735px) 100vw, 735px\" srcset=\"https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-1.jpg?v=1611290772 735w, https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-1-300x200.jpg?v=1611290772 300w\" alt=\"Ch&oacute; Pitbull\" /></p>\r\n<p class=\"amp-wp-cdd8ca0\" data-amp-original-style=\"text-align: center;\"><em>H&igrave;nh ???nh con ch&oacute; c&oacute; th??? k&eacute;o ???????c chi???c &ocirc; t&ocirc; :)))))</em></p>\r\n<p>V??? t&iacute;nh c&aacute;ch, Pit Bull b&igrave;nh th?????ng r???t hi???n v&agrave; kh&aacute; th&acirc;n thi???n, ch&uacute;ng ch??? th&uacute; t&iacute;nh khi b??? ??e d???a ho???c b??? t???n c&ocirc;ng, ngo&agrave;i ra th&igrave; ??&acirc;y l&agrave; m???t lo&agrave;i ch&oacute; r???t trung th&agrave;nh. Tuy nhi&ecirc;n, ??i???m ?????c bi???t c???a gi???ng ch&oacute; n&agrave;y v???n l&agrave; kh??? n??ng chi???n ?????u. Ch&uacute;ng ??&aacute;nh nhau r???t h??ng n???u c&oacute; ?????a n&agrave;o k&iacute;ch th&iacute;ch ho???c c&oacute; ng?????i l??? x&acirc;m nh???p v&agrave;o l&atilde;nh th??? v&agrave; s???n s&agrave;ng t???n c&ocirc;ng cho ?????n ch???t. Ch&oacute; Pit Bull l&agrave; d&ograve;ng ch&oacute; nguy hi???m nh???t ?????i v???i con ng?????i trong t???ng s??? h??n 400 lo&agrave;i ch&oacute; tr&ecirc;n th??? gi???i.</p>\r\n<p>S??? nguy hi???m c???a ch&uacute;ng th??? hi???n ??? ch??? khi ??&atilde; ngo???m v???t g&igrave; th&igrave; kh&ocirc;ng nh??? ra cho ?????n khi ?????t k&igrave;a v&agrave; chuy???n sang ch??? kh&aacute;c, th???m ch&iacute; ??ay nghi???n cho ?????n ch???t. Ph???i d???i d???t l???m m???i d&aacute;m t???n c&ocirc;ng Pit Bull, k??? c??? ch&oacute; s&oacute;i hay nh???ng con th&uacute; to l???n h??n g???p nhi???u l???n c??ng kh&oacute; l&agrave; ?????i th??? c???a ch&uacute;ng, khi ??&atilde; l&acirc;m tr???n, ch&uacute;ng cu???ng h??n c??? ch&oacute; d???i.</p>\r\n<p><img class=\"i-amphtml-intrinsic-sizer\" role=\"presentation\" src=\"/storage/images/bSCGHI6KYwymciZbgpDiziw1ZKJrHU0rzZGbw9vr.svg\" alt=\"\" aria-hidden=\"true\" /><img class=\"i-amphtml-fill-content i-amphtml-replaced-content\" title=\"Ch&oacute; Pitbull\" src=\"https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-2.jpg\" sizes=\"(max-width: 640px) 100vw, 640px\" srcset=\"https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-2.jpg?v=1611290772 640w, https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-2-300x208.jpg?v=1611290772 300w\" alt=\"Ch&oacute; Pitbull\" /></p>\r\n<p class=\"amp-wp-cdd8ca0\" data-amp-original-style=\"text-align: center;\"><em>H&igrave;nh ???nh m???t ch&uacute; ch&oacute; Pit Bull tr?????ng th&agrave;nh</em></p>\r\n<h2><span id=\"Cach_cham_soc_va_huan_luyen_cho_Pit_Bull\" class=\"ez-toc-section\"></span><strong>C&aacute;ch ch??m s&oacute;c v&agrave; hu???n luy???n ch&oacute; Pit Bull.</strong></h2>\r\n<p>C??ng nh?? nhi???u lo???i ch&oacute; kh&aacute;c, Pit Bull c???n ???????c ki???m tra s???c kh???e ?????nh k&igrave; h&agrave;ng n??m th???m ch&iacute; h&agrave;ng 3 &ndash; 6 th&aacute;ng. Tuy nhi&ecirc;n Pit Bull l&agrave; lo&agrave;i v???n ?????ng m???nh n&ecirc;n c???n ???????c b??? sung nhi???u ?????m ?????c bi???t l&agrave; th???t b&ograve;. Trong th???c ????n hu???n luy???n c???a Pit Bull c??ng thu???ng xuy&ecirc;n c&oacute; c??? g&agrave;, th?????ng l&agrave; 12 chi???c/ng&agrave;y v???a b??? sung ch???t v???a luy???n r??ng cho Pit Bull. ??n th???t ch&oacute; s??? khi???n Pit Bull d??? t???n h??n. V??? hu???n luy???n, ch&oacute; Pit Bull c???n ???????c hu???n luy???n ngay t??? khi c&ograve;n nh???, t&ugrave;y v&agrave;o m???c ??&iacute;ch c???a ng?????i ch??? khi nu&ocirc;i Pit Bull m&agrave; s??? c&oacute; c&aacute;ch hu???n luy???n kh&aacute;c nhau. M???t s??? b&agrave;i t???p th?????ng ???????c s??? d???ng nh??: t???p b??i, ch???y b???, ??eo l???p xe ch???y marathon, c???n c&acirc;y chu???i, x&eacute; qu??? d???a kh&ocirc;, t&aacute;p l&ecirc;n s???i d&acirc;y r???i treo l???ng l???ng&hellip; C&aacute;c b&agrave;i t???p ph???i ???????c luy???n t???p th?????ng xuy&ecirc;n v&agrave; ng?????i ch??? ph???i ch&uacute; &yacute; trong qu&aacute; tr&igrave;nh hu???n luy???n, c???n ph???i kh&eacute;t khe v&agrave; ph???i ?????m b???o an to&agrave;n.</p>\r\n<p><img class=\"i-amphtml-intrinsic-sizer\" role=\"presentation\" src=\"/storage/images/IxZOZUtYBQYf5uRFS9CBL20DdB5ozMUuupAW3Wv1.svg\" alt=\"\" aria-hidden=\"true\" /><img class=\"i-amphtml-fill-content i-amphtml-replaced-content\" title=\"Ch&oacute; Pitbull\" src=\"https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull.png\" sizes=\"(max-width: 1000px) 100vw, 1000px\" srcset=\"https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull.png?v=1611290772 1000w, https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-300x200.png?v=1611290772 300w, https://www.2thucung.com/wp-content/uploads/2021/01/cho-pitbull-768x511.png?v=1611290772 768w\" alt=\"Ch&oacute; Pitbull\" /></p>\r\n<p class=\"amp-wp-cdd8ca0\" data-amp-original-style=\"text-align: center;\"><em>N???u ???????c hu???n luy???n t???t, ??&acirc;y s??? l&agrave; m???t ng?????i b???n tuy???t v???i</em></p>',1,'2021-11-29 08:02:34','2021-12-14 18:27:56',NULL);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breeds`
--

DROP TABLE IF EXISTS `breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `breeds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breeds`
--

LOCK TABLES `breeds` WRITE;
/*!40000 ALTER TABLE `breeds` DISABLE KEYS */;
INSERT INTO `breeds` (`id`, `name`, `slug`, `category_id`, `user_id`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'Ch?? C???nh','cho-canh',1,1,NULL,1,'2021-10-28 13:10:49','2021-12-14 09:39:34',NULL),(2,'V???t','vet',3,1,NULL,1,'2021-11-21 07:49:18','2021-12-14 09:39:34',NULL),(3,'Ch?? S??n','cho-san',1,1,NULL,1,'2021-10-28 13:14:48','2021-12-14 09:39:34',NULL),(15,'M??o Ba T??','meo-ba-tu',2,3,'uploads/breeds//61a33b21894bb-Ba-tu3.png',0,'2021-11-28 08:17:37','2021-12-14 18:29:39',NULL),(16,'M??o Bengal','meo-bengal',2,3,'uploads/breeds//61a5c882a2527-Bengal2.png',1,'2021-11-30 06:45:22','2021-12-14 18:29:39',NULL),(17,'M??o Munchkin','meo-munchkin',2,3,'uploads/breeds//61a5c8a33449d-Meo-Munchkin1.png',1,'2021-11-30 06:45:55','2021-12-14 18:29:39',NULL),(18,'M??o M??? l??ng ng???n','meo-my-long-ngan',2,3,'uploads/breeds//61a5c8dea2f6e-Meo-My-long-ngan1.png',1,'2021-11-30 06:46:54','2021-12-14 18:29:39',NULL);
/*!40000 ALTER TABLE `breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_slide` int(11) NOT NULL DEFAULT 1,
  `category_type_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `coupon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `show_slide`, `category_type_id`, `created_at`, `updated_at`, `deleted_at`, `coupon_id`) VALUES (1,'Ch??','cho','uploads/categories/1/61acc5a09a009-Dobermann4.png',1,1,'2021-10-28 13:08:16','2021-12-19 07:46:35',NULL,0),(2,'M??o','meo','uploads/categories/2/61acc5cbc073b-Meo-Munchkin2.png',1,1,'2021-11-21 07:50:08','2021-12-15 06:49:40',NULL,0),(3,'Chim','chim','uploads/categories/3/61acc63219f41-images.jfif',1,1,'2021-11-21 07:50:44','2021-12-15 06:01:51',NULL,0),(4,'Khay ?????ng Th???c ??n','khay-dung-thuc-an','6195251c5da89-Screenshot (8)',0,2,'2021-10-30 08:15:01','2021-12-15 06:43:27',NULL,0),(5,'Khay ?????ng N?????c','khay-dung-nuoc','6195251c5da89-Screenshot (8)',0,2,'2021-10-30 08:15:17','2021-12-15 06:01:51',NULL,0),(6,'Reptiles','reptiles','uploads/categories/6/61868e30c2ec1-category-reptiles.jpg',1,1,'2021-11-02 16:14:17','2021-12-15 06:01:51',NULL,0),(7,'Fishs','fishs','uploads/categories//61868e439ccfb-category-fish.jpg',1,1,'2021-11-06 14:16:35','2021-12-15 06:01:51',NULL,0),(8,'Chu???t','chuot','uploads/categories//61868e7511ea5-category-mouse.jpg',1,1,'2021-11-06 14:17:25','2021-12-19 07:46:35',NULL,0),(36,'D??y d???t','day-dat','uploads/categories//618f7fbd16200-logololipet.png',0,2,'2021-11-13 09:05:01','2021-12-15 10:22:39',NULL,0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_types`
--

DROP TABLE IF EXISTS `category_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_types`
--

LOCK TABLES `category_types` WRITE;
/*!40000 ALTER TABLE `category_types` DISABLE KEYS */;
INSERT INTO `category_types` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `slug`) VALUES (1,'Th?? c??ng','2021-10-28 13:06:35','2021-12-15 06:01:51',NULL,'thu-cung'),(2,'Ph??? ki???n','2021-10-28 13:06:35','2021-12-15 06:01:51',NULL,'phu-kien'),(3,'Th???c ??n','2021-10-28 13:06:56','2021-12-14 16:36:52',NULL,'thuc-an'),(4,'Noobs','2021-11-22 09:39:53','2021-11-22 09:39:53',NULL,'noobs'),(6,'Noo','2021-11-22 09:41:16','2021-12-14 16:35:57',NULL,'noo'),(7,'Noosess','2021-11-22 09:42:15','2021-11-22 09:46:55',NULL,'nooess');
/*!40000 ALTER TABLE `category_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_types`
--

DROP TABLE IF EXISTS `coupon_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_types`
--

LOCK TABLES `coupon_types` WRITE;
/*!40000 ALTER TABLE `coupon_types` DISABLE KEYS */;
INSERT INTO `coupon_types` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'S???n ph???m','2021-10-28 11:04:31','2021-12-15 06:40:22',NULL),(2,'T???ng ????n h??ng','2021-10-28 11:04:31','2021-12-15 06:38:38',NULL);
/*!40000 ALTER TABLE `coupon_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_usages`
--

DROP TABLE IF EXISTS `coupon_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_usages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_usages`
--

LOCK TABLES `coupon_usages` WRITE;
/*!40000 ALTER TABLE `coupon_usages` DISABLE KEYS */;
INSERT INTO `coupon_usages` (`id`, `user_id`, `coupon_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,2,1,'2021-11-12 07:00:31','2021-12-15 06:43:27',NULL);
/*!40000 ALTER TABLE `coupon_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` int(11) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` (`id`, `user_id`, `type`, `code`, `discount`, `discount_type`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,1,1,'Covid-2021','12',1,'2021-10-27 17:00:00','2021-10-28 17:00:00','2021-10-28 10:10:32','2021-12-15 06:43:27',NULL),(2,1,2,'Covid-2021','12',1,'2021-10-27 17:00:00','2021-10-28 17:00:00','2021-10-28 10:10:46','2021-12-15 06:43:27',NULL),(4,1,1,'PH11301','300000',1,'2021-11-07 17:00:00','2021-11-09 17:00:00','2021-11-06 16:03:51','2021-12-15 06:43:27',NULL),(5,1,1,'PH11302','300000',1,'2021-11-07 17:00:00','2021-11-09 17:00:00','2021-11-08 06:24:13','2021-12-15 06:43:27',NULL),(7,2,1,'ph111','300000',1,NULL,NULL,'2021-11-08 08:18:00','2021-12-19 07:46:35',NULL);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_types`
--

DROP TABLE IF EXISTS `discount_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_types`
--

LOCK TABLES `discount_types` WRITE;
/*!40000 ALTER TABLE `discount_types` DISABLE KEYS */;
INSERT INTO `discount_types` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'Gi?? ti???n','2021-10-28 11:05:16','2021-12-15 06:43:27',NULL),(2,'Ph???n tr??m','2021-10-28 11:05:16','2021-12-14 17:55:21',NULL),(5,'Nobels','2021-11-27 08:55:58','2021-11-27 08:56:57',NULL);
/*!40000 ALTER TABLE `discount_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` (`id`, `gender`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'Gi???ng ?????c','2021-10-28 14:02:04','2021-12-15 06:49:40',NULL),(2,'Gi???ng c??i','2021-10-28 14:02:04','2021-12-14 18:08:58',NULL),(3,'L?????ng t??nh','2021-10-28 14:02:32','2021-12-14 18:08:39',NULL);
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_settings`
--

LOCK TABLES `general_settings` WRITE;
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;
INSERT INTO `general_settings` (`id`, `logo`, `phone`, `email`, `map`, `address`, `open_time`, `facebook`, `instagram`, `twitter`, `youtube`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'uploads/logo//61ba0ba7276bd-wibu_pet.png','0336126727','lolipetvn@gmail.com','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.8638558814587!2d105.74459841533215!3d21.038132792833153!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b991d80fd5%3A0x53cefc99d6b0bf6f!2zVHLGsOG7nW5nIENhbyDEkeG6s25nIEZQVCBQb2x5dGVjaG5pYw!5e0!3m2!1svi!2s!4v1638181372341!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>','S??? 168 Th?????ng ????nh ??? Thanh Xu??n ??? H?? N???i','8:00AM - 18:00PM','https://www.facebook.com/huyphan291001',NULL,NULL,NULL,NULL,'2021-12-15 15:37:11',NULL);
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_role`
--

DROP TABLE IF EXISTS `menu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menus_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_role`
--

LOCK TABLES `menu_role` WRITE;
/*!40000 ALTER TABLE `menu_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `href` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2021_09_28_072629_create_products_table',1),(6,'2021_09_28_092237_create_categories_table',1),(7,'2021_09_28_093616_create_breeds_table',1),(8,'2021_09_28_093640_create_genders_table',1),(9,'2021_09_28_093714_create_ages_table',1),(10,'2021_09_28_093733_create_colors_table',1),(11,'2021_10_03_070859_create_permission_tables',1),(12,'2021_10_20_074335_create_accessories_table',1),(13,'2021_10_20_075621_create_slides_table',1),(14,'2021_10_20_075916_create_announcements_table',1),(15,'2021_10_20_080146_create_product_galleries_table',1),(16,'2021_10_20_080209_create_accessory_galleries_table',1),(17,'2021_10_23_161451_create_general_settings_table',1),(18,'2021_10_23_162350_create_coupons_table',1),(19,'2021_10_23_162830_create_coupon_usages_table',1),(20,'2021_10_23_172204_create_carts_table',1),(21,'2021_10_23_173432_create_cities_table',1),(22,'2021_10_23_173807_create_countries_table',1),(23,'2021_10_23_174323_create_blog_categories_table',1),(24,'2021_10_23_174623_create_blogs_table',1),(25,'2021_10_23_175028_create_orders_table',1),(26,'2021_10_23_175859_create_order_details_table',2),(27,'2021_10_24_213155_create_category_types_table',2),(28,'2021_10_28_175429_create_coupon_types_table',3),(29,'2021_10_28_175456_create_discount_types_table',3),(30,'2021_11_06_112815_create_reviews_table',4),(31,'2021_11_09_152808_updatecategoriestable',5),(32,'2021_11_09_214043_updateproductstable',6),(33,'2021_11_09_225602_updateproduct_galleriestable',7),(34,'2021_11_11_211229_updateaccessoriestable',8),(35,'2021_11_11_211356_updateblogstable',8),(36,'2021_11_11_211449_updatebreedstable',8),(37,'2021_11_11_211634_updatecartstable',8),(38,'2021_11_11_211718_updatecoupon_usagestable',8),(39,'2021_11_11_211750_updatecouponstable',8),(40,'2021_11_11_211832_updateorderstable',8),(41,'2021_11_11_212017_updateslidestable',8),(42,'2021_11_12_005016_updateuserstable',9),(43,'2021_11_12_012507_updateorder_detailstable',10),(44,'2021_11_12_012716_updatereviewstable',11),(45,'2021_11_12_140327_updateannouncementstable',11),(46,'2021_11_12_141417_updateaccessory_galleriestable',12),(47,'2021_11_13_233554_updatecategory_typestable',13),(48,'2021_11_14_150046_updateaddressestable',14),(49,'2021_11_14_150118_updateagestable',14),(50,'2021_11_14_152142_updateblog_categoriestable',14),(51,'2021_11_14_152228_updatecitiestable',14),(52,'2021_11_14_152257_updatecountriestable',14),(53,'2021_11_14_152318_updatecoupon_typestable',14),(54,'2021_11_14_152357_updatediscount_typestable',14),(55,'2021_11_14_152421_updatedistrictstable',14),(56,'2021_11_14_152449_updategenderstable',14),(57,'2021_11_14_152514_updategeneral_settingstable',14),(58,'2021_11_18_003148_updateblogstexrtable',15),(59,'2021_11_19_140634_updatecategorytable',16),(60,'2021_11_19_145735_updatecategorytable',17),(61,'2021_11_19_150120_updatecategorytable',18),(62,'2021_11_23_152024_updatefooter_titletable',19),(63,'2021_11_23_213746_updatefooterstable',20),(64,'2021_12_04_205403_updatecategory_typetable',21),(65,'2021_12_05_145259_create_table_statistical',22),(66,'2021_11_09_205616_create_addresses_table',23),(67,'2021_11_09_215440_create_districts_table',23),(68,'2021_11_09_215509_create_wards_table',23),(69,'2021_11_16_053313_create_footers_table',24),(70,'2021_12_11_163341_updatestatisticaltable',24),(71,'2019_10_11_085455_create_notes_table',25),(72,'2019_10_12_115248_create_status_table',25),(73,'2019_11_08_102827_create_menus_table',25),(74,'2019_11_13_092213_create_menurole_table',25);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES (1,'App\\Models\\User',1),(1,'App\\Models\\User',2),(2,'App\\Models\\User',3),(2,'App\\Models\\User',4),(12,'App\\Models\\User',6),(12,'App\\Models\\User',7),(12,'App\\Models\\User',10),(12,'App\\Models\\User',11);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applies_to_date` date NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_type` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `tax` double(20,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` int(11) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_type`, `price`, `tax`, `shipping_cost`, `shipping_type`, `payment_status`, `delivery_status`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES (13,22,4,1,24000000,3600000.00,0,'Giao h??ng t???n nh??','???? thanh to??n','Giao h??ng th??nh c??ng',2,'2021-11-11 12:48:19','2021-12-19 07:46:35',NULL),(18,25,13,1,83700000,8370000.00,0,'Giao h??ng t???n nh??','???? thanh to??n','Giao h??ng th??nh c??ng',9,'2021-11-11 15:01:28','2021-12-19 07:46:35',NULL),(43,34,5,1,19800000,1980000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang giao h??ng',2,'2021-11-25 03:03:37','2021-12-15 06:49:40',NULL),(44,35,1,1,23400000,2340000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',2,'2021-11-28 08:41:44','2021-12-15 06:43:27',NULL),(45,36,1,1,11700000,1180111.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',1,'2021-12-01 10:28:13','2021-12-15 06:43:27',NULL),(46,36,1,2,101110,1180111.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',1,'2021-12-01 10:28:13','2021-12-15 06:43:27',NULL),(47,37,1,2,101110,10111.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',1,'2021-12-01 10:34:12','2021-12-15 06:43:27',NULL),(48,39,1,1,11700000,1170000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang giao h??ng',1,'2021-12-01 10:35:15','2021-12-15 06:43:27',NULL),(49,42,1,1,11700000,1180231.00,0,'Giao h??ng t???n nh??','???? thanh to??n','Giao h??ng th??nh c??ng',1,'2021-12-02 02:04:49','2021-12-15 06:43:27',NULL),(50,42,2,2,102310,1180231.00,0,'Giao h??ng t???n nh??','???? thanh to??n','Giao h??ng th??nh c??ng',1,'2021-12-02 02:04:49','2021-12-15 06:01:51',NULL),(53,43,2,2,102310,1190342.00,0,'Giao h??ng t???n nh??','???? thanh to??n','??ang ch??? x??? l??',1,'2021-12-06 14:24:38','2021-12-15 06:01:51',NULL),(54,43,1,2,101110,1190342.00,0,'Giao h??ng t???n nh??','???? thanh to??n','??ang ch??? x??? l??',1,'2021-12-06 14:24:38','2021-12-15 06:43:27',NULL),(55,43,1,1,11700000,102.31,0,'Giao h??ng t???n nh??','???? thanh to??n','Giao h??ng th??nh c??ng',1,'2021-12-06 14:24:38','2021-12-15 06:43:27',NULL),(56,44,5,1,118800000,25300000.00,0,'Giao h??ng t???n nh??','???? thanh to??n','??ang giao h??ng',12,'2021-12-08 14:26:40','2021-12-15 06:49:40',NULL),(57,44,4,1,134200000,25300000.00,0,'Giao h??ng t???n nh??','???? thanh to??n','??ang giao h??ng',11,'2021-12-08 14:26:40','2021-12-19 07:46:35',NULL),(58,45,34,1,15000000,1500000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',1,'2021-12-08 15:28:29','2021-12-15 06:49:40',NULL),(61,48,1,1,70200000,7020000.00,0,'Giao h??ng t???n nh??','???? thanh to??n','Giao h??ng th??nh c??ng',6,'2021-12-08 15:40:56','2021-12-15 06:43:27',NULL),(62,49,1,1,11700000,1170000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',1,'2021-12-10 14:12:24','2021-12-15 06:43:27',NULL),(63,50,1,1,140400000,14040000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',12,'2021-12-11 08:08:59','2021-12-15 06:43:27',NULL),(64,50,2,1,0,14040000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',5,'2021-12-11 08:08:59','2021-12-15 06:49:40',NULL),(65,51,1,1,140400000,14090555.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',12,'2021-12-11 08:15:29','2021-12-15 06:43:27',NULL),(66,51,1,2,505550,14090555.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',5,'2021-12-11 08:15:29','2021-12-15 06:43:27',NULL),(71,56,2,1,0,0.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',5,'2021-12-11 09:25:22','2021-12-15 06:49:40',NULL),(72,57,1,1,46800000,4680000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',4,'2021-12-11 14:20:31','2021-12-15 06:43:27',NULL),(73,58,1,1,11700000,1170000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',1,'2021-12-11 21:16:49','2021-12-15 06:43:27',NULL),(74,59,1,1,23400000,2370693.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','H???y ????n h??ng',2,'2021-12-11 21:21:04','2021-12-15 06:43:27',NULL),(75,59,2,2,306930,2370693.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','H???y ????n h??ng',3,'2021-12-11 21:21:04','2021-12-15 06:01:51',NULL),(76,60,2,2,204620,20462.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',2,'2021-12-12 15:30:54','2021-12-15 06:01:51',NULL),(77,61,1,1,23400000,2340000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',2,'2021-12-12 16:07:04','2021-12-15 06:43:27',NULL),(78,62,2,1,0,0.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',1,'2021-12-12 16:09:59','2021-12-15 06:49:40',NULL),(79,63,5,1,9900000,2210000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',1,'2021-12-12 16:11:22','2021-12-15 06:49:40',NULL),(80,63,4,1,12200000,2210000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','????n h??ng b??? h???y',1,'2021-12-12 16:11:22','2021-12-19 07:46:35',NULL),(81,64,2,2,102310,10231.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',1,'2021-12-12 16:21:41','2021-12-15 06:01:51',NULL),(82,65,4,1,36600000,3690333.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang giao h??ng',3,'2021-12-13 08:15:30','2021-12-19 07:46:35',NULL),(83,65,1,2,303330,3690333.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang giao h??ng',3,'2021-12-13 08:15:30','2021-12-15 06:43:27',NULL),(86,72,1,1,11700000,1170000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',1,'2021-12-13 11:05:55','2021-12-15 06:43:27',NULL),(87,73,1,1,11700000,1170000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang giao h??ng',1,'2021-12-13 11:07:46','2021-12-15 06:43:27',NULL),(88,74,1,1,11700000,1170000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',1,'2021-12-13 12:57:17','2021-12-15 06:43:27',NULL),(89,75,1,1,11700000,1170000.00,0,'Giao h??ng t???n nh??','Ch??a thanh to??n','??ang ch??? x??? l??',1,'2021-12-13 13:15:37','2021-12-15 06:43:27',NULL);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_status` int(11) NOT NULL,
  `grand_total` double(20,2) NOT NULL,
  `coupon_discount` int(11) DEFAULT NULL,
  `code` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `seller_id`, `user_id`, `name`, `phone`, `email`, `note`, `shipping_address`, `payment_type`, `payment_status`, `delivery_status`, `grand_total`, `coupon_discount`, `code`, `cancel_order`, `created_at`, `updated_at`, `deleted_at`) VALUES (22,1,1,'Big boss','0336126725','hungtmph10583@gmail.com','Giao h??ng ngay','196 H??? T??ng M???u, C???u Di???n, Nam T??? Li??m, H?? N???i','Tr??? ti???n khi nh???n h??ng','2',3,39600000.00,NULL,'11112021-194819',NULL,'2021-11-11 12:48:19','2021-12-14 09:39:33',NULL),(25,1,2,'??dasdsad','3214123123','12313221@fpt.edu.vn','????','no, C???u Di???n, Nam T??? Li??m, no','Tr??? ti???n khi nh???n h??ng','2',3,92070000.00,NULL,'13112021-194819',NULL,'2021-11-11 15:01:28','2021-12-14 15:25:43',NULL),(34,1,3,'Kh??nh Ng???c','0961316491','hungtmph10583@gmail.com',NULL,'196 H??? T??ng M???u, C???u Di???n, Th??nh ph??? B???c Li??u, B???c Li??u','Tr??? ti???n khi nh???n h??ng','1',3,21780000.00,NULL,'25112021-100337',NULL,'2021-11-25 03:03:37','2021-12-14 18:29:39',NULL),(35,1,3,'Kh??nh Ng???c','0961316491','ngoctkph11120@fpt.edu.vn',NULL,'196 H??? T??ng M???u, C???u Di???n, Huy???n C??i N?????c, C?? Mau','Tr??? ti???n khi nh???n h??ng','1',1,25740000.00,NULL,'28112021-154144',NULL,'2021-11-28 08:41:44','2021-12-14 18:29:39',NULL),(36,1,NULL,'M???nh Hung','0336126724','tranmanhhung1832001@gmail.com',NULL,'196 H??? T??ng M???u, C???u Di???n, Th??? x?? Bu??n H???, ?????k L???k','Tr??? ti???n khi nh???n h??ng','1',1,12981221.00,NULL,'01122021-172813',NULL,'2021-12-01 10:28:13','2021-12-02 07:36:13',NULL),(37,1,1,'Big boss','0336126725','hungtmph10583@gmail.com',NULL,'196 H??? T??ng M???u, C???u Di???n, Th??? x?? Bu??n H???, ?????k L???k','Tr??? ti???n khi nh???n h??ng','1',4,111221.00,NULL,'01122021-173412','hungtmph10583@gmail.com','2021-12-01 10:34:12','2021-12-14 09:39:33',NULL),(39,1,NULL,'Sao Kim','0336126725','manhhunglzx@gmai.com',NULL,'196 H??? T??ng M???u, C???u Di???n, Th??? x?? Bu??n H???, ?????k L???k','Tr??? ti???n khi nh???n h??ng','1',2,12870000.00,NULL,'01122021-173515',NULL,'2021-12-01 10:35:15','2021-12-08 20:29:10',NULL),(42,1,1,'M???nh H??ng','0336126725','hungtmph10583@gmail.com',NULL,'196 H??? T??ng M???u, C???u Di???n, Th??nh ph??? B???c Giang, B???c Giang','Tr??? ti???n khi nh???n h??ng','2',3,12982541.00,NULL,'02122021-090449','','2021-12-02 02:04:49','2021-12-14 09:39:33',NULL),(43,1,8,'Manh Hung','0365791629','manhhunglzx@gmail.com',NULL,'196 H??? T??ng M???u, C???u Di???n, Th??nh ph??? C?? Mau, C?? Mau','Tr??? ti???n khi nh???n h??ng','2',1,13093762.00,NULL,'06122021-212438',NULL,'2021-12-06 14:24:38','2021-12-09 10:21:19',NULL),(44,1,2,'Huy Phan','0365791629','huypqph11301@fpt.edu.vn',NULL,'196 H??? T??ng M???u, C???u Di???n, Th??? x?? Ho??ng Mai, Ngh??? An','Tr??? ti???n khi nh???n h??ng','2',2,278300000.00,NULL,'08122021-212640',NULL,'2021-12-08 14:26:40','2021-12-14 15:25:43',NULL),(45,NULL,6,'Th???ng','0965029062','thangdvph08801@fpt.edu.vn',NULL,'196 H??? T??ng M???u, C???u Di???n, Qu???n C???u Gi???y, ?????ng Th??p','Tr??? ti???n khi nh???n h??ng','1',4,16500000.00,NULL,'08122021-222829','thangdvph08801@fpt.edu.vn','2021-12-08 15:28:29','2021-12-08 16:16:09',NULL),(48,1,2,'Huy Phan','0365791629','huypqph11301@fpt.edu.vn',NULL,'196 H??? T??ng M???u, C???u Di???n, Th??? x?? Ho??ng Mai, Ngh??? An','Tr??? ti???n khi nh???n h??ng','2',3,77220000.00,NULL,'08122021-224056',NULL,'2021-12-08 15:40:56','2021-12-14 15:25:43',NULL),(49,NULL,7,'Quang Trung','0399832584','trunghnqph10278@fpt.edu.vn',NULL,'196 H??? T??ng M???u, C???u Di???n, Huy???n H??a B??nh, B???c Li??u','Tr??? ti???n khi nh???n h??ng','1',1,12870000.00,NULL,'10122021-211224',NULL,'2021-12-10 14:12:24','2021-12-10 14:12:24',NULL),(50,NULL,2,'Huy Phan','0365791629','huypqph11301@fpt.edu.vn',NULL,'kh???i 8 ph?????ng qu???nh thi???n, Ph?????ng qu???nh thi???n, Th??? x?? Ho??ng Mai, Ngh??? An','Tr??? ti???n khi nh???n h??ng','1',4,154440000.00,NULL,'11122021-150859','huypqph11301@fpt.edu.vn','2021-12-11 08:08:59','2021-12-14 15:25:43',NULL),(51,NULL,2,'Huy Phan','0365791629','huypqph11301@fpt.edu.vn',NULL,'kh???i 8 ph?????ng qu???nh thi???n, Qu???nh Thi???n, Th??? x?? Ho??ng Mai, Ngh??? An','Tr??? ti???n khi nh???n h??ng','1',4,154996105.00,NULL,'11122021-151529','huypqph11301@fpt.edu.vn','2021-12-11 08:15:29','2021-12-14 15:25:43',NULL),(56,NULL,2,'Huy Phan','0365791629','huypqph11301@fpt.edu.vn',NULL,'kh???i 8 ph?????ng qu???nh thi???n, Qu???nh Thi???n, Th??? x?? Ho??ng Mai, Ngh??? An','Tr??? ti???n khi nh???n h??ng','1',4,0.00,NULL,'11122021-162522','huypqph11301@fpt.edu.vn','2021-12-11 09:25:22','2021-12-14 15:25:43',NULL),(57,1,1,'M???nh H??ng','0336126723','hungtmph10583@gmail.com',NULL,'test, test, Huy???n Ch??u ?????c, B?? R???a - V??ng T??u','Tr??? ti???n khi nh???n h??ng','1',4,51480000.00,NULL,'11122021-212031','hungtmph10583@gmail.com','2021-12-11 14:20:31','2021-12-14 09:39:33',NULL),(58,NULL,NULL,'Dinh Thuan','0336126725','manhhunglzx@gmail.com','Giao hang ngay','199 ho tung mau, Cau dien, Qu???n Nam T??? Li??m, H?? N???i','Tr??? ti???n khi nh???n h??ng','1',4,12870000.00,NULL,'12122021-041649','manhhunglzx@gmail.com','2021-12-11 21:16:49','2021-12-11 22:28:23',NULL),(59,1,NULL,'Dinh Thuan','0336126725','manhhunglzx@gmail.com',NULL,'199 Ho Tung Mau, Cau dien, Qu???n Nam T??? Li??m, H?? N???i','Tr??? ti???n khi nh???n h??ng','1',0,26077623.00,NULL,'12122021-042104',NULL,'2021-12-11 21:21:04','2021-12-11 22:17:38',NULL),(60,NULL,1,'M???nh H??ng','0336126723','hungtmph10583@gmail.com',NULL,'aadadadadddddd, sdadadadddddddddd, Huy???n Mang Yang, An Giang','Tr??? ti???n khi nh???n h??ng','1',4,225082.00,NULL,'12122021-223054','hungtmph10583@gmail.com','2021-12-12 15:30:54','2021-12-14 09:39:33',NULL),(61,NULL,6,'Th???ng','0965029062','thangdvph08801@fpt.edu.vn',NULL,'19 nguy???n c?? th???ch, qu???n nam t??? li??m h?? n???i, d????ng qu???ng h??m, Qu???n Nam T??? Li??m, H?? N???i','Tr??? ti???n khi nh???n h??ng','1',1,25740000.00,NULL,'12122021-230704',NULL,'2021-12-12 16:07:04','2021-12-12 16:07:04',NULL),(62,NULL,1,'M???nh H??ng','0336126723','hungtmph10583@gmail.com','adadada','adadad, d??dadad, Huy???n Mang Yang, Gia Lai','Tr??? ti???n khi nh???n h??ng','1',4,0.00,NULL,'12122021-230959','hungtmph10583@gmail.com','2021-12-12 16:09:59','2021-12-14 09:39:33',NULL),(63,NULL,1,'M???nh H??ng','0336126723','hungtmph10583@gmail.com','????','adada, d??d, Huy???n Mang Yang, Gia Lai','Tr??? ti???n khi nh???n h??ng','1',4,24310000.00,NULL,'12122021-231122','hungtmph10583@gmail.com','2021-12-12 16:11:22','2021-12-14 09:39:33',NULL),(64,1,1,'M???nh H??ng','0336126723','hungtmph10583@gmail.com','cc','cc, cc, Huy???n Mang Yang, Gia Lai','Tr??? ti???n khi nh???n h??ng','1',1,112541.00,NULL,'12122021-232141',NULL,'2021-12-12 16:21:41','2021-12-14 09:39:33',NULL),(65,1,2,'Huy Phan','0365791629','huypqph11301@fpt.edu.vn',NULL,'kh???i 8 ph?????ng qu???nh thi???n, Qu???nh Thi???n, Th??? x?? Ho??ng Mai, Ngh??? An','Tr??? ti???n khi nh???n h??ng','1',2,40593663.00,NULL,'13122021-151530',NULL,'2021-12-13 08:15:30','2021-12-14 15:25:43',NULL),(72,NULL,1,'M???nh H??ng','0336126723','hungtmph10583@gmail.com',NULL,'199 ho tung mau, Cau dien, Qu???n Nam T??? Li??m, H?? N???i','Tr??? ti???n khi nh???n h??ng','1',1,12870000.00,NULL,'13122021-180555',NULL,'2021-12-13 11:05:55','2021-12-14 09:39:33',NULL),(73,1,1,'M???nh H??ng','0336126723','hungtmph10583@gmail.com',NULL,'199 ho tung mau, Cau dien, Qu???n Nam T??? Li??m, H?? N???i','Tr??? ti???n khi nh???n h??ng','1',2,12870000.00,NULL,'13122021-180746',NULL,'2021-12-13 11:07:46','2021-12-14 09:39:33',NULL),(74,1,NULL,'Dinh Thuan','0336126724','hungtmph10583@gmail.com',NULL,'199 ho tung mau, Cau dien, Qu???n Nam T??? Li??m, H?? N???i','Tr??? ti???n khi nh???n h??ng','1',1,12870000.00,NULL,'13122021-195717',NULL,'2021-12-13 12:57:17','2021-12-19 07:13:48',NULL),(75,NULL,4,'Ngoc Anh','0961316491','anhhnph09909@fpt.edu.vn',NULL,'Ng?? s??? 3, aa, Th??nh ph??? B???c Giang, B???c Giang','Tr??? ti???n khi nh???n h??ng','1',1,12870000.00,NULL,'13122021-201537',NULL,'2021-12-13 13:15:37','2021-12-15 09:18:55',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES (161,'hungtmph10583@gmail.com','tBbR3xavSuLf9KHhwuVmWw1YkodSKHOJMxVSWAyc2z3F4VyMnz8kCt19KjmX','2021-12-19 04:23:54',NULL);
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (1,'add users','web','2021-10-28 09:37:35','2021-10-28 09:37:35'),(2,'edit users','web','2021-10-28 09:37:35','2021-10-28 09:37:35'),(3,'delete users','web','2021-10-28 09:38:07','2021-10-28 09:38:07'),(4,'add posts','web','2021-12-05 17:14:21','2021-12-05 17:14:21'),(5,'edit posts','web','2021-12-05 17:14:21','2021-12-05 17:14:21'),(6,'add roles','web','2021-12-05 17:15:33','2021-12-05 17:15:33'),(7,'edit roles','web','2021-12-05 17:15:33','2021-12-05 17:15:33'),(8,'delete roles','web','2021-12-05 17:16:14','2021-12-05 17:16:14'),(9,'add coupons','web','2021-12-05 17:16:14','2021-12-05 17:16:14'),(10,'edit coupons','web','2021-12-05 17:17:29','2021-12-05 17:17:29'),(11,'delete coupons','web','2021-12-05 17:17:29','2021-12-05 17:17:29'),(12,'add products','web','2021-12-05 17:21:54','2021-12-05 17:21:54'),(13,'edit products','web','2021-12-05 17:21:54','2021-12-05 17:21:54'),(14,'delete products','web','2021-12-05 17:22:33','2021-12-05 17:22:33'),(15,'add categories','web','2021-12-05 17:22:33','2021-12-05 17:22:33'),(16,'edit categories','web','2021-12-05 17:23:42','2021-12-05 17:23:42'),(17,'delete categories','web','2021-12-05 17:23:42','2021-12-05 17:23:42'),(18,'login_admin','web','2021-12-09 16:39:51','2021-12-09 16:39:51'),(19,'edit_order','web','2021-12-09 16:56:51','2021-12-09 16:56:51');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `product_galleries`
--

DROP TABLE IF EXISTS `product_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_no` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_galleries`
--

LOCK TABLES `product_galleries` WRITE;
/*!40000 ALTER TABLE `product_galleries` DISABLE KEYS */;
INSERT INTO `product_galleries` (`id`, `product_id`, `image_url`, `order_no`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,1,'uploads/products/galleries/1/617ad0031e583-cate-dog.jpg',1,'2021-10-28 16:29:55','2021-12-15 06:43:27',NULL),(2,7,'uploads/gallery/7/6184f38649d62-Untitled-1.png',1,'2021-11-05 09:04:06','2021-12-15 06:49:40',NULL),(3,4,'uploads/products/galleries/4/6188c471c6c40-shiba2.png',1,'2021-11-08 06:32:17','2021-12-19 07:46:35',NULL),(4,4,'uploads/products/galleries/4/6188c471cdc25-shiba3.png',2,'2021-11-08 06:32:17','2021-12-19 07:46:35',NULL),(21,34,'uploads/gallery/34/61a5c81d21b53-Ba-tu2.png',1,'2021-11-30 06:43:41','2021-12-15 06:49:40',NULL),(22,34,'uploads/gallery/34/61a5c81d22732-Ba-tu3.png',2,'2021-11-30 06:43:41','2021-12-15 06:49:40',NULL),(23,34,'uploads/gallery/34/61a5c81d22d45-Ba-tu4.png',3,'2021-11-30 06:43:41','2021-12-15 06:49:40',NULL),(24,35,'uploads/gallery/35/61a5c99ec580f-Bengal1.png',1,'2021-11-30 06:50:06','2021-12-15 06:49:40',NULL),(25,35,'uploads/gallery/35/61a5c99ec5cb1-Bengal3.png',2,'2021-11-30 06:50:06','2021-12-15 06:49:40',NULL),(26,35,'uploads/gallery/35/61a5c99ec60a7-Bengal4.png',3,'2021-11-30 06:50:06','2021-12-15 06:49:40',NULL),(28,1,'uploads/products/galleries/1/61b9f6a248258-dang-ky.png',1,'2021-12-15 14:07:30','2021-12-15 14:07:30',NULL);
/*!40000 ALTER TABLE `product_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `breed_id` int(11) NOT NULL,
  `age_id` int(11) DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `coupon_id` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_start_date` timestamp NULL DEFAULT NULL,
  `discount_end_date` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `user_id`, `category_id`, `slug`, `image`, `weight`, `breed_id`, `age_id`, `gender_id`, `price`, `coupon_id`, `discount`, `discount_type`, `discount_start_date`, `discount_end_date`, `status`, `quantity`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'Ch?? ?????m tr???ng ??en',2,2,'cho-dom-trang-den','uploads/products/617ad002e5ef8-cate-dog.jpg','12',15,1,2,12000000,4,3500000,1,'2021-12-14 13:13:00','2021-12-15 13:13:00',1,8,'?????c ??i???m nh???n d???ng: L??ng tr???ng ??en','2021-10-28 16:29:54','2021-12-15 14:45:06',NULL),(2,'M??o tr???ng m???t xanh',1,2,'meo-trang-mat-xanh','uploads/products//61b999449d80a-cate-cat.jpg','13',17,1,1,12000000,NULL,NULL,NULL,NULL,NULL,1,5,'<p><br data-mce-bogus=\"1\"></p>','2021-11-21 07:51:52','2021-12-15 07:29:08',NULL),(3,'V???t B???y M??u',1,3,'vet-bay-mau','uploads/products//61b99925a6525-cate-bight.jpg','1',2,1,1,7500000,NULL,NULL,NULL,NULL,NULL,1,5,NULL,'2021-11-21 07:48:47','2021-12-15 07:30:00',NULL),(4,'M??o c???t ch??n',1,1,'pitbull','uploads/products/617ad002e5ef8-cate-dog.jpg','12',1,1,1,12500000,7,300000,1,NULL,NULL,1,11,'?????c ??i???m nh???n d???ng: ??eo k??nh','2021-11-02 16:49:08','2021-12-19 07:46:35',NULL),(5,'Ch?? m???t x???',1,1,'cho-mat-xe','uploads/products/617ad002e5ef8-cate-dog.jpg','10',1,1,1,10200000,5,300000,1,'2021-11-07 17:00:00','2021-12-13 22:42:39',1,15,'?????c ??i???m nh???n d???ng: m???t x???','2021-11-02 16:50:04','2021-12-15 06:49:40',NULL),(7,'Husky',1,1,'husky','uploads/products//6184f38643826-Untitled-1.png','28',1,2,1,25000000,4,300000,1,'2021-11-07 17:00:00','2021-11-09 17:00:00',1,6,NULL,'2021-11-05 09:04:06','2021-12-15 06:49:40',NULL),(8,'Corgi',1,8,'corgi','uploads/products//6184f38643826-Untitled-1.png','20',1,1,1,0,7,300000,1,'2021-11-19 09:05:00','2021-11-20 09:05:00',1,2,'4422222','2021-11-05 09:04:06','2021-12-19 07:46:35',NULL),(11,'Husky ng??o',1,1,'husky-ngao','https://wihlkit.files.wordpress.com/2010/11/images04.jpg','',0,0,2,12000000,0,0,0,NULL,NULL,1,12,'Ch??a c?? th??ng tin','2021-11-10 07:56:40','2021-12-15 06:01:51',NULL),(12,'Husky ?????n',2,8,'husky-dan','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0TUu-ROeewYG6S8zPhBMjRDsDrlrMIQdZgUv0OA5bDEepCV3-gVA_bbhCJE_GHkrKufM&usqp=CAU','',0,0,2,9300000,7,0,0,NULL,NULL,1,12,'Ch??a c?? th??ng tin','2021-11-10 07:56:40','2021-12-19 07:46:35',NULL),(13,'Husky m???t tr???n',2,8,'husky-mat-tran','https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Le%C3%AFko_au_bois_de_la_Cambre.jpg/220px-Le%C3%AFko_au_bois_de_la_Cambre.jpg','',0,0,3,12000000,7,0,0,NULL,NULL,1,12,'Ch??a c?? th??ng tin','2021-11-10 08:31:34','2021-12-19 07:46:35',NULL),(15,'Husky ?????',2,1,'husky-da','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0TUu-ROeewYG6S8zPhBMjRDsDrlrMIQdZgUv0OA5bDEepCV3-gVA_bbhCJE_GHkrKufM&usqp=CAU','',0,0,3,9300000,7,300000,1,'2021-11-19 09:05:00','2021-11-20 09:05:00',1,12,'Ch??a c?? th??ng tin','2021-11-10 08:31:34','2021-12-19 07:46:35',NULL),(32,'??o thu ????ng',2,1,'ao-thu-dong','uploads/products//61a48cf1dbdfe-1200px-Mangekyou_Sharingan_Itachi.svg.png','28',1,1,1,250000,NULL,NULL,NULL,NULL,NULL,1,6,NULL,'2021-11-29 08:18:57','2021-12-15 06:49:40',NULL),(33,'Shiranuii',2,1,'shiranuii','uploads/products//61a48d62e2b56-1200px-Mangekyou_Sharingan_Itachi.svg.png','28',1,1,1,250000,NULL,NULL,NULL,NULL,NULL,1,6,NULL,'2021-11-29 08:20:50','2021-12-15 06:49:40',NULL),(34,'M??o Ba T??',1,2,'meo-ba-tu','uploads/products/617ad002e5ef8-cate-dog.jpg','3.5',15,2,1,15000000,NULL,NULL,NULL,NULL,NULL,0,5,'<p><a href=\"https://www.2thucung.com/meo-ba-tu.html\"><strong>M&egrave;o Ba T??</strong></a>&nbsp;c&oacute; ngu???n g???c t??? x??? s??? Ba T??, v&igrave; ?????c ??i???m m??i b???t n&ecirc;n ch&uacute;ng c&ograve;n c&oacute; t&ecirc;n l&agrave; Ba T?? m???t t???t. Hi???n nay, nh???ng ch&uacute; m&egrave;o n&agrave;y r???t ???????c s??n ??&oacute;n v&agrave; nu&ocirc;i kh&aacute; r???ng r&atilde;i t???i nhi???u qu???c gia d&ugrave; gi&aacute; th&agrave;nh kh&ocirc;ng h??? r???.</p>\r\n<p><a href=\"https://www.2thucung.com/meo-ba-tu.html\"><strong>M&egrave;o Ba T??</strong></a>&nbsp;c&oacute; ngu???n g???c t??? x??? s??? Ba T??, v&igrave; ?????c ??i???m m??i b???t n&ecirc;n ch&uacute;ng c&ograve;n c&oacute; t&ecirc;n l&agrave; Ba T?? m???t t???t. Hi???n nay, nh???ng ch&uacute; m&egrave;o n&agrave;y r???t ???????c s??n ??&oacute;n v&agrave; nu&ocirc;i kh&aacute; r???ng r&atilde;i t???i nhi???u qu???c gia d&ugrave; gi&aacute; th&agrave;nh kh&ocirc;ng h??? r???.</p>\r\n<p>M???t ch&uacute; m&egrave;o Ba T?? ?????t chu???n b???t bu???c ph???i c&oacute; c&aacute;c ?????c ??i???m: m??i b&eacute;, m???t to, b??? l&ocirc;ng d&agrave;y x&ugrave;. Tuy nhi&ecirc;n c??ng v&igrave; v???y m&agrave; c&aacute;c b&eacute; c&oacute; th??? g???p kh&oacute; kh??n trong vi???c h&iacute;t th??? ho???c ch???y n?????c m???t. V???y n&ecirc;n c???n c???n th???n khi l???a ch???n nu&ocirc;i gi???ng m&egrave;o n&agrave;y.</p>\r\n<p>B??? l&ocirc;ng c???a m&egrave;o Ba T?? c&oacute; th??? g???p c&aacute;c m&agrave;u: tr???ng, kem, cafe s???a, x&aacute;m xanh, n&acirc;u ?????, n&acirc;u, v???n v???n,&hellip;</p>\r\n<p>Nh???ng ch&uacute; m&egrave;o Ba T?? v???n c&oacute; t&iacute;nh c&aacute;ch &ocirc;n h&ograve;a, d??? ch???u, th&ocirc;ng minh v&agrave; qu???n ch???. Ch&uacute;ng kh&ocirc;ng c&oacute; qu&aacute; nhi???u nhu c???u, ho&agrave;n to&agrave;n c&oacute; th??? ??? trong nh&agrave; c??? ng&agrave;y m&agrave; kh&ocirc;ng ch&uacute;t kh&oacute; ch???u, nh??ng n???u ???????c th??? ra ch???y nh???y, leo tr&egrave;o ch&uacute;ng v???n r???t vui s?????ng. M&egrave;o Ba T?? th&iacute;ch h???p cho cu???c s???ng c???a nh???ng ng?????i ch??? b???n r???n nh???t.</p>\r\n<p>Hi???n nay ngo&agrave;i gi???ng Ba T?? l&ocirc;ng d&agrave;i th?????ng th???y th&igrave; sau c&aacute;c qu&aacute; tr&igrave;nh lai t???o, m&egrave;o ba T?? l&ocirc;ng ng???n (Exotic), Hymalayan, Chinchilla c??ng ??&atilde; xu???t hi???n.</p>','2021-11-30 06:43:41','2021-12-15 06:49:40',NULL),(35,'M??o Bengal',3,2,'meo-bengal','uploads/products//61a5c99ec431e-Bengal2.png','2.7',16,1,1,21400000,NULL,NULL,NULL,NULL,NULL,1,2,'<p><strong>M&egrave;o Bengal</strong>&nbsp;(?????c l&agrave; ben-g???) l&agrave; m???t gi???ng m&egrave;o nh&agrave; ???????c ph&aacute;t tri???n sao cho gi???ng nh???ng lo&agrave;i h??? m&egrave;o hoang d&atilde; v???i m???c ti&ecirc;u t???o ra m???t gi???ng m&egrave;o tinh ranh, kh???e m???nh v&agrave; th&acirc;n thi???n &nbsp;v???i b??? l&ocirc;ng mang m&agrave;u s???c r???c r??? v&agrave; ????? t????ng ph???n cao<sup id=\"cite_ref-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/M%C3%A8o_Bengal#cite_note-1\">[1]</a></sup>. Ng?????i ??&atilde; lai t???o m&egrave;o Bengal c&oacute; t&ecirc;n l&agrave; Jean Mill khi c&ocirc; ???y mua ???????c m???t ch&uacute; m&egrave;o b&aacute;o v&agrave; ch&uacute; m&egrave;o nh&agrave;. N??m 1965 th&igrave; ch&uacute; m&egrave;o Bengal ?????u ti&ecirc;n c&oacute; t&ecirc;n l&agrave; Kin Kin ??&atilde; ra ?????i.</p>\r\n<p>C&aacute;i t&ecirc;n \"Bengal\" c&oacute; ngu???n g???c t??? ph&acirc;n lo&agrave;i m&egrave;o b&aacute;o ch&acirc;u &Aacute; (<em>P. b. bengalensis</em>). Ch&uacute;ng c&oacute; m???t ngo???i h&igrave;nh mang v??? \"hoang d&atilde;\" v???i c&aacute;c ?????m &nbsp;ch???m/ hoa g???m, v&agrave; m???t c&aacute;i&nbsp;b???ng tr???ng, v&agrave; m???t c???u tr&uacute;c c?? th??? kh&aacute; t????ng ??????ng v???i m&egrave;o b&aacute;o ch&acirc;u &Aacute;.<sup id=\"cite_ref-animal-world_2-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/M%C3%A8o_Bengal#cite_note-animal-world-2\">[2]</a></sup>&nbsp;M???t khi ???????c t&aacute;ch ra t??? ph???i gi???ng m&egrave;o b&aacute;o v???i m&egrave;o nh&agrave;, t???p t&iacute;nh c???a m&egrave;o bengal s??? gi???ng v???i nh???ng con m&egrave;o nh&agrave; kh&aacute;c.</p>\r\n<p>M&egrave;o Bengal h???u h???t s??? h???u b??? l&ocirc;ng m&agrave;u cam s&aacute;ng v&agrave; m&agrave;u n&acirc;u nh???t. M???c d&ugrave; kh&ocirc;ng n???i b???t nh??ng v???n t???n t???i c&aacute;c c&aacute; th??? mang m&agrave;u l&ocirc;ng \"tr???ng tuy???t\" m&agrave; c??ng kh&aacute; ph??? bi???n</p>','2021-11-30 06:50:06','2021-12-15 06:49:40',NULL),(36,'??o thu ????nghhh',1,1,'ao-thu-donghhh','uploads/products/36/61acc2d22d475-1.jpg','28',1,1,1,250000,NULL,NULL,NULL,NULL,NULL,0,6,NULL,'2021-11-30 07:50:57','2021-12-19 07:44:57',NULL),(37,'Tr???m c???m',2,1,'tram-cam','uploads/products//61ae4566322fc-banner-muitl.png','29',1,2,1,25000000,NULL,NULL,NULL,'2021-12-13 17:29:00','2021-12-15 17:29:00',1,7,'<p><img src=\"/storage/images/dWS9WwCC7SK3vfDdkGHlEKlPoNLz7vb9lzNEncxt.png\" alt=\"\" width=\"330\" height=\"330\" /></p>','2021-12-06 17:16:22','2021-12-15 06:49:40',NULL),(38,'Ch?? poodle',2,1,'cho-poodle','uploads/products//61b7814ca7f19-1200px-Mangekyou_Sharingan_Itachi.svg.png','38',1,1,1,250000,NULL,NULL,NULL,NULL,NULL,1,6,'<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"/storage/images/xSahC7eBEGb49g3bJ6ZnkODc1H0OqnSD8OYxBe6W.png\" alt=\"\" width=\"239\" height=\"178\" /></p>\r\n<p>so l???d</p>','2021-12-13 17:22:20','2021-12-15 06:49:40',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `product_type` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 5,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `product_id`, `product_type`, `user_id`, `name`, `email`, `rating`, `comment`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (4,3,1,2,'','huypqph11301@fpt.edu.vn',2,'test',0,'2021-11-06 05:01:35','2021-12-15 06:49:40',NULL),(29,3,1,1,'M???nh H??ng','hungtmph10583@gmail.com',5,'H??ng t???t!',1,'2021-12-06 15:45:34','2021-12-15 06:49:40',NULL),(24,2,2,1,'M???nh H??ng','hungtmph10583@gmail.com',4,'Good',1,'2021-12-03 04:26:18','2021-12-15 06:01:51',NULL),(25,1,2,1,'','hungtmph10583@gmail.com',5,'pk 1',1,'2021-12-03 04:27:42','2021-12-15 06:43:27',NULL),(31,1,1,1,'M???nh H??ng','hungtmph10583@gmail.com',5,'Good',1,'2021-12-12 14:30:19','2021-12-15 06:43:27',NULL),(30,2,2,NULL,'Dinh Thuan','manhhunglzx@gmail.com',5,'Error',1,'2021-12-11 21:28:48','2021-12-15 06:01:51',NULL),(32,1,1,1,'M???nh H??ng','hungtmph10583@gmail.com',5,'Good',1,'2021-12-14 08:50:09','2021-12-15 06:43:27',NULL),(33,2,2,1,'M???nh H??ng','hungtmph10583@gmail.com',4,'Good',1,'2021-12-14 08:55:32','2021-12-15 06:01:51',NULL);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (1,1),(2,1),(2,2),(3,1),(4,1),(5,1),(6,1),(6,2),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(15,12),(16,1),(16,12),(17,1),(18,1),(18,2),(18,12);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (1,'Admin','web','2021-10-28 09:35:28','2021-10-28 09:35:28'),(2,'Manage','web','2021-10-28 09:35:28','2021-10-28 09:35:28'),(12,'Employee','web','2021-12-09 16:37:18','2021-12-09 16:37:18'),(13,'Godfather','web','2021-12-09 18:38:43','2021-12-09 18:38:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` (`id`, `user_id`, `image`, `url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (6,1,'uploads/slide//61b8e14242734-slide1.jpg','http://huypqph11301.xyz/',1,'2021-11-24 08:53:47','2021-12-14 18:24:02',NULL),(7,1,'uploads/slide//61b8e14f85713-slide2.jpg','http://huypqph11301.xyz/',1,'2021-11-24 08:53:47','2021-12-14 18:24:15',NULL),(8,1,'uploads/slide//61b9fbbdb8111-slide1.jpg',NULL,1,'2021-12-15 14:29:17','2021-12-15 14:29:17',NULL),(9,1,'uploads/slide//61b9fbbdb9f4d-slide2.jpg',NULL,1,'2021-12-15 14:29:17','2021-12-15 14:29:17',NULL);
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `avatar`, `password`, `phone`, `google_id`, `avatar_original`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'M???nh H??ng','hungtmph10583@gmail.com',NULL,'uploads/users/61a8e63c45319-hotboy.jpg','$2y$10$iEsqlXgX3CJWjz7vqcLF9.b/2U2KySQn8TCR9tU0lGD1i7UhN8mgO','0336126724',NULL,NULL,1,NULL,'2021-10-28 09:34:47','2021-12-14 09:39:34',NULL),(2,'Huy Phan','huypqph11301@fpt.edu.vn',NULL,'uploads/users/618ab2a5d1b82-hinh-anh-hacker-3.jpg','$2y$10$DW4QRv5Y6yfYuIfp8fpNLeJF/9AlBXU3/Y9fIRDn68CDDO6KSWNq6','0365791629',NULL,NULL,0,'72e8y3u0C1IBMBkiRUuhvwUrG4fwEy83dfFU6ZZefGYEnBvGzmVIA9auyxY5','2021-10-30 09:03:09','2021-12-16 15:56:33',NULL),(3,'Kh??nh Ng???c','ngoctkph11120@fpt.edu.vn',NULL,'uploads/users/618aae7ea9213-1.jpg','$2y$10$DW4QRv5Y6yfYuIfp8fpNLeJF/9AlBXU3/Y9fIRDn68CDDO6KSWNq6','0961316491',NULL,NULL,1,NULL,'2021-11-08 16:23:18','2021-12-14 18:29:39',NULL),(4,'Ngoc Anh','anhhnph09909@fpt.edu.vn',NULL,'uploads/users/618d22167f6e4-bo-hung.jpg','$2y$10$DW4QRv5Y6yfYuIfp8fpNLeJF/9AlBXU3/Y9fIRDn68CDDO6KSWNq6','0961316492',NULL,NULL,1,NULL,'2021-11-08 16:24:39','2021-12-15 09:18:55',NULL),(5,'Van Tho','thonvph11059@fpt.edu.vn',NULL,'uploads/users/618d222b346a6-weo.jpg','$2y$10$DW4QRv5Y6yfYuIfp8fpNLeJF/9AlBXU3/Y9fIRDn68CDDO6KSWNq6','0388241422',NULL,NULL,1,NULL,'2021-11-09 09:46:35','2021-12-14 15:27:20',NULL),(6,'Th???ng','thangdvph08801@fpt.edu.vn',NULL,'uploads/users/618d223e76218-dcakc88-3221f2a7-ab41-4230-9fee-6753bb4d5bc6.png','$2y$10$DW4QRv5Y6yfYuIfp8fpNLeJF/9AlBXU3/Y9fIRDn68CDDO6KSWNq6','0965029062',NULL,NULL,1,'4NwCxLLaVTkENn3sm86YuVR9AmAquTgGN5qOAQTWA1Arl2WoZDUus4idDkUy','2021-11-09 09:47:08','2021-12-06 13:54:55',NULL),(7,'Quang Trung','trunghnqph10278@fpt.edu.vn',NULL,'uploads/users/618d22504460b-doramon_lolYellow.png','$2y$10$YuCVF19Kp0e50hf7FhkOTOJmweAN4tkCpLCiYRQ4Yq/.9SFWF1aMa','0399832584',NULL,NULL,1,NULL,'2021-11-09 09:48:23','2021-12-10 14:42:00',NULL),(8,'Manh Hung','manhhunglzx@gmail.com',NULL,'uploads/users/61b417b3882fd-star-trophy.png','$2y$10$zg.UxZrI1rcSF/jyUkq/L.CHKjv0ypt9nAUZhkHh0MBrL8V0AkNGC','0365791628',NULL,NULL,1,'fa0HBYfbdMyn53xaHYhSO5DLMBJMm1mwrOraNsURayNJ1jwRS0DbxhtbiWsN','2021-11-10 16:36:21','2021-12-11 03:14:59',NULL),(9,'test','hungtmph10583@fpt.edu.vn',NULL,NULL,'$2y$10$6o/kuF0LHvjI89VdokoFse9dVPpqoiUS3CSGzd6ucucOKw1WDfOcW',NULL,NULL,NULL,1,NULL,'2021-11-22 13:29:23','2021-12-17 22:00:02',NULL),(10,'Wayne','thonvph1109@fpt.edu.vn',NULL,NULL,'$2y$10$R2NhLVu.lCQBnGuJdwZJ2uaCElj5mZVao8/waZQzmxtKQY08lv0vC',NULL,NULL,NULL,1,NULL,'2021-12-08 09:47:53','2021-12-08 09:47:53',NULL),(11,'Tester','phanquochuyqthm@gmail.com',NULL,'uploads/users/61b2342481b38-1200px-Mangekyou_Sharingan_Itachi.svg.png','$2y$10$E4l/jtryT5n0pQLAzK5dleSh9PsuMOIkuWcNn909uBkXLMxvzA3S.','0977778558',NULL,NULL,1,'fmusL3lhOsWm3NT4B4XMIykYNNXAmgzTdI8NzulPl8zDmj02nobAS9iY5qqq','2021-12-09 16:51:49','2021-12-09 16:51:49',NULL),(12,'huy phan','phanquochuy292001@gmail.com',NULL,'https://lh3.googleusercontent.com/a/AATXAJw8jGAI1vgbdhJId3hOsOZeaqVqZI1tNkivParB=s96-c',NULL,NULL,'105588815197611092358','https://lh3.googleusercontent.com/a/AATXAJw8jGAI1vgbdhJId3hOsOZeaqVqZI1tNkivParB=s96-c',1,'kO5Lb1pE0UMlOpdujSqntx7WUVpdrNK0OwdQhX81TXrImNRTr02CzFcJ20SY','2021-12-13 19:09:26','2021-12-13 19:09:26',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sbrsmfmthosting_du_an_tot_nghiep_fpoly'
--

--
-- Dumping routines for database 'sbrsmfmthosting_du_an_tot_nghiep_fpoly'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-19 22:10:20
