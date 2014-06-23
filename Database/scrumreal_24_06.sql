/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : scrumreal

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2014-06-24 00:35:44
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
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '1', '1', '1', '1', '2014-06-07 17:28:36', '1');
INSERT INTO `activity` VALUES ('2', '2', '1', '1', '1+2', '2014-06-07 17:41:24', '1');
INSERT INTO `activity` VALUES ('3', '3', '1', '1', '1+4', '2014-06-07 17:41:52', '2');
INSERT INTO `activity` VALUES ('4', '4', '1', '1', 'NAME+Quan li nha hang+quan li nha hang khach san', '2014-06-07 17:50:45', '1');
INSERT INTO `activity` VALUES ('5', '4', '21', '2', 'Name+Sprint 19aaa+Sprint 19aaa', '2014-06-08 15:46:41', '1');
INSERT INTO `activity` VALUES ('6', '4', '21', '2', 'Name+Sprint 19aaa+Sprint 19', '2014-06-08 15:51:28', '1');
INSERT INTO `activity` VALUES ('8', '2', '1', '1', '22+2', '2014-06-08 22:29:10', '1');
INSERT INTO `activity` VALUES ('9', '4', '1', '3', 'Master+leader 1+owner 1', '2014-06-09 09:42:01', '1');
INSERT INTO `activity` VALUES ('10', '4', '1', '3', 'Master+owner 1+leader 1', '2014-06-09 09:44:19', '1');
INSERT INTO `activity` VALUES ('11', '4', '1', '3', 'Master+leader 1+cvccc', '2014-06-09 09:46:59', '1');
INSERT INTO `activity` VALUES ('12', '2', '1', '3', '1+8', '2014-06-09 09:59:49', '1');
INSERT INTO `activity` VALUES ('13', '2', '3', '3', '24+8', '2014-06-09 09:59:51', '1');
INSERT INTO `activity` VALUES ('14', '4', '1', '3', 'Master+cvccc+testaaa', '2014-06-09 10:00:01', '1');
INSERT INTO `activity` VALUES ('15', '3', '0', '3', '24+8', '2014-06-09 10:00:13', '1');
INSERT INTO `activity` VALUES ('16', '3', '1', '3', '8+8', '2014-06-09 10:58:40', '1');
INSERT INTO `activity` VALUES ('17', '4', '22', '2', 'Estimate time++5', '2014-06-10 08:39:15', '1');
INSERT INTO `activity` VALUES ('18', '4', '22', '2', 'Story point++5', '2014-06-10 08:39:15', '1');
INSERT INTO `activity` VALUES ('19', '4', '9', '1', 'Start data+2014-06-10+2014-06-01', '2014-06-10 09:43:03', '1');
INSERT INTO `activity` VALUES ('20', '4', '9', '1', 'Estimate end date+2014-06-27+2014-06-30', '2014-06-10 09:43:03', '1');
INSERT INTO `activity` VALUES ('21', '4', '1', '4', 'Start date+2014-03-01+2014-06-01', '2014-06-10 09:45:00', '1');
INSERT INTO `activity` VALUES ('22', '4', '1', '4', 'End date+2014-05-01+2014-06-30', '2014-06-10 09:45:00', '1');
INSERT INTO `activity` VALUES ('23', '4', '1', '4', 'Start date+2014-03-01+2014-06-01', '2014-06-10 09:45:36', '1');
INSERT INTO `activity` VALUES ('24', '4', '1', '4', 'End date+2014-05-01+2014-06-30', '2014-06-10 09:45:36', '1');
INSERT INTO `activity` VALUES ('25', '4', '1', '4', 'Description++aaaaaaaaaaaa', '2014-06-10 09:46:01', '1');
INSERT INTO `activity` VALUES ('26', '4', '1', '4', 'Description+aaaaaaaaaaaa+bbbbbb', '2014-06-10 09:46:27', '1');
INSERT INTO `activity` VALUES ('27', '1', '1', '1', '167', '2014-06-10 09:54:04', '1');
INSERT INTO `activity` VALUES ('28', '4', '1', '1', 'Name+Quan li nha hang+Quan li nha hanga', '2014-06-10 10:24:20', '1');
INSERT INTO `activity` VALUES ('29', '4', '1', '1', 'Start date+2014-05-13+2014-05-26', '2014-06-10 10:24:20', '1');
INSERT INTO `activity` VALUES ('30', '4', '1', '1', 'Estimate end date+2014-05-29+2014-06-26', '2014-06-10 10:24:20', '1');
INSERT INTO `activity` VALUES ('31', '4', '1', '1', 'Desciption+a+aa', '2014-06-10 10:24:20', '1');
INSERT INTO `activity` VALUES ('32', '4', '1', '1', 'Note+a+aa', '2014-06-10 10:24:20', '1');
INSERT INTO `activity` VALUES ('33', '2', '3', '3', '6+8', '2014-06-13 17:56:52', '1');
INSERT INTO `activity` VALUES ('34', '3', '3', '3', '9+8', '2014-06-13 17:56:56', '1');
INSERT INTO `activity` VALUES ('35', '2', '1', '4', '8+2', '2014-06-13 17:58:28', '1');
INSERT INTO `activity` VALUES ('36', '2', '2', '3', '8+2', '2014-06-13 17:58:28', '1');
INSERT INTO `activity` VALUES ('37', '4', '22', '6', 'Status+In Progress+To test', '2014-06-13 17:59:09', '1');
INSERT INTO `activity` VALUES ('38', '4', '22', '6', 'Status+To test+Done', '2014-06-13 17:59:12', '1');
INSERT INTO `activity` VALUES ('39', '4', '23', '6', 'Status+To do+In Progress', '2014-06-13 17:59:42', '1');
INSERT INTO `activity` VALUES ('40', '4', '23', '6', 'Status+In Progress+To test', '2014-06-13 17:59:48', '1');
INSERT INTO `activity` VALUES ('41', '4', '23', '6', 'Time remain+1+1', '2014-06-13 18:00:07', '1');
INSERT INTO `activity` VALUES ('42', '2', '1', '4', '7+2', '2014-06-13 18:02:29', '1');
INSERT INTO `activity` VALUES ('43', '2', '1', '3', '7+2', '2014-06-13 18:02:29', '1');
INSERT INTO `activity` VALUES ('44', '2', '1', '4', '19+2', '2014-06-13 18:02:49', '1');
INSERT INTO `activity` VALUES ('45', '2', '5', '3', '19+2', '2014-06-13 18:02:49', '1');
INSERT INTO `activity` VALUES ('46', '4', '6', '6', 'Status+To test+In Progress', '2014-06-17 06:12:34', '1');
INSERT INTO `activity` VALUES ('47', '4', '6', '6', 'Status+In Progress+To test', '2014-06-17 06:13:03', '1');
INSERT INTO `activity` VALUES ('48', '4', '6', '6', 'Status+To test+Done', '2014-06-17 06:13:05', '1');
INSERT INTO `activity` VALUES ('49', '4', '1', '6', 'Status+To test+Done', '2014-06-17 06:13:06', '1');
INSERT INTO `activity` VALUES ('50', '4', '3', '6', 'Status+Done+To test', '2014-06-17 06:14:11', '1');
INSERT INTO `activity` VALUES ('51', '4', '1', '6', 'Status+Done+To test', '2014-06-17 06:14:12', '1');
INSERT INTO `activity` VALUES ('52', '4', '6', '6', 'Status+Done+To test', '2014-06-17 06:14:14', '1');
INSERT INTO `activity` VALUES ('53', '4', '13', '6', 'Status+Done+To test', '2014-06-17 06:14:15', '1');
INSERT INTO `activity` VALUES ('54', '4', '9', '6', 'Status+Done+To test', '2014-06-17 06:19:30', '1');
INSERT INTO `activity` VALUES ('55', '4', '3', '6', 'Status+To test+In Progress', '2014-06-17 06:19:32', '1');
INSERT INTO `activity` VALUES ('56', '4', '3', '6', 'Status+In Progress+To do', '2014-06-17 06:19:34', '1');
INSERT INTO `activity` VALUES ('57', '4', '3', '6', 'Status+To do+In Progress', '2014-06-17 06:19:35', '1');
INSERT INTO `activity` VALUES ('58', '4', '3', '6', 'Status+In Progress+To test', '2014-06-17 06:19:36', '1');
INSERT INTO `activity` VALUES ('59', '4', '3', '6', 'Status+To test+Done', '2014-06-17 06:19:38', '1');
INSERT INTO `activity` VALUES ('60', '4', '1', '6', 'Status+To test+Done', '2014-06-17 06:19:39', '1');
INSERT INTO `activity` VALUES ('61', '4', '1', '6', 'Status+Done+To test', '2014-06-17 06:21:09', '1');
INSERT INTO `activity` VALUES ('62', '4', '3', '6', 'Status+Done+To do', '2014-06-17 06:21:10', '1');
INSERT INTO `activity` VALUES ('63', '4', '3', '6', 'Status+To do+In Progress', '2014-06-17 06:24:32', '1');
INSERT INTO `activity` VALUES ('64', '4', '1', '6', 'Status+To test+In Progress', '2014-06-17 06:25:28', '1');
INSERT INTO `activity` VALUES ('65', '4', '3', '6', 'Status+To do+In Progress', '2014-06-17 06:25:42', '1');
INSERT INTO `activity` VALUES ('66', '4', '13', '6', 'Status+To test+In Progress', '2014-06-17 06:28:16', '1');
INSERT INTO `activity` VALUES ('67', '4', '6', '6', 'Status+To test+In Progress', '2014-06-17 06:29:15', '1');
INSERT INTO `activity` VALUES ('68', '4', '3', '6', 'Status+To do+To test', '2014-06-17 06:29:44', '1');
INSERT INTO `activity` VALUES ('69', '4', '1', '6', 'Status+To test+In Progress', '2014-06-17 06:31:15', '1');
INSERT INTO `activity` VALUES ('70', '4', '13', '6', 'Status+To test+In Progress', '2014-06-17 06:32:11', '1');
INSERT INTO `activity` VALUES ('71', '4', '9', '6', 'Status+To test+In Progress', '2014-06-17 06:32:13', '1');
INSERT INTO `activity` VALUES ('72', '4', '3', '6', 'Status+To do+Done', '2014-06-17 06:32:30', '1');
INSERT INTO `activity` VALUES ('73', '4', '3', '6', 'Status+To do+In Progress', '2014-06-17 06:33:08', '1');
INSERT INTO `activity` VALUES ('74', '4', '3', '6', 'Status+In Progress+To test', '2014-06-17 06:34:29', '1');
INSERT INTO `activity` VALUES ('75', '4', '3', '6', 'Status+To test+In Progress', '2014-06-17 06:35:00', '1');
INSERT INTO `activity` VALUES ('76', '4', '3', '6', 'Status+In Progress+To test', '2014-06-17 06:35:18', '1');
INSERT INTO `activity` VALUES ('77', '4', '1', '6', 'Status+To test+In Progress', '2014-06-17 08:10:26', '1');
INSERT INTO `activity` VALUES ('78', '4', '6', '6', 'Status+To test+In Progress', '2014-06-17 08:10:50', '1');
INSERT INTO `activity` VALUES ('79', '4', '13', '6', 'Status+To test+In Progress', '2014-06-17 08:13:21', '1');
INSERT INTO `activity` VALUES ('80', '4', '9', '6', 'Status+To test+To do', '2014-06-17 08:13:32', '1');
INSERT INTO `activity` VALUES ('81', '4', '13', '6', 'Status+In Progress+To do', '2014-06-17 08:13:58', '1');
INSERT INTO `activity` VALUES ('82', '4', '9', '6', 'Status+To do+In Progress', '2014-06-17 08:15:06', '1');
INSERT INTO `activity` VALUES ('83', '4', '13', '6', 'Status+To do+In Progress', '2014-06-17 08:16:04', '1');
INSERT INTO `activity` VALUES ('84', '4', '13', '6', 'Status+In Progress+To test', '2014-06-17 08:16:13', '1');
INSERT INTO `activity` VALUES ('85', '4', '3', '6', 'Status+To test+In Progress', '2014-06-17 08:16:20', '1');
INSERT INTO `activity` VALUES ('86', '4', '3', '6', 'Status+In Progress+To test', '2014-06-17 08:17:27', '1');
INSERT INTO `activity` VALUES ('87', '4', '6', '6', 'Status+In Progress+To do', '2014-06-17 08:17:31', '1');
INSERT INTO `activity` VALUES ('88', '4', '1', '6', 'Status+In Progress+To do', '2014-06-17 08:18:31', '1');
INSERT INTO `activity` VALUES ('89', '4', '6', '6', 'Status+To do+In Progress', '2014-06-17 08:18:35', '1');
INSERT INTO `activity` VALUES ('90', '4', '1', '6', 'Status+To do+In Progress', '2014-06-17 08:18:36', '1');
INSERT INTO `activity` VALUES ('91', '4', '1', '6', 'Status+In Progress+To test', '2014-06-17 08:18:41', '1');
INSERT INTO `activity` VALUES ('92', '4', '9', '6', 'Status+In Progress+To test', '2014-06-17 08:18:41', '1');
INSERT INTO `activity` VALUES ('93', '4', '6', '6', 'Status+In Progress+To test', '2014-06-17 08:18:43', '1');
INSERT INTO `activity` VALUES ('94', '4', '3', '6', 'Status+To test+Done', '2014-06-17 08:18:47', '1');
INSERT INTO `activity` VALUES ('95', '4', '1', '6', 'Status+To test+Done', '2014-06-17 08:18:49', '1');
INSERT INTO `activity` VALUES ('96', '4', '9', '6', 'Status+To test+Done', '2014-06-17 08:18:50', '1');
INSERT INTO `activity` VALUES ('97', '4', '6', '6', 'Status+To test+Done', '2014-06-17 08:18:51', '1');
INSERT INTO `activity` VALUES ('98', '4', '13', '6', 'Status+To test+Done', '2014-06-17 08:18:52', '1');
INSERT INTO `activity` VALUES ('99', '4', '1', '6', 'Status+Done+To test', '2014-06-17 08:33:38', '1');
INSERT INTO `activity` VALUES ('100', '4', '6', '6', 'Status+Done+To test', '2014-06-17 08:33:41', '1');
INSERT INTO `activity` VALUES ('101', '4', '1', '6', 'Status+To test+In Progress', '2014-06-17 08:33:43', '1');
INSERT INTO `activity` VALUES ('102', '2', '1', '1', '6+4', '2014-06-18 19:57:18', '1');
INSERT INTO `activity` VALUES ('103', '3', '1', '1', '6+4', '2014-06-18 20:45:01', '1');
INSERT INTO `activity` VALUES ('104', '3', '1', '1', '6+4', '2014-06-18 20:46:09', '1');
INSERT INTO `activity` VALUES ('105', '3', '1', '4', '7+2', '2014-06-19 06:05:30', '1');
INSERT INTO `activity` VALUES ('106', '3', '1', '3', '7+2', '2014-06-19 06:05:30', '1');
INSERT INTO `activity` VALUES ('107', '3', '1', '4', '13+2', '2014-06-19 06:05:32', '1');
INSERT INTO `activity` VALUES ('108', '3', '1', '3', '13+2', '2014-06-19 06:05:32', '1');
INSERT INTO `activity` VALUES ('109', '3', '1', '4', '8+2', '2014-06-19 06:05:33', '1');
INSERT INTO `activity` VALUES ('110', '3', '2', '3', '8+2', '2014-06-19 06:05:33', '1');
INSERT INTO `activity` VALUES ('111', '3', '1', '4', '10+2', '2014-06-19 06:05:35', '1');
INSERT INTO `activity` VALUES ('112', '3', '2', '3', '10+2', '2014-06-19 06:05:35', '1');
INSERT INTO `activity` VALUES ('113', '3', '1', '4', '1+2', '2014-06-19 06:05:36', '1');
INSERT INTO `activity` VALUES ('114', '3', '3', '3', '1+2', '2014-06-19 06:05:36', '1');
INSERT INTO `activity` VALUES ('115', '3', '1', '4', '14+2', '2014-06-19 06:05:37', '1');
INSERT INTO `activity` VALUES ('116', '3', '3', '3', '14+2', '2014-06-19 06:05:37', '1');
INSERT INTO `activity` VALUES ('117', '3', '1', '4', '11+2', '2014-06-19 06:05:38', '1');
INSERT INTO `activity` VALUES ('118', '3', '4', '3', '11+2', '2014-06-19 06:05:39', '1');
INSERT INTO `activity` VALUES ('119', '3', '1', '4', '4+2', '2014-06-19 06:05:39', '1');
INSERT INTO `activity` VALUES ('120', '3', '4', '3', '4+2', '2014-06-19 06:05:39', '1');
INSERT INTO `activity` VALUES ('121', '3', '1', '4', '19+2', '2014-06-19 06:05:40', '1');
INSERT INTO `activity` VALUES ('122', '3', '5', '3', '19+2', '2014-06-19 06:05:40', '1');
INSERT INTO `activity` VALUES ('123', '3', '2', '4', '5+2', '2014-06-19 06:06:05', '1');
INSERT INTO `activity` VALUES ('124', '3', '2', '3', '5+2', '2014-06-19 06:06:05', '1');
INSERT INTO `activity` VALUES ('125', '3', '2', '4', '2+2', '2014-06-19 06:06:06', '1');
INSERT INTO `activity` VALUES ('126', '3', '3', '3', '2+2', '2014-06-19 06:06:06', '1');
INSERT INTO `activity` VALUES ('127', '3', '2', '4', '20+2', '2014-06-19 06:06:07', '1');
INSERT INTO `activity` VALUES ('128', '3', '4', '3', '20+2', '2014-06-19 06:06:07', '1');
INSERT INTO `activity` VALUES ('129', '3', '2', '4', '12+2', '2014-06-19 06:06:08', '1');
INSERT INTO `activity` VALUES ('130', '3', '1', '3', '12+2', '2014-06-19 06:06:08', '1');
INSERT INTO `activity` VALUES ('131', '2', '1', '1', '9+3', '2014-06-19 22:40:51', '1');
INSERT INTO `activity` VALUES ('132', '2', '1', '1', '10+3', '2014-06-19 22:45:34', '1');
INSERT INTO `activity` VALUES ('133', '3', '1', '1', '10+3', '2014-06-19 22:46:09', '1');
INSERT INTO `activity` VALUES ('134', '2', '1', '1', '11+3', '2014-06-20 05:49:14', '1');
INSERT INTO `activity` VALUES ('135', '3', '1', '1', '11+3', '2014-06-20 05:50:03', '1');
INSERT INTO `activity` VALUES ('136', '2', '1', '1', '12+3', '2014-06-20 05:51:06', '1');
INSERT INTO `activity` VALUES ('137', '3', '1', '1', '12+3', '2014-06-20 05:51:25', '1');
INSERT INTO `activity` VALUES ('138', '2', '1', '1', '13+3', '2014-06-20 05:55:35', '1');
INSERT INTO `activity` VALUES ('139', '4', '13', '3', 'Master+leader 1+leader 5', '2014-06-20 05:59:31', '1');
INSERT INTO `activity` VALUES ('140', '2', '1', '1', '7+4', '2014-06-20 06:11:36', '1');
INSERT INTO `activity` VALUES ('141', '3', '1', '1', '7+4', '2014-06-20 06:13:10', '1');
INSERT INTO `activity` VALUES ('142', '3', '1', '1', '1+4', '2014-06-20 06:20:56', '1');
INSERT INTO `activity` VALUES ('143', '3', '1', '1', '2+4', '2014-06-20 06:25:23', '1');
INSERT INTO `activity` VALUES ('144', '3', '1', '1', '4+4', '2014-06-20 06:25:33', '1');
INSERT INTO `activity` VALUES ('145', '3', '1', '1', '3+4', '2014-06-20 06:25:44', '1');
INSERT INTO `activity` VALUES ('146', '3', '1', '1', '5+4', '2014-06-20 06:43:33', '1');
INSERT INTO `activity` VALUES ('147', '4', '13', '3', 'Name+aaa+team 1', '2014-06-20 20:17:19', '1');
INSERT INTO `activity` VALUES ('148', '2', '1', '1', '14+3', '2014-06-20 20:17:39', '1');
INSERT INTO `activity` VALUES ('149', '2', '1', '1', '15+3', '2014-06-20 20:18:09', '1');
INSERT INTO `activity` VALUES ('150', '2', '1', '1', '16+3', '2014-06-20 20:18:30', '1');
INSERT INTO `activity` VALUES ('151', '2', '1', '1', '8+4', '2014-06-20 20:24:49', '1');
INSERT INTO `activity` VALUES ('152', '2', '1', '1', '9+4', '2014-06-20 20:25:02', '1');
INSERT INTO `activity` VALUES ('153', '3', '1', '1', '13+3', '2014-06-20 20:26:49', '1');
INSERT INTO `activity` VALUES ('154', '3', '1', '1', '16+3', '2014-06-20 20:27:22', '1');
INSERT INTO `activity` VALUES ('155', '3', '1', '1', '15+3', '2014-06-20 20:27:34', '1');
INSERT INTO `activity` VALUES ('156', '2', '1', '1', '17+3', '2014-06-20 21:47:14', '1');
INSERT INTO `activity` VALUES ('157', '2', '1', '1', '18+3', '2014-06-20 21:47:36', '1');
INSERT INTO `activity` VALUES ('158', '2', '1', '1', '19+3', '2014-06-20 21:48:54', '1');
INSERT INTO `activity` VALUES ('159', '2', '1', '1', '10+4', '2014-06-20 21:50:04', '1');
INSERT INTO `activity` VALUES ('160', '2', '8', '4', '1+2', '2014-06-20 21:52:07', '1');
INSERT INTO `activity` VALUES ('161', '2', '17', '3', '1+2', '2014-06-20 21:52:07', '1');
INSERT INTO `activity` VALUES ('162', '2', '9', '4', '13+2', '2014-06-21 07:59:32', '1');
INSERT INTO `activity` VALUES ('163', '2', '19', '3', '13+2', '2014-06-21 07:59:33', '1');
INSERT INTO `activity` VALUES ('164', '2', '9', '4', '14+2', '2014-06-21 07:59:34', '1');
INSERT INTO `activity` VALUES ('165', '2', '19', '3', '14+2', '2014-06-21 07:59:34', '1');
INSERT INTO `activity` VALUES ('166', '2', '9', '4', '2+2', '2014-06-21 07:59:36', '1');
INSERT INTO `activity` VALUES ('167', '2', '17', '3', '2+2', '2014-06-21 07:59:36', '1');
INSERT INTO `activity` VALUES ('168', '2', '9', '4', '5+2', '2014-06-21 07:59:36', '1');
INSERT INTO `activity` VALUES ('169', '2', '18', '3', '5+2', '2014-06-21 07:59:36', '1');
INSERT INTO `activity` VALUES ('170', '2', '10', '4', '7+2', '2014-06-21 07:59:37', '1');
INSERT INTO `activity` VALUES ('171', '2', '18', '3', '7+2', '2014-06-21 07:59:37', '1');
INSERT INTO `activity` VALUES ('172', '2', '10', '4', '8+2', '2014-06-21 07:59:39', '1');
INSERT INTO `activity` VALUES ('173', '2', '17', '3', '8+2', '2014-06-21 07:59:39', '1');
INSERT INTO `activity` VALUES ('174', '2', '10', '4', '4+2', '2014-06-21 07:59:40', '1');
INSERT INTO `activity` VALUES ('175', '2', '19', '3', '4+2', '2014-06-21 07:59:40', '1');
INSERT INTO `activity` VALUES ('176', '2', '8', '4', '11+2', '2014-06-21 08:57:11', '1');
INSERT INTO `activity` VALUES ('177', '2', '19', '3', '11+2', '2014-06-21 08:57:11', '1');
INSERT INTO `activity` VALUES ('178', '2', '8', '4', '6+2', '2014-06-21 09:00:56', '1');
INSERT INTO `activity` VALUES ('179', '2', '19', '3', '6+2', '2014-06-21 09:00:56', '1');
INSERT INTO `activity` VALUES ('180', '3', '8', '4', '11+2', '2014-06-21 09:01:12', '1');
INSERT INTO `activity` VALUES ('181', '3', '19', '3', '11+2', '2014-06-21 09:01:12', '1');
INSERT INTO `activity` VALUES ('182', '3', '8', '4', '12+2', '2014-06-21 09:04:11', '1');
INSERT INTO `activity` VALUES ('183', '3', '19', '3', '12+2', '2014-06-21 09:04:11', '1');
INSERT INTO `activity` VALUES ('184', '2', '8', '4', '10+2', '2014-06-21 09:06:56', '1');
INSERT INTO `activity` VALUES ('185', '2', '19', '3', '10+2', '2014-06-21 09:06:56', '1');
INSERT INTO `activity` VALUES ('186', '2', '8', '4', '10+2', '2014-06-21 09:06:58', '1');
INSERT INTO `activity` VALUES ('187', '2', '18', '3', '10+2', '2014-06-21 09:06:58', '1');
INSERT INTO `activity` VALUES ('188', '3', '8', '4', '10+2', '2014-06-21 09:06:58', '1');
INSERT INTO `activity` VALUES ('189', '3', '19', '3', '10+2', '2014-06-21 09:06:58', '1');
INSERT INTO `activity` VALUES ('190', '2', '8', '4', '10+2', '2014-06-21 09:07:01', '1');
INSERT INTO `activity` VALUES ('191', '2', '19', '3', '10+2', '2014-06-21 09:07:01', '1');
INSERT INTO `activity` VALUES ('192', '3', '8', '4', '10+2', '2014-06-21 09:07:01', '1');
INSERT INTO `activity` VALUES ('193', '3', '18', '3', '10+2', '2014-06-21 09:07:01', '1');
INSERT INTO `activity` VALUES ('194', '2', '8', '4', '11+2', '2014-06-21 09:07:09', '1');
INSERT INTO `activity` VALUES ('195', '2', '19', '3', '11+2', '2014-06-21 09:07:09', '1');
INSERT INTO `activity` VALUES ('196', '3', '8', '4', '11+2', '2014-06-21 09:07:12', '1');
INSERT INTO `activity` VALUES ('197', '3', '19', '3', '11+2', '2014-06-21 09:07:12', '1');
INSERT INTO `activity` VALUES ('198', '3', '8', '4', '6+2', '2014-06-21 09:07:57', '1');
INSERT INTO `activity` VALUES ('199', '3', '19', '3', '6+2', '2014-06-21 09:07:57', '1');
INSERT INTO `activity` VALUES ('200', '2', '8', '4', '11+2', '2014-06-21 09:08:01', '1');
INSERT INTO `activity` VALUES ('201', '2', '19', '3', '11+2', '2014-06-21 09:08:01', '1');
INSERT INTO `activity` VALUES ('202', '2', '8', '4', '6+2', '2014-06-21 09:08:04', '1');
INSERT INTO `activity` VALUES ('203', '2', '19', '3', '6+2', '2014-06-21 09:08:04', '1');
INSERT INTO `activity` VALUES ('204', '2', '8', '4', '9+2', '2014-06-21 09:08:06', '1');
INSERT INTO `activity` VALUES ('205', '2', '19', '3', '9+2', '2014-06-21 09:08:06', '1');
INSERT INTO `activity` VALUES ('206', '3', '8', '4', '11+2', '2014-06-21 09:08:08', '1');
INSERT INTO `activity` VALUES ('207', '3', '19', '3', '11+2', '2014-06-21 09:08:08', '1');
INSERT INTO `activity` VALUES ('208', '2', '8', '4', '12+2', '2014-06-21 09:08:12', '1');
INSERT INTO `activity` VALUES ('209', '2', '19', '3', '12+2', '2014-06-21 09:08:12', '1');
INSERT INTO `activity` VALUES ('210', '2', '8', '4', '19+2', '2014-06-21 09:08:15', '1');
INSERT INTO `activity` VALUES ('211', '2', '19', '3', '19+2', '2014-06-21 09:08:15', '1');
INSERT INTO `activity` VALUES ('212', '2', '8', '4', '9+2', '2014-06-21 09:09:41', '1');
INSERT INTO `activity` VALUES ('213', '2', '18', '3', '9+2', '2014-06-21 09:09:41', '1');
INSERT INTO `activity` VALUES ('214', '3', '8', '4', '9+2', '2014-06-21 09:09:41', '1');
INSERT INTO `activity` VALUES ('215', '3', '19', '3', '9+2', '2014-06-21 09:09:41', '1');
INSERT INTO `activity` VALUES ('216', '2', '8', '4', '12+2', '2014-06-21 09:09:43', '1');
INSERT INTO `activity` VALUES ('217', '2', '18', '3', '12+2', '2014-06-21 09:09:43', '1');
INSERT INTO `activity` VALUES ('218', '3', '8', '4', '12+2', '2014-06-21 09:09:44', '1');
INSERT INTO `activity` VALUES ('219', '3', '19', '3', '12+2', '2014-06-21 09:09:44', '1');
INSERT INTO `activity` VALUES ('220', '2', '8', '4', '19+2', '2014-06-21 09:09:46', '1');
INSERT INTO `activity` VALUES ('221', '2', '18', '3', '19+2', '2014-06-21 09:09:47', '1');
INSERT INTO `activity` VALUES ('222', '3', '8', '4', '19+2', '2014-06-21 09:09:47', '1');
INSERT INTO `activity` VALUES ('223', '3', '19', '3', '19+2', '2014-06-21 09:09:47', '1');
INSERT INTO `activity` VALUES ('224', '2', '8', '4', '6+2', '2014-06-21 09:09:48', '1');
INSERT INTO `activity` VALUES ('225', '2', '18', '3', '6+2', '2014-06-21 09:09:48', '1');
INSERT INTO `activity` VALUES ('226', '3', '8', '4', '6+2', '2014-06-21 09:09:49', '1');
INSERT INTO `activity` VALUES ('227', '3', '19', '3', '6+2', '2014-06-21 09:09:49', '1');
INSERT INTO `activity` VALUES ('228', '2', '8', '4', '9+2', '2014-06-21 09:09:52', '1');
INSERT INTO `activity` VALUES ('229', '2', '19', '3', '9+2', '2014-06-21 09:09:52', '1');
INSERT INTO `activity` VALUES ('230', '3', '8', '4', '9+2', '2014-06-21 09:09:52', '1');
INSERT INTO `activity` VALUES ('231', '3', '18', '3', '9+2', '2014-06-21 09:09:52', '1');
INSERT INTO `activity` VALUES ('232', '2', '8', '4', '6+2', '2014-06-21 09:09:55', '1');
INSERT INTO `activity` VALUES ('233', '2', '19', '3', '6+2', '2014-06-21 09:09:55', '1');
INSERT INTO `activity` VALUES ('234', '3', '8', '4', '6+2', '2014-06-21 09:09:55', '1');
INSERT INTO `activity` VALUES ('235', '3', '18', '3', '6+2', '2014-06-21 09:09:56', '1');
INSERT INTO `activity` VALUES ('236', '2', '8', '4', '10+2', '2014-06-21 09:14:33', '1');
INSERT INTO `activity` VALUES ('237', '2', '18', '3', '10+2', '2014-06-21 09:14:34', '1');
INSERT INTO `activity` VALUES ('238', '3', '8', '4', '10+2', '2014-06-21 09:14:34', '1');
INSERT INTO `activity` VALUES ('239', '3', '19', '3', '10+2', '2014-06-21 09:14:34', '1');
INSERT INTO `activity` VALUES ('240', '2', '8', '4', '19+2', '2014-06-21 09:15:40', '1');
INSERT INTO `activity` VALUES ('241', '2', '19', '3', '19+2', '2014-06-21 09:15:40', '1');
INSERT INTO `activity` VALUES ('242', '3', '8', '4', '19+2', '2014-06-21 09:15:40', '1');
INSERT INTO `activity` VALUES ('243', '3', '18', '3', '19+2', '2014-06-21 09:15:40', '1');
INSERT INTO `activity` VALUES ('244', '2', '8', '4', '12+2', '2014-06-21 09:16:54', '1');
INSERT INTO `activity` VALUES ('245', '2', '17', '3', '12+2', '2014-06-21 09:16:54', '1');
INSERT INTO `activity` VALUES ('246', '3', '8', '4', '12+2', '2014-06-21 09:16:54', '1');
INSERT INTO `activity` VALUES ('247', '3', '18', '3', '12+2', '2014-06-21 09:16:54', '1');
INSERT INTO `activity` VALUES ('248', '2', '8', '4', '10+2', '2014-06-21 09:17:04', '1');
INSERT INTO `activity` VALUES ('249', '2', '17', '3', '10+2', '2014-06-21 09:17:04', '1');
INSERT INTO `activity` VALUES ('250', '3', '8', '4', '10+2', '2014-06-21 09:17:04', '1');
INSERT INTO `activity` VALUES ('251', '3', '18', '3', '10+2', '2014-06-21 09:17:04', '1');
INSERT INTO `activity` VALUES ('252', '2', '8', '4', '9+2', '2014-06-21 09:20:20', '1');
INSERT INTO `activity` VALUES ('253', '2', '18', '3', '9+2', '2014-06-21 09:20:20', '1');
INSERT INTO `activity` VALUES ('254', '3', '8', '4', '9+2', '2014-06-21 09:20:20', '1');
INSERT INTO `activity` VALUES ('255', '3', '19', '3', '9+2', '2014-06-21 09:20:20', '1');
INSERT INTO `activity` VALUES ('256', '2', '8', '4', '19+2', '2014-06-21 09:20:26', '1');
INSERT INTO `activity` VALUES ('257', '2', '18', '3', '19+2', '2014-06-21 09:20:26', '1');
INSERT INTO `activity` VALUES ('258', '3', '8', '4', '19+2', '2014-06-21 09:20:26', '1');
INSERT INTO `activity` VALUES ('259', '3', '19', '3', '19+2', '2014-06-21 09:20:26', '1');
INSERT INTO `activity` VALUES ('260', '2', '8', '4', '20+2', '2014-06-21 09:20:30', '1');
INSERT INTO `activity` VALUES ('261', '2', '19', '3', '20+2', '2014-06-21 09:20:30', '1');
INSERT INTO `activity` VALUES ('262', '3', '8', '4', '20+2', '2014-06-21 09:20:30', '1');
INSERT INTO `activity` VALUES ('263', '3', '18', '3', '20+2', '2014-06-21 09:20:30', '1');
INSERT INTO `activity` VALUES ('264', '2', '8', '4', '19+2', '2014-06-21 09:20:34', '1');
INSERT INTO `activity` VALUES ('265', '2', '19', '3', '19+2', '2014-06-21 09:20:34', '1');
INSERT INTO `activity` VALUES ('266', '3', '8', '4', '19+2', '2014-06-21 09:20:34', '1');
INSERT INTO `activity` VALUES ('267', '3', '18', '3', '19+2', '2014-06-21 09:20:34', '1');
INSERT INTO `activity` VALUES ('268', '2', '8', '4', '19+2', '2014-06-21 09:20:39', '1');
INSERT INTO `activity` VALUES ('269', '2', '18', '3', '19+2', '2014-06-21 09:20:39', '1');
INSERT INTO `activity` VALUES ('270', '3', '8', '4', '19+2', '2014-06-21 09:20:39', '1');
INSERT INTO `activity` VALUES ('271', '3', '19', '3', '19+2', '2014-06-21 09:20:39', '1');
INSERT INTO `activity` VALUES ('272', '2', '8', '4', '19+2', '2014-06-21 09:20:44', '1');
INSERT INTO `activity` VALUES ('273', '2', '19', '3', '19+2', '2014-06-21 09:20:44', '1');
INSERT INTO `activity` VALUES ('274', '3', '8', '4', '19+2', '2014-06-21 09:20:44', '1');
INSERT INTO `activity` VALUES ('275', '3', '18', '3', '19+2', '2014-06-21 09:20:44', '1');
INSERT INTO `activity` VALUES ('276', '2', '8', '4', '19+2', '2014-06-21 09:20:49', '1');
INSERT INTO `activity` VALUES ('277', '2', '18', '3', '19+2', '2014-06-21 09:20:49', '1');
INSERT INTO `activity` VALUES ('278', '3', '8', '4', '19+2', '2014-06-21 09:20:49', '1');
INSERT INTO `activity` VALUES ('279', '3', '19', '3', '19+2', '2014-06-21 09:20:49', '1');
INSERT INTO `activity` VALUES ('280', '2', '8', '4', '10+2', '2014-06-21 09:20:56', '1');
INSERT INTO `activity` VALUES ('281', '2', '18', '3', '10+2', '2014-06-21 09:20:56', '1');
INSERT INTO `activity` VALUES ('282', '3', '8', '4', '10+2', '2014-06-21 09:20:56', '1');
INSERT INTO `activity` VALUES ('283', '3', '17', '3', '10+2', '2014-06-21 09:20:56', '1');
INSERT INTO `activity` VALUES ('284', '2', '8', '4', '12+2', '2014-06-21 09:20:59', '1');
INSERT INTO `activity` VALUES ('285', '2', '18', '3', '12+2', '2014-06-21 09:20:59', '1');
INSERT INTO `activity` VALUES ('286', '3', '8', '4', '12+2', '2014-06-21 09:20:59', '1');
INSERT INTO `activity` VALUES ('287', '3', '17', '3', '12+2', '2014-06-21 09:20:59', '1');
INSERT INTO `activity` VALUES ('288', '2', '8', '4', '1+2', '2014-06-21 09:21:00', '1');
INSERT INTO `activity` VALUES ('289', '2', '19', '3', '1+2', '2014-06-21 09:21:00', '1');
INSERT INTO `activity` VALUES ('290', '3', '8', '4', '1+2', '2014-06-21 09:21:00', '1');
INSERT INTO `activity` VALUES ('291', '3', '17', '3', '1+2', '2014-06-21 09:21:00', '1');
INSERT INTO `activity` VALUES ('292', '2', '8', '4', '22+2', '2014-06-21 09:21:04', '1');
INSERT INTO `activity` VALUES ('293', '2', '19', '3', '22+2', '2014-06-21 09:21:04', '1');
INSERT INTO `activity` VALUES ('294', '2', '8', '4', '11+2', '2014-06-21 09:21:07', '1');
INSERT INTO `activity` VALUES ('295', '2', '19', '3', '11+2', '2014-06-21 09:21:07', '1');
INSERT INTO `activity` VALUES ('296', '2', '8', '4', '9+2', '2014-06-21 09:21:09', '1');
INSERT INTO `activity` VALUES ('297', '2', '19', '3', '9+2', '2014-06-21 09:21:09', '1');
INSERT INTO `activity` VALUES ('298', '3', '8', '4', '9+2', '2014-06-21 09:21:09', '1');
INSERT INTO `activity` VALUES ('299', '3', '18', '3', '9+2', '2014-06-21 09:21:10', '1');
INSERT INTO `activity` VALUES ('300', '2', '8', '4', '6+2', '2014-06-21 09:21:13', '1');
INSERT INTO `activity` VALUES ('301', '2', '18', '3', '6+2', '2014-06-21 09:21:13', '1');
INSERT INTO `activity` VALUES ('302', '3', '8', '4', '6+2', '2014-06-21 09:21:13', '1');
INSERT INTO `activity` VALUES ('303', '3', '19', '3', '6+2', '2014-06-21 09:21:13', '1');
INSERT INTO `activity` VALUES ('304', '2', '8', '4', '1+2', '2014-06-21 09:21:15', '1');
INSERT INTO `activity` VALUES ('305', '2', '18', '3', '1+2', '2014-06-21 09:21:15', '1');
INSERT INTO `activity` VALUES ('306', '3', '8', '4', '1+2', '2014-06-21 09:21:15', '1');
INSERT INTO `activity` VALUES ('307', '3', '19', '3', '1+2', '2014-06-21 09:21:15', '1');
INSERT INTO `activity` VALUES ('308', '2', '8', '4', '20+2', '2014-06-21 09:21:16', '1');
INSERT INTO `activity` VALUES ('309', '2', '18', '3', '20+2', '2014-06-21 09:21:16', '1');
INSERT INTO `activity` VALUES ('310', '3', '8', '4', '20+2', '2014-06-21 09:21:16', '1');
INSERT INTO `activity` VALUES ('311', '3', '19', '3', '20+2', '2014-06-21 09:21:16', '1');
INSERT INTO `activity` VALUES ('312', '2', '8', '4', '9+2', '2014-06-21 09:21:19', '1');
INSERT INTO `activity` VALUES ('313', '2', '18', '3', '9+2', '2014-06-21 09:21:19', '1');
INSERT INTO `activity` VALUES ('314', '3', '8', '4', '9+2', '2014-06-21 09:21:19', '1');
INSERT INTO `activity` VALUES ('315', '3', '19', '3', '9+2', '2014-06-21 09:21:19', '1');
INSERT INTO `activity` VALUES ('316', '2', '8', '4', '11+2', '2014-06-21 09:21:22', '1');
INSERT INTO `activity` VALUES ('317', '2', '18', '3', '11+2', '2014-06-21 09:21:23', '1');
INSERT INTO `activity` VALUES ('318', '3', '8', '4', '11+2', '2014-06-21 09:21:23', '1');
INSERT INTO `activity` VALUES ('319', '3', '19', '3', '11+2', '2014-06-21 09:21:23', '1');
INSERT INTO `activity` VALUES ('320', '2', '8', '4', '22+2', '2014-06-21 09:21:23', '1');
INSERT INTO `activity` VALUES ('321', '2', '18', '3', '22+2', '2014-06-21 09:21:23', '1');
INSERT INTO `activity` VALUES ('322', '3', '8', '4', '22+2', '2014-06-21 09:21:23', '1');
INSERT INTO `activity` VALUES ('323', '3', '19', '3', '22+2', '2014-06-21 09:21:24', '1');
INSERT INTO `activity` VALUES ('324', '2', '8', '4', '10+2', '2014-06-21 09:21:24', '1');
INSERT INTO `activity` VALUES ('325', '2', '19', '3', '10+2', '2014-06-21 09:21:24', '1');
INSERT INTO `activity` VALUES ('326', '3', '8', '4', '10+2', '2014-06-21 09:21:24', '1');
INSERT INTO `activity` VALUES ('327', '3', '18', '3', '10+2', '2014-06-21 09:21:24', '1');
INSERT INTO `activity` VALUES ('328', '2', '8', '4', '6+2', '2014-06-21 09:21:25', '1');
INSERT INTO `activity` VALUES ('329', '2', '19', '3', '6+2', '2014-06-21 09:21:25', '1');
INSERT INTO `activity` VALUES ('330', '3', '8', '4', '6+2', '2014-06-21 09:21:26', '1');
INSERT INTO `activity` VALUES ('331', '3', '18', '3', '6+2', '2014-06-21 09:21:26', '1');
INSERT INTO `activity` VALUES ('332', '2', '8', '4', '12+2', '2014-06-21 09:21:27', '1');
INSERT INTO `activity` VALUES ('333', '2', '19', '3', '12+2', '2014-06-21 09:21:27', '1');
INSERT INTO `activity` VALUES ('334', '3', '8', '4', '12+2', '2014-06-21 09:21:27', '1');
INSERT INTO `activity` VALUES ('335', '3', '18', '3', '12+2', '2014-06-21 09:21:27', '1');
INSERT INTO `activity` VALUES ('336', '2', '9', '4', '13+2', '2014-06-21 09:21:43', '1');
INSERT INTO `activity` VALUES ('337', '2', '18', '3', '13+2', '2014-06-21 09:21:43', '1');
INSERT INTO `activity` VALUES ('338', '3', '9', '4', '13+2', '2014-06-21 09:21:43', '1');
INSERT INTO `activity` VALUES ('339', '3', '19', '3', '13+2', '2014-06-21 09:21:43', '1');
INSERT INTO `activity` VALUES ('340', '2', '8', '4', '5+2', '2014-06-21 09:21:49', '1');
INSERT INTO `activity` VALUES ('341', '2', '18', '3', '5+2', '2014-06-21 09:21:49', '1');
INSERT INTO `activity` VALUES ('342', '3', '9', '4', '5+2', '2014-06-21 09:21:49', '1');
INSERT INTO `activity` VALUES ('343', '3', '18', '3', '5+2', '2014-06-21 09:21:49', '1');
INSERT INTO `activity` VALUES ('344', '2', '8', '4', '14+2', '2014-06-21 09:21:55', '1');
INSERT INTO `activity` VALUES ('345', '2', '18', '3', '14+2', '2014-06-21 09:21:55', '1');
INSERT INTO `activity` VALUES ('346', '3', '9', '4', '14+2', '2014-06-21 09:21:55', '1');
INSERT INTO `activity` VALUES ('347', '3', '19', '3', '14+2', '2014-06-21 09:21:55', '1');
INSERT INTO `activity` VALUES ('348', '2', '8', '4', '14+2', '2014-06-21 09:22:00', '1');
INSERT INTO `activity` VALUES ('349', '2', '19', '3', '14+2', '2014-06-21 09:22:00', '1');
INSERT INTO `activity` VALUES ('350', '3', '8', '4', '14+2', '2014-06-21 09:22:00', '1');
INSERT INTO `activity` VALUES ('351', '3', '18', '3', '14+2', '2014-06-21 09:22:00', '1');
INSERT INTO `activity` VALUES ('352', '3', '8', '4', '10+2', '2014-06-21 09:23:48', '1');
INSERT INTO `activity` VALUES ('353', '3', '19', '3', '10+2', '2014-06-21 09:23:49', '1');
INSERT INTO `activity` VALUES ('354', '3', '8', '4', '6+2', '2014-06-21 09:23:51', '1');
INSERT INTO `activity` VALUES ('355', '3', '19', '3', '6+2', '2014-06-21 09:23:51', '1');
INSERT INTO `activity` VALUES ('356', '3', '8', '4', '19+2', '2014-06-21 09:23:53', '1');
INSERT INTO `activity` VALUES ('357', '3', '18', '3', '19+2', '2014-06-21 09:23:53', '1');
INSERT INTO `activity` VALUES ('358', '4', '8', '4', 'Start date estimate+0000-00-00+2014-06-21', '2014-06-21 17:51:01', '1');
INSERT INTO `activity` VALUES ('359', '4', '8', '4', 'End date estimate+0000-00-00+2014-07-11', '2014-06-21 17:51:01', '1');
INSERT INTO `activity` VALUES ('360', '2', '8', '4', '1+2', '2014-06-21 18:01:25', '1');
INSERT INTO `activity` VALUES ('361', '2', '17', '3', '1+2', '2014-06-21 18:01:25', '1');
INSERT INTO `activity` VALUES ('362', '3', '8', '4', '1+2', '2014-06-21 18:01:25', '1');
INSERT INTO `activity` VALUES ('363', '3', '18', '3', '1+2', '2014-06-21 18:01:25', '1');
INSERT INTO `activity` VALUES ('364', '2', '8', '4', '11+2', '2014-06-21 18:01:27', '1');
INSERT INTO `activity` VALUES ('365', '2', '17', '3', '11+2', '2014-06-21 18:01:27', '1');
INSERT INTO `activity` VALUES ('366', '3', '8', '4', '11+2', '2014-06-21 18:01:27', '1');
INSERT INTO `activity` VALUES ('367', '3', '18', '3', '11+2', '2014-06-21 18:01:27', '1');
INSERT INTO `activity` VALUES ('368', '2', '8', '4', '20+2', '2014-06-21 18:01:29', '1');
INSERT INTO `activity` VALUES ('369', '2', '17', '3', '20+2', '2014-06-21 18:01:29', '1');
INSERT INTO `activity` VALUES ('370', '3', '8', '4', '20+2', '2014-06-21 18:01:29', '1');
INSERT INTO `activity` VALUES ('371', '3', '18', '3', '20+2', '2014-06-21 18:01:29', '1');
INSERT INTO `activity` VALUES ('372', '2', '9', '4', '5+2', '2014-06-21 18:01:32', '1');
INSERT INTO `activity` VALUES ('373', '2', '19', '3', '5+2', '2014-06-21 18:01:32', '1');
INSERT INTO `activity` VALUES ('374', '3', '8', '4', '5+2', '2014-06-21 18:01:32', '1');
INSERT INTO `activity` VALUES ('375', '3', '18', '3', '5+2', '2014-06-21 18:01:33', '1');
INSERT INTO `activity` VALUES ('376', '2', '9', '4', '20+2', '2014-06-21 18:01:34', '1');
INSERT INTO `activity` VALUES ('377', '2', '17', '3', '20+2', '2014-06-21 18:01:34', '1');
INSERT INTO `activity` VALUES ('378', '3', '8', '4', '20+2', '2014-06-21 18:01:34', '1');
INSERT INTO `activity` VALUES ('379', '3', '17', '3', '20+2', '2014-06-21 18:01:35', '1');
INSERT INTO `activity` VALUES ('380', '2', '9', '4', '19+2', '2014-06-21 18:01:35', '1');
INSERT INTO `activity` VALUES ('381', '2', '18', '3', '19+2', '2014-06-21 18:01:36', '1');
INSERT INTO `activity` VALUES ('382', '2', '9', '4', '6+2', '2014-06-21 18:01:37', '1');
INSERT INTO `activity` VALUES ('383', '2', '19', '3', '6+2', '2014-06-21 18:01:37', '1');
INSERT INTO `activity` VALUES ('384', '2', '10', '4', '10+2', '2014-06-21 18:01:39', '1');
INSERT INTO `activity` VALUES ('385', '2', '19', '3', '10+2', '2014-06-21 18:01:39', '1');
INSERT INTO `activity` VALUES ('386', '4', '8', '4', 'End date estimate+2014-07-11+2014-07-21', '2014-06-21 18:36:06', '1');
INSERT INTO `activity` VALUES ('387', '4', '9', '4', 'Start date estimate+0000-00-00+2014-07-21', '2014-06-21 20:07:51', '1');
INSERT INTO `activity` VALUES ('388', '4', '9', '4', 'End date estimate+0000-00-00+2014-08-21', '2014-06-21 20:07:51', '1');
INSERT INTO `activity` VALUES ('389', '4', '10', '4', 'Start date estimate+0000-00-00+2014-08-21', '2014-06-21 20:08:11', '1');
INSERT INTO `activity` VALUES ('390', '4', '10', '4', 'End date estimate+0000-00-00+2014-09-21', '2014-06-21 20:08:11', '1');
INSERT INTO `activity` VALUES ('391', '4', '9', '6', 'Status+Done+To do', '2014-06-21 20:13:02', '1');
INSERT INTO `activity` VALUES ('392', '4', '13', '6', 'Status+Done+To do', '2014-06-21 20:13:03', '1');
INSERT INTO `activity` VALUES ('393', '4', '3', '6', 'Status+Done+In Progress', '2014-06-21 20:13:06', '1');
INSERT INTO `activity` VALUES ('394', '4', '6', '6', 'Status+To test+In Progress', '2014-06-21 20:13:19', '1');
INSERT INTO `activity` VALUES ('395', '4', '6', '6', 'Status+In Progress+To test', '2014-06-21 20:13:25', '1');
INSERT INTO `activity` VALUES ('396', '2', '8', '4', '2+2', '2014-06-21 20:20:00', '1');
INSERT INTO `activity` VALUES ('397', '2', '18', '3', '2+2', '2014-06-21 20:20:01', '1');
INSERT INTO `activity` VALUES ('398', '3', '9', '4', '2+2', '2014-06-21 20:20:01', '1');
INSERT INTO `activity` VALUES ('399', '3', '17', '3', '2+2', '2014-06-21 20:20:01', '1');
INSERT INTO `activity` VALUES ('400', '2', '9', '4', '9+2', '2014-06-21 20:20:02', '1');
INSERT INTO `activity` VALUES ('401', '2', '17', '3', '9+2', '2014-06-21 20:20:03', '1');
INSERT INTO `activity` VALUES ('402', '3', '8', '4', '9+2', '2014-06-21 20:20:03', '1');
INSERT INTO `activity` VALUES ('403', '3', '18', '3', '9+2', '2014-06-21 20:20:03', '1');
INSERT INTO `activity` VALUES ('404', '2', '8', '4', '5+2', '2014-06-21 20:20:05', '1');
INSERT INTO `activity` VALUES ('405', '2', '17', '3', '5+2', '2014-06-21 20:20:05', '1');
INSERT INTO `activity` VALUES ('406', '3', '9', '4', '5+2', '2014-06-21 20:20:05', '1');
INSERT INTO `activity` VALUES ('407', '3', '19', '3', '5+2', '2014-06-21 20:20:05', '1');
INSERT INTO `activity` VALUES ('408', '2', '9', '4', '11+2', '2014-06-21 20:20:05', '1');
INSERT INTO `activity` VALUES ('409', '2', '19', '3', '11+2', '2014-06-21 20:20:05', '1');
INSERT INTO `activity` VALUES ('410', '3', '8', '4', '11+2', '2014-06-21 20:20:06', '1');
INSERT INTO `activity` VALUES ('411', '3', '17', '3', '11+2', '2014-06-21 20:20:06', '1');
INSERT INTO `activity` VALUES ('412', '2', '9', '4', '4+2', '2014-06-21 20:20:09', '1');
INSERT INTO `activity` VALUES ('413', '2', '19', '3', '4+2', '2014-06-21 20:20:09', '1');
INSERT INTO `activity` VALUES ('414', '3', '10', '4', '4+2', '2014-06-21 20:20:09', '1');
INSERT INTO `activity` VALUES ('415', '3', '19', '3', '4+2', '2014-06-21 20:20:09', '1');
INSERT INTO `activity` VALUES ('416', '2', '8', '4', '4+2', '2014-06-21 20:20:10', '1');
INSERT INTO `activity` VALUES ('417', '2', '19', '3', '4+2', '2014-06-21 20:20:10', '1');
INSERT INTO `activity` VALUES ('418', '3', '9', '4', '4+2', '2014-06-21 20:20:10', '1');
INSERT INTO `activity` VALUES ('419', '3', '19', '3', '4+2', '2014-06-21 20:20:10', '1');
INSERT INTO `activity` VALUES ('420', '2', '9', '4', '14+2', '2014-06-21 20:20:15', '1');
INSERT INTO `activity` VALUES ('421', '2', '19', '3', '14+2', '2014-06-21 20:20:15', '1');
INSERT INTO `activity` VALUES ('422', '3', '8', '4', '14+2', '2014-06-21 20:20:15', '1');
INSERT INTO `activity` VALUES ('423', '3', '19', '3', '14+2', '2014-06-21 20:20:15', '1');
INSERT INTO `activity` VALUES ('424', '2', '9', '4', '22+2', '2014-06-21 20:20:18', '1');
INSERT INTO `activity` VALUES ('425', '2', '18', '3', '22+2', '2014-06-21 20:20:18', '1');
INSERT INTO `activity` VALUES ('426', '3', '8', '4', '22+2', '2014-06-21 20:20:18', '1');
INSERT INTO `activity` VALUES ('427', '3', '18', '3', '22+2', '2014-06-21 20:20:18', '1');
INSERT INTO `activity` VALUES ('428', '2', '9', '4', '12+2', '2014-06-21 20:20:19', '1');
INSERT INTO `activity` VALUES ('429', '2', '18', '3', '12+2', '2014-06-21 20:20:19', '1');
INSERT INTO `activity` VALUES ('430', '3', '8', '4', '12+2', '2014-06-21 20:20:19', '1');
INSERT INTO `activity` VALUES ('431', '3', '19', '3', '12+2', '2014-06-21 20:20:20', '1');
INSERT INTO `activity` VALUES ('432', '2', '10', '4', '10+2', '2014-06-21 20:21:50', '1');
INSERT INTO `activity` VALUES ('433', '2', '18', '3', '10+2', '2014-06-21 20:21:51', '1');
INSERT INTO `activity` VALUES ('434', '3', '10', '4', '10+2', '2014-06-21 20:21:51', '1');
INSERT INTO `activity` VALUES ('435', '3', '19', '3', '10+2', '2014-06-21 20:21:51', '1');
INSERT INTO `activity` VALUES ('436', '2', '9', '4', '6+2', '2014-06-21 20:21:53', '1');
INSERT INTO `activity` VALUES ('437', '2', '18', '3', '6+2', '2014-06-21 20:21:53', '1');
INSERT INTO `activity` VALUES ('438', '3', '9', '4', '6+2', '2014-06-21 20:21:54', '1');
INSERT INTO `activity` VALUES ('439', '3', '19', '3', '6+2', '2014-06-21 20:21:54', '1');
INSERT INTO `activity` VALUES ('440', '4', '7', '2', 'Story point+0+010', '2014-06-21 20:24:46', '1');
INSERT INTO `activity` VALUES ('441', '4', '2', '2', 'Story point+201+20', '2014-06-21 20:33:50', '1');
INSERT INTO `activity` VALUES ('442', '2', '2', '2', '27+6', '2014-06-21 20:38:49', '1');
INSERT INTO `activity` VALUES ('443', '4', '16', '6', 'User assign++leader 4', '2014-06-21 20:40:26', '1');
INSERT INTO `activity` VALUES ('444', '2', '17', '3', '21+8', '2014-06-22 07:09:19', '1');
INSERT INTO `activity` VALUES ('445', '2', '18', '3', '14+8', '2014-06-22 07:09:20', '1');
INSERT INTO `activity` VALUES ('446', '2', '19', '3', '2+8', '2014-06-22 07:09:22', '1');
INSERT INTO `activity` VALUES ('447', '2', '17', '3', '3+8', '2014-06-22 07:09:25', '1');
INSERT INTO `activity` VALUES ('448', '2', '18', '3', '23+8', '2014-06-22 07:09:27', '1');
INSERT INTO `activity` VALUES ('449', '2', '19', '3', '27+8', '2014-06-22 07:09:29', '1');
INSERT INTO `activity` VALUES ('450', '4', '2', '6', 'Status+To do+In Progress', '2014-06-22 07:10:03', '1');
INSERT INTO `activity` VALUES ('451', '4', '5', '6', 'Status+To do+In Progress', '2014-06-22 07:10:04', '1');
INSERT INTO `activity` VALUES ('452', '4', '5', '6', 'Status+In Progress+To test', '2014-06-22 07:10:08', '1');
INSERT INTO `activity` VALUES ('453', '4', '2', '6', 'Status+In Progress+To test', '2014-06-22 07:10:11', '1');
INSERT INTO `activity` VALUES ('454', '4', '4', '6', 'Status+To do+Done', '2014-06-22 07:10:18', '1');
INSERT INTO `activity` VALUES ('455', '4', '16', '6', 'Status+To do+To test', '2014-06-22 07:10:20', '1');
INSERT INTO `activity` VALUES ('456', '4', '27', '6', 'Status+To do+Done', '2014-06-22 07:10:24', '1');
INSERT INTO `activity` VALUES ('457', '4', '17', '6', 'Estimate time+0+6', '2014-06-22 07:22:22', '1');
INSERT INTO `activity` VALUES ('458', '4', '17', '6', 'Status+To do+In Progress', '2014-06-22 07:22:30', '1');
INSERT INTO `activity` VALUES ('459', '4', '17', '6', 'Time remain+5+5', '2014-06-22 07:22:38', '1');
INSERT INTO `activity` VALUES ('460', '4', '17', '6', 'Time remain+1+1', '2014-06-22 07:22:52', '1');
INSERT INTO `activity` VALUES ('461', '4', '17', '6', 'Status+In Progress+To test', '2014-06-22 07:22:56', '1');
INSERT INTO `activity` VALUES ('462', '4', '17', '6', 'Status+To test+In Progress', '2014-06-22 07:23:01', '1');
INSERT INTO `activity` VALUES ('463', '4', '17', '6', 'Status+In Progress+To do', '2014-06-22 07:23:04', '1');
INSERT INTO `activity` VALUES ('464', '4', '3', '6', 'Status+In Progress+To test', '2014-06-22 09:37:32', '1');
INSERT INTO `activity` VALUES ('465', '4', '13', '6', 'Status+To do+In Progress', '2014-06-22 09:37:44', '1');
INSERT INTO `activity` VALUES ('466', '4', '2', '6', 'Status+To test+In Progress', '2014-06-22 09:38:02', '1');
INSERT INTO `activity` VALUES ('467', '4', '16', '6', 'Status+To test+In Progress', '2014-06-22 09:38:03', '1');
INSERT INTO `activity` VALUES ('468', '4', '7', '6', 'Status+To do+In Progress', '2014-06-22 09:38:04', '1');
INSERT INTO `activity` VALUES ('469', '4', '15', '6', 'Status+To do+In Progress', '2014-06-22 09:38:05', '1');
INSERT INTO `activity` VALUES ('470', '4', '11', '6', 'Status+To do+To test', '2014-06-22 09:38:06', '1');
INSERT INTO `activity` VALUES ('471', '4', '17', '6', 'Status+To do+To test', '2014-06-22 09:38:07', '1');
INSERT INTO `activity` VALUES ('472', '4', '8', '6', 'Status+To do+In Progress', '2014-06-22 09:38:08', '1');
INSERT INTO `activity` VALUES ('473', '4', '14', '6', 'Status+To do+In Progress', '2014-06-22 09:38:10', '1');
INSERT INTO `activity` VALUES ('474', '4', '18', '6', 'Status+To do+To test', '2014-06-22 09:38:12', '1');
INSERT INTO `activity` VALUES ('475', '4', '18', '6', 'Status+To test+Done', '2014-06-22 09:38:13', '1');
INSERT INTO `activity` VALUES ('476', '4', '18', '6', 'Status+Done+To test', '2014-06-22 09:38:30', '1');
INSERT INTO `activity` VALUES ('477', '4', '12', '6', 'Status+To do+Done', '2014-06-22 09:38:36', '1');
INSERT INTO `activity` VALUES ('478', '4', '19', '6', 'Status+To do+In Progress', '2014-06-22 09:38:37', '1');
INSERT INTO `activity` VALUES ('479', '4', '20', '6', 'Status+To do+To test', '2014-06-22 09:38:41', '1');
INSERT INTO `activity` VALUES ('480', '4', '1', '2', 'Demo+demo+demoa', '2014-06-22 09:39:24', '1');
INSERT INTO `activity` VALUES ('481', '4', '2', '2', 'Demo+demo+demoa', '2014-06-22 09:39:41', '1');
INSERT INTO `activity` VALUES ('482', '4', '4', '2', 'Demo+asdf+asdfa', '2014-06-22 09:39:49', '1');
INSERT INTO `activity` VALUES ('483', '4', '5', '2', 'Demo+asdf+asdfff', '2014-06-22 09:39:58', '1');
INSERT INTO `activity` VALUES ('484', '4', '6', '2', 'Demo+asfd+asfdd', '2014-06-22 09:40:21', '1');
INSERT INTO `activity` VALUES ('485', '4', '1', '1', 'Status+New+Approved', '2014-06-22 09:40:31', '1');
INSERT INTO `activity` VALUES ('486', '4', '10', '2', 'Demo+asdfasdf+asdfasdfw', '2014-06-22 09:42:37', '1');
INSERT INTO `activity` VALUES ('487', '4', '1', '2', 'Demo+demoa+demoaddd', '2014-06-22 09:45:47', '1');
INSERT INTO `activity` VALUES ('488', '3', '10', '4', '22+2', '2014-06-22 09:48:24', '1');
INSERT INTO `activity` VALUES ('489', '3', '17', '3', '22+2', '2014-06-22 09:48:24', '1');
INSERT INTO `activity` VALUES ('490', '2', '10', '4', '10+2', '2014-06-22 09:48:28', '1');
INSERT INTO `activity` VALUES ('491', '2', '17', '3', '10+2', '2014-06-22 09:48:28', '1');
INSERT INTO `activity` VALUES ('492', '3', '10', '4', '10+2', '2014-06-22 09:48:28', '1');
INSERT INTO `activity` VALUES ('493', '3', '18', '3', '10+2', '2014-06-22 09:48:28', '1');
INSERT INTO `activity` VALUES ('494', '3', '9', '4', '20+2', '2014-06-22 09:48:34', '1');
INSERT INTO `activity` VALUES ('495', '3', '17', '3', '20+2', '2014-06-22 09:48:34', '1');
INSERT INTO `activity` VALUES ('496', '4', '1', '1', 'Status+New+Approved', '2014-06-22 09:51:08', '1');
INSERT INTO `activity` VALUES ('497', '4', '4', '6', 'Status+Done+To test', '2014-06-22 10:01:45', '1');
INSERT INTO `activity` VALUES ('498', '4', '4', '6', 'Status+To test+Done', '2014-06-22 10:01:47', '1');
INSERT INTO `activity` VALUES ('499', '4', '4', '6', 'Status+Done+To test', '2014-06-22 10:08:11', '1');
INSERT INTO `activity` VALUES ('500', '4', '4', '6', 'Status+To test+Done', '2014-06-22 10:08:14', '1');
INSERT INTO `activity` VALUES ('501', '4', '4', '6', 'Status+Done+To test', '2014-06-22 10:11:35', '1');
INSERT INTO `activity` VALUES ('502', '4', '4', '6', 'Status+To test+Done', '2014-06-22 10:11:37', '1');
INSERT INTO `activity` VALUES ('503', '4', '11', '6', 'Status+To test+Done', '2014-06-22 15:02:03', '1');
INSERT INTO `activity` VALUES ('504', '4', '17', '6', 'Status+To test+Done', '2014-06-22 15:02:04', '1');
INSERT INTO `activity` VALUES ('505', '4', '15', '6', 'Status+In Progress+Done', '2014-06-22 15:02:05', '1');
INSERT INTO `activity` VALUES ('506', '4', '7', '6', 'Status+In Progress+Done', '2014-06-22 15:02:06', '1');
INSERT INTO `activity` VALUES ('507', '4', '16', '6', 'Status+In Progress+Done', '2014-06-22 15:02:08', '1');
INSERT INTO `activity` VALUES ('508', '4', '2', '6', 'Status+In Progress+Done', '2014-06-22 15:02:08', '1');
INSERT INTO `activity` VALUES ('509', '4', '5', '6', 'Status+To test+Done', '2014-06-22 15:02:09', '1');
INSERT INTO `activity` VALUES ('510', '4', '1', '6', 'Status+In Progress+Done', '2014-06-22 15:02:11', '1');
INSERT INTO `activity` VALUES ('511', '4', '3', '6', 'Status+To test+Done', '2014-06-22 15:02:12', '1');
INSERT INTO `activity` VALUES ('512', '4', '13', '6', 'Status+In Progress+Done', '2014-06-22 15:02:13', '1');
INSERT INTO `activity` VALUES ('513', '4', '9', '6', 'Status+To do+In Progress', '2014-06-22 15:02:14', '1');
INSERT INTO `activity` VALUES ('514', '4', '20', '6', 'Status+To test+Done', '2014-06-22 15:02:16', '1');
INSERT INTO `activity` VALUES ('515', '4', '19', '6', 'Status+In Progress+Done', '2014-06-22 15:02:17', '1');
INSERT INTO `activity` VALUES ('516', '4', '14', '6', 'Status+In Progress+Done', '2014-06-22 15:02:18', '1');
INSERT INTO `activity` VALUES ('517', '4', '18', '6', 'Status+To test+Done', '2014-06-22 15:02:19', '1');
INSERT INTO `activity` VALUES ('518', '4', '8', '4', 'Start date estimate+2014-06-21+2014-06-10', '2014-06-22 15:23:10', '1');
INSERT INTO `activity` VALUES ('519', '4', '8', '4', 'End date estimate+2014-07-21+2014-07-10', '2014-06-22 15:23:10', '1');

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
INSERT INTO `project` VALUES ('1', 'Quan li nha hang', '2014-06-10', '2014-08-26', null, 'aa', '1', 'aa', '0');
INSERT INTO `project` VALUES ('2', 'Quản lí nhân sự', '2014-04-02', '2014-05-30', null, 'Cần xét lại', '1', 'Project test cho vui', '0');
INSERT INTO `project` VALUES ('3', 'Quan li khach san', '2014-06-10', '2014-06-26', null, '', '1', '', '1');
INSERT INTO `project` VALUES ('4', 'Quan li khach san', '2014-06-10', '2014-06-26', null, '', '1', '', '1');
INSERT INTO `project` VALUES ('5', 'Quan li khach san', '2014-06-10', '2014-06-26', null, '', '1', '', '1');
INSERT INTO `project` VALUES ('6', 'Quan li khach san', '2014-06-10', '2014-06-26', null, '', '1', '', '0');
INSERT INTO `project` VALUES ('9', 'Game ban sung', '2014-06-01', '2014-06-30', null, '', '1', '', '0');
INSERT INTO `project` VALUES ('10', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '1970-01-01', '1970-01-01', null, '', '2', '', '1');

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
INSERT INTO `project_user` VALUES ('1', '12', '18', '2');
INSERT INTO `project_user` VALUES ('1', '13', '19', '2');
INSERT INTO `project_user` VALUES ('1', '14', '18', '3');
INSERT INTO `project_user` VALUES ('1', '21', '17', '3');
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
INSERT INTO `role_permission` VALUES ('3', '59');
INSERT INTO `role_permission` VALUES ('4', '3');
INSERT INTO `role_permission` VALUES ('4', '4');
INSERT INTO `role_permission` VALUES ('4', '5');
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
INSERT INTO `sprint` VALUES ('8', '1', 'Sprint 1', '', '0000-00-00', '0000-00-00', '1', '0', '2014-06-10', '2014-07-10');
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
INSERT INTO `sprint_team` VALUES ('9', '17', '15');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of story
-- ----------------------------
INSERT INTO `story` VALUES ('1', '1', '1', 'story 1', '1', '11', '10', 'demoaddd', 'description', '6', '0', '2014-06-15 09:45:47', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('2', '1', '1', 'story 2', '1', '12', '20', 'demoa', 'description', '8', '0', '2014-06-16 09:39:41', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('4', '1', '1', 'story 4', '2', '19', '40', 'asdfa', 'asdf', '8', '0', '2014-06-17 09:39:49', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('5', '1', '1', 'story 5', '2', '15', '50', 'asdfff', 'asdf', '6', '0', '2014-06-18 09:39:58', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('6', '1', '1', 'story 6', '2', '4', '60', 'asfdd', 'sadfasdfsdf', '2', '0', '2014-06-19 09:40:31', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('7', '1', '1', 'story 7', '2', '2', '10', 'asfd', 'sadfasdfsdf', '8', '0', '2014-06-20 09:38:41', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('8', '1', '1', 'story 8', '1', '2', '90', 'asdf', 'sf', '1', '0', '2014-06-25 22:50:59', '2014-06-19 22:51:09');
INSERT INTO `story` VALUES ('9', '1', '1', 'story 9', '1', '12', '40', 'asdf', 'sf', '1', '0', '2014-07-03 22:51:04', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('10', '1', '1', 'story 10', '1', '3', '100', 'asdfasdfw', 'asdfasdf', '2', '0', '2014-06-22 09:42:37', '2014-06-13 22:51:09');
INSERT INTO `story` VALUES ('11', '1', '1', 'story 11', '1', '3', '23', 'asf', 'asf', '2', '0', '2014-06-20 22:51:06', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('12', '1', '1', 'story 12', '1', '4', '34', 'asf', 'asf', '2', '0', '2014-06-10 22:51:09', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('13', '1', '1', 'story 13', '2', '5', '54', 'asf', 'asf', '1', '0', '2014-06-18 22:51:11', '2014-06-11 22:51:09');
INSERT INTO `story` VALUES ('14', '1', '1', 'story 14', '4', '2', '34', 'asfd', 'sdfsaf', '1', '0', '2014-06-28 22:51:16', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('15', '2', '1', 'story 15', '2', '4', '56', 'asdf', 'asdf', '1', '0', '2014-06-27 22:51:19', '2014-06-27 22:51:09');
INSERT INTO `story` VALUES ('19', '1', '1', 'story 16', '1', '4', '4', 'a', 'a', '1', '0', '2014-06-19 22:51:22', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('20', '1', '1', 'story 17', '2', '2', '11', 'a', 'a', '1', '0', '2014-06-10 22:51:24', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('22', '1', '1', 'story 18', '2', '5', '5', 'asdfasdf', 'asdfasdf', '2', '0', '2014-06-22 09:51:08', '2014-06-10 22:51:09');

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
INSERT INTO `story_team` VALUES ('1', '17', '8', '1');
INSERT INTO `story_team` VALUES ('2', '18', '8', '1');
INSERT INTO `story_team` VALUES ('4', '19', '8', '1');
INSERT INTO `story_team` VALUES ('5', '17', '8', '2');
INSERT INTO `story_team` VALUES ('6', '18', '9', '1');
INSERT INTO `story_team` VALUES ('7', '18', '8', '2');
INSERT INTO `story_team` VALUES ('8', '19', '8', '2');
INSERT INTO `story_team` VALUES ('9', '17', '9', '1');
INSERT INTO `story_team` VALUES ('10', '17', '10', '1');
INSERT INTO `story_team` VALUES ('11', '19', '9', '1');
INSERT INTO `story_team` VALUES ('12', '19', '10', '1');
INSERT INTO `story_team` VALUES ('13', '19', '9', '2');
INSERT INTO `story_team` VALUES ('14', '18', '10', '1');
INSERT INTO `story_team` VALUES ('19', '18', '9', '1');

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
INSERT INTO `task` VALUES ('2', 'task 2', '44', '0', '4', '2014-06-02 00:00:00', '1', 'task description here', '1', '2', '0', '2014-06-18 15:02:19');
INSERT INTO `task` VALUES ('3', 'task 3', '1', '0', '4', '2014-06-03 05:12:30', '1', 'task description here', '7', '1', '0', '2014-06-20 15:02:19');
INSERT INTO `task` VALUES ('4', 'task 4 ', '3', '0', '4', '2014-06-03 05:12:30', '1', 'task description here', '7', '2', '0', '2014-06-21 15:02:19');
INSERT INTO `task` VALUES ('5', 'task 5', '1', '0', '4', '2014-06-03 05:12:48', '1', 'task description here', '7', '2', '0', '2014-06-22 15:02:19');
INSERT INTO `task` VALUES ('6', 'task 6r', '5', '0', '3', '2014-06-03 05:12:48', '1', 'task description here', '15', '1', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('7', 'task 7', '1', '0', '4', '2014-06-03 05:14:19', '1', 'task description here', '15', '4', '0', '2014-06-24 15:02:19');
INSERT INTO `task` VALUES ('8', 'task 8', '5', '5', '2', '2014-06-03 05:14:20', '1', 'task description here', '15', '5', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('9', 'task 9', '2', '0', '2', '2014-06-03 05:18:12', '1', 'task description here', '7', '1', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('10', 'task 10', '2', '2', '1', '2014-06-03 05:18:12', '1', 'task description here', null, '3', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('11', 'task 11', '7', '0', '4', '2014-06-03 05:19:04', '1', 'task description here', '13', '4', '0', '2014-06-26 15:03:05');
INSERT INTO `task` VALUES ('12', 'task 12', '6', '0', '4', '2014-06-03 05:19:04', '1', 'task description here', '1', '5', '0', '2014-06-28 15:02:19');
INSERT INTO `task` VALUES ('13', 'task 13', '3', '0', '4', '2014-06-03 05:27:53', '1', 'task description here', '7', '1', '0', '2014-06-29 15:02:19');
INSERT INTO `task` VALUES ('14', 'task 14', '3', '0', '4', '2014-06-03 05:27:53', '1', 'task description here', '1', '5', '0', '2014-07-03 15:02:19');
INSERT INTO `task` VALUES ('15', 'task 15', '5', '0', '4', '2014-06-03 14:21:30', '1', 'task description here', '13', '4', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('16', 'task 16', '1', '0', '4', '2014-06-03 14:21:30', '1', 'task description here', '12', '2', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('17', 'task 17', '6', '0', '4', '2014-06-03 21:35:57', '1', 'task description here', '13', '4', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('18', 'task 18', '1', '0', '4', '2014-06-03 21:35:58', '1', 'task description here', '1', '5', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('19', 'task 19', '1', '0', '4', '2014-06-03 21:45:10', '1', 'task description here', '12', '7', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('20', 'task 20', '1', '0', '4', '2014-06-03 21:45:11', '1', 'task description here', '23', '7', '0', '2014-06-17 15:02:19');
INSERT INTO `task` VALUES ('27', 'Task 19', '4', '0', '4', '2014-06-21 20:38:49', '1', '', '12', '2', '0', '2014-06-17 15:02:19');

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
  `show_nav` int(11) NOT NULL DEFAULT '0',
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`birthday`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 1', '2014-05-10', 'avatar-meo-396882118.jpg', null, '8v7cokGZRR07SxneWahYdAllJcybrp6RsaFHT9F0rvbS597NUHQKtBbA9yka', 'en', 'US', '0', '0');
INSERT INTO `user` VALUES ('2', 'owner1', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'owner 1', '2014-05-20', 'default-avatar.jpg', '-8.0', 'MlzrZC0FtvRjy04Bi4CO7w4q6FdyRxpdRRUhEXA36kFUBNkPvpMTNomz7NM8', 'en', null, '0', '0');
INSERT INTO `user` VALUES ('3', 'master1', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'scrum master', '2014-05-08', 'default-avatar.jpg', '-8.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('4', 'mem1', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 1', '2014-05-08', 'default-avatar.jpg', '-8.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('5', 'mem2', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 2', '2014-05-08', 'default-avatar.jpg', '-7.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('6', 'mem3', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 3', '2014-05-15', 'default-avatar.jpg', '-7.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('7', 'mem4', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 4', '2014-05-09', 'default-avatar.jpg', '-8.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('8', 'owner2', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'owner 2', '0000-00-00', 'default-avatar.jpg', null, null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('9', 'mem2', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'mem 5', '0000-00-00', 'default-avatar.jpg', null, null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('11', 'leader3', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 3', '2014-05-22', 'default-avatar.jpg', '-8.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('12', 'leader4', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 4', '2014-05-15', 'default-avatar.jpg', '-5.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('13', 'leader5', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 5', '2014-05-30', 'default-avatar.jpg', '-5.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('14', 'leader7', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 7', '2014-05-23', 'default-avatar.jpg', '-5.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('15', 'leader8', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 8', '2014-05-28', 'default-avatar.jpg', '-6.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('21', 'duong', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Duong', '2014-05-16', 'default-avatar.jpg', '-5.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('22', 'yoko', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Yoko', '2014-05-14', 'default-avatar.jpg', '-7.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('23', 'mika', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Mika', '2014-05-14', 'default-avatar.jpg', '-7.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('24', '222', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', '11111', '2014-06-12', 'default-avatar.jpg', '-10.0', null, 'en', null, '0', '1');
INSERT INTO `user` VALUES ('25', 'cccc', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'cvccc', '2014-06-18', 'default-avatar.jpg', '-11.0', null, 'en', null, '0', '1');
INSERT INTO `user` VALUES ('26', 'aaaa', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'testaaa', '2014-06-06', 'default-avatar.jpg', '-10.0', null, 'en', null, '0', '0');
INSERT INTO `user` VALUES ('27', 'aaa', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'testa', '2014-06-05', 'default-avatar.jpg', '-12.0', null, 'en', null, '0', '0');
