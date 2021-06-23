/*
 Navicat Premium Data Transfer

 Source Server         : localhost-root-root
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : localhost:3306
 Source Schema         : test22

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 23/06/2021 15:52:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单Id',
  `menuPid` int(11) NULL DEFAULT NULL COMMENT '菜单父级Id',
  `menuCode` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
  `menuName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menuUrl` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `menuIcon` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '删除标记：1 删除；0 未删除',
  `orderNumber` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `describe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, 'cdlb', '菜单列表', '1', '1', 0, 1, '1');
INSERT INTO `menu` VALUES (2, 11, 'orgManagement', '机构管理', '/systemManagement/orgManagement', 'el-icon-setting', 0, NULL, '');
INSERT INTO `menu` VALUES (3, 11, 'depManagement', '科室管理', '/systemManagement/depManagement', NULL, 0, 5005, NULL);
INSERT INTO `menu` VALUES (4, 11, 'userManagement', '用户管理', '/systemManagement/userManagement', NULL, 0, 5000, NULL);
INSERT INTO `menu` VALUES (5, 11, 'resourceManagement', '资源管理', '/systemManagement/resourceManagement', NULL, 0, 5000, NULL);
INSERT INTO `menu` VALUES (6, 11, 'roleManagement', '角色管理', '/systemManagement/roleManagement', NULL, 0, 5003, NULL);

-- ----------------------------
-- View structure for vw_dep
-- ----------------------------
DROP VIEW IF EXISTS `vw_dep`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_dep` AS select `test22`.`sys_dep`.`depId` AS `depId`,`test22`.`sys_dep`.`userCode` AS `userCode`,`test22`.`sys_dep`.`orgId` AS `orgId`,`test22`.`sys_dep`.`depType` AS `depType`,`test22`.`sys_dep`.`depRole` AS `depRole`,`test22`.`sys_dep`.`depCode` AS `depCode`,`test22`.`sys_dep`.`depName` AS `depName`,`test22`.`sys_dep`.`depDescribe` AS `depDescribe`,`test22`.`sys_dep`.`py` AS `py`,`test22`.`sys_dep`.`wb` AS `wb`,`test22`.`sys_dep`.`zj` AS `zj`,`test22`.`sys_dep`.`instr` AS `instr`,`test22`.`sys_dep`.`parentId` AS `parentId`,`test22`.`sys_dep`.`path` AS `path`,`test22`.`sys_dep`.`depAddr` AS `depAddr`,`test22`.`sys_dep`.`email` AS `email`,`test22`.`sys_dep`.`phone` AS `phone`,`test22`.`sys_dep`.`createDate` AS `createDate`,`test22`.`sys_dep`.`modifyDate` AS `modifyDate`,`test22`.`sys_dep`.`activeFlag` AS `activeFlag`,`test22`.`sys_dep`.`orderNum` AS `orderNum` from `sys_dep`;

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
