/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.26-log : Database - chat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chat` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `chat`;

/*Table structure for table `content` */

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `chatid` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `content` */

insert  into `content`(`chatid`,`username`,`content`) values ('1','aa','aa'),('1','aa','您好'),('1','aa','哈哈'),('12','aa','哈哈'),('12','aa','哈哈'),('12','aa','俺俺'),('12','aa','嗯嗯'),('12','aa','nihao'),('1','aa','ee'),('12','aa','aa'),('12','aa','真好'),('12','aa','做完了!!');

/*Table structure for table `siliao` */

DROP TABLE IF EXISTS `siliao`;

CREATE TABLE `siliao` (
  `chatname` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `siliao` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `age` int(40) DEFAULT NULL,
  `sex` varchar(40) DEFAULT NULL,
  `hobby` varchar(40) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`age`,`sex`,`hobby`) values (1,'aa','123',21,'男','篮球'),(2,'bb','123',19,'女','化妆');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
