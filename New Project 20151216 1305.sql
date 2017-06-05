-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.37-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema jspdao1216
--

CREATE DATABASE IF NOT EXISTS jspzuopin1;
USE jspzuopin1;

--
-- Definition of table `loginfo`
--

DROP TABLE IF EXISTS `loginfo`;
CREATE TABLE `loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loginfo`
--

/*!40000 ALTER TABLE `loginfo` DISABLE KEYS */;
INSERT INTO `loginfo` (`id`,`userid`,`logintime`) VALUES 
 (1,'admin','2015-11-18 18:11:06'),
 (2,'admin','2015-11-18 18:11:32'),
 (3,'admin','2015-11-18 20:43:34'),
 (4,'admin','2015-11-18 20:52:48'),
 (5,'admin','2015-11-18 20:57:21'),
 (6,'admin','2015-11-18 21:08:11'),
 (7,'admin','2015-11-18 21:30:23'),
 (8,'admin','2015-11-19 08:56:12'),
 (9,'admin','2015-11-19 12:51:14'),
 (10,'admin','2015-11-20 00:00:26'),
 (11,'admin','2015-11-21 12:29:22'),
 (12,'admin','2015-11-21 13:18:19'),
 (13,'admin','2015-11-21 13:20:11'),
 (14,'admin','2015-11-22 20:41:05'),
 (15,'admin','2015-11-29 10:40:58'),
 (16,'admin','2015-11-29 11:01:56'),
 (17,'admin','2015-11-29 11:04:50'),
 (18,'admin','2015-11-29 11:49:41'),
 (19,'admin','2015-11-29 14:58:28'),
 (20,'admin','2015-11-30 00:36:51'),
 (21,'admin','2015-11-30 20:47:49'),
 (22,'admin','2015-12-06 14:07:03'),
 (23,'admin','2015-12-06 14:20:51'),
 (24,'admin','2015-12-06 14:21:36'),
 (25,'admin','2015-12-06 14:24:05'),
 (26,'admin','2015-12-06 14:39:24'),
 (27,'admin','2015-12-06 14:41:39'),
 (28,'admin','2015-12-06 14:43:58'),
 (29,'admin','2015-12-06 15:51:25'),
 (30,'admin','2015-12-06 16:03:02'),
 (31,'admin','2015-12-08 16:51:26'),
 (32,'admin','2015-12-08 17:05:00'),
 (33,'admin','2015-12-09 00:07:21'),
 (34,'admin','2015-12-09 10:06:30'),
 (35,'admin','2015-12-09 10:12:20'),
 (36,'admin','2015-12-09 10:13:25');
/*!40000 ALTER TABLE `loginfo` ENABLE KEYS */;


--
-- Definition of table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(300) DEFAULT NULL,
  `choiceA` varchar(100) DEFAULT NULL,
  `choiceB` varchar(100) DEFAULT NULL,
  `choiceC` varchar(100) DEFAULT NULL,
  `choiceD` varchar(100) DEFAULT NULL,
  `answer` varchar(4) DEFAULT NULL,
  `typeid` char(2) DEFAULT NULL,
  `categoryid` char(2) DEFAULT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`questionid`,`subject`,`choiceA`,`choiceB`,`choiceC`,`choiceD`,`answer`,`typeid`,`categoryid`) VALUES 
 (1,'ActionEvent??(     )','java.util','java.io ','java.awt','java.awt.event','d','01','01'),
 (2,'下述选项中不属于JDBC基本功能的是：','与数据库建立连接','提交SQL语句','数据库维护管理','处理查询结果','c','01','01'),
 (3,'mysql数据库的JDBC驱动程序类名及完整包路径为：','jdbc.driver.mysql.Driver','jdbc.com.driver.Driver','mysql.com.jdbc.Driver','com.mysql.jdbc.Driver','d','01','01'),
 (4,'执行完以下代码int[ ] x = new int[25]；后，以下哪项说明是正确的：','x[24]为0','x[24]未定义 ','x[25]为0 ','x[0]为空','a','01','01'),
 (5,'FileReader类在(     )包中','java.util','java.io ','java.awt ','java.lang','b','01','01'),
 (6,'ArrayList类在(     )包中','java.util','java.io ','java.awt ','java.lang','a','01','01'),
 (7,'(  )命令可以从文本文件的每一行中截取指定内容的数据。','cp','dd','fmt','cut','d','01','02'),
 (8,'改变文件所有者的命令为','chmod','touch','chown','cat','c','01','02'),
 (9,'在unix下以小圆点开头的文件名是','可执行文件','子目录','隐藏文件','当前目录','c','01','02'),
 (10,'下面（  ）命令可以删除一个用户并同时删除用户的主目录。','rmuser -r','deluser -r','userdel -r','usermgr -r','c','01','02');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


--
-- Definition of table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table` (
  `userid` varchar(20) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `level` char(2) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banji` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_table`
--

/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` (`userid`,`UserName`,`Password`,`email`,`level`,`photo`,`banji`) VALUES 
 ('20074071001','张三','c4ca4238a0b923820dcc509a6f75849b','3@126.com','02','/examnew2/upload/20084071103.jpg','1001'),
 ('20074071002','cde','c4ca4238a0b923820dcc509a6f75849b','1@163.com','02','c:/temp/20121015/20121015194055.JPG','1001'),
 ('20074071003','ert','c4ca4238a0b923820dcc509a6f75849b','1@163.com','01',NULL,'1001'),
 ('admin','ghi','c4ca4238a0b923820dcc509a6f75849b','2@tom.com','01',NULL,'1001'),
 ('1','ijk','c4ca4238a0b923820dcc509a6f75849b','3@126.com','02',NULL,'1001'),
 ('6','abc','c4ca4238a0b923820dcc509a6f75849b','1@163.com','02',NULL,'1001');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
