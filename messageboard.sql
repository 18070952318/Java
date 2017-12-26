/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : messageboard

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-26 09:39:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `MESSAGEID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGEDETAILS` varchar(255) DEFAULT NULL,
  `CREATEPERSON` varchar(255) DEFAULT NULL,
  `CREATETIME` varchar(255) DEFAULT NULL,
  `ISVAL` int(11) DEFAULT NULL,
  PRIMARY KEY (`MESSAGEID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('2', '蓝瘦，香菇', '最英俊的恐龙', '2017-12-23 23:20:44', '1');
INSERT INTO `message` VALUES ('3', '分发给饭否发消息', '最英俊的恐龙', '2017-12-24 10:46:48', '0');
INSERT INTO `message` VALUES ('4', '古古怪怪', '最英俊的恐龙', '2017-12-24 10:47:51', '0');
INSERT INTO `message` VALUES ('5', '古古怪怪烦烦烦', '最英俊的恐龙', '2017-12-24 10:47:56', '0');
INSERT INTO `message` VALUES ('7', '官方公告刚刚发给', '游客', '2017-12-24 19:39:30', '1');
INSERT INTO `message` VALUES ('9', '顶顶顶顶顶顶顶', '游客', '2017-12-25 11:43:27', '1');
INSERT INTO `message` VALUES ('10', 'test顶顶顶顶顶顶顶', '游客', '2017-12-25 11:49:44', '1');
INSERT INTO `message` VALUES ('12', '灌灌灌灌灌灌', '游客', '2017-12-25 11:53:31', '0');
INSERT INTO `message` VALUES ('13', '真有趣', '最英俊的恐龙', '2017-12-25 19:12:27', '1');
INSERT INTO `message` VALUES ('14', '厕所很舒服', '游客', '2017-12-25 19:23:41', '1');
INSERT INTO `message` VALUES ('15', '水水水水水水', '游客', '2017-12-25 21:52:46', '1');
INSERT INTO `message` VALUES ('16', '收费收费方式', '游客', '2017-12-25 21:54:06', '0');
INSERT INTO `message` VALUES ('17', '测试1', '最英俊的恐龙', '2017-12-25 22:57:31', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `NICKNAME` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROLL` int(11) DEFAULT NULL,
  `ISREGIS` int(11) DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '最英俊的恐龙', '1400310223', '123456', '0', '1');
INSERT INTO `user` VALUES ('2', 'test', 'fsdafga', '123456', '0', '1');
INSERT INTO `user` VALUES ('3', '反反复复', 'www', '123456', '0', '1');
INSERT INTO `user` VALUES ('4', 'adgsdg', 'ewrewgsd', '123456', '0', '1');
INSERT INTO `user` VALUES ('5', '公司上市辅导', '的归属感和', '123456', '0', '1');
INSERT INTO `user` VALUES ('6', '啊大哥的撒噶', '广东韶关', '123456', '0', '1');
INSERT INTO `user` VALUES ('7', '啊是根深蒂固', '额我讨厌我也', '123456', '0', '1');
INSERT INTO `user` VALUES ('8', 'admin', 'admin', '123456', '1', '1');
INSERT INTO `user` VALUES ('9', '丑八怪', 'lisi', '123456', '0', '1');
