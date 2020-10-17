/*
 Navicat Premium Data Transfer

 Source Server         : centos
 Source Server Type    : MySQL
 Source Server Version : 50647
 Source Host           : 192.168.230.129:3306
 Source Schema         : lyf_food

 Target Server Type    : MySQL
 Target Server Version : 50647
 File Encoding         : 65001

 Date: 17/10/2020 19:27:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for food_attr
-- ----------------------------
DROP TABLE IF EXISTS `food_attr`;
CREATE TABLE `food_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食物属性id',
  `food_id` int(11) DEFAULT NULL COMMENT '食物id',
  `attgroup_id` int(11) DEFAULT NULL COMMENT '属性组id',
  `attr_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '属性名',
  `attr_value` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `food_id`(`food_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 772 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for food_attr_group
-- ----------------------------
DROP TABLE IF EXISTS `food_attr_group`;
CREATE TABLE `food_attr_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性组id',
  `group_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '属性组名',
  `search` tinyint(5) NOT NULL DEFAULT 0 COMMENT '0不可被检索，1可被检索',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for food_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `food_category_relation`;
CREATE TABLE `food_category_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `food_id` int(11) DEFAULT NULL COMMENT '食物id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `food_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '食物名称',
  `category_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `food_id`(`food_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for food_images
-- ----------------------------
DROP TABLE IF EXISTS `food_images`;
CREATE TABLE `food_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食物图片id',
  `food_id` int(11) DEFAULT NULL COMMENT '食物id',
  `images_url` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '图片地址',
  `type` tinyint(10) DEFAULT NULL COMMENT '0为默认图片，1为非默认图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `food_id`(`food_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for food_info
-- ----------------------------
DROP TABLE IF EXISTS `food_info`;
CREATE TABLE `food_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'food_id',
  `title` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '食物标题',
  `descrit` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '食物描述',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `status` tinyint(5) NOT NULL DEFAULT 0 COMMENT '是否显示(0显示，1不显示)',
  `auditing` tinyint(5) NOT NULL DEFAULT 1 COMMENT '审核状态(0审核通过，1没通过，2表示不通过)',
  `s_id` int(11) DEFAULT NULL COMMENT '所属专题',
  `create_time` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for food_special
-- ----------------------------
DROP TABLE IF EXISTS `food_special`;
CREATE TABLE `food_special`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题id',
  `name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '专题名字',
  `imgurl` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '专题图片',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '显示状态(0显示，1不显示)',
  `create_time` varchar(100) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for food_special_infomation
-- ----------------------------
DROP TABLE IF EXISTS `food_special_infomation`;
CREATE TABLE `food_special_infomation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题详情id',
  `imgurl` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '详情图片',
  `content` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '详情内容',
  `s_id` int(11) DEFAULT NULL COMMENT '相关专题id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for food_step
-- ----------------------------
DROP TABLE IF EXISTS `food_step`;
CREATE TABLE `food_step`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '步骤id',
  `food_id` int(11) DEFAULT NULL COMMENT '食物id',
  `content` varchar(255) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL COMMENT '步骤讲解',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `food_id`(`food_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 598 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_sort`;
CREATE TABLE `t_sort`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `show_status` tinyint(4) DEFAULT 1,
  `sort` int(11) DEFAULT 0,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 340 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
