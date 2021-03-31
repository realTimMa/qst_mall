/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17-log : Database - market
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`market` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `market`;

/*Table structure for table `tb_admin_user` */

DROP TABLE IF EXISTS `tb_admin_user`;

CREATE TABLE `tb_admin_user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_admin_user` */

insert  into `tb_admin_user`(`username`,`password`) values ('111','111');

/*Table structure for table `tb_good` */

DROP TABLE IF EXISTS `tb_good`;

CREATE TABLE `tb_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(50) DEFAULT NULL,
  `good_price` float DEFAULT NULL,
  `good_store` int(11) DEFAULT NULL,
  `sale_num` int(11) DEFAULT '0',
  `picture` varchar(50) DEFAULT NULL,
  `detail` text,
  `goods_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`goods_type_id`),
  CONSTRAINT `id` FOREIGN KEY (`goods_type_id`) REFERENCES `tb_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_good` */

insert  into `tb_good`(`id`,`good_name`,`good_price`,`good_store`,`sale_num`,`picture`,`detail`,`goods_type_id`) values (5,'RAX头层牛皮户外鞋 男防滑登山鞋',566,9987,13,'/IDEA(work)/good-img/img06.png','RAX头层牛皮户外鞋 男防滑登山鞋',1),(6,'欧美大牌五分袖收腰显瘦睫毛蕾丝',899,688,12,'/IDEA(work)/good-img/img08.png','欧美大牌五分袖收腰显瘦睫毛蕾丝',2),(8,'童装',300,800,0,'/IDEA(work)/good-img/img10.png','这是童装这是童装这是童装这是童装这是童装这是童装',3);

/*Table structure for table `tb_goods_type` */

DROP TABLE IF EXISTS `tb_goods_type`;

CREATE TABLE `tb_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) DEFAULT NULL,
  `release_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `audit_status` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_goods_type` */

insert  into `tb_goods_type`(`id`,`typename`,`release_time`,`audit_status`) values (1,'男装','2020-06-08 00:00:00',1),(2,'女装','2020-06-03 16:09:47',1),(3,'童装','2020-06-03 16:09:45',1),(4,'电脑','2020-06-04 00:00:00',0);

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `tb_order` */

insert  into `tb_order`(`order_id`,`user_id`,`good_id`,`num`,`total_price`,`status`) values (16,5,5,1,566,0),(17,5,5,1,566,0),(18,5,5,5,2830,1),(19,5,6,2,1798,1),(20,5,6,8,7192,1),(21,6,6,2,1798,1),(22,5,5,5,2830,1);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(50) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`real_name`,`picture`,`sex`,`phone`,`password`,`address`) values (5,'tim','/IDEA(work)/user/d02.png',1,'17899998888','123456',NULL),(6,'ma','/IDEA(work)/user/dp.png',0,'17888889999','123456','aaaaaa');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
