/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.6.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: app
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `auth_cas`
--

DROP TABLE IF EXISTS `auth_cas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_cas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `service` varchar(512) DEFAULT NULL,
  `ticket` varchar(512) DEFAULT NULL,
  `renew` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `auth_cas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_cas`
--

LOCK TABLES `auth_cas` WRITE;
/*!40000 ALTER TABLE `auth_cas` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_cas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_event`
--

DROP TABLE IF EXISTS `auth_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime DEFAULT NULL,
  `client_ip` varchar(512) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `origin` varchar(512) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `auth_event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_event`
--

LOCK TABLES `auth_event` WRITE;
/*!40000 ALTER TABLE `auth_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(512) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_membership`
--

DROP TABLE IF EXISTS `auth_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `auth_membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_membership_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_membership`
--

LOCK TABLES `auth_membership` WRITE;
/*!40000 ALTER TABLE `auth_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `table_name` varchar(512) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `registration_key` varchar(512) DEFAULT NULL,
  `reset_password_key` varchar(512) DEFAULT NULL,
  `registration_id` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_handwatch_FK` (`item_id`),
  KEY `carts_user_FK` (`user_id`),
  CONSTRAINT `carts_handwatch_FK` FOREIGN KEY (`item_id`) REFERENCES `handwatch` (`id`),
  CONSTRAINT `carts_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES
(1,1,13,2),
(2,3,12,1),
(3,5,15,1),
(6,3,13,1),
(7,1,12,2);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'','contenttypes','contenttype');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-01-23 08:43:38.706974'),
(2,'auth','0001_initial','2025-01-23 08:45:13.308102'),
(3,'admin','0001_initial','2025-01-23 08:45:13.309990'),
(4,'admin','0002_logentry_remove_auto_add','2025-01-23 08:45:13.310992'),
(5,'admin','0003_logentry_add_action_flag_choices','2025-01-23 08:45:13.312025'),
(6,'contenttypes','0002_remove_content_type_name','2025-01-23 08:45:13.314595'),
(7,'auth','0002_alter_permission_name_max_length','2025-01-23 08:45:13.315592'),
(8,'auth','0003_alter_user_email_max_length','2025-01-23 08:45:13.317832'),
(9,'auth','0004_alter_user_username_opts','2025-01-23 08:45:13.320339'),
(10,'auth','0005_alter_user_last_login_null','2025-01-23 08:45:13.321404'),
(11,'auth','0006_require_contenttypes_0002','2025-01-23 08:45:13.323416'),
(12,'auth','0007_alter_validators_add_error_messages','2025-01-23 08:45:13.324641'),
(13,'auth','0008_alter_user_username_max_length','2025-01-23 08:45:13.326699'),
(14,'auth','0009_alter_user_last_name_max_length','2025-01-23 08:45:13.328768'),
(15,'auth','0010_alter_group_name_max_length','2025-01-23 08:45:13.329764'),
(16,'auth','0011_update_proxy_permissions','2025-01-23 08:45:13.331908'),
(17,'auth','0012_alter_user_first_name_max_length','2025-01-23 08:45:13.334491'),
(18,'sessions','0001_initial','2025-01-23 08:45:13.336777');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handwatch`
--

DROP TABLE IF EXISTS `handwatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handwatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` text NOT NULL,
  `num` int(11) NOT NULL,
  `img` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handwatch`
--

LOCK TABLES `handwatch` WRITE;
/*!40000 ALTER TABLE `handwatch` DISABLE KEYS */;
INSERT INTO `handwatch` VALUES
(1,'Furlan Marri x Auro x Revo','250000',6,'https://shop.revolutionwatch.com/cdn/shop/files/E1_01_FMBlue-1198_DI_Final_01_1080.jpg?v=1700806299&width=823'),
(2,'CASIO MTP-VT01B-7B','1300000',15,'https://casio-hcm.vn/wp-content/uploads/2022/12/MTP-VT01B-7B.png'),
(3,'Đồng Hồ Nam Chính Hãng CASIO','2569500',27,'https://www.casio-vietnam.vn/wp-content/uploads/2021/12/EFR-526L-1AV.png'),
(4,'Đồng Hồ Nam Chính Hãng CASIO EDIFICE EFR-526L-7BV','2569500',18,'https://www.casio-vietnam.vn/wp-content/uploads/2019/05/EFR-526L-7BV.jpg'),
(5,'CASIO EDIFICE EFV-550P-1A','2500000',19,'https://casio-hcm.vn/wp-content/uploads/2023/06/75ae5f8512f4bdf0bfa15e178ceffa3a.png'),
(6,'Huawei Watch GT4 46mm - Chính hãng','3290000',49,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/3685_dong-ho-thong-minh-huawei-watch-gt4-46mm-chinh-hang/huawei-watch-gt-4-46mm-1.png'),
(7,'Casio Edifice EFR-556PC-2AVUDF','3680000',23,'https://product.hstatic.net/1000122386/product/efr_556pc_2a_dbc3e27b5fa6461cb2d2876441e1a8a3_master.png'),
(8,'Đồng Hồ Định Vị Video Call Wonlex KT17S Đo Oxy Trong Máu - Chính Hãng','1890000',18,'https://topstore.vn/uploads/10_1623318279.jpg'),
(9,'I&W CARNIVAL Automatic 708G1','4850000',54,'https://doseco.vn/_next/image?url=https%3A%2F%2Fdoseco.vn%2Fmedia%2F2023-08%2F708G1__1692410856981.jpg&w=1200&q=75'),
(10,'ĐỒNG HỒ NAM I&W CARNIVAL 55851G-Mặt Xám – Dây Cao Su – Automatic- Kính Sapphire','4390000',25,'https://viostore.vn/wp-content/uploads/2024/12/z6099982563678_b57d588618c01825d80e354422d80540-768x833.jpg'),
(11,'Casio Edifice EFR-526L-1AVUDF - Uy tín từ 2009','2570000',19,'https://product.hstatic.net/1000122386/product/efr-526l-1av_26c664bd56a84eb49f710a57f9a6f464_master.png'),
(12,'Đồng Hồ Nam Chính Hãng CASIO EDIFICE EFR-556PC-2AV','3679000',12,'https://www.casio-vietnam.vn/wp-content/uploads/2020/11/EFR-556PC-2AV.png'),
(13,'Đồng Hồ Thông Minh Smart Watch SKG V9','4990000',123,'https://ytebachlong.vn/upload/sanpham/large/dong-ho-thong-minh-smart-watch-v9-1711170871-50a141.jpg'),
(14,'CASIO MTP-1381L-7A','1250000',134,'https://casio-hcm.vn/wp-content/uploads/2020/08/MTP-1381L-7AV-donghotymo.com-0-1.png'),
(15,'Đồng Hồ Nam Seiko 5 Automatic','3050000',28,'https://bizweb.dktcdn.net/thumb/1024x1024/100/423/012/products/snk805k2-2.jpg?v=1727931442207'),
(16,'ĐỒNG HỒ LONGINES THE SAINT-IMIER CHRONOGRAPH L2.752.4.52.3 L27524523','45900000',47,'https://bdtwatch.com/images/doNG-Ho-LoNGiNeS-THe-SaiNT-iMieR-CHRoNoGRaPH-L2-752-4-52-3-L27524523-result-715207.webp'),
(17,'Casio MTP-VT01GL-3BUDF','962000',172,'https://product.hstatic.net/1000122386/product/mtp-vt01gl-3b_2eabc9cef4c340ad8cb7e7f8ca3cee76_master.png'),
(18,'CASIO MTP-VT01B-1B','1300000',148,'https://casio-hcm.vn/wp-content/uploads/2022/05/MTP-VT01B-1B.png'),
(19,'Garmin Quatix 7, Sapphire - Amoled, Titanium, Silicone Band','18990000',28,'https://antien.vn/files/styles/pslide/public/galleries/dong-ho-Garmin-Quatix-7-amoled.jpg?itok=9see2WYY'),
(20,'ĐỒNG HỒ NAM CARNIVAL 8122G Blue Dial – Dây Da – Automatic- Kính Sapphire','4190000',18,'https://viostore.vn/wp-content/uploads/2024/02/z5185084144903_a456c096ad38c77afef71eadb19790cc-768x853.jpg'),
(21,'Đồng Hồ Nữ Frederique Constant Moonphase FC-206MPWD1S6\r\n','13500000',49,'https://bdtwatch.com/images/dong-ho-nu-Thuy-Sy-Frederique-Constant-Moonphase-FC-206MPWD1S6-FC206MPWD1S63-result-602213.webp'),
(22,'Đồng Hồ Nam Chính Hãng CASIO G-SHOCK MRG-G2000GA-1A','295000000',39,'https://www.casio-vietnam.vn/wp-content/uploads/2019/08/MRG-G2000GA-1A.png'),
(23,'Đồng hồ nam Tissot Chrono XL Classic Quartz T116.617.37.051.00','10080000',49,'https://donghoduyanh.com/images/products/2024/11/08/large/t1166173705100_1731036461.jpg.webp'),
(24,'Đồng hồ Nam I&W Carnival 768G2','4700000',48,'https://baoanhstore.vn/wp-content/uploads/2023/10/768G2-768x768.jpg'),
(25,'Đồng Hồ Nam Chính Hãng CASIO G-SHOCK MRG-B2000SH-5A','397800000',15,'https://www.casio-vietnam.vn/wp-content/uploads/2020/11/MRG-B2000SH-5A.png'),
(26,'Đồng Hồ Nam Lobinni No.5016 Automatic','6550000',96,'https://bizweb.dktcdn.net/thumb/grande/100/472/501/products/dong-ho-nam-lobinni-no-5016-chinh-hang-avt.jpg?v=1677403554537'),
(27,'Hublot Big Bang Unico King Gold Blue Ceramic 441.OX.5181.RX','905000000',42,'https://bizweb.dktcdn.net/thumb/1024x1024/100/364/978/products/big-bang-unico-king-gold-blue-42-mm-soldier-shot.png?v=1718437436653'),
(28,'Đồng hồ Rolex Cosmograph Daytona 126503','550000000',34,'https://bizweb.dktcdn.net/thumb/1024x1024/100/364/978/products/rolex-cosmograph-daytona-126503-2.jpg?v=1686803605613'),
(29,'HUBLOT BIG BANG INTEGRAL KING GOLD JEWELLERY','4551440000',32,'https://bizweb.dktcdn.net/thumb/1024x1024/100/364/978/products/big-bang-integral-king-gold-jewellery-42-mm-ad-shot.jpg?v=1623853478917'),
(30,'HUBLOT BIG BANG MP-11 POWER RESERVE 14 DAYS 3D CARBON','1768639000',19,'https://bizweb.dktcdn.net/thumb/1024x1024/100/364/978/products/0fce921204c460b80c4133ddf5e924b0.jpg?v=1623718655773');
/*!40000 ALTER TABLE `handwatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `card` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `order_carts_FK` (`cart_id`),
  CONSTRAINT `order_carts_FK` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES
(1,1,1),
(2,2,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  UNIQUE KEY `user_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'a@gmail.com','123','A'),
(2,'b@gmail.com','123','B'),
(3,'c@gmail.com','123','C'),
(4,'d@gmail.com','123','D'),
(5,'e@gmail.com','123','E'),
(6,'f@gmail.com','123','F'),
(7,'g@gmail.com','123','g'),
(8,'h@gmail.com','123','h'),
(9,'i@gmail.com','123','i'),
(10,'j@gmail.com','123','j'),
(11,'k@gmail.com','123','k'),
(12,'l@gmail.com','123','l');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-01-24 10:13:10
