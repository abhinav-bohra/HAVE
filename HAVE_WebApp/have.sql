-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Mar 30, 2021 at 10:49 AM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `have`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add buyer', 7, 'add_buyer'),
(26, 'Can change buyer', 7, 'change_buyer'),
(27, 'Can delete buyer', 7, 'delete_buyer'),
(28, 'Can view buyer', 7, 'view_buyer'),
(29, 'Can add customer', 8, 'add_customer'),
(30, 'Can change customer', 8, 'change_customer'),
(31, 'Can delete customer', 8, 'delete_customer'),
(32, 'Can view customer', 8, 'view_customer'),
(33, 'Can add supplier', 9, 'add_supplier'),
(34, 'Can change supplier', 9, 'change_supplier'),
(35, 'Can delete supplier', 9, 'delete_supplier'),
(36, 'Can view supplier', 9, 'view_supplier'),
(37, 'Can add product', 10, 'add_product'),
(38, 'Can change product', 10, 'change_product'),
(39, 'Can delete product', 10, 'delete_product'),
(40, 'Can view product', 10, 'view_product'),
(41, 'Can add sells', 11, 'add_sells'),
(42, 'Can change sells', 11, 'change_sells'),
(43, 'Can delete sells', 11, 'delete_sells'),
(44, 'Can view sells', 11, 'view_sells'),
(45, 'Can add meta keyword', 12, 'add_metakeyword'),
(46, 'Can change meta keyword', 12, 'change_metakeyword'),
(47, 'Can delete meta keyword', 12, 'delete_metakeyword'),
(48, 'Can view meta keyword', 12, 'view_metakeyword'),
(49, 'Can add wallet', 13, 'add_wallet'),
(50, 'Can change wallet', 13, 'change_wallet'),
(51, 'Can delete wallet', 13, 'delete_wallet'),
(52, 'Can view wallet', 13, 'view_wallet'),
(53, 'Can add transaction', 14, 'add_transaction'),
(54, 'Can change transaction', 14, 'change_transaction'),
(55, 'Can delete transaction', 14, 'delete_transaction'),
(56, 'Can view transaction', 14, 'view_transaction'),
(57, 'Can add order', 15, 'add_order'),
(58, 'Can change order', 15, 'change_order'),
(59, 'Can delete order', 15, 'delete_order'),
(60, 'Can view order', 15, 'view_order'),
(61, 'Can add team', 16, 'add_team'),
(62, 'Can change team', 16, 'change_team'),
(63, 'Can delete team', 16, 'delete_team'),
(64, 'Can view team', 16, 'view_team'),
(65, 'Can add belongs to', 17, 'add_belongsto'),
(66, 'Can change belongs to', 17, 'change_belongsto'),
(67, 'Can delete belongs to', 17, 'delete_belongsto'),
(68, 'Can view belongs to', 17, 'view_belongsto'),
(69, 'Can add driver', 18, 'add_driver'),
(70, 'Can change driver', 18, 'change_driver'),
(71, 'Can delete driver', 18, 'delete_driver'),
(72, 'Can view driver', 18, 'view_driver'),
(73, 'Can add delivery_ details', 19, 'add_delivery_details'),
(74, 'Can change delivery_ details', 19, 'change_delivery_details'),
(75, 'Can delete delivery_ details', 19, 'delete_delivery_details'),
(76, 'Can view delivery_ details', 19, 'view_delivery_details');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(31, 'pbkdf2_sha256$216000$92MWrdalhxSk$+BnKJh4QNuVVxliZPFC+L/Ssc0QzFpAluFP2VVEy7y8=', '2021-03-30 10:12:44.143834', 0, 'Animesh', '', '', '', 0, 1, '2021-03-30 09:14:38.898873'),
(34, 'pbkdf2_sha256$216000$glFNLi7Qg38M$5CGrEUjVEp+FAQ1iV9UeqWSIAUF3QcW+04USLsM6Ia0=', '2021-03-30 09:32:42.351016', 0, 'Skumar', '', '', '', 0, 1, '2021-03-30 09:32:18.705113'),
(37, 'pbkdf2_sha256$216000$A48kdb4IJI0W$OA2EoenKXKTN+5xgtoK5HOXo9usyYHUO5A597aFAxHE=', '2021-03-30 10:25:54.201728', 0, 'Abhinav', '', '', '', 0, 1, '2021-03-30 10:25:28.973488'),
(25, 'pbkdf2_sha256$216000$uuyO8ZM3oLkM$mvymviE7XDnj0vxOmN+8cZ7YEtUzDoJfVkEFhc+1Rbs=', '2021-03-30 10:14:08.677594', 1, 'admin', '', '', '', 1, 1, '2021-03-29 15:23:19.668475');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'HAVE_eCommerce', 'buyer'),
(8, 'HAVE_eCommerce', 'customer'),
(9, 'HAVE_eCommerce', 'supplier'),
(10, 'HAVE_eCommerce', 'product'),
(11, 'HAVE_eCommerce', 'sells'),
(12, 'HAVE_eCommerce', 'metakeyword'),
(13, 'HAVE_eCommerce', 'wallet'),
(14, 'HAVE_eCommerce', 'transaction'),
(15, 'HAVE_eCommerce', 'order'),
(16, 'HAVE_eCommerce', 'team'),
(17, 'HAVE_eCommerce', 'belongsto'),
(18, 'HAVE_eCommerce', 'driver'),
(19, 'HAVE_eCommerce', 'delivery_details');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-03-09 15:29:48.583927'),
(2, 'auth', '0001_initial', '2021-03-09 15:29:48.984093'),
(3, 'admin', '0001_initial', '2021-03-09 15:29:51.138436'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-03-09 15:29:51.862651'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-03-09 15:29:51.888568'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-03-09 15:29:52.159819'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-03-09 15:29:52.319161'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-03-09 15:29:52.461667'),
(9, 'auth', '0004_alter_user_username_opts', '2021-03-09 15:29:52.485603'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-03-09 15:29:52.619501'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-03-09 15:29:52.624487'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-03-09 15:29:52.651474'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-03-09 15:29:52.791147'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-03-09 15:29:52.921899'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-03-09 15:29:53.064155'),
(16, 'auth', '0011_update_proxy_permissions', '2021-03-09 15:29:53.100779'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-03-09 15:29:53.238530'),
(18, 'sessions', '0001_initial', '2021-03-09 15:29:53.295379'),
(19, 'HAVE_eCommerce', '0001_initial', '2021-03-21 14:12:11.944357'),
(20, 'HAVE_eCommerce', '0002_auto_20210323_1945', '2021-03-23 14:15:31.083151'),
(21, 'HAVE_eCommerce', '0003_auto_20210323_1946', '2021-03-23 14:16:18.549196'),
(22, 'HAVE_eCommerce', '0004_remove_product_metakeyword', '2021-03-23 14:35:55.791123'),
(23, 'HAVE_eCommerce', '0005_auto_20210323_2209', '2021-03-23 16:39:45.551461'),
(24, 'HAVE_eCommerce', '0006_auto_20210326_1606', '2021-03-26 10:36:13.866180'),
(25, 'HAVE_eCommerce', '0007_auto_20210326_1940', '2021-03-28 19:18:23.401454'),
(26, 'HAVE_eCommerce', '0008_auto_20210329_0108', '2021-03-28 19:39:03.537858'),
(27, 'HAVE_eCommerce', '0009_auto_20210329_0246', '2021-03-28 21:16:35.955955'),
(28, 'HAVE_eCommerce', '0010_auto_20210329_0256', '2021-03-28 21:26:41.592894'),
(29, 'HAVE_eCommerce', '0011_auto_20210329_0329', '2021-03-28 22:00:02.901642'),
(30, 'HAVE_eCommerce', '0012_auto_20210329_0426', '2021-03-29 08:10:55.704261'),
(31, 'HAVE_eCommerce', '0013_auto_20210329_0430', '2021-03-29 08:10:55.964251'),
(32, 'HAVE_eCommerce', '0002_auto_20210329_1502', '2021-03-29 09:32:26.261699'),
(33, 'HAVE_eCommerce', '0002_auto_20210329_1833', '2021-03-29 13:04:26.302633'),
(34, 'HAVE_eCommerce', '0003_auto_20210329_1834', '2021-03-29 13:04:26.454269'),
(35, 'HAVE_eCommerce', '0002_auto_20210330_0133', '2021-03-29 20:03:17.960537'),
(36, 'HAVE_eCommerce', '0003_auto_20210330_0139', '2021-03-29 20:09:17.852921'),
(37, 'HAVE_eCommerce', '0004_auto_20210330_0740', '2021-03-30 02:10:56.282224'),
(38, 'HAVE_eCommerce', '0002_auto_20210330_1501', '2021-03-30 09:31:29.631924');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('h3gpne2cea66xbc5pn4kw8915az729hx', 'e30:1lQo89:sOoWOjcvGiCKSLyf6_c8UEak6Ipv5yLnCnhcYDQLR50', '2021-04-12 09:24:17.493401'),
('zncznnikeinyn571cwdto8aopb8nzf6v', 'e30:1lQoBd:TIdmsm8fm2VtN2ssTmkFfLmIfEOohOLHDULGNRl0x5I', '2021-04-12 09:27:53.250957'),
('7r72mkv4mcwtb47mah7ltcwvr39xpq64', 'e30:1lQovf:j8cPaJUpgE-CUo6nBGk3mbuZTunAFoXielKd4fJn2T4', '2021-04-12 10:15:27.185670'),
('2mjjyilhbmjai0uirmxs1fxcwo6e8x4q', '.eJxVjDsOwjAUBO_iGlkvfo5jU9LnDJY_Cw4gR4qTCnF3iJQC2p2ZfQkftrX4rWHxUxZnoaw4_Y4xpAfqTvI91Nss01zXZYpyV-RBmxznjOflcP8OSmjlW4MMWzeYPuouIDFbBQZ1GtAR9qoVoiMFB0ps-8zMDgaGBqIYrBPvD_4IN7E:1lR319:s1Ae2NpQwsMxb92OiPcBnVeIOU7-kBO8wpBaWe3bTic', '2021-04-13 01:18:03.741511'),
('gozg0buc45xo28eoa16gydcedckxd7og', '.eJyrVorPTS0uTkxPLVayUoqOjlGKj88qzs-DicYo6RjomBjoxCgF5KQmFqcqJOcXFaUmlyiUZKQqpBYV5RcpJKXm5JfrxSjF6ozqHlG6Y5VqAUxkxJw:1lQqA6:BTbohdCoZOUq2nwTUEbZazaW3YWpQm06sNuOH3XXj48', '2021-04-12 11:34:26.007107'),
('e53rvpiop3a3r063o963cztpseslvx4k', '.eJxVjM0OwiAQhN-FsyErCwIevfcZyC4_UjU0Ke3J-O62SQ96m8z3zbxFoHWpYe15DmMSV6GMOP2WTPGZ207Sg9p9knFqyzyy3BV50C6HKeXX7XD_Dir1uq0ZyJHzhJaUgqLZbgE0wgU1ImTlQaWzNWhIR-uL52iNy5i1Y1d0Ep8v5A03Qw:1lQtnn:TTk1722WNIAyJ6DlTlgKbSVdYh096GX2FOk0OkenL_A', '2021-04-12 15:27:39.823418');

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_belongsto`
--

DROP TABLE IF EXISTS `have_ecommerce_belongsto`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_belongsto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teamID_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `HAVE_eCommerce_belongsto_CustomerID_id_04e5dd68` (`user_id`),
  KEY `HAVE_eCommerce_belongsto_teamID_id_2890f286` (`teamID_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_customer`
--

DROP TABLE IF EXISTS `have_ecommerce_customer`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_customer` (
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `pincode` int(11) DEFAULT NULL,
  `phone1` varchar(31) NOT NULL,
  `phone2` varchar(31) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `dateCreated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `have_ecommerce_customer`
--

INSERT INTO `have_ecommerce_customer` (`user_id`, `firstName`, `lastName`, `addressLine1`, `addressLine2`, `city`, `state`, `country`, `pincode`, `phone1`, `phone2`, `email`, `dateCreated`) VALUES
('25', 'Abhinav', 'Bohra', 'A-66 Sun Breeze Towers', 'Gurukul Road, Memnagar', 'Ahmedabad', 'Gujarat', 'India', 380052, '+19775523111', '968761742', 'abhinavbohra09@gmail.com', '2021-03-17 00:00:00.000000'),
('31', 'Animesh', 'Jain', 'B-34, Sky Lines Appartments', 'Thaltej Road', 'Indore', 'Madhya Pradesh', 'India', 344908, '+19387675645', '+19387625645', 'animeshjain@gmail.com', '2021-03-30 09:14:39.411029'),
('32', 'Suryansh', 'Kumar', 'A-305, Park Avenue Street', 'Opposite A-One School', 'Patna', 'Bihar', 'India', 678032, '+19687617410', '+19775523444', 'skumar@gmail.com', '2021-03-30 09:29:07.066703'),
('37', 'Abhinav', 'Bohra', 'A-66, Sun Breeze Towers', 'Gurukul Road, Memnagar', 'Indore', 'Gujarat', 'India', 380052, '+19775523111', '+19925017410', 'abhinavbohra01@gmail.com', '2021-03-30 10:25:29.511390');

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_delivery_details`
--

DROP TABLE IF EXISTS `have_ecommerce_delivery_details`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_delivery_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_departure` datetime(6) NOT NULL,
  `address` varchar(500) NOT NULL,
  `date_of_arrival` datetime(6) NOT NULL,
  `delivery_status` varchar(10) NOT NULL,
  `driverID_id` varchar(20) DEFAULT NULL,
  `transactionID_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `HAVE_eCommerce_delivery_details_driverID_id_7b61b7a6` (`driverID_id`),
  KEY `HAVE_eCommerce_delivery_details_transactionID_id_d7b70668` (`transactionID_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `have_ecommerce_delivery_details`
--

INSERT INTO `have_ecommerce_delivery_details` (`id`, `date_of_departure`, `address`, `date_of_arrival`, `delivery_status`, `driverID_id`, `transactionID_id`) VALUES
(38, '2021-03-30 16:00:23.759752', 'A-66, Sun Breeze Towers, Gurukul Road, Memnagar, Ahmedabad, Gujarat, India - 380052', '2021-04-04 16:00:23.759752', 'NULL', NULL, '61'),
(37, '2021-03-30 15:59:17.728312', 'A-66, Sun Breeze Towers, Gurukul Road, Memnagar, Ahmedabad, Gujarat, India - 380052', '2021-04-04 15:59:17.728312', 'NULL', NULL, '60'),
(36, '2021-03-30 15:44:53.935806', 'A-66 Sun Breeze Towers, Gurukul Road, Memnagar, Ahmedabad, Gujarat, India - 380052', '2021-04-04 15:44:53.935806', 'NULL', NULL, '58'),
(35, '2021-03-30 15:44:23.702230', 'A-66 Sun Breeze Towers, Gurukul Road, Memnagar, Ahmedabad, Gujarat, India - 380052', '2021-04-04 15:44:23.702230', 'NULL', NULL, '57'),
(34, '2021-03-30 15:41:11.900961', 'A-66, Sun Breeze Towers, Gurukul Road, Memnagar, Ahmedabad, Gujarat, India - 380052', '2021-04-04 15:41:11.900961', 'NULL', NULL, '56'),
(33, '2021-03-30 15:38:50.834285', 'A-66, Sun Breeze Towers, Gurukul Road, Memnagar, Ahmedabad, Gujarat, India - 380052', '2021-04-04 15:38:50.834285', 'NULL', NULL, '55'),
(32, '2021-03-30 15:07:13.946713', 'A-315, Park Avenue Street, Opposite A-One School, Patna, Bihar, India - 678032', '2021-04-04 15:07:13.946713', 'NULL', NULL, '54'),
(31, '2021-03-30 15:03:45.521820', 'A-315, Park Avenue Street, Opposite A-One School, Patna, Bihar, India - 678032', '2021-04-04 15:03:45.521820', 'NULL', NULL, '53'),
(30, '2021-03-30 14:57:06.517427', 'B-34, Sky Lines Appartments, Thaltej Road, Indore, Madhya Pradesh, India - 344908', '2021-04-04 14:57:06.517427', 'NULL', NULL, '52'),
(29, '2021-03-30 14:56:36.209312', 'B-34, Sky Lines Appartments, Thaltej Road, Indore, Madhya Pradesh, India - 344908', '2021-04-04 14:56:36.209312', 'NULL', NULL, '51');

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_driver`
--

DROP TABLE IF EXISTS `have_ecommerce_driver`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_driver` (
  `driverID` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `phone1` int(11) NOT NULL,
  `hiringDate` datetime(6) DEFAULT NULL,
  `vehicle_no` varchar(10) NOT NULL,
  PRIMARY KEY (`driverID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_metakeyword`
--

DROP TABLE IF EXISTS `have_ecommerce_metakeyword`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_metakeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metaKeyword` varchar(20) NOT NULL,
  `productID_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `HAVE_eCommerce_metakeyword_productID_id_6e6096a1` (`productID_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `have_ecommerce_metakeyword`
--

INSERT INTO `have_ecommerce_metakeyword` (`id`, `metaKeyword`, `productID_id`) VALUES
(2, 'puma', '1'),
(3, 'X100', '1'),
(4, 'sneaker', '1'),
(5, 'shirt', '2'),
(6, 'US', '2'),
(7, 'polo', '2'),
(8, 'tee', '2'),
(9, 'Pro', '3'),
(10, '12', '3'),
(11, 'iphone', '3'),
(12, 'apple', '3'),
(13, 'max', '3'),
(14, 'mobile', '3'),
(15, 'light', '4'),
(16, 'spanger', '4'),
(17, 'jeans', '4'),
(18, 'trousers', '4'),
(19, 'lewis', '4'),
(20, 'denim', '4'),
(21, '745', '5'),
(22, 'titan', '5'),
(23, 'watch', '5'),
(24, 'dell', '6'),
(25, 'laptop', '6'),
(26, 'computer', '6'),
(27, 'pc', '6'),
(28, 'television', '7'),
(29, 'bravia', '7'),
(30, 'sony', '7'),
(31, 'phone', '8'),
(32, 'mobile', '8'),
(33, 'V9', '8'),
(34, 'vivo', '8'),
(35, 'speakers', '9'),
(36, 'headphone', '9'),
(37, 'JBL', '9'),
(38, 'speakers', '10'),
(39, 'headphone', '10'),
(40, 'Bose', '10'),
(41, 'eatables', '11'),
(42, 'butter', '11'),
(43, 'eatables', '12'),
(44, 'bread', '12'),
(45, 'eatables', '13'),
(46, 'jam', '13'),
(47, 'chips', '14'),
(48, 'lays', '14'),
(49, 'cookies', '15'),
(50, 'harpic', '16'),
(51, 'cleaner', '16'),
(52, 'cleaner', '17'),
(53, 'domex', '17'),
(54, 'colgate', '18'),
(55, 'toothpaste', '18'),
(56, 'adidas', '19'),
(57, 'flex', '19'),
(58, 'manyavar', '20'),
(59, 'wedding', '20'),
(60, 'kurta', '20'),
(61, 'men\'s', '20'),
(62, 'ethnix', '21'),
(63, 'nehru', '21'),
(64, 'jacket', '21'),
(65, 'lee', '22'),
(66, 'denim', '22'),
(67, 'jacket', '22'),
(68, 'alphonso', '23'),
(69, 'mango', '23'),
(70, 'fruit', '23'),
(71, 'prestige', '24'),
(72, 'frying', '24'),
(73, 'pan', '24'),
(74, 'cello', '25'),
(75, 'cleaning', '25'),
(76, 'mop', '25');

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_order`
--

DROP TABLE IF EXISTS `have_ecommerce_order`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_order` (
  `orderID` int(20) NOT NULL AUTO_INCREMENT,
  `cost` double NOT NULL,
  `dateCreated` datetime(6) DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productID_id` varchar(20) NOT NULL,
  `transactionID_id` varchar(20) NOT NULL,
  `orderType` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `teamID_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `HAVE_eCommerce_order_customerID_id_5948b8d5` (`user_id`),
  KEY `HAVE_eCommerce_order_productID_id_bce4b748` (`productID_id`),
  KEY `HAVE_eCommerce_order_transactionID_id_aa056a3d` (`transactionID_id`),
  KEY `HAVE_eCommerce_order_teamID_id_27f49fa2` (`teamID_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `have_ecommerce_order`
--

INSERT INTO `have_ecommerce_order` (`orderID`, `cost`, `dateCreated`, `user_id`, `productID_id`, `transactionID_id`, `orderType`, `status`, `teamID_id`) VALUES
(49, 1100, '2021-03-30 10:30:23.747408', '37', '25', '61', 'TEAM', 'TEAM IN PROGRESS', '5'),
(47, 3900, '2021-03-30 10:14:53.933811', '25', '4', '58', 'INDIVIDUAL', 'DELIVERY IN PROGRESS', NULL),
(48, 100, '2021-03-30 10:29:17.715628', '37', '11', '60', 'INDIVIDUAL', 'DELIVERY IN PROGRESS', NULL),
(46, 3500, '2021-03-30 10:14:23.699237', '25', '4', '57', 'TEAM', 'TEAM IN PROGRESS', '2'),
(45, 1200, '2021-03-30 10:11:11.898965', '36', '25', '56', 'INDIVIDUAL', 'DELIVERY IN PROGRESS', NULL),
(44, 60, '2021-03-30 10:08:50.831258', '36', '15', '55', 'TEAM', 'TEAM IN PROGRESS', '4'),
(43, 120, '2021-03-30 09:37:13.927860', '34', '13', '54', 'INDIVIDUAL', 'DELIVERY IN PROGRESS', NULL),
(42, 1000, '2021-03-30 09:33:45.503005', '34', '2', '53', 'TEAM', 'TEAM IN PROGRESS', '3'),
(40, 3500, '2021-03-30 09:26:36.196264', '31', '4', '51', 'TEAM', 'TEAM IN PROGRESS', '2'),
(41, 30, '2021-03-30 09:27:06.504128', '31', '12', '52', 'INDIVIDUAL', 'DELIVERY IN PROGRESS', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_product`
--

DROP TABLE IF EXISTS `have_ecommerce_product`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_product` (
  `productID` varchar(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `category` varchar(32) NOT NULL,
  `description` varchar(200) NOT NULL,
  `stock` int(11) NOT NULL,
  `individual_price` double NOT NULL,
  `bulk_price` double NOT NULL,
  `req_team_size` int(11) NOT NULL,
  `dateCreated` datetime(6) DEFAULT NULL,
  `datePublised` datetime(6) DEFAULT NULL,
  `webStatus` tinyint(1) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `paymentMode` varchar(32) NOT NULL,
  `subcategory` varchar(32) NOT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `have_ecommerce_product`
--

INSERT INTO `have_ecommerce_product` (`productID`, `name`, `category`, `description`, `stock`, `individual_price`, `bulk_price`, `req_team_size`, `dateCreated`, `datePublised`, `webStatus`, `image`, `paymentMode`, `subcategory`) VALUES
('12', 'Bread', 'Grocery', 'white bread', 299, 30, 10, 50, NULL, NULL, 1, 'products/12.jpg', 'Wallet', 'Packed'),
('11', 'Amul Butter', 'Grocery', 'butter,amul', 199, 100, 50, 40, NULL, NULL, 1, 'products/11.jpg', 'Wallet', 'FMCG'),
('10', 'Amazon Echo', 'Electronics', 'Alexa,echo,amazon', 40, 8000, 7000, 10, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/10.jpg', 'Wallet', 'Smart Speakers'),
('9', 'JBL JX20 Headphones', 'Electronics', 'Headphones,JBL', 60, 7000, 6500, 25, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/9.jpg', 'Wallet', 'Headphones'),
('8', 'Vivo V9', 'Electronics', 'Vivo,V9', 150, 15000, 12000, 30, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/8.jpg', 'Wallet', 'Smartphone'),
('7', 'Sony Bravia', 'Electronics', 'OLED,TV,Sony,Bravia', 29, 70000, 60000, 10, NULL, NULL, 1, 'products/7.jpg', 'Wallet', 'TV'),
('6', 'Dell XPS', 'Electronics', 'dell,laptop,core i7,12 GB RAM,512 GB SSD Storage', 60, 110000, 104000, 10, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/6.jpg', 'Wallet', 'Laptop'),
('5', 'Titan 745', 'Fashion', 'titan, watch', 40, 7800, 7500, 15, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/5.jpg', 'Wallet', 'Watch'),
('4', 'Levi\'s Spanger Jeans ', 'Fashion', 'levis,jeans,spanger', 1, 3900, 3500, 3, NULL, NULL, 1, 'products/4.jpg', 'Wallet', 'Jeans'),
('3', 'Apple iPhone 12 Pro Max', 'Electronics', 'iphone, apple, smartphone', 2, 125000, 115000, 10, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/3.jpg', 'Wallet', 'Smartphone'),
('2', 'US Polo Shirt', 'Fashion', 'polo shirt, us polo, usp, tshirt', 9, 1200, 1000, 5, NULL, NULL, 1, 'products/2.jpg', 'Wallet', 'Tshirt'),
('1', 'Puma X100', 'Fashion', 'shoes, puma, fashion', 100, 6000, 4500, 20, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/1.jpg', 'Wallet', 'Shoes'),
('13', 'Kissan Mixed Fruit Jam', 'Grocery', 'kissan, jam,mixed fruit', 89, 120, 100, 10, NULL, NULL, 1, 'products/13.jpg', 'Wallet', 'Packed'),
('14', 'Lays', 'Grocery', 'lay\'s,potato chips', 100, 20, 12, 20, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/14.jpg', 'Wallet', 'FMCG'),
('15', 'Cookies', 'Grocery', 'bake\'n\'shake,cookies', 90, 100, 60, 30, NULL, NULL, 1, 'products/15.jpg', 'Wallet', 'FMCG'),
('16', 'Harpic', 'Home Essentials', 'Harpic,toilet cleaner', 76, 170, 150, 10, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/16.jpg', 'Wallet', 'Cleaning Essentials'),
('17', 'Domex', 'Home Essentials', 'domex,floor cleaner', 30, 205, 195, 5, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/17.jpg', 'Wallet', 'Cleaning Essentials'),
('18', 'Colgate Max Fresh', 'Home Essentials', 'colgate, toothpaste', 5, 20, 5, 40, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/18.jpg', 'Wallet', 'Toothpaste'),
('19', 'Adidas Flex', 'Fashion', 'shoes, adidas', 70, 14000, 12000, 30, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/19.jpg', 'Wallet', 'Shoes'),
('20', 'Manyavar Men\'s Wedding Kurta', 'Fashion', 'manyavar,kurta,wedding', 50, 15000, 12500, 25, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/20.jpg', 'Wallet', 'Traditional'),
('21', 'Ethnix Nehru Jacket ', 'Fashion', 'raymonds,ethnix,nehru jacket', 40, 3500, 3000, 20, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/21.jpg', 'Wallet', 'Traditional'),
('22', 'Lee Denim Jacket', 'Fashion', 'lee,jacket, denim', 50, 5500, 4800, 25, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/22.jpg', 'Wallet', 'Jacket'),
('23', 'Alphonso Mango 1 KG ', 'Grocery', 'mango,alphonso', 100, 550, 300, 50, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/23.jpg', 'Wallet', 'Fruit'),
('24', 'Prestige Frying Pan', 'Home Essentials', 'prestige,frying pan', 30, 6000, 5500, 30, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 'products/24.jpg', 'Wallet', 'Kitchen'),
('25', 'Cello Cleaning Mop', 'Home Essentials', 'mop,cello', 38, 1200, 1100, 10, NULL, NULL, 1, 'products/25.jpg', 'Wallet', 'Cleaning Essentials');

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_sells`
--

DROP TABLE IF EXISTS `have_ecommerce_sells`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_sells` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productID_id` varchar(20) NOT NULL,
  `supplierID_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `HAVE_eCommerce_sells_productID_id_76336cf5` (`productID_id`),
  KEY `HAVE_eCommerce_sells_supplierID_id_29e72551` (`supplierID_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_supplier`
--

DROP TABLE IF EXISTS `have_ecommerce_supplier`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_supplier` (
  `supplierID` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `GSTINNum` varchar(20) NOT NULL,
  `companyname` varchar(20) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `pincode` int(11) DEFAULT NULL,
  `phone1` varchar(31) NOT NULL,
  `phone2` varchar(31) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `profileImg` varchar(100) DEFAULT NULL,
  `dateCreated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`supplierID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_team`
--

DROP TABLE IF EXISTS `have_ecommerce_team`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_team` (
  `teamID` varchar(20) NOT NULL,
  `team_size` int(11) NOT NULL,
  `productID_id` varchar(20) NOT NULL,
  PRIMARY KEY (`teamID`),
  KEY `HAVE_eCommerce_team_productID_id_58290f6c` (`productID_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `have_ecommerce_team`
--

INSERT INTO `have_ecommerce_team` (`teamID`, `team_size`, `productID_id`) VALUES
('5', 1, '25'),
('4', 1, '15'),
('3', 1, '2'),
('2', 3, '4'),
('1', 1, '26');

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_transaction`
--

DROP TABLE IF EXISTS `have_ecommerce_transaction`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_transaction` (
  `transactionID` int(20) NOT NULL AUTO_INCREMENT,
  `total_amount` double NOT NULL,
  `dateCreated` datetime(6) DEFAULT NULL,
  `walletID_id` int(11) NOT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `HAVE_eCommerce_transaction_walletID_id_4562a34d` (`walletID_id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `have_ecommerce_transaction`
--

INSERT INTO `have_ecommerce_transaction` (`transactionID`, `total_amount`, `dateCreated`, `walletID_id`) VALUES
(52, 30, '2021-03-30 09:27:06.485466', 2),
(51, 3500, '2021-03-30 09:26:36.168555', 2),
(53, 1000, '2021-03-30 09:33:45.464282', 4),
(54, 120, '2021-03-30 09:37:13.886454', 4),
(55, 60, '2021-03-30 10:08:50.815336', 6),
(56, 1200, '2021-03-30 10:11:11.893981', 6),
(57, 3500, '2021-03-30 10:14:23.687276', 1),
(58, 3900, '2021-03-30 10:14:53.924836', 1),
(59, 3500, '2021-03-30 10:15:06.367319', 1),
(60, 100, '2021-03-30 10:29:17.680312', 7),
(61, 1100, '2021-03-30 10:30:23.691530', 7);

-- --------------------------------------------------------

--
-- Table structure for table `have_ecommerce_wallet`
--

DROP TABLE IF EXISTS `have_ecommerce_wallet`;
CREATE TABLE IF NOT EXISTS `have_ecommerce_wallet` (
  `walletID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`walletID`),
  KEY `HAVE_eCommerce_wallet_customerID_id_91e4c59e` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `have_ecommerce_wallet`
--

INSERT INTO `have_ecommerce_wallet` (`walletID`, `balance`, `user_id`) VALUES
(1, 9989100, '25'),
(2, 1470, '31'),
(4, 4573, '34'),
(5, 4686, '35'),
(6, 1948, '36'),
(7, 935, '37');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
