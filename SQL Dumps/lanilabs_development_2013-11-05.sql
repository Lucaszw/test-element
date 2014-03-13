# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.33)
# Database: lanilabs_development
# Generation Time: 2013-11-06 01:17:47 +0000
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
	(1,'lucas','hi',NULL,'The regret on our side is, they used to say years ago, we are reading about you in science class. Now they say, we are reading about you in history class.\n\nWe want to explore. We’re curious people. Look back over history, people have put their lives at stake to go out and explore … We believe in what we’re doing. Now it’s time to go.\n',NULL,'2013-11-06 00:59:51','2013-11-06 00:59:51',25);

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
	('20131106005913');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `user_models` WRITE;
/*!40000 ALTER TABLE `user_models` DISABLE KEYS */;

INSERT INTO `user_models` (`id`, `name`, `thumbnail`, `sketchfab`, `category`, `created_at`, `updated_at`, `user_id`)
VALUES
	(24,'Maison','https://fbexternal-a.akamaihd.net/safe_image.php?d=AQBe3CjogAuCBBok&w=398&h=208&url=https%3A%2F%2Fd3iahq3akd4kx2.cloudfront.net%2Furls%2FdGUrytaktlDeNudCEGKk31oTJY%2F1365631200%2Fthumbnail_1024.png&cfs=1&upscale','<iframe frameborder=\"0\" height=\"480\" width=\"854\" allowFullScreen webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" src=\"http://sketchfab.com/k4ji3fd0b?autostart=0&transparent=0&autospin=0&controls=1\"></iframe> <p style=\"font-size: 13px; font-weight:normal; margin: 5px; color: #4a4a4a\"><strong><a style=\"color: #1caad9;\" href=\"http://sketchfab.com/show/dGUrytaktlDeNudCEGKk31oTJY\">Maison d\'artiste</a> from <a style=\"color: #1caad9;\" href=\"http://sketchfab.com/klaasnienhuis\">Klaas Nienhuis</a> on <a style=\"color: #1caad9;\" href=\"https://sketchfab.com\">Sketchfab</a>.</strong></p>','house','2013-11-03 20:48:57','2013-11-03 20:48:57',4),
	(25,'Test','http://www.hdwallpapersinn.com/wp-content/uploads/2013/03/img21.jpg','<iframe frameborder=\"0\" height=\"480\" width=\"854\" allowFullScreen webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" src=\"http://sketchfab.com/n5ji2fdc0?autostart=0&transparent=0&autospin=0&controls=1\"></iframe> <p style=\"font-size: 13px; font-weight:normal; margin: 5px; color: #4a4a4a\"><strong><a style=\"color: #1caad9;\" href=\"http://sketchfab.com/show/3cac9ec4cb384b6c862fb80224571706\">Nether Imp</a> from <a style=\"color: #1caad9;\" href=\"http://sketchfab.com/thomasdebons\">thomasdebons</a> on <a style=\"color: #1caad9;\" href=\"https://sketchfab.com\">Sketchfab</a>.</strong></p>','monster','2013-11-03 22:55:07','2013-11-03 22:55:07',7);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `password`, `created_at`, `updated_at`)
VALUES
	(1,'testUsers','password','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(2,'tes',NULL,'2013-11-02 03:50:34','2013-11-02 03:50:34'),
	(4,'lucas','reez','2013-11-02 03:51:18','2013-11-02 03:51:18'),
	(5,'uteen','nonem','2013-11-02 03:51:36','2013-11-02 03:51:36'),
	(6,'username','password','2013-11-02 06:05:50','2013-11-02 06:05:50'),
	(7,'Abdullah','hallaba','2013-11-03 22:53:57','2013-11-03 22:53:57');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
