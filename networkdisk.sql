/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : networkdisk

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-08-17 18:18:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `title` varchar(30) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `mydiskinfo`
-- ----------------------------
DROP TABLE IF EXISTS `mydiskinfo`;
CREATE TABLE `mydiskinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `totalsize` int(11) NOT NULL,
  `usedsize` int(11) DEFAULT NULL,
  `filenumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `mydiskinfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of mydiskinfo
-- ----------------------------
INSERT INTO `mydiskinfo` VALUES ('2', '5', '5242880', '1647373', '4');

-- ----------------------------
-- Table structure for `myfile`
-- ----------------------------
DROP TABLE IF EXISTS `myfile`;
CREATE TABLE `myfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `size` mediumtext COLLATE utf8_bin NOT NULL,
  `type` char(20) COLLATE utf8_bin NOT NULL,
  `path` varchar(500) COLLATE utf8_bin NOT NULL,
  `createdate` char(30) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `islock` int(1) DEFAULT '0',
  `isshare` int(1) DEFAULT '0',
  `sharedownload` int(11) DEFAULT '0',
  `location` varchar(220) COLLATE utf8_bin DEFAULT NULL,
  `shareurl` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `md5` char(32) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `myfile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `myfile_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `myfile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of myfile
-- ----------------------------
INSERT INTO `myfile` VALUES ('2', '5', null, '#5', 0x30, 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('3', '5', '2', '我的文档', 0x30, 'adir', '/2/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('4', '5', '2', '我的音乐', 0x30, 'adir', '/2/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('5', '5', '2', '我的相册', 0x30, 'adir', '/2/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('6', '5', '2', '我的图书', 0x30, 'adir', '/2/', null, '', '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('8', '5', '6', 'PicCheckCode1.gif', 0x393132, 'gif', '/2/6/', null, null, '0', '0', '1', 'd:/user/temp_file/ 1502689620599.gif', 'http://localhost:8080/share/download/8', null, '');
INSERT INTO `myfile` VALUES ('9', '5', '6', '柏诚网盘测试.docx', 0x3132383837, 'docx', '/2/6/', null, null, '0', '0', '0', 'd:/user/temp_file/ 1502697440136.docx', null, null, '');
INSERT INTO `myfile` VALUES ('10', '5', '6', '新建文件夹.rar', 0x3130323333, 'rar', '/2/6/', null, null, '0', '0', '0', 'd:/user/temp_file/ 1502697497677.rar', null, null, '');
INSERT INTO `myfile` VALUES ('11', '5', '3', '财360APP.docx', 0x31363233333431, 'docx', '/2/3/', null, null, '0', '0', '0', 'd:/user/temp_file/ 1502698708842.docx', 'http://localhost:8080/share/download/11', null, '');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `password` char(32) COLLATE utf8_bin NOT NULL,
  `gender` int(2) NOT NULL,
  `portrait` varchar(50) COLLATE utf8_bin DEFAULT 'portrait',
  `joindate` char(30) COLLATE utf8_bin NOT NULL,
  `tel` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `type` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '类别，管理员1，商务2，客户3',
  `state` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '当前状态：注销、正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', 'xiaozhun1223@163.com', 'xiaozhun', 'e10adc3949ba59abbe56e057f20f883e', '1', 'portrait', '2017年08月14日(星期一)', null, null, null);
