/*
 Navicat Premium Dump SQL

 Source Server         : 7.21H5
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44-log)
 Source Host           : 122.114.237.95:3306
 Source Schema         : 0721h5_95_hzgqap

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44-log)
 File Encoding         : 65001

 Date: 19/08/2025 09:17:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wa_account
-- ----------------------------
DROP TABLE IF EXISTS `wa_account`;
CREATE TABLE `wa_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `truename` varchar(100) NOT NULL COMMENT '真实姓名',
  `mobile` varchar(100) NOT NULL COMMENT '手机号',
  `type` tinyint(1) NOT NULL COMMENT '类型:1=银行卡,2=微信,3=支付宝',
  `account` varchar(255) NOT NULL COMMENT '账户',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账户';

-- ----------------------------
-- Records of wa_account
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wa_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `wa_admin_roles`;
CREATE TABLE `wa_admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_admin_id` (`role_id`,`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='管理员角色表';

-- ----------------------------
-- Records of wa_admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `wa_admin_roles` (`id`, `role_id`, `admin_id`) VALUES (1, 1, 1);
INSERT INTO `wa_admin_roles` (`id`, `role_id`, `admin_id`) VALUES (2, 2, 2);
INSERT INTO `wa_admin_roles` (`id`, `role_id`, `admin_id`) VALUES (3, 3, 3);
COMMIT;

-- ----------------------------
-- Table structure for wa_admins
-- ----------------------------
DROP TABLE IF EXISTS `wa_admins`;
CREATE TABLE `wa_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `nickname` varchar(40) NOT NULL COMMENT '昵称',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `avatar` varchar(255) DEFAULT '/app/admin/avatar.png' COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '禁用',
  `zfb_sj_qr` varchar(255) DEFAULT NULL COMMENT '支付宝商家收款码',
  `zfb_yc_qr` varchar(255) DEFAULT NULL COMMENT '支付宝远程收款码',
  `wx_sj_qr` varchar(255) DEFAULT NULL COMMENT '微信收款码',
  `bank_account` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '银行名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of wa_admins
-- ----------------------------
BEGIN;
INSERT INTO `wa_admins` (`id`, `username`, `nickname`, `password`, `avatar`, `email`, `mobile`, `created_at`, `updated_at`, `login_at`, `status`, `zfb_sj_qr`, `zfb_yc_qr`, `wx_sj_qr`, `bank_account`, `bank_name`) VALUES (1, 'admin', '超级管理员', '$2y$10$8LVVK42UR8oDQ5zfydttxOjfQtMDId/pNpGZUCNog0actgTUFf3x2', '/app/admin/avatar.png', NULL, NULL, '2025-08-05 17:43:31', '2025-08-14 15:37:36', '2025-08-14 15:37:36', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wa_admins` (`id`, `username`, `nickname`, `password`, `avatar`, `email`, `mobile`, `created_at`, `updated_at`, `login_at`, `status`, `zfb_sj_qr`, `zfb_yc_qr`, `wx_sj_qr`, `bank_account`, `bank_name`) VALUES (2, 'guanliyuan', '管理员', '$2y$10$qgY/xYBQuoweWPEhK1nmou4GY/K6FSGuShpBxHyuxL.FCw4nlGvFC', '/app/admin/avatar.png', '', '', '2025-08-12 17:36:59', '2025-08-17 22:28:40', '2025-08-17 22:28:40', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wa_admins` (`id`, `username`, `nickname`, `password`, `avatar`, `email`, `mobile`, `created_at`, `updated_at`, `login_at`, `status`, `zfb_sj_qr`, `zfb_yc_qr`, `wx_sj_qr`, `bank_account`, `bank_name`) VALUES (3, 'daili', '代理商', '$2y$10$I/hP2tEm/Ase3sTMeyfUeOj6jvUSPwKDWeHdne0arwzZZD736k/9K', '/app/admin/avatar.png', '', '', '2025-08-14 15:16:04', '2025-08-14 15:16:04', NULL, 0, '/app/admin/upload/img/20250814/689d8d278e84.jpg', '/app/admin/upload/img/20250814/689d8d2a9afd.jpg', '/app/admin/upload/img/20250814/689d8d2c6955.jpg', '123456', '123123');
COMMIT;

-- ----------------------------
-- Table structure for wa_banner
-- ----------------------------
DROP TABLE IF EXISTS `wa_banner`;
CREATE TABLE `wa_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='轮播图';

-- ----------------------------
-- Records of wa_banner
-- ----------------------------
BEGIN;
INSERT INTO `wa_banner` (`id`, `image`, `weight`, `created_at`, `updated_at`) VALUES (1, '/app/admin/upload/img/20250814/689d70949faa.jpg', 0, '2025-07-11 11:19:59', '2025-08-14 13:13:59');
COMMIT;

-- ----------------------------
-- Table structure for wa_options
-- ----------------------------
DROP TABLE IF EXISTS `wa_options`;
CREATE TABLE `wa_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '键',
  `value` longtext NOT NULL COMMENT '值',
  `created_at` datetime NOT NULL DEFAULT '2022-08-15 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '2022-08-15 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='选项表';

-- ----------------------------
-- Records of wa_options
-- ----------------------------
BEGIN;
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (1, 'system_config', '{\"logo\":{\"title\":\"Webman Admin\",\"image\":\"\\/app\\/admin\\/admin\\/images\\/logo.png\"},\"menu\":{\"data\":\"\\/app\\/admin\\/rule\\/get\",\"method\":\"GET\",\"accordion\":true,\"collapse\":false,\"control\":false,\"controlWidth\":500,\"select\":\"0\",\"async\":true},\"tab\":{\"enable\":true,\"keepState\":true,\"preload\":false,\"session\":true,\"max\":\"30\",\"index\":{\"id\":\"0\",\"href\":\"\\/app\\/admin\\/index\\/dashboard\",\"title\":\"\\u4eea\\u8868\\u76d8\"}},\"theme\":{\"defaultColor\":\"2\",\"defaultMenu\":\"light-theme\",\"defaultHeader\":\"light-theme\",\"allowCustom\":true,\"banner\":false},\"colors\":[{\"id\":\"1\",\"color\":\"#36b368\",\"second\":\"#f0f9eb\"},{\"id\":\"2\",\"color\":\"#2d8cf0\",\"second\":\"#ecf5ff\"},{\"id\":\"3\",\"color\":\"#f6ad55\",\"second\":\"#fdf6ec\"},{\"id\":\"4\",\"color\":\"#f56c6c\",\"second\":\"#fef0f0\"},{\"id\":\"5\",\"color\":\"#3963bc\",\"second\":\"#ecf5ff\"}],\"other\":{\"keepLoad\":\"500\",\"autoHead\":false,\"footer\":false},\"header\":{\"message\":false},\"platform\":{\"zfb_sj_qr\":\"\\/app\\/admin\\/upload\\/img\\/20250814\\/689d771253cc.jpg\",\"zfb_yc_qr\":\"\\/app\\/admin\\/upload\\/img\\/20250814\\/689d77162966.jpg\",\"wx_sj_qr\":\"\\/app\\/admin\\/upload\\/img\\/20250814\\/689d771aec75.jpg\",\"bank_account\":\"08-08\",\"bank_name\":\"08-08\",\"withdraw_rate\":\"0\"}}', '2022-12-05 14:49:01', '2025-08-14 13:44:55');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (2, 'table_form_schema_wa_users', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"sex\":{\"field\":\"sex\",\"_field_id\":\"4\",\"comment\":\"性别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/sex\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"5\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"6\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"7\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"level\":{\"field\":\"level\",\"_field_id\":\"8\",\"comment\":\"等级\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"birthday\":{\"field\":\"birthday\",\"_field_id\":\"9\",\"comment\":\"生日\",\"control\":\"datePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"money\":{\"field\":\"money\",\"_field_id\":\"10\",\"comment\":\"余额(元)\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"score\":{\"field\":\"score\",\"_field_id\":\"11\",\"comment\":\"积分\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"last_time\":{\"field\":\"last_time\",\"_field_id\":\"12\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"last_ip\":{\"field\":\"last_ip\",\"_field_id\":\"13\",\"comment\":\"登录ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"join_time\":{\"field\":\"join_time\",\"_field_id\":\"14\",\"comment\":\"注册时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"join_ip\":{\"field\":\"join_ip\",\"_field_id\":\"15\",\"comment\":\"注册ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"token\":{\"field\":\"token\",\"_field_id\":\"16\",\"comment\":\"token\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"17\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"18\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"role\":{\"field\":\"role\",\"_field_id\":\"19\",\"comment\":\"角色\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"20\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-23 15:28:13');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (3, 'table_form_schema_wa_roles', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"角色组\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"rules\":{\"field\":\"rules\",\"_field_id\":\"2\",\"comment\":\"权限\",\"control\":\"treeSelectMulti\",\"control_args\":\"url:\\/app\\/admin\\/rule\\/get?type=0,1,2\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"5\",\"comment\":\"父级\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/role\\/select?format=tree\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-19 14:24:25');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (4, 'table_form_schema_wa_rules', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"title\":{\"field\":\"title\",\"_field_id\":\"1\",\"comment\":\"标题\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"icon\":{\"field\":\"icon\",\"_field_id\":\"2\",\"comment\":\"图标\",\"control\":\"iconPicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"key\":{\"field\":\"key\",\"_field_id\":\"3\",\"comment\":\"标识\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"4\",\"comment\":\"上级菜单\",\"control\":\"treeSelect\",\"control_args\":\"\\/app\\/admin\\/rule\\/select?format=tree&type=0,1\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"5\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"6\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"href\":{\"field\":\"href\",\"_field_id\":\"7\",\"comment\":\"url\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"type\":{\"field\":\"type\",\"_field_id\":\"8\",\"comment\":\"类型\",\"control\":\"select\",\"control_args\":\"data:0:目录,1:菜单,2:权限\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"weight\":{\"field\":\"weight\",\"_field_id\":\"9\",\"comment\":\"排序\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:44:45');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (5, 'table_form_schema_wa_admins', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"between\",\"form_show\":false,\"searchable\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"4\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"5\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"6\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"7\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"8\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"login_at\":{\"field\":\"login_at\",\"_field_id\":\"9\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"between\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"10\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"zfb_sj_qr\":{\"field\":\"zfb_sj_qr\",\"_field_id\":\"11\",\"comment\":\"支付宝商家收款码\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"zfb_yc_qr\":{\"field\":\"zfb_yc_qr\",\"_field_id\":\"12\",\"comment\":\"支付宝远程收款码\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"wx_sj_qr\":{\"field\":\"wx_sj_qr\",\"_field_id\":\"13\",\"comment\":\"微信收款码\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"bank_account\":{\"field\":\"bank_account\",\"_field_id\":\"14\",\"comment\":\"银行卡号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"bank_name\":{\"field\":\"bank_name\",\"_field_id\":\"15\",\"comment\":\"银行名称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2025-08-14 15:07:29');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (6, 'table_form_schema_wa_options', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"键\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"value\":{\"field\":\"value\",\"_field_id\":\"2\",\"comment\":\"值\",\"control\":\"textArea\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:36:57');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (7, 'table_form_schema_wa_uploads', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"normal\",\"form_show\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"名称\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"url\":{\"field\":\"url\",\"_field_id\":\"2\",\"comment\":\"文件\",\"control\":\"upload\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/file\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"3\",\"comment\":\"管理员\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/admin\\/select?format=select\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"file_size\":{\"field\":\"file_size\",\"_field_id\":\"4\",\"comment\":\"文件大小\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"mime_type\":{\"field\":\"mime_type\",\"_field_id\":\"5\",\"comment\":\"mime类型\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_width\":{\"field\":\"image_width\",\"_field_id\":\"6\",\"comment\":\"图片宽度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_height\":{\"field\":\"image_height\",\"_field_id\":\"7\",\"comment\":\"图片高度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"ext\":{\"field\":\"ext\",\"_field_id\":\"8\",\"comment\":\"扩展名\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"storage\":{\"field\":\"storage\",\"_field_id\":\"9\",\"comment\":\"存储位置\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"10\",\"comment\":\"上传时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"searchable\":true,\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false},\"category\":{\"field\":\"category\",\"_field_id\":\"11\",\"comment\":\"类别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/upload\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"12\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:47:45');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (8, 'dict_upload', '[{\"value\":\"1\",\"name\":\"分类1\"},{\"value\":\"2\",\"name\":\"分类2\"},{\"value\":\"3\",\"name\":\"分类3\"}]', '2022-12-04 16:24:13', '2022-12-04 16:24:13');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (9, 'dict_sex', '[{\"value\":\"0\",\"name\":\"女\"},{\"value\":\"1\",\"name\":\"男\"}]', '2022-12-04 15:04:40', '2022-12-04 15:04:40');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (10, 'dict_status', '[{\"value\":\"0\",\"name\":\"正常\"},{\"value\":\"1\",\"name\":\"禁用\"}]', '2022-12-04 15:05:09', '2022-12-04 15:05:09');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (11, 'table_form_schema_wa_admin_roles', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"role_id\":{\"field\":\"role_id\",\"_field_id\":\"1\",\"comment\":\"角色id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"2\",\"comment\":\"管理员id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-20 19:42:51');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (12, 'dict_dict_name', '[{\"value\":\"dict_name\",\"name\":\"字典名称\"},{\"value\":\"status\",\"name\":\"启禁用状态\"},{\"value\":\"sex\",\"name\":\"性别\"},{\"value\":\"upload\",\"name\":\"附件分类\"}]', '2022-08-15 00:00:00', '2022-12-20 19:42:51');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (13, 'table_form_schema_wa_shop', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"user_id\":{\"field\":\"user_id\",\"_field_id\":\"1\",\"comment\":\"用户\",\"control\":\"select\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"2\",\"comment\":\"姓名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"image\":{\"field\":\"image\",\"_field_id\":\"3\",\"comment\":\"营业执照\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"tb_address\":{\"field\":\"tb_address\",\"_field_id\":\"4\",\"comment\":\"淘宝店铺地址\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"ali_address\":{\"field\":\"ali_address\",\"_field_id\":\"5\",\"comment\":\"阿里店铺地址\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"xy_address\":{\"field\":\"xy_address\",\"_field_id\":\"6\",\"comment\":\"闲鱼店铺地址\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"tm_address\":{\"field\":\"tm_address\",\"_field_id\":\"7\",\"comment\":\"天猫店铺地址\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"zfb_account\":{\"field\":\"zfb_account\",\"_field_id\":\"8\",\"comment\":\"支付宝账号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"zfb_yc_qr\":{\"field\":\"zfb_yc_qr\",\"_field_id\":\"9\",\"comment\":\"支付宝远程收款码\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"zfb_sj_qr\":{\"field\":\"zfb_sj_qr\",\"_field_id\":\"10\",\"comment\":\"支付宝商家收款码\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"wx_sj_qr\":{\"field\":\"wx_sj_qr\",\"_field_id\":\"11\",\"comment\":\"微信商家收款码\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"bank_account\":{\"field\":\"bank_account\",\"_field_id\":\"12\",\"comment\":\"银行卡号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"bank_name\":{\"field\":\"bank_name\",\"_field_id\":\"13\",\"comment\":\"银行名称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"14\",\"comment\":\"状态:0=待审核,1=通过,2=拒绝\",\"control\":\"select\",\"control_args\":\"data:0:待审核,1:通过,2:拒绝\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"reason\":{\"field\":\"reason\",\"_field_id\":\"15\",\"comment\":\"原因\",\"control\":\"textArea\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"16\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"17\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2025-08-11 16:12:17');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (14, 'table_form_schema_wa_user_identity', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"user_id\":{\"field\":\"user_id\",\"_field_id\":\"1\",\"comment\":\"用户\",\"control\":\"select\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"2\",\"comment\":\"真实姓名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"3\",\"comment\":\"手机号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"card_front\":{\"field\":\"card_front\",\"_field_id\":\"4\",\"comment\":\"身份证正面\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"card_reverse\":{\"field\":\"card_reverse\",\"_field_id\":\"5\",\"comment\":\"身份证反面\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"contract_image\":{\"field\":\"contract_image\",\"_field_id\":\"6\",\"comment\":\"合同照片\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"zfb_account\":{\"field\":\"zfb_account\",\"_field_id\":\"7\",\"comment\":\"支付宝账号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"zfb_yc_qr\":{\"field\":\"zfb_yc_qr\",\"_field_id\":\"8\",\"comment\":\"支付宝远程收款码\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"zfb_sj_qr\":{\"field\":\"zfb_sj_qr\",\"_field_id\":\"9\",\"comment\":\"支付宝商家收款码\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"wx_sj_qr\":{\"field\":\"wx_sj_qr\",\"_field_id\":\"10\",\"comment\":\"微信商家收款码\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"bank_account\":{\"field\":\"bank_account\",\"_field_id\":\"11\",\"comment\":\"银行卡号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"bank_name\":{\"field\":\"bank_name\",\"_field_id\":\"12\",\"comment\":\"银行名称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"13\",\"comment\":\"状态:0=待审核,1=通过,2=拒绝\",\"control\":\"select\",\"control_args\":\"data:0:待审核,1:通过,2:拒绝\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"reason\":{\"field\":\"reason\",\"_field_id\":\"14\",\"comment\":\"原因\",\"control\":\"textArea\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"15\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"16\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2025-08-11 16:16:26');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (15, 'table_form_schema_wa_subscribe', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"user_id\":{\"field\":\"user_id\",\"_field_id\":\"1\",\"comment\":\"用户\",\"control\":\"select\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"2\",\"comment\":\"姓名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"amount\":{\"field\":\"amount\",\"_field_id\":\"3\",\"comment\":\"金额\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"date\":{\"field\":\"date\",\"_field_id\":\"4\",\"comment\":\"日期\",\"control\":\"datePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"5\",\"comment\":\"状态:0=待审核,1=已审核\",\"control\":\"select\",\"control_args\":\"data:0:待审核,1:已审核\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"6\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"7\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2025-08-12 17:17:14');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (16, 'table_form_schema_wa_orders', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"user_id\":{\"field\":\"user_id\",\"_field_id\":\"1\",\"comment\":\"买家\",\"control\":\"select\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"to_user_id\":{\"field\":\"to_user_id\",\"_field_id\":\"2\",\"comment\":\"卖家\",\"control\":\"select\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"ordersn\":{\"field\":\"ordersn\",\"_field_id\":\"3\",\"comment\":\"订单编号\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"like\",\"form_show\":false,\"enable_sort\":false},\"goods_name\":{\"field\":\"goods_name\",\"_field_id\":\"4\",\"comment\":\"商品名称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"trade_amount\":{\"field\":\"trade_amount\",\"_field_id\":\"5\",\"comment\":\"交易金额\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"service_amount\":{\"field\":\"service_amount\",\"_field_id\":\"6\",\"comment\":\"服务费\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"kehu_amount\":{\"field\":\"kehu_amount\",\"_field_id\":\"7\",\"comment\":\"客户金额\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"push_amount\":{\"field\":\"push_amount\",\"_field_id\":\"8\",\"comment\":\"直推收益\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"9\",\"comment\":\"状态:0=待付款,1=待确认,2=已确认\",\"control\":\"selectMulti\",\"control_args\":\"data:0:待付款,1:待确认,2:已确认\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"10\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"11\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2025-08-07 14:24:58');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (17, 'table_form_schema_wa_withdraw', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"user_id\":{\"field\":\"user_id\",\"_field_id\":\"1\",\"comment\":\"用户\",\"control\":\"select\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"account_id\":{\"field\":\"account_id\",\"_field_id\":\"2\",\"comment\":\"账户\",\"control\":\"select\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"amount\":{\"field\":\"amount\",\"_field_id\":\"3\",\"comment\":\"提现金额\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"fee_rate\":{\"field\":\"fee_rate\",\"_field_id\":\"4\",\"comment\":\"手续费率\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"fee_amount\":{\"field\":\"fee_amount\",\"_field_id\":\"5\",\"comment\":\"手续费\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"into_amount\":{\"field\":\"into_amount\",\"_field_id\":\"6\",\"comment\":\"到账金额\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"7\",\"comment\":\"状态:0=待审核,1=通过,2=驳回\",\"control\":\"select\",\"control_args\":\"data:0:待审核,1:通过,2:驳回\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"reason\":{\"field\":\"reason\",\"_field_id\":\"8\",\"comment\":\"原因\",\"control\":\"textArea\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"9\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"10\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2025-08-12 15:33:52');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (18, 'table_form_schema_wa_account', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"1\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"2\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-08-15 00:00:00');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (19, 'table_form_schema_wa_report', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"1\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"2\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-08-15 00:00:00');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (20, 'table_form_schema_wa_banner', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image\":{\"field\":\"image\",\"_field_id\":\"1\",\"comment\":\"图片\",\"control\":\"uploadImage\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"weight\":{\"field\":\"weight\",\"_field_id\":\"2\",\"comment\":\"权重\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2025-08-13 16:39:42');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (21, 'table_form_schema_wa_user_address', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"user_id\":{\"field\":\"user_id\",\"_field_id\":\"1\",\"comment\":\"用户\",\"control\":\"select\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"default\":{\"field\":\"default\",\"_field_id\":\"2\",\"comment\":\"默认:0=否,1=是\",\"control\":\"select\",\"control_args\":\"data:0:否,1:是\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"province\":{\"field\":\"province\",\"_field_id\":\"3\",\"comment\":\"省\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"city\":{\"field\":\"city\",\"_field_id\":\"4\",\"comment\":\"市\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"region\":{\"field\":\"region\",\"_field_id\":\"5\",\"comment\":\"区\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"6\",\"comment\":\"手机号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"7\",\"comment\":\"姓名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"address\":{\"field\":\"address\",\"_field_id\":\"8\",\"comment\":\"详细地址\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"lat\":{\"field\":\"lat\",\"_field_id\":\"9\",\"comment\":\"纬度\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"lng\":{\"field\":\"lng\",\"_field_id\":\"10\",\"comment\":\"经度\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"11\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"12\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"deleted_at\":{\"field\":\"deleted_at\",\"_field_id\":\"13\",\"comment\":\"删除时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-08-15 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for wa_orders
-- ----------------------------
DROP TABLE IF EXISTS `wa_orders`;
CREATE TABLE `wa_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_id` int(11) DEFAULT NULL COMMENT '代理商',
  `user_id` int(11) NOT NULL COMMENT '买家',
  `to_user_id` int(11) NOT NULL COMMENT '卖家',
  `ordersn` varchar(50) NOT NULL COMMENT '订单编号',
  `service_rate` float(5,3) NOT NULL COMMENT '服务费率',
  `kehu_rate` float(5,3) NOT NULL COMMENT '客户费率',
  `push_rate` float(5,3) NOT NULL COMMENT '直推费率',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
  `service_amount` decimal(10,2) NOT NULL COMMENT '服务费',
  `kehu_amount` decimal(10,2) NOT NULL COMMENT '客户金额',
  `push_amount` decimal(10,2) NOT NULL COMMENT '直推收益',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:0=待付款,1=待确认,2=已确认',
  `user_pay_image` varchar(255) DEFAULT NULL COMMENT '用户支付凭证',
  `platform_pay_image` varchar(255) DEFAULT NULL COMMENT '平台支付凭证',
  `is_copy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否复制:0=否,1=是',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `finish_at` datetime DEFAULT NULL COMMENT '完成时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='数据优化';

-- ----------------------------
-- Records of wa_orders
-- ----------------------------
BEGIN;
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, NULL, 23, 30, '2025081768A1E7F5F260A', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 10000.00, 250.00, 150.00, 50.00, 0, NULL, NULL, 0, NULL, NULL, '2025-08-17 22:32:21', '2025-08-17 22:32:21', NULL);
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, NULL, 32, 41, '2025081768A1EB1EA169F', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 20018.00, 500.45, 300.27, 100.09, 2, '/app/admin/upload/img/20250818/68a287fc4419.jpg', '/app/admin/upload/img/20250818/68a2881186ee.jpg', 1, '2025-08-18 09:55:32', '2025-08-18 09:57:24', '2025-08-17 22:45:50', '2025-08-18 22:23:04', NULL);
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, NULL, 39, 40, '2025081768A1EB75E406A', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 10008.00, 250.20, 150.12, 50.04, 2, '/app/admin/upload/img/20250818/68a2915eed70.jpg', '/app/admin/upload/img/20250818/68a29166963e.jpg', 1, '2025-08-18 10:35:27', '2025-08-18 10:40:50', '2025-08-17 22:47:17', '2025-08-18 22:25:31', NULL);
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, NULL, 38, 22, '2025081768A1ECA632345', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 10008.00, 250.20, 150.12, 50.04, 0, NULL, NULL, 0, NULL, NULL, '2025-08-17 22:52:22', '2025-08-18 09:20:40', '2025-08-18 09:20:40');
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, NULL, 38, 41, '2025081868A27FE336445', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 10028.00, 250.70, 150.42, 50.14, 2, '/app/admin/upload/img/20250818/68a28259943e.png', '/app/admin/upload/img/20250818/68a2827dae76.png', 1, '2025-08-18 09:31:45', '2025-08-18 09:39:53', '2025-08-18 09:20:35', '2025-08-18 22:25:10', NULL);
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, NULL, 22, 32, '2025081868A33748E6848', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 20818.72, 520.46, 312.28, 104.09, 0, NULL, NULL, 0, NULL, NULL, '2025-08-18 22:23:04', '2025-08-18 22:23:04', NULL);
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, NULL, 32, 38, '2025081868A337C6DDC2E', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 10429.12, 260.72, 156.43, 52.14, 0, NULL, NULL, 0, NULL, NULL, '2025-08-18 22:25:10', '2025-08-18 22:25:10', NULL);
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, NULL, 32, 39, '2025081868A337DBC334D', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 10408.32, 260.20, 156.12, 52.04, 0, NULL, NULL, 0, NULL, NULL, '2025-08-18 22:25:31', '2025-08-18 22:25:31', NULL);
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, NULL, 39, 30, '2025081868A3384448E45', 0.025, 0.015, 0.000, '熊猫无忧财富打造4%', 10733.00, 268.32, 160.99, 0.00, 0, NULL, NULL, 0, NULL, NULL, '2025-08-18 22:27:16', '2025-08-18 22:27:28', '2025-08-18 22:27:28');
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, NULL, 39, 22, '2025081868A33869033D1', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 10733.00, 268.32, 160.99, 53.66, 0, NULL, NULL, 0, NULL, NULL, '2025-08-18 22:27:53', '2025-08-18 22:27:53', NULL);
INSERT INTO `wa_orders` (`id`, `admin_id`, `user_id`, `to_user_id`, `ordersn`, `service_rate`, `kehu_rate`, `push_rate`, `goods_name`, `trade_amount`, `service_amount`, `kehu_amount`, `push_amount`, `status`, `user_pay_image`, `platform_pay_image`, `is_copy`, `pay_at`, `finish_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (11, NULL, 38, 37, '2025081868A338DE242F6', 0.025, 0.015, 0.005, '熊猫无忧财富打造4%', 10733.00, 268.32, 160.99, 53.66, 0, NULL, NULL, 0, NULL, NULL, '2025-08-18 22:29:50', '2025-08-18 22:29:50', NULL);
COMMIT;

-- ----------------------------
-- Table structure for wa_report
-- ----------------------------
DROP TABLE IF EXISTS `wa_report`;
CREATE TABLE `wa_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `date` date NOT NULL COMMENT '日期',
  `service_amount` decimal(10,2) NOT NULL COMMENT '服务费',
  `total_amount` decimal(10,2) NOT NULL COMMENT '总金额',
  `kehu_amount` decimal(10,2) NOT NULL COMMENT '客户收益',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报表';

-- ----------------------------
-- Records of wa_report
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wa_roles
-- ----------------------------
DROP TABLE IF EXISTS `wa_roles`;
CREATE TABLE `wa_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(80) NOT NULL COMMENT '角色组',
  `rules` text COMMENT '权限',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '父级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='管理员角色';

-- ----------------------------
-- Records of wa_roles
-- ----------------------------
BEGIN;
INSERT INTO `wa_roles` (`id`, `name`, `rules`, `created_at`, `updated_at`, `pid`) VALUES (1, '超级管理员', '*', '2022-08-13 16:15:01', '2022-12-23 12:05:07', NULL);
INSERT INTO `wa_roles` (`id`, `name`, `rules`, `created_at`, `updated_at`, `pid`) VALUES (2, '管理员', '87,86,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,117,116,115,119,123,122,128,127,133,138,136,131,141,142,143,144,88,118,139,129,124,151,85', '2025-08-12 17:36:15', '2025-08-14 15:52:33', 1);
INSERT INTO `wa_roles` (`id`, `name`, `rules`, `created_at`, `updated_at`, `pid`) VALUES (3, '代理商', '', '2025-08-14 14:55:30', '2025-08-14 14:55:30', 1);
COMMIT;

-- ----------------------------
-- Table structure for wa_rules
-- ----------------------------
DROP TABLE IF EXISTS `wa_rules`;
CREATE TABLE `wa_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `key` varchar(255) NOT NULL COMMENT '标识',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '上级菜单',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `href` varchar(255) DEFAULT NULL COMMENT 'url',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型',
  `weight` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则';

-- ----------------------------
-- Records of wa_rules
-- ----------------------------
BEGIN;
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (1, '数据库', 'layui-icon-template-1', 'database', 0, '2025-08-05 17:43:06', '2025-08-05 17:43:06', NULL, 0, 1000);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (2, '所有表', NULL, 'plugin\\admin\\app\\controller\\TableController', 1, '2025-08-05 17:43:07', '2025-08-05 17:43:07', '/app/admin/table/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (3, '权限管理', 'layui-icon-vercode', 'auth', 0, '2025-08-05 17:43:07', '2025-08-05 17:43:07', NULL, 0, 900);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (4, '账户管理', NULL, 'plugin\\admin\\app\\controller\\AdminController', 3, '2025-08-05 17:43:07', '2025-08-05 17:43:07', '/app/admin/admin/index', 1, 1000);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (5, '角色管理', NULL, 'plugin\\admin\\app\\controller\\RoleController', 3, '2025-08-05 17:43:08', '2025-08-05 17:43:08', '/app/admin/role/index', 1, 900);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (6, '菜单管理', NULL, 'plugin\\admin\\app\\controller\\RuleController', 3, '2025-08-05 17:43:08', '2025-08-05 17:43:08', '/app/admin/rule/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (7, '会员管理', 'layui-icon-username', 'user', 0, '2025-08-05 17:43:08', '2025-08-05 17:43:08', NULL, 0, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (8, '用户', NULL, 'plugin\\admin\\app\\controller\\UserController', 7, '2025-08-05 17:43:08', '2025-08-05 17:43:08', '/app/admin/user/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (9, '通用设置', 'layui-icon-set', 'common', 0, '2025-08-05 17:43:08', '2025-08-05 17:43:08', NULL, 0, 700);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (10, '个人资料', NULL, 'plugin\\admin\\app\\controller\\AccountController', 9, '2025-08-05 17:43:08', '2025-08-05 17:43:08', '/app/admin/account/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (11, '附件管理', NULL, 'plugin\\admin\\app\\controller\\UploadController', 9, '2025-08-05 17:43:08', '2025-08-05 17:43:08', '/app/admin/upload/index', 1, 700);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (12, '字典设置', NULL, 'plugin\\admin\\app\\controller\\DictController', 9, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '/app/admin/dict/index', 1, 600);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (13, '系统设置', NULL, 'plugin\\admin\\app\\controller\\ConfigController', 9, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '/app/admin/config/index', 1, 500);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (14, '插件管理', 'layui-icon-app', 'plugin', 0, '2025-08-05 17:43:09', '2025-08-05 17:43:09', NULL, 0, 600);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (15, '应用插件', NULL, 'plugin\\admin\\app\\controller\\PluginController', 14, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '/app/admin/plugin/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (16, '开发辅助', 'layui-icon-fonts-code', 'dev', 0, '2025-08-05 17:43:09', '2025-08-05 17:43:09', NULL, 0, 500);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (17, '表单构建', NULL, 'plugin\\admin\\app\\controller\\DevController', 16, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '/app/admin/dev/form-build', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (18, '示例页面', 'layui-icon-templeate-1', 'demos', 0, '2025-08-05 17:43:09', '2025-08-05 17:43:09', NULL, 0, 400);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (19, '工作空间', 'layui-icon-console', 'demo1', 18, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (20, '控制后台', 'layui-icon-console', 'demo10', 19, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '/app/admin/demos/console/console1.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (21, '数据分析', 'layui-icon-console', 'demo13', 19, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '/app/admin/demos/console/console2.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (22, '百度一下', 'layui-icon-console', 'demo14', 19, '2025-08-05 17:43:09', '2025-08-05 17:43:09', 'http://www.baidu.com', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (23, '主题预览', 'layui-icon-console', 'demo15', 19, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '/app/admin/demos/system/theme.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (24, '常用组件', 'layui-icon-component', 'demo20', 18, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (25, '功能按钮', 'layui-icon-face-smile', 'demo2011', 24, '2025-08-05 17:43:09', '2025-08-05 17:43:09', '/app/admin/demos/document/button.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (26, '表单集合', 'layui-icon-face-cry', 'demo2014', 24, '2025-08-05 17:43:10', '2025-08-05 17:43:10', '/app/admin/demos/document/form.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (27, '字体图标', 'layui-icon-face-cry', 'demo2010', 24, '2025-08-05 17:43:10', '2025-08-05 17:43:10', '/app/admin/demos/document/icon.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (28, '多选下拉', 'layui-icon-face-cry', 'demo2012', 24, '2025-08-05 17:43:10', '2025-08-05 17:43:10', '/app/admin/demos/document/select.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (29, '动态标签', 'layui-icon-face-cry', 'demo2013', 24, '2025-08-05 17:43:10', '2025-08-05 17:43:10', '/app/admin/demos/document/tag.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (30, '数据表格', 'layui-icon-face-cry', 'demo2031', 24, '2025-08-05 17:43:10', '2025-08-05 17:43:10', '/app/admin/demos/document/table.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (31, '分布表单', 'layui-icon-face-cry', 'demo2032', 24, '2025-08-05 17:43:10', '2025-08-05 17:43:10', '/app/admin/demos/document/step.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (32, '树形表格', 'layui-icon-face-cry', 'demo2033', 24, '2025-08-05 17:43:10', '2025-08-05 17:43:10', '/app/admin/demos/document/treetable.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (33, '树状结构', 'layui-icon-face-cry', 'demo2034', 24, '2025-08-05 17:43:10', '2025-08-05 17:43:10', '/app/admin/demos/document/dtree.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (34, '文本编辑', 'layui-icon-face-cry', 'demo2035', 24, '2025-08-05 17:43:10', '2025-08-05 17:43:10', '/app/admin/demos/document/tinymce.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (35, '卡片组件', 'layui-icon-face-cry', 'demo2036', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/card.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (36, '抽屉组件', 'layui-icon-face-cry', 'demo2021', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/drawer.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (37, '消息通知', 'layui-icon-face-cry', 'demo2022', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/notice.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (38, '加载组件', 'layui-icon-face-cry', 'demo2024', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/loading.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (39, '弹层组件', 'layui-icon-face-cry', 'demo2023', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/popup.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (40, '多选项卡', 'layui-icon-face-cry', 'demo60131', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/tab.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (41, '数据菜单', 'layui-icon-face-cry', 'demo60132', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/menu.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (42, '哈希加密', 'layui-icon-face-cry', 'demo2041', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/encrypt.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (43, '图标选择', 'layui-icon-face-cry', 'demo2042', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/iconPicker.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (44, '省市级联', 'layui-icon-face-cry', 'demo2043', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/area.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (45, '数字滚动', 'layui-icon-face-cry', 'demo2044', 24, '2025-08-05 17:43:11', '2025-08-05 17:43:11', '/app/admin/demos/document/count.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (46, '顶部返回', 'layui-icon-face-cry', 'demo2045', 24, '2025-08-05 17:43:12', '2025-08-05 17:43:12', '/app/admin/demos/document/topBar.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (47, '结果页面', 'layui-icon-auz', 'demo666', 18, '2025-08-05 17:43:12', '2025-08-05 17:43:12', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (48, '成功', 'layui-icon-face-smile', 'demo667', 47, '2025-08-05 17:43:12', '2025-08-05 17:43:12', '/app/admin/demos/result/success.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (49, '失败', 'layui-icon-face-cry', 'demo668', 47, '2025-08-05 17:43:12', '2025-08-05 17:43:12', '/app/admin/demos/result/error.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (50, '错误页面', 'layui-icon-face-cry', 'demo-error', 18, '2025-08-05 17:43:12', '2025-08-05 17:43:12', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (51, '403', 'layui-icon-face-smile', 'demo403', 50, '2025-08-05 17:43:12', '2025-08-05 17:43:12', '/app/admin/demos/error/403.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (52, '404', 'layui-icon-face-cry', 'demo404', 50, '2025-08-05 17:43:12', '2025-08-05 17:43:12', '/app/admin/demos/error/404.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (53, '500', 'layui-icon-face-cry', 'demo500', 50, '2025-08-05 17:43:12', '2025-08-05 17:43:12', '/app/admin/demos/error/500.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (54, '系统管理', 'layui-icon-set-fill', 'demo-system', 18, '2025-08-05 17:43:13', '2025-08-05 17:43:13', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (55, '用户管理', 'layui-icon-face-smile', 'demo601', 54, '2025-08-05 17:43:13', '2025-08-05 17:43:13', '/app/admin/demos/system/user.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (56, '角色管理', 'layui-icon-face-cry', 'demo602', 54, '2025-08-05 17:43:13', '2025-08-05 17:43:13', '/app/admin/demos/system/role.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (57, '权限管理', 'layui-icon-face-cry', 'demo603', 54, '2025-08-05 17:43:13', '2025-08-05 17:43:13', '/app/admin/demos/system/power.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (58, '部门管理', 'layui-icon-face-cry', 'demo604', 54, '2025-08-05 17:43:13', '2025-08-05 17:43:13', '/app/admin/demos/system/deptment.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (59, '行为日志', 'layui-icon-face-cry', 'demo605', 54, '2025-08-05 17:43:14', '2025-08-05 17:43:14', '/app/admin/demos/system/log.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (60, '数据字典', 'layui-icon-face-cry', 'demo606', 54, '2025-08-05 17:43:14', '2025-08-05 17:43:14', '/app/admin/demos/system/dict.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (61, '常用页面', 'layui-icon-template-1', 'demo-common', 18, '2025-08-05 17:43:14', '2025-08-05 17:43:14', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (62, '空白页面', 'layui-icon-face-smile', 'demo702', 61, '2025-08-05 17:43:15', '2025-08-05 17:43:15', '/app/admin/demos/system/space.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (63, '查看表', NULL, 'plugin\\admin\\app\\controller\\TableController@view', 2, '2025-08-07 14:10:04', '2025-08-07 14:10:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (64, '查询表', NULL, 'plugin\\admin\\app\\controller\\TableController@show', 2, '2025-08-07 14:10:04', '2025-08-07 14:10:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (65, '创建表', NULL, 'plugin\\admin\\app\\controller\\TableController@create', 2, '2025-08-07 14:10:04', '2025-08-07 14:10:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (66, '修改表', NULL, 'plugin\\admin\\app\\controller\\TableController@modify', 2, '2025-08-07 14:10:04', '2025-08-07 14:10:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (67, '一键菜单', NULL, 'plugin\\admin\\app\\controller\\TableController@crud', 2, '2025-08-07 14:10:04', '2025-08-07 14:10:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (68, '查询记录', NULL, 'plugin\\admin\\app\\controller\\TableController@select', 2, '2025-08-07 14:10:04', '2025-08-07 14:10:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (69, '插入记录', NULL, 'plugin\\admin\\app\\controller\\TableController@insert', 2, '2025-08-07 14:10:04', '2025-08-07 14:10:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (70, '更新记录', NULL, 'plugin\\admin\\app\\controller\\TableController@update', 2, '2025-08-07 14:10:04', '2025-08-07 14:10:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (71, '删除记录', NULL, 'plugin\\admin\\app\\controller\\TableController@delete', 2, '2025-08-07 14:10:04', '2025-08-07 14:10:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (72, '删除表', NULL, 'plugin\\admin\\app\\controller\\TableController@drop', 2, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (73, '表摘要', NULL, 'plugin\\admin\\app\\controller\\TableController@schema', 2, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (74, '插入', NULL, 'plugin\\admin\\app\\controller\\AdminController@insert', 4, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (75, '更新', NULL, 'plugin\\admin\\app\\controller\\AdminController@update', 4, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (76, '删除', NULL, 'plugin\\admin\\app\\controller\\AdminController@delete', 4, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (77, '插入', NULL, 'plugin\\admin\\app\\controller\\RoleController@insert', 5, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (78, '更新', NULL, 'plugin\\admin\\app\\controller\\RoleController@update', 5, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (79, '删除', NULL, 'plugin\\admin\\app\\controller\\RoleController@delete', 5, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (80, '获取角色权限', NULL, 'plugin\\admin\\app\\controller\\RoleController@rules', 5, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (81, '查询', NULL, 'plugin\\admin\\app\\controller\\RuleController@select', 6, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (82, '添加', NULL, 'plugin\\admin\\app\\controller\\RuleController@insert', 6, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (83, '更新', NULL, 'plugin\\admin\\app\\controller\\RuleController@update', 6, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (84, '删除', NULL, 'plugin\\admin\\app\\controller\\RuleController@delete', 6, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (85, '插入', NULL, 'plugin\\admin\\app\\controller\\UserController@insert', 8, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (86, '更新', NULL, 'plugin\\admin\\app\\controller\\UserController@update', 8, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (87, '查询', NULL, 'plugin\\admin\\app\\controller\\UserController@select', 8, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (88, '删除', NULL, 'plugin\\admin\\app\\controller\\UserController@delete', 8, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (89, '更新', NULL, 'plugin\\admin\\app\\controller\\AccountController@update', 10, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (90, '修改密码', NULL, 'plugin\\admin\\app\\controller\\AccountController@password', 10, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (91, '查询', NULL, 'plugin\\admin\\app\\controller\\AccountController@select', 10, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (92, '添加', NULL, 'plugin\\admin\\app\\controller\\AccountController@insert', 10, '2025-08-07 14:10:05', '2025-08-07 14:10:05', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (93, '删除', NULL, 'plugin\\admin\\app\\controller\\AccountController@delete', 10, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (94, '浏览附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@attachment', 11, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (95, '查询附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@select', 11, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (96, '更新附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@update', 11, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (97, '添加附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@insert', 11, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (98, '上传文件', NULL, 'plugin\\admin\\app\\controller\\UploadController@file', 11, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (99, '上传图片', NULL, 'plugin\\admin\\app\\controller\\UploadController@image', 11, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (100, '上传头像', NULL, 'plugin\\admin\\app\\controller\\UploadController@avatar', 11, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (101, '删除附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@delete', 11, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (102, '查询', NULL, 'plugin\\admin\\app\\controller\\DictController@select', 12, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (103, '插入', NULL, 'plugin\\admin\\app\\controller\\DictController@insert', 12, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (104, '更新', NULL, 'plugin\\admin\\app\\controller\\DictController@update', 12, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (105, '删除', NULL, 'plugin\\admin\\app\\controller\\DictController@delete', 12, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (106, '更改', NULL, 'plugin\\admin\\app\\controller\\ConfigController@update', 13, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (107, '列表', NULL, 'plugin\\admin\\app\\controller\\PluginController@list', 15, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (108, '安装', NULL, 'plugin\\admin\\app\\controller\\PluginController@install', 15, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (109, '卸载', NULL, 'plugin\\admin\\app\\controller\\PluginController@uninstall', 15, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (110, '支付', NULL, 'plugin\\admin\\app\\controller\\PluginController@pay', 15, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (111, '登录官网', NULL, 'plugin\\admin\\app\\controller\\PluginController@login', 15, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (112, '获取已安装的插件列表', NULL, 'plugin\\admin\\app\\controller\\PluginController@getInstalledPlugins', 15, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (113, '表单构建', NULL, 'plugin\\admin\\app\\controller\\DevController@formBuild', 17, '2025-08-07 14:10:06', '2025-08-07 14:10:06', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (114, '数据优化管理', 'layui-icon-spread-left', 'app\\admin\\controller\\OrderController', 0, '2025-08-07 14:25:46', '2025-08-07 14:25:46', '/admin/order/index', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (115, '插入', NULL, 'app\\admin\\controller\\OrderController@insert', 114, '2025-08-07 14:58:36', '2025-08-07 14:58:36', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (116, '更新', NULL, 'app\\admin\\controller\\OrderController@update', 114, '2025-08-07 14:58:36', '2025-08-07 14:58:36', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (117, '查询', NULL, 'app\\admin\\controller\\OrderController@select', 114, '2025-08-07 14:58:36', '2025-08-07 14:58:36', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (118, '删除', NULL, 'app\\admin\\controller\\OrderController@delete', 114, '2025-08-07 14:58:36', '2025-08-07 14:58:36', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (119, '复制', NULL, 'app\\admin\\controller\\OrderController@copy', 114, '2025-08-09 09:53:57', '2025-08-09 09:53:57', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (120, '用户认证', 'layui-icon-spread-left', 'app\\admin\\controller\\UserIdentityController', 0, '2025-08-11 16:20:18', '2025-08-11 16:20:18', '/admin/user-identity/index', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (121, '插入', NULL, 'app\\admin\\controller\\UserIdentityController@insert', 120, '2025-08-11 16:20:28', '2025-08-11 16:20:28', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (122, '更新', NULL, 'app\\admin\\controller\\UserIdentityController@update', 120, '2025-08-11 16:20:28', '2025-08-11 16:20:28', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (123, '查询', NULL, 'app\\admin\\controller\\UserIdentityController@select', 120, '2025-08-11 16:20:28', '2025-08-11 16:20:28', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (124, '删除', NULL, 'app\\admin\\controller\\UserIdentityController@delete', 120, '2025-08-11 16:20:28', '2025-08-11 16:20:28', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (125, '商铺认证', 'layui-icon-spread-left', 'app\\admin\\controller\\ShopController', 0, '2025-08-11 16:20:48', '2025-08-11 16:20:48', '/admin/shop/index', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (126, '插入', NULL, 'app\\admin\\controller\\ShopController@insert', 125, '2025-08-11 17:41:44', '2025-08-11 17:41:44', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (127, '更新', NULL, 'app\\admin\\controller\\ShopController@update', 125, '2025-08-11 17:41:45', '2025-08-11 17:41:45', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (128, '查询', NULL, 'app\\admin\\controller\\ShopController@select', 125, '2025-08-11 17:41:45', '2025-08-11 17:41:45', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (129, '删除', NULL, 'app\\admin\\controller\\ShopController@delete', 125, '2025-08-11 17:41:45', '2025-08-11 17:41:45', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (130, '提现管理', 'layui-icon-spread-left', 'app\\admin\\controller\\WithdrawController', 0, '2025-08-12 15:34:14', '2025-08-12 15:34:14', '/admin/withdraw/index', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (131, '查询', NULL, 'app\\admin\\controller\\WithdrawController@select', 130, '2025-08-12 17:24:14', '2025-08-12 17:24:14', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (132, '插入', NULL, 'app\\admin\\controller\\WithdrawController@insert', 130, '2025-08-12 17:24:14', '2025-08-12 17:24:14', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (133, '更新', NULL, 'app\\admin\\controller\\WithdrawController@update', 130, '2025-08-12 17:24:14', '2025-08-12 17:24:14', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (134, '删除', NULL, 'app\\admin\\controller\\WithdrawController@delete', 130, '2025-08-12 17:24:14', '2025-08-12 17:24:14', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (135, '订单预约', 'layui-icon-spread-left', 'app\\admin\\controller\\SubscribeController', 0, '2025-08-12 17:24:40', '2025-08-12 17:24:40', '/admin/subscribe/index', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (136, '查询', NULL, 'app\\admin\\controller\\SubscribeController@select', 135, '2025-08-12 17:33:03', '2025-08-12 17:33:03', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (137, '插入', NULL, 'app\\admin\\controller\\SubscribeController@insert', 135, '2025-08-12 17:33:03', '2025-08-12 17:33:03', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (138, '更新', NULL, 'app\\admin\\controller\\SubscribeController@update', 135, '2025-08-12 17:33:03', '2025-08-12 17:33:03', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (139, '删除', NULL, 'app\\admin\\controller\\SubscribeController@delete', 135, '2025-08-12 17:33:03', '2025-08-12 17:33:03', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (140, '轮播图', 'layui-icon-spread-left', 'app\\admin\\controller\\BannerController', 0, '2025-08-13 16:40:00', '2025-08-13 16:40:00', '/admin/banner/index', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (141, '插入', NULL, 'app\\admin\\controller\\BannerController@insert', 140, '2025-08-13 16:40:11', '2025-08-13 16:40:11', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (142, '更新', NULL, 'app\\admin\\controller\\BannerController@update', 140, '2025-08-13 16:40:11', '2025-08-13 16:40:11', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (143, '查询', NULL, 'app\\admin\\controller\\BannerController@select', 140, '2025-08-13 16:40:11', '2025-08-13 16:40:11', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (144, '删除', NULL, 'app\\admin\\controller\\BannerController@delete', 140, '2025-08-13 16:40:11', '2025-08-13 16:40:11', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (145, '代理商', 'layui-icon-spread-left', 'app\\admin\\controller\\AdminController', 0, '2025-08-14 15:00:31', '2025-08-14 15:00:31', '/admin/admin/index', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (146, '查询', NULL, 'app\\admin\\controller\\AdminController@select', 145, '2025-08-14 15:07:33', '2025-08-14 15:07:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (147, '插入', NULL, 'app\\admin\\controller\\AdminController@insert', 145, '2025-08-14 15:07:33', '2025-08-14 15:07:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (148, '更新', NULL, 'app\\admin\\controller\\AdminController@update', 145, '2025-08-14 15:07:33', '2025-08-14 15:07:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (149, '删除', NULL, 'app\\admin\\controller\\AdminController@delete', 145, '2025-08-14 15:07:33', '2025-08-14 15:07:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (150, '用户地址', 'layui-icon-spread-left', 'app\\admin\\controller\\UserAddressController', 0, '2025-08-14 15:39:58', '2025-08-14 15:39:58', '/admin/user-address/index', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (151, '查询', NULL, 'app\\admin\\controller\\UserAddressController@select', 150, '2025-08-14 15:42:04', '2025-08-14 15:42:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (152, '插入', NULL, 'app\\admin\\controller\\UserAddressController@insert', 150, '2025-08-14 15:42:04', '2025-08-14 15:42:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (153, '更新', NULL, 'app\\admin\\controller\\UserAddressController@update', 150, '2025-08-14 15:42:04', '2025-08-14 15:42:04', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (154, '删除', NULL, 'app\\admin\\controller\\UserAddressController@delete', 150, '2025-08-14 15:42:04', '2025-08-14 15:42:04', NULL, 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for wa_shop
-- ----------------------------
DROP TABLE IF EXISTS `wa_shop`;
CREATE TABLE `wa_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `image` varchar(255) NOT NULL COMMENT '营业执照',
  `tb_address` varchar(255) NOT NULL COMMENT '淘宝店铺地址',
  `ali_address` varchar(255) NOT NULL COMMENT '阿里店铺地址',
  `xy_address` varchar(255) NOT NULL COMMENT '闲鱼店铺地址',
  `tm_address` varchar(255) NOT NULL COMMENT '天猫店铺地址',
  `zfb_account` varchar(255) NOT NULL COMMENT '支付宝账号',
  `zfb_yc_qr` varchar(255) NOT NULL COMMENT '支付宝远程收款码',
  `zfb_sj_qr` varchar(255) NOT NULL COMMENT '支付宝商家收款码',
  `wx_sj_qr` varchar(255) NOT NULL COMMENT '微信商家收款码',
  `bank_account` varchar(255) NOT NULL COMMENT '银行卡号',
  `bank_name` varchar(255) NOT NULL COMMENT '银行名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:0=待审核,1=通过,2=拒绝',
  `reason` text COMMENT '原因',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='商铺认证';

-- ----------------------------
-- Records of wa_shop
-- ----------------------------
BEGIN;
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 23, '韦春叶', '/app/admin/upload/img/20250815/689eda1c6a72.jpeg', 'www', 'www', 'Www', 'Www', '广东省', '/app/admin/upload/img/20250815/689eda474443.jpeg', '/app/admin/upload/img/20250815/689eda5895f0.jpeg', '/app/admin/upload/img/20250815/689eda66b0d4.jpeg', '8888-1234', '8888-1234', 1, '', '2025-08-15 14:58:03', '2025-08-15 15:14:31', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 22, '张恒勇', '/app/admin/upload/img/20250815/689edff57e80.jpeg', 'www', 'www', 'www', 'www', '广东省', '/app/admin/upload/img/20250815/689ee00825c1.jpeg', '/app/admin/upload/img/20250815/689ee00b6e3c.jpeg', '/app/admin/upload/img/20250815/689ee00f0587.jpeg', '888-123', '888-123', 1, '', '2025-08-15 15:22:01', '2025-08-15 15:24:03', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 24, '韦春叶', '/app/admin/upload/img/20250815/689ee3c33875.jpg', '广州市番禺区', '广州市番禺区', '广州市番禺区', '广州市番禺区', '广州市番禺区', '/app/admin/upload/img/20250815/689ee3e44df2.jpg', '/app/admin/upload/img/20250815/689ee3ebf54d.jpg', '/app/admin/upload/img/20250815/689ee3f50a7a.jpg', '09072201040015809', '农业银行', 1, '', '2025-08-15 15:38:59', '2025-08-15 15:43:19', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 25, '周大海', '/app/admin/upload/img/20250815/689ee53fbd31.jpeg', 'www.dhdjdk', 'www.：¥：@', 'www.shdjdj', 'www.djdjdj', '上海市奉贤区奉浦大道193号', '/app/admin/upload/img/20250815/689ee59cf829.gif', '/app/admin/upload/img/20250815/689ee5a72995.jpeg', '/app/admin/upload/img/20250815/689ee5bc5b3f.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 15:46:29', '2025-08-15 15:51:53', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 29, '周先是', '/app/admin/upload/img/20250815/689ee6a92f6a.jpeg', '222.', '222.', '222.', '222.', '世界的角度讲', '/app/admin/upload/img/20250815/689ee6d4b518.jpeg', '/app/admin/upload/img/20250815/689ee6ddad97.jpeg', '/app/admin/upload/img/20250815/689ee6e3af0f.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 15:51:08', '2025-08-15 15:52:04', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 30, '张恒勇', '/app/admin/upload/img/20250815/689ee73fe74c.jpg', '深圳市', '深圳市', '深圳市', '深圳市', '深圳市', '/app/admin/upload/img/20250815/689ee761c745.jpg', '/app/admin/upload/img/20250815/689ee7687e04.jpg', '/app/admin/upload/img/20250815/689ee76d5f99.jpg', '09072201040015809', '农业银行', 1, '', '2025-08-15 15:53:54', '2025-08-15 15:54:48', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 31, '周冬雨', '/app/admin/upload/img/20250815/689ee78c9277.jpeg', '333.', '333.', '333.', '333.', '待会的角度讲', '/app/admin/upload/img/20250815/689ee7ac59d4.jpeg', '/app/admin/upload/img/20250815/689ee7b8059c.jpeg', '/app/admin/upload/img/20250815/689ee7be01ef.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 15:54:50', '2025-08-15 15:57:01', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 34, '刘昊然', '/app/admin/upload/img/20250815/689ee880f2e8.jpeg', '444.', '444.', '444.', '444.', '上海浦东', '/app/admin/upload/img/20250815/689ee89573b7.jpeg', '/app/admin/upload/img/20250815/689ee8a38aea.jpeg', '/app/admin/upload/img/20250815/689ee8b8ce66.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 15:59:04', '2025-08-15 15:59:21', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 32, '夏天', '/app/admin/upload/img/20250815/689ee884cfb4.jpg', '123456', '123456', '123456', '123456', '123456', '/app/admin/upload/img/20250815/689ee8b4b908.jpg', '/app/admin/upload/img/20250815/689ee8c78186.jpg', '/app/admin/upload/img/20250815/689ee8d954e7.jpg', '123456', '123456', 1, '', '2025-08-15 15:59:26', '2025-08-15 16:00:39', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 36, '陈明城', '/app/admin/upload/img/20250815/689eea3102d4.jpeg', '555.', '555.', '555.', '555.', '上海奉贤绿地至尊', '/app/admin/upload/img/20250815/689eea5879cc.jpeg', '/app/admin/upload/img/20250815/689eea69c910.jpeg', '/app/admin/upload/img/20250815/689eea7c436f.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 16:06:31', '2025-08-15 16:15:24', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (11, 37, '蒋雯琴', '/app/admin/upload/img/20250815/689eebcec270.jpeg', '666.', '666.', '666.', '666.', '浙江省杭州市萧山街道', '/app/admin/upload/img/20250815/689eec05f08a.jpeg', '/app/admin/upload/img/20250815/689eec0d234e.jpeg', '/app/admin/upload/img/20250815/689eec13f06e.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 16:13:28', '2025-08-15 16:15:18', NULL);
INSERT INTO `wa_shop` (`id`, `user_id`, `name`, `image`, `tb_address`, `ali_address`, `xy_address`, `tm_address`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (12, 39, '幸子', '/app/admin/upload/img/20250815/689f2c18b4ab.jpg', '1', '1', '1', '1', '1', '/app/admin/upload/img/20250815/689f2c3e45b7.png', '/app/admin/upload/img/20250815/689f2c49106d.jpg', '/app/admin/upload/img/20250815/689f2c59e96e.png', '1', '1', 1, '', '2025-08-15 20:47:37', '2025-08-15 20:55:27', NULL);
COMMIT;

-- ----------------------------
-- Table structure for wa_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `wa_subscribe`;
CREATE TABLE `wa_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `date` date NOT NULL COMMENT '日期',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:0=待审核,1=已审核',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='订单预约';

-- ----------------------------
-- Records of wa_subscribe
-- ----------------------------
BEGIN;
INSERT INTO `wa_subscribe` (`id`, `user_id`, `name`, `amount`, `date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 32, '夏天', 10000.00, '2025-08-15', 0, '2025-08-15 16:12:06', '2025-08-17 14:07:47', '2025-08-17 14:07:47');
INSERT INTO `wa_subscribe` (`id`, `user_id`, `name`, `amount`, `date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 23, '张海宇', 15000.00, '2025-08-18', 0, '2025-08-17 17:15:33', '2025-08-18 22:37:32', '2025-08-18 22:37:32');
COMMIT;

-- ----------------------------
-- Table structure for wa_uploads
-- ----------------------------
DROP TABLE IF EXISTS `wa_uploads`;
CREATE TABLE `wa_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '文件',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员',
  `file_size` int(11) NOT NULL COMMENT '文件大小',
  `mime_type` varchar(255) NOT NULL COMMENT 'mime类型',
  `image_width` int(11) DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(11) DEFAULT NULL COMMENT '图片高度',
  `ext` varchar(128) NOT NULL COMMENT '扩展名',
  `storage` varchar(255) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `created_at` date DEFAULT NULL COMMENT '上传时间',
  `category` varchar(128) DEFAULT NULL COMMENT '类别',
  `updated_at` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `admin_id` (`admin_id`),
  KEY `name` (`name`),
  KEY `ext` (`ext`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件';

-- ----------------------------
-- Records of wa_uploads
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wa_user_address
-- ----------------------------
DROP TABLE IF EXISTS `wa_user_address`;
CREATE TABLE `wa_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户',
  `default` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '默认:0=否,1=是',
  `province` varchar(50) NOT NULL COMMENT '省',
  `city` varchar(50) NOT NULL COMMENT '市',
  `region` varchar(50) NOT NULL COMMENT '区',
  `mobile` varchar(50) NOT NULL COMMENT '手机号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `lat` varchar(50) DEFAULT NULL COMMENT '纬度',
  `lng` varchar(50) DEFAULT NULL COMMENT '经度',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地址';

-- ----------------------------
-- Records of wa_user_address
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wa_user_identity
-- ----------------------------
DROP TABLE IF EXISTS `wa_user_identity`;
CREATE TABLE `wa_user_identity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `name` varchar(50) NOT NULL COMMENT '真实姓名',
  `mobile` varchar(50) NOT NULL COMMENT '手机号',
  `card_front` varchar(255) NOT NULL COMMENT '身份证正面',
  `card_reverse` varchar(255) NOT NULL COMMENT '身份证反面',
  `contract_image` varchar(255) NOT NULL COMMENT '合同照片',
  `zfb_account` varchar(255) NOT NULL COMMENT '支付宝账号',
  `zfb_yc_qr` varchar(255) NOT NULL COMMENT '支付宝远程收款码',
  `zfb_sj_qr` varchar(255) NOT NULL COMMENT '支付宝商家收款码',
  `wx_sj_qr` varchar(255) NOT NULL COMMENT '微信商家收款码',
  `bank_account` varchar(255) NOT NULL COMMENT '银行卡号',
  `bank_name` varchar(255) NOT NULL COMMENT '银行名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:0=待审核,1=通过,2=拒绝',
  `reason` text COMMENT '原因',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='用户认证';

-- ----------------------------
-- Records of wa_user_identity
-- ----------------------------
BEGIN;
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 23, '张海文', '17109989998', '/app/admin/upload/img/20250815/689edab13101.jpeg', '/app/admin/upload/img/20250815/689edaa3ba35.jpeg', '/app/admin/upload/img/20250815/689edabe6f03.png', '17109989998', '/app/admin/upload/img/20250815/689edae6d811.jpeg', '/app/admin/upload/img/20250815/689edaeccd4e.jpeg', '/app/admin/upload/img/20250815/689edafd4bbf.jpeg', '8888-1234', '8888-1234', 1, '', '2025-08-15 15:00:24', '2025-08-15 15:16:32', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 22, '张恒勇', '18812345678', '/app/admin/upload/img/20250815/689ee040e725.jpeg', '/app/admin/upload/img/20250815/689ee03c0fec.jpeg', '/app/admin/upload/img/20250815/689ee046a614.jpeg', '01', '/app/admin/upload/img/20250818/68a27dddcf7c.jpg', '/app/admin/upload/img/20250818/68a27dd5fd59.jpg', '/app/admin/upload/img/20250815/689ee075bda6.jpeg', '888', '888', 1, '', '2025-08-15 15:23:39', '2025-08-18 09:12:00', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 25, '周惠茹', '18484748488', '/app/admin/upload/img/20250815/689ee40cf2af.jpeg', '/app/admin/upload/img/20250815/689ee3ffef6e.jpeg', '/app/admin/upload/img/20250815/689ee42d4f10.jpeg', '19975870201', '/app/admin/upload/img/20250815/689ee438ee32.jpeg', '/app/admin/upload/img/20250815/689ee43f11fc.jpeg', '/app/admin/upload/img/20250815/689ee445e0fc.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 15:40:36', '2025-08-15 15:43:04', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 24, '韦春叶', '13535787763', '/app/admin/upload/img/20250815/689ee4d1fe03.jpg', '/app/admin/upload/img/20250815/689ee4c9b0ab.jpg', '/app/admin/upload/img/20250815/689ee4ec8f0e.jpg', '13535787763', '/app/admin/upload/img/20250815/689ee4fe4a2f.jpg', '/app/admin/upload/img/20250815/689ee50cc0d8.jpg', '/app/admin/upload/img/20250815/689ee51292ac.jpg', '6217995880012393274', '邮政银行', 1, '', '2025-08-15 15:43:47', '2025-08-15 15:44:20', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 29, '周先是', '19988999988', '/app/admin/upload/img/20250815/689ee6622ab9.png', '/app/admin/upload/img/20250815/689ee64c4650.jpeg', '/app/admin/upload/img/20250815/689ee66b640d.jpeg', '19975870201', '/app/admin/upload/img/20250815/689ee677ddb8.jpeg', '/app/admin/upload/img/20250815/689ee67d9306.jpeg', '/app/admin/upload/img/20250815/689ee68207d3.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 15:49:33', '2025-08-15 15:51:37', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 31, '周冬雨', '18899888899', '/app/admin/upload/img/20250815/689ee752bd22.jpeg', '/app/admin/upload/img/20250815/689ee7496138.jpeg', '/app/admin/upload/img/20250815/689ee759b1d1.jpeg', '19975870201', '/app/admin/upload/img/20250815/689ee7636435.jpeg', '/app/admin/upload/img/20250815/689ee768721a.jpeg', '/app/admin/upload/img/20250815/689ee76e4c62.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 15:53:27', '2025-08-15 15:54:31', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 32, '夏天', '15976147663', '/app/admin/upload/img/20250815/689ee7e46e14.jpg', '/app/admin/upload/img/20250815/689ee7cb38db.jpg', '/app/admin/upload/img/20250815/689ee7f6642c.jpg', '13542715220', '/app/admin/upload/img/20250815/689ee78ff917.jpg', '/app/admin/upload/img/20250815/689ee79b0d94.jpg', '/app/admin/upload/img/20250815/689ee7b0344c.png', '123456', '123456', 1, '', '2025-08-15 15:56:19', '2025-08-15 15:56:50', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 34, '刘昊然', '17700999900', '/app/admin/upload/img/20250815/689ee840f844.jpeg', '/app/admin/upload/img/20250815/689ee8399d1a.jpeg', '/app/admin/upload/img/20250815/689ee846926f.jpeg', '19975870201', '/app/admin/upload/img/20250815/689ee8511028.jpeg', '/app/admin/upload/img/20250815/689ee85891c6.jpeg', '/app/admin/upload/img/20250815/689ee85daf8f.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 15:57:40', '2025-08-15 15:58:03', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 30, '张恒勇', '18576650088', '/app/admin/upload/img/20250815/689ee848d867.jpg', '/app/admin/upload/img/20250815/689ee841a4cd.jpg', '/app/admin/upload/img/20250815/689ee84ebb2a.jpg', '18574659088', '/app/admin/upload/img/20250815/689ee85a55b1.jpg', '/app/admin/upload/img/20250815/689ee860070b.jpg', '/app/admin/upload/img/20250815/689ee8678655.png', '18574659088', '0902201040015809', 1, '', '2025-08-15 15:57:55', '2025-08-15 15:58:58', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 36, '陈明城', '13787117879', '/app/admin/upload/img/20250815/689ee9ee6cc1.jpeg', '/app/admin/upload/img/20250815/689ee9e75f92.jpeg', '/app/admin/upload/img/20250815/689ee9f57b44.jpeg', '19975870201', '/app/admin/upload/img/20250815/689eea01f9f3.jpeg', '/app/admin/upload/img/20250815/689eea0692c0.jpeg', '/app/admin/upload/img/20250815/689eea0c5947.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 16:04:37', '2025-08-15 16:06:12', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (11, 37, '蒋雯琴', '16613416440', '/app/admin/upload/img/20250815/689eeb922024.jpeg', '/app/admin/upload/img/20250815/689eeb8beb85.jpeg', '/app/admin/upload/img/20250815/689eeb99c038.jpeg', '19975870201', '/app/admin/upload/img/20250815/689eeba4f4db.jpeg', '/app/admin/upload/img/20250815/689eebacfa1c.jpeg', '/app/admin/upload/img/20250815/689eebb24c4e.jpeg', '6222034200011533007', '中国工商银行', 1, '', '2025-08-15 16:11:40', '2025-08-15 16:15:05', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (12, 38, '金妍', '18842665432', '/app/admin/upload/img/20250815/689f24376416.jpeg', '/app/admin/upload/img/20250815/689f2433e61c.jpeg', '/app/admin/upload/img/20250815/689f243ba530.jpeg', '18842665432', '/app/admin/upload/img/20250815/689f2453419c.jpeg', '/app/admin/upload/img/20250815/689f2457de29.jpeg', '/app/admin/upload/img/20250815/689f245baa0d.jpeg', '0-0', '0-0', 1, '', '2025-08-15 20:13:24', '2025-08-15 20:13:37', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (13, 39, '幸子', '13824459409', '/app/admin/upload/img/20250815/689f2cc84574.jpg', '/app/admin/upload/img/20250815/689f2cbefdb6.png', '/app/admin/upload/img/20250815/689f2cd13ed1.png', '13829902076', '/app/admin/upload/img/20250815/689f2c94d526.jpg', '/app/admin/upload/img/20250815/689f2c9ec8ae.jpg', '/app/admin/upload/img/20250815/689f2cab160d.png', '1', '1', 1, '', '2025-08-15 20:49:32', '2025-08-15 20:55:10', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 40, '张清英', '0-0', '/app/admin/upload/img/20250817/68a1e8f1b2b7.jpeg', '/app/admin/upload/img/20250817/68a1e8ec16bb.jpeg', '/app/admin/upload/img/20250817/68a1e8f52c43.jpeg', '0-0', '/app/admin/upload/img/20250817/68a1e90f173c.jpeg', '/app/admin/upload/img/20250817/68a1e913bf2b.jpeg', '/app/admin/upload/img/20250817/68a1e91718bd.jpeg', '0-0', '0-0', 1, '', '2025-08-17 22:37:18', '2025-08-17 22:37:29', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (15, 41, '熊悠悠', '17688530654', '/app/admin/upload/img/20250817/68a1e9a502e7.jpeg', '/app/admin/upload/img/20250817/68a1e99e9153.jpeg', '/app/admin/upload/img/20250817/68a1e9aadbb2.jpeg', '0-0', '/app/admin/upload/img/20250817/68a1e9d6dc15.jpeg', '/app/admin/upload/img/20250817/68a1e9dba5d1.jpeg', '/app/admin/upload/img/20250817/68a1e9e01bf8.jpeg', '0-0', '0-0', 1, '', '2025-08-17 22:40:47', '2025-08-17 22:40:59', NULL);
INSERT INTO `wa_user_identity` (`id`, `user_id`, `name`, `mobile`, `card_front`, `card_reverse`, `contract_image`, `zfb_account`, `zfb_yc_qr`, `zfb_sj_qr`, `wx_sj_qr`, `bank_account`, `bank_name`, `status`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES (16, 43, '罗慧艳', '13928805346', '/app/admin/upload/img/20250818/68a2f25d59ef.jpeg', '/app/admin/upload/img/20250818/68a2f2529316.jpeg', '/app/admin/upload/img/20250818/68a2f268c060.jpeg', '13928805346', '/app/admin/upload/img/20250818/68a2f280c6f5.png', '/app/admin/upload/img/20250818/68a2f285d6b1.png', '/app/admin/upload/img/20250818/68a2f28c8235.jpeg', '0-0', '0-0', 1, '', '2025-08-18 17:29:57', '2025-08-18 17:30:26', NULL);
COMMIT;

-- ----------------------------
-- Table structure for wa_user_layer
-- ----------------------------
DROP TABLE IF EXISTS `wa_user_layer`;
CREATE TABLE `wa_user_layer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `layer` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='会员节点';

-- ----------------------------
-- Records of wa_user_layer
-- ----------------------------
BEGIN;
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (1, 22, 1, 1, '2025-08-15 14:32:06', '2025-08-15 14:32:06');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (2, 23, 1, 1, '2025-08-15 14:38:23', '2025-08-15 14:38:23');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (3, 24, 22, 1, '2025-08-15 15:30:27', '2025-08-15 15:30:27');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (4, 24, 1, 2, '2025-08-15 15:30:27', '2025-08-15 15:30:27');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (5, 25, 22, 1, '2025-08-15 15:32:34', '2025-08-15 15:32:34');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (6, 25, 1, 2, '2025-08-15 15:32:34', '2025-08-15 15:32:34');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (7, 26, 22, 1, '2025-08-15 15:42:57', '2025-08-15 15:42:57');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (8, 26, 1, 2, '2025-08-15 15:42:57', '2025-08-15 15:42:57');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (9, 27, 22, 1, '2025-08-15 15:43:18', '2025-08-15 15:43:18');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (10, 27, 1, 2, '2025-08-15 15:43:18', '2025-08-15 15:43:18');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (11, 28, 22, 1, '2025-08-15 15:47:04', '2025-08-15 15:47:04');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (12, 28, 1, 2, '2025-08-15 15:47:04', '2025-08-15 15:47:04');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (13, 29, 22, 1, '2025-08-15 15:47:45', '2025-08-15 15:47:45');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (14, 29, 1, 2, '2025-08-15 15:47:45', '2025-08-15 15:47:45');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (15, 30, 22, 1, '2025-08-15 15:50:43', '2025-08-15 15:50:43');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (16, 30, 1, 2, '2025-08-15 15:50:43', '2025-08-15 15:50:43');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (17, 31, 22, 1, '2025-08-15 15:52:03', '2025-08-15 15:52:03');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (18, 31, 1, 2, '2025-08-15 15:52:03', '2025-08-15 15:52:03');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (19, 32, 22, 1, '2025-08-15 15:52:26', '2025-08-15 15:52:26');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (20, 32, 1, 2, '2025-08-15 15:52:27', '2025-08-15 15:52:27');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (21, 33, 22, 1, '2025-08-15 15:54:14', '2025-08-15 15:54:14');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (22, 33, 1, 2, '2025-08-15 15:54:14', '2025-08-15 15:54:14');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (23, 34, 22, 1, '2025-08-15 15:56:01', '2025-08-15 15:56:01');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (24, 34, 1, 2, '2025-08-15 15:56:01', '2025-08-15 15:56:01');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (25, 35, 22, 1, '2025-08-15 16:00:51', '2025-08-15 16:00:51');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (26, 35, 1, 2, '2025-08-15 16:00:51', '2025-08-15 16:00:51');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (27, 36, 22, 1, '2025-08-15 16:03:09', '2025-08-15 16:03:09');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (28, 36, 1, 2, '2025-08-15 16:03:09', '2025-08-15 16:03:09');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (29, 37, 22, 1, '2025-08-15 16:09:55', '2025-08-15 16:09:55');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (30, 37, 1, 2, '2025-08-15 16:09:55', '2025-08-15 16:09:55');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (31, 38, 22, 1, '2025-08-15 18:48:28', '2025-08-15 18:48:28');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (32, 38, 1, 2, '2025-08-15 18:48:28', '2025-08-15 18:48:28');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (33, 39, 22, 1, '2025-08-15 20:45:00', '2025-08-15 20:45:00');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (34, 39, 1, 2, '2025-08-15 20:45:00', '2025-08-15 20:45:00');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (35, 40, 1, 1, '2025-08-17 22:35:19', '2025-08-17 22:35:19');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (36, 41, 1, 1, '2025-08-17 22:38:32', '2025-08-17 22:38:32');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (37, 42, 1, 1, '2025-08-18 09:35:18', '2025-08-18 09:35:18');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (38, 43, 38, 1, '2025-08-18 17:27:12', '2025-08-18 17:27:12');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (39, 43, 22, 2, '2025-08-18 17:27:12', '2025-08-18 17:27:12');
INSERT INTO `wa_user_layer` (`id`, `user_id`, `parent_id`, `layer`, `created_at`, `updated_at`) VALUES (40, 43, 1, 3, '2025-08-18 17:27:12', '2025-08-18 17:27:12');
COMMIT;

-- ----------------------------
-- Table structure for wa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `wa_user_money_log`;
CREATE TABLE `wa_user_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` text COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变动记录';

-- ----------------------------
-- Records of wa_user_money_log
-- ----------------------------
BEGIN;
INSERT INTO `wa_user_money_log` (`id`, `user_id`, `money`, `before`, `after`, `memo`, `created_at`, `updated_at`) VALUES (1, 22, 50.14, 0.00, 50.14, '直推收益', '2025-08-18 09:39:53', '2025-08-18 09:39:53');
INSERT INTO `wa_user_money_log` (`id`, `user_id`, `money`, `before`, `after`, `memo`, `created_at`, `updated_at`) VALUES (2, 22, 100.09, 50.14, 150.23, '直推收益', '2025-08-18 09:57:24', '2025-08-18 09:57:24');
INSERT INTO `wa_user_money_log` (`id`, `user_id`, `money`, `before`, `after`, `memo`, `created_at`, `updated_at`) VALUES (3, 38, 18.00, 0.00, 18.00, '会员余额变动', '2025-08-18 10:24:33', '2025-08-18 10:24:33');
INSERT INTO `wa_user_money_log` (`id`, `user_id`, `money`, `before`, `after`, `memo`, `created_at`, `updated_at`) VALUES (4, 32, 18.00, 0.00, 18.00, '会员余额变动', '2025-08-18 10:24:48', '2025-08-18 10:24:48');
INSERT INTO `wa_user_money_log` (`id`, `user_id`, `money`, `before`, `after`, `memo`, `created_at`, `updated_at`) VALUES (5, 39, 18.00, 0.00, 18.00, '会员余额变动', '2025-08-18 10:26:05', '2025-08-18 10:26:05');
INSERT INTO `wa_user_money_log` (`id`, `user_id`, `money`, `before`, `after`, `memo`, `created_at`, `updated_at`) VALUES (6, 22, 50.04, 150.23, 200.27, '直推收益', '2025-08-18 10:40:50', '2025-08-18 10:40:50');
COMMIT;

-- ----------------------------
-- Table structure for wa_users
-- ----------------------------
DROP TABLE IF EXISTS `wa_users`;
CREATE TABLE `wa_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_id` int(11) DEFAULT NULL COMMENT '代理商',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(40) DEFAULT '' COMMENT '昵称',
  `password` varchar(255) DEFAULT '' COMMENT '密码',
  `sex` enum('0','1') NOT NULL DEFAULT '1' COMMENT '性别',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '等级',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额(元)',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `last_time` datetime DEFAULT NULL COMMENT '登录时间',
  `last_ip` varchar(50) DEFAULT NULL COMMENT '登录ip',
  `join_time` datetime DEFAULT NULL COMMENT '注册时间',
  `join_ip` varchar(50) DEFAULT NULL COMMENT '注册ip',
  `token` varchar(50) DEFAULT NULL COMMENT 'token',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `role` int(11) NOT NULL DEFAULT '1' COMMENT '角色',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '禁用',
  `invite_code` varchar(20) NOT NULL COMMENT '邀请码',
  `parent_id` int(11) NOT NULL COMMENT '上级',
  `total_service_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总服务费',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额(交易金额+客户收益)',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `total_trade_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总订单收益',
  `total_withdraw_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总提现金额',
  `total_push_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计直推金额',
  PRIMARY KEY (`id`),
  KEY `join_time` (`join_time`),
  KEY `mobile` (`mobile`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of wa_users
-- ----------------------------
BEGIN;
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (1, NULL, NULL, '阿沁', NULL, '1', '/app/admin/avatar.png', NULL, NULL, 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 13:28:28', 1, 0, '981225', 0, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (22, NULL, NULL, '张恒勇', '$2y$10$0nTu51RTYe3LEZkgw4jPAuMcbaqi0gmwkeM54DXjB4mTgY.0V6KOe', '1', '/app/admin/upload/img/20250815/689ee0a13a20.jpeg', NULL, '18812345678', 0, NULL, 200.27, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 14:32:06', '2025-08-18 10:40:50', 1, 0, '24037', 1, 0.00, 0.00, NULL, 0.00, 0.00, 200.27);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (23, NULL, NULL, '韦春叶', '$2y$10$DHIt2MJPWf3UJxTvLe.veueywnfWsn.QF0cyT9j3xLD49HGXX1e1K', '1', '/app/admin/avatar.png', NULL, '17109989998', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 14:38:23', '2025-08-15 15:13:59', 1, 0, '42414', 1, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (24, NULL, NULL, '韦春叶', '$2y$10$5F74ZF07GCwSQeteKRWuh.H.lGtjvfgtXLZXr9AyLhEqFfA0XEjn2', '1', '/app/admin/avatar.png', NULL, '18574659988', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:30:27', '2025-08-15 15:44:20', 1, 0, '57963', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (25, NULL, NULL, '周惠茹', '$2y$10$mjG5jOUve2tmJs4jMufSc..7LYAkIEjozheFQhs1FGzqmGoDqTP8u', '1', '/app/admin/avatar.png', NULL, '16602146447', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:32:34', '2025-08-15 15:43:04', 1, 0, '69402', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (26, NULL, NULL, '', '$2y$10$wtObGywG/aUZdusEjH823uzTQ0/juS3B03e5tfqmawQXWPy.SKy.a', '1', '/app/admin/avatar.png', NULL, '13631916344', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:42:57', '2025-08-15 15:42:57', 1, 0, '19841', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (27, NULL, NULL, '', '$2y$10$1/f6xptifTzrGEvCujJRKuVUUa9aZOKdZmq5c9oljgVGNdEklpk/i', '1', '/app/admin/avatar.png', NULL, '13760424334', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:43:18', '2025-08-15 15:43:18', 1, 0, '67151', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (28, NULL, NULL, '', '$2y$10$9DNdGQySWWoX2.dEtd8.UOQkB5gIlbRfJPbxhPHO4ryKVuEdgCztO', '1', '/app/admin/avatar.png', NULL, '1948474748', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:47:04', '2025-08-15 15:47:04', 1, 0, '74387', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (29, NULL, NULL, '周先是', '$2y$10$5mXVgvqM8/40QKAyaq74POie8LoSnmc4T/xBwBBYvtUoCwptxnNCy', '1', '/app/admin/avatar.png', NULL, '19988999988', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:47:45', '2025-08-15 15:51:37', 1, 0, '83738', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (30, NULL, NULL, '张恒勇', '$2y$10$tvt32BLIn0Ao3/k0cmQa2.CRFPP9rvx9.c2vt558GrOzJ/Os8orra', '1', '/app/admin/avatar.png', NULL, '18576650088', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:50:43', '2025-08-15 15:58:58', 1, 0, '35881', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (31, NULL, NULL, '周冬雨', '$2y$10$vYCWgb5QrerlKJ.Z4WwXu.pmWk0ZvR6dx6bwwPx2rtKoSD1i8nlQm', '1', '/app/admin/avatar.png', NULL, '18899888899', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:52:03', '2025-08-15 15:54:31', 1, 0, '28873', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (32, NULL, NULL, '夏天', '$2y$10$qfVWg8u9UQZ3p2AZr9ulK.ETGoz9Ozdh4UTJc8qGiZs4SbWykelAK', '1', '/app/admin/upload/img/20250815/689ee9b20529.jpg', NULL, '15976147663', 0, NULL, 18.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:52:26', '2025-08-18 10:24:48', 1, 0, '12657', 22, 500.45, 20318.27, NULL, 300.27, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (33, NULL, NULL, '', '$2y$10$D12yhFT8ymOIuNEJvEq2h.aJC.tUZNedMfx8/SmA5TNXhQ/ImZsWC', '1', '/app/admin/avatar.png', NULL, '13265614650', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:54:14', '2025-08-15 15:54:14', 1, 0, '20736', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (34, NULL, NULL, '刘昊然', '$2y$10$LbvGpihDci91ppqTd/wbjuCWYRoAIt.wXjNCSZzH.phEX.Aewk1Ke', '1', '/app/admin/avatar.png', NULL, '17700999900', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 15:56:01', '2025-08-15 15:58:03', 1, 0, '12920', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (35, NULL, NULL, '', '$2y$10$6Kp4JGNPXLXmIREGdOcyauVDoCLFFa2jRmvarA3bZrOibtW2W.2zC', '1', '/app/admin/avatar.png', NULL, '16608091212', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 16:00:51', '2025-08-15 16:00:51', 1, 0, '62939', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (36, NULL, NULL, '陈明城', '$2y$10$ySL9ha0pJydcXsun1TaJ5.caCZOOtfAosi4MeR8/g4JLBdbuTNF5.', '1', '/app/admin/avatar.png', NULL, '13787117879', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 16:03:09', '2025-08-15 16:06:12', 1, 0, '13456', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (37, NULL, NULL, '蒋雯琴', '$2y$10$cck1kPvGkkIwmFZStffHMOlMH80hSvyyBqJVeyIuanm3sJdFwC2Vy', '1', '/app/admin/avatar.png', NULL, '16613416440', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 16:09:55', '2025-08-15 16:15:05', 1, 0, '13848', 22, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (38, NULL, NULL, '金妍', '$2y$10$hedRhEAbMc4bi02DDNyeyuBBZnAqD8WbMWMo5TDSIHMpObaRsPWky', '1', '/app/admin/upload/img/20250815/689f52f208ca.jpeg', NULL, '18842665432', 0, NULL, 18.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 18:48:28', '2025-08-18 10:24:33', 1, 0, '12961', 22, 250.70, 10178.42, NULL, 150.42, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (39, NULL, NULL, '幸子', '$2y$10$8fDIy/WK6Fo2y.7FDshykO3Chz/tN.5bfT6K68tfOa4YUXyNQ.eqG', '1', '/app/admin/avatar.png', NULL, '13824459409', 0, NULL, 18.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 20:45:00', '2025-08-18 10:40:50', 1, 0, '77421', 22, 250.20, 10158.12, NULL, 150.12, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (40, NULL, NULL, '张清英', '$2y$10$hD59mT0gSE6P1Fy137MXsOhMZdq0oB2QjP8QEhOXCkNeMYTFpnUJe', '1', '/app/admin/avatar.png', NULL, '13143030271', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-17 22:35:18', '2025-08-17 22:37:28', 1, 0, '44741', 1, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (41, NULL, NULL, '熊悠悠', '$2y$10$PjzDX9la0.CeSNrqucv4muUyByZRbrXo.1Qr3YbIkbI7.vGi11P26', '1', '/app/admin/avatar.png', NULL, '17688530653', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-17 22:38:31', '2025-08-17 22:40:59', 1, 0, '76218', 1, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (42, NULL, NULL, '', '$2y$10$BhE2rQh1wqGhUohvDsvbc.MEDZ0UFazd.SFGTC0.6OhMNER3Grr/6', '1', '/app/admin/avatar.png', NULL, '15324932105', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-18 09:35:18', '2025-08-18 09:35:18', 1, 0, '62225', 1, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
INSERT INTO `wa_users` (`id`, `admin_id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `invite_code`, `parent_id`, `total_service_amount`, `total_amount`, `deleted_at`, `total_trade_amount`, `total_withdraw_amount`, `total_push_amount`) VALUES (43, NULL, NULL, '罗慧艳', '$2y$10$YNlH4NRqV12lMFTd9ybvN.sHYWFg914CX9l0/JOfylbx2fZjaueNi', '1', '/app/admin/avatar.png', NULL, '13928805346', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-18 17:27:12', '2025-08-18 17:35:38', 1, 0, '15932', 38, 0.00, 0.00, NULL, 0.00, 0.00, 0.00);
COMMIT;

-- ----------------------------
-- Table structure for wa_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `wa_withdraw`;
CREATE TABLE `wa_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `account_id` int(11) NOT NULL COMMENT '账户',
  `amount` decimal(10,2) NOT NULL COMMENT '提现金额',
  `fee_rate` float(5,2) NOT NULL COMMENT '手续费率',
  `fee_amount` decimal(10,2) NOT NULL COMMENT '手续费',
  `into_amount` decimal(10,2) NOT NULL COMMENT '到账金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:0=待审核,1=通过,2=驳回',
  `reason` text COMMENT '原因',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现记录';

-- ----------------------------
-- Records of wa_withdraw
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
