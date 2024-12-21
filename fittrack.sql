/*
Navicat MySQL Data Transfer

Source Server         : taobao_pro
Source Server Version : 80021
Source Host           : localhost:3306
Source Database       : tb_sport_uni

Target Server Type    : MYSQL
Target Server Version : 80021
File Encoding         : 65001

Date: 2024-12-21 20:34:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'sys_product', '商品信息', null, null, 'SysProduct', 'crud', '', 'com.nofantasy.project.system', 'system', 'product', '商品信息', 'nofantasy', '0', '/', null, 'admin', '2024-12-21 18:26:44', '', null, null);
INSERT INTO `gen_table` VALUES ('2', 'user_jf', '用户积分表', null, null, 'UserJf', 'crud', '', 'com.nofantasy.project.system', 'system', 'jf', '用户积分', 'nofantasy', '0', '/', null, 'admin', '2024-12-21 18:26:44', '', null, null);
INSERT INTO `gen_table` VALUES ('3', 'user_jf_pro_record', '用户积分兑换记录', null, null, 'UserJfProRecord', 'crud', 'element-ui', 'com.nofantasy.project.system', 'system', 'userJfProRecord', '用户积分兑换记录', 'nofantasy', '0', '/', '{}', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:58:36', null);
INSERT INTO `gen_table` VALUES ('4', 'user_recipe_plan', '用户菜谱计划', null, null, 'UserRecipePlan', 'crud', '', 'com.nofantasy.project.system', 'system', 'plan', '用户菜谱计划', 'nofantasy', '0', '/', null, 'admin', '2024-12-21 18:26:44', '', null, null);
INSERT INTO `gen_table` VALUES ('5', 'user_run_record', '用户运动记录', null, null, 'UserRunRecord', 'crud', '', 'com.nofantasy.project.system', 'system', 'record', '用户运动记录', 'nofantasy', '0', '/', null, 'admin', '2024-12-21 18:26:44', '', null, null);
INSERT INTO `gen_table` VALUES ('6', 'user_sport_plan', '用户运动计划', null, null, 'UserSportPlan', 'crud', 'element-ui', 'com.nofantasy.project.system', 'system', 'userSportPlan', '用户运动计划', 'nofantasy', '0', '/', '{}', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:59:07', null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('2', '1', 'img', '图片', 'varchar(255)', 'String', 'img', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('3', '1', 'name', '商品名称', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('4', '1', 'descript', '商品描述', 'varchar(255)', 'String', 'descript', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('5', '1', 'need_jf', '兑换积分', 'varchar(255)', 'String', 'needJf', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('6', '2', 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('7', '2', 'type', '类型', 'varchar(255)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', '2', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('8', '2', 'num', '数量', 'int', 'Long', 'num', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('9', '2', 'user_id', '用户ID', 'int', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('10', '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', null, null, null, 'EQ', 'datetime', '', '5', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('11', '3', 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:58:36');
INSERT INTO `gen_table_column` VALUES ('12', '3', 'user_id', '用户ID', 'int', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:58:36');
INSERT INTO `gen_table_column` VALUES ('13', '3', 'xh_jf', '消耗积分', 'varchar(255)', 'String', 'xhJf', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:58:36');
INSERT INTO `gen_table_column` VALUES ('14', '3', 'pro_id', '商品ID', 'int', 'Long', 'proId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:58:36');
INSERT INTO `gen_table_column` VALUES ('15', '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', null, null, null, 'EQ', 'datetime', '', '5', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:58:36');
INSERT INTO `gen_table_column` VALUES ('16', '4', 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('17', '4', 'user_id', '用户ID', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('18', '4', 'type', '类型', 'varchar(255)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '3', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('19', '4', 'name', '菜谱名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('20', '4', 'description', '描述', 'varchar(255)', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('21', '4', 'image', '图片', 'varchar(255)', 'String', 'image', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', '6', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('22', '5', 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('23', '5', 'times', '时长', 'varchar(50)', 'String', 'times', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('24', '5', 'speed', '时速', 'double', 'Long', 'speed', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('25', '5', 'distance', '公里数', 'double', 'Long', 'distance', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('26', '5', 'calories', '卡路里', 'varchar(255)', 'String', 'calories', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('27', '5', 'useer_id', '用户ID', 'int', 'Long', 'useerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2024-12-21 18:26:44', '', null);
INSERT INTO `gen_table_column` VALUES ('28', '6', 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:59:07');
INSERT INTO `gen_table_column` VALUES ('29', '6', 'user_id', '用户ID', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:59:07');
INSERT INTO `gen_table_column` VALUES ('30', '6', 'height', '身高', 'int', 'Long', 'height', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:59:07');
INSERT INTO `gen_table_column` VALUES ('31', '6', 'weight', '体重', 'varchar(255)', 'String', 'weight', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:59:07');
INSERT INTO `gen_table_column` VALUES ('32', '6', 'age', null, 'varchar(255)', 'String', 'age', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:59:07');
INSERT INTO `gen_table_column` VALUES ('33', '6', 'gender', '性别', 'varchar(255)', 'String', 'gender', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:59:07');
INSERT INTO `gen_table_column` VALUES ('34', '6', 'calories', '目标卡路里', 'varchar(255)', 'String', 'calories', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:59:07');
INSERT INTO `gen_table_column` VALUES ('35', '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', null, null, null, 'EQ', 'datetime', '', '8', 'admin', '2024-12-21 18:26:44', '', '2024-12-21 18:59:07');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-12-05 20:58:29', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-12-05 20:58:29', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-12-05 20:58:29', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-12-05 20:58:29', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-12-05 20:58:29', '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('6', '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-12-05 20:58:29', '', null, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 20:58:29', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-12-05 20:58:29', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-12-05 20:58:29', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-12-05 20:58:29', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-12-05 20:58:29', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-12-05 20:58:29', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-12-05 20:58:29', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-12-05 20:58:29', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-12-05 20:58:29', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-12-05 20:58:29', '', null, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2024-12-05 20:58:29', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2024-12-05 20:58:29', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2024-12-05 20:58:29', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2024-12-05 20:58:29', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2024-12-05 20:58:29', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2024-12-05 20:58:29', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2024-12-05 20:58:29', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2024-12-05 20:58:29', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2024-12-05 20:58:29', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2024-12-05 20:58:29', '', null, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-12-05 20:58:30', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-12-05 20:58:30', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-12-05 20:58:30', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-12-06 09:56:21');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '192.168.35.13', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码已失效', '2024-12-06 10:29:44');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '192.168.35.13', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-06 10:29:50');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '192.168.35.13', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-12-06 10:35:15');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '192.168.35.13', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-12-06 10:35:19');
INSERT INTO `sys_logininfor` VALUES ('105', '微信用户H338bi6r', '192.168.35.8', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '退出成功', '2024-12-06 13:42:35');
INSERT INTO `sys_logininfor` VALUES ('106', 'e80186kr', '192.168.35.8', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '退出成功', '2024-12-06 13:46:28');
INSERT INTO `sys_logininfor` VALUES ('107', '4292206L', '192.168.35.13', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码已失效', '2024-12-06 13:47:02');
INSERT INTO `sys_logininfor` VALUES ('108', '4292206L', '192.168.35.13', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-06 13:47:07');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '192.168.35.13', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2024-12-06 14:14:39');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '192.168.35.13', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-06 14:14:43');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '192.168.35.13', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-06 14:16:46');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '192.168.35.13', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-06 14:25:33');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '192.168.35.13', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-06 14:28:07');
INSERT INTO `sys_logininfor` VALUES ('114', '6lqA67gA', '192.168.0.101', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2024-12-06 20:51:00');
INSERT INTO `sys_logininfor` VALUES ('115', '6lqA67gA', '192.168.0.101', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-12-06 20:51:19');
INSERT INTO `sys_logininfor` VALUES ('116', '6lqA67gA', '192.168.0.101', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2024-12-06 20:57:19');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '192.168.0.101', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-12-06 20:57:59');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '192.168.0.101', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码已失效', '2024-12-06 22:05:14');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2024-12-06 22:25:54');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-12-06 22:28:11');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '192.168.0.101', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-06 22:29:01');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-12-20 14:42:50');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '192.168.0.100', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-12-20 14:43:56');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '192.168.0.100', '内网IP', 'Chrome 53', 'Windows 7', '0', '登录成功', '2024-12-20 14:44:26');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '192.168.0.100', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码已失效', '2024-12-20 14:47:36');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '192.168.0.100', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-20 14:47:43');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '192.168.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-20 14:50:09');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '192.168.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-20 14:51:11');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '192.168.0.100', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-12-20 15:07:09');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 12:04:23');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'iOS 10 (iPhone)', '0', '登录成功', '2024-12-21 13:05:20');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 13:17:17');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 14:07:35');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 14:11:55');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 14:12:11');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 14:15:11');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 14:23:59');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 14:33:24');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 15:10:51');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 17:49:21');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 17:52:52');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '192.168.0.104', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-12-21 17:54:23');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-12-21 18:14:04');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-12-21 18:56:35');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2024 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2024-12-05 20:58:29', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2024-12-05 20:58:29', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2024-12-05 20:58:29', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '4', 'http://ruoyi.vip', null, '', '', '0', '0', 'M', '0', '0', '', 'guide', 'admin', '2024-12-05 20:58:29', '', null, '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-12-05 20:58:29', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-12-05 20:58:29', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-12-05 20:58:29', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-12-05 20:58:29', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-12-05 20:58:29', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-12-05 20:58:29', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-12-05 20:58:29', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-12-05 20:58:29', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2024-12-05 20:58:29', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-12-05 20:58:29', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-12-05 20:58:29', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-12-05 20:58:29', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-12-05 20:58:29', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-12-05 20:58:29', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-12-05 20:58:29', '', null, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-12-05 20:58:29', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-12-05 20:58:29', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-12-05 20:58:29', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-12-05 20:58:29', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-12-05 20:58:29', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '账户解锁', '501', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '6', '#', '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '116', '1', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '116', '2', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '116', '3', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '116', '4', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '116', '5', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '116', '6', '#', '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '用户积分', '3', '1', 'jf', 'system/jf/index', null, '', '1', '0', 'C', '0', '0', 'system:jf:list', '#', 'admin', '2024-12-21 18:41:09', '', null, '用户积分菜单');
INSERT INTO `sys_menu` VALUES ('2001', '用户积分查询', '2000', '1', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:jf:query', '#', 'admin', '2024-12-21 18:41:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2002', '用户积分新增', '2000', '2', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:jf:add', '#', 'admin', '2024-12-21 18:41:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '用户积分修改', '2000', '3', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:jf:edit', '#', 'admin', '2024-12-21 18:41:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '用户积分删除', '2000', '4', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:jf:remove', '#', 'admin', '2024-12-21 18:41:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '用户积分导出', '2000', '5', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:jf:export', '#', 'admin', '2024-12-21 18:41:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '用户菜谱计划', '3', '1', 'plan', 'system/plan/index', null, '', '1', '0', 'C', '0', '0', 'system:plan:list', '#', 'admin', '2024-12-21 18:41:17', '', null, '用户菜谱计划菜单');
INSERT INTO `sys_menu` VALUES ('2007', '用户菜谱计划查询', '2006', '1', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:plan:query', '#', 'admin', '2024-12-21 18:41:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2008', '用户菜谱计划新增', '2006', '2', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:plan:add', '#', 'admin', '2024-12-21 18:41:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '用户菜谱计划修改', '2006', '3', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:plan:edit', '#', 'admin', '2024-12-21 18:41:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '用户菜谱计划删除', '2006', '4', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:plan:remove', '#', 'admin', '2024-12-21 18:41:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '用户菜谱计划导出', '2006', '5', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:plan:export', '#', 'admin', '2024-12-21 18:41:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '商品信息', '3', '1', 'product', 'system/product/index', null, '', '1', '0', 'C', '0', '0', 'system:product:list', '#', 'admin', '2024-12-21 18:41:24', '', null, '商品信息菜单');
INSERT INTO `sys_menu` VALUES ('2013', '商品信息查询', '2012', '1', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:product:query', '#', 'admin', '2024-12-21 18:41:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '商品信息新增', '2012', '2', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:product:add', '#', 'admin', '2024-12-21 18:41:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '商品信息修改', '2012', '3', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:product:edit', '#', 'admin', '2024-12-21 18:41:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '商品信息删除', '2012', '4', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:product:remove', '#', 'admin', '2024-12-21 18:41:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '商品信息导出', '2012', '5', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:product:export', '#', 'admin', '2024-12-21 18:41:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '用户积分兑换记录', '3', '1', 'record', 'system/record/index', null, '', '1', '0', 'C', '0', '0', 'system:record:list', '#', 'admin', '2024-12-21 18:41:29', '', null, '用户积分兑换记录菜单');
INSERT INTO `sys_menu` VALUES ('2019', '用户积分兑换记录查询', '2018', '1', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:record:query', '#', 'admin', '2024-12-21 18:41:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '用户积分兑换记录新增', '2018', '2', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:record:add', '#', 'admin', '2024-12-21 18:41:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '用户积分兑换记录修改', '2018', '3', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:record:edit', '#', 'admin', '2024-12-21 18:41:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '用户积分兑换记录删除', '2018', '4', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:record:remove', '#', 'admin', '2024-12-21 18:41:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '用户积分兑换记录导出', '2018', '5', '#', '', null, '', '1', '0', 'F', '0', '0', 'system:record:export', '#', 'admin', '2024-12-21 18:41:29', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-12-05 20:58:30', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-12-05 20:58:30', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '2', 'com.hell.project.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2024-12-06 10:09:04\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"5hj38n43YW48NwK4\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"000W6akT74A87D7P\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-12-06 10:20:47', '91');
INSERT INTO `sys_oper_log` VALUES ('101', '用户头像', '2', 'com.hell.project.system.controller.SysProfileController.avatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/avatar', '192.168.35.13', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/12/06/1733466692747_20241206143133A001.png\",\"code\":200}', '0', null, '2024-12-06 14:31:34', '467');
INSERT INTO `sys_oper_log` VALUES ('102', '用户头像', '2', 'com.hell.project.system.controller.SysProfileController.avatar()', 'POST', '1', '6lqA67gA', null, '/system/user/profile/avatar', '192.168.0.101', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/12/06/xlRsi5av6j008b8130721c778ec1c6c6fcda00ca1d22_20241206205016A001.png\",\"code\":200}', '0', null, '2024-12-06 20:50:16', '145');
INSERT INTO `sys_oper_log` VALUES ('103', '用户头像', '2', 'com.nofantasy.project.system.controller.SysProfileController.avatar()', 'POST', '1', '6lqA67gA', null, '/system/user/profile/avatar', '192.168.0.101', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/12/06/azXNh9sVt45Z01b29b5872bfe37a3b5a6fb453b4ac8d_20241206223803A001.png\",\"code\":200}', '0', null, '2024-12-06 22:38:03', '516');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '6', 'com.nofantasy.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_product,user_sport_plan,user_run_record,user_recipe_plan,user_jf,user_jf_pro_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-12-21 18:26:44', '682');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '8', 'com.nofantasy.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_product,user_jf,user_jf_pro_record,user_recipe_plan,user_run_record,user_sport_plan\"}', null, '0', null, '2024-12-21 18:26:51', '913');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '2', 'com.nofantasy.project.tool.gen.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"userJfProRecord\",\"className\":\"UserJfProRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-12-21 18:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":12,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-12-21 18:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"XhJf\",\"columnComment\":\"消耗积分\",\"columnId\":13,\"columnName\":\"xh_jf\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-21 18:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"xhJf\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProId\",\"columnComment\":\"商品ID\",\"columnId\":14,\"columnName\":\"pro_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-12-21 18:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"proId\",\"javaType\":\"Long\",', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-12-21 18:58:36', '125');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '2', 'com.nofantasy.project.tool.gen.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"userSportPlan\",\"className\":\"UserSportPlan\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":28,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-12-21 18:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":29,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-12-21 18:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Height\",\"columnComment\":\"身高\",\"columnId\":30,\"columnName\":\"height\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-12-21 18:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"height\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Weight\",\"columnComment\":\"体重\",\"columnId\":31,\"columnName\":\"weight\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-21 18:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"weight\",\"javaType\":\"String\",\"l', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-12-21 18:59:07', '162');
INSERT INTO `sys_oper_log` VALUES ('108', '代码生成', '8', 'com.nofantasy.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"user_jf_pro_record,user_sport_plan\"}', null, '0', null, '2024-12-21 18:59:22', '319');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2024-12-05 20:58:29', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2024-12-05 20:58:29', '', null, '');

-- ----------------------------
-- Table structure for sys_product
-- ----------------------------
DROP TABLE IF EXISTS `sys_product`;
CREATE TABLE `sys_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '图片',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `descript` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品描述',
  `need_jf` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '兑换积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品信息';

-- ----------------------------
-- Records of sys_product
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2024-12-05 20:58:29', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2024-12-05 20:58:29', '', null, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '117');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `open_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', 'admin', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2024/12/06/1733466692747_20241206143133A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-12-21 18:56:35', 'admin', '2024-12-05 20:58:29', '', '2024-12-21 18:56:35', '管理员', null);
INSERT INTO `sys_user` VALUES ('2', '105', 'hell', 'hell', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-12-05 20:58:29', 'admin', '2024-12-05 20:58:29', '', null, '测试员', null);
INSERT INTO `sys_user` VALUES ('105', null, '6lqA67gA', '微信用户wF77g3X8', '00', '', '', '0', 'https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132', '$2a$10$iw4AMPpSQq/3shhp9PxQvumrVhM0BcQk/6Gb64k0v4g25JfOIIOLu', '0', '0', '192.168.0.101', '2024-12-06 20:51:19', '', '2024-12-06 20:49:08', '', '2024-12-21 14:03:29', null, 'oeQUQ6V8HPKjA1VWU0aF030C1cmo');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('101', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('101', '2');
INSERT INTO `sys_user_role` VALUES ('102', '2');
INSERT INTO `sys_user_role` VALUES ('103', '2');
INSERT INTO `sys_user_role` VALUES ('104', '2');
INSERT INTO `sys_user_role` VALUES ('105', '2');

-- ----------------------------
-- Table structure for user_jf
-- ----------------------------
DROP TABLE IF EXISTS `user_jf`;
CREATE TABLE `user_jf` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `num` int DEFAULT NULL COMMENT '数量',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户积分表';

-- ----------------------------
-- Records of user_jf
-- ----------------------------

-- ----------------------------
-- Table structure for user_jf_pro_record
-- ----------------------------
DROP TABLE IF EXISTS `user_jf_pro_record`;
CREATE TABLE `user_jf_pro_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `xh_jf` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '消耗积分',
  `pro_id` int DEFAULT NULL COMMENT '商品ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户积分兑换记录';

-- ----------------------------
-- Records of user_jf_pro_record
-- ----------------------------

-- ----------------------------
-- Table structure for user_recipe_plan
-- ----------------------------
DROP TABLE IF EXISTS `user_recipe_plan`;
CREATE TABLE `user_recipe_plan` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '类型',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜谱名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户菜谱计划';

-- ----------------------------
-- Records of user_recipe_plan
-- ----------------------------

-- ----------------------------
-- Table structure for user_run_record
-- ----------------------------
DROP TABLE IF EXISTS `user_run_record`;
CREATE TABLE `user_run_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `times` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '时长',
  `speed` double DEFAULT NULL COMMENT '时速',
  `distance` double DEFAULT NULL COMMENT '公里数',
  `calories` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '卡路里',
  `useer_id` int DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户运动记录';

-- ----------------------------
-- Records of user_run_record
-- ----------------------------

-- ----------------------------
-- Table structure for user_sport_plan
-- ----------------------------
DROP TABLE IF EXISTS `user_sport_plan`;
CREATE TABLE `user_sport_plan` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `height` int DEFAULT NULL COMMENT '身高',
  `weight` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '体重',
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `calories` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '目标卡路里',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户运动计划';

-- ----------------------------
-- Records of user_sport_plan
-- ----------------------------
