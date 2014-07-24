/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : scrumreal2

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2014-06-24 06:53:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `acid` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT 'loại hành động gì: comment, cập nhật, bổ sung',
  `entity_id` int(11) NOT NULL COMMENT 'thực thể chứa hành động',
  `entity_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` bigint(11) NOT NULL,
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('522', '4', '1', '1', 'Name+Quan li nha hang+Quản tiệc cưới', '2014-06-24 00:45:50', '1');
INSERT INTO `activity` VALUES ('523', '4', '1', '1', 'Name+Quản tiệc cưới+Quản lí tiệc cưới', '2014-06-24 00:46:21', '1');
INSERT INTO `activity` VALUES ('524', '4', '1', '2', 'Name+story 1+Quán lí danh sách món ăn', '2014-06-24 00:54:04', '1');
INSERT INTO `activity` VALUES ('525', '4', '1', '2', 'Story point+10+30', '2014-06-24 00:54:04', '1');
INSERT INTO `activity` VALUES ('526', '4', '10', '2', 'Name+story 10+Quản lí đặt bàn', '2014-06-24 00:54:21', '1');
INSERT INTO `activity` VALUES ('527', '4', '11', '2', 'Name+story 11+Quản lí đơn hàng', '2014-06-24 00:54:47', '1');
INSERT INTO `activity` VALUES ('528', '4', '12', '2', 'Name+story 12+Quản lí dụng cụ', '2014-06-24 00:55:01', '1');
INSERT INTO `activity` VALUES ('529', '4', '13', '2', 'Name+story 13+Thống kê', '2014-06-24 00:55:14', '1');
INSERT INTO `activity` VALUES ('530', '3', '1', '1', '14+2', '2014-06-24 00:56:52', '1');
INSERT INTO `activity` VALUES ('531', '3', '1', '1', '19+2', '2014-06-24 00:56:58', '1');
INSERT INTO `activity` VALUES ('532', '3', '1', '1', '20+2', '2014-06-24 00:57:10', '1');
INSERT INTO `activity` VALUES ('533', '3', '1', '1', '22+2', '2014-06-24 00:57:40', '1');
INSERT INTO `activity` VALUES ('534', '3', '1', '1', '2+2', '2014-06-24 00:57:48', '1');
INSERT INTO `activity` VALUES ('535', '3', '1', '1', '4+2', '2014-06-24 00:57:59', '1');
INSERT INTO `activity` VALUES ('536', '3', '1', '1', '6+2', '2014-06-24 00:58:11', '1');
INSERT INTO `activity` VALUES ('537', '3', '1', '1', '7+2', '2014-06-24 00:58:20', '1');
INSERT INTO `activity` VALUES ('538', '3', '1', '1', '9+2', '2014-06-24 00:58:27', '1');
INSERT INTO `activity` VALUES ('539', '3', '1', '1', '8+2', '2014-06-24 00:58:40', '1');
INSERT INTO `activity` VALUES ('540', '3', '1', '1', '5+2', '2014-06-24 00:58:48', '1');
INSERT INTO `activity` VALUES ('541', '4', '1', '2', 'Priority+1+3', '2014-06-24 00:59:04', '1');
INSERT INTO `activity` VALUES ('542', '4', '12', '2', 'Priority+1+4', '2014-06-24 00:59:21', '1');
INSERT INTO `activity` VALUES ('543', '4', '12', '2', 'Story point+34+5', '2014-06-24 00:59:21', '1');
INSERT INTO `activity` VALUES ('544', '2', '9', '4', '13+2', '2014-06-24 01:03:07', '1');
INSERT INTO `activity` VALUES ('545', '2', '18', '3', '13+2', '2014-06-24 01:03:07', '1');
INSERT INTO `activity` VALUES ('546', '3', '9', '4', '13+2', '2014-06-24 01:03:07', '1');
INSERT INTO `activity` VALUES ('547', '3', '19', '3', '13+2', '2014-06-24 01:03:07', '1');
INSERT INTO `activity` VALUES ('548', '2', '8', '4', '13+2', '2014-06-24 01:03:10', '1');
INSERT INTO `activity` VALUES ('549', '2', '18', '3', '13+2', '2014-06-24 01:03:10', '1');
INSERT INTO `activity` VALUES ('550', '3', '9', '4', '13+2', '2014-06-24 01:03:10', '1');
INSERT INTO `activity` VALUES ('551', '3', '18', '3', '13+2', '2014-06-24 01:03:10', '1');
INSERT INTO `activity` VALUES ('552', '2', '8', '4', '11+2', '2014-06-24 01:03:11', '1');
INSERT INTO `activity` VALUES ('553', '2', '19', '3', '11+2', '2014-06-24 01:03:11', '1');
INSERT INTO `activity` VALUES ('554', '3', '9', '4', '11+2', '2014-06-24 01:03:11', '1');
INSERT INTO `activity` VALUES ('555', '3', '19', '3', '11+2', '2014-06-24 01:03:11', '1');
INSERT INTO `activity` VALUES ('556', '2', '9', '4', '10+2', '2014-06-24 01:03:15', '1');
INSERT INTO `activity` VALUES ('557', '2', '17', '3', '10+2', '2014-06-24 01:03:15', '1');
INSERT INTO `activity` VALUES ('558', '3', '10', '4', '10+2', '2014-06-24 01:03:15', '1');
INSERT INTO `activity` VALUES ('559', '3', '17', '3', '10+2', '2014-06-24 01:03:15', '1');
INSERT INTO `activity` VALUES ('560', '2', '9', '4', '12+2', '2014-06-24 01:03:16', '1');
INSERT INTO `activity` VALUES ('561', '2', '18', '3', '12+2', '2014-06-24 01:03:16', '1');
INSERT INTO `activity` VALUES ('562', '3', '10', '4', '12+2', '2014-06-24 01:03:17', '1');
INSERT INTO `activity` VALUES ('563', '3', '19', '3', '12+2', '2014-06-24 01:03:17', '1');
INSERT INTO `activity` VALUES ('564', '4', '13', '2', 'Name+Thống kê+Thống kê bán hàng', '2014-06-24 06:27:18', '1');
INSERT INTO `activity` VALUES ('565', '2', '1', '1', '23+2', '2014-06-24 06:27:42', '1');
INSERT INTO `activity` VALUES ('566', '2', '1', '1', '24+2', '2014-06-24 06:27:58', '1');
INSERT INTO `activity` VALUES ('567', '2', '1', '1', '25+2', '2014-06-24 06:27:59', '1');
INSERT INTO `activity` VALUES ('568', '3', '1', '1', '24+2', '2014-06-24 06:28:09', '1');
INSERT INTO `activity` VALUES ('569', '2', '17', '3', '7+8', '2014-06-24 06:29:18', '1');
INSERT INTO `activity` VALUES ('570', '2', '18', '3', '9+8', '2014-06-24 06:29:19', '1');
INSERT INTO `activity` VALUES ('571', '2', '19', '3', '22+8', '2014-06-24 06:29:23', '1');
INSERT INTO `activity` VALUES ('572', '4', '1', '1', 'Status+New+Approved', '2014-06-24 06:29:46', '1');
INSERT INTO `activity` VALUES ('573', '4', '1', '1', 'Status+New+Approved', '2014-06-24 06:29:54', '1');
INSERT INTO `activity` VALUES ('574', '4', '1', '1', 'Status+New+Approved', '2014-06-24 06:30:02', '1');
INSERT INTO `activity` VALUES ('575', '4', '25', '2', 'Estimate time++10', '2014-06-24 06:30:26', '1');
INSERT INTO `activity` VALUES ('576', '4', '25', '2', 'Story point++30', '2014-06-24 06:30:26', '1');
INSERT INTO `activity` VALUES ('577', '4', '23', '2', 'Estimate time++5', '2014-06-24 06:30:38', '1');
INSERT INTO `activity` VALUES ('578', '4', '23', '2', 'Story point++20', '2014-06-24 06:30:38', '1');
INSERT INTO `activity` VALUES ('579', '2', '9', '4', '25+2', '2014-06-24 06:30:52', '1');
INSERT INTO `activity` VALUES ('580', '2', '19', '3', '25+2', '2014-06-24 06:30:52', '1');
INSERT INTO `activity` VALUES ('581', '2', '9', '4', '23+2', '2014-06-24 06:31:05', '1');
INSERT INTO `activity` VALUES ('582', '2', '17', '3', '23+2', '2014-06-24 06:31:05', '1');
INSERT INTO `activity` VALUES ('583', '2', '8', '4', '1+2', '2014-06-24 06:37:03', '1');
INSERT INTO `activity` VALUES ('584', '2', '17', '3', '1+2', '2014-06-24 06:37:03', '1');
INSERT INTO `activity` VALUES ('585', '2', '8', '4', '11+2', '2014-06-24 06:37:04', '1');
INSERT INTO `activity` VALUES ('586', '2', '18', '3', '11+2', '2014-06-24 06:37:04', '1');
INSERT INTO `activity` VALUES ('587', '2', '8', '4', '13+2', '2014-06-24 06:37:06', '1');
INSERT INTO `activity` VALUES ('588', '2', '19', '3', '13+2', '2014-06-24 06:37:06', '1');

