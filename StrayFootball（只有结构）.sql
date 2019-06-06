/*
Navicat MySQL Data Transfer

Source Server         : linux
Source Server Version : 50562
Source Host           : 192.168.31.189:3306
Source Database       : StrayFootball

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-06-06 13:00:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for games
-- ----------------------------
DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '赛事名称',
  `party_a` int(255) DEFAULT NULL COMMENT '比赛甲方',
  `party_b` int(255) DEFAULT NULL COMMENT '比赛乙方',
  `winner` int(255) DEFAULT NULL COMMENT '获胜方',
  `state` varchar(255) DEFAULT NULL COMMENT '状态:“00”未开始,“01”已结束',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `score` varchar(255) DEFAULT NULL COMMENT '比分',
  `time` datetime DEFAULT NULL COMMENT '比赛日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for member_token
-- ----------------------------
DROP TABLE IF EXISTS `member_token`;
CREATE TABLE `member_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `exp_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '球队名称',
  `number` int(11) DEFAULT NULL COMMENT '人数',
  `introduction` varchar(255) DEFAULT NULL COMMENT '球队简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for test_physical
-- ----------------------------
DROP TABLE IF EXISTS `test_physical`;
CREATE TABLE `test_physical` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `height` varchar(18) DEFAULT NULL COMMENT '身高',
  `weight` varchar(18) DEFAULT NULL COMMENT '体重',
  `blood_pressure` varchar(255) DEFAULT NULL COMMENT '血压',
  `vital_capacity` varchar(255) DEFAULT NULL COMMENT '肺活量',
  `endurance` varchar(255) DEFAULT NULL COMMENT '耐力',
  `body_fat` varchar(255) DEFAULT NULL COMMENT '体脂',
  `meters_dash_time` varchar(255) DEFAULT NULL COMMENT '100米短跑所需时间',
  `arm_exhibition` varchar(255) DEFAULT NULL COMMENT '臂展',
  `body_condition` varchar(11) DEFAULT NULL COMMENT '身体状况“00” 亚健康，"01"良好，02 优',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for training_plan
-- ----------------------------
DROP TABLE IF EXISTS `training_plan`;
CREATE TABLE `training_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '训练内容',
  `time` datetime DEFAULT NULL COMMENT '训练时间',
  `type` varchar(255) DEFAULT NULL COMMENT '类型:"00"课训练，“01”周训练，“02”月训练',
  `end` bit(1) DEFAULT NULL COMMENT '是否结束 true 结束，false 未结束',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `roles_id` int(11) DEFAULT NULL COMMENT '角色id',
  `team_id` int(11) DEFAULT NULL COMMENT '球队id',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `account` varchar(255) DEFAULT NULL COMMENT '账户',
  `image` varchar(255) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_train
-- ----------------------------
DROP TABLE IF EXISTS `user_train`;
CREATE TABLE `user_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_plan_id` int(255) DEFAULT NULL COMMENT '训练项目id',
  `user_id` int(11) DEFAULT NULL COMMENT '球员id',
  `marks` double(255,0) DEFAULT NULL COMMENT '得分',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
