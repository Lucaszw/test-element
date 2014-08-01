# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.33)
# Database: lanilabs_development
# Generation Time: 2014-01-21 03:06:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_model_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `username`, `title`, `thumbnail`, `description`, `rating`, `created_at`, `updated_at`, `user_model_id`)
VALUES
	(1,'lucas','hi',NULL,'The regret on our side is, they used to say years ago, we are reading about you in science class. Now they say, we are reading about you in history class.\n\nWe want to explore. We’re curious people. Look back over history, people have put their lives at stake to go out and explore … We believe in what we’re doing. Now it’s time to go.\n',NULL,'2013-11-06 00:59:51','2013-11-06 00:59:51',25),
	(4,'lucaszw','This is a comment',NULL,'hi',NULL,'2013-11-07 23:03:09','2013-11-07 23:03:09',24),
	(5,'lucaszw','Your Model is Amazing!',NULL,'Very Cool!',NULL,'2014-01-18 02:39:52','2014-01-18 02:39:52',2);

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('0'),
	('20131102010100'),
	('20131102162506'),
	('20131102172410'),
	('20131102173128'),
	('20131102173914'),
	('20131105165440'),
	('20131106005913'),
	('20131110123650'),
	('20131110131734');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_models
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_models`;

CREATE TABLE `user_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sketchfab` text COLLATE utf8_unicode_ci,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sketchfab_id` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `user_models` WRITE;
/*!40000 ALTER TABLE `user_models` DISABLE KEYS */;

INSERT INTO `user_models` (`id`, `name`, `thumbnail`, `sketchfab`, `category`, `created_at`, `updated_at`, `user_id`, `sketchfab_id`, `description`)
VALUES
	(1,'hi',NULL,NULL,'hi','2013-11-14 13:30:17','2013-11-14 13:30:17',4,'af64945b1dfc4ab0b7f555f9456ea4a1','hi'),
	(2,'Lego',NULL,NULL,'Toys','2013-11-21 23:50:59','2013-11-21 23:50:59',4,'90e7ef459c6846eaa5b20a6fbc009cdc','None'),
	(3,'nexus4',NULL,NULL,'Phones','2014-01-11 04:48:11','2014-01-11 04:48:11',4,'caa326b5ec084042998dfb2a76779b1c','Something Awesome!'),
	(4,'VentMount',NULL,NULL,'Vents','2014-01-11 04:49:50','2014-01-11 04:49:50',4,'8dd7d7a017ac4ae6a5f881d79b736b82','Venters'),
	(5,'Pebble',NULL,NULL,'Accessories','2014-01-11 05:31:02','2014-01-11 05:31:02',4,'242305ca235f433b91f938451a36b439','For Pebble');

/*!40000 ALTER TABLE `user_models` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sketchfab_token` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `password`, `created_at`, `updated_at`, `sketchfab_token`)
VALUES
	(1,'testUsers','password','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(2,'tes',NULL,'2013-11-02 03:50:34','2013-11-02 03:50:34',NULL),
	(4,'lucaszw','reez','2013-11-02 03:51:18','2013-11-10 12:49:05','682fede400f04537bb7c3ca91743707d'),
	(5,'uteen','nonem','2013-11-02 03:51:36','2013-11-02 03:51:36',NULL),
	(6,'username','password','2013-11-02 06:05:50','2013-11-02 06:05:50',NULL),
	(7,'Abdullah','hallaba','2013-11-03 22:53:57','2013-11-03 22:53:57',NULL),
	(8,'randomperson','password','2013-11-06 03:48:50','2013-11-06 03:48:50',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
