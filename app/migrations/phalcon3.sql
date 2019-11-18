/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;


CREATE DATABASE IF NOT EXISTS phalcon3;
USE phalcon3;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`
(
    `id`          int(10) unsigned NOT NULL AUTO_INCREMENT,
    `status`      tinyint(1)       DEFAULT '1',
    `name`        varchar(70)      NOT NULL,
    `gender`      char(10)         NOT NULL,
    `document`    char(14)         NOT NULL,
    `birthday`    date             NOT NULL,
    `observation` text,
    `created_at`  timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `email`;
CREATE TABLE `email`
(
    `id`          int(10) unsigned NOT NULL AUTO_INCREMENT,
    `status`      tinyint(1)       NOT NULL DEFAULT '1',
    `customer_id` int(10) unsigned          DEFAULT NULL,
    `email`       varchar(50)      NOT NULL,
    `created_at`  timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `FK_customer_id` (`customer_id`),
    CONSTRAINT `FK_email` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`
(
    `id`           int(10) unsigned                NOT NULL AUTO_INCREMENT,
    `status`       tinyint(1)                      NOT NULL DEFAULT '1',
    `customer_id`  int(10) unsigned                         DEFAULT NULL,
    `type`         enum ('principal','secundario') NOT NULL DEFAULT 'principal',
    `address`      varchar(150)                    NOT NULL,
    `number`       varchar(10)                     NOT NULL,
    `zipcode`      varchar(10)                     NOT NULL,
    `neighborhood` varchar(150)                    NOT NULL,
    `city`         varchar(150)                    NOT NULL,
    `state`        varchar(30)                              DEFAULT NULL,
    `complement`   varchar(255)                             DEFAULT NULL,
    `created_at`   timestamp                       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp                       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `FK_customer_id` (`customer_id`),
    CONSTRAINT `FK_customer_address` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo`
(
    `id`          int(11)         NOT NULL AUTO_INCREMENT,
    `status`      int(1) unsigned NOT NULL DEFAULT '1',
    `file_path`   text            NOT NULL,
    `customer_id` int(10) unsigned         DEFAULT NULL,
    `subtitle`    text,
    `created_at`  timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `FK_customer_id` (`customer_id`),
    CONSTRAINT `FK_customer_photo` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;



DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone`
(
    `id`          int(10) unsigned                                    NOT NULL AUTO_INCREMENT,
    `status`      tinyint(1)                                          NOT NULL DEFAULT '1',
    `customer_id` int(10) unsigned                                             DEFAULT NULL,
    `number`      varchar(15)                                         NOT NULL,
    `type`        enum ('celular','residencial','comercial','recado') NOT NULL,
    `created_at`  timestamp                                           NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp                                           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `FK_customer_id` (`customer_id`),
    CONSTRAINT `FK_customer_phone` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`         int(10) unsigned NOT NULL AUTO_INCREMENT,
    `status`     tinyint(1)       NOT NULL DEFAULT '1',
    `username`   varchar(20)      NOT NULL,
    `password`   varchar(255)     NOT NULL,
    `created_at` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS `roles` (
                                       `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                       `name` varchar(32) NOT NULL,
                                       `description` varchar(255) NOT NULL,
                                       PRIMARY KEY  (`id`),
                                       UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `roles` (`id`, `name`, `description`) VALUES(1, 'login', 'Login privileges, granted after account confirmation');
INSERT INTO `roles` (`id`, `name`, `description`) VALUES(2, 'admin', 'Administrative user, has access to everything.');

CREATE TABLE IF NOT EXISTS `roles_users` (
                                             `user_id` int(10) UNSIGNED NOT NULL,
                                             `role_id` int(10) UNSIGNED NOT NULL,
                                             PRIMARY KEY  (`user_id`,`role_id`),
                                             KEY `fk_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `users` (
                                       `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                       `email` varchar(254) NOT NULL,
                                       `username` varchar(32) NOT NULL DEFAULT '',
                                       `password` varchar(64) NOT NULL,
                                       `logins` int(10) UNSIGNED NOT NULL DEFAULT '0',
                                       `last_login` int(10) UNSIGNED,
                                       PRIMARY KEY  (`id`),
                                       UNIQUE KEY `uniq_username` (`username`),
                                       UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user_tokens` (
                                             `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                             `user_id` int(11) UNSIGNED NOT NULL,
                                             `user_agent` varchar(40) NOT NULL,
                                             `token` varchar(40) NOT NULL,
                                             `created` int(10) UNSIGNED NOT NULL,
                                             `expires` int(10) UNSIGNED NOT NULL,
                                             PRIMARY KEY  (`id`),
                                             UNIQUE KEY `uniq_token` (`token`),
                                             KEY `fk_user_id` (`user_id`),
                                             KEY `expires` (`expires`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

ALTER TABLE `roles_users`
    ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

ALTER TABLE `user_tokens`
    ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;




/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;

