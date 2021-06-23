/*
 Navicat Premium Data Transfer

 Source Server         : localhost-root-root
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 23/06/2021 15:52:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `userCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账户 登录名',
  `userName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user1', '管理员');
INSERT INTO `user` VALUES (2, 'admin', '管理员');
INSERT INTO `user` VALUES (3, 'user2', '用户2');
INSERT INTO `user` VALUES (4, 'abc123', '用户4');
INSERT INTO `user` VALUES (5, 'zhangsan', '张三');
INSERT INTO `user` VALUES (6, 'lisi', '李四');
INSERT INTO `user` VALUES (7, 'wangwu', '王五');
INSERT INTO `user` VALUES (8, 'lijun', '李军发');
INSERT INTO `user` VALUES (9, 'hulei', '胡磊');

-- ----------------------------
-- Function structure for getChildList
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildList`;
delimiter ;;
CREATE FUNCTION `getChildList`(rootId VARCHAR(32))
 RETURNS varchar(1000) CHARSET utf8mb4
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempChd VARCHAR(1000);
    SET sTemp = '$';
    SET sTempChd =cast(rootId as CHAR);
 
    WHILE sTempChd is not null DO
        SET sTemp = concat(sTemp,',',sTempChd);
        SELECT group_concat(itemUUID) INTO sTempChd FROM  base_examItems where FIND_IN_SET(parentId,sTempChd)>0;
    END WHILE;
    RETURN sTemp; 
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
