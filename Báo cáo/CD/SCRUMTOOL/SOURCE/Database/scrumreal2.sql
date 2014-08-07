/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : scrumreal2

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2014-08-07 21:04:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `access_link`
-- ----------------------------
DROP TABLE IF EXISTS `access_link`;
CREATE TABLE `access_link` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `peid` int(11) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of access_link
-- ----------------------------
INSERT INTO `access_link` VALUES ('1', '/user-profile', '0', '3');
INSERT INTO `access_link` VALUES ('2', '/user-settings', '0', '3');
INSERT INTO `access_link` VALUES ('3', '/language', '0', '78');
INSERT INTO `access_link` VALUES ('4', '/user/save', '0', '6');
INSERT INTO `access_link` VALUES ('5', '/user/add', '0', '7');
INSERT INTO `access_link` VALUES ('6', '/user/change-pass', '0', '6');
INSERT INTO `access_link` VALUES ('7', '/user/delete', '0', '79');
INSERT INTO `access_link` VALUES ('8', '/project/add', '0', '11');
INSERT INTO `access_link` VALUES ('9', '/project/edit', '0', '12');
INSERT INTO `access_link` VALUES ('10', '/user/edit', '0', '3');
INSERT INTO `access_link` VALUES ('11', '/project/save', '0', '14');
INSERT INTO `access_link` VALUES ('12', '/project/delete', '0', '15');
INSERT INTO `access_link` VALUES ('13', '/story', '0', '25');
INSERT INTO `access_link` VALUES ('14', '/story/approve', '0', '20');
INSERT INTO `access_link` VALUES ('15', '/story/delete', '0', '21');
INSERT INTO `access_link` VALUES ('16', '/comment/reply', '0', '22');
INSERT INTO `access_link` VALUES ('17', '/comment/add', '0', '23');
INSERT INTO `access_link` VALUES ('18', '/story/add', '0', '24');
INSERT INTO `access_link` VALUES ('19', '/story\\/datatables\\?_=\\d+/', '1', '25');
INSERT INTO `access_link` VALUES ('20', '/story/edit', '0', '26');
INSERT INTO `access_link` VALUES ('21', '/story/save', '0', '27');
INSERT INTO `access_link` VALUES ('22', '/people', '0', '28');
INSERT INTO `access_link` VALUES ('23', '/team/add', '0', '29');
INSERT INTO `access_link` VALUES ('24', '/team/edit', '0', '30');
INSERT INTO `access_link` VALUES ('25', '/people/remove_from_project', '0', '31');
INSERT INTO `access_link` VALUES ('26', '/people/add_to_project', '0', '32');
INSERT INTO `access_link` VALUES ('27', '/people/move_to_team', '0', '36');
INSERT INTO `access_link` VALUES ('28', '/people/reload_list_staff', '0', '28');
INSERT INTO `access_link` VALUES ('29', '/team\\/reload_team_data\\/\\d+/', '1', '28');
INSERT INTO `access_link` VALUES ('30', '/team/save', '0', '36');
INSERT INTO `access_link` VALUES ('31', '/team/delete', '0', '37');
INSERT INTO `access_link` VALUES ('32', '/sprint', '0', '38');
INSERT INTO `access_link` VALUES ('33', '/sprint/add', '0', '39');
INSERT INTO `access_link` VALUES ('34', '/sprint/edit', '0', '40');
INSERT INTO `access_link` VALUES ('35', '/sprint/save', '0', '41');
INSERT INTO `access_link` VALUES ('36', '/sprint/add_story_to_sprint', '0', '41');
INSERT INTO `access_link` VALUES ('37', '/sprint/move_story_to_sprint', '0', '41');
INSERT INTO `access_link` VALUES ('38', '/sprint/remove_story_from_sprint', '0', '41');
INSERT INTO `access_link` VALUES ('39', '/sprint/update_order', '0', '41');
INSERT INTO `access_link` VALUES ('40', '/sprint/reload_story_list', '0', '38');
INSERT INTO `access_link` VALUES ('41', '/task/add', '0', '47');
INSERT INTO `access_link` VALUES ('42', '/task/edit', '0', '48');
INSERT INTO `access_link` VALUES ('43', '/task/save', '0', '49');
INSERT INTO `access_link` VALUES ('44', '/task/update_status', '0', '49');
INSERT INTO `access_link` VALUES ('45', '/task\\/reload_task_detail\\/\\d+/', '1', '53');
INSERT INTO `access_link` VALUES ('46', '/task\\/reload_story_progress\\/\\d+/', '1', '53');
INSERT INTO `access_link` VALUES ('47', '/task\\/get_datatables\\/\\d+/', '1', '53');
INSERT INTO `access_link` VALUES ('48', '/taskboard.*/', '1', '53');
INSERT INTO `access_link` VALUES ('49', '/activity/get', '0', '55');
INSERT INTO `access_link` VALUES ('50', '/permission', '0', '57');
INSERT INTO `access_link` VALUES ('51', '/permission/save', '0', '65');
INSERT INTO `access_link` VALUES ('53', '/taskboard', '0', '53');
INSERT INTO `access_link` VALUES ('54', '/project\\/get_leader.*/', '1', '12');
INSERT INTO `access_link` VALUES ('55', '/project\\/get_owner.*/', '1', '12');
INSERT INTO `access_link` VALUES ('56', '/project/complete', '0', '15');
INSERT INTO `access_link` VALUES ('57', '/sprint/start_sprint', '0', '80');
INSERT INTO `access_link` VALUES ('58', '/sprint/complete_sprint', '0', '65');
INSERT INTO `access_link` VALUES ('59', '/sprint/resume_sprint', '0', '65');
INSERT INTO `access_link` VALUES ('60', '/sprint/delete', '0', '76');
INSERT INTO `access_link` VALUES ('61', '/sprint/get_team_day', '0', '38');
INSERT INTO `access_link` VALUES ('62', '/sprint/update_team_day', '0', '38');
INSERT INTO `access_link` VALUES ('63', '/sprint/get_team_day_all', '0', '38');
INSERT INTO `access_link` VALUES ('64', '/burndown/sprint_all_team_burndown', '0', '71');
INSERT INTO `access_link` VALUES ('65', '/burndown/sprint_each_team_burndown', '0', '71');
INSERT INTO `access_link` VALUES ('66', '/burndown\\/\\d+\\/.*/', '1', '71');
INSERT INTO `access_link` VALUES ('67', '/burnup', '0', '74');
INSERT INTO `access_link` VALUES ('68', '/burnup/initialize', '0', '74');
INSERT INTO `access_link` VALUES ('71', '/public\\/data\\/attach\\/.*/', '1', '82');
INSERT INTO `access_link` VALUES ('72', '/burndown', '0', '71');
INSERT INTO `access_link` VALUES ('73', '/task/delete', '0', '77');
INSERT INTO `access_link` VALUES ('74', '/task/update_order', '0', '49');
INSERT INTO `access_link` VALUES ('75', '/user\\/datatables.*/', '1', '83');
INSERT INTO `access_link` VALUES ('76', '/users', '0', '83');
INSERT INTO `access_link` VALUES ('77', '/', '0', '82');
INSERT INTO `access_link` VALUES ('78', '/project', '0', '82');
INSERT INTO `access_link` VALUES ('79', '/login', '0', '82');
INSERT INTO `access_link` VALUES ('80', '/logout', '0', '82');
INSERT INTO `access_link` VALUES ('81', '/project\\/datatables\\?_=\\d+/', '1', '82');
INSERT INTO `access_link` VALUES ('82', '/project/set_current', '0', '82');
INSERT INTO `access_link` VALUES ('83', '/project/check_current', '0', '82');
INSERT INTO `access_link` VALUES ('84', '/permission/check', '0', '82');
INSERT INTO `access_link` VALUES ('85', '/attach\\/\\d+\\/\\d+/', '1', '82');
INSERT INTO `access_link` VALUES ('86', '/attach/remove_attach', '0', '82');
INSERT INTO `access_link` VALUES ('87', '/download_attach\\/\\d+/', '1', '82');

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
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '2', '1', '1', '1+4', '2014-07-28 14:43:09', '1');
INSERT INTO `activity` VALUES ('2', '5', '1', '4', '', '2014-07-28 14:43:09', '1');
INSERT INTO `activity` VALUES ('3', '2', '1', '4', '29+2', '2014-07-28 14:43:14', '1');
INSERT INTO `activity` VALUES ('4', '2', '17', '3', '29+2', '2014-07-28 14:43:14', '1');
INSERT INTO `activity` VALUES ('5', '2', '1', '4', '26+2', '2014-07-28 14:43:16', '1');
INSERT INTO `activity` VALUES ('6', '2', '18', '3', '26+2', '2014-07-28 14:43:16', '1');
INSERT INTO `activity` VALUES ('7', '2', '1', '4', '10+2', '2014-07-28 14:43:20', '1');
INSERT INTO `activity` VALUES ('8', '2', '45', '3', '10+2', '2014-07-28 14:43:20', '1');
INSERT INTO `activity` VALUES ('9', '4', '29', '2', 'Estimate time+3+15', '2014-07-28 14:44:19', '1');
INSERT INTO `activity` VALUES ('10', '4', '29', '2', 'Story point+2+30', '2014-07-28 14:44:19', '1');
INSERT INTO `activity` VALUES ('11', '4', '10', '2', 'Estimate time+3+30', '2014-07-28 14:44:37', '1');
INSERT INTO `activity` VALUES ('12', '4', '10', '2', 'Story point+100+80', '2014-07-28 14:44:38', '1');
INSERT INTO `activity` VALUES ('13', '2', '1', '4', '34+2', '2014-07-28 14:44:52', '1');
INSERT INTO `activity` VALUES ('14', '2', '18', '3', '34+2', '2014-07-28 14:44:52', '1');
INSERT INTO `activity` VALUES ('15', '2', '1', '4', '12+2', '2014-07-28 14:45:03', '1');
INSERT INTO `activity` VALUES ('16', '2', '17', '3', '12+2', '2014-07-28 14:45:03', '1');
INSERT INTO `activity` VALUES ('17', '2', '1', '4', '31+2', '2014-07-28 14:45:04', '1');
INSERT INTO `activity` VALUES ('18', '2', '45', '3', '31+2', '2014-07-28 14:45:04', '1');
INSERT INTO `activity` VALUES ('19', '2', '29', '2', '1+6', '2014-07-28 14:45:40', '1');
INSERT INTO `activity` VALUES ('20', '5', '1', '6', '', '2014-07-28 14:45:40', '1');
INSERT INTO `activity` VALUES ('21', '2', '29', '2', '2+6', '2014-07-28 14:45:58', '1');
INSERT INTO `activity` VALUES ('22', '5', '2', '6', '', '2014-07-28 14:45:58', '1');
INSERT INTO `activity` VALUES ('23', '2', '29', '2', '3+6', '2014-07-28 14:46:21', '1');
INSERT INTO `activity` VALUES ('24', '5', '3', '6', '', '2014-07-28 14:46:21', '1');
INSERT INTO `activity` VALUES ('25', '2', '26', '2', '4+6', '2014-07-28 14:46:44', '1');
INSERT INTO `activity` VALUES ('26', '5', '4', '6', '', '2014-07-28 14:46:44', '1');
INSERT INTO `activity` VALUES ('27', '2', '26', '2', '5+6', '2014-07-28 14:46:57', '1');
INSERT INTO `activity` VALUES ('28', '5', '5', '6', '', '2014-07-28 14:46:57', '1');
INSERT INTO `activity` VALUES ('29', '2', '26', '2', '6+6', '2014-07-28 14:47:09', '1');
INSERT INTO `activity` VALUES ('30', '5', '6', '6', '', '2014-07-28 14:47:09', '1');
INSERT INTO `activity` VALUES ('31', '2', '10', '2', '7+6', '2014-07-28 14:47:48', '1');
INSERT INTO `activity` VALUES ('32', '5', '7', '6', '', '2014-07-28 14:47:48', '1');
INSERT INTO `activity` VALUES ('33', '2', '10', '2', '8+6', '2014-07-28 14:48:11', '1');
INSERT INTO `activity` VALUES ('34', '5', '8', '6', '', '2014-07-28 14:48:11', '1');
INSERT INTO `activity` VALUES ('35', '2', '10', '2', '9+6', '2014-07-28 14:48:32', '1');
INSERT INTO `activity` VALUES ('36', '5', '9', '6', '', '2014-07-28 14:48:32', '1');
INSERT INTO `activity` VALUES ('37', '2', '12', '2', '10+6', '2014-07-28 14:48:53', '1');
INSERT INTO `activity` VALUES ('38', '5', '10', '6', '', '2014-07-28 14:48:53', '1');
INSERT INTO `activity` VALUES ('39', '2', '12', '2', '11+6', '2014-07-28 14:49:07', '1');
INSERT INTO `activity` VALUES ('40', '5', '11', '6', '', '2014-07-28 14:49:07', '1');
INSERT INTO `activity` VALUES ('41', '3', '1', '4', '34+2', '2014-07-28 14:49:21', '1');
INSERT INTO `activity` VALUES ('42', '3', '18', '3', '34+2', '2014-07-28 14:49:21', '1');
INSERT INTO `activity` VALUES ('43', '4', '1', '4', 'End date estimate+2014-08-28+2014-08-14', '2014-07-28 14:50:01', '1');
INSERT INTO `activity` VALUES ('44', '2', '31', '2', '12+6', '2014-07-28 14:50:23', '1');
INSERT INTO `activity` VALUES ('45', '5', '12', '6', '', '2014-07-28 14:50:23', '1');
INSERT INTO `activity` VALUES ('46', '2', '31', '2', '13+6', '2014-07-28 14:50:54', '1');
INSERT INTO `activity` VALUES ('47', '5', '13', '6', '', '2014-07-28 14:50:54', '1');
INSERT INTO `activity` VALUES ('48', '4', '1', '6', 'Status+To do+In Progress', '2014-07-28 14:53:21', '1');
INSERT INTO `activity` VALUES ('49', '4', '1', '6', 'Status+In Progress+To test', '2014-07-28 14:53:22', '1');
INSERT INTO `activity` VALUES ('50', '4', '3', '6', 'Status+To do+Done', '2014-07-28 14:53:25', '1');
INSERT INTO `activity` VALUES ('51', '4', '11', '6', 'Status+To do+Done', '2014-07-28 14:53:28', '1');
INSERT INTO `activity` VALUES ('52', '4', '10', '6', 'Status+To do+In Progress', '2014-07-28 14:53:29', '1');
INSERT INTO `activity` VALUES ('53', '4', '10', '6', 'Time remain+0.5+0.5', '2014-07-28 14:53:35', '1');
INSERT INTO `activity` VALUES ('54', '4', '4', '6', 'Status+To do+In Progress', '2014-07-28 14:53:39', '1');
INSERT INTO `activity` VALUES ('55', '4', '6', '6', 'Status+To do+Done', '2014-07-28 14:53:41', '1');
INSERT INTO `activity` VALUES ('56', '4', '5', '6', 'Status+To do+To test', '2014-07-28 14:53:42', '1');
INSERT INTO `activity` VALUES ('57', '4', '4', '6', 'Time remain+0.5+0.5', '2014-07-28 14:53:48', '1');
INSERT INTO `activity` VALUES ('58', '4', '8', '6', 'Status+To do+In Progress', '2014-07-28 14:53:53', '1');
INSERT INTO `activity` VALUES ('59', '4', '8', '6', 'Time remain+2+2', '2014-07-28 14:53:59', '1');
INSERT INTO `activity` VALUES ('60', '4', '12', '6', 'Status+To do+In Progress', '2014-07-28 14:54:03', '1');
INSERT INTO `activity` VALUES ('61', '4', '9', '6', 'Status+To do+To test', '2014-07-28 14:54:09', '1');
INSERT INTO `activity` VALUES ('62', '4', '1', '1', 'Start date+2014-06-10+2014-07-28', '2014-07-28 15:02:17', '1');
INSERT INTO `activity` VALUES ('63', '4', '1', '1', 'Estimate end date+2014-08-27+2014-09-28', '2014-07-28 15:02:17', '1');
INSERT INTO `activity` VALUES ('64', '4', '13', '6', 'User assign+Lê Đức Anh+Hoàng Văn Hiệu', '2014-07-28 15:11:16', '1');
INSERT INTO `activity` VALUES ('65', '4', '12', '6', 'Status+In Progress+Done', '2014-07-28 15:11:19', '1');
INSERT INTO `activity` VALUES ('66', '4', '13', '6', 'Status+To do+Done', '2014-07-28 15:11:21', '1');
INSERT INTO `activity` VALUES ('67', '4', '12', '6', 'Status+Done+To test', '2014-07-28 15:17:28', '1');
INSERT INTO `activity` VALUES ('68', '4', '13', '6', 'Status+Done+In Progress', '2014-07-28 15:17:31', '1');
INSERT INTO `activity` VALUES ('69', '4', '12', '6', 'Status+To test+Done', '2014-07-28 15:17:33', '1');
INSERT INTO `activity` VALUES ('70', '4', '13', '6', 'Status+In Progress+Done', '2014-07-28 15:17:34', '1');
INSERT INTO `activity` VALUES ('71', '4', '1', '1', 'Start date+2014-07-28+2014-07-01', '2014-07-28 15:20:00', '1');
INSERT INTO `activity` VALUES ('72', '4', '1', '1', 'Estimate end date+2014-09-28+2014-07-28', '2014-07-28 15:20:00', '1');
INSERT INTO `activity` VALUES ('73', '4', '1', '1', 'Start date+2014-07-01+2014-07-28', '2014-07-28 15:20:44', '1');
INSERT INTO `activity` VALUES ('74', '4', '1', '1', 'Estimate end date+2014-07-28+2014-08-30', '2014-07-28 15:20:44', '1');
INSERT INTO `activity` VALUES ('75', '4', '1', '1', 'Start date+2014-07-28+2014-07-01', '2014-07-28 15:24:08', '1');
INSERT INTO `activity` VALUES ('76', '4', '1', '4', 'Start date estimate+2014-07-28+2014-07-01', '2014-07-28 15:25:00', '1');
INSERT INTO `activity` VALUES ('77', '4', '1', '4', 'End date estimate+2014-08-14+2014-07-30', '2014-07-28 15:25:00', '1');
INSERT INTO `activity` VALUES ('78', '4', '4', '6', 'Status+In Progress+Done', '2014-07-28 15:25:16', '1');
INSERT INTO `activity` VALUES ('79', '4', '5', '6', 'Status+To test+Done', '2014-07-28 15:25:18', '1');
INSERT INTO `activity` VALUES ('80', '4', '10', '6', 'Status+In Progress+Done', '2014-07-28 15:25:20', '1');
INSERT INTO `activity` VALUES ('81', '4', '2', '6', 'Status+To do+In Progress', '2014-07-28 15:26:06', '1');
INSERT INTO `activity` VALUES ('82', '4', '1', '6', 'Status+To test+Done', '2014-07-28 15:26:08', '1');
INSERT INTO `activity` VALUES ('83', '4', '2', '6', 'Status+In Progress+Done', '2014-07-28 15:26:12', '1');
INSERT INTO `activity` VALUES ('84', '2', '1', '4', '23+2', '2014-07-28 15:32:37', '1');
INSERT INTO `activity` VALUES ('85', '2', '18', '3', '23+2', '2014-07-28 15:32:37', '1');
INSERT INTO `activity` VALUES ('86', '4', '23', '2', 'Estimate time+3+5', '2014-07-28 15:32:41', '1');
INSERT INTO `activity` VALUES ('87', '2', '23', '2', '14+6', '2014-07-28 15:32:58', '1');
INSERT INTO `activity` VALUES ('88', '5', '14', '6', '', '2014-07-28 15:32:58', '1');
INSERT INTO `activity` VALUES ('89', '2', '23', '2', '15+6', '2014-07-28 15:34:42', '1');
INSERT INTO `activity` VALUES ('90', '5', '15', '6', '', '2014-07-28 15:34:43', '1');
INSERT INTO `activity` VALUES ('91', '2', '23', '2', '16+6', '2014-07-28 15:34:58', '1');
INSERT INTO `activity` VALUES ('92', '5', '16', '6', '', '2014-07-28 15:34:58', '1');
INSERT INTO `activity` VALUES ('93', '3', '23', '2', '16+6', '2014-07-28 15:35:08', '1');
INSERT INTO `activity` VALUES ('94', '2', '23', '2', '17+6', '2014-07-28 15:35:29', '1');
INSERT INTO `activity` VALUES ('95', '5', '17', '6', '', '2014-07-28 15:35:29', '1');
INSERT INTO `activity` VALUES ('96', '4', '15', '6', 'Status+To do+To test', '2014-07-28 15:36:10', '1');
INSERT INTO `activity` VALUES ('97', '4', '17', '6', 'User assign+Nguyễn Văn Hiếu+Lục Thị Hoa', '2014-07-28 15:36:17', '1');
INSERT INTO `activity` VALUES ('98', '4', '17', '6', 'Status+To do+Done', '2014-07-28 15:36:20', '1');
INSERT INTO `activity` VALUES ('99', '4', '7', '6', 'Status+To do+Done', '2014-07-28 15:43:01', '1');
INSERT INTO `activity` VALUES ('100', '4', '8', '6', 'Status+In Progress+Done', '2014-07-28 15:43:03', '1');
INSERT INTO `activity` VALUES ('101', '4', '9', '6', 'Status+To test+Done', '2014-07-28 15:43:05', '1');
INSERT INTO `activity` VALUES ('102', '4', '2', '6', 'Status+Done+To do', '2014-07-28 15:47:45', '1');
INSERT INTO `activity` VALUES ('103', '4', '2', '6', 'Status+To do+To test', '2014-07-28 15:48:43', '1');
INSERT INTO `activity` VALUES ('104', '4', '2', '6', 'Status+To test+Done', '2014-07-28 15:48:48', '1');
INSERT INTO `activity` VALUES ('105', '4', '1', '6', 'Status+Done+In Progress', '2014-07-28 15:51:09', '1');
INSERT INTO `activity` VALUES ('106', '4', '1', '6', 'Status+In Progress+Done', '2014-07-28 15:51:43', '1');
INSERT INTO `activity` VALUES ('107', '2', '17', '3', '34+8', '2014-08-01 20:49:03', '1');
INSERT INTO `activity` VALUES ('108', '3', '17', '3', '34+8', '2014-08-01 20:49:07', '1');
INSERT INTO `activity` VALUES ('109', '2', '18', '3', '34+8', '2014-08-01 20:49:07', '1');
INSERT INTO `activity` VALUES ('110', '5', '43', '1', '', '2014-08-04 05:50:23', '1');
INSERT INTO `activity` VALUES ('111', '2', '43', '1', '36+2', '2014-08-04 05:54:43', '25');
INSERT INTO `activity` VALUES ('112', '5', '36', '2', '', '2014-08-04 05:54:43', '25');
INSERT INTO `activity` VALUES ('113', '2', '43', '1', '37+2', '2014-08-04 05:57:29', '25');
INSERT INTO `activity` VALUES ('114', '5', '37', '2', '', '2014-08-04 05:57:29', '25');
INSERT INTO `activity` VALUES ('115', '2', '37', '2', '26+9', '2014-08-04 05:57:30', '25');
INSERT INTO `activity` VALUES ('116', '4', '43', '1', 'Status+New+Approved', '2014-08-04 05:57:53', '25');
INSERT INTO `activity` VALUES ('117', '4', '43', '1', 'Status+New+Approved', '2014-08-04 05:57:58', '25');
INSERT INTO `activity` VALUES ('118', '2', '43', '1', '46+3', '2014-08-04 05:58:27', '25');
INSERT INTO `activity` VALUES ('119', '5', '46', '3', '', '2014-08-04 05:58:28', '25');
INSERT INTO `activity` VALUES ('120', '2', '46', '3', '15+8', '2014-08-04 05:58:30', '25');
INSERT INTO `activity` VALUES ('121', '2', '46', '3', '14+8', '2014-08-04 05:58:33', '25');
INSERT INTO `activity` VALUES ('122', '2', '46', '3', '9+8', '2014-08-04 05:58:36', '25');
INSERT INTO `activity` VALUES ('123', '2', '46', '3', '33+8', '2014-08-04 05:58:40', '25');
INSERT INTO `activity` VALUES ('124', '2', '46', '3', '26+8', '2014-08-04 05:58:44', '25');
INSERT INTO `activity` VALUES ('125', '3', '46', '3', '9+8', '2014-08-04 05:59:13', '25');
INSERT INTO `activity` VALUES ('126', '2', '46', '3', '30+8', '2014-08-04 05:59:22', '25');
INSERT INTO `activity` VALUES ('127', '4', '37', '2', 'Estimate time++10', '2014-08-04 05:59:43', '25');
INSERT INTO `activity` VALUES ('128', '4', '37', '2', 'Story point++40', '2014-08-04 05:59:43', '25');
INSERT INTO `activity` VALUES ('129', '4', '36', '2', 'Estimate time++15', '2014-08-04 05:59:55', '25');
INSERT INTO `activity` VALUES ('130', '4', '36', '2', 'Story point++60', '2014-08-04 05:59:55', '25');
INSERT INTO `activity` VALUES ('131', '2', '43', '1', '2+4', '2014-08-04 06:00:14', '25');
INSERT INTO `activity` VALUES ('132', '5', '2', '4', '', '2014-08-04 06:00:14', '25');
INSERT INTO `activity` VALUES ('133', '2', '2', '4', '36+2', '2014-08-04 06:00:17', '25');
INSERT INTO `activity` VALUES ('134', '2', '46', '3', '36+2', '2014-08-04 06:00:17', '25');
INSERT INTO `activity` VALUES ('135', '2', '2', '4', '37+2', '2014-08-04 06:00:22', '25');
INSERT INTO `activity` VALUES ('136', '2', '46', '3', '37+2', '2014-08-04 06:00:22', '25');
INSERT INTO `activity` VALUES ('137', '2', '36', '2', '18+6', '2014-08-04 06:01:12', '25');
INSERT INTO `activity` VALUES ('138', '5', '18', '6', '', '2014-08-04 06:01:12', '25');
INSERT INTO `activity` VALUES ('139', '4', '18', '6', 'Status+To do+In Progress', '2014-08-04 06:01:32', '25');
INSERT INTO `activity` VALUES ('140', '4', '18', '6', 'Status+In Progress+To test', '2014-08-04 06:01:33', '25');
INSERT INTO `activity` VALUES ('141', '4', '18', '6', 'Status+To test+Done', '2014-08-04 06:01:35', '25');
INSERT INTO `activity` VALUES ('142', '4', '43', '1', 'Allow user not in project to view this project+1+0', '2014-08-04 22:40:21', '1');
INSERT INTO `activity` VALUES ('143', '4', '29', '2', 'Name+Bổ sung quản lí món ăn+Bổ sung quản lí món ăn s', '2014-08-05 06:07:20', '1');
INSERT INTO `activity` VALUES ('144', '4', '26', '2', 'Name+Nâng cấp tính năng report hàng tuần+Nâng cấp tính năng report hàng tuần, hàng tháng', '2014-08-05 06:07:59', '1');
INSERT INTO `activity` VALUES ('145', '3', '17', '3', '21+8', '2014-08-05 06:08:44', '1');
INSERT INTO `activity` VALUES ('146', '2', '18', '3', '21+8', '2014-08-05 06:08:44', '1');
INSERT INTO `activity` VALUES ('147', '3', '18', '3', '21+8', '2014-08-05 06:08:48', '1');
INSERT INTO `activity` VALUES ('148', '2', '17', '3', '21+8', '2014-08-05 06:08:48', '1');
INSERT INTO `activity` VALUES ('149', '3', '17', '3', '21+8', '2014-08-05 06:09:05', '1');
INSERT INTO `activity` VALUES ('150', '3', '18', '3', '5+8', '2014-08-05 06:09:09', '1');
INSERT INTO `activity` VALUES ('151', '3', '45', '3', '29+8', '2014-08-05 06:09:13', '1');
INSERT INTO `activity` VALUES ('152', '4', '1', '1', 'Name+Quản lí tiệc cưới+Quản lí tiệc cưới a', '2014-08-05 19:16:46', '1');
INSERT INTO `activity` VALUES ('153', '1', '1', '1', '1', '2014-08-05 19:17:34', '2');
INSERT INTO `activity` VALUES ('154', '4', '29', '2', 'Name+Bổ sung quản lí món ăn s+Bổ sung quản lí món ăn', '2014-08-05 21:26:54', '1');
INSERT INTO `activity` VALUES ('155', '4', '1', '1', 'Name+Quản lí tiệc cưới a+Quản lí tiệc cưới', '2014-08-05 21:35:35', '1');
INSERT INTO `activity` VALUES ('156', '4', '1', '1', 'Start date+2014-07-01+2014-06-10', '2014-08-05 21:39:41', '1');
INSERT INTO `activity` VALUES ('157', '4', '1', '1', 'Estimate end date+2014-08-30+2014-08-10', '2014-08-05 21:39:41', '1');
INSERT INTO `activity` VALUES ('158', '4', '1', '1', 'Start date+2014-06-10+2014-07-10', '2014-08-05 21:53:01', '1');
INSERT INTO `activity` VALUES ('159', '4', '1', '1', 'Estimate end date+2014-08-10+2014-09-10', '2014-08-05 21:53:01', '1');
INSERT INTO `activity` VALUES ('160', '4', '1', '4', 'End date estimate+2014-07-30+2014-07-14', '2014-08-05 22:42:07', '1');
INSERT INTO `activity` VALUES ('161', '4', '1', '1', 'Name+Quản lí tiệc cưới+Quản lí tiệc cưới a', '2014-08-05 22:56:22', '1');
INSERT INTO `activity` VALUES ('162', '4', '1', '1', 'Name+Quản lí tiệc cưới a+Quản lí tiệc cưới', '2014-08-05 22:57:24', '1');
INSERT INTO `activity` VALUES ('163', '1', '1', '1', '2', '2014-08-05 22:58:06', '1');
INSERT INTO `activity` VALUES ('164', '4', '1', '1', 'Name+Quản lí tiệc cưới+Quản lí tiệc cướid', '2014-08-05 22:58:19', '1');
INSERT INTO `activity` VALUES ('165', '2', '29', '2', '19+6', '2014-08-05 23:00:21', '1');
INSERT INTO `activity` VALUES ('166', '5', '19', '6', '', '2014-08-05 23:00:21', '1');
INSERT INTO `activity` VALUES ('167', '2', '17', '3', '9+8', '2014-08-05 23:01:57', '1');
INSERT INTO `activity` VALUES ('168', '3', '17', '3', '9+8', '2014-08-05 23:02:40', '1');
INSERT INTO `activity` VALUES ('169', '2', '17', '3', '8+8', '2014-08-05 23:02:46', '1');
INSERT INTO `activity` VALUES ('170', '3', '17', '3', '8+8', '2014-08-05 23:02:51', '1');
INSERT INTO `activity` VALUES ('171', '2', '1', '1', '3+4', '2014-08-05 23:03:25', '1');
INSERT INTO `activity` VALUES ('172', '5', '3', '4', '', '2014-08-05 23:03:25', '1');
INSERT INTO `activity` VALUES ('173', '2', '3', '4', '34+2', '2014-08-05 23:04:21', '1');
INSERT INTO `activity` VALUES ('174', '2', '17', '3', '34+2', '2014-08-05 23:04:21', '1');
INSERT INTO `activity` VALUES ('175', '2', '3', '4', '28+2', '2014-08-05 23:05:31', '1');
INSERT INTO `activity` VALUES ('176', '2', '18', '3', '28+2', '2014-08-05 23:05:31', '1');
INSERT INTO `activity` VALUES ('177', '2', '3', '4', '30+2', '2014-08-05 23:05:33', '1');
INSERT INTO `activity` VALUES ('178', '2', '45', '3', '30+2', '2014-08-05 23:05:33', '1');
INSERT INTO `activity` VALUES ('179', '4', '1', '6', 'Status+Done+To test', '2014-08-05 23:06:20', '1');
INSERT INTO `activity` VALUES ('180', '2', '34', '2', '20+6', '2014-08-05 23:07:00', '2');
INSERT INTO `activity` VALUES ('181', '5', '20', '6', '', '2014-08-05 23:07:00', '2');
INSERT INTO `activity` VALUES ('182', '4', '20', '6', 'User assign+Lê Trung Kiên+Bùi Quang Huy Hoàng', '2014-08-05 23:07:28', '1');
INSERT INTO `activity` VALUES ('183', '4', '20', '6', 'Status+To do+In Progress', '2014-08-05 23:08:28', '1');
INSERT INTO `activity` VALUES ('184', '4', '20', '6', 'Status+In Progress+To test', '2014-08-05 23:08:29', '1');
INSERT INTO `activity` VALUES ('185', '4', '20', '6', 'Status+To test+Done', '2014-08-05 23:08:31', '1');
INSERT INTO `activity` VALUES ('186', '4', '20', '6', 'Status+Done+To do', '2014-08-05 23:08:34', '1');
INSERT INTO `activity` VALUES ('187', '2', '34', '2', '21+6', '2014-08-05 23:09:41', '2');
INSERT INTO `activity` VALUES ('188', '5', '21', '6', '', '2014-08-05 23:09:41', '2');
INSERT INTO `activity` VALUES ('189', '2', '34', '2', '22+6', '2014-08-05 23:10:52', '2');
INSERT INTO `activity` VALUES ('190', '5', '22', '6', '', '2014-08-05 23:10:52', '2');
INSERT INTO `activity` VALUES ('191', '4', '22', '6', 'Status+To do+In Progress', '2014-08-05 23:11:07', '1');
INSERT INTO `activity` VALUES ('192', '4', '20', '6', 'Status+To do+To test', '2014-08-05 23:11:09', '1');
INSERT INTO `activity` VALUES ('193', '4', '22', '6', 'Status+In Progress+Done', '2014-08-05 23:11:11', '1');
INSERT INTO `activity` VALUES ('194', '4', '20', '6', 'Status+To test+In Progress', '2014-08-05 23:11:13', '1');
INSERT INTO `activity` VALUES ('195', '4', '20', '6', 'Status+In Progress+To do', '2014-08-05 23:11:14', '1');
INSERT INTO `activity` VALUES ('196', '4', '20', '6', 'Status+To do+To test', '2014-08-05 23:11:17', '1');
INSERT INTO `activity` VALUES ('197', '4', '21', '6', 'Status+To do+To test', '2014-08-05 23:11:19', '1');
INSERT INTO `activity` VALUES ('198', '2', '42', '1', '39+2', '2014-08-06 05:54:24', '1');
INSERT INTO `activity` VALUES ('199', '5', '39', '2', '', '2014-08-06 05:54:24', '1');
INSERT INTO `activity` VALUES ('200', '4', '42', '1', 'Status+New+Approved', '2014-08-06 05:56:40', '1');
INSERT INTO `activity` VALUES ('201', '2', '42', '1', '47+3', '2014-08-06 05:59:16', '1');
INSERT INTO `activity` VALUES ('202', '5', '47', '3', '', '2014-08-06 05:59:16', '1');
INSERT INTO `activity` VALUES ('203', '2', '47', '3', '37+8', '2014-08-06 05:59:27', '1');
INSERT INTO `activity` VALUES ('204', '2', '42', '1', '4+4', '2014-08-06 05:59:52', '1');
INSERT INTO `activity` VALUES ('205', '5', '4', '4', '', '2014-08-06 05:59:52', '1');
INSERT INTO `activity` VALUES ('206', '4', '39', '2', 'Estimate time++8', '2014-08-06 06:00:15', '1');
INSERT INTO `activity` VALUES ('207', '4', '39', '2', 'Story point++30', '2014-08-06 06:00:15', '1');
INSERT INTO `activity` VALUES ('208', '2', '4', '4', '39+2', '2014-08-06 06:00:22', '1');
INSERT INTO `activity` VALUES ('209', '2', '47', '3', '39+2', '2014-08-06 06:00:22', '1');
INSERT INTO `activity` VALUES ('210', '2', '39', '2', '23+6', '2014-08-06 06:00:34', '1');
INSERT INTO `activity` VALUES ('211', '5', '23', '6', '', '2014-08-06 06:00:34', '1');
INSERT INTO `activity` VALUES ('212', '2', '39', '2', '24+6', '2014-08-06 06:00:50', '1');
INSERT INTO `activity` VALUES ('213', '5', '24', '6', '', '2014-08-06 06:00:50', '1');
INSERT INTO `activity` VALUES ('214', '4', '24', '6', 'Status+To do+In Progress', '2014-08-06 06:01:43', '29');
INSERT INTO `activity` VALUES ('215', '4', '23', '6', 'Status+To do+To test', '2014-08-06 06:01:45', '29');
INSERT INTO `activity` VALUES ('216', '4', '24', '6', 'Status+In Progress+Done', '2014-08-06 06:01:55', '29');
INSERT INTO `activity` VALUES ('217', '4', '23', '6', 'Status+To test+Done', '2014-08-06 06:01:57', '29');
INSERT INTO `activity` VALUES ('218', '4', '23', '6', 'Status+Done+To test', '2014-08-06 06:08:06', '1');
INSERT INTO `activity` VALUES ('219', '4', '23', '6', 'Status+To test+Done', '2014-08-06 06:08:07', '1');
INSERT INTO `activity` VALUES ('220', '4', '24', '6', 'Status+Done+In Progress', '2014-08-06 06:08:16', '1');
INSERT INTO `activity` VALUES ('221', '4', '23', '6', 'Status+Done+To do', '2014-08-06 06:08:18', '1');
INSERT INTO `activity` VALUES ('222', '4', '24', '6', 'Status+In Progress+Done', '2014-08-06 06:08:20', '1');
INSERT INTO `activity` VALUES ('223', '4', '23', '6', 'Status+To do+To test', '2014-08-06 06:08:22', '1');
INSERT INTO `activity` VALUES ('224', '2', '4', '4', '39+2', '2014-08-06 06:09:24', '1');
INSERT INTO `activity` VALUES ('225', '2', '47', '3', '39+2', '2014-08-06 06:09:25', '1');
INSERT INTO `activity` VALUES ('226', '4', '23', '6', 'Status+To test+Done', '2014-08-06 06:09:27', '1');
INSERT INTO `activity` VALUES ('227', '2', '42', '1', '48+3', '2014-08-06 06:10:47', '29');
INSERT INTO `activity` VALUES ('228', '5', '48', '3', '', '2014-08-06 06:10:47', '29');
INSERT INTO `activity` VALUES ('229', '4', '1', '1', 'Name+Quản lí tiệc cướid+Quản lí tiệc cưới', '2014-08-06 06:22:30', '1');
INSERT INTO `activity` VALUES ('230', '1', '1', '1', '3', '2014-08-06 06:23:11', '2');
INSERT INTO `activity` VALUES ('231', '4', '1', '1', 'Desciption++mo ta du an', '2014-08-06 08:27:43', '1');
INSERT INTO `activity` VALUES ('232', '4', '1', '1', 'Name+Quản lí tiệc cưới+Quản lí tiệc cưới abv', '2014-08-06 08:28:06', '1');
INSERT INTO `activity` VALUES ('233', '1', '1', '1', '4', '2014-08-06 08:28:32', '1');
INSERT INTO `activity` VALUES ('234', '2', '26', '2', '25+6', '2014-08-06 08:29:44', '1');
INSERT INTO `activity` VALUES ('235', '5', '25', '6', '', '2014-08-06 08:29:44', '1');
INSERT INTO `activity` VALUES ('236', '2', '17', '3', '21+8', '2014-08-06 08:30:07', '1');
INSERT INTO `activity` VALUES ('237', '2', '18', '3', '38+8', '2014-08-06 08:30:33', '1');
INSERT INTO `activity` VALUES ('238', '2', '3', '4', '33+2', '2014-08-06 08:31:11', '1');
INSERT INTO `activity` VALUES ('239', '2', '17', '3', '33+2', '2014-08-06 08:31:11', '1');
INSERT INTO `activity` VALUES ('240', '2', '3', '4', '13+2', '2014-08-06 08:31:21', '1');
INSERT INTO `activity` VALUES ('241', '2', '18', '3', '13+2', '2014-08-06 08:31:21', '1');
INSERT INTO `activity` VALUES ('242', '4', '1', '6', 'Status+To test+In Progress', '2014-08-06 08:31:49', '1');
INSERT INTO `activity` VALUES ('243', '4', '1', '6', 'Status+In Progress+To test', '2014-08-06 08:31:52', '1');
INSERT INTO `activity` VALUES ('244', '4', '3', '6', 'Status+Done+In Progress', '2014-08-06 08:31:57', '1');
INSERT INTO `activity` VALUES ('245', '4', '19', '6', 'Status+To do+In Progress', '2014-08-06 08:32:13', '1');
INSERT INTO `activity` VALUES ('246', '4', '19', '6', 'Status+In Progress+Done', '2014-08-06 08:32:17', '1');
INSERT INTO `activity` VALUES ('247', '4', '1', '6', 'Status+To test+Done', '2014-08-06 08:32:19', '1');
INSERT INTO `activity` VALUES ('248', '4', '3', '6', 'Status+In Progress+Done', '2014-08-06 08:32:22', '1');
INSERT INTO `activity` VALUES ('249', '4', '25', '6', 'Status+To do+Done', '2014-08-06 08:32:45', '1');

