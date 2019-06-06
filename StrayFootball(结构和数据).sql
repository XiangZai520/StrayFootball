/*
Navicat MySQL Data Transfer

Source Server         : linux
Source Server Version : 50562
Source Host           : 192.168.31.189:3306
Source Database       : StrayFootball

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-06-06 13:01:37
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
-- Records of games
-- ----------------------------
INSERT INTO `games` VALUES ('1', '曼联大战皇家马德里', '1', '11', '0', '00', '2019-06-04 16:01:32', '', '2019-06-29 16:01:26');
INSERT INTO `games` VALUES ('2', '皇马VS英格兰国家队', '11', '9', '11', '01', '2019-06-04 16:02:18', '4：3', '2019-06-04 16:02:13');
INSERT INTO `games` VALUES ('3', '皇马大战阿根廷', '11', '6', '6', '01', '2019-06-04 16:05:40', '5：7', '2019-06-05 16:03:01');
INSERT INTO `games` VALUES ('4', '流浪者再次取胜', '12', '1', '12', '01', '2019-06-05 09:42:30', '5：3', '2019-06-05 09:42:27');
INSERT INTO `games` VALUES ('5', '十一国庆大战', '12', '11', '0', '00', '2019-06-05 09:43:14', '', '2019-10-01 09:42:58');
INSERT INTO `games` VALUES ('6', '流浪者一匹黑马', '12', '6', '12', '01', '2019-06-05 09:43:49', '4：3', '2019-06-04 09:43:42');
INSERT INTO `games` VALUES ('7', 'ac米兰 大战 阿根廷', '2', '6', '2', '01', '2019-06-06 12:51:42', '4：2', '2019-06-27 12:51:28');

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
-- Records of member_token
-- ----------------------------

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
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '教练员');
INSERT INTO `roles` VALUES ('2', '球员');
INSERT INTO `roles` VALUES ('3', '队医');
INSERT INTO `roles` VALUES ('4', '管理员');

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
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('1', '曼联', '18', '曼彻斯特联足球俱乐部位于英国英格兰西北区曼彻斯特郡曼彻斯特市，英文名');
INSERT INTO `team` VALUES ('2', 'AC米兰', '48', '1899年12月16日，一群聚集在杜诺德（Dunawd）宾馆房间里的球迷成立了一家体育俱乐部—米兰板球和足球俱乐部，创始人为阿尔弗雷德·爱德华兹。此后历经了百年风风雨雨，AC米兰发展成为今天世界上最伟大的球队之一。');
INSERT INTO `team` VALUES ('3', '乌拉圭', '34', '乌拉圭东岸共和国（西班牙语：RepúblicaOrientaldelUruguay；英语：TheOrientalRepublicofUruguay），简称乌拉圭。位于南美洲的东南部，乌拉圭河与拉普拉塔河的东岸');
INSERT INTO `team` VALUES ('4', '巴西国家男子足球队', '50', '巴西国家男子足球队');
INSERT INTO `team` VALUES ('5', '阿贾克斯', '26', '阿贾克斯');
INSERT INTO `team` VALUES ('6', '阿根廷国家男子足球队', '182', '阿根廷国家男子足球队的管理机构是阿根廷足球协会，该队是世界上最成功的国家队之一，曾19次夺取过国家队重大赛事的冠军，包括两次称雄世界杯（1978、1986年）、14次夺得美洲杯、两次获得奥运男足金牌（2004、2008年）以及一次联合会杯。');
INSERT INTO `team` VALUES ('7', '法国国家男子足球队', '85', '法国国家男子足球队成立于1904年，主场位于法兰西大球场，是法国足球总会领导的国家级别足球队，参加国际比赛');
INSERT INTO `team` VALUES ('8', '荷兰国家男子足球队', '99', '荷兰国家队由荷兰足球协会领导，参加国际比赛。70年代，荷兰一代名帅米歇尔斯，将师承英格兰名帅雷诺兹的“全攻全守”战术带到了荷兰国家队，并向世界杯发起冲击。');
INSERT INTO `team` VALUES ('9', '英格兰国家队', '78', '英格兰国家队是英格兰足球联合会管理的国家级别足球代表队，由于历史原因，英国的四大地区，英格兰、苏格兰、爱尔兰是作为独立的国家级别足球代表队存在。');
INSERT INTO `team` VALUES ('10', '乌拉圭国家男子足球队', '12', '乌拉圭国家足球队是第一届世界杯足球赛的冠军队伍，1930年以主场身份4比2击败阿根廷夺得首届世界杯冠军。1950年乌拉圭再次挑战于巴西举行的世界杯，决赛采用独特的小组赛制，除了乌拉圭，主办国巴西还有西班牙及瑞典。');
INSERT INTO `team` VALUES ('11', '皇家马德里', '200', '皇家马德里足球俱乐部（RealMadridClubdeFútbol，中文简称为皇马）是一家位于西班牙首都马德里的足球俱乐部，球队成立于1902年3月6日，前称马德里足球队');
INSERT INTO `team` VALUES ('12', '流浪者足球队', '108', '流浪者足球队创建于2019.5.2，是一个充满活力的新秀级别的球员自主建队，自舰队以来，战绩硕果蕾蕾。');
INSERT INTO `team` VALUES ('13', '篮球部落', '169', '篮球部落的球队');

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
-- Records of test_physical
-- ----------------------------
INSERT INTO `test_physical` VALUES ('1', '4', '2.06米', '122Kg', '140mmHg', '3347.2毫升', '150～1800千卡/小时', '20%', '22秒', '2.10米', '01');
INSERT INTO `test_physical` VALUES ('2', '6', '1.98米', '113Kg', '90毫米公主', '3890CC', '1小时马拉松', '12%～14%', '22秒', '2.05米', '01');
INSERT INTO `test_physical` VALUES ('3', '8', '1.88', '78kg', '90毫米公主', '3890CC', '耐力持久', '20%', '22秒', '1.93', '00');
INSERT INTO `test_physical` VALUES ('4', '7', '1.83', '125kg', '500MM', '3890CC', '一般', '20%', '22秒', '1.93', '00');

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
-- Records of training_plan
-- ----------------------------
INSERT INTO `training_plan` VALUES ('1', '100公里越野', '2019-06-27 16:13:09', '02', '\0', '2019-06-04 16:13:18');
INSERT INTO `training_plan` VALUES ('2', '10公里骑行', '2019-06-04 16:13:32', '01', '', '2019-06-04 16:13:40');
INSERT INTO `training_plan` VALUES ('3', '人机大战', '2019-06-29 16:18:50', '02', '', '2019-06-04 16:18:57');
INSERT INTO `training_plan` VALUES ('4', '1000公里越野', '2019-06-29 16:19:09', '02', '\0', '2019-06-04 16:19:14');
INSERT INTO `training_plan` VALUES ('5', '大把训练', '2019-06-04 16:19:37', '00', null, '2019-06-04 16:19:40');
INSERT INTO `training_plan` VALUES ('6', '沙袋训练', '2019-06-20 16:20:03', '00', '\0', '2019-06-04 16:20:09');
INSERT INTO `training_plan` VALUES ('7', '枪机训练', '2019-06-20 16:20:21', '00', '\0', '2019-06-04 16:20:27');
INSERT INTO `training_plan` VALUES ('8', '100米短跑加速训练', '2019-06-20 16:20:59', '01', '\0', '2019-06-04 16:21:05');
INSERT INTO `training_plan` VALUES ('9', '耐力训练', '2019-06-19 16:21:12', '02', '\0', '2019-06-04 16:21:18');
INSERT INTO `training_plan` VALUES ('10', '跑步训练', '2019-06-19 16:21:37', '02', '\0', '2019-06-04 16:21:41');
INSERT INTO `training_plan` VALUES ('11', '打字训练3', '2019-06-29 16:21:51', '00', '\0', '2019-06-04 16:21:58');
INSERT INTO `training_plan` VALUES ('12', '1000米越野', '2019-06-13 12:53:38', '01', '\0', '2019-06-06 12:53:43');

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
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '管理员', '4', '0', '123456', '13141043557', 'admin', 'images/upload/e96fa1cf299c4a9da7fb633c4ab1b830.jpg');
INSERT INTO `user` VALUES ('2', '亚历克斯·弗格森', '1', '2', '123456', '13566565656', 'Coach', 'images/upload/6d22eb392bae4e7a90140189ad235f48.jpg');
INSERT INTO `user` VALUES ('3', '卡尔', '1', '1', '123456', '16896566464', 'Karl', 'images/upload/aaff6fc2bfeb44a4adaee69f6c089d1d.jpg');
INSERT INTO `user` VALUES ('4', 'C罗', '2', '11', '123456', '16845454545', 'Cl', 'images/upload/8af2ec6e5fee4276a9505865451d4688.jpg');
INSERT INTO `user` VALUES ('5', '队医', '3', '1', '123456', '13792340854', 'Doctor', 'images/upload/e85bdbf56e5c42afa275b0a1e95bf322.jpg');
INSERT INTO `user` VALUES ('6', '科比', '2', '4', '123456', '13569889989', 'kb', 'images/upload/be8826dcfc014214801356356be56210.jpg');
INSERT INTO `user` VALUES ('7', '保罗', '2', '9', '123456', '13453453453', 'pl', 'images/upload/b12aeea2af1b4f898d169b3f333e2c08.jpg');
INSERT INTO `user` VALUES ('8', '阿莎', '2', '5', '123456', '13968989898', 'ac', 'images/upload/944e58bd4ab54d76a2ec0c2116be3826.jpg');
INSERT INTO `user` VALUES ('9', '王铭卿', '1', '11', '123456', '13676868686', 'wmq', 'images/upload/13a0ad419c83427ead61c05b226f8bf3.jpg');
INSERT INTO `user` VALUES ('10', '小卡', '2', '12', '123456', '13454556464', 'xiaok', 'images/upload/781eb22f89d4409e8354b7d5c4744716.jpg');
INSERT INTO `user` VALUES ('12', '教练1', '1', '3', '123456', '13646898989', 'jiaolian', 'images/upload/b2e368bbb5cb41d6a1c2fc34c7dd5f98.jpg');

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

-- ----------------------------
-- Records of user_train
-- ----------------------------
INSERT INTO `user_train` VALUES ('1', '1', '4', '88', '2019-06-04 16:22:13');
INSERT INTO `user_train` VALUES ('2', '8', '6', '100', '2019-06-04 16:22:43');
INSERT INTO `user_train` VALUES ('3', '8', '8', '10', '2019-06-04 16:27:20');
INSERT INTO `user_train` VALUES ('4', '4', '10', '98', '2019-06-06 12:54:08');
