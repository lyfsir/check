/*
 Navicat Premium Data Transfer

 Source Server         : centos
 Source Server Type    : MySQL
 Source Server Version : 50647
 Source Host           : 192.168.230.129:3306
 Source Schema         : lyf_topic

 Target Server Type    : MySQL
 Target Server Version : 50647
 File Encoding         : 65001

 Date: 17/10/2020 19:28:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for topic_images
-- ----------------------------
DROP TABLE IF EXISTS `topic_images`;
CREATE TABLE `topic_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题图片id',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '话题图片',
  `t_id` int(11) DEFAULT NULL COMMENT '话题id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_id`(`t_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for topic_info
-- ----------------------------
DROP TABLE IF EXISTS `topic_info`;
CREATE TABLE `topic_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '话题内容',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '话题状态(0显示，1不显示)',
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发表时间',
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `u_id`(`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
