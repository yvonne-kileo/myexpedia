/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - expediaflightbookings
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expediaflightbookings` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `expediaflightbookings`;

/*Table structure for table `airline` */

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airlinename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airline` */

insert  into `airline`(`id`,`airlinename`) values 
(1,'Kenya Airways'),
(2,'Uganda Airlines'),
(3,'Precision Air'),
(4,'Daallo Airlines'),
(5,'Air Burundi'),
(6,'RwandAir'),
(7,'Eritrean Airlines'),
(8,'EgyptAir'),
(9,'Badr Airlines'),
(10,'Congo Airways');

/*Table structure for table `airport` */

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `airportname` varchar(100) NOT NULL,
  `cityid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cityid` (`cityid`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airport` */

insert  into `airport`(`id`,`code`,`airportname`,`cityid`) values 
(12,'Jomo Kenya','1',1),
(13,'Moi Intern','2',1),
(14,'Entebbe In','3',2),
(15,'Julius Nye','4',3),
(16,'Aden Adde ','5',4),
(17,'Bujumbura ','6',5),
(18,'Kigali Int','7',6),
(19,'Asmara Int','8',7),
(20,'Cairo Inte','9',8),
(21,'Khartoum I','10',9),
(22,'N’djili In','11',10),
(23,'NBO','Jomo Kenyatta International Airport',1),
(24,'EBB','Entebbe International Airport',2),
(25,'DAR','Julius Nyerere International Airport',3),
(26,'MGQ','Aden Adde International Airport',4),
(27,'BJM','Bujumbura International Airport',5),
(28,'KGL','Kigali International Airport',6),
(29,'ASM','Asmara International Airport',7),
(30,'CAI','Cairo International Airport',8),
(31,'KRT','Khartoum International Airport',9),
(32,'FIH','N’djili International Airport',10);

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookingtypeid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `flightid` int(11) NOT NULL,
  `bookingdate` date NOT NULL,
  `paymentmethod` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookingtypeid` (`bookingtypeid`),
  KEY `currencyid` (`currencyid`),
  KEY `flightid` (`flightid`),
  KEY `booking_ibfk_4` (`paymentmethod`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`bookingtypeid`) REFERENCES `bookingtype` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`currencyid`) REFERENCES `currencies` (`id`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`flightid`) REFERENCES `flightsupply` (`id`),
  CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`paymentmethod`) REFERENCES `paymentmethod` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking` */

insert  into `booking`(`id`,`bookingtypeid`,`currencyid`,`flightid`,`bookingdate`,`paymentmethod`) values 
(1,1,2,1,'2025-08-20',1),
(2,2,3,2,'2025-08-21',2),
(3,1,4,3,'2025-08-22',3),
(4,1,5,4,'2025-08-23',4),
(5,2,1,5,'2025-08-24',2),
(6,1,1,6,'2025-08-25',3),
(7,2,1,7,'2025-08-26',4),
(8,1,1,8,'2025-08-27',1),
(9,1,1,9,'2025-08-28',2),
(10,2,1,10,'2025-08-29',3);

/*Table structure for table `bookingclass` */

DROP TABLE IF EXISTS `bookingclass`;

CREATE TABLE `bookingclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingclass` */

insert  into `bookingclass`(`id`,`typename`) values 
(1,'Economy'),
(2,'Business'),
(3,'First class'),
(4,'Second class');

/*Table structure for table `bookingsupply` */

DROP TABLE IF EXISTS `bookingsupply`;

CREATE TABLE `bookingsupply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flightid` int(11) NOT NULL,
  `bookingclassid` int(11) NOT NULL,
  `numberofseats` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flightid` (`flightid`),
  KEY `bookingclassid` (`bookingclassid`),
  CONSTRAINT `bookingsupply_ibfk_1` FOREIGN KEY (`flightid`) REFERENCES `flightsupply` (`id`),
  CONSTRAINT `bookingsupply_ibfk_2` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingsupply` */

insert  into `bookingsupply`(`id`,`flightid`,`bookingclassid`,`numberofseats`,`price`,`currency`) values 
(6,1,1,100,300.00,'USD'),
(7,1,2,30,600.00,'USD'),
(8,2,1,120,200.00,'USD'),
(9,3,3,10,1200.00,'USD'),
(10,4,4,80,250.00,'USD');

/*Table structure for table `bookingtype` */

DROP TABLE IF EXISTS `bookingtype`;

CREATE TABLE `bookingtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookingname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingtype` */

insert  into `bookingtype`(`id`,`bookingname`) values 
(1,'One Way'),
(2,'Return'),
(3,'Multi-City');

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(100) NOT NULL,
  `countryid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `countryid` (`countryid`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `city` */

insert  into `city`(`id`,`cityname`,`countryid`) values 
(1,'Nairobi',1),
(2,'Mombasa',1),
(3,'Kisumu',1),
(4,'Kampala',2),
(5,'Entebbe',2),
(6,'Gulu',2),
(7,'Dar es Salaam',3),
(8,'Arusha',3),
(9,'Dodoma',3),
(10,'Mogadishu',4),
(11,'Hargeisa',4),
(12,'Kismayo',4),
(13,'Bujumbura',5),
(14,'Gitega',5),
(15,'Kigali',6),
(16,'Butare',6),
(17,'Asmara',7),
(18,'Massawa',7),
(19,'Cairo',8),
(20,'Alexandria',8),
(21,'Giza',8),
(22,'Khartoum',9),
(23,'Omdurman',9),
(24,'Port Sudan',9),
(25,'Kinshasa',10),
(26,'Lubumbashi',10),
(27,'Goma',10),
(28,'Nairobi',1),
(29,'Mombasa',1),
(30,'Kampala',2),
(31,'Entebbe',2),
(32,'Dar es Salaam',3),
(33,'Dodoma',3),
(34,'Kigali',4),
(35,'Bujumbura',5),
(36,'Mogadishu',6),
(37,'Asmara',7),
(38,'Cairo',8),
(39,'Khartoum',9),
(40,'Kinshasa',10);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `country` */

insert  into `country`(`id`,`countryname`) values 
(1,'Kenya'),
(2,'Uganda'),
(3,'Tanzania'),
(4,'Somalia'),
(5,'Burundi'),
(6,'Rwanda'),
(7,'Eritrea'),
(8,'Egypt'),
(9,'Sudan'),
(10,'Congo'),
(11,'Algeria');

/*Table structure for table `currencies` */

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currencyname` varchar(50) NOT NULL,
  `currencycode` varchar(10) NOT NULL,
  `isdefault` tinyint(1) DEFAULT 0,
  `exchangerate` decimal(10,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `currencies` */

insert  into `currencies`(`id`,`currencyname`,`currencycode`,`isdefault`,`exchangerate`) values 
(1,'US Dollar','USD',1,1.0000),
(2,'Kenyan Shilling','KES',0,0.0075),
(3,'Ugandan Shilling','UGX',0,0.0003),
(4,'Tanzanian Shilling','TZS',0,0.0004),
(5,'Rwandan Franc','RWF',0,0.0008);

/*Table structure for table `flightsupply` */

DROP TABLE IF EXISTS `flightsupply`;

CREATE TABLE `flightsupply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flightid` varchar(20) NOT NULL,
  `airlineid` int(11) NOT NULL,
  `departuretime` datetime NOT NULL,
  `departurecity` int(11) NOT NULL,
  `arrivaltime` datetime NOT NULL,
  `destinationcity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `airlineid` (`airlineid`),
  KEY `departurecity` (`departurecity`),
  KEY `destinationcity` (`destinationcity`),
  CONSTRAINT `flightsupply_ibfk_1` FOREIGN KEY (`airlineid`) REFERENCES `airline` (`id`),
  CONSTRAINT `flightsupply_ibfk_2` FOREIGN KEY (`departurecity`) REFERENCES `city` (`id`),
  CONSTRAINT `flightsupply_ibfk_3` FOREIGN KEY (`destinationcity`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightsupply` */

insert  into `flightsupply`(`id`,`flightid`,`airlineid`,`departuretime`,`departurecity`,`arrivaltime`,`destinationcity`) values 
(1,'KQ101',1,'2025-09-01 08:00:00',1,'2025-09-01 10:30:00',2),
(2,'UG202',2,'2025-09-02 14:00:00',2,'2025-09-02 16:00:00',3),
(3,'AT303',3,'2025-09-03 09:00:00',3,'2025-09-03 11:00:00',4),
(4,'RW404',4,'2025-09-04 07:30:00',4,'2025-09-04 09:30:00',5),
(5,'AB505',5,'2025-09-05 15:00:00',5,'2025-09-05 17:00:00',6),
(6,'JB606',6,'2025-09-06 10:00:00',6,'2025-09-06 12:30:00',7),
(7,'ER707',7,'2025-09-07 18:00:00',7,'2025-09-07 22:00:00',8),
(8,'EG808',8,'2025-09-08 20:00:00',8,'2025-09-09 01:00:00',1),
(9,'SD909',9,'2025-09-09 11:00:00',9,'2025-09-09 14:30:00',10),
(10,'CG010',10,'2025-09-10 06:30:00',10,'2025-09-10 09:30:00',1);

/*Table structure for table `gender` */

DROP TABLE IF EXISTS `gender`;

CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gendername` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `gender` */

insert  into `gender`(`id`,`gendername`) values 
(1,'Male'),
(2,'Female');

/*Table structure for table `identificationdocs` */

DROP TABLE IF EXISTS `identificationdocs`;

CREATE TABLE `identificationdocs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `identificationdocs` */

insert  into `identificationdocs`(`id`,`documentname`) values 
(1,'Passport'),
(2,'National ID'),
(3,'Driver’s License');

/*Table structure for table `passengermanifest` */

DROP TABLE IF EXISTS `passengermanifest`;

CREATE TABLE `passengermanifest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) NOT NULL,
  `bookingclassid` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `iddoc` int(11) NOT NULL,
  `passengername` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `genderid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookingid` (`bookingid`),
  KEY `bookingclassid` (`bookingclassid`),
  KEY `currencyid` (`currencyid`),
  KEY `iddoc` (`iddoc`),
  KEY `genderid` (`genderid`),
  CONSTRAINT `passengermanifest_ibfk_1` FOREIGN KEY (`bookingid`) REFERENCES `booking` (`id`),
  CONSTRAINT `passengermanifest_ibfk_2` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclass` (`id`),
  CONSTRAINT `passengermanifest_ibfk_3` FOREIGN KEY (`currencyid`) REFERENCES `currencies` (`id`),
  CONSTRAINT `passengermanifest_ibfk_4` FOREIGN KEY (`iddoc`) REFERENCES `identificationdocs` (`id`),
  CONSTRAINT `passengermanifest_ibfk_5` FOREIGN KEY (`genderid`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `passengermanifest` */

insert  into `passengermanifest`(`id`,`bookingid`,`bookingclassid`,`price`,`currencyid`,`iddoc`,`passengername`,`dob`,`genderid`) values 
(1,1,1,25000.00,2,2,'John Mwangi','1990-05-10',1),
(2,2,2,2200000.00,3,1,'Sarah Nansubuga','1988-09-15',2),
(3,3,1,400000.00,4,2,'Peter Joseph','1995-07-22',1),
(4,4,3,850000.00,5,1,'Claudine Uwimana','1985-12-01',2),
(5,5,1,300.00,1,3,'Ahmed Ali','1992-11-20',1),
(6,6,2,600.00,1,1,'Fatuma Mohamed','1998-04-05',2),
(7,7,1,280.00,1,2,'Samuel Tesfay','1987-07-12',1),
(8,8,3,1500.00,1,1,'Nour Hassan','1993-02-18',2),
(9,9,2,800.00,1,3,'Abdalla Osman','1980-03-25',1),
(10,10,1,300.00,1,2,'Grace Mbala','1997-09-09',2);

/*Table structure for table `paymentmethod` */

DROP TABLE IF EXISTS `paymentmethod`;

CREATE TABLE `paymentmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paymentmethod` */

insert  into `paymentmethod`(`id`,`paymentname`) values 
(1,'Credit Card'),
(2,'Mobile Money'),
(3,'Cash'),
(4,'Paypal');

/* Procedure structure for procedure `sp_checkairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairline`(IN p_airlinename VARCHAR(100))
BEGIN
	SELECT * FROM airline WHERE airlinename = p_airlinename;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairport`(IN p_airportname VARCHAR(100))
BEGIN
	SELECT * FROM airports WHERE airportname = p_airportname;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbooking`(IN p_flightid INT, IN p_bookingdate DATE)
BEGIN
	SELECT * FROM booking WHERE flightid = p_flightid AND bookingdate = p_bookingdate;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingclass`(IN p_typename VARCHAR(100))
BEGIN
	SELECT * FROM bookingclass WHERE typename = p_typename;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingsupply`(IN p_bookingsupplyid INT)
BEGIN
	SELECT * FROM bookingsupply 
    WHERE bookingsupplyid = p_bookingsupplyid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingtype`(IN p_bookingname VARCHAR(100))
BEGIN
	 SELECT * FROM bookingtype WHERE bookingname = p_bookingname;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcity`(IN p_cityname VARCHAR(100))
BEGIN
	SELECT * FROM country
	WHERE citynamename=p_cityname;


	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcountry`(IN p_countryname VARCHAR(100))
BEGIN
	SELECT * from country
	WHERE countryname=p_countryname;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcurrency`(IN p_currencycode VARCHAR(10))
BEGIN
	SELECT * FROM currency WHERE currencycode = p_currencycode;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflightsupply`(IN p_flightid INT, IN p_airlineid INT)
BEGIN
	SELECT * FROM flightsupply WHERE flightid = p_flightid AND airlineid = p_airlineid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkpaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkpaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkpaymentmethod`(IN p_paymentname VARCHAR(100))
BEGIN
	SELECT * FROM paymentmethod WHERE paymentname = p_paymentname;
	

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairline`(IN p_id INT)
BEGIN
	DELETE FROM airline WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairport`(IN p_id INT)
BEGIN
	DELETE FROM airport WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebooking`(IN p_id INT)
BEGIN
	DELETE FROM booking WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingclass`(IN p_id INT)
BEGIN
	DELETE FROM bookingclass WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingsupply`(IN p_id INT)
BEGIN
	DELETE FROM bookingsupply WHERE id = p_id;


	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingtype`(IN p_id INT)
BEGIN
	DELETE FROM bookingtype WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecity`(IN p_id INT)
BEGIN
	 DELETE FROM city WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecountry`(IN p_id INT)
BEGIN
	DELETE FROM country WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecurrency`(IN p_id INT)
BEGIN
	DELETE FROM currencies WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightsupply`(IN p_id INT)
BEGIN
	DELETE FROM flightsupply WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletegender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletegender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletegender`(IN p_id INT)
BEGIN
	 DELETE FROM gender WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteidentificationdocs` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteidentificationdocs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteidentificationdocs`(IN p_id INT)
BEGIN
	DELETE FROM identificationdocs WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepassengermanifest`(IN p_id INT)
BEGIN
	DELETE FROM passengermanifest WHERE id = p_id;


	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepaymentmethod`(IN p_id INT)
BEGIN
	DELETE FROM paymentmethod WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairline`(IN p_id INT)
BEGIN
	SELECT * FROM airline WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairport`(IN p_id INT)
BEGIN
	SELECT * FROM airport WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbooking`(IN p_id INT)
BEGIN
	SELECT * FROM booking WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingclass`(IN p_id INT)
BEGIN
	SELECT * FROM bookingclass WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingsupply`(IN p_id INT)
BEGIN
	SELECT * FROM bookingsupply WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtype`(IN p_id INT)
BEGIN
	SELECT * FROM bookingtype WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcity`(IN p_id INT)
BEGIN
	SELECT * FROM city WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountry`()
BEGIN

SELECT * FROM `country`
ORDER BY `countryname`;

END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrency`(IN p_id INT)
BEGIN
	SELECT * FROM currency WHERE id = p_id;
	

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightsupply`(IN p_id INT)
BEGIN
	SELECT * FROM flightsupply WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getgender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getgender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getgender`(IN p_id INT)
BEGIN
	SELECT * FROM gender WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getidentificationdocs` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getidentificationdocs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getidentificationdocs`(IN p_id INT)
BEGIN
	SELECT * FROM identificationdocs WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpassengermanifest`(IN p_id INT)
BEGIN
	SELECT * FROM passengermanifest WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpaymentmethod`(IN p_id INT)
BEGIN
	SELECT * FROM paymentmethod WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertairline`(IN p_airlinename VARCHAR(100))
BEGIN
	INSERT INTO airline (airlinename) VALUES (p_airlinename);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertairport`(IN p_code VARCHAR(10), IN p_airportname VARCHAR(100), IN p_cityid INT)
BEGIN
	INSERT INTO airport (code, airportname, cityid) VALUES (p_code, p_airportname, p_cityid);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertbooking`(
IN p_bookingtypeid INT,
    IN p_currencyid INT,
    IN p_flightid INT,
    IN p_bookingdate DATE,
    IN p_paymentmethod INT
)
BEGIN
	 INSERT INTO booking (bookingtypeid, currencyid, flightid, bookingdate, paymentmethod)
    VALUES (p_bookingtypeid, p_currencyid, p_flightid, p_bookingdate, p_paymentmethod);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertbookingclass`(IN p_typename VARCHAR(50))
BEGIN
	INSERT INTO bookingclass (typename) VALUES (p_typename);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertbookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertbookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertbookingsupply`(
IN p_flightid INT,
    IN p_bookingclassid INT,
    IN p_numberofseats INT,
    IN p_price DECIMAL(10,2),
    IN p_currency VARCHAR(10)
)
BEGIN
	INSERT INTO bookingsupply (flightid, bookingclassid, numberofseats, price, currency)
    VALUES (p_flightid, p_bookingclassid, p_numberofseats, p_price, p_currency);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertbookingtype`(IN p_bookingname VARCHAR(100))
BEGIN
	INSERT INTO bookingtype (bookingname) VALUES (p_bookingname);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertcity`(IN p_cityname VARCHAR(100), IN p_countryid INT)
BEGIN
	INSERT INTO city (cityname, countryid) VALUES (p_cityname, p_countryid);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertcurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertcurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertcurrency`(
IN p_currencyname VARCHAR(50),
    IN p_currencycode VARCHAR(10),
    IN p_isdefault BOOLEAN,
    IN p_exchangerate DECIMAL(10,4)
)
BEGIN
	INSERT INTO currencies (currencyname, currencycode, isdefault, exchangerate)
    VALUES (p_currencyname, p_currencycode, p_isdefault, p_exchangerate);


	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertflightsupply`(
IN p_flightid VARCHAR(20),
    IN p_airlineid INT,
    IN p_departuretime DATETIME,
    IN p_departurecity INT,
    IN p_arrivaltime DATETIME,
    IN p_destinationcity INT
)
BEGIN
	INSERT INTO flightsupply (flightid, airlineid, departuretime, departurecity, arrivaltime, destinationcity)
    VALUES (p_flightid, p_airlineid, p_departuretime, p_departurecity, p_arrivaltime, p_destinationcity);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertgender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertgender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertgender`(IN p_gendername VARCHAR(10))
BEGIN
	INSERT INTO gender (gendername) VALUES (p_gendername);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertidentificationdocs` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertidentificationdocs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertidentificationdocs`(IN p_documentname VARCHAR(50))
BEGIN
	INSERT INTO identificationdocs (documentname) VALUES (p_documentname);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertpassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertpassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertpassengermanifest`(
IN p_bookingid INT,
    IN p_bookingclassid INT,
    IN p_price DECIMAL(10,2),
    IN p_currencyid INT,
    IN p_iddoc INT,
    IN p_passengername VARCHAR(100),
    IN p_dob DATE,
    IN p_genderid INT

)
BEGIN
	INSERT INTO passengermanifest (bookingid, bookingclassid, price, currencyid, iddoc, passengername, dob, genderid)
    VALUES (p_bookingid, p_bookingclassid, p_price, p_currencyid, p_iddoc, p_passengername, p_dob, p_genderid);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insertpaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insertpaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertpaymentmethod`(IN p_paymentname VARCHAR(50))
BEGIN
	 INSERT INTO paymentmethod (paymentname) VALUES (p_paymentname);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listairlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listairlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listairlines`()
BEGIN
	SELECT * FROM airline;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listairports` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listairports` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listairports`()
BEGIN
	SELECT * FROM airport;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listbookingclasses`()
BEGIN
	SELECT * FROM bookingclass;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listbookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listbookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listbookings`()
BEGIN
	SELECT * FROM booking;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listbookingsupplies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listbookingsupplies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listbookingsupplies`()
BEGIN
	SELECT * FROM bookingsupply;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listbookingtypes` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listbookingtypes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listbookingtypes`()
BEGIN
	SELECT * FROM bookingtype;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listcities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listcities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listcities`()
BEGIN
	 SELECT * FROM city;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listcountry`()
BEGIN
SELECT * FROM `country`;
   
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listcurrencies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listcurrencies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listcurrencies`()
BEGIN
	SELECT * FROM currency;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listflightsupplies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listflightsupplies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listflightsupplies`()
BEGIN
	 SELECT * FROM flightsupply;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listgenders` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listgenders` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listgenders`()
BEGIN
	SELECT * FROM gender;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listidentificationdocs` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listidentificationdocs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listidentificationdocs`()
BEGIN
	SELECT * FROM identificationdocs;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listpassengermanifests` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listpassengermanifests` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listpassengermanifests`()
BEGIN
	SELECT * FROM passengermanifest;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listpaymentmethods` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listpaymentmethods` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listpaymentmethods`()
BEGIN
	SELECT * FROM paymentmethod;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountry`($countryname VARCHAR(100))
BEGIN
	if not exists(SELECT * FROM `country` WHERE `countryname`=$countryname) THEN
	INSERT INTO `country` (`countryname`)
	VALUES($countryname);
	END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateairline`(IN p_id INT, IN p_airlinename VARCHAR(100))
BEGIN
	UPDATE airline SET airlinename = p_airlinename WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateairport`(IN p_id INT, IN p_code VARCHAR(10), IN p_airportname VARCHAR(100), IN p_cityid INT)
BEGIN
	UPDATE airport
    SET code = p_code, airportname = p_airportname, cityid = p_cityid
    WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatebooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatebooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatebooking`(
IN p_id INT,
    IN p_bookingtypeid INT,
    IN p_currencyid INT,
    IN p_flightid INT,
    IN p_bookingdate DATE,
    IN p_paymentmethod INT
)
BEGIN
	UPDATE booking
    SET bookingtypeid = p_bookingtypeid,
        currencyid = p_currencyid,
        flightid = p_flightid,
        bookingdate = p_bookingdate,
        paymentmethod = p_paymentmethod
    WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatebookingclass`(IN p_id INT, IN p_typename VARCHAR(50))
BEGIN
	 UPDATE bookingclass SET typename = p_typename WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatebookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatebookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatebookingsupply`(
IN p_id INT,
    IN p_flightid INT,
    IN p_bookingclassid INT,
    IN p_numberofseats INT,
    IN p_price DECIMAL(10,2),
    IN p_currency VARCHAR(10)
)
BEGIN
	UPDATE bookingsupply
    SET flightid = p_flightid,
        bookingclassid = p_bookingclassid,
        numberofseats = p_numberofseats,
        price = p_price,
        currency = p_currency
    WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatebookingtype`(IN p_id INT, IN p_bookingname VARCHAR(100))
BEGIN
	UPDATE bookingtype SET bookingname = p_bookingname WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatecity`(IN p_id INT, IN p_cityname VARCHAR(100), IN p_countryid INT)
BEGIN
	UPDATE city SET cityname = p_cityname, countryid = p_countryid WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatecurrency`(
IN p_id INT,
    IN p_currencyname VARCHAR(50),
    IN p_currencycode VARCHAR(10),
    IN p_isdefault BOOLEAN,
    IN p_exchangerate DECIMAL(10,4)
)
BEGIN
	UPDATE currencies
    SET currencyname = p_currencyname,
        currencycode = p_currencycode,
        isdefault = p_isdefault,
        exchangerate = p_exchangerate
    WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateflightsupply`(
IN p_id INT,
    IN p_flightid VARCHAR(20),
    IN p_airlineid INT,
    IN p_departuretime DATETIME,
    IN p_departurecity INT,
    IN p_arrivaltime DATETIME,
    IN p_destinationcity INT
)
BEGIN
	UPDATE flightsupply
    SET flightid = p_flightid,
        airlineid = p_airlineid,
        departuretime = p_departuretime,
        departurecity = p_departurecity,
        arrivaltime = p_arrivaltime,
        destinationcity = p_destinationcity
    WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updategender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updategender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updategender`(IN p_id INT, IN p_gendername VARCHAR(10))
BEGIN
	UPDATE gender SET gendername = p_gendername WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateidentificationdocs` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateidentificationdocs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateidentificationdocs`(IN p_id INT, IN p_documentname VARCHAR(50))
BEGIN
	UPDATE identificationdocs SET documentname = p_documentname WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatepassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatepassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatepassengermanifest`(
IN p_id INT,
    IN p_bookingid INT,
    IN p_bookingclassid INT,
    IN p_price DECIMAL(10,2),
    IN p_currencyid INT,
    IN p_iddoc INT,
    IN p_passengername VARCHAR(100),
    IN p_dob DATE,
    IN p_genderid INT

)
BEGIN
	UPDATE passengermanifest
    SET bookingid = p_bookingid,
        bookingclassid = p_bookingclassid,
        price = p_price,
        currencyid = p_currencyid,
        iddoc = p_iddoc,
        names = p_passengername,
        dob = p_dob,
        genderid = p_genderid
    WHERE id = p_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatepaymentmethod`(IN p_id INT, IN p_paymentname VARCHAR(50))
BEGIN
	UPDATE paymentmethod SET paymentname = p_paymentname WHERE id = p_id;

	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