-- ----------------------------
-- Table structure for `attach`
-- ----------------------------
DROP TABLE IF EXISTS `attach`;
CREATE TABLE `attach` (
  `atid` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(610) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `entity_type` int(11) NOT NULL,
  PRIMARY KEY (`atid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of attach
-- ----------------------------
INSERT INTO `attach` VALUES ('1', '3420 toeic vocabulary words.pdf', '1', '1');
INSERT INTO `attach` VALUES ('2', 'BROS ER.png', '1', '1');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `entity_type` tinyint(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '1', 'comment 1', null, '2014-05-14 11:48:36');
INSERT INTO `comment` VALUES ('2', '2', '1', '1', 'comment 1.1', '1', '2014-05-14 16:54:27');
INSERT INTO `comment` VALUES ('3', '1', '1', '1', 'comment 1.2', '1', '2014-05-14 14:40:47');
INSERT INTO `comment` VALUES ('4', '1', '1', '1', 'comment 1.2.3', '1', '2014-05-14 22:17:39');
INSERT INTO `comment` VALUES ('5', '2', '1', '1', 'comment 2', null, '2014-05-14 16:54:23');
INSERT INTO `comment` VALUES ('6', '1', '1', '3', 'The shake animation is included in bootstrap-modal but any animation in animate.css is supported, just include the css file in your project.', null, '2014-05-22 15:39:32');
INSERT INTO `comment` VALUES ('7', '1', '1', '3', 'The shake animation is included in bootstrap-modal but any animation in animate.css is supported, just include the css file in your project.', null, '2014-05-22 15:39:32');
INSERT INTO `comment` VALUES ('8', '1', '1', '3', 'The shake animation is included in bootstrap-modal but any animation in animate.css is supported, just include the css file in your project.', null, '2014-05-22 15:39:32');
INSERT INTO `comment` VALUES ('9', '2', '1', '3', 'The shake animation is included in bootstrap-modal but any animation in animate.css is supported, just include the css file in your project.', null, '2014-05-22 15:39:32');
INSERT INTO `comment` VALUES ('10', '1', '1', '3', 'The shake animation is included in bootstrap-modal but any animation in animate.css is supported, just include the css file in your project.', null, '2014-05-22 15:39:32');
INSERT INTO `comment` VALUES ('11', '2', '1', '3', 'The shake animation is included in bootstrap-modal but any animation in animate.css is supported, just include the css file in your project.', null, '2014-05-22 15:39:33');
INSERT INTO `comment` VALUES ('12', '1', '1', '3', 'The shake animation is included in bootstrap-modal but any animation in animate.css is supported, just include the css file in your project.', null, '2014-05-22 15:39:33');
INSERT INTO `comment` VALUES ('64', '1', '1', '3', 'The shake animation is included in bootstrap-modal but any animation in animate.css is supported, just include the css file in your project.', null, '2014-05-22 15:39:34');
INSERT INTO `comment` VALUES ('65', '1', '1', '1', 'The shake animation is included in bootstrap-modal but any animation in animate.css is supported, just include the css file in your project.', '11', '2014-05-16 19:50:44');
INSERT INTO `comment` VALUES ('66', '1', '1', '1', 'asdfasdasfasfasdf', '11', '2014-05-16 19:50:45');
INSERT INTO `comment` VALUES ('67', '1', '1', '1', 'asdfasdasfasfasdf', '11', '2014-05-16 19:50:46');
INSERT INTO `comment` VALUES ('68', '1', '1', '1', 'asdfsfsdfsadfasdfasdf', '67', '2014-05-16 19:52:10');
INSERT INTO `comment` VALUES ('69', '1', '1', '1', 'asfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfd', '67', '2014-05-16 20:50:50');
INSERT INTO `comment` VALUES ('70', '1', '1', '1', 'abcabcabcabcabcabcabcabcabc', '69', '2014-05-16 20:59:20');
INSERT INTO `comment` VALUES ('71', '1', '1', '1', '1234567890', '69', '2014-05-16 21:08:29');
INSERT INTO `comment` VALUES ('72', '1', '1', '1', '1234567890', '69', '2014-05-16 21:08:36');
INSERT INTO `comment` VALUES ('73', '1', '1', '1', '1234567890', '69', '2014-05-16 21:08:40');
INSERT INTO `comment` VALUES ('74', '1', '1', '1', 'anqwertyuio', '68', '2014-05-16 21:10:03');
INSERT INTO `comment` VALUES ('75', '1', '1', '1', 'asdfsfsdfsadfasdfasdf!111111', '74', '2014-05-16 21:10:24');
INSERT INTO `comment` VALUES ('76', '1', '1', '1', 'asfasdfasdfasdf345354345', '65', '2014-05-16 21:14:33');
INSERT INTO `comment` VALUES ('77', '1', '1', '1', '567457354sdfgdfg', '65', '2014-05-16 21:14:40');
INSERT INTO `comment` VALUES ('78', '1', '1', '1', '1234123413412341234234', '11', '2014-05-16 21:15:18');
INSERT INTO `comment` VALUES ('79', '1', '1', '1', 'abcdeded1234123412341234', '11', '2014-05-16 22:23:08');
INSERT INTO `comment` VALUES ('80', '1', '1', '2', '1234123412341234123412341241234', '76', '2014-05-18 18:26:28');
INSERT INTO `comment` VALUES ('81', '1', '1', '2', 'abgabdasdasdasdfasdf', '65', '2014-05-18 18:26:29');
INSERT INTO `comment` VALUES ('82', '1', '1', '2', '123123123123', '81', '2014-05-18 18:26:29');
INSERT INTO `comment` VALUES ('83', '1', '1', '2', 'asdfasdfasdf', null, '2014-05-18 18:26:29');
INSERT INTO `comment` VALUES ('84', '1', '1', '2', 'asdfasdfasdfasdf', null, '2014-05-18 18:26:29');
INSERT INTO `comment` VALUES ('85', '1', '1', '2', 'asdfasdfasdfasdfasdfasdf', null, '2014-05-18 18:26:29');
INSERT INTO `comment` VALUES ('86', '1', '1', '2', 'asdfasdfasdfasdfsdafgdf345345', '84', '2014-05-18 18:26:30');
INSERT INTO `comment` VALUES ('87', '1', '1', '2', '45756845674567', '86', '2014-05-18 18:26:30');
INSERT INTO `comment` VALUES ('88', '1', '1', '2', '879087907890', '86', '2014-05-18 18:26:30');
INSERT INTO `comment` VALUES ('89', '1', '1', '2', 'sdfasdfasdf', null, '2014-05-18 18:26:30');
INSERT INTO `comment` VALUES ('90', '1', '1', '2', 'asdfasdfasdfasdfasdf', null, '2014-05-18 18:26:30');
INSERT INTO `comment` VALUES ('91', '1', '1', '1', 'asdfasdfasdfasdfasdfw2234234', null, '2014-05-18 18:26:24');
INSERT INTO `comment` VALUES ('92', '1', '1', '2', '242143123412412341234', null, '2014-05-18 18:26:31');
INSERT INTO `comment` VALUES ('93', '1', '1', '2', '45645646545674567', null, '2014-05-18 18:26:31');
INSERT INTO `comment` VALUES ('94', '1', '1', '2', '678456735673456', '93', '2014-05-18 18:26:33');
INSERT INTO `comment` VALUES ('95', '1', '1', '2', '123123123123123123', null, '2014-05-18 18:28:36');
INSERT INTO `comment` VALUES ('96', '1', '1', '3', 'asdfasdfasdfasdfasdfasdf', '64', '2014-05-22 16:02:14');
INSERT INTO `comment` VALUES ('98', '1', '0', '0', 'asdASasdADS', null, '2014-05-27 19:55:09');
INSERT INTO `comment` VALUES ('99', '1', '0', '0', 'asdASasdADS', null, '2014-05-27 19:55:10');
INSERT INTO `comment` VALUES ('100', '1', '0', '0', 'ASDFASDFASDFASDF', null, '2014-05-27 19:55:14');
INSERT INTO `comment` VALUES ('101', '1', '2', '1', 'qasdfasdfsdfasdf', null, '2014-05-27 20:08:28');
INSERT INTO `comment` VALUES ('102', '1', '2', '1', 'asdfasdfasdfasdfasdf', null, '2014-05-27 20:08:35');
INSERT INTO `comment` VALUES ('103', '1', '2', '1', 'asdfasdfasdfsdf', null, '2014-05-27 20:09:13');
INSERT INTO `comment` VALUES ('104', '1', '2', '1', 'sdfasdfasdf', '103', '2014-05-27 20:09:18');
INSERT INTO `comment` VALUES ('105', '1', '2', '1', 'asdfasdfasdfasdfasd1231234', '101', '2014-05-27 20:09:36');
INSERT INTO `comment` VALUES ('106', '1', '2', '1', '3452363456745674574565', '105', '2014-05-27 20:09:40');
INSERT INTO `comment` VALUES ('107', '1', '1', '1', 'comment 1.1.3.4', '2', '2014-05-27 20:11:34');
INSERT INTO `comment` VALUES ('108', '1', '0', '0', 'asdfasdfasdfasdf123', null, '2014-05-27 20:14:11');
INSERT INTO `comment` VALUES ('109', '1', '0', '0', 'awfasdfasdfasdfasdf02894q234wer', null, '2014-05-27 20:14:17');
INSERT INTO `comment` VALUES ('110', '1', '0', '0', 'asdfasdfakshjdfkjahsdkjhgfjasdfasdfq34qwe', '109', '2014-05-27 20:14:22');
INSERT INTO `comment` VALUES ('162', '1', '3', '3', 'aaaaaaaaaaaaaaa', null, '2014-05-27 21:02:30');
INSERT INTO `comment` VALUES ('163', '1', '3', '3', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', null, '2014-05-27 21:02:54');
INSERT INTO `comment` VALUES ('164', '1', '3', '3', 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', '163', '2014-05-27 21:03:03');
INSERT INTO `comment` VALUES ('165', '1', '3', '3', 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', '162', '2014-05-27 21:03:09');
INSERT INTO `comment` VALUES ('166', '1', '14', '2', 'sssssssssssssssssssssssssss', null, '2014-06-03 21:33:57');
INSERT INTO `comment` VALUES ('167', '1', '1', '1', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', null, '2014-06-10 09:54:04');

-- ----------------------------
-- Table structure for `event`
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `evid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(450) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upd_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`evid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of event
-- ----------------------------

-- ----------------------------
-- Table structure for `group_permission`
-- ----------------------------
DROP TABLE IF EXISTS `group_permission`;
CREATE TABLE `group_permission` (
  `gr_pid` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`gr_pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of group_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `lang_cd` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `lang_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang_icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('en', 'English', 'us.gif');
INSERT INTO `language` VALUES ('vi', 'Tiếng Việt', 'vn.gif');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `messagecol` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `nofification`
-- ----------------------------
DROP TABLE IF EXISTS `nofification`;
CREATE TABLE `nofification` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nofification
-- ----------------------------

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `peid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`peid`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('3', 'View profile', '/user-profile', '0');
INSERT INTO `permission` VALUES ('4', 'View user settings', '/user-settings', '0');
INSERT INTO `permission` VALUES ('5', 'Change language', '/language', '0');
INSERT INTO `permission` VALUES ('6', 'Change user infomation', '/user/save', '0');
INSERT INTO `permission` VALUES ('7', 'Add new user', '/user/add', '0');
INSERT INTO `permission` VALUES ('8', 'Change user password', '/user/change-pass', '0');
INSERT INTO `permission` VALUES ('9', 'Delete user', '/user/delete', '0');
INSERT INTO `permission` VALUES ('11', 'Add new project', '/project/add', '0');
INSERT INTO `permission` VALUES ('12', 'View project detail', '/project/edit', '0');
INSERT INTO `permission` VALUES ('13', 'View user detail', '/user/edit', '0');
INSERT INTO `permission` VALUES ('14', 'Update project', '/project/save', '0');
INSERT INTO `permission` VALUES ('15', 'Delete project', '/project/delete', '0');
INSERT INTO `permission` VALUES ('19', 'Story page', '/story', '0');
INSERT INTO `permission` VALUES ('20', 'Approve story', '/story/approve', '0');
INSERT INTO `permission` VALUES ('21', 'Delete story', '/story/delete', '0');
INSERT INTO `permission` VALUES ('22', 'Reply comment', '/comment/reply', '0');
INSERT INTO `permission` VALUES ('23', 'Add new comment', '/comment/add', '0');
INSERT INTO `permission` VALUES ('24', 'Add new story', '/story/add', '0');
INSERT INTO `permission` VALUES ('25', 'View story datatatbles', '/story\\/datatables\\?_=\\d+/', '1');
INSERT INTO `permission` VALUES ('26', 'View story detail', '/story/edit', '0');
INSERT INTO `permission` VALUES ('27', 'Save story', '/story/save', '0');
INSERT INTO `permission` VALUES ('28', 'Access people page', '/people', '0');
INSERT INTO `permission` VALUES ('29', 'Add new team', '/team/add', '0');
INSERT INTO `permission` VALUES ('30', 'View team detail', '/team/edit', '0');
INSERT INTO `permission` VALUES ('31', 'Remove person from project', '/people/remove_from_project', '0');
INSERT INTO `permission` VALUES ('32', 'Add person to project', '/people/add_to_project', '0');
INSERT INTO `permission` VALUES ('33', 'Move member to another team', '/people/move_to_team', '0');
INSERT INTO `permission` VALUES ('34', 'Reload list staff', '/people/reload_list_staff', '0');
INSERT INTO `permission` VALUES ('35', 'Reload team data', '/team\\/reload_team_data\\/\\d+/', '1');
INSERT INTO `permission` VALUES ('36', 'Save team', '/team/save', '0');
INSERT INTO `permission` VALUES ('37', 'Delete team', '/team/delete', '0');
INSERT INTO `permission` VALUES ('38', 'Access sprint page', '/sprint', '0');
INSERT INTO `permission` VALUES ('39', 'Add new sprint', '/sprint/add', '0');
INSERT INTO `permission` VALUES ('40', 'View sprint detail', '/sprint/edit', '0');
INSERT INTO `permission` VALUES ('41', 'Save sprint', '/sprint/save', '0');
INSERT INTO `permission` VALUES ('42', 'Add story to sprint', '/sprint/add_story_to_sprint', '0');
INSERT INTO `permission` VALUES ('43', 'Move story to another sprint', '/sprint/move_story_to_sprint', '0');
INSERT INTO `permission` VALUES ('44', 'Remove story from sprint', '/sprint/remove_story_from_sprint', '0');
INSERT INTO `permission` VALUES ('45', 'Update sprint order', '/sprint/update_order', '0');
INSERT INTO `permission` VALUES ('46', 'Reload list sprint', '/sprint/reload_story_list', '0');
INSERT INTO `permission` VALUES ('47', 'Add task', '/task/add', '0');
INSERT INTO `permission` VALUES ('48', 'View task detial', '/task/edit', '0');
INSERT INTO `permission` VALUES ('49', 'Save task ', '/task/save', '0');
INSERT INTO `permission` VALUES ('50', 'Update task status', '/task/update_status', '0');
INSERT INTO `permission` VALUES ('51', 'Reload task detail', '/task\\/reload_task_detail\\/\\d+/', '1');
INSERT INTO `permission` VALUES ('52', 'Reload story progress', '/task\\/reload_story_progress\\/\\d+/', '1');
INSERT INTO `permission` VALUES ('53', 'View task datatables', '/task\\/get_datatables\\/\\d+/', '1');
INSERT INTO `permission` VALUES ('54', 'Access taskboard page detail', '/taskboard\\/\\d+\\/\\d+\\/\\d+/', '1');
INSERT INTO `permission` VALUES ('55', 'View activity', '/activity/get', '0');
INSERT INTO `permission` VALUES ('57', 'Manage permission', '/permission', '0');
INSERT INTO `permission` VALUES ('58', 'Save permission', '/permission/save', '0');
INSERT INTO `permission` VALUES ('59', 'View event', '/event', '0');
INSERT INTO `permission` VALUES ('60', 'Access taskboard page', '/taskboard', '0');
INSERT INTO `permission` VALUES ('61', 'Get list leader', '/project/get_leader', '0');
INSERT INTO `permission` VALUES ('62', 'Get list owner', '/project/get_owner', '0');
INSERT INTO `permission` VALUES ('63', 'Complete project', '/project/complete', '0');
INSERT INTO `permission` VALUES ('64', 'Start sprint', '/sprint/start_sprint', '0');
INSERT INTO `permission` VALUES ('65', 'Complete sprint', '/sprint/complete_sprint', '0');
INSERT INTO `permission` VALUES ('66', 'Resume sprint', '/sprint/resume_sprint', '0');
INSERT INTO `permission` VALUES ('67', 'Delete sprint ', '/sprint/delete', '0');
INSERT INTO `permission` VALUES ('68', 'Get team day in sprint', '/sprint/get_team_day', '0');
INSERT INTO `permission` VALUES ('69', 'Update team day in sprint', '/sprint/update_team_day', '0');
INSERT INTO `permission` VALUES ('70', 'Get all team day in sprint', '/sprint/get_team_day_all', '0');
INSERT INTO `permission` VALUES ('71', 'Access burn down chart', '/burndown/sprint_all_team_burndown', '0');
INSERT INTO `permission` VALUES ('72', 'Access burn down chart', '/burndown/sprint_each_team_burndown', '0');
INSERT INTO `permission` VALUES ('73', 'Access burn down chart', '/burndown\\/\\d+\\/\\d+/', '1');
INSERT INTO `permission` VALUES ('74', 'Access burn up chart', '/burnup', '0');
INSERT INTO `permission` VALUES ('75', 'Initialize burn up chart', '/burnup/initialize', '0');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(450) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date_es` date DEFAULT NULL,
  `end_date_real` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'Quản lí tiệc cưới', '2014-06-10', '2014-08-26', null, 'aa', '1', 'aa', '0');
INSERT INTO `project` VALUES ('2', 'Quản lí nhân sự', '2014-04-02', '2014-05-30', null, 'Cần xét lại', '1', 'Project test cho vui', '0');
INSERT INTO `project` VALUES ('6', 'Quản lí khách sạn', '2014-06-10', '2014-06-26', null, '', '1', '', '0');
INSERT INTO `project` VALUES ('9', 'Game bắn súng', '2014-06-01', '2014-06-30', null, '', '1', '', '0');

-- ----------------------------
-- Table structure for `project_user`
-- ----------------------------
DROP TABLE IF EXISTS `project_user`;
CREATE TABLE `project_user` (
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project_user
-- ----------------------------
INSERT INTO `project_user` VALUES ('1', '0', '14', '2');
INSERT INTO `project_user` VALUES ('1', '1', '17', '2');
INSERT INTO `project_user` VALUES ('1', '2', '19', '3');
INSERT INTO `project_user` VALUES ('1', '3', '17', '3');
INSERT INTO `project_user` VALUES ('1', '7', '17', '3');
INSERT INTO `project_user` VALUES ('1', '8', '0', '4');
INSERT INTO `project_user` VALUES ('1', '9', '18', '3');
INSERT INTO `project_user` VALUES ('1', '11', '0', '1');
INSERT INTO `project_user` VALUES ('1', '12', '18', '2');
INSERT INTO `project_user` VALUES ('1', '13', '19', '2');
INSERT INTO `project_user` VALUES ('1', '14', '18', '3');
INSERT INTO `project_user` VALUES ('1', '21', '17', '3');
INSERT INTO `project_user` VALUES ('1', '22', '19', '3');
INSERT INTO `project_user` VALUES ('1', '23', '18', '3');
INSERT INTO `project_user` VALUES ('1', '27', '19', '3');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'Project Leader');
INSERT INTO `role` VALUES ('2', 'Scrum Master');
INSERT INTO `role` VALUES ('3', 'Team member');
INSERT INTO `role` VALUES ('4', 'Product owner');

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `rid` int(11) NOT NULL,
  `peid` bigint(20) NOT NULL,
  PRIMARY KEY (`rid`,`peid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('1', '4');
INSERT INTO `role_permission` VALUES ('1', '5');
INSERT INTO `role_permission` VALUES ('1', '6');
INSERT INTO `role_permission` VALUES ('1', '7');
INSERT INTO `role_permission` VALUES ('1', '8');
INSERT INTO `role_permission` VALUES ('1', '9');
INSERT INTO `role_permission` VALUES ('1', '10');
INSERT INTO `role_permission` VALUES ('1', '11');
INSERT INTO `role_permission` VALUES ('1', '12');
INSERT INTO `role_permission` VALUES ('1', '13');
INSERT INTO `role_permission` VALUES ('1', '14');
INSERT INTO `role_permission` VALUES ('1', '15');
INSERT INTO `role_permission` VALUES ('1', '16');
INSERT INTO `role_permission` VALUES ('1', '19');
INSERT INTO `role_permission` VALUES ('1', '20');
INSERT INTO `role_permission` VALUES ('1', '21');
INSERT INTO `role_permission` VALUES ('1', '22');
INSERT INTO `role_permission` VALUES ('1', '23');
INSERT INTO `role_permission` VALUES ('1', '24');
INSERT INTO `role_permission` VALUES ('1', '25');
INSERT INTO `role_permission` VALUES ('1', '26');
INSERT INTO `role_permission` VALUES ('1', '27');
INSERT INTO `role_permission` VALUES ('1', '28');
INSERT INTO `role_permission` VALUES ('1', '29');
INSERT INTO `role_permission` VALUES ('1', '30');
INSERT INTO `role_permission` VALUES ('1', '31');
INSERT INTO `role_permission` VALUES ('1', '32');
INSERT INTO `role_permission` VALUES ('1', '33');
INSERT INTO `role_permission` VALUES ('1', '34');
INSERT INTO `role_permission` VALUES ('1', '35');
INSERT INTO `role_permission` VALUES ('1', '36');
INSERT INTO `role_permission` VALUES ('1', '37');
INSERT INTO `role_permission` VALUES ('1', '38');
INSERT INTO `role_permission` VALUES ('1', '39');
INSERT INTO `role_permission` VALUES ('1', '40');
INSERT INTO `role_permission` VALUES ('1', '41');
INSERT INTO `role_permission` VALUES ('1', '42');
INSERT INTO `role_permission` VALUES ('1', '43');
INSERT INTO `role_permission` VALUES ('1', '44');
INSERT INTO `role_permission` VALUES ('1', '45');
INSERT INTO `role_permission` VALUES ('1', '46');
INSERT INTO `role_permission` VALUES ('1', '47');
INSERT INTO `role_permission` VALUES ('1', '48');
INSERT INTO `role_permission` VALUES ('1', '49');
INSERT INTO `role_permission` VALUES ('1', '50');
INSERT INTO `role_permission` VALUES ('1', '51');
INSERT INTO `role_permission` VALUES ('1', '52');
INSERT INTO `role_permission` VALUES ('1', '53');
INSERT INTO `role_permission` VALUES ('1', '54');
INSERT INTO `role_permission` VALUES ('1', '55');
INSERT INTO `role_permission` VALUES ('1', '56');
INSERT INTO `role_permission` VALUES ('1', '57');
INSERT INTO `role_permission` VALUES ('1', '58');
INSERT INTO `role_permission` VALUES ('1', '59');
INSERT INTO `role_permission` VALUES ('1', '60');
INSERT INTO `role_permission` VALUES ('1', '61');
INSERT INTO `role_permission` VALUES ('1', '62');
INSERT INTO `role_permission` VALUES ('1', '63');
INSERT INTO `role_permission` VALUES ('1', '64');
INSERT INTO `role_permission` VALUES ('1', '65');
INSERT INTO `role_permission` VALUES ('1', '66');
INSERT INTO `role_permission` VALUES ('1', '67');
INSERT INTO `role_permission` VALUES ('1', '68');
INSERT INTO `role_permission` VALUES ('1', '69');
INSERT INTO `role_permission` VALUES ('1', '70');
INSERT INTO `role_permission` VALUES ('1', '71');
INSERT INTO `role_permission` VALUES ('1', '72');
INSERT INTO `role_permission` VALUES ('1', '73');
INSERT INTO `role_permission` VALUES ('1', '74');
INSERT INTO `role_permission` VALUES ('1', '75');
INSERT INTO `role_permission` VALUES ('2', '3');
INSERT INTO `role_permission` VALUES ('2', '4');
INSERT INTO `role_permission` VALUES ('2', '5');
INSERT INTO `role_permission` VALUES ('2', '6');
INSERT INTO `role_permission` VALUES ('2', '7');
INSERT INTO `role_permission` VALUES ('2', '8');
INSERT INTO `role_permission` VALUES ('2', '9');
INSERT INTO `role_permission` VALUES ('2', '59');
INSERT INTO `role_permission` VALUES ('2', '60');
INSERT INTO `role_permission` VALUES ('2', '70');
INSERT INTO `role_permission` VALUES ('2', '71');
INSERT INTO `role_permission` VALUES ('2', '72');
INSERT INTO `role_permission` VALUES ('2', '73');
INSERT INTO `role_permission` VALUES ('2', '74');
INSERT INTO `role_permission` VALUES ('2', '75');
INSERT INTO `role_permission` VALUES ('3', '3');
INSERT INTO `role_permission` VALUES ('3', '4');
INSERT INTO `role_permission` VALUES ('3', '5');
INSERT INTO `role_permission` VALUES ('3', '6');
INSERT INTO `role_permission` VALUES ('3', '7');
INSERT INTO `role_permission` VALUES ('3', '8');
INSERT INTO `role_permission` VALUES ('3', '59');
INSERT INTO `role_permission` VALUES ('4', '3');
INSERT INTO `role_permission` VALUES ('4', '4');
INSERT INTO `role_permission` VALUES ('4', '5');
INSERT INTO `role_permission` VALUES ('4', '53');
INSERT INTO `role_permission` VALUES ('4', '54');
INSERT INTO `role_permission` VALUES ('4', '55');
INSERT INTO `role_permission` VALUES ('4', '59');

-- ----------------------------
-- Table structure for `sprint`
-- ----------------------------
DROP TABLE IF EXISTS `sprint`;
CREATE TABLE `sprint` (
  `spid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  `start_date_es` date NOT NULL,
  `end_date_es` date NOT NULL,
  PRIMARY KEY (`spid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sprint
-- ----------------------------
INSERT INTO `sprint` VALUES ('8', '1', 'Sprint 1', '', '2014-06-24', '2014-06-24', '2', '0', '2014-06-10', '2014-07-10');
INSERT INTO `sprint` VALUES ('9', '1', 'Sprint 2', '', '0000-00-00', '0000-00-00', '1', '0', '2014-07-21', '2014-08-21');
INSERT INTO `sprint` VALUES ('10', '1', 'Sprint 3', '', '0000-00-00', '0000-00-00', '1', '0', '2014-08-21', '2014-09-21');

-- ----------------------------
-- Table structure for `sprint_team`
-- ----------------------------
DROP TABLE IF EXISTS `sprint_team`;
CREATE TABLE `sprint_team` (
  `spid` bigint(20) NOT NULL,
  `tid` bigint(20) NOT NULL,
  `num_day` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spid`,`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sprint_team
-- ----------------------------
INSERT INTO `sprint_team` VALUES ('8', '17', '15');
INSERT INTO `sprint_team` VALUES ('8', '18', '6');
INSERT INTO `sprint_team` VALUES ('8', '19', '19');
INSERT INTO `sprint_team` VALUES ('9', '17', '10');
INSERT INTO `sprint_team` VALUES ('9', '18', '10');
INSERT INTO `sprint_team` VALUES ('9', '19', '9');
INSERT INTO `sprint_team` VALUES ('10', '17', '4');
INSERT INTO `sprint_team` VALUES ('10', '18', '2');
INSERT INTO `sprint_team` VALUES ('10', '19', '9');

-- ----------------------------
-- Table structure for `story`
-- ----------------------------
DROP TABLE IF EXISTS `story`;
CREATE TABLE `story` (
  `sid` bigint(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `time_estimate` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `demo` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  `finish_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of story
-- ----------------------------
INSERT INTO `story` VALUES ('1', '1', '1', 'Quán lí danh sách món ăn', '3', '11', '30', 'demoaddd', 'description', '6', '0', '2014-06-15 09:45:47', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('2', '1', '1', 'story 2', '1', '12', '20', 'demoa', 'description', '8', '1', '2014-06-16 09:39:41', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('4', '1', '1', 'story 4', '2', '19', '40', 'asdfa', 'asdf', '8', '1', '2014-06-17 09:39:49', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('5', '1', '1', 'story 5', '2', '15', '50', 'asdfff', 'asdf', '6', '1', '2014-06-18 09:39:58', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('6', '1', '1', 'story 6', '2', '4', '60', 'asfdd', 'sadfasdfsdf', '2', '1', '2014-06-19 09:40:31', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('7', '1', '1', 'story 7', '2', '2', '10', 'asfd', 'sadfasdfsdf', '8', '1', '2014-06-20 09:38:41', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('8', '1', '1', 'story 8', '1', '2', '90', 'asdf', 'sf', '1', '1', '2014-06-25 22:50:59', '2014-06-19 22:51:09');
INSERT INTO `story` VALUES ('9', '1', '1', 'story 9', '1', '12', '40', 'asdf', 'sf', '1', '1', '2014-07-03 22:51:04', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('10', '1', '1', 'Quản lí đặt bàn', '1', '3', '100', 'asdfasdfw', 'asdfasdf', '2', '0', '2014-06-22 09:42:37', '2014-06-13 22:51:09');
INSERT INTO `story` VALUES ('11', '1', '1', 'Quản lí đơn hàng', '1', '3', '23', 'asf', 'asf', '2', '0', '2014-06-20 22:51:06', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('12', '1', '1', 'Quản lí dụng cụ', '4', '4', '5', 'asf', 'asf', '2', '0', '2014-06-10 22:51:09', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('13', '1', '1', 'Thống kê bán hàng', '2', '5', '54', 'asf', 'asf', '2', '0', '2014-06-18 22:51:11', '2014-06-11 22:51:09');
INSERT INTO `story` VALUES ('14', '1', '1', 'story 14', '4', '2', '34', 'asfd', 'sdfsaf', '1', '1', '2014-06-28 22:51:16', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('15', '2', '1', 'story 15', '2', '4', '56', 'asdf', 'asdf', '1', '0', '2014-06-27 22:51:19', '2014-06-27 22:51:09');
INSERT INTO `story` VALUES ('19', '1', '1', 'story 16', '1', '4', '4', 'a', 'a', '1', '1', '2014-06-19 22:51:22', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('20', '1', '1', 'story 17', '2', '2', '11', 'a', 'a', '1', '1', '2014-06-10 22:51:24', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('22', '1', '1', 'story 18', '2', '5', '5', 'asdfasdf', 'asdfasdf', '2', '1', '2014-06-22 09:51:08', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('23', '1', '1', 'Quản lí khách hàng', '1', '5', '20', 'a', 'a', '2', '0', null, null);
INSERT INTO `story` VALUES ('24', '1', '1', 'Tính năng report', '3', null, null, 'a', 'a', '1', '1', null, null);
INSERT INTO `story` VALUES ('25', '1', '1', 'Tính năng report', '3', '10', '30', 'a', 'a', '2', '0', null, null);

-- ----------------------------
-- Table structure for `story_team`
-- ----------------------------
DROP TABLE IF EXISTS `story_team`;
CREATE TABLE `story_team` (
  `sid` bigint(20) NOT NULL,
  `tid` int(11) NOT NULL,
  `spid` int(11) NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`sid`,`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of story_team
-- ----------------------------
INSERT INTO `story_team` VALUES ('1', '17', '8', '0');
INSERT INTO `story_team` VALUES ('6', '18', '9', '1');
INSERT INTO `story_team` VALUES ('9', '17', '9', '1');
INSERT INTO `story_team` VALUES ('10', '17', '9', '1');
INSERT INTO `story_team` VALUES ('11', '18', '8', '0');
INSERT INTO `story_team` VALUES ('12', '18', '9', '1');
INSERT INTO `story_team` VALUES ('13', '19', '8', '0');
INSERT INTO `story_team` VALUES ('14', '18', '10', '1');
INSERT INTO `story_team` VALUES ('19', '18', '9', '1');
INSERT INTO `story_team` VALUES ('23', '17', '9', '0');
INSERT INTO `story_team` VALUES ('25', '19', '9', '0');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taid` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(450) COLLATE utf8_unicode_ci NOT NULL,
  `time_estimate` float NOT NULL,
  `time_remain` float DEFAULT NULL,
  `status` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `uid` int(11) DEFAULT NULL,
  `sid` bigint(20) DEFAULT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  `finish_date` datetime DEFAULT NULL,
  PRIMARY KEY (`taid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', 'task 1', '1', '0', '4', '2014-06-02 00:00:00', '1', 'task description here', '7', '1', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('2', 'task 2', '44', '0', '4', '2014-06-02 00:00:00', '1', 'task description here', '1', '1', '0', '2014-06-18 15:02:19');
INSERT INTO `task` VALUES ('3', 'task 3', '1', '0', '4', '2014-06-03 05:12:30', '1', 'task description here', '7', '10', '0', '2014-06-20 15:02:19');
INSERT INTO `task` VALUES ('4', 'task 4 ', '3', '0', '4', '2014-06-03 05:12:30', '1', 'task description here', '7', '11', '0', '2014-06-21 15:02:19');
INSERT INTO `task` VALUES ('5', 'task 5', '1', '0', '4', '2014-06-03 05:12:48', '1', 'task description here', '7', '12', '0', '2014-06-22 15:02:19');
INSERT INTO `task` VALUES ('6', 'task 6r', '5', '0', '3', '2014-06-03 05:12:48', '1', 'task description here', '15', '13', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('7', 'task 7', '1', '0', '4', '2014-06-03 05:14:19', '1', 'task description here', '15', '1', '0', '2014-06-24 15:02:19');
INSERT INTO `task` VALUES ('8', 'task 8', '5', '5', '2', '2014-06-03 05:14:20', '1', 'task description here', '15', '10', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('9', 'task 9', '2', '0', '2', '2014-06-03 05:18:12', '1', 'task description here', '7', '11', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('10', 'task 10', '2', '2', '1', '2014-06-03 05:18:12', '1', 'task description here', null, '12', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('11', 'task 11', '7', '0', '4', '2014-06-03 05:19:04', '1', 'task description here', '13', '13', '0', '2014-06-26 15:03:05');
INSERT INTO `task` VALUES ('12', 'task 12', '6', '0', '4', '2014-06-03 05:19:04', '1', 'task description here', '1', '13', '0', '2014-06-28 15:02:19');
INSERT INTO `task` VALUES ('13', 'task 13', '3', '0', '4', '2014-06-03 05:27:53', '1', 'task description here', '7', '12', '0', '2014-06-29 15:02:19');
INSERT INTO `task` VALUES ('14', 'task 14', '3', '0', '4', '2014-06-03 05:27:53', '1', 'task description here', '1', '11', '0', '2014-07-03 15:02:19');
INSERT INTO `task` VALUES ('15', 'task 15', '5', '0', '4', '2014-06-03 14:21:30', '1', 'task description here', '13', '10', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('16', 'task 16', '1', '0', '4', '2014-06-03 14:21:30', '1', 'task description here', '12', '1', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('17', 'task 17', '6', '0', '4', '2014-06-03 21:35:57', '1', 'task description here', '13', '11', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('18', 'task 18', '1', '0', '4', '2014-06-03 21:35:58', '1', 'task description here', '1', '12', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('19', 'task 19', '1', '0', '4', '2014-06-03 21:45:10', '1', 'task description here', '12', '13', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('20', 'task 20', '1', '0', '4', '2014-06-03 21:45:11', '1', 'task description here', '23', '10', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('27', 'Task 19', '4', '0', '4', '2014-06-21 20:38:49', '1', '', '12', '1', '0', '2014-06-17 15:02:19');

-- ----------------------------
-- Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `pid` int(11) NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('17', 'team 1', '1', '', '0');
INSERT INTO `team` VALUES ('18', 'team 2', '1', '', '0');
INSERT INTO `team` VALUES ('19', 'team 3', '1', '', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `login_nm` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O',
  `fullname` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default-avatar.jpg',
  `timezone` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`birthday`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 1', '2014-05-10', 'avatar-meo-396882118.jpg', null, 'ggjJQZfyTi4NrnUZhzMd8XgI7FDYLE7imm3kD07JxwXw13tLKO4JzX7CVjeZ', 'en', 'US', '0');
INSERT INTO `user` VALUES ('2', 'owner1', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'owner 1', '2014-05-20', 'default-avatar.jpg', '-8.0', 'MlzrZC0FtvRjy04Bi4CO7w4q6FdyRxpdRRUhEXA36kFUBNkPvpMTNomz7NM8', 'en', null, '0');
INSERT INTO `user` VALUES ('3', 'master1', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'scrum master', '2014-05-08', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('4', 'mem1', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 1', '2014-05-08', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('5', 'mem2', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 2', '2014-05-08', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('6', 'mem3', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 3', '2014-05-15', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('7', 'mem4', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 4', '2014-05-09', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('8', 'owner2', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'owner 2', '0000-00-00', 'default-avatar.jpg', null, null, 'en', null, '0');
INSERT INTO `user` VALUES ('9', 'mem2', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 5', '0000-00-00', 'default-avatar.jpg', null, null, 'en', null, '0');
INSERT INTO `user` VALUES ('11', 'leader3', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 3', '2014-05-22', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('12', 'leader4', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 4', '2014-05-15', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('13', 'leader5', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 5', '2014-05-30', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('14', 'leader7', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 7', '2014-05-23', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('15', 'leader8', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 8', '2014-05-28', 'default-avatar.jpg', '-6.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('21', 'duong', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Duong', '2014-05-16', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('22', 'yoko', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Yoko', '2014-05-14', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('23', 'mika', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Mika', '2014-05-14', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('24', '222', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', '11111', '2014-06-12', 'default-avatar.jpg', '-10.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('25', 'cccc', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'cvccc', '2014-06-18', 'default-avatar.jpg', '-11.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('26', 'aaaa', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'testaaa', '2014-06-06', 'default-avatar.jpg', '-10.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('27', 'aaa', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'testa', '2014-06-05', 'default-avatar.jpg', '-12.0', null, 'en', null, '0');
