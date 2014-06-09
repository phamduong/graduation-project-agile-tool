/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : scrumreal

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2014-06-07 17:26:14
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity
-- ----------------------------

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
-- Table structure for `calendar`
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of calendar
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pid` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of group
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
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'Quan li nha hang', '2014-05-13', '2014-05-29', null, 'a', '1', 'a');
INSERT INTO `project` VALUES ('2', 'Quản lí nhân sự', '2014-04-02', '2014-05-30', null, 'Cần xét lại', '1', 'Project test cho vui');

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
INSERT INTO `project_user` VALUES ('1', '1', '1', '2');
INSERT INTO `project_user` VALUES ('1', '2', '1', '1');
INSERT INTO `project_user` VALUES ('1', '3', '2', '3');
INSERT INTO `project_user` VALUES ('1', '4', '2', '3');
INSERT INTO `project_user` VALUES ('1', '5', '2', '3');
INSERT INTO `project_user` VALUES ('1', '7', '3', '2');
INSERT INTO `project_user` VALUES ('1', '8', '1', '3');
INSERT INTO `project_user` VALUES ('1', '9', '3', '3');
INSERT INTO `project_user` VALUES ('1', '11', '1', '3');
INSERT INTO `project_user` VALUES ('1', '12', '2', '3');
INSERT INTO `project_user` VALUES ('1', '13', '0', '3');
INSERT INTO `project_user` VALUES ('1', '14', '1', '3');
INSERT INTO `project_user` VALUES ('1', '15', '3', '3');
INSERT INTO `project_user` VALUES ('1', '21', '0', '3');
INSERT INTO `project_user` VALUES ('1', '22', '2', '3');

-- ----------------------------
-- Table structure for `release`
-- ----------------------------
DROP TABLE IF EXISTS `release`;
CREATE TABLE `release` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(450) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of release
-- ----------------------------

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
  PRIMARY KEY (`spid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sprint
