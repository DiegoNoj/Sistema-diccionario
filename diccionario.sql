/*
Navicat MySQL Data Transfer

Source Server         : Server
Source Server Version : 50145
Source Host           : 127.0.0.1:3306
Source Database       : diccionario

Target Server Type    : MYSQL
Target Server Version : 50145
File Encoding         : 65001

Date: 2018-11-09 06:17:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `IdImg` int(11) NOT NULL AUTO_INCREMENT,
  `IdPalabra` int(11) NOT NULL,
  `Img` mediumblob NOT NULL,
  PRIMARY KEY (`IdImg`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for palabras
-- ----------------------------
DROP TABLE IF EXISTS `palabras`;
CREATE TABLE `palabras` (
  `IdPalabra` int(11) NOT NULL AUTO_INCREMENT,
  `Palabra` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Difinicion` text CHARACTER SET utf8,
  `IdImg` int(11) DEFAULT '0',
  PRIMARY KEY (`IdPalabra`),
  UNIQUE KEY `Palabra` (`Palabra`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Procedure structure for SP_GuardarPalabra
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_GuardarPalabra`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GuardarPalabra`(
IN _Palabra VARCHAR(50),
IN _Difinicion TEXT
)
BEGIN
DECLARE IdPalabra INT;
INSERT INTO palabras (Palabra,Difinicion) VALUE(_Palabra,_Difinicion);
SET IdPalabra = LAST_INSERT_ID();
SELECT IdPalabra;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_InsertImgNivel_00
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_InsertImgNivel_00`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_InsertImgNivel_00`(
IN _IdPalabra INT, 
IN _Img MEDIUMBLOB
)
BEGIN
DECLARE idimg int;
INSERT INTO img (IdPalabra, Img) VALUE(_IdPalabra,_Img);
SET idimg = LAST_INSERT_ID();
SELECT idimg;

END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