-- ----------------------------
-- Table structure for `attach`
-- ----------------------------
DROP TABLE IF EXISTS `attach`;
CREATE TABLE `attach` (
  `atid` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(610) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `entity_type` int(11) NOT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`atid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of attach
-- ----------------------------
INSERT INTO `attach` VALUES ('1', '3420 toeic vocabulary words.pdf', '1', '1', '1');
INSERT INTO `attach` VALUES ('2', 'BROS ER.png', '1', '1', '0');
INSERT INTO `attach` VALUES ('3', 'Character set và collation trong mysql.docx', '14', '1', '1');
INSERT INTO `attach` VALUES ('4', 'Coding Conventions.docx', '14', '1', '1');
INSERT INTO `attach` VALUES ('5', 'Character set và collation trong mysql.docx', '15', '1', '0');
INSERT INTO `attach` VALUES ('6', 'abc.docx', '16', '1', '0');
INSERT INTO `attach` VALUES ('7', 'Character set và collation trong mysql.docx', '19', '1', '0');
INSERT INTO `attach` VALUES ('8', 'Coding Conventions.docx', '1', '1', '0');
INSERT INTO `attach` VALUES ('9', 'how for loop work.jpg', '14', '1', '1');
INSERT INTO `attach` VALUES ('10', 'Architectural Design Conventions.docx', '14', '1', '1');
INSERT INTO `attach` VALUES ('11', 'Yeu cau lam website anh Thang.docx', '14', '1', '1');
INSERT INTO `attach` VALUES ('12', '3420 toeic vocabulary words.pdf', '14', '1', '0');
INSERT INTO `attach` VALUES ('13', 'Architectural Design Conventions.docx', '14', '1', '0');
INSERT INTO `attach` VALUES ('14', 'Coding Conventions.docx', '14', '1', '0');
INSERT INTO `attach` VALUES ('15', 'htaccess.docx', '14', '1', '0');
INSERT INTO `attach` VALUES ('16', 'startup.jpg', '14', '1', '1');
INSERT INTO `attach` VALUES ('17', 'Stored_Procedure.pdf', '14', '1', '1');
INSERT INTO `attach` VALUES ('18', 'words.jpg', '14', '1', '0');
INSERT INTO `attach` VALUES ('19', 'Coding Conventions.docx', '27', '1', '0');
INSERT INTO `attach` VALUES ('20', 'LAP_duongpa.docx', '28', '1', '0');
INSERT INTO `attach` VALUES ('21', 'LAP_duongpa.docx', '29', '1', '0');
INSERT INTO `attach` VALUES ('22', 'LAP_duongpa.docx', '30', '2', '1');
INSERT INTO `attach` VALUES ('23', 'LAP.xlsx', '30', '2', '1');
INSERT INTO `attach` VALUES ('24', 'LAP_duongpa.docx', '30', '2', '0');
INSERT INTO `attach` VALUES ('25', 'Scrum Guide Official.pdf', '35', '2', '1');
INSERT INTO `attach` VALUES ('26', 'Stored_Procedure.pdf', '37', '2', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2', '1', '1', 'comment sssssss', null, '2014-08-05 19:17:34');
INSERT INTO `comment` VALUES ('2', '1', '1', '1', 'binh luan o day', '1', '2014-08-05 22:58:05');
INSERT INTO `comment` VALUES ('3', '2', '1', '1', 'Test comment here', null, '2014-08-06 06:23:11');
INSERT INTO `comment` VALUES ('4', '1', '1', '1', 'sfasdfasdf', null, '2014-08-06 08:28:32');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `peid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`peid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('3', 'Profile management');
INSERT INTO `permission` VALUES ('5', 'Change language');
INSERT INTO `permission` VALUES ('6', 'Update user');
INSERT INTO `permission` VALUES ('7', 'Add new user');
INSERT INTO `permission` VALUES ('11', 'Add new project');
INSERT INTO `permission` VALUES ('12', 'View project detail');
INSERT INTO `permission` VALUES ('14', 'Update project');
INSERT INTO `permission` VALUES ('15', 'Delete project');
INSERT INTO `permission` VALUES ('20', 'Approve story');
INSERT INTO `permission` VALUES ('21', 'Delete story');
INSERT INTO `permission` VALUES ('22', 'Reply comment');
INSERT INTO `permission` VALUES ('23', 'Add new comment');
INSERT INTO `permission` VALUES ('24', 'Add new story');
INSERT INTO `permission` VALUES ('25', 'View story list');
INSERT INTO `permission` VALUES ('26', 'View story detail');
INSERT INTO `permission` VALUES ('27', 'Update story');
INSERT INTO `permission` VALUES ('28', 'Access people page');
INSERT INTO `permission` VALUES ('29', 'Add new team');
INSERT INTO `permission` VALUES ('30', 'View team detail');
INSERT INTO `permission` VALUES ('31', 'Remove member from project');
INSERT INTO `permission` VALUES ('32', 'Add member to project');
INSERT INTO `permission` VALUES ('36', 'Update team');
INSERT INTO `permission` VALUES ('37', 'Delete team');
INSERT INTO `permission` VALUES ('38', 'Access sprint page');
INSERT INTO `permission` VALUES ('39', 'Add new sprint');
INSERT INTO `permission` VALUES ('40', 'View sprint detail');
INSERT INTO `permission` VALUES ('41', 'Update sprint');
INSERT INTO `permission` VALUES ('43', 'Move story to another sprint');
INSERT INTO `permission` VALUES ('44', 'Remove story from sprint');
INSERT INTO `permission` VALUES ('47', 'Add task');
INSERT INTO `permission` VALUES ('48', 'View task detail');
INSERT INTO `permission` VALUES ('49', 'Update task ');
INSERT INTO `permission` VALUES ('53', 'View task list');
INSERT INTO `permission` VALUES ('55', 'View activity');
INSERT INTO `permission` VALUES ('57', 'Manage permission');
INSERT INTO `permission` VALUES ('65', 'Update sprint');
INSERT INTO `permission` VALUES ('71', 'Access burn down chart');
INSERT INTO `permission` VALUES ('74', 'Access burn up chart');
INSERT INTO `permission` VALUES ('76', 'Delete sprint');
INSERT INTO `permission` VALUES ('77', 'Delete task');
INSERT INTO `permission` VALUES ('78', 'Change language');
INSERT INTO `permission` VALUES ('79', 'Delete user');
INSERT INTO `permission` VALUES ('80', 'Start sprint');
INSERT INTO `permission` VALUES ('82', 'General function');
INSERT INTO `permission` VALUES ('83', 'User management');

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
  `allow_out_view` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'Quản lí tiệc cưới abv', '2014-07-10', '2014-09-10', null, '', '1', 'mo ta du an', '0', '0');
INSERT INTO `project` VALUES ('2', 'Quản lí nhân sự', '2014-04-02', '2014-05-30', null, '', '1', '', '1', '1');
INSERT INTO `project` VALUES ('6', 'Quản lí khách sạn', '2014-06-10', '2014-06-26', null, '', '1', '', '1', '1');
INSERT INTO `project` VALUES ('9', 'Game bắn súng', '2014-06-01', '2014-06-30', null, '', '1', '', '0', '0');
INSERT INTO `project` VALUES ('42', 'Website bán hàng trực tuyến', '2014-07-26', '2014-10-23', '2014-07-26', '', '-1', '', '0', '1');
INSERT INTO `project` VALUES ('43', 'Quản lí nghiệp vụ trường tiểu học', '2014-08-04', '2015-01-15', null, '', '-1', '', '0', '0');

-- ----------------------------
-- Table structure for `project_user`
-- ----------------------------
DROP TABLE IF EXISTS `project_user`;
CREATE TABLE `project_user` (
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project_user
-- ----------------------------
INSERT INTO `project_user` VALUES ('1', '2', '17', '2');
INSERT INTO `project_user` VALUES ('1', '3', '18', '2');
INSERT INTO `project_user` VALUES ('1', '6', '18', '3');
INSERT INTO `project_user` VALUES ('1', '12', '17', '3');
INSERT INTO `project_user` VALUES ('1', '11', '17', '3');
INSERT INTO `project_user` VALUES ('1', '22', '45', '2');
INSERT INTO `project_user` VALUES ('1', '27', '45', '3');
INSERT INTO `project_user` VALUES ('1', '13', '45', '3');
INSERT INTO `project_user` VALUES ('1', '4', '18', '3');
INSERT INTO `project_user` VALUES ('1', '28', '17', '3');
INSERT INTO `project_user` VALUES ('1', '7', '18', '3');
INSERT INTO `project_user` VALUES ('1', '31', '45', '3');
INSERT INTO `project_user` VALUES ('42', '1', '0', '1');
INSERT INTO `project_user` VALUES ('42', '23', '0', '4');
INSERT INTO `project_user` VALUES ('43', '35', '46', '2');
INSERT INTO `project_user` VALUES ('43', '15', '46', '3');
INSERT INTO `project_user` VALUES ('43', '14', '46', '3');
INSERT INTO `project_user` VALUES ('43', '33', '46', '3');
INSERT INTO `project_user` VALUES ('43', '26', '46', '3');
INSERT INTO `project_user` VALUES ('43', '30', '46', '3');
INSERT INTO `project_user` VALUES ('43', '25', '0', '1');
INSERT INTO `project_user` VALUES ('43', '36', '0', '4');
INSERT INTO `project_user` VALUES ('42', '29', '47', '2');
INSERT INTO `project_user` VALUES ('42', '37', '47', '3');
INSERT INTO `project_user` VALUES ('42', '9', '48', '2');
INSERT INTO `project_user` VALUES ('1', '1', '0', '1');
INSERT INTO `project_user` VALUES ('1', '32', '0', '4');
INSERT INTO `project_user` VALUES ('1', '21', '17', '3');
INSERT INTO `project_user` VALUES ('1', '38', '18', '3');

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
INSERT INTO `role` VALUES ('0', 'Not in project');
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
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`rid`,`peid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('0', '3', '1');
INSERT INTO `role_permission` VALUES ('0', '3', '42');
INSERT INTO `role_permission` VALUES ('0', '3', '43');
INSERT INTO `role_permission` VALUES ('0', '5', '1');
INSERT INTO `role_permission` VALUES ('0', '5', '42');
INSERT INTO `role_permission` VALUES ('0', '5', '43');
INSERT INTO `role_permission` VALUES ('0', '12', '1');
INSERT INTO `role_permission` VALUES ('0', '12', '42');
INSERT INTO `role_permission` VALUES ('0', '12', '43');
INSERT INTO `role_permission` VALUES ('0', '25', '1');
INSERT INTO `role_permission` VALUES ('0', '25', '42');
INSERT INTO `role_permission` VALUES ('0', '25', '43');
INSERT INTO `role_permission` VALUES ('0', '26', '1');
INSERT INTO `role_permission` VALUES ('0', '26', '42');
INSERT INTO `role_permission` VALUES ('0', '26', '43');
INSERT INTO `role_permission` VALUES ('0', '28', '1');
INSERT INTO `role_permission` VALUES ('0', '28', '42');
INSERT INTO `role_permission` VALUES ('0', '28', '43');
INSERT INTO `role_permission` VALUES ('0', '30', '1');
INSERT INTO `role_permission` VALUES ('0', '30', '42');
INSERT INTO `role_permission` VALUES ('0', '30', '43');
INSERT INTO `role_permission` VALUES ('0', '38', '1');
INSERT INTO `role_permission` VALUES ('0', '38', '42');
INSERT INTO `role_permission` VALUES ('0', '38', '43');
INSERT INTO `role_permission` VALUES ('0', '40', '1');
INSERT INTO `role_permission` VALUES ('0', '40', '42');
INSERT INTO `role_permission` VALUES ('0', '40', '43');
INSERT INTO `role_permission` VALUES ('0', '48', '1');
INSERT INTO `role_permission` VALUES ('0', '48', '42');
INSERT INTO `role_permission` VALUES ('0', '48', '43');
INSERT INTO `role_permission` VALUES ('0', '53', '1');
INSERT INTO `role_permission` VALUES ('0', '53', '42');
INSERT INTO `role_permission` VALUES ('0', '53', '43');
INSERT INTO `role_permission` VALUES ('0', '55', '1');
INSERT INTO `role_permission` VALUES ('0', '55', '42');
INSERT INTO `role_permission` VALUES ('0', '55', '43');
INSERT INTO `role_permission` VALUES ('0', '71', '1');
INSERT INTO `role_permission` VALUES ('0', '71', '42');
INSERT INTO `role_permission` VALUES ('0', '71', '43');
INSERT INTO `role_permission` VALUES ('0', '74', '1');
INSERT INTO `role_permission` VALUES ('0', '74', '42');
INSERT INTO `role_permission` VALUES ('0', '74', '43');
INSERT INTO `role_permission` VALUES ('0', '78', '1');
INSERT INTO `role_permission` VALUES ('0', '78', '42');
INSERT INTO `role_permission` VALUES ('0', '78', '43');
INSERT INTO `role_permission` VALUES ('0', '82', '1');
INSERT INTO `role_permission` VALUES ('0', '82', '42');
INSERT INTO `role_permission` VALUES ('0', '82', '43');
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('1', '1', '42');
INSERT INTO `role_permission` VALUES ('1', '1', '43');
INSERT INTO `role_permission` VALUES ('1', '2', '1');
INSERT INTO `role_permission` VALUES ('1', '2', '42');
INSERT INTO `role_permission` VALUES ('1', '2', '43');
INSERT INTO `role_permission` VALUES ('1', '3', '1');
INSERT INTO `role_permission` VALUES ('1', '3', '42');
INSERT INTO `role_permission` VALUES ('1', '3', '43');
INSERT INTO `role_permission` VALUES ('1', '4', '1');
INSERT INTO `role_permission` VALUES ('1', '4', '42');
INSERT INTO `role_permission` VALUES ('1', '4', '43');
INSERT INTO `role_permission` VALUES ('1', '5', '1');
INSERT INTO `role_permission` VALUES ('1', '5', '42');
INSERT INTO `role_permission` VALUES ('1', '5', '43');
INSERT INTO `role_permission` VALUES ('1', '6', '1');
INSERT INTO `role_permission` VALUES ('1', '6', '42');
INSERT INTO `role_permission` VALUES ('1', '6', '43');
INSERT INTO `role_permission` VALUES ('1', '7', '1');
INSERT INTO `role_permission` VALUES ('1', '7', '42');
INSERT INTO `role_permission` VALUES ('1', '7', '43');
INSERT INTO `role_permission` VALUES ('1', '8', '1');
INSERT INTO `role_permission` VALUES ('1', '8', '42');
INSERT INTO `role_permission` VALUES ('1', '8', '43');
INSERT INTO `role_permission` VALUES ('1', '9', '1');
INSERT INTO `role_permission` VALUES ('1', '9', '42');
INSERT INTO `role_permission` VALUES ('1', '9', '43');
INSERT INTO `role_permission` VALUES ('1', '10', '1');
INSERT INTO `role_permission` VALUES ('1', '10', '42');
INSERT INTO `role_permission` VALUES ('1', '10', '43');
INSERT INTO `role_permission` VALUES ('1', '11', '1');
INSERT INTO `role_permission` VALUES ('1', '11', '42');
INSERT INTO `role_permission` VALUES ('1', '11', '43');
INSERT INTO `role_permission` VALUES ('1', '12', '1');
INSERT INTO `role_permission` VALUES ('1', '12', '42');
INSERT INTO `role_permission` VALUES ('1', '12', '43');
INSERT INTO `role_permission` VALUES ('1', '13', '1');
INSERT INTO `role_permission` VALUES ('1', '13', '42');
INSERT INTO `role_permission` VALUES ('1', '13', '43');
INSERT INTO `role_permission` VALUES ('1', '14', '1');
INSERT INTO `role_permission` VALUES ('1', '14', '42');
INSERT INTO `role_permission` VALUES ('1', '14', '43');
INSERT INTO `role_permission` VALUES ('1', '15', '1');
INSERT INTO `role_permission` VALUES ('1', '15', '42');
INSERT INTO `role_permission` VALUES ('1', '15', '43');
INSERT INTO `role_permission` VALUES ('1', '16', '1');
INSERT INTO `role_permission` VALUES ('1', '16', '42');
INSERT INTO `role_permission` VALUES ('1', '16', '43');
INSERT INTO `role_permission` VALUES ('1', '19', '1');
INSERT INTO `role_permission` VALUES ('1', '19', '42');
INSERT INTO `role_permission` VALUES ('1', '19', '43');
INSERT INTO `role_permission` VALUES ('1', '20', '1');
INSERT INTO `role_permission` VALUES ('1', '20', '42');
INSERT INTO `role_permission` VALUES ('1', '20', '43');
INSERT INTO `role_permission` VALUES ('1', '21', '1');
INSERT INTO `role_permission` VALUES ('1', '21', '42');
INSERT INTO `role_permission` VALUES ('1', '21', '43');
INSERT INTO `role_permission` VALUES ('1', '22', '1');
INSERT INTO `role_permission` VALUES ('1', '22', '42');
INSERT INTO `role_permission` VALUES ('1', '22', '43');
INSERT INTO `role_permission` VALUES ('1', '23', '1');
INSERT INTO `role_permission` VALUES ('1', '23', '42');
INSERT INTO `role_permission` VALUES ('1', '23', '43');
INSERT INTO `role_permission` VALUES ('1', '24', '1');
INSERT INTO `role_permission` VALUES ('1', '24', '42');
INSERT INTO `role_permission` VALUES ('1', '24', '43');
INSERT INTO `role_permission` VALUES ('1', '25', '1');
INSERT INTO `role_permission` VALUES ('1', '25', '42');
INSERT INTO `role_permission` VALUES ('1', '25', '43');
INSERT INTO `role_permission` VALUES ('1', '26', '1');
INSERT INTO `role_permission` VALUES ('1', '26', '42');
INSERT INTO `role_permission` VALUES ('1', '26', '43');
INSERT INTO `role_permission` VALUES ('1', '27', '1');
INSERT INTO `role_permission` VALUES ('1', '27', '42');
INSERT INTO `role_permission` VALUES ('1', '27', '43');
INSERT INTO `role_permission` VALUES ('1', '28', '1');
INSERT INTO `role_permission` VALUES ('1', '28', '42');
INSERT INTO `role_permission` VALUES ('1', '28', '43');
INSERT INTO `role_permission` VALUES ('1', '29', '1');
INSERT INTO `role_permission` VALUES ('1', '29', '42');
INSERT INTO `role_permission` VALUES ('1', '29', '43');
INSERT INTO `role_permission` VALUES ('1', '30', '1');
INSERT INTO `role_permission` VALUES ('1', '30', '42');
INSERT INTO `role_permission` VALUES ('1', '30', '43');
INSERT INTO `role_permission` VALUES ('1', '31', '1');
INSERT INTO `role_permission` VALUES ('1', '31', '42');
INSERT INTO `role_permission` VALUES ('1', '31', '43');
INSERT INTO `role_permission` VALUES ('1', '32', '1');
INSERT INTO `role_permission` VALUES ('1', '32', '42');
INSERT INTO `role_permission` VALUES ('1', '32', '43');
INSERT INTO `role_permission` VALUES ('1', '33', '1');
INSERT INTO `role_permission` VALUES ('1', '33', '42');
INSERT INTO `role_permission` VALUES ('1', '33', '43');
INSERT INTO `role_permission` VALUES ('1', '34', '1');
INSERT INTO `role_permission` VALUES ('1', '34', '42');
INSERT INTO `role_permission` VALUES ('1', '34', '43');
INSERT INTO `role_permission` VALUES ('1', '35', '1');
INSERT INTO `role_permission` VALUES ('1', '35', '42');
INSERT INTO `role_permission` VALUES ('1', '35', '43');
INSERT INTO `role_permission` VALUES ('1', '36', '1');
INSERT INTO `role_permission` VALUES ('1', '36', '42');
INSERT INTO `role_permission` VALUES ('1', '36', '43');
INSERT INTO `role_permission` VALUES ('1', '37', '1');
INSERT INTO `role_permission` VALUES ('1', '37', '42');
INSERT INTO `role_permission` VALUES ('1', '37', '43');
INSERT INTO `role_permission` VALUES ('1', '38', '1');
INSERT INTO `role_permission` VALUES ('1', '38', '42');
INSERT INTO `role_permission` VALUES ('1', '38', '43');
INSERT INTO `role_permission` VALUES ('1', '39', '1');
INSERT INTO `role_permission` VALUES ('1', '39', '42');
INSERT INTO `role_permission` VALUES ('1', '39', '43');
INSERT INTO `role_permission` VALUES ('1', '40', '1');
INSERT INTO `role_permission` VALUES ('1', '40', '42');
INSERT INTO `role_permission` VALUES ('1', '40', '43');
INSERT INTO `role_permission` VALUES ('1', '41', '1');
INSERT INTO `role_permission` VALUES ('1', '41', '42');
INSERT INTO `role_permission` VALUES ('1', '41', '43');
INSERT INTO `role_permission` VALUES ('1', '42', '1');
INSERT INTO `role_permission` VALUES ('1', '42', '42');
INSERT INTO `role_permission` VALUES ('1', '42', '43');
INSERT INTO `role_permission` VALUES ('1', '43', '1');
INSERT INTO `role_permission` VALUES ('1', '43', '42');
INSERT INTO `role_permission` VALUES ('1', '43', '43');
INSERT INTO `role_permission` VALUES ('1', '44', '1');
INSERT INTO `role_permission` VALUES ('1', '44', '42');
INSERT INTO `role_permission` VALUES ('1', '44', '43');
INSERT INTO `role_permission` VALUES ('1', '45', '1');
INSERT INTO `role_permission` VALUES ('1', '45', '42');
INSERT INTO `role_permission` VALUES ('1', '45', '43');
INSERT INTO `role_permission` VALUES ('1', '46', '1');
INSERT INTO `role_permission` VALUES ('1', '46', '42');
INSERT INTO `role_permission` VALUES ('1', '46', '43');
INSERT INTO `role_permission` VALUES ('1', '47', '1');
INSERT INTO `role_permission` VALUES ('1', '47', '42');
INSERT INTO `role_permission` VALUES ('1', '47', '43');
INSERT INTO `role_permission` VALUES ('1', '48', '1');
INSERT INTO `role_permission` VALUES ('1', '48', '42');
INSERT INTO `role_permission` VALUES ('1', '48', '43');
INSERT INTO `role_permission` VALUES ('1', '49', '1');
INSERT INTO `role_permission` VALUES ('1', '49', '42');
INSERT INTO `role_permission` VALUES ('1', '49', '43');
INSERT INTO `role_permission` VALUES ('1', '50', '1');
INSERT INTO `role_permission` VALUES ('1', '50', '42');
INSERT INTO `role_permission` VALUES ('1', '50', '43');
INSERT INTO `role_permission` VALUES ('1', '51', '1');
INSERT INTO `role_permission` VALUES ('1', '51', '42');
INSERT INTO `role_permission` VALUES ('1', '51', '43');
INSERT INTO `role_permission` VALUES ('1', '52', '1');
INSERT INTO `role_permission` VALUES ('1', '52', '42');
INSERT INTO `role_permission` VALUES ('1', '52', '43');
INSERT INTO `role_permission` VALUES ('1', '53', '1');
INSERT INTO `role_permission` VALUES ('1', '53', '42');
INSERT INTO `role_permission` VALUES ('1', '53', '43');
INSERT INTO `role_permission` VALUES ('1', '54', '1');
INSERT INTO `role_permission` VALUES ('1', '54', '42');
INSERT INTO `role_permission` VALUES ('1', '54', '43');
INSERT INTO `role_permission` VALUES ('1', '55', '1');
INSERT INTO `role_permission` VALUES ('1', '55', '42');
INSERT INTO `role_permission` VALUES ('1', '55', '43');
INSERT INTO `role_permission` VALUES ('1', '56', '1');
INSERT INTO `role_permission` VALUES ('1', '56', '42');
INSERT INTO `role_permission` VALUES ('1', '56', '43');
INSERT INTO `role_permission` VALUES ('1', '57', '1');
INSERT INTO `role_permission` VALUES ('1', '57', '42');
INSERT INTO `role_permission` VALUES ('1', '57', '43');
INSERT INTO `role_permission` VALUES ('1', '58', '1');
INSERT INTO `role_permission` VALUES ('1', '58', '42');
INSERT INTO `role_permission` VALUES ('1', '58', '43');
INSERT INTO `role_permission` VALUES ('1', '59', '1');
INSERT INTO `role_permission` VALUES ('1', '59', '42');
INSERT INTO `role_permission` VALUES ('1', '59', '43');
INSERT INTO `role_permission` VALUES ('1', '60', '1');
INSERT INTO `role_permission` VALUES ('1', '60', '42');
INSERT INTO `role_permission` VALUES ('1', '60', '43');
INSERT INTO `role_permission` VALUES ('1', '61', '1');
INSERT INTO `role_permission` VALUES ('1', '61', '42');
INSERT INTO `role_permission` VALUES ('1', '61', '43');
INSERT INTO `role_permission` VALUES ('1', '62', '1');
INSERT INTO `role_permission` VALUES ('1', '62', '42');
INSERT INTO `role_permission` VALUES ('1', '62', '43');
INSERT INTO `role_permission` VALUES ('1', '63', '1');
INSERT INTO `role_permission` VALUES ('1', '63', '42');
INSERT INTO `role_permission` VALUES ('1', '63', '43');
INSERT INTO `role_permission` VALUES ('1', '64', '1');
INSERT INTO `role_permission` VALUES ('1', '64', '42');
INSERT INTO `role_permission` VALUES ('1', '64', '43');
INSERT INTO `role_permission` VALUES ('1', '65', '1');
INSERT INTO `role_permission` VALUES ('1', '65', '42');
INSERT INTO `role_permission` VALUES ('1', '65', '43');
INSERT INTO `role_permission` VALUES ('1', '66', '1');
INSERT INTO `role_permission` VALUES ('1', '66', '42');
INSERT INTO `role_permission` VALUES ('1', '66', '43');
INSERT INTO `role_permission` VALUES ('1', '67', '1');
INSERT INTO `role_permission` VALUES ('1', '67', '42');
INSERT INTO `role_permission` VALUES ('1', '67', '43');
INSERT INTO `role_permission` VALUES ('1', '68', '1');
INSERT INTO `role_permission` VALUES ('1', '68', '42');
INSERT INTO `role_permission` VALUES ('1', '68', '43');
INSERT INTO `role_permission` VALUES ('1', '69', '1');
INSERT INTO `role_permission` VALUES ('1', '69', '42');
INSERT INTO `role_permission` VALUES ('1', '69', '43');
INSERT INTO `role_permission` VALUES ('1', '70', '1');
INSERT INTO `role_permission` VALUES ('1', '70', '42');
INSERT INTO `role_permission` VALUES ('1', '70', '43');
INSERT INTO `role_permission` VALUES ('1', '71', '1');
INSERT INTO `role_permission` VALUES ('1', '71', '42');
INSERT INTO `role_permission` VALUES ('1', '71', '43');
INSERT INTO `role_permission` VALUES ('1', '72', '1');
INSERT INTO `role_permission` VALUES ('1', '72', '42');
INSERT INTO `role_permission` VALUES ('1', '72', '43');
INSERT INTO `role_permission` VALUES ('1', '73', '1');
INSERT INTO `role_permission` VALUES ('1', '73', '42');
INSERT INTO `role_permission` VALUES ('1', '73', '43');
INSERT INTO `role_permission` VALUES ('1', '74', '1');
INSERT INTO `role_permission` VALUES ('1', '74', '42');
INSERT INTO `role_permission` VALUES ('1', '74', '43');
INSERT INTO `role_permission` VALUES ('1', '75', '1');
INSERT INTO `role_permission` VALUES ('1', '75', '42');
INSERT INTO `role_permission` VALUES ('1', '75', '43');
INSERT INTO `role_permission` VALUES ('1', '76', '1');
INSERT INTO `role_permission` VALUES ('1', '76', '42');
INSERT INTO `role_permission` VALUES ('1', '76', '43');
INSERT INTO `role_permission` VALUES ('1', '77', '1');
INSERT INTO `role_permission` VALUES ('1', '77', '42');
INSERT INTO `role_permission` VALUES ('1', '77', '43');
INSERT INTO `role_permission` VALUES ('1', '78', '1');
INSERT INTO `role_permission` VALUES ('1', '78', '42');
INSERT INTO `role_permission` VALUES ('1', '78', '43');
INSERT INTO `role_permission` VALUES ('1', '79', '1');
INSERT INTO `role_permission` VALUES ('1', '79', '42');
INSERT INTO `role_permission` VALUES ('1', '79', '43');
INSERT INTO `role_permission` VALUES ('1', '80', '1');
INSERT INTO `role_permission` VALUES ('1', '80', '42');
INSERT INTO `role_permission` VALUES ('1', '80', '43');
INSERT INTO `role_permission` VALUES ('1', '82', '1');
INSERT INTO `role_permission` VALUES ('1', '82', '42');
INSERT INTO `role_permission` VALUES ('1', '82', '43');
INSERT INTO `role_permission` VALUES ('1', '83', '1');
INSERT INTO `role_permission` VALUES ('1', '83', '42');
INSERT INTO `role_permission` VALUES ('1', '83', '43');
INSERT INTO `role_permission` VALUES ('2', '3', '1');
INSERT INTO `role_permission` VALUES ('2', '3', '42');
INSERT INTO `role_permission` VALUES ('2', '3', '43');
INSERT INTO `role_permission` VALUES ('2', '4', '1');
INSERT INTO `role_permission` VALUES ('2', '4', '42');
INSERT INTO `role_permission` VALUES ('2', '4', '43');
INSERT INTO `role_permission` VALUES ('2', '5', '1');
INSERT INTO `role_permission` VALUES ('2', '5', '42');
INSERT INTO `role_permission` VALUES ('2', '5', '43');
INSERT INTO `role_permission` VALUES ('2', '6', '1');
INSERT INTO `role_permission` VALUES ('2', '6', '42');
INSERT INTO `role_permission` VALUES ('2', '6', '43');
INSERT INTO `role_permission` VALUES ('2', '7', '1');
INSERT INTO `role_permission` VALUES ('2', '7', '42');
INSERT INTO `role_permission` VALUES ('2', '7', '43');
INSERT INTO `role_permission` VALUES ('2', '8', '1');
INSERT INTO `role_permission` VALUES ('2', '8', '42');
INSERT INTO `role_permission` VALUES ('2', '8', '43');
INSERT INTO `role_permission` VALUES ('2', '9', '1');
INSERT INTO `role_permission` VALUES ('2', '9', '42');
INSERT INTO `role_permission` VALUES ('2', '9', '43');
INSERT INTO `role_permission` VALUES ('2', '12', '1');
INSERT INTO `role_permission` VALUES ('2', '12', '42');
INSERT INTO `role_permission` VALUES ('2', '12', '43');
INSERT INTO `role_permission` VALUES ('2', '19', '1');
INSERT INTO `role_permission` VALUES ('2', '19', '42');
INSERT INTO `role_permission` VALUES ('2', '19', '43');
INSERT INTO `role_permission` VALUES ('2', '22', '1');
INSERT INTO `role_permission` VALUES ('2', '22', '42');
INSERT INTO `role_permission` VALUES ('2', '22', '43');
INSERT INTO `role_permission` VALUES ('2', '23', '1');
INSERT INTO `role_permission` VALUES ('2', '23', '42');
INSERT INTO `role_permission` VALUES ('2', '23', '43');
INSERT INTO `role_permission` VALUES ('2', '24', '1');
INSERT INTO `role_permission` VALUES ('2', '24', '42');
INSERT INTO `role_permission` VALUES ('2', '24', '43');
INSERT INTO `role_permission` VALUES ('2', '25', '1');
INSERT INTO `role_permission` VALUES ('2', '25', '42');
INSERT INTO `role_permission` VALUES ('2', '25', '43');
INSERT INTO `role_permission` VALUES ('2', '26', '1');
INSERT INTO `role_permission` VALUES ('2', '27', '42');
INSERT INTO `role_permission` VALUES ('2', '27', '43');
INSERT INTO `role_permission` VALUES ('2', '28', '1');
INSERT INTO `role_permission` VALUES ('2', '28', '42');
INSERT INTO `role_permission` VALUES ('2', '28', '43');
INSERT INTO `role_permission` VALUES ('2', '29', '1');
INSERT INTO `role_permission` VALUES ('2', '29', '43');
INSERT INTO `role_permission` VALUES ('2', '30', '1');
INSERT INTO `role_permission` VALUES ('2', '30', '42');
INSERT INTO `role_permission` VALUES ('2', '30', '43');
INSERT INTO `role_permission` VALUES ('2', '38', '1');
INSERT INTO `role_permission` VALUES ('2', '38', '42');
INSERT INTO `role_permission` VALUES ('2', '38', '43');
INSERT INTO `role_permission` VALUES ('2', '47', '1');
INSERT INTO `role_permission` VALUES ('2', '47', '42');
INSERT INTO `role_permission` VALUES ('2', '47', '43');
INSERT INTO `role_permission` VALUES ('2', '48', '1');
INSERT INTO `role_permission` VALUES ('2', '48', '42');
INSERT INTO `role_permission` VALUES ('2', '48', '43');
INSERT INTO `role_permission` VALUES ('2', '49', '1');
INSERT INTO `role_permission` VALUES ('2', '49', '42');
INSERT INTO `role_permission` VALUES ('2', '49', '43');
INSERT INTO `role_permission` VALUES ('2', '53', '1');
INSERT INTO `role_permission` VALUES ('2', '53', '42');
INSERT INTO `role_permission` VALUES ('2', '53', '43');
INSERT INTO `role_permission` VALUES ('2', '55', '1');
INSERT INTO `role_permission` VALUES ('2', '55', '42');
INSERT INTO `role_permission` VALUES ('2', '55', '43');
INSERT INTO `role_permission` VALUES ('2', '59', '1');
INSERT INTO `role_permission` VALUES ('2', '59', '42');
INSERT INTO `role_permission` VALUES ('2', '59', '43');
INSERT INTO `role_permission` VALUES ('2', '60', '1');
INSERT INTO `role_permission` VALUES ('2', '60', '42');
INSERT INTO `role_permission` VALUES ('2', '60', '43');
INSERT INTO `role_permission` VALUES ('2', '70', '1');
INSERT INTO `role_permission` VALUES ('2', '70', '42');
INSERT INTO `role_permission` VALUES ('2', '70', '43');
INSERT INTO `role_permission` VALUES ('2', '71', '42');
INSERT INTO `role_permission` VALUES ('2', '71', '43');
INSERT INTO `role_permission` VALUES ('2', '72', '1');
INSERT INTO `role_permission` VALUES ('2', '72', '42');
INSERT INTO `role_permission` VALUES ('2', '72', '43');
INSERT INTO `role_permission` VALUES ('2', '73', '1');
INSERT INTO `role_permission` VALUES ('2', '73', '42');
INSERT INTO `role_permission` VALUES ('2', '73', '43');
INSERT INTO `role_permission` VALUES ('2', '74', '42');
INSERT INTO `role_permission` VALUES ('2', '74', '43');
INSERT INTO `role_permission` VALUES ('2', '75', '1');
INSERT INTO `role_permission` VALUES ('2', '75', '42');
INSERT INTO `role_permission` VALUES ('2', '75', '43');
INSERT INTO `role_permission` VALUES ('2', '77', '1');
INSERT INTO `role_permission` VALUES ('2', '77', '42');
INSERT INTO `role_permission` VALUES ('2', '77', '43');
INSERT INTO `role_permission` VALUES ('2', '78', '1');
INSERT INTO `role_permission` VALUES ('2', '78', '42');
INSERT INTO `role_permission` VALUES ('2', '78', '43');
INSERT INTO `role_permission` VALUES ('2', '82', '1');
INSERT INTO `role_permission` VALUES ('2', '82', '42');
INSERT INTO `role_permission` VALUES ('2', '82', '43');
INSERT INTO `role_permission` VALUES ('3', '3', '1');
INSERT INTO `role_permission` VALUES ('3', '3', '42');
INSERT INTO `role_permission` VALUES ('3', '3', '43');
INSERT INTO `role_permission` VALUES ('3', '4', '1');
INSERT INTO `role_permission` VALUES ('3', '4', '42');
INSERT INTO `role_permission` VALUES ('3', '4', '43');
INSERT INTO `role_permission` VALUES ('3', '5', '1');
INSERT INTO `role_permission` VALUES ('3', '5', '42');
INSERT INTO `role_permission` VALUES ('3', '5', '43');
INSERT INTO `role_permission` VALUES ('3', '6', '1');
INSERT INTO `role_permission` VALUES ('3', '6', '42');
INSERT INTO `role_permission` VALUES ('3', '6', '43');
INSERT INTO `role_permission` VALUES ('3', '7', '1');
INSERT INTO `role_permission` VALUES ('3', '7', '42');
INSERT INTO `role_permission` VALUES ('3', '7', '43');
INSERT INTO `role_permission` VALUES ('3', '8', '1');
INSERT INTO `role_permission` VALUES ('3', '8', '42');
INSERT INTO `role_permission` VALUES ('3', '8', '43');
INSERT INTO `role_permission` VALUES ('3', '12', '1');
INSERT INTO `role_permission` VALUES ('3', '12', '42');
INSERT INTO `role_permission` VALUES ('3', '12', '43');
INSERT INTO `role_permission` VALUES ('3', '19', '1');
INSERT INTO `role_permission` VALUES ('3', '19', '42');
INSERT INTO `role_permission` VALUES ('3', '19', '43');
INSERT INTO `role_permission` VALUES ('3', '22', '1');
INSERT INTO `role_permission` VALUES ('3', '22', '42');
INSERT INTO `role_permission` VALUES ('3', '22', '43');
INSERT INTO `role_permission` VALUES ('3', '23', '1');
INSERT INTO `role_permission` VALUES ('3', '23', '42');
INSERT INTO `role_permission` VALUES ('3', '23', '43');
INSERT INTO `role_permission` VALUES ('3', '24', '1');
INSERT INTO `role_permission` VALUES ('3', '24', '42');
INSERT INTO `role_permission` VALUES ('3', '24', '43');
INSERT INTO `role_permission` VALUES ('3', '25', '1');
INSERT INTO `role_permission` VALUES ('3', '25', '42');
INSERT INTO `role_permission` VALUES ('3', '25', '43');
INSERT INTO `role_permission` VALUES ('3', '26', '1');
INSERT INTO `role_permission` VALUES ('3', '27', '1');
INSERT INTO `role_permission` VALUES ('3', '27', '42');
INSERT INTO `role_permission` VALUES ('3', '27', '43');
INSERT INTO `role_permission` VALUES ('3', '28', '1');
INSERT INTO `role_permission` VALUES ('3', '28', '42');
INSERT INTO `role_permission` VALUES ('3', '28', '43');
INSERT INTO `role_permission` VALUES ('3', '29', '1');
INSERT INTO `role_permission` VALUES ('3', '29', '42');
INSERT INTO `role_permission` VALUES ('3', '29', '43');
INSERT INTO `role_permission` VALUES ('3', '30', '1');
INSERT INTO `role_permission` VALUES ('3', '30', '42');
INSERT INTO `role_permission` VALUES ('3', '30', '43');
INSERT INTO `role_permission` VALUES ('3', '38', '1');
INSERT INTO `role_permission` VALUES ('3', '38', '42');
INSERT INTO `role_permission` VALUES ('3', '38', '43');
INSERT INTO `role_permission` VALUES ('3', '47', '1');
INSERT INTO `role_permission` VALUES ('3', '47', '42');
INSERT INTO `role_permission` VALUES ('3', '47', '43');
INSERT INTO `role_permission` VALUES ('3', '48', '1');
INSERT INTO `role_permission` VALUES ('3', '48', '42');
INSERT INTO `role_permission` VALUES ('3', '48', '43');
INSERT INTO `role_permission` VALUES ('3', '49', '1');
INSERT INTO `role_permission` VALUES ('3', '49', '42');
INSERT INTO `role_permission` VALUES ('3', '49', '43');
INSERT INTO `role_permission` VALUES ('3', '53', '1');
INSERT INTO `role_permission` VALUES ('3', '53', '42');
INSERT INTO `role_permission` VALUES ('3', '53', '43');
INSERT INTO `role_permission` VALUES ('3', '55', '1');
INSERT INTO `role_permission` VALUES ('3', '55', '42');
INSERT INTO `role_permission` VALUES ('3', '55', '43');
INSERT INTO `role_permission` VALUES ('3', '59', '1');
INSERT INTO `role_permission` VALUES ('3', '59', '42');
INSERT INTO `role_permission` VALUES ('3', '59', '43');
INSERT INTO `role_permission` VALUES ('3', '71', '1');
INSERT INTO `role_permission` VALUES ('3', '71', '42');
INSERT INTO `role_permission` VALUES ('3', '71', '43');
INSERT INTO `role_permission` VALUES ('3', '74', '1');
INSERT INTO `role_permission` VALUES ('3', '74', '42');
INSERT INTO `role_permission` VALUES ('3', '74', '43');
INSERT INTO `role_permission` VALUES ('3', '77', '1');
INSERT INTO `role_permission` VALUES ('3', '77', '42');
INSERT INTO `role_permission` VALUES ('3', '77', '43');
INSERT INTO `role_permission` VALUES ('3', '78', '1');
INSERT INTO `role_permission` VALUES ('3', '78', '42');
INSERT INTO `role_permission` VALUES ('3', '78', '43');
INSERT INTO `role_permission` VALUES ('3', '82', '1');
INSERT INTO `role_permission` VALUES ('3', '82', '42');
INSERT INTO `role_permission` VALUES ('3', '82', '43');
INSERT INTO `role_permission` VALUES ('4', '3', '1');
INSERT INTO `role_permission` VALUES ('4', '3', '42');
INSERT INTO `role_permission` VALUES ('4', '3', '43');
INSERT INTO `role_permission` VALUES ('4', '4', '1');
INSERT INTO `role_permission` VALUES ('4', '4', '42');
INSERT INTO `role_permission` VALUES ('4', '4', '43');
INSERT INTO `role_permission` VALUES ('4', '5', '1');
INSERT INTO `role_permission` VALUES ('4', '5', '42');
INSERT INTO `role_permission` VALUES ('4', '5', '43');
INSERT INTO `role_permission` VALUES ('4', '12', '1');
INSERT INTO `role_permission` VALUES ('4', '12', '42');
INSERT INTO `role_permission` VALUES ('4', '12', '43');
INSERT INTO `role_permission` VALUES ('4', '20', '1');
INSERT INTO `role_permission` VALUES ('4', '20', '42');
INSERT INTO `role_permission` VALUES ('4', '20', '43');
INSERT INTO `role_permission` VALUES ('4', '21', '1');
INSERT INTO `role_permission` VALUES ('4', '21', '42');
INSERT INTO `role_permission` VALUES ('4', '21', '43');
INSERT INTO `role_permission` VALUES ('4', '22', '1');
INSERT INTO `role_permission` VALUES ('4', '22', '42');
INSERT INTO `role_permission` VALUES ('4', '22', '43');
INSERT INTO `role_permission` VALUES ('4', '23', '1');
INSERT INTO `role_permission` VALUES ('4', '23', '42');
INSERT INTO `role_permission` VALUES ('4', '23', '43');
INSERT INTO `role_permission` VALUES ('4', '24', '1');
INSERT INTO `role_permission` VALUES ('4', '24', '42');
INSERT INTO `role_permission` VALUES ('4', '24', '43');
INSERT INTO `role_permission` VALUES ('4', '25', '43');
INSERT INTO `role_permission` VALUES ('4', '26', '1');
INSERT INTO `role_permission` VALUES ('4', '26', '42');
INSERT INTO `role_permission` VALUES ('4', '26', '43');
INSERT INTO `role_permission` VALUES ('4', '27', '1');
INSERT INTO `role_permission` VALUES ('4', '27', '42');
INSERT INTO `role_permission` VALUES ('4', '27', '43');
INSERT INTO `role_permission` VALUES ('4', '28', '1');
INSERT INTO `role_permission` VALUES ('4', '28', '42');
INSERT INTO `role_permission` VALUES ('4', '28', '43');
INSERT INTO `role_permission` VALUES ('4', '29', '1');
INSERT INTO `role_permission` VALUES ('4', '29', '42');
INSERT INTO `role_permission` VALUES ('4', '29', '43');
INSERT INTO `role_permission` VALUES ('4', '30', '1');
INSERT INTO `role_permission` VALUES ('4', '30', '42');
INSERT INTO `role_permission` VALUES ('4', '30', '43');
INSERT INTO `role_permission` VALUES ('4', '38', '1');
INSERT INTO `role_permission` VALUES ('4', '38', '42');
INSERT INTO `role_permission` VALUES ('4', '38', '43');
INSERT INTO `role_permission` VALUES ('4', '48', '1');
INSERT INTO `role_permission` VALUES ('4', '48', '42');
INSERT INTO `role_permission` VALUES ('4', '48', '43');
INSERT INTO `role_permission` VALUES ('4', '53', '1');
INSERT INTO `role_permission` VALUES ('4', '53', '42');
INSERT INTO `role_permission` VALUES ('4', '53', '43');
INSERT INTO `role_permission` VALUES ('4', '54', '1');
INSERT INTO `role_permission` VALUES ('4', '54', '42');
INSERT INTO `role_permission` VALUES ('4', '54', '43');
INSERT INTO `role_permission` VALUES ('4', '55', '1');
INSERT INTO `role_permission` VALUES ('4', '55', '42');
INSERT INTO `role_permission` VALUES ('4', '55', '43');
INSERT INTO `role_permission` VALUES ('4', '59', '1');
INSERT INTO `role_permission` VALUES ('4', '59', '42');
INSERT INTO `role_permission` VALUES ('4', '59', '43');
INSERT INTO `role_permission` VALUES ('4', '71', '1');
INSERT INTO `role_permission` VALUES ('4', '71', '42');
INSERT INTO `role_permission` VALUES ('4', '71', '43');
INSERT INTO `role_permission` VALUES ('4', '74', '1');
INSERT INTO `role_permission` VALUES ('4', '74', '42');
INSERT INTO `role_permission` VALUES ('4', '74', '43');
INSERT INTO `role_permission` VALUES ('4', '78', '1');
INSERT INTO `role_permission` VALUES ('4', '78', '42');
INSERT INTO `role_permission` VALUES ('4', '78', '43');
INSERT INTO `role_permission` VALUES ('4', '82', '1');
INSERT INTO `role_permission` VALUES ('4', '82', '42');
INSERT INTO `role_permission` VALUES ('4', '82', '43');

-- ----------------------------
-- Table structure for `sprint`
-- ----------------------------
DROP TABLE IF EXISTS `sprint`;
CREATE TABLE `sprint` (
  `spid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  `start_date_es` date NOT NULL,
  `end_date_es` date NOT NULL,
  PRIMARY KEY (`spid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sprint
-- ----------------------------
INSERT INTO `sprint` VALUES ('1', '1', 'Sprint 1', '', '2014-07-01', null, '2', '0', '2014-07-01', '2014-07-14');
INSERT INTO `sprint` VALUES ('2', '43', 'Sprint 1', '', null, null, '1', '0', '2014-08-04', '2014-09-04');
INSERT INTO `sprint` VALUES ('3', '1', 'Sprint 2', '', null, null, '1', '0', '2014-08-15', '2014-08-31');
INSERT INTO `sprint` VALUES ('4', '42', 'Sprint 1', '', '2014-08-06', '2014-08-06', '2', '0', '2014-08-06', '2014-08-18');

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
INSERT INTO `sprint_team` VALUES ('1', '17', '37');
INSERT INTO `sprint_team` VALUES ('1', '18', '35');
INSERT INTO `sprint_team` VALUES ('1', '45', '35');
INSERT INTO `sprint_team` VALUES ('2', '46', '30');
INSERT INTO `sprint_team` VALUES ('3', '17', '39');
INSERT INTO `sprint_team` VALUES ('3', '18', '39');
INSERT INTO `sprint_team` VALUES ('3', '45', '36');
INSERT INTO `sprint_team` VALUES ('4', '47', '10');
INSERT INTO `sprint_team` VALUES ('4', '48', '0');
INSERT INTO `sprint_team` VALUES ('8', '17', '15');
INSERT INTO `sprint_team` VALUES ('8', '18', '20');
INSERT INTO `sprint_team` VALUES ('8', '45', '10');
INSERT INTO `sprint_team` VALUES ('9', '17', '10');
INSERT INTO `sprint_team` VALUES ('9', '18', '10');
INSERT INTO `sprint_team` VALUES ('9', '45', '2');
INSERT INTO `sprint_team` VALUES ('23', '17', '0');
INSERT INTO `sprint_team` VALUES ('23', '18', '0');
INSERT INTO `sprint_team` VALUES ('23', '45', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of story
-- ----------------------------
INSERT INTO `story` VALUES ('1', '1', '1', 'Quán lí danh sách món ăn', '3', '11', '30', 'Cach demo', 'Mo ta ve story', '2', '1', '2014-07-16 21:49:44', '2014-07-10 22:51:09');
INSERT INTO `story` VALUES ('10', '1', '1', 'Quản lí đặt bàn ăn', '1', '9', '80', 'Cach demo', 'Mo ta ve story', '8', '0', '2014-07-28 15:43:05', '2014-07-11 22:51:09');
INSERT INTO `story` VALUES ('11', '1', '1', 'Quản lí đơn hàng hóa', '1', '3', '20', 'Cach demo', 'Mo ta ve story', '2', '0', null, '2014-07-10 22:51:09');
INSERT INTO `story` VALUES ('12', '1', '1', 'Quản lí dụng cụ nhà bếp nấu ăn', '3', '3', '10', 'Cach demo', 'Mo ta ve story', '8', '0', '2014-07-09 15:25:20', '2014-07-10 22:51:09');
INSERT INTO `story` VALUES ('13', '1', '1', 'Thống kê bán hàng hàng tuần', '2', '12', '54', 'Cach demo', 'Mo ta ve story', '4', '0', null, '2014-07-10 22:51:09');
INSERT INTO `story` VALUES ('15', '2', '1', 'Quản lí phòng ban', '2', '4', '56', 'Cach demo', 'Mo ta ve story', '2', '0', null, '2014-06-30 22:51:09');
INSERT INTO `story` VALUES ('23', '1', '1', 'Quản lí khách hàng', '1', '7', '20', 'Cach demo', 'Mo ta ve story', '5', '0', null, '2014-08-15 22:51:09');
INSERT INTO `story` VALUES ('24', '1', '1', 'Tính năng report', '3', '0', '0', 'Cach demo', 'Mo ta ve story', '2', '0', null, '2014-07-10 22:51:09');
INSERT INTO `story` VALUES ('25', '1', '1', 'Tính năng report', '3', '10', '30', 'Cach demo', 'Mo ta ve story', '2', '1', null, '2014-07-10 22:51:09');
INSERT INTO `story` VALUES ('26', '1', '1', 'Nâng cấp tính năng report hàng tuần, hàng tháng', '1', '6', '20', 'Cach demo', 'Mo ta ve story', '8', '0', '2014-08-06 08:32:45', '2014-07-10 22:51:09');
INSERT INTO `story` VALUES ('27', '1', '1', 'Quản lí album ảnh', '2', '0', '0', 'Cach demo', 'Mo ta ve story', '2', '0', null, '2014-07-11 22:51:09');
INSERT INTO `story` VALUES ('28', '1', '1', 'Quản lí thực đơn', '2', '5', '30', 'Cach demo', 'Mo ta ve story', '4', '0', null, '2014-07-26 22:51:09');
INSERT INTO `story` VALUES ('29', '1', '1', 'Bổ sung quản lí món ăn', '2', '8', '30', 'Cach demo', 'Mo ta ve story', '8', '0', '2014-08-06 08:32:22', '2014-07-11 22:51:09');
INSERT INTO `story` VALUES ('30', '1', '1', 'Quản lí tiền bạc', '2', '2', '1', 'Cach demo', 'Mo ta ve story', '4', '0', null, '2014-07-13 22:51:09');
INSERT INTO `story` VALUES ('31', '1', '1', 'Quản li kho địa điểm', '3', '3', '10', 'Cach demo', 'Mo ta ve story', '8', '0', '2014-07-30 15:17:34', '2014-07-11 22:51:09');
INSERT INTO `story` VALUES ('33', '1', '1', 'Quản lí dụng cụ nấu ăn', '2', '10', '20', 'Cach demo', 'Mo ta ve story', '4', '0', null, '2014-07-11 22:51:09');
INSERT INTO `story` VALUES ('34', '1', '1', 'Quản lí đặt xe chở cô dâu', '2', '10', '50', 'Cach demo', 'Mo ta ve story', '7', '0', '2014-08-05 23:08:31', '2014-07-14 22:51:09');
INSERT INTO `story` VALUES ('35', '1', '1', 'Xuất file excel', '3', '2', '10', 'Cach demo', 'Mo ta ve story', '2', '1', null, '2014-07-11 22:51:09');
INSERT INTO `story` VALUES ('36', '43', '25', 'Quản lí học sinh', '3', '1', '60', 'demo ', 'mo ta', '8', '0', '2014-08-04 06:01:35', '2014-08-04 05:54:43');
INSERT INTO `story` VALUES ('37', '43', '25', 'Quản lí điểm', '2', '10', '40', 'a', 'a', '4', '0', null, '2014-08-13 05:57:29');
INSERT INTO `story` VALUES ('39', '42', '1', 'Chức năng đăng nhập', '2', '8', '30', 'a', 'a', '8', '0', '2014-08-06 06:09:28', '2014-08-06 05:54:24');

-- ----------------------------
-- Table structure for `story_team`
-- ----------------------------
DROP TABLE IF EXISTS `story_team`;
CREATE TABLE `story_team` (
  `sid` bigint(20) NOT NULL,
  `tid` int(11) NOT NULL,
  `spid` int(11) NOT NULL,
  `order` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of story_team
-- ----------------------------
INSERT INTO `story_team` VALUES ('29', '17', '1', '0');
INSERT INTO `story_team` VALUES ('26', '18', '1', '1');
INSERT INTO `story_team` VALUES ('10', '45', '1', '1');
INSERT INTO `story_team` VALUES ('12', '17', '1', '0');
INSERT INTO `story_team` VALUES ('31', '45', '1', '2');
INSERT INTO `story_team` VALUES ('23', '18', '1', '0');
INSERT INTO `story_team` VALUES ('36', '46', '2', '0');
INSERT INTO `story_team` VALUES ('37', '46', '2', '0');
INSERT INTO `story_team` VALUES ('34', '17', '3', '0');
INSERT INTO `story_team` VALUES ('28', '18', '3', '1');
INSERT INTO `story_team` VALUES ('30', '45', '3', '0');
INSERT INTO `story_team` VALUES ('39', '47', '4', '0');
INSERT INTO `story_team` VALUES ('33', '17', '3', '0');
INSERT INTO `story_team` VALUES ('13', '18', '3', '0');

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
  `finish_date` datetime DEFAULT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`taid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', 'Tạo mẫu nhập món ăn', '2', '0', '4', '2014-07-28 14:45:40', '1', '', '2', '29', '2014-08-06 08:32:19', '0', '3');
INSERT INTO `task` VALUES ('2', 'Xử lí thêm món ăn', '2', '0', '4', '2014-07-28 14:45:58', '1', '', '11', '29', '2014-07-08 15:48:49', '0', '4');
INSERT INTO `task` VALUES ('3', 'Cập nhật thông tin món ăn', '4', '0', '4', '2014-07-28 14:46:21', '1', '', '28', '29', '2014-08-06 08:32:22', '0', '1');
INSERT INTO `task` VALUES ('4', 'Xuất file Excel', '2', '0', '4', '2014-07-28 14:46:44', '1', '', '3', '26', '2014-07-28 15:48:49', '0', '1');
INSERT INTO `task` VALUES ('5', 'Xuất file CSV', '1', '0', '4', '2014-07-28 14:46:57', '1', '', '4', '26', '2014-07-14 15:48:49', '0', '3');
INSERT INTO `task` VALUES ('6', 'Tạo biểu đồ', '2.5', '0', '4', '2014-07-28 14:47:08', '1', '', '7', '26', '2014-07-17 15:48:49', '0', '4');
INSERT INTO `task` VALUES ('7', 'FORM danh sách đặt bàn', '2', '0', '4', '2014-07-28 14:47:48', '1', '', '27', '10', '2014-07-28 15:48:49', '0', '3');
INSERT INTO `task` VALUES ('8', 'Xử lí cập nhật danh sách đặt bàn', '4', '0', '4', '2014-07-28 14:48:11', '1', '', '29', '10', '2014-07-03 15:48:49', '0', '1');
INSERT INTO `task` VALUES ('9', 'Thông kê tình trạng đặt bàn', '3', '0', '4', '2014-07-28 14:48:32', '1', '', '27', '10', '2014-07-28 15:48:49', '0', '2');
INSERT INTO `task` VALUES ('10', 'Số lường dụng cụ cần mua', '1', '0', '4', '2014-07-28 14:48:53', '1', '', '11', '12', '2014-07-14 15:48:49', '0', '1');
INSERT INTO `task` VALUES ('11', 'FORM quản lí dụng cụ', '2', '0', '4', '2014-07-28 14:49:07', '1', '', '28', '12', '2014-07-17 15:48:49', '0', '2');
INSERT INTO `task` VALUES ('12', 'Địa điểm đặt tiệc', '2', '0', '4', '2014-07-28 14:50:23', '1', '', '13', '31', '2014-07-14 15:48:49', '0', '1');
INSERT INTO `task` VALUES ('13', 'Thống kê đặt tiệc tại 1 địa điểm', '1', '0', '4', '2014-07-28 14:50:54', '1', '', '27', '31', '2014-07-20 15:48:49', '0', '2');
INSERT INTO `task` VALUES ('14', 'Form quản lí', '3', '3', '1', '2014-07-28 15:32:57', '1', '', '5', '23', '2014-07-25 15:48:49', '0', '0');
INSERT INTO `task` VALUES ('15', 'Xử lí dữ liệu', '3', '0', '3', '2014-07-28 15:34:42', '1', '', '7', '23', '2014-07-23 15:48:49', '0', '1');
INSERT INTO `task` VALUES ('16', 'Xử lí dữ liệu', '3', '3', '1', '2014-07-28 15:34:58', '1', '', null, '23', '2014-07-28 15:48:49', '1', '0');
INSERT INTO `task` VALUES ('17', 'Thêm bảng khachang vao db', '1', '0', '4', '2014-07-28 15:35:28', '1', '', '6', '23', '2014-07-28 15:48:49', '0', '1');
INSERT INTO `task` VALUES ('18', 'Tạo giao diện nhập học sinh', '0.5', '0', '4', '2014-08-04 06:01:12', '25', '\r\n', '26', '36', '2014-08-04 06:01:35', '0', '1');
INSERT INTO `task` VALUES ('19', 'Tạo giao diện mockup', '0.5', '0', '4', '2014-08-05 23:00:21', '1', '', '11', '29', '2014-08-06 08:32:17', '0', '2');
INSERT INTO `task` VALUES ('20', 'Tạo UI', '2', '0', '3', '2014-08-05 23:07:00', '2', '', '28', '34', '2014-08-05 23:08:31', '0', '1');
INSERT INTO `task` VALUES ('21', 'Xử lí cập nhật', '3', '0', '3', '2014-08-05 23:09:41', '2', '', '2', '34', null, '0', '2');
INSERT INTO `task` VALUES ('22', 'Cập nhật db', '3', '0', '4', '2014-08-05 23:10:52', '2', '', '2', '34', '2014-08-05 23:11:11', '0', '1');
INSERT INTO `task` VALUES ('23', 'Tạo UI', '2', '0', '4', '2014-08-06 06:00:34', '1', '', '29', '39', '2014-08-06 06:09:28', '0', '1');
INSERT INTO `task` VALUES ('24', 'Tạo db', '2', '0', '4', '2014-08-06 06:00:50', '1', '', '37', '39', '2014-08-06 06:08:20', '0', '2');
INSERT INTO `task` VALUES ('25', 'Toa giao dien', '2', '0', '4', '2014-08-06 08:29:43', '1', '', '4', '26', '2014-08-06 08:32:45', '0', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('17', 'Team 1', '1', '', '0');
INSERT INTO `team` VALUES ('18', 'Team 2', '1', '', '0');
INSERT INTO `team` VALUES ('45', 'Team 3', '1', '', '0');
INSERT INTO `team` VALUES ('46', 'Team 1', '43', '', '0');
INSERT INTO `team` VALUES ('47', 'Team 1', '42', '', '0');
INSERT INTO `team` VALUES ('48', 'Team 2', '42', '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'anhhc', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Hoàng Chung Anh', '2014-07-25', 'avatar-meo-396882118.jpg', null, 'LanCGyB9uMBnOTsH7DtshCVHGcTzodKuDfn7XPreYVzVkBvHaPnXjblKmJvI', 'en', 'US', '0');
INSERT INTO `user` VALUES ('2', 'sangdx', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Đào Xuân Sáng', '1970-01-01', 'bao-762953481.jpg', '-8.0', 'kHF3QV9ghNzKcrJAyUtUfntKYziH1SEUSX8lGhWPOMQGQUo8MzNZbPXT5T2m', 'en', 'AF', '0');
INSERT INTO `user` VALUES ('3', 'thoadk', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Dương Thị Kim Thoa', '2014-05-08', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('4', 'cuhq', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Hoàng Quốc Cừ', '2014-05-08', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('5', 'hieunv', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn Văn Hiếu', '2014-05-08', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('6', 'thoalt', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Lục Thị Hoa', '2014-05-15', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('7', 'hoatbk', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Bùi Khắc Hoạt', '2014-05-09', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('8', 'huannv', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn Văn Huân', '2014-05-09', 'default-avatar.jpg', null, null, 'en', null, '0');
INSERT INTO `user` VALUES ('9', 'huydv', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Đoàn Văn Huy', '2014-05-09', 'default-avatar.jpg', null, null, 'en', null, '0');
INSERT INTO `user` VALUES ('11', 'hungnv', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn Việt Hùng', '2014-05-22', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('12', 'kienlt', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Lê Trung Kiên', '2014-05-15', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('13', 'anhld', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Lê Đức Anh', '2014-05-30', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('14', 'thuanpt', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Phùng Thị Thuận', '2014-05-23', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('15', 'anhch', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Chu Hoàng Anh', '2014-05-28', 'default-avatar.jpg', '-6.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('21', 'chinhnv', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn Văn Chinh', '2014-05-16', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('22', 'duongna', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn ánh Dương', '2014-05-14', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('23', 'dungnv', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn Văn Dụng', '2014-05-14', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('24', 'daidv', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Đỗ Văn Đại', '2014-06-12', 'default-avatar.jpg', '-10.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('25', 'hanhnt', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn Thị Phương Hạnh', '2014-06-18', 'default-avatar.jpg', '-11.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('26', 'hiepnt', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn Thiện Hiệp', '2014-06-06', 'default-avatar.jpg', '-10.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('27', 'hieuhv', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Hoàng Văn Hiệu', '2014-06-05', 'default-avatar.jpg', '-12.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('28', 'hoanbq', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Bùi Quang Huy Hoàng', '2014-07-16', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('29', 'huent', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn Thị Huệ', '2014-07-16', 'default-avatar.jpg', '-8.0', '66Oq2dQoh6M2NCYTvDp2HAZDm3Eeo0hgcnE9OXQZkSU1PwusPnZVihed1kwh', 'en', null, '0');
INSERT INTO `user` VALUES ('30', 'huynt', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nguyễn Trọng Huy', '2014-07-09', 'default-avatar.jpg', '-6.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('31', 'huyenltm', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Lê Thị Minh Huyền', '2014-07-10', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('32', 'huonglth', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Lã Thị Thu Hường', '2014-07-04', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('33', 'namld', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Lê Đình Nam', '2014-07-03', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('34', 'tuanpv', '$2y$10$DD9rMGw/HVOU4.j1pQKW8uyJqVvbSD74GET1e2ofJVqpbONRtzsLu', 'Phạm Văn Tuấn', '2014-08-26', 'default-avatar.jpg', '-9.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('35', 'namdv', '$2y$10$EHBzfiNVq6HX7oWj2n5oT.lLjDFryA83iHDRAHLc05spIuHArb8Qi', 'Đàm Văn Nam', '2014-03-21', 'default-avatar.jpg', null, null, 'en', null, '0');
INSERT INTO `user` VALUES ('36', 'chuonglv', '$2y$10$Awk2pto7MSKlT0CZz.M4T.E4gjCn4JklJniawr1Ka1K8u0ISRXt4C', 'Lê Văn Chương', '2014-08-05', 'default-avatar.jpg', null, 'AdvdvupKmpoNIMY5tIHB6GcW3O4c0BhD0LB4BOpAx4NCbCYYRC4ZJMiFowGY', 'en', null, '0');
INSERT INTO `user` VALUES ('37', 'avannv', '$2y$10$/fWrAVhbVKEcwAoOFGWZh.1pPdMyBXgabREN3d.xjRfUezo/y86Iq', 'Nguyễn Văn A', '2014-08-04', 'default-avatar.jpg', null, null, 'en', null, '0');
INSERT INTO `user` VALUES ('38', 'vanb', '$2y$10$x7aqZHxdDcjtfaqAXaA.5.D6DGP7SZnrU5ENUacWZyVxbBAR7XNge', 'nguye van b', '2014-08-12', 'default-avatar.jpg', null, null, 'en', null, '0');