-- ----------------------------
INSERT INTO `sprint` VALUES ('1', '1', 'Sprint 1q', '', '2014-03-01', '2014-05-01', '1');
INSERT INTO `sprint` VALUES ('2', '1', 'Sprint 2aaa', '', '2014-05-24', '2014-05-31', '2');
INSERT INTO `sprint` VALUES ('3', '1', 'Sprint 3', null, '2014-06-02', '2014-07-02', '1');
INSERT INTO `sprint` VALUES ('4', '1', 'Sprint test', 'a', '2014-06-04', '2014-06-28', '1');
INSERT INTO `sprint` VALUES ('5', '1', 'Sprint 5', 'aaaaaaaaaaaa', '2014-06-04', '2014-07-04', '1');

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
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of story
-- ----------------------------
INSERT INTO `story` VALUES ('1', '1', '1', 'story 1', '1', '11', '10', 'demo', 'description', '2');
INSERT INTO `story` VALUES ('2', '1', '1', 'story 2', '1', '3', '201', 'demo', 'description', '1');
INSERT INTO `story` VALUES ('3', '1', '1', 'story 3a', '1', '1', '30', 'demo', 'description', '1');
INSERT INTO `story` VALUES ('4', '1', '1', 'story 4', '2', '1', '40', 'asdf', 'asdf', '1');
INSERT INTO `story` VALUES ('5', '1', '1', 'story 5', '2', '2', '50', 'asdf', 'asdf', '1');
INSERT INTO `story` VALUES ('6', '1', '1', 'story 6', '2', '1', '60', 'asfd', 'sadfasdfsdf', '1');
INSERT INTO `story` VALUES ('7', '1', '1', 'story 7', '2', '2', '0', 'asfd', 'sadfasdfsdf', '1');
INSERT INTO `story` VALUES ('8', '1', '1', 'story 8', '1', '2', '90', 'asdf', 'sf', '1');
INSERT INTO `story` VALUES ('9', '1', '1', 'story 9', '1', '12', '40', 'asdf', 'sf', '1');
INSERT INTO `story` VALUES ('10', '1', '1', 'story 10', '1', '1', '100', 'asdfasdf', 'asdfasdf', '2');
INSERT INTO `story` VALUES ('11', '1', '1', 'story 11', '1', '1', '23', 'asf', 'asf', '2');
INSERT INTO `story` VALUES ('12', '1', '1', 'story 12', '1', '1', '34', 'asf', 'asf', '2');
INSERT INTO `story` VALUES ('13', '1', '1', 'story 13', '2', '1', '54', 'asf', 'asf', '1');
INSERT INTO `story` VALUES ('14', '1', '1', 'story 14', '4', '111', '34', 'asfd', 'sdfsaf', '1');
INSERT INTO `story` VALUES ('15', '2', '1', 'story 15', '2', null, '56', 'asdf', 'asdf', '1');
INSERT INTO `story` VALUES ('19', '1', '1', 'Test', '1', '4', '4', 'a', 'a', '1');
INSERT INTO `story` VALUES ('20', '1', '1', 'Story 100', '2', '1', '11', 'a', 'a', '1');
INSERT INTO `story` VALUES ('21', '1', '1', 'Sprint 19', '3', '2', '2', 'a', 'a', '2');

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
INSERT INTO `story_team` VALUES ('1', '3', '1', '3');
INSERT INTO `story_team` VALUES ('2', '3', '2', '0');
INSERT INTO `story_team` VALUES ('3', '3', '1', '1');
INSERT INTO `story_team` VALUES ('4', '4', '1', '1');
INSERT INTO `story_team` VALUES ('5', '2', '2', '0');
INSERT INTO `story_team` VALUES ('10', '2', '1', '1');
INSERT INTO `story_team` VALUES ('11', '4', '1', '0');
INSERT INTO `story_team` VALUES ('12', '1', '2', '0');
INSERT INTO `story_team` VALUES ('13', '1', '1', '0');
INSERT INTO `story_team` VALUES ('14', '3', '1', '2');
INSERT INTO `story_team` VALUES ('20', '4', '2', '0');

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
  PRIMARY KEY (`taid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', 'task 1', '2', '0', '3', '2014-06-02 00:00:00', '1', 'task description here', '7', '1');
INSERT INTO `task` VALUES ('2', 'task 2', '3', '3', '1', '2014-06-02 00:00:00', '1', 'task description here', '1', '2');
INSERT INTO `task` VALUES ('3', 'task 3', '1.5', '0', '4', '2014-06-03 05:12:30', '1', 'task description here', '7', '1');
INSERT INTO `task` VALUES ('4', 'task 4 ', '3', '3', '1', '2014-06-03 05:12:30', '1', 'task description here', '7', '2');
INSERT INTO `task` VALUES ('5', 'task 5', '0.5', '0.5', '1', '2014-06-03 05:12:48', '1', 'task description here', '7', '2');
INSERT INTO `task` VALUES ('6', 'task 6r', '5', '0', '3', '2014-06-03 05:12:48', '1', 'task description here', '15', '1');
INSERT INTO `task` VALUES ('7', 'task 7', '1', '1', '1', '2014-06-03 05:14:19', '1', 'task description here', '15', '4');
INSERT INTO `task` VALUES ('8', 'task 8', '5', '5', '1', '2014-06-03 05:14:20', '1', 'task description here', '15', '3');
INSERT INTO `task` VALUES ('9', 'task 9', '2', '0', '4', '2014-06-03 05:18:12', '1', 'task description here', '7', '1');
INSERT INTO `task` VALUES ('10', 'task 10', '2', '2', '1', '2014-06-03 05:18:12', '1', 'task description here', null, '3');
INSERT INTO `task` VALUES ('11', 'task 11', '7', '7', '1', '2014-06-03 05:19:04', '1', 'task description here', null, '4');
INSERT INTO `task` VALUES ('12', 'task 12', '6', '6', '1', '2014-06-03 05:19:04', '1', 'task description here', null, '3');
INSERT INTO `task` VALUES ('13', 'task 13', '3', '0', '4', '2014-06-03 05:27:53', '1', 'task description here', '7', '1');
INSERT INTO `task` VALUES ('14', 'task  14', '3', '3', '1', '2014-06-03 05:27:53', '1', 'task description here', null, '3');
INSERT INTO `task` VALUES ('15', 'task 15', '5', '5', '1', '2014-06-03 14:21:30', '1', 'task description here', null, '4');
INSERT INTO `task` VALUES ('16', 'task 16', '1', '1', '1', '2014-06-03 14:21:30', '1', 'task description here', null, '2');
INSERT INTO `task` VALUES ('17', 'task 17', '0', '0', '1', '2014-06-03 21:35:57', '1', 'task description here', null, '4');
INSERT INTO `task` VALUES ('18', 'task 18', '1', '1', '1', '2014-06-03 21:35:58', '1', 'task description here', null, '3');
INSERT INTO `task` VALUES ('19', 'task 19', '1', '1', '1', '2014-06-03 21:45:10', '1', 'task description here', null, '10');
INSERT INTO `task` VALUES ('20', 'task 20', '1', '1', '1', '2014-06-03 21:45:11', '1', 'task description here', null, '10');
INSERT INTO `task` VALUES ('21', 'Task aaaa', '3', '0', '1', '2014-06-05 17:21:58', '1', '', '0', '13');
INSERT INTO `task` VALUES ('22', 'Task aaaaaa', '0.5', '0', '2', '2014-06-05 17:24:56', '1', 'd', '8', '13');
INSERT INTO `task` VALUES ('23', 'Tabk ad', '4', '0', '1', '2014-06-05 17:27:08', '1', '', '8', '13');
INSERT INTO `task` VALUES ('24', 'Test', '1', '1', '1', '2014-06-06 08:45:26', '1', '', null, '21');
INSERT INTO `task` VALUES ('25', 'Test', '14', '14', '1', '2014-06-06 08:45:26', '1', '', null, '21');
INSERT INTO `task` VALUES ('26', 't55', '3', '3', '1', '2014-06-06 09:33:46', '1', '', null, '21');

-- ----------------------------
-- Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `pid` int(11) NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('1', 'team 1', '1', '');
INSERT INTO `team` VALUES ('2', 'team 2', '1', null);
INSERT INTO `team` VALUES ('3', 'team 3', '1', null);
INSERT INTO `team` VALUES ('4', 'Team 4', '1', null);
INSERT INTO `team` VALUES ('5', 'Team 5', '1', null);

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
  `show_nav` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`birthday`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 1', '2014-05-10', 'avatar-meo-396882118.jpg', null, 'ESYB1KzQDcHFWuxqUuIzG9J1sD2gOmcqFGEKnwRRIfiLuC9MSYFHcFPdEqh0', 'en', 'US', '0');
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
