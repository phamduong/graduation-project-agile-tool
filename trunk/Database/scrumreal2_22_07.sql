/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : scrumreal2

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2014-07-22 13:36:36
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `access_link` VALUES ('66', '/burndown\\/\\d+\\/\\d+/', '1', '71');
INSERT INTO `access_link` VALUES ('67', '/burnup', '0', '74');
INSERT INTO `access_link` VALUES ('68', '/burnup/initialize', '0', '74');
INSERT INTO `access_link` VALUES ('69', '/permission/check', '0', '82');
INSERT INTO `access_link` VALUES ('70', '/attach\\/\\d+\\/\\d+/', '0', '82');
INSERT INTO `access_link` VALUES ('71', '/public\\/data\\/attach\\/.*/', '1', '82');
INSERT INTO `access_link` VALUES ('72', '/burndown', '0', '71');
INSERT INTO `access_link` VALUES ('73', '/task/delete', '0', '77');
INSERT INTO `access_link` VALUES ('74', '/task/update_order', '0', '49');

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
) ENGINE=InnoDB AUTO_INCREMENT=1138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `activity` VALUES ('589', '2', '1', '1', '8+9', '2014-07-13 09:54:12', '1');
INSERT INTO `activity` VALUES ('590', '2', '1', '1', '8+9', '2014-07-13 09:54:12', '1');
INSERT INTO `activity` VALUES ('591', '3', '9', '4', '25+2', '2014-07-13 10:28:03', '1');
INSERT INTO `activity` VALUES ('592', '3', '19', '3', '25+2', '2014-07-13 10:28:03', '1');
INSERT INTO `activity` VALUES ('593', '3', '9', '4', '12+2', '2014-07-13 10:28:05', '1');
INSERT INTO `activity` VALUES ('594', '3', '18', '3', '12+2', '2014-07-13 10:28:05', '1');
INSERT INTO `activity` VALUES ('595', '2', '9', '4', '10+2', '2014-07-13 10:30:08', '1');
INSERT INTO `activity` VALUES ('596', '2', '18', '3', '10+2', '2014-07-13 10:30:09', '1');
INSERT INTO `activity` VALUES ('597', '3', '9', '4', '10+2', '2014-07-13 10:30:09', '1');
INSERT INTO `activity` VALUES ('598', '3', '17', '3', '10+2', '2014-07-13 10:30:09', '1');
INSERT INTO `activity` VALUES ('599', '2', '9', '4', '25+2', '2014-07-13 13:29:18', '1');
INSERT INTO `activity` VALUES ('600', '2', '18', '3', '25+2', '2014-07-13 13:29:18', '1');
INSERT INTO `activity` VALUES ('601', '2', '9', '4', '12+2', '2014-07-13 13:29:20', '1');
INSERT INTO `activity` VALUES ('602', '2', '18', '3', '12+2', '2014-07-13 13:29:20', '1');
INSERT INTO `activity` VALUES ('603', '3', '1', '1', '1+2', '2014-07-13 16:25:14', '1');
INSERT INTO `activity` VALUES ('604', '3', '8', '4', '11+2', '2014-07-13 23:45:14', '1');
INSERT INTO `activity` VALUES ('605', '3', '18', '3', '11+2', '2014-07-13 23:45:14', '1');
INSERT INTO `activity` VALUES ('606', '2', '17', '3', '21+8', '2014-07-14 00:22:21', '1');
INSERT INTO `activity` VALUES ('607', '2', '18', '3', '5+8', '2014-07-14 00:22:25', '1');
INSERT INTO `activity` VALUES ('608', '2', '19', '3', '8+8', '2014-07-14 00:22:27', '1');
INSERT INTO `activity` VALUES ('609', '2', '18', '3', '6+8', '2014-07-14 00:22:28', '1');
INSERT INTO `activity` VALUES ('610', '2', '8', '4', '25+2', '2014-07-14 00:24:17', '1');
INSERT INTO `activity` VALUES ('611', '2', '17', '3', '25+2', '2014-07-14 00:24:18', '1');
INSERT INTO `activity` VALUES ('612', '3', '9', '4', '25+2', '2014-07-14 00:24:18', '1');
INSERT INTO `activity` VALUES ('613', '3', '18', '3', '25+2', '2014-07-14 00:24:18', '1');
INSERT INTO `activity` VALUES ('614', '2', '9', '4', '10+2', '2014-07-14 00:24:20', '1');
INSERT INTO `activity` VALUES ('615', '2', '19', '3', '10+2', '2014-07-14 00:24:20', '1');
INSERT INTO `activity` VALUES ('616', '3', '9', '4', '10+2', '2014-07-14 00:24:20', '1');
INSERT INTO `activity` VALUES ('617', '3', '18', '3', '10+2', '2014-07-14 00:24:20', '1');
INSERT INTO `activity` VALUES ('618', '2', '8', '4', '13+2', '2014-07-14 00:24:21', '1');
INSERT INTO `activity` VALUES ('619', '2', '18', '3', '13+2', '2014-07-14 00:24:21', '1');
INSERT INTO `activity` VALUES ('620', '3', '8', '4', '13+2', '2014-07-14 00:24:21', '1');
INSERT INTO `activity` VALUES ('621', '3', '19', '3', '13+2', '2014-07-14 00:24:22', '1');
INSERT INTO `activity` VALUES ('622', '4', '12', '6', 'Status+Done+To do', '2014-07-14 00:27:08', '1');
INSERT INTO `activity` VALUES ('623', '4', '19', '6', 'Status+Done+In Progress', '2014-07-14 00:27:09', '1');
INSERT INTO `activity` VALUES ('624', '4', '6', '6', 'Status+To test+In Progress', '2014-07-14 00:27:20', '1');
INSERT INTO `activity` VALUES ('625', '4', '11', '6', 'Status+Done+To test', '2014-07-14 00:27:21', '1');
INSERT INTO `activity` VALUES ('626', '4', '11', '6', 'Status+To test+In Progress', '2014-07-14 10:00:46', '1');
INSERT INTO `activity` VALUES ('627', '4', '11', '6', 'Status+In Progress+To test', '2014-07-14 10:00:47', '1');
INSERT INTO `activity` VALUES ('628', '4', '11', '6', 'Status+To test+In Progress', '2014-07-14 10:01:38', '1');
INSERT INTO `activity` VALUES ('629', '4', '11', '6', 'Status+In Progress+To test', '2014-07-14 10:01:40', '1');
INSERT INTO `activity` VALUES ('630', '2', '8', '4', '10+2', '2014-07-14 10:02:07', '1');
INSERT INTO `activity` VALUES ('631', '2', '19', '3', '10+2', '2014-07-14 10:02:07', '1');
INSERT INTO `activity` VALUES ('632', '3', '9', '4', '10+2', '2014-07-14 10:02:07', '1');
INSERT INTO `activity` VALUES ('633', '3', '19', '3', '10+2', '2014-07-14 10:02:07', '1');
INSERT INTO `activity` VALUES ('634', '2', '8', '4', '11+2', '2014-07-14 10:02:10', '1');
INSERT INTO `activity` VALUES ('635', '2', '19', '3', '11+2', '2014-07-14 10:02:10', '1');
INSERT INTO `activity` VALUES ('636', '2', '8', '4', '12+2', '2014-07-14 10:02:14', '1');
INSERT INTO `activity` VALUES ('637', '2', '18', '3', '12+2', '2014-07-14 10:02:14', '1');
INSERT INTO `activity` VALUES ('638', '3', '9', '4', '12+2', '2014-07-14 10:02:14', '1');
INSERT INTO `activity` VALUES ('639', '3', '18', '3', '12+2', '2014-07-14 10:02:14', '1');
INSERT INTO `activity` VALUES ('640', '2', '8', '4', '23+2', '2014-07-14 10:02:16', '1');
INSERT INTO `activity` VALUES ('641', '2', '17', '3', '23+2', '2014-07-14 10:02:16', '1');
INSERT INTO `activity` VALUES ('642', '3', '9', '4', '23+2', '2014-07-14 10:02:16', '1');
INSERT INTO `activity` VALUES ('643', '3', '17', '3', '23+2', '2014-07-14 10:02:16', '1');
INSERT INTO `activity` VALUES ('644', '4', '20', '6', 'Status+Done+To test', '2014-07-14 10:02:27', '1');
INSERT INTO `activity` VALUES ('645', '4', '20', '6', 'Status+To test+Done', '2014-07-14 10:03:01', '1');
INSERT INTO `activity` VALUES ('646', '4', '8', '6', 'Status+In Progress+Done', '2014-07-14 10:03:06', '1');
INSERT INTO `activity` VALUES ('647', '4', '15', '6', 'Status+Done+To test', '2014-07-14 10:03:08', '1');
INSERT INTO `activity` VALUES ('648', '4', '8', '6', 'Status+Done+In Progress', '2014-07-14 10:03:10', '1');
INSERT INTO `activity` VALUES ('649', '4', '20', '6', 'Status+Done+To do', '2014-07-14 10:03:14', '1');
INSERT INTO `activity` VALUES ('650', '4', '8', '6', 'Status+In Progress+To do', '2014-07-14 10:10:14', '1');
INSERT INTO `activity` VALUES ('651', '4', '15', '6', 'Status+To test+To do', '2014-07-14 10:10:50', '1');
INSERT INTO `activity` VALUES ('652', '4', '8', '6', 'Status+To do+In Progress', '2014-07-14 10:12:53', '1');
INSERT INTO `activity` VALUES ('653', '3', '10', '2', '15+6', '2014-07-14 10:52:24', '1');
INSERT INTO `activity` VALUES ('654', '3', '10', '2', '15+6', '2014-07-14 15:59:43', '1');
INSERT INTO `activity` VALUES ('655', '3', '10', '2', '15+6', '2014-07-14 16:03:43', '1');
INSERT INTO `activity` VALUES ('656', '3', '10', '2', '15+6', '2014-07-14 16:09:14', '1');
INSERT INTO `activity` VALUES ('657', '3', '10', '2', '15+6', '2014-07-14 16:11:57', '1');
INSERT INTO `activity` VALUES ('658', '3', '10', '2', '15+6', '2014-07-14 16:15:17', '1');
INSERT INTO `activity` VALUES ('659', '3', '10', '2', '15+6', '2014-07-14 16:16:51', '1');
INSERT INTO `activity` VALUES ('660', '3', '10', '2', '15+6', '2014-07-14 16:17:34', '1');
INSERT INTO `activity` VALUES ('661', '5', '22', '1', '', '2014-07-14 17:25:09', '1');
INSERT INTO `activity` VALUES ('662', '1', '22', '1', '168', '2014-07-14 17:28:05', '1');
INSERT INTO `activity` VALUES ('663', '5', '23', '1', '', '2014-07-14 17:56:33', '1');
INSERT INTO `activity` VALUES ('664', '5', '24', '1', '', '2014-07-14 17:58:01', '1');
INSERT INTO `activity` VALUES ('665', '5', '25', '1', '', '2014-07-14 18:00:45', '1');
INSERT INTO `activity` VALUES ('666', '5', '26', '1', '', '2014-07-14 18:01:01', '1');
INSERT INTO `activity` VALUES ('667', '5', '27', '1', '', '2014-07-14 18:05:46', '1');
INSERT INTO `activity` VALUES ('668', '2', '14', '1', '10+9', '2014-07-15 05:32:55', '1');
INSERT INTO `activity` VALUES ('669', '2', '14', '1', '10+9', '2014-07-15 05:32:55', '1');
INSERT INTO `activity` VALUES ('670', '3', '14', '1', '9+9', '2014-07-15 05:33:40', '1');
INSERT INTO `activity` VALUES ('671', '3', '14', '1', '10+9', '2014-07-15 05:33:40', '1');
INSERT INTO `activity` VALUES ('672', '2', '14', '1', '11+9', '2014-07-15 05:39:08', '1');
INSERT INTO `activity` VALUES ('673', '2', '14', '1', '11+9', '2014-07-15 05:39:09', '1');
INSERT INTO `activity` VALUES ('676', '3', '14', '1', '11+9', '2014-07-15 06:26:03', '1');
INSERT INTO `activity` VALUES ('677', '2', '14', '1', '14+9', '2014-07-15 06:31:55', '1');
INSERT INTO `activity` VALUES ('678', '2', '14', '1', '15+9', '2014-07-15 06:31:55', '1');
INSERT INTO `activity` VALUES ('679', '2', '14', '1', '16+9', '2014-07-15 06:31:56', '1');
INSERT INTO `activity` VALUES ('680', '2', '14', '1', '17+9', '2014-07-15 06:31:56', '1');
INSERT INTO `activity` VALUES ('681', '2', '14', '1', '18+9', '2014-07-15 06:31:56', '1');
INSERT INTO `activity` VALUES ('682', '3', '14', '1', '16+9', '2014-07-15 06:32:30', '1');
INSERT INTO `activity` VALUES ('683', '3', '14', '1', '17+9', '2014-07-15 06:32:30', '1');
INSERT INTO `activity` VALUES ('684', '2', '1', '1', '26+2', '2014-07-15 07:07:35', '1');
INSERT INTO `activity` VALUES ('685', '5', '26', '2', '', '2014-07-15 07:07:35', '1');
INSERT INTO `activity` VALUES ('686', '2', '1', '1', '27+2', '2014-07-15 07:11:03', '1');
INSERT INTO `activity` VALUES ('687', '5', '27', '2', '', '2014-07-15 07:11:03', '1');
INSERT INTO `activity` VALUES ('688', '2', '27', '1', '19+9', '2014-07-15 07:11:04', '1');
INSERT INTO `activity` VALUES ('689', '2', '1', '1', '28+2', '2014-07-15 07:26:25', '1');
INSERT INTO `activity` VALUES ('690', '5', '28', '2', '', '2014-07-15 07:26:25', '1');
INSERT INTO `activity` VALUES ('691', '2', '28', '1', '20+9', '2014-07-15 07:26:26', '1');
INSERT INTO `activity` VALUES ('692', '2', '1', '1', '29+2', '2014-07-15 07:27:18', '1');
INSERT INTO `activity` VALUES ('693', '5', '29', '2', '', '2014-07-15 07:27:18', '1');
INSERT INTO `activity` VALUES ('694', '2', '29', '1', '21+9', '2014-07-15 07:27:19', '1');
INSERT INTO `activity` VALUES ('695', '2', '1', '1', '30+2', '2014-07-15 07:27:46', '1');
INSERT INTO `activity` VALUES ('696', '5', '30', '2', '', '2014-07-15 07:27:46', '1');
INSERT INTO `activity` VALUES ('697', '2', '30', '2', '22+9', '2014-07-15 07:27:47', '1');
INSERT INTO `activity` VALUES ('698', '4', '30', '2', 'Estimate time++2', '2014-07-15 07:38:12', '1');
INSERT INTO `activity` VALUES ('699', '4', '30', '2', 'Story point++1', '2014-07-15 07:38:12', '1');
INSERT INTO `activity` VALUES ('700', '2', '30', '2', '23+9', '2014-07-15 07:38:13', '1');
INSERT INTO `activity` VALUES ('701', '3', '30', '2', '22+9', '2014-07-15 07:38:27', '1');
INSERT INTO `activity` VALUES ('702', '2', '30', '2', '24+9', '2014-07-15 07:38:43', '1');
INSERT INTO `activity` VALUES ('703', '3', '30', '2', '23+9', '2014-07-15 07:38:44', '1');
INSERT INTO `activity` VALUES ('704', '4', '1', '1', 'Status+1+0', '2014-07-15 09:32:54', '1');
INSERT INTO `activity` VALUES ('705', '4', '1', '1', 'Status+0+1', '2014-07-15 09:33:05', '1');
INSERT INTO `activity` VALUES ('706', '4', '1', '1', 'Status+1+2', '2014-07-15 09:34:09', '1');
INSERT INTO `activity` VALUES ('707', '4', '1', '1', 'Estimate end date+2014-08-26+2014-08-27', '2014-07-15 09:34:38', '1');
INSERT INTO `activity` VALUES ('708', '3', '8', '4', '10+2', '2014-07-15 09:47:07', '1');
INSERT INTO `activity` VALUES ('709', '3', '19', '3', '10+2', '2014-07-15 09:47:07', '1');
INSERT INTO `activity` VALUES ('710', '2', '8', '4', '10+2', '2014-07-15 10:01:01', '1');
INSERT INTO `activity` VALUES ('711', '2', '19', '3', '10+2', '2014-07-15 10:01:01', '1');
INSERT INTO `activity` VALUES ('712', '3', '8', '4', '10+2', '2014-07-15 10:01:03', '1');
INSERT INTO `activity` VALUES ('713', '3', '19', '3', '10+2', '2014-07-15 10:01:03', '1');
INSERT INTO `activity` VALUES ('714', '4', '26', '2', 'Name+aaaaaaaaaaaaa+Nâng cấp tính năng report', '2014-07-15 10:06:36', '1');
INSERT INTO `activity` VALUES ('715', '4', '27', '2', 'Name+aaaaaaaaaaaaaaaa+Quản lí album ảnh', '2014-07-15 10:10:01', '1');
INSERT INTO `activity` VALUES ('716', '4', '27', '2', 'Priority+3+2', '2014-07-15 10:10:01', '1');
INSERT INTO `activity` VALUES ('717', '4', '30', '2', 'Name+dddddddddddddd+Quản lí tiền bạc', '2014-07-15 10:10:30', '1');
INSERT INTO `activity` VALUES ('718', '4', '29', '2', 'Name+aaaaaaaaaaaaaaaaaa+Bổ sung quản lí món ăn', '2014-07-15 10:10:55', '1');
INSERT INTO `activity` VALUES ('719', '4', '28', '2', 'Name+aaaaaaaaaaaaaaaaaa+Quản lí thực đơn', '2014-07-15 10:11:18', '1');
INSERT INTO `activity` VALUES ('720', '5', '22', '1', '', '2014-07-18 22:11:03', '1');
INSERT INTO `activity` VALUES ('721', '5', '23', '1', '', '2014-07-18 22:13:05', '1');
INSERT INTO `activity` VALUES ('722', '5', '24', '1', '', '2014-07-18 22:22:24', '1');
INSERT INTO `activity` VALUES ('723', '5', '25', '1', '', '2014-07-19 07:04:36', '1');
INSERT INTO `activity` VALUES ('724', '5', '26', '1', '', '2014-07-19 07:12:13', '1');
INSERT INTO `activity` VALUES ('725', '5', '27', '1', '', '2014-07-19 07:14:29', '1');
INSERT INTO `activity` VALUES ('726', '5', '28', '1', '', '2014-07-19 07:38:11', '1');
INSERT INTO `activity` VALUES ('727', '5', '29', '1', '', '2014-07-19 07:38:49', '1');
INSERT INTO `activity` VALUES ('728', '5', '30', '1', '', '2014-07-19 07:39:28', '1');
INSERT INTO `activity` VALUES ('729', '5', '31', '1', '', '2014-07-19 07:42:40', '1');
INSERT INTO `activity` VALUES ('730', '5', '32', '1', '', '2014-07-19 07:45:47', '1');
INSERT INTO `activity` VALUES ('731', '5', '33', '1', '', '2014-07-19 07:47:26', '1');
INSERT INTO `activity` VALUES ('732', '5', '34', '1', '', '2014-07-19 07:50:10', '1');
INSERT INTO `activity` VALUES ('733', '5', '35', '1', '', '2014-07-19 07:55:07', '1');
INSERT INTO `activity` VALUES ('734', '5', '36', '1', '', '2014-07-19 08:31:29', '1');
INSERT INTO `activity` VALUES ('735', '5', '37', '1', '', '2014-07-19 08:32:19', '1');
INSERT INTO `activity` VALUES ('736', '4', '31', '1', 'Name+1111111111111111+1111111111111111ccccccccccccccccccccccccc', '2014-07-19 08:36:28', '1');
INSERT INTO `activity` VALUES ('737', '4', '31', '1', 'Name+1111111111111111ccccccccccccccccccccccccc+11111111111rrrrrrcccccc', '2014-07-19 08:36:43', '1');
INSERT INTO `activity` VALUES ('738', '4', '33', '1', 'Status+-1+0', '2014-07-19 08:37:36', '1');
INSERT INTO `activity` VALUES ('739', '4', '33', '1', 'Estimate end date+2014-07-19+2014-07-31', '2014-07-19 08:38:30', '1');
INSERT INTO `activity` VALUES ('740', '2', '1', '1', '31+2', '2014-07-19 09:00:13', '1');
INSERT INTO `activity` VALUES ('741', '5', '31', '2', '', '2014-07-19 09:00:13', '1');
INSERT INTO `activity` VALUES ('742', '4', '31', '2', 'Priority+1+2', '2014-07-19 09:07:51', '1');
INSERT INTO `activity` VALUES ('743', '4', '31', '2', 'Priority+2+3', '2014-07-19 09:08:12', '1');
INSERT INTO `activity` VALUES ('744', '4', '12', '2', 'Priority+4+3', '2014-07-19 09:08:26', '1');
INSERT INTO `activity` VALUES ('745', '4', '12', '2', 'Estimate time+4+10', '2014-07-19 09:08:49', '1');
INSERT INTO `activity` VALUES ('746', '4', '12', '2', 'Story point+5+20', '2014-07-19 09:08:49', '1');
INSERT INTO `activity` VALUES ('747', '2', '1', '1', '32+2', '2014-07-19 09:09:23', '1');
INSERT INTO `activity` VALUES ('748', '5', '32', '2', '', '2014-07-19 09:09:23', '1');
INSERT INTO `activity` VALUES ('749', '4', '1', '1', 'Status+New+Approved', '2014-07-19 09:09:30', '1');
INSERT INTO `activity` VALUES ('750', '3', '1', '1', '32+2', '2014-07-19 09:09:40', '1');
INSERT INTO `activity` VALUES ('751', '2', '1', '1', '20+3', '2014-07-19 09:48:20', '1');
INSERT INTO `activity` VALUES ('752', '5', '20', '3', '', '2014-07-19 09:48:20', '1');
INSERT INTO `activity` VALUES ('753', '2', '1', '1', '21+3', '2014-07-19 10:44:41', '1');
INSERT INTO `activity` VALUES ('754', '5', '21', '3', '', '2014-07-19 10:44:41', '1');
INSERT INTO `activity` VALUES ('755', '2', '1', '1', '22+3', '2014-07-19 11:32:00', '1');
INSERT INTO `activity` VALUES ('756', '5', '22', '3', '', '2014-07-19 11:32:00', '1');
INSERT INTO `activity` VALUES ('757', '2', '1', '1', '23+3', '2014-07-19 11:34:53', '1');
INSERT INTO `activity` VALUES ('758', '5', '23', '3', '', '2014-07-19 11:34:54', '1');
INSERT INTO `activity` VALUES ('759', '2', '1', '1', '25+3', '2014-07-19 11:38:28', '1');
INSERT INTO `activity` VALUES ('760', '5', '25', '3', '', '2014-07-19 11:38:28', '1');
INSERT INTO `activity` VALUES ('761', '3', '1', '1', '25+3', '2014-07-19 11:54:49', '1');
INSERT INTO `activity` VALUES ('762', '3', '1', '1', '23+3', '2014-07-19 11:55:00', '1');
INSERT INTO `activity` VALUES ('763', '3', '1', '1', '22+3', '2014-07-19 11:55:10', '1');
INSERT INTO `activity` VALUES ('764', '3', '1', '1', '20+3', '2014-07-19 11:55:17', '1');
INSERT INTO `activity` VALUES ('765', '3', '1', '1', '21+3', '2014-07-19 11:55:28', '1');
INSERT INTO `activity` VALUES ('766', '2', '1', '1', '26+3', '2014-07-19 11:56:17', '1');
INSERT INTO `activity` VALUES ('767', '5', '26', '3', '', '2014-07-19 11:56:17', '1');
INSERT INTO `activity` VALUES ('768', '2', '1', '1', '27+3', '2014-07-19 11:58:23', '1');
INSERT INTO `activity` VALUES ('769', '5', '27', '3', '', '2014-07-19 11:58:23', '1');
INSERT INTO `activity` VALUES ('770', '2', '27', '3', '3+8', '2014-07-19 12:01:59', '1');
INSERT INTO `activity` VALUES ('771', '2', '1', '1', '28+3', '2014-07-19 12:02:17', '1');
INSERT INTO `activity` VALUES ('772', '5', '28', '3', '', '2014-07-19 12:02:17', '1');
INSERT INTO `activity` VALUES ('773', '2', '28', '3', '26+8', '2014-07-19 12:02:26', '1');
INSERT INTO `activity` VALUES ('774', '2', '28', '3', '22+8', '2014-07-19 12:03:00', '1');
INSERT INTO `activity` VALUES ('775', '2', '28', '3', '8+8', '2014-07-19 12:03:05', '1');
INSERT INTO `activity` VALUES ('776', '4', '1', '1', 'Status+2+1', '2014-07-19 14:25:04', '1');
INSERT INTO `activity` VALUES ('777', '3', '1', '1', '27+3', '2014-07-19 14:25:36', '1');
INSERT INTO `activity` VALUES ('778', '3', '1', '1', '26+3', '2014-07-19 14:27:42', '1');
INSERT INTO `activity` VALUES ('779', '3', '1', '1', '28+3', '2014-07-19 14:28:37', '1');
INSERT INTO `activity` VALUES ('780', '3', '1', '1', '19+3', '2014-07-19 14:29:19', '1');
INSERT INTO `activity` VALUES ('781', '2', '1', '1', '29+3', '2014-07-19 14:34:06', '1');
INSERT INTO `activity` VALUES ('782', '5', '29', '3', '', '2014-07-19 14:34:06', '1');
INSERT INTO `activity` VALUES ('783', '3', '1', '1', '29+3', '2014-07-19 14:34:16', '1');
INSERT INTO `activity` VALUES ('784', '2', '1', '1', '30+3', '2014-07-19 14:35:04', '1');
INSERT INTO `activity` VALUES ('785', '5', '30', '3', '', '2014-07-19 14:35:04', '1');
INSERT INTO `activity` VALUES ('786', '2', '30', '3', '23+8', '2014-07-19 14:35:59', '1');
INSERT INTO `activity` VALUES ('787', '2', '30', '3', '22+8', '2014-07-19 14:36:04', '1');
INSERT INTO `activity` VALUES ('788', '2', '30', '3', '8+8', '2014-07-19 14:56:34', '1');
INSERT INTO `activity` VALUES ('789', '2', '1', '1', '31+3', '2014-07-19 14:56:49', '1');
INSERT INTO `activity` VALUES ('790', '5', '31', '3', '', '2014-07-19 14:56:49', '1');
INSERT INTO `activity` VALUES ('791', '2', '1', '1', '32+3', '2014-07-19 15:22:24', '1');
INSERT INTO `activity` VALUES ('792', '5', '32', '3', '', '2014-07-19 15:22:24', '1');
INSERT INTO `activity` VALUES ('793', '2', '1', '1', '33+3', '2014-07-19 15:24:10', '1');
INSERT INTO `activity` VALUES ('794', '5', '33', '3', '', '2014-07-19 15:24:10', '1');
INSERT INTO `activity` VALUES ('795', '2', '1', '1', '34+3', '2014-07-19 15:26:07', '1');
INSERT INTO `activity` VALUES ('796', '5', '34', '3', '', '2014-07-19 15:26:07', '1');
INSERT INTO `activity` VALUES ('797', '2', '1', '1', '35+3', '2014-07-19 15:55:53', '1');
INSERT INTO `activity` VALUES ('798', '5', '35', '3', '', '2014-07-19 15:55:53', '1');
INSERT INTO `activity` VALUES ('799', '2', '1', '1', '36+3', '2014-07-19 15:57:14', '1');
INSERT INTO `activity` VALUES ('800', '5', '36', '3', '', '2014-07-19 15:57:15', '1');
INSERT INTO `activity` VALUES ('801', '2', '1', '1', '37+3', '2014-07-19 15:58:23', '1');
INSERT INTO `activity` VALUES ('802', '5', '37', '3', '', '2014-07-19 15:58:23', '1');
INSERT INTO `activity` VALUES ('803', '2', '1', '1', '38+3', '2014-07-19 15:59:09', '1');
INSERT INTO `activity` VALUES ('804', '5', '38', '3', '', '2014-07-19 15:59:09', '1');
INSERT INTO `activity` VALUES ('805', '3', '1', '1', '38+3', '2014-07-19 15:59:51', '1');
INSERT INTO `activity` VALUES ('806', '3', '1', '1', '37+3', '2014-07-19 16:00:25', '1');
INSERT INTO `activity` VALUES ('807', '3', '1', '1', '36+3', '2014-07-19 16:01:04', '1');
INSERT INTO `activity` VALUES ('808', '3', '1', '1', '35+3', '2014-07-19 16:01:15', '1');
INSERT INTO `activity` VALUES ('809', '2', '1', '1', '39+3', '2014-07-19 16:02:09', '1');
INSERT INTO `activity` VALUES ('810', '5', '39', '3', '', '2014-07-19 16:02:09', '1');
INSERT INTO `activity` VALUES ('811', '2', '1', '1', '40+3', '2014-07-19 16:06:52', '1');
INSERT INTO `activity` VALUES ('812', '5', '40', '3', '', '2014-07-19 16:06:52', '1');
INSERT INTO `activity` VALUES ('813', '2', '1', '1', '41+3', '2014-07-19 16:13:09', '1');
INSERT INTO `activity` VALUES ('814', '5', '41', '3', '', '2014-07-19 16:13:09', '1');
INSERT INTO `activity` VALUES ('815', '2', '1', '1', '42+3', '2014-07-19 16:13:09', '1');
INSERT INTO `activity` VALUES ('816', '5', '42', '3', '', '2014-07-19 16:13:09', '1');
INSERT INTO `activity` VALUES ('817', '2', '1', '1', '43+3', '2014-07-19 16:15:22', '1');
INSERT INTO `activity` VALUES ('818', '5', '43', '3', '', '2014-07-19 16:15:22', '1');
INSERT INTO `activity` VALUES ('819', '3', '1', '1', '43+3', '2014-07-19 16:15:35', '1');
INSERT INTO `activity` VALUES ('820', '3', '1', '1', '42+3', '2014-07-19 16:16:55', '1');
INSERT INTO `activity` VALUES ('821', '2', '31', '3', '9+8', '2014-07-19 16:18:54', '1');
INSERT INTO `activity` VALUES ('822', '3', '1', '1', '31+3', '2014-07-19 16:19:03', '1');
INSERT INTO `activity` VALUES ('823', '3', '1', '1', '41+3', '2014-07-19 16:21:08', '1');
INSERT INTO `activity` VALUES ('824', '3', '1', '1', '40+3', '2014-07-19 16:21:53', '1');
INSERT INTO `activity` VALUES ('825', '3', '1', '1', '39+3', '2014-07-19 16:22:32', '1');
INSERT INTO `activity` VALUES ('826', '3', '1', '1', '34+3', '2014-07-19 16:23:09', '1');
INSERT INTO `activity` VALUES ('827', '3', '1', '1', '32+3', '2014-07-19 16:23:41', '1');
INSERT INTO `activity` VALUES ('828', '3', '1', '1', '33+3', '2014-07-19 16:25:47', '1');
INSERT INTO `activity` VALUES ('829', '3', '1', '1', '30+3', '2014-07-19 16:26:33', '1');
INSERT INTO `activity` VALUES ('830', '2', '17', '3', '12+8', '2014-07-19 16:26:50', '1');
INSERT INTO `activity` VALUES ('831', '2', '17', '3', '11+8', '2014-07-19 16:26:54', '1');
INSERT INTO `activity` VALUES ('832', '2', '18', '3', '23+8', '2014-07-19 16:26:59', '1');
INSERT INTO `activity` VALUES ('833', '2', '1', '1', '44+3', '2014-07-19 16:27:13', '1');
INSERT INTO `activity` VALUES ('834', '5', '44', '3', '', '2014-07-19 16:27:13', '1');
INSERT INTO `activity` VALUES ('835', '2', '44', '3', '27+8', '2014-07-19 16:27:19', '1');
INSERT INTO `activity` VALUES ('836', '2', '44', '3', '22+8', '2014-07-19 16:27:22', '1');
INSERT INTO `activity` VALUES ('837', '3', '1', '1', '44+3', '2014-07-19 16:28:21', '1');
INSERT INTO `activity` VALUES ('838', '2', '18', '3', '26+8', '2014-07-19 16:28:32', '1');
INSERT INTO `activity` VALUES ('839', '2', '1', '1', '45+3', '2014-07-19 16:28:51', '1');
INSERT INTO `activity` VALUES ('840', '5', '45', '3', '', '2014-07-19 16:28:51', '1');
INSERT INTO `activity` VALUES ('841', '2', '45', '3', '27+8', '2014-07-19 16:28:55', '1');
INSERT INTO `activity` VALUES ('842', '4', '45', '3', 'Name+ttttttttttt+team 3', '2014-07-19 16:44:49', '1');
INSERT INTO `activity` VALUES ('843', '4', '45', '3', 'Name+team 3+team 4', '2014-07-19 16:45:23', '1');
INSERT INTO `activity` VALUES ('844', '3', '45', '3', '27+8', '2014-07-19 16:45:37', '1');
INSERT INTO `activity` VALUES ('845', '2', '45', '3', '27+8', '2014-07-19 16:45:40', '1');
INSERT INTO `activity` VALUES ('846', '2', '45', '3', '13+8', '2014-07-19 16:45:43', '1');
INSERT INTO `activity` VALUES ('847', '2', '17', '3', '14+8', '2014-07-19 16:51:28', '1');
INSERT INTO `activity` VALUES ('848', '2', '17', '3', '4+8', '2014-07-19 16:51:54', '1');
INSERT INTO `activity` VALUES ('849', '3', '17', '3', '4+8', '2014-07-19 17:26:53', '1');
INSERT INTO `activity` VALUES ('850', '2', '17', '3', '4+8', '2014-07-19 17:27:34', '1');
INSERT INTO `activity` VALUES ('851', '3', '17', '3', '4+8', '2014-07-19 17:27:39', '1');
INSERT INTO `activity` VALUES ('852', '3', '17', '3', '14+8', '2014-07-19 17:27:46', '1');
INSERT INTO `activity` VALUES ('853', '3', '18', '3', '26+8', '2014-07-19 17:27:53', '1');
INSERT INTO `activity` VALUES ('854', '3', '18', '3', '23+8', '2014-07-19 17:38:05', '1');
INSERT INTO `activity` VALUES ('855', '2', '17', '3', '23+8', '2014-07-19 17:38:05', '1');
INSERT INTO `activity` VALUES ('856', '3', '17', '3', '23+8', '2014-07-19 17:38:12', '1');
INSERT INTO `activity` VALUES ('857', '2', '18', '3', '23+8', '2014-07-19 17:38:12', '1');
INSERT INTO `activity` VALUES ('858', '2', '17', '3', '14+8', '2014-07-19 17:38:18', '1');
INSERT INTO `activity` VALUES ('859', '3', '18', '3', '23+8', '2014-07-19 17:38:22', '1');
INSERT INTO `activity` VALUES ('860', '2', '18', '3', '8+8', '2014-07-19 17:38:31', '1');
INSERT INTO `activity` VALUES ('861', '2', '18', '3', '4+8', '2014-07-19 17:38:42', '1');
INSERT INTO `activity` VALUES ('862', '4', '1', '1', 'Status+New+Approved', '2014-07-19 17:47:57', '1');
INSERT INTO `activity` VALUES ('863', '4', '1', '1', 'Status+New+Approved', '2014-07-19 17:48:03', '1');
INSERT INTO `activity` VALUES ('864', '4', '1', '1', 'Status+New+Approved', '2014-07-19 17:49:26', '1');
INSERT INTO `activity` VALUES ('865', '4', '1', '1', 'Status+New+Approved', '2014-07-19 17:49:33', '1');
INSERT INTO `activity` VALUES ('866', '4', '45', '3', 'Name+team 4+team 3', '2014-07-19 17:51:24', '1');
INSERT INTO `activity` VALUES ('867', '2', '17', '3', '28+8', '2014-07-19 20:55:11', '1');
INSERT INTO `activity` VALUES ('868', '2', '17', '3', '7+8', '2014-07-19 20:55:32', '1');
INSERT INTO `activity` VALUES ('869', '3', '17', '3', '7+8', '2014-07-19 20:56:59', '1');
INSERT INTO `activity` VALUES ('870', '2', '18', '3', '7+8', '2014-07-19 20:56:59', '1');
INSERT INTO `activity` VALUES ('871', '2', '17', '3', '9+8', '2014-07-19 21:04:40', '1');
INSERT INTO `activity` VALUES ('872', '2', '1', '1', '33+2', '2014-07-20 00:11:15', '1');
INSERT INTO `activity` VALUES ('873', '5', '33', '2', '', '2014-07-20 00:11:15', '1');
INSERT INTO `activity` VALUES ('874', '4', '33', '2', 'Name+aaaaaaaaa+Quản lí dụng cụ nấu ăn', '2014-07-20 00:12:08', '1');
INSERT INTO `activity` VALUES ('875', '2', '1', '1', '34+2', '2014-07-20 00:13:00', '1');
INSERT INTO `activity` VALUES ('876', '5', '34', '2', '', '2014-07-20 00:13:00', '1');
INSERT INTO `activity` VALUES ('877', '4', '1', '1', 'Status+New+Approved', '2014-07-20 00:20:54', '1');
INSERT INTO `activity` VALUES ('878', '4', '1', '1', 'Status+New+Approved', '2014-07-20 00:22:54', '1');
INSERT INTO `activity` VALUES ('879', '4', '1', '1', 'Status+New+Approved', '2014-07-20 00:23:27', '1');
INSERT INTO `activity` VALUES ('880', '4', '1', '1', 'Status+New+Approved', '2014-07-20 07:47:41', '1');
INSERT INTO `activity` VALUES ('881', '4', '1', '1', 'Status+New+Approved', '2014-07-20 07:51:47', '1');
INSERT INTO `activity` VALUES ('882', '4', '1', '1', 'Status+New+Approved', '2014-07-20 07:55:21', '1');
INSERT INTO `activity` VALUES ('883', '2', '8', '4', '10+2', '2014-07-20 07:55:34', '1');
INSERT INTO `activity` VALUES ('884', '2', '45', '3', '10+2', '2014-07-20 07:55:34', '1');
INSERT INTO `activity` VALUES ('885', '4', '1', '1', 'Status+New+Approved', '2014-07-20 07:55:46', '1');
INSERT INTO `activity` VALUES ('886', '2', '8', '4', '11+2', '2014-07-20 07:55:51', '1');
INSERT INTO `activity` VALUES ('887', '2', '18', '3', '11+2', '2014-07-20 07:55:52', '1');
INSERT INTO `activity` VALUES ('888', '3', '8', '4', '10+2', '2014-07-20 07:55:56', '1');
INSERT INTO `activity` VALUES ('889', '3', '45', '3', '10+2', '2014-07-20 07:55:56', '1');
INSERT INTO `activity` VALUES ('890', '4', '1', '1', 'Status+New+Approved', '2014-07-20 07:56:30', '1');
INSERT INTO `activity` VALUES ('891', '4', '12', '2', 'Name+Quản lí dụng cụ+Quản lí dụng cụ nhà bếp', '2014-07-20 07:56:39', '1');
INSERT INTO `activity` VALUES ('892', '4', '12', '2', 'Name+Quản lí dụng cụ nhà bếp+Quản lí dụng cụ nhà bếp nấu ăn', '2014-07-20 07:57:54', '1');
INSERT INTO `activity` VALUES ('893', '4', '12', '2', 'Estimate time+10+5', '2014-07-20 07:58:35', '1');
INSERT INTO `activity` VALUES ('894', '4', '12', '2', 'Story point+20+10', '2014-07-20 07:58:35', '1');
INSERT INTO `activity` VALUES ('895', '4', '15', '2', 'Name+story 15+Quản lí phòng ban', '2014-07-20 07:59:52', '1');
INSERT INTO `activity` VALUES ('896', '4', '15', '2', 'Name+Quản lí phòng ban+Quản lí phòng ban aa', '2014-07-20 09:27:42', '1');
INSERT INTO `activity` VALUES ('897', '4', '13', '2', 'Name+Thống kê bán hàng+Thống kê bán hàng hàng tuần', '2014-07-20 09:28:21', '1');
INSERT INTO `activity` VALUES ('898', '4', '10', '2', 'Name+Quản lí đặt bàn+Quản lí đặt bàn ăn', '2014-07-20 09:57:20', '1');
INSERT INTO `activity` VALUES ('899', '4', '1', '1', 'Status+New+Approved', '2014-07-20 09:57:41', '1');
INSERT INTO `activity` VALUES ('900', '4', '1', '1', 'Status+New+Approved', '2014-07-20 09:58:37', '1');
INSERT INTO `activity` VALUES ('901', '4', '1', '1', 'Status+New+Approved', '2014-07-20 09:58:51', '1');
INSERT INTO `activity` VALUES ('902', '4', '11', '2', 'Name+Quản lí đơn hàng+Quản lí đơn hàng hóa', '2014-07-20 10:02:29', '1');
INSERT INTO `activity` VALUES ('903', '4', '1', '1', 'Status+New+Approved', '2014-07-20 10:09:02', '1');
INSERT INTO `activity` VALUES ('904', '4', '26', '2', 'Estimate time+0+10', '2014-07-20 10:12:16', '1');
INSERT INTO `activity` VALUES ('905', '4', '26', '2', 'Story point+0+20', '2014-07-20 10:12:16', '1');
INSERT INTO `activity` VALUES ('906', '2', '8', '4', '26+2', '2014-07-20 10:12:23', '1');
INSERT INTO `activity` VALUES ('907', '2', '45', '3', '26+2', '2014-07-20 10:12:23', '1');
INSERT INTO `activity` VALUES ('908', '4', '26', '2', 'Name+Nâng cấp tính năng report+Nâng cấp tính năng report hàng tuần', '2014-07-20 10:12:50', '1');
INSERT INTO `activity` VALUES ('909', '4', '1', '1', 'Status+New+Approved', '2014-07-20 10:12:59', '1');
INSERT INTO `activity` VALUES ('910', '4', '1', '1', 'Status+New+Approved', '2014-07-20 10:14:45', '1');
INSERT INTO `activity` VALUES ('911', '4', '1', '1', 'Status+New+Approved', '2014-07-20 10:15:08', '1');
INSERT INTO `activity` VALUES ('912', '4', '31', '2', 'Estimate time++2', '2014-07-20 10:16:04', '1');
INSERT INTO `activity` VALUES ('913', '4', '31', '2', 'Story point++10', '2014-07-20 10:16:04', '1');
INSERT INTO `activity` VALUES ('914', '4', '1', '1', 'Status+New+Approved', '2014-07-20 10:16:15', '1');
INSERT INTO `activity` VALUES ('915', '4', '33', '2', 'Estimate time++10', '2014-07-20 10:20:17', '1');
INSERT INTO `activity` VALUES ('916', '4', '33', '2', 'Story point++20', '2014-07-20 10:20:17', '1');
INSERT INTO `activity` VALUES ('917', '4', '1', '1', 'Status+New+Approved', '2014-07-20 10:21:43', '1');
INSERT INTO `activity` VALUES ('918', '2', '8', '4', '33+2', '2014-07-20 10:21:54', '1');
INSERT INTO `activity` VALUES ('919', '2', '17', '3', '33+2', '2014-07-20 10:21:54', '1');
INSERT INTO `activity` VALUES ('920', '4', '1', '1', 'Status+New+Approved', '2014-07-20 10:22:00', '1');
INSERT INTO `activity` VALUES ('921', '2', '1', '1', '35+2', '2014-07-20 10:26:10', '1');
INSERT INTO `activity` VALUES ('922', '5', '35', '2', '', '2014-07-20 10:26:10', '1');
INSERT INTO `activity` VALUES ('923', '2', '35', '2', '25+9', '2014-07-20 10:26:11', '1');
INSERT INTO `activity` VALUES ('924', '4', '1', '1', 'Status+New+Approved', '2014-07-20 10:26:25', '1');
INSERT INTO `activity` VALUES ('925', '3', '35', '2', '25+9', '2014-07-20 10:26:39', '1');
INSERT INTO `activity` VALUES ('926', '4', '35', '2', 'Demo+a+aa', '2014-07-20 10:27:20', '1');
INSERT INTO `activity` VALUES ('927', '4', '35', '2', 'Description+a+aa', '2014-07-20 10:27:21', '1');
INSERT INTO `activity` VALUES ('928', '4', '8', '4', 'Name+Sprint 1+Sprint 1a', '2014-07-20 11:27:22', '1');
INSERT INTO `activity` VALUES ('929', '4', '8', '4', 'Name+Sprint 1a+Sprint 1ab', '2014-07-20 11:28:52', '1');
INSERT INTO `activity` VALUES ('930', '4', '8', '4', 'Name+Sprint 1ab+Sprint 1abc', '2014-07-20 11:30:01', '1');
INSERT INTO `activity` VALUES ('931', '4', '8', '4', 'End date estimate+2014-07-10+2014-07-09', '2014-07-20 11:30:14', '1');
INSERT INTO `activity` VALUES ('932', '4', '8', '4', 'End date estimate+2014-07-09+2014-07-10', '2014-07-20 11:30:41', '1');
INSERT INTO `activity` VALUES ('933', '4', '8', '4', 'Name+Sprint 1abc+Sprint 1', '2014-07-20 11:30:52', '1');
INSERT INTO `activity` VALUES ('934', '2', '8', '4', '31+2', '2014-07-20 16:56:52', '1');
INSERT INTO `activity` VALUES ('935', '2', '18', '3', '31+2', '2014-07-20 16:56:52', '1');
INSERT INTO `activity` VALUES ('936', '2', '8', '4', '12+2', '2014-07-20 16:57:21', '1');
INSERT INTO `activity` VALUES ('937', '2', '45', '3', '12+2', '2014-07-20 16:57:21', '1');
INSERT INTO `activity` VALUES ('938', '2', '8', '4', '23+2', '2014-07-20 17:01:00', '1');
INSERT INTO `activity` VALUES ('939', '2', '17', '3', '23+2', '2014-07-20 17:01:00', '1');
INSERT INTO `activity` VALUES ('940', '2', '9', '4', '30+2', '2014-07-20 17:01:51', '1');
INSERT INTO `activity` VALUES ('941', '2', '17', '3', '30+2', '2014-07-20 17:01:51', '1');
INSERT INTO `activity` VALUES ('942', '2', '9', '4', '10+2', '2014-07-20 17:01:56', '1');
INSERT INTO `activity` VALUES ('943', '2', '18', '3', '10+2', '2014-07-20 17:01:56', '1');
INSERT INTO `activity` VALUES ('944', '2', '9', '4', '13+2', '2014-07-20 17:02:00', '1');
INSERT INTO `activity` VALUES ('945', '2', '45', '3', '13+2', '2014-07-20 17:02:00', '1');
INSERT INTO `activity` VALUES ('946', '3', '9', '4', '13+2', '2014-07-20 17:12:02', '1');
INSERT INTO `activity` VALUES ('947', '3', '45', '3', '13+2', '2014-07-20 17:12:02', '1');
INSERT INTO `activity` VALUES ('948', '3', '9', '4', '10+2', '2014-07-20 17:12:04', '1');
INSERT INTO `activity` VALUES ('949', '3', '18', '3', '10+2', '2014-07-20 17:12:04', '1');
INSERT INTO `activity` VALUES ('950', '3', '9', '4', '30+2', '2014-07-20 17:12:05', '1');
INSERT INTO `activity` VALUES ('951', '3', '17', '3', '30+2', '2014-07-20 17:12:05', '1');
INSERT INTO `activity` VALUES ('952', '2', '9', '4', '30+2', '2014-07-20 17:12:29', '1');
INSERT INTO `activity` VALUES ('953', '2', '17', '3', '30+2', '2014-07-20 17:12:29', '1');
INSERT INTO `activity` VALUES ('954', '2', '9', '4', '10+2', '2014-07-20 17:14:41', '1');
INSERT INTO `activity` VALUES ('955', '2', '18', '3', '10+2', '2014-07-20 17:14:41', '1');
INSERT INTO `activity` VALUES ('956', '2', '9', '4', '25+2', '2014-07-20 17:16:31', '1');
INSERT INTO `activity` VALUES ('957', '2', '45', '3', '25+2', '2014-07-20 17:16:31', '1');
INSERT INTO `activity` VALUES ('958', '2', '9', '4', '13+2', '2014-07-20 17:16:38', '1');
INSERT INTO `activity` VALUES ('959', '2', '18', '3', '13+2', '2014-07-20 17:16:38', '1');
INSERT INTO `activity` VALUES ('960', '4', '35', '2', 'Estimate time++2', '2014-07-20 17:20:39', '1');
INSERT INTO `activity` VALUES ('961', '4', '35', '2', 'Story point++10', '2014-07-20 17:20:39', '1');
INSERT INTO `activity` VALUES ('962', '2', '8', '4', '35+2', '2014-07-20 17:20:55', '1');
INSERT INTO `activity` VALUES ('963', '2', '45', '3', '35+2', '2014-07-20 17:20:55', '1');
INSERT INTO `activity` VALUES ('964', '4', '28', '2', 'Estimate time+0+10', '2014-07-20 17:34:36', '1');
INSERT INTO `activity` VALUES ('965', '4', '34', '2', 'Estimate time++10', '2014-07-20 17:37:42', '1');
INSERT INTO `activity` VALUES ('966', '4', '34', '2', 'Story point++50', '2014-07-20 17:37:52', '1');
INSERT INTO `activity` VALUES ('967', '2', '8', '4', '34+2', '2014-07-20 17:37:58', '1');
INSERT INTO `activity` VALUES ('968', '2', '18', '3', '34+2', '2014-07-20 17:37:58', '1');
INSERT INTO `activity` VALUES ('969', '3', '8', '4', '35+2', '2014-07-20 18:01:46', '1');
INSERT INTO `activity` VALUES ('970', '3', '45', '3', '35+2', '2014-07-20 18:01:46', '1');
INSERT INTO `activity` VALUES ('971', '3', '8', '4', '26+2', '2014-07-20 18:02:38', '1');
INSERT INTO `activity` VALUES ('972', '3', '45', '3', '26+2', '2014-07-20 18:02:38', '1');
INSERT INTO `activity` VALUES ('973', '3', '8', '4', '11+2', '2014-07-20 18:03:19', '1');
INSERT INTO `activity` VALUES ('974', '3', '18', '3', '11+2', '2014-07-20 18:03:19', '1');
INSERT INTO `activity` VALUES ('975', '3', '8', '4', '34+2', '2014-07-20 18:03:56', '1');
INSERT INTO `activity` VALUES ('976', '3', '18', '3', '34+2', '2014-07-20 18:03:56', '1');
INSERT INTO `activity` VALUES ('977', '3', '8', '4', '33+2', '2014-07-20 18:04:38', '1');
INSERT INTO `activity` VALUES ('978', '3', '17', '3', '33+2', '2014-07-20 18:04:38', '1');
INSERT INTO `activity` VALUES ('979', '3', '8', '4', '23+2', '2014-07-20 18:14:22', '1');
INSERT INTO `activity` VALUES ('980', '3', '17', '3', '23+2', '2014-07-20 18:14:22', '1');
INSERT INTO `activity` VALUES ('981', '3', '9', '4', '30+2', '2014-07-20 18:20:52', '1');
INSERT INTO `activity` VALUES ('982', '3', '17', '3', '30+2', '2014-07-20 18:20:52', '1');
INSERT INTO `activity` VALUES ('983', '3', '9', '4', '13+2', '2014-07-20 18:21:44', '1');
INSERT INTO `activity` VALUES ('984', '3', '18', '3', '13+2', '2014-07-20 18:21:44', '1');
INSERT INTO `activity` VALUES ('985', '3', '8', '4', '31+2', '2014-07-20 18:22:29', '1');
INSERT INTO `activity` VALUES ('986', '3', '18', '3', '31+2', '2014-07-20 18:22:29', '1');
INSERT INTO `activity` VALUES ('987', '3', '8', '4', '12+2', '2014-07-20 18:25:08', '1');
INSERT INTO `activity` VALUES ('988', '3', '45', '3', '12+2', '2014-07-20 18:25:08', '1');
INSERT INTO `activity` VALUES ('989', '2', '8', '4', '26+2', '2014-07-20 18:25:14', '1');
INSERT INTO `activity` VALUES ('990', '2', '45', '3', '26+2', '2014-07-20 18:25:14', '1');
INSERT INTO `activity` VALUES ('991', '2', '8', '4', '31+2', '2014-07-20 18:26:06', '1');
INSERT INTO `activity` VALUES ('992', '2', '45', '3', '31+2', '2014-07-20 18:26:06', '1');
INSERT INTO `activity` VALUES ('993', '2', '8', '4', '12+2', '2014-07-20 18:27:09', '1');
INSERT INTO `activity` VALUES ('994', '2', '18', '3', '12+2', '2014-07-20 18:27:09', '1');
INSERT INTO `activity` VALUES ('995', '2', '9', '4', '31+2', '2014-07-20 18:31:33', '1');
INSERT INTO `activity` VALUES ('996', '2', '17', '3', '31+2', '2014-07-20 18:31:33', '1');
INSERT INTO `activity` VALUES ('997', '3', '8', '4', '31+2', '2014-07-20 18:31:33', '1');
INSERT INTO `activity` VALUES ('998', '3', '45', '3', '31+2', '2014-07-20 18:31:33', '1');
INSERT INTO `activity` VALUES ('999', '2', '8', '4', '33+2', '2014-07-20 20:45:00', '1');
INSERT INTO `activity` VALUES ('1000', '2', '17', '3', '33+2', '2014-07-20 20:45:00', '1');
INSERT INTO `activity` VALUES ('1001', '2', '8', '4', '33+2', '2014-07-21 08:00:45', '1');
INSERT INTO `activity` VALUES ('1002', '2', '18', '3', '33+2', '2014-07-21 08:00:45', '1');
INSERT INTO `activity` VALUES ('1003', '3', '8', '4', '33+2', '2014-07-21 08:00:45', '1');
INSERT INTO `activity` VALUES ('1004', '3', '17', '3', '33+2', '2014-07-21 08:00:45', '1');
INSERT INTO `activity` VALUES ('1005', '2', '8', '4', '26+2', '2014-07-21 08:00:47', '1');
INSERT INTO `activity` VALUES ('1006', '2', '17', '3', '26+2', '2014-07-21 08:00:47', '1');
INSERT INTO `activity` VALUES ('1007', '3', '8', '4', '26+2', '2014-07-21 08:00:47', '1');
INSERT INTO `activity` VALUES ('1008', '3', '45', '3', '26+2', '2014-07-21 08:00:48', '1');
INSERT INTO `activity` VALUES ('1009', '2', '8', '4', '26+2', '2014-07-21 08:03:12', '1');
INSERT INTO `activity` VALUES ('1010', '2', '18', '3', '26+2', '2014-07-21 08:03:12', '1');
INSERT INTO `activity` VALUES ('1011', '3', '8', '4', '26+2', '2014-07-21 08:03:12', '1');
INSERT INTO `activity` VALUES ('1012', '3', '17', '3', '26+2', '2014-07-21 08:03:12', '1');
INSERT INTO `activity` VALUES ('1013', '2', '8', '4', '23+2', '2014-07-21 10:38:02', '1');
INSERT INTO `activity` VALUES ('1014', '2', '45', '3', '23+2', '2014-07-21 10:38:03', '1');
INSERT INTO `activity` VALUES ('1015', '2', '8', '4', '26+2', '2014-07-21 10:38:05', '1');
INSERT INTO `activity` VALUES ('1016', '2', '17', '3', '26+2', '2014-07-21 10:38:05', '1');
INSERT INTO `activity` VALUES ('1017', '3', '8', '4', '26+2', '2014-07-21 10:38:05', '1');
INSERT INTO `activity` VALUES ('1018', '3', '18', '3', '26+2', '2014-07-21 10:38:06', '1');
INSERT INTO `activity` VALUES ('1019', '4', '8', '4', 'Name+Sprint 1+Sprint 1a', '2014-07-21 11:00:38', '1');
INSERT INTO `activity` VALUES ('1020', '3', '8', '4', '33+2', '2014-07-21 11:17:05', '1');
INSERT INTO `activity` VALUES ('1021', '3', '18', '3', '33+2', '2014-07-21 11:17:05', '1');
INSERT INTO `activity` VALUES ('1022', '4', '8', '4', 'Name+Sprint 1a+Sprint 1', '2014-07-21 11:31:50', '1');
INSERT INTO `activity` VALUES ('1023', '2', '1', '1', '11+4', '2014-07-21 11:47:40', '1');
INSERT INTO `activity` VALUES ('1024', '5', '11', '4', '', '2014-07-21 11:47:40', '1');
INSERT INTO `activity` VALUES ('1025', '4', '11', '4', 'Name+bbbbb+Sprint 4', '2014-07-21 11:48:56', '1');
INSERT INTO `activity` VALUES ('1026', '2', '11', '4', '30+2', '2014-07-21 11:49:02', '1');
INSERT INTO `activity` VALUES ('1027', '2', '17', '3', '30+2', '2014-07-21 11:49:02', '1');
INSERT INTO `activity` VALUES ('1028', '2', '1', '1', '12+4', '2014-07-21 11:53:18', '1');
INSERT INTO `activity` VALUES ('1029', '5', '12', '4', '', '2014-07-21 11:53:18', '1');
INSERT INTO `activity` VALUES ('1030', '2', '10', '4', '35+2', '2014-07-21 11:54:55', '1');
INSERT INTO `activity` VALUES ('1031', '2', '45', '3', '35+2', '2014-07-21 11:54:55', '1');
INSERT INTO `activity` VALUES ('1032', '2', '12', '4', '11+2', '2014-07-21 11:56:21', '1');
INSERT INTO `activity` VALUES ('1033', '2', '45', '3', '11+2', '2014-07-21 11:56:21', '1');
INSERT INTO `activity` VALUES ('1034', '2', '1', '1', '13+4', '2014-07-21 11:56:35', '1');
INSERT INTO `activity` VALUES ('1035', '5', '13', '4', '', '2014-07-21 11:56:35', '1');
INSERT INTO `activity` VALUES ('1036', '2', '1', '1', '14+4', '2014-07-21 13:05:16', '1');
INSERT INTO `activity` VALUES ('1037', '5', '14', '4', '', '2014-07-21 13:05:16', '1');
INSERT INTO `activity` VALUES ('1038', '2', '14', '4', '34+2', '2014-07-21 13:06:07', '1');
INSERT INTO `activity` VALUES ('1039', '2', '45', '3', '34+2', '2014-07-21 13:06:07', '1');
INSERT INTO `activity` VALUES ('1040', '3', '14', '4', '34+2', '2014-07-21 13:06:22', '1');
INSERT INTO `activity` VALUES ('1041', '3', '45', '3', '34+2', '2014-07-21 13:06:22', '1');
INSERT INTO `activity` VALUES ('1042', '4', '10', '6', 'Name+task 10+task 10a', '2014-07-21 13:40:04', '1');
INSERT INTO `activity` VALUES ('1043', '4', '10', '6', 'Status+To do+In Progress', '2014-07-21 13:40:29', '1');
INSERT INTO `activity` VALUES ('1044', '4', '10', '6', 'Name+task 10a+task 10ac', '2014-07-21 13:48:18', '1');
INSERT INTO `activity` VALUES ('1045', '4', '10', '6', 'Name+task 10ac+task 10', '2014-07-21 13:49:16', '1');
INSERT INTO `activity` VALUES ('1046', '4', '10', '6', 'Name+task 10+task 10cc', '2014-07-21 13:57:33', '1');
INSERT INTO `activity` VALUES ('1047', '4', '10', '6', 'Name+task 10cc+task 10cca', '2014-07-21 14:05:43', '1');
INSERT INTO `activity` VALUES ('1048', '4', '10', '6', 'Name+task 10cca+task 10', '2014-07-21 14:05:58', '1');
INSERT INTO `activity` VALUES ('1049', '4', '10', '6', 'Name+task 10+task 10dd', '2014-07-21 14:07:06', '1');
INSERT INTO `activity` VALUES ('1050', '4', '10', '6', 'Name+task 10dd+task 10', '2014-07-21 14:08:59', '1');
INSERT INTO `activity` VALUES ('1051', '4', '10', '6', 'Name+task 10+task 10sdfsdf', '2014-07-21 14:10:46', '1');
INSERT INTO `activity` VALUES ('1052', '4', '10', '6', 'Name+task 10sdfsdf+task 10', '2014-07-21 14:10:59', '1');
INSERT INTO `activity` VALUES ('1053', '4', '10', '6', 'Name+task 10+task 10 df', '2014-07-21 14:11:26', '1');
INSERT INTO `activity` VALUES ('1054', '4', '10', '6', 'Name+task 10 df+task 10 dfdd', '2014-07-21 14:11:48', '1');
INSERT INTO `activity` VALUES ('1055', '4', '10', '6', 'Name+task 10 dfdd+task 10 dfddddd', '2014-07-21 14:12:06', '1');
INSERT INTO `activity` VALUES ('1056', '4', '10', '6', 'Name+task 10 dfddddd+task 10', '2014-07-21 14:12:15', '1');
INSERT INTO `activity` VALUES ('1057', '4', '10', '6', 'User assign+mem 2+mem 1', '2014-07-21 14:12:29', '1');
INSERT INTO `activity` VALUES ('1058', '4', '10', '6', 'Name+task 10+task 10fffff', '2014-07-21 14:14:06', '1');
INSERT INTO `activity` VALUES ('1059', '4', '10', '6', 'Name+task 10fffff+task 10', '2014-07-21 14:14:25', '1');
INSERT INTO `activity` VALUES ('1060', '4', '10', '6', 'Estimate time+2+3', '2014-07-21 14:14:26', '1');
INSERT INTO `activity` VALUES ('1061', '4', '10', '6', 'Time remain+3+4', '2014-07-21 14:14:26', '1');
INSERT INTO `activity` VALUES ('1062', '3', '12', '2', '10+6', '2014-07-21 14:23:16', '1');
INSERT INTO `activity` VALUES ('1063', '3', '12', '2', '10+6', '2014-07-21 14:23:48', '1');
INSERT INTO `activity` VALUES ('1064', '3', '12', '2', '10+6', '2014-07-21 14:28:36', '1');
INSERT INTO `activity` VALUES ('1065', '3', '12', '2', '10+6', '2014-07-21 14:29:11', '1');
INSERT INTO `activity` VALUES ('1066', '3', '12', '2', '10+6', '2014-07-21 14:29:41', '1');
INSERT INTO `activity` VALUES ('1067', '4', '10', '6', 'Time remain+2+2', '2014-07-21 14:33:52', '1');
INSERT INTO `activity` VALUES ('1068', '4', '10', '6', 'Time remain+0+0', '2014-07-21 14:34:04', '1');
INSERT INTO `activity` VALUES ('1069', '4', '10', '6', 'Time remain+1+1', '2014-07-21 14:34:21', '1');
INSERT INTO `activity` VALUES ('1070', '3', '12', '2', '10+6', '2014-07-21 14:34:30', '1');
INSERT INTO `activity` VALUES ('1071', '4', '10', '6', 'Time remain+3+3', '2014-07-21 14:35:14', '1');
INSERT INTO `activity` VALUES ('1072', '3', '12', '2', '10+6', '2014-07-21 14:35:25', '1');
INSERT INTO `activity` VALUES ('1073', '3', '12', '2', '10+6', '2014-07-21 14:37:26', '1');
INSERT INTO `activity` VALUES ('1074', '3', '12', '2', '10+6', '2014-07-21 14:38:18', '1');
INSERT INTO `activity` VALUES ('1075', '2', '12', '2', '28+6', '2014-07-21 15:49:59', '1');
INSERT INTO `activity` VALUES ('1076', '5', '28', '6', '', '2014-07-21 15:49:59', '1');
INSERT INTO `activity` VALUES ('1077', '2', '12', '2', '29+6', '2014-07-21 15:51:38', '1');
INSERT INTO `activity` VALUES ('1078', '5', '29', '6', '', '2014-07-21 15:51:38', '1');
INSERT INTO `activity` VALUES ('1079', '2', '12', '2', '30+6', '2014-07-21 15:54:19', '1');
INSERT INTO `activity` VALUES ('1080', '5', '30', '6', '', '2014-07-21 15:54:19', '1');
INSERT INTO `activity` VALUES ('1081', '2', '12', '2', '31+6', '2014-07-21 15:56:29', '1');
INSERT INTO `activity` VALUES ('1082', '5', '31', '6', '', '2014-07-21 15:56:29', '1');
INSERT INTO `activity` VALUES ('1083', '2', '12', '2', '32+6', '2014-07-21 15:59:49', '1');
INSERT INTO `activity` VALUES ('1084', '5', '32', '6', '', '2014-07-21 15:59:49', '1');
INSERT INTO `activity` VALUES ('1085', '2', '12', '2', '33+6', '2014-07-21 16:02:39', '1');
INSERT INTO `activity` VALUES ('1086', '5', '33', '6', '', '2014-07-21 16:02:39', '1');
INSERT INTO `activity` VALUES ('1087', '2', '12', '2', '34+6', '2014-07-21 16:04:43', '1');
INSERT INTO `activity` VALUES ('1088', '5', '34', '6', '', '2014-07-21 16:04:43', '1');
INSERT INTO `activity` VALUES ('1089', '4', '34', '6', 'Status+To do+In Progress', '2014-07-21 16:05:20', '1');
INSERT INTO `activity` VALUES ('1090', '4', '18', '6', 'Status+Done+To test', '2014-07-21 16:05:31', '1');
INSERT INTO `activity` VALUES ('1091', '2', '12', '2', '35+6', '2014-07-21 16:05:55', '1');
INSERT INTO `activity` VALUES ('1092', '5', '35', '6', '', '2014-07-21 16:05:55', '1');
INSERT INTO `activity` VALUES ('1093', '4', '35', '6', 'Status+To do+In Progress', '2014-07-21 16:06:29', '1');
INSERT INTO `activity` VALUES ('1094', '4', '33', '6', 'Status+To do+To test', '2014-07-21 16:09:47', '1');
INSERT INTO `activity` VALUES ('1095', '4', '35', '6', 'Status+In Progress+To test', '2014-07-21 16:19:18', '1');
INSERT INTO `activity` VALUES ('1096', '4', '34', '6', 'Status+In Progress+To test', '2014-07-21 16:19:22', '1');
INSERT INTO `activity` VALUES ('1097', '4', '34', '6', 'Status+To test+In Progress', '2014-07-21 16:19:25', '1');
INSERT INTO `activity` VALUES ('1098', '2', '12', '2', '36+6', '2014-07-22 08:01:24', '1');
INSERT INTO `activity` VALUES ('1099', '5', '36', '6', '', '2014-07-22 08:01:24', '1');
INSERT INTO `activity` VALUES ('1100', '2', '12', '2', '37+6', '2014-07-22 08:02:43', '1');
INSERT INTO `activity` VALUES ('1101', '5', '37', '6', '', '2014-07-22 08:02:43', '1');
INSERT INTO `activity` VALUES ('1102', '4', '34', '6', 'Status+In Progress+To test', '2014-07-22 08:50:55', '1');
INSERT INTO `activity` VALUES ('1103', '4', '10', '6', 'Status+In Progress+To test', '2014-07-22 08:54:43', '1');
INSERT INTO `activity` VALUES ('1104', '4', '10', '6', 'Status+To test+In Progress', '2014-07-22 08:57:06', '1');
INSERT INTO `activity` VALUES ('1105', '4', '33', '6', 'Status+To test+In Progress', '2014-07-22 08:57:43', '1');
INSERT INTO `activity` VALUES ('1106', '4', '34', '6', 'Status+To test+In Progress', '2014-07-22 08:58:33', '1');
INSERT INTO `activity` VALUES ('1107', '4', '35', '6', 'Status+To test+In Progress', '2014-07-22 08:58:59', '1');
INSERT INTO `activity` VALUES ('1108', '2', '8', '4', '33+2', '2014-07-22 09:39:13', '1');
INSERT INTO `activity` VALUES ('1109', '2', '18', '3', '33+2', '2014-07-22 09:39:13', '1');
INSERT INTO `activity` VALUES ('1110', '2', '8', '4', '34+2', '2014-07-22 09:39:17', '1');
INSERT INTO `activity` VALUES ('1111', '2', '18', '3', '34+2', '2014-07-22 09:39:18', '1');
INSERT INTO `activity` VALUES ('1112', '4', '18', '6', 'Status+To test+In Progress', '2014-07-22 09:39:34', '1');
INSERT INTO `activity` VALUES ('1113', '4', '18', '6', 'Status+In Progress+To test', '2014-07-22 09:39:46', '1');
INSERT INTO `activity` VALUES ('1114', '4', '10', '6', 'Status+In Progress+To test', '2014-07-22 09:40:20', '1');
INSERT INTO `activity` VALUES ('1115', '4', '33', '6', 'Status+In Progress+To test', '2014-07-22 09:51:34', '1');
INSERT INTO `activity` VALUES ('1116', '4', '35', '6', 'Status+In Progress+To test', '2014-07-22 09:53:13', '1');
INSERT INTO `activity` VALUES ('1117', '4', '34', '6', 'Status+In Progress+To test', '2014-07-22 09:54:33', '1');
INSERT INTO `activity` VALUES ('1118', '4', '10', '6', 'Status+To test+In Progress', '2014-07-22 09:56:30', '1');
INSERT INTO `activity` VALUES ('1119', '4', '35', '6', 'Status+To test+In Progress', '2014-07-22 09:57:11', '1');
INSERT INTO `activity` VALUES ('1120', '4', '33', '6', 'Status+To test+In Progress', '2014-07-22 10:00:45', '1');
INSERT INTO `activity` VALUES ('1121', '4', '18', '6', 'Status+To test+In Progress', '2014-07-22 10:04:22', '1');
INSERT INTO `activity` VALUES ('1122', '4', '34', '6', 'Status+To test+In Progress', '2014-07-22 10:05:35', '1');
INSERT INTO `activity` VALUES ('1123', '4', '10', '6', 'Status+In Progress+To test', '2014-07-22 10:05:51', '1');
INSERT INTO `activity` VALUES ('1124', '4', '18', '6', 'Status+In Progress+To test', '2014-07-22 10:05:55', '1');
INSERT INTO `activity` VALUES ('1125', '4', '33', '6', 'Status+In Progress+To test', '2014-07-22 10:05:59', '1');
INSERT INTO `activity` VALUES ('1126', '4', '28', '6', 'Status+To do+To test', '2014-07-22 10:08:24', '1');
INSERT INTO `activity` VALUES ('1127', '3', '1', '1', '12+4', '2014-07-22 13:27:27', '1');
INSERT INTO `activity` VALUES ('1128', '3', '1', '1', '11+4', '2014-07-22 13:29:19', '1');
INSERT INTO `activity` VALUES ('1129', '2', '14', '4', '30+2', '2014-07-22 13:29:28', '1');
INSERT INTO `activity` VALUES ('1130', '2', '45', '3', '30+2', '2014-07-22 13:29:28', '1');
INSERT INTO `activity` VALUES ('1131', '3', '1', '1', '14+4', '2014-07-22 13:29:36', '1');
INSERT INTO `activity` VALUES ('1132', '2', '10', '4', '30+2', '2014-07-22 13:29:44', '1');
INSERT INTO `activity` VALUES ('1133', '2', '18', '3', '30+2', '2014-07-22 13:29:44', '1');
INSERT INTO `activity` VALUES ('1134', '2', '13', '4', '35+2', '2014-07-22 13:29:48', '1');
INSERT INTO `activity` VALUES ('1135', '2', '18', '3', '35+2', '2014-07-22 13:29:48', '1');
INSERT INTO `activity` VALUES ('1136', '3', '10', '4', '35+2', '2014-07-22 13:29:48', '1');
INSERT INTO `activity` VALUES ('1137', '3', '45', '3', '35+2', '2014-07-22 13:29:48', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `comment` VALUES ('168', '1', '22', '1', 'test asdf asf asdf asdf', null, '2014-07-14 17:28:05');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `peid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`peid`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'Quản lí tiệc cưới', '2014-06-10', '2014-08-27', null, '', '1', '', '0');
INSERT INTO `project` VALUES ('2', 'Quản lí nhân sự', '2014-04-02', '2014-05-30', null, '', '1', '', '0');
INSERT INTO `project` VALUES ('6', 'Quản lí khách sạn', '2014-06-10', '2014-06-26', null, '', '1', '', '0');
INSERT INTO `project` VALUES ('9', 'Game bắn súng', '2014-06-01', '2014-06-30', null, '', '1', '', '0');
INSERT INTO `project` VALUES ('14', 'bbbbbbbbbbbb', '2014-07-12', '2014-07-12', null, '', '1', '', '0');
INSERT INTO `project` VALUES ('15', 'bbbbbbbbbbbb', null, null, null, null, null, null, '1');
INSERT INTO `project` VALUES ('16', 'bbbbbbbbbbbb', null, null, null, null, null, null, '1');
INSERT INTO `project` VALUES ('17', 'bbbbbbbbbbbb', null, null, null, null, null, null, '1');
INSERT INTO `project` VALUES ('18', 'bbbbbbbbbbbb', null, null, null, null, null, null, '1');
INSERT INTO `project` VALUES ('19', 'bbbbbbbbbbbb', null, null, null, null, null, null, '1');
INSERT INTO `project` VALUES ('20', 'bbbbbbbbbbbb', null, null, null, null, null, null, '1');
INSERT INTO `project` VALUES ('21', 'bbbbbbbbbbbb', null, null, null, null, null, null, '1');
INSERT INTO `project` VALUES ('22', 'aaaaaaaaaa', '2014-07-18', '2014-07-18', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('23', 'ssssssssssssssssssssssssssssssssssss', '2014-07-18', '2014-07-18', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('24', 'ssssssssssssssssssssss', '2014-07-18', '2014-07-18', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('25', 'ttttttttttttttt', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('26', 'bbbbbbbbbbbbbbbbbb', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('27', 'aaaaaaaaaaaaaa', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('28', 'ffffffffffffff', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('29', 'rrrrrrrrrrrrrrrrrrrrr', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('30', 'uuuuuuuuuuuuuuuuuuuuuu', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('31', '11111111111rrrrrrcccccc', '2014-07-19', '2014-07-19', null, '', '-1', '', '1');
INSERT INTO `project` VALUES ('32', 'dddddddddddddd', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('33', '2222222222222222', '2014-07-19', '2014-07-31', null, '', '0', '', '1');
INSERT INTO `project` VALUES ('34', 'cccccccccccccccccccccc', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('35', 'ccccccccccccccccccccccccc', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('36', 'aaaaaaaaaaaaaa', '2014-07-19', '2014-07-19', null, '', '-1', '', '0');
INSERT INTO `project` VALUES ('37', '33333333333333', '2014-07-19', '2014-07-19', null, '', '-1', '', '1');

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
INSERT INTO `project_user` VALUES ('1', '5', '18', '3');
INSERT INTO `project_user` VALUES ('1', '6', '18', '3');
INSERT INTO `project_user` VALUES ('1', '21', '17', '3');
INSERT INTO `project_user` VALUES ('2', '1', '0', '1');
INSERT INTO `project_user` VALUES ('1', '1', '0', '1');
INSERT INTO `project_user` VALUES ('1', '12', '17', '3');
INSERT INTO `project_user` VALUES ('1', '11', '17', '3');
INSERT INTO `project_user` VALUES ('1', '22', '45', '2');
INSERT INTO `project_user` VALUES ('1', '27', '45', '3');
INSERT INTO `project_user` VALUES ('1', '13', '45', '3');
INSERT INTO `project_user` VALUES ('1', '14', '17', '3');
INSERT INTO `project_user` VALUES ('1', '8', '18', '3');
INSERT INTO `project_user` VALUES ('1', '4', '18', '3');
INSERT INTO `project_user` VALUES ('1', '28', '17', '3');
INSERT INTO `project_user` VALUES ('1', '7', '18', '3');
INSERT INTO `project_user` VALUES ('1', '9', '17', '3');

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
INSERT INTO `role_permission` VALUES ('1', '76');
INSERT INTO `role_permission` VALUES ('1', '77');
INSERT INTO `role_permission` VALUES ('1', '78');
INSERT INTO `role_permission` VALUES ('1', '79');
INSERT INTO `role_permission` VALUES ('1', '80');
INSERT INTO `role_permission` VALUES ('1', '82');
INSERT INTO `role_permission` VALUES ('2', '3');
INSERT INTO `role_permission` VALUES ('2', '4');
INSERT INTO `role_permission` VALUES ('2', '5');
INSERT INTO `role_permission` VALUES ('2', '6');
INSERT INTO `role_permission` VALUES ('2', '7');
INSERT INTO `role_permission` VALUES ('2', '8');
INSERT INTO `role_permission` VALUES ('2', '9');
INSERT INTO `role_permission` VALUES ('2', '12');
INSERT INTO `role_permission` VALUES ('2', '19');
INSERT INTO `role_permission` VALUES ('2', '22');
INSERT INTO `role_permission` VALUES ('2', '23');
INSERT INTO `role_permission` VALUES ('2', '24');
INSERT INTO `role_permission` VALUES ('2', '25');
INSERT INTO `role_permission` VALUES ('2', '27');
INSERT INTO `role_permission` VALUES ('2', '28');
INSERT INTO `role_permission` VALUES ('2', '29');
INSERT INTO `role_permission` VALUES ('2', '30');
INSERT INTO `role_permission` VALUES ('2', '38');
INSERT INTO `role_permission` VALUES ('2', '47');
INSERT INTO `role_permission` VALUES ('2', '48');
INSERT INTO `role_permission` VALUES ('2', '49');
INSERT INTO `role_permission` VALUES ('2', '53');
INSERT INTO `role_permission` VALUES ('2', '55');
INSERT INTO `role_permission` VALUES ('2', '59');
INSERT INTO `role_permission` VALUES ('2', '60');
INSERT INTO `role_permission` VALUES ('2', '70');
INSERT INTO `role_permission` VALUES ('2', '71');
INSERT INTO `role_permission` VALUES ('2', '72');
INSERT INTO `role_permission` VALUES ('2', '73');
INSERT INTO `role_permission` VALUES ('2', '74');
INSERT INTO `role_permission` VALUES ('2', '75');
INSERT INTO `role_permission` VALUES ('2', '77');
INSERT INTO `role_permission` VALUES ('2', '78');
INSERT INTO `role_permission` VALUES ('2', '82');
INSERT INTO `role_permission` VALUES ('3', '3');
INSERT INTO `role_permission` VALUES ('3', '4');
INSERT INTO `role_permission` VALUES ('3', '5');
INSERT INTO `role_permission` VALUES ('3', '6');
INSERT INTO `role_permission` VALUES ('3', '7');
INSERT INTO `role_permission` VALUES ('3', '8');
INSERT INTO `role_permission` VALUES ('3', '12');
INSERT INTO `role_permission` VALUES ('3', '19');
INSERT INTO `role_permission` VALUES ('3', '22');
INSERT INTO `role_permission` VALUES ('3', '23');
INSERT INTO `role_permission` VALUES ('3', '24');
INSERT INTO `role_permission` VALUES ('3', '25');
INSERT INTO `role_permission` VALUES ('3', '27');
INSERT INTO `role_permission` VALUES ('3', '28');
INSERT INTO `role_permission` VALUES ('3', '29');
INSERT INTO `role_permission` VALUES ('3', '30');
INSERT INTO `role_permission` VALUES ('3', '38');
INSERT INTO `role_permission` VALUES ('3', '47');
INSERT INTO `role_permission` VALUES ('3', '48');
INSERT INTO `role_permission` VALUES ('3', '49');
INSERT INTO `role_permission` VALUES ('3', '53');
INSERT INTO `role_permission` VALUES ('3', '55');
INSERT INTO `role_permission` VALUES ('3', '59');
INSERT INTO `role_permission` VALUES ('3', '71');
INSERT INTO `role_permission` VALUES ('3', '74');
INSERT INTO `role_permission` VALUES ('3', '77');
INSERT INTO `role_permission` VALUES ('3', '78');
INSERT INTO `role_permission` VALUES ('3', '82');
INSERT INTO `role_permission` VALUES ('4', '3');
INSERT INTO `role_permission` VALUES ('4', '4');
INSERT INTO `role_permission` VALUES ('4', '5');
INSERT INTO `role_permission` VALUES ('4', '12');
INSERT INTO `role_permission` VALUES ('4', '20');
INSERT INTO `role_permission` VALUES ('4', '21');
INSERT INTO `role_permission` VALUES ('4', '22');
INSERT INTO `role_permission` VALUES ('4', '23');
INSERT INTO `role_permission` VALUES ('4', '24');
INSERT INTO `role_permission` VALUES ('4', '26');
INSERT INTO `role_permission` VALUES ('4', '27');
INSERT INTO `role_permission` VALUES ('4', '28');
INSERT INTO `role_permission` VALUES ('4', '29');
INSERT INTO `role_permission` VALUES ('4', '30');
INSERT INTO `role_permission` VALUES ('4', '38');
INSERT INTO `role_permission` VALUES ('4', '48');
INSERT INTO `role_permission` VALUES ('4', '53');
INSERT INTO `role_permission` VALUES ('4', '54');
INSERT INTO `role_permission` VALUES ('4', '55');
INSERT INTO `role_permission` VALUES ('4', '59');
INSERT INTO `role_permission` VALUES ('4', '71');
INSERT INTO `role_permission` VALUES ('4', '74');
INSERT INTO `role_permission` VALUES ('4', '78');
INSERT INTO `role_permission` VALUES ('4', '82');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sprint
-- ----------------------------
INSERT INTO `sprint` VALUES ('8', '1', 'Sprint 1', '', '2014-07-21', '2014-06-24', '2', '0', '2014-06-10', '2014-07-10');
INSERT INTO `sprint` VALUES ('9', '1', 'Sprint 2', '', '0000-00-00', '0000-00-00', '1', '0', '2014-07-21', '2014-08-21');
INSERT INTO `sprint` VALUES ('10', '1', 'Sprint 3', '', '0000-00-00', '0000-00-00', '1', '0', '2014-08-21', '2014-09-21');
INSERT INTO `sprint` VALUES ('11', '1', 'Sprint 4', '', '0000-00-00', '0000-00-00', '1', '1', '2014-09-22', '2014-10-21');
INSERT INTO `sprint` VALUES ('12', '1', '2222222222222', '', '0000-00-00', '0000-00-00', '1', '1', '2014-11-01', '2014-11-01');
INSERT INTO `sprint` VALUES ('13', '1', 'aaaaaaaaaaa', '', '0000-00-00', '0000-00-00', '1', '0', '2014-11-02', '2014-11-02');
INSERT INTO `sprint` VALUES ('14', '1', 'ccccccccccccc', '', '0000-00-00', '0000-00-00', '1', '1', '2014-11-04', '2014-11-04');

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
INSERT INTO `sprint_team` VALUES ('8', '18', '20');
INSERT INTO `sprint_team` VALUES ('8', '45', '10');
INSERT INTO `sprint_team` VALUES ('9', '17', '10');
INSERT INTO `sprint_team` VALUES ('9', '18', '10');
INSERT INTO `sprint_team` VALUES ('9', '45', '0');
INSERT INTO `sprint_team` VALUES ('10', '17', '4');
INSERT INTO `sprint_team` VALUES ('10', '18', '2');
INSERT INTO `sprint_team` VALUES ('10', '45', '0');
INSERT INTO `sprint_team` VALUES ('13', '17', '0');
INSERT INTO `sprint_team` VALUES ('13', '18', '0');
INSERT INTO `sprint_team` VALUES ('13', '45', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of story
-- ----------------------------
INSERT INTO `story` VALUES ('1', '1', '1', 'Quán lí danh sách món ăn', '3', '11', '30', 'demoaddd', 'description', '6', '1', '2014-06-15 09:45:47', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('2', '1', '1', 'story 2', '1', '12', '20', 'demoa', 'description', '8', '1', '2014-06-16 09:39:41', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('4', '1', '1', 'story 4', '2', '19', '40', 'asdfa', 'asdf', '8', '1', '2014-06-17 09:39:49', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('5', '1', '1', 'story 5', '2', '15', '50', 'asdfff', 'asdf', '6', '1', '2014-06-18 09:39:58', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('6', '1', '1', 'story 6', '2', '4', '60', 'asfdd', 'sadfasdfsdf', '2', '1', '2014-06-19 09:40:31', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('7', '1', '1', 'story 7', '2', '2', '10', 'asfd', 'sadfasdfsdf', '8', '1', '2014-06-20 09:38:41', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('8', '1', '1', 'story 8', '1', '2', '90', 'asdf', 'sf', '1', '1', '2014-06-25 22:50:59', '2014-06-19 22:51:09');
INSERT INTO `story` VALUES ('9', '1', '1', 'story 9', '1', '12', '40', 'asdf', 'sf', '1', '1', '2014-07-03 22:51:04', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('10', '1', '1', 'Quản lí đặt bàn ăn', '1', '3', '100', 'asdfasdfw', 'asdfasdf', '2', '0', '2014-06-22 09:42:37', '2014-06-13 22:51:09');
INSERT INTO `story` VALUES ('11', '1', '1', 'Quản lí đơn hàng hóa', '1', '3', '23', 'asf', 'asf', '4', '0', '2014-06-20 22:51:06', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('12', '1', '1', 'Quản lí dụng cụ nhà bếp nấu ăn', '3', '94', '10', 'asf', 'asf', '5', '0', '2014-06-10 22:51:09', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('13', '1', '1', 'Thống kê bán hàng hàng tuần', '2', '5', '54', 'asf', 'asf', '3', '0', '2014-06-18 22:51:11', '2014-06-11 22:51:09');
INSERT INTO `story` VALUES ('14', '1', '1', 'story 14', '4', '2', '34', 'asfd', 'sdfsaf', '1', '1', '2014-06-28 22:51:16', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('15', '2', '1', 'Quản lí phòng ban aa', '2', '4', '56', 'asdf', 'asdf', '1', '0', '2014-06-27 22:51:19', '2014-06-27 22:51:09');
INSERT INTO `story` VALUES ('19', '1', '1', 'story 16', '1', '4', '4', 'a', 'a', '1', '1', '2014-06-19 22:51:22', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('20', '1', '1', 'story 17', '2', '2', '11', 'a', 'a', '1', '1', '2014-06-10 22:51:24', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('22', '1', '1', 'story 18', '2', '5', '5', 'asdfasdf', 'asdfasdf', '1', '1', '2014-06-22 09:51:08', '2014-06-10 22:51:09');
INSERT INTO `story` VALUES ('23', '1', '1', 'Quản lí khách hàng', '1', '5', '20', 'a', 'a', '5', '0', null, null);
INSERT INTO `story` VALUES ('24', '1', '1', 'Tính năng report', '3', '0', '0', 'a', 'a', '1', '1', null, null);
INSERT INTO `story` VALUES ('25', '1', '1', 'Tính năng report', '3', '10', '30', 'a', 'a', '2', '0', null, null);
INSERT INTO `story` VALUES ('26', '1', '1', 'Nâng cấp tính năng report hàng tuần', '1', '10', '20', 'aaaaaaa', 'aaaaaaaaaaaa', '5', '0', null, null);
INSERT INTO `story` VALUES ('27', '1', '1', 'Quản lí album ảnh', '2', '0', '0', 'aaaaaaa', 'aaaaaaaaaaaaaa', '2', '0', null, null);
INSERT INTO `story` VALUES ('28', '1', '1', 'Quản lí thực đơn', '2', '10', '0', 'aaaa', 'aaaaaaaaaaaa', '2', '0', null, null);
INSERT INTO `story` VALUES ('29', '1', '1', 'Bổ sung quản lí món ăn', '2', '0', '0', 'aaaa', 'aaaaaaaaaaaa', '2', '0', null, null);
INSERT INTO `story` VALUES ('30', '1', '1', 'Quản lí tiền bạc', '2', '2', '1', 'ddddddddddd', 'ddddddddddddd', '4', '0', null, null);
INSERT INTO `story` VALUES ('31', '1', '1', 'Quản li kho địa điểm', '3', '2', '10', 'aaaaaaaaaaaaa', 'aaaaaaaa', '4', '0', null, null);
INSERT INTO `story` VALUES ('32', '1', '1', 'aaaaaaaaaaaaaa', '3', null, null, 's', 's', '2', '1', null, null);
INSERT INTO `story` VALUES ('33', '1', '1', 'Quản lí dụng cụ nấu ăn', '2', '10', '20', 'aaaaaaaaa', 'aaaaaaaaaaaaaa', '4', '0', null, null);
INSERT INTO `story` VALUES ('34', '1', '1', 'Quản lí đặt xe chở cô dâu', '2', '10', '50', 'aaaaaaaaaa', 'dddddddddddd', '4', '0', null, null);
INSERT INTO `story` VALUES ('35', '1', '1', 'Xuất file excel', '3', '2', '10', 'aa', 'aa', '4', '0', null, null);

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
INSERT INTO `story_team` VALUES ('10', '18', '9', '1');
INSERT INTO `story_team` VALUES ('23', '45', '8', '0');
INSERT INTO `story_team` VALUES ('25', '45', '9', '0');
INSERT INTO `story_team` VALUES ('26', '17', '8', '1');
INSERT INTO `story_team` VALUES ('30', '17', '11', '0');
INSERT INTO `story_team` VALUES ('30', '18', '10', '0');
INSERT INTO `story_team` VALUES ('30', '45', '14', '0');
INSERT INTO `story_team` VALUES ('31', '17', '9', '1');
INSERT INTO `story_team` VALUES ('33', '18', '8', '0');
INSERT INTO `story_team` VALUES ('34', '18', '8', '0');
INSERT INTO `story_team` VALUES ('35', '18', '13', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', 'task 1', '1', '0', '4', '2014-06-02 00:00:00', '1', 'task description here', '7', '1', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('2', 'task 2', '44', '0', '4', '2014-06-02 00:00:00', '1', 'task description here', '1', '1', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('3', 'task 3', '1', '0', '4', '2014-06-03 05:12:30', '1', 'task description here', '7', '10', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('4', 'task 4 ', '3', '0', '4', '2014-06-03 05:12:30', '1', 'task description here', '7', '11', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('5', 'task 5', '1', '0', '4', '2014-06-03 05:12:48', '1', 'task description here', '7', '12', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('6', 'task 6', '5', '0', '2', '2014-06-03 05:12:48', '1', 'task description here', '15', '13', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('7', 'task 7', '1', '0', '4', '2014-06-03 05:14:19', '1', 'task description here', '15', '1', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('8', 'task 8', '5', '0', '2', '2014-06-03 05:14:20', '1', 'task description here', '15', '10', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('9', 'task 9', '2', '0', '2', '2014-06-03 05:18:12', '1', 'task description here', '7', '11', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('10', 'task 10', '3', '0', '3', '2014-06-03 05:18:12', '1', 'task description here', '4', '12', '2014-07-14 10:03:07', '0', '4');
INSERT INTO `task` VALUES ('11', 'task 11', '7', '0', '3', '2014-06-03 05:19:04', '1', 'task description here', '13', '13', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('12', 'task 12', '6', '0', '1', '2014-06-03 05:19:04', '1', 'task description here', '1', '13', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('13', 'task 13', '3', '0', '4', '2014-06-03 05:27:53', '1', 'task description here', '7', '12', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('14', 'task 14', '3', '0', '4', '2014-06-03 05:27:53', '1', 'task description here', '1', '11', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('15', 'task 15', '5', '0', '1', '2014-06-03 14:21:30', '1', 'task description here', '13', '10', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('16', 'task 16', '1', '0', '4', '2014-06-03 14:21:30', '1', 'task description here', '12', '1', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('17', 'task 17', '6', '0', '4', '2014-06-03 21:35:57', '1', 'task description here', '13', '11', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('18', 'task 18', '1', '0', '3', '2014-06-03 21:35:58', '1', 'task description here', '1', '12', '2014-07-14 10:03:07', '0', '1');
INSERT INTO `task` VALUES ('19', 'task 19', '1', '0', '2', '2014-06-03 21:45:10', '1', 'task description here', '12', '13', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('20', 'task 20', '1', '0', '1', '2014-06-03 21:45:11', '1', 'task description here', '23', '10', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('27', 'Task 19', '4', '0', '4', '2014-06-21 20:38:49', '1', '', '12', '1', '2014-07-14 10:03:07', '0', '0');
INSERT INTO `task` VALUES ('28', 'abc', '3', '0', '3', '2014-07-21 15:49:58', '1', '', '6', '12', null, '0', '3');
INSERT INTO `task` VALUES ('29', 'bac', '2', '2', '1', '2014-07-21 15:51:36', '1', '', null, '12', null, '0', '0');
INSERT INTO `task` VALUES ('30', 'abcdd', '2', '2', '1', '2014-07-21 15:54:19', '1', '', null, '12', null, '0', '0');
INSERT INTO `task` VALUES ('31', 'ttttttttttt', '2', '2', '1', '2014-07-21 15:56:28', '1', '', null, '12', null, '0', '0');
INSERT INTO `task` VALUES ('32', 'ssssssssssssss', '3', '3', '1', '2014-07-21 15:59:49', '1', '', null, '12', null, '0', '0');
INSERT INTO `task` VALUES ('33', 'rrrrrrrrr', '3', '0', '3', '2014-07-21 16:02:39', '1', '', '3', '12', null, '0', '2');
INSERT INTO `task` VALUES ('34', 'gggggggggggggggg', '3', '0', '2', '2014-07-21 16:04:42', '1', '', '5', '12', null, '0', '2');
INSERT INTO `task` VALUES ('35', '2', '33', '0', '2', '2014-07-21 16:05:55', '1', '', '6', '12', null, '0', '5');
INSERT INTO `task` VALUES ('36', '333333', '33', '33', '1', '2014-07-22 08:01:24', '1', '', null, '12', null, '0', '0');
INSERT INTO `task` VALUES ('37', 'eeeeeeeeeeeeeeee', '2', '2', '1', '2014-07-22 08:02:43', '1', '', null, '12', null, '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('17', 'team 1', '1', '', '0');
INSERT INTO `team` VALUES ('18', 'team 2', '1', '', '0');
INSERT INTO `team` VALUES ('45', 'team 3', '1', '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 1', '2014-05-10', 'avatar-meo-396882118.jpg', null, 'WrnIDW6xqZ775yFNotP0ddK3qM8p27qRua7PZtEMOhbiok0gZcbvAIaaXaRR', 'en', 'US', '0');
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
INSERT INTO `user` VALUES ('15', 'leader8', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'leader 8', '2014-05-28', 'default-avatar.jpg', '-6.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('21', 'duong', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Duong', '2014-05-16', 'default-avatar.jpg', '-5.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('22', 'yoko', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Yoko', '2014-05-14', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('23', 'mika', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Mika', '2014-05-14', 'default-avatar.jpg', '-7.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('24', '222', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', '11111', '2014-06-12', 'default-avatar.jpg', '-10.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('25', 'cccc', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'cvccc', '2014-06-18', 'default-avatar.jpg', '-11.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('26', 'aaaa', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'testaaa', '2014-06-06', 'default-avatar.jpg', '-10.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('27', 'aaa', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'testa', '2014-06-05', 'default-avatar.jpg', '-12.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('28', 'javav', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Jajaa', '2014-07-16', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('29', 'tuant', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Tuan Trang', '2014-07-16', 'default-avatar.jpg', '-8.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('30', 'namaaa', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'Nam aaa', '2014-07-09', 'default-avatar.jpg', '-6.0', null, 'en', null, '0');
INSERT INTO `user` VALUES ('31', 'ttttttttttttt', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'ttttttttttttttt', '2014-07-10', 'default-avatar.jpg', '-7.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('32', 'aaaaaaaa', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'aaaaaaaaaaaa', '2014-07-04', 'default-avatar.jpg', '-7.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('33', 'ccccccccccc', '$2y$10$TAwoAmHfmXBdCCThigqxIeqdB9N32cRlp0J.jFjblZ6EwDibEIt1O', 'cccccccccccccc', '2014-07-03', 'default-avatar.jpg', '-5.0', null, 'en', null, '1');
INSERT INTO `user` VALUES ('34', 'phamduong', '$2y$10$Nd4NNh3kBMTWgbUN2C9LUehRR4NAnl3hUkOs9AicF3p8MmFGGns6W', 'Pham Duong', '2014-07-09', 'default-avatar.jpg', '-9.0', 'OosGTbqbPqY8yKxEqX8UlesmCvjq9TqnQeNWR9zzttUtS2aovfNGuSNdLYxk', 'en', null, '0');
