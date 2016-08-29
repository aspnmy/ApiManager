/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 100108
Source Host           : localhost:3306
Source Database       : api_manager

Target Server Type    : MYSQL
Target Server Version : 100108
File Encoding         : 65001

Date: 2016-08-29 11:32:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '接口编号',
  `aid` int(11) DEFAULT '0' COMMENT '接口分类id',
  `num` varchar(100) DEFAULT NULL COMMENT '接口编号',
  `url` varchar(240) DEFAULT NULL COMMENT '请求地址',
  `name` varchar(100) DEFAULT NULL COMMENT '接口名',
  `des` varchar(300) DEFAULT NULL COMMENT '接口描述',
  `parameter` text COMMENT '请求参数{所有的主求参数,以json格式在此存放}',
  `memo` text COMMENT '备注',
  `re` text COMMENT '返回值',
  `lasttime` int(11) unsigned DEFAULT NULL COMMENT '提后操作时间',
  `lastuid` int(11) unsigned DEFAULT NULL COMMENT '最后修改uid',
  `isdel` tinyint(4) unsigned DEFAULT '0' COMMENT '{0:正常,1:删除}',
  `type` char(11) DEFAULT NULL COMMENT '请求方式',
  `ord` int(11) DEFAULT '0' COMMENT '排序(值越大,越靠前)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='接口明细表';

-- ----------------------------
-- Records of api
-- ----------------------------
INSERT INTO `api` VALUES ('1', '2', '000', 'http://api.xxx.com', '会员注册', '会员注册调用此接口', 'a:4:{s:4:\"name\";a:3:{i:0;s:10:\"login_name\";i:1;s:8:\"password\";i:2;s:5:\"email\";}s:4:\"type\";a:3:{i:0;s:1:\"Y\";i:1;s:1:\"Y\";i:2;s:1:\"N\";}s:7:\"default\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:3:\"des\";a:3:{i:0;s:9:\"登录名\";i:1;s:6:\"密码\";i:2;s:12:\"用户邮箱\";}}', '', '{\r\n    &quot;status&quot;: 1, \r\n    &quot;info&quot;: &quot;注册成功&quot;, \r\n    &quot;data&quot;: {\r\n        &quot;uid&quot;: &quot;20&quot;\r\n    }\r\n}', '1435588983', '1', '0', 'POST', '0');
INSERT INTO `api` VALUES ('2', '2', '001', 'http://api.xxx.com', '会员登录', '会员登录调用此接口', 'a:4:{s:4:\"name\";a:3:{i:0;s:10:\"login_name\";i:1;s:5:\"email\";i:2;s:8:\"password\";}s:4:\"type\";a:3:{i:0;s:1:\"Y\";i:1;s:1:\"Y\";i:2;s:1:\"Y\";}s:7:\"default\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:3:\"des\";a:3:{i:0;s:30:\"登录名与邮箱二选其一\";i:1;s:30:\"邮箱与登录名二选其一\";i:2;s:6:\"密码\";}}', 'login_name 与 email 二选其一', '{\r\n    &quot;status&quot;: 1, \r\n    &quot;info&quot;: &quot;登录成功&quot;, \r\n    &quot;data&quot;: [ ]\r\n}', '1435576729', '2', '0', 'POST', '0');

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户',
  `aid` int(11) DEFAULT NULL COMMENT '接口分类权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限表 - 若用户为普通管理员时，读此表获取权限';

-- ----------------------------
-- Records of auth
-- ----------------------------

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate` (
  `aid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cname` varchar(200) NOT NULL DEFAULT '' COMMENT '分类名称',
  `cdesc` varchar(200) NOT NULL DEFAULT '' COMMENT '分类描述',
  `isdel` int(11) DEFAULT '0' COMMENT '是否删除{0:正常,1删除}',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='接口分类表';

-- ----------------------------
-- Records of cate
-- ----------------------------
INSERT INTO `cate` VALUES ('1', '微新云公共API', '微新云公共API', '0', '1435575162');
INSERT INTO `cate` VALUES ('2', '第三方API', '第三方API', '0', '1435575185');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nice_name` char(20) DEFAULT NULL COMMENT '昵称',
  `login_name` char(20) DEFAULT NULL COMMENT '登录名',
  `last_time` int(11) DEFAULT '0' COMMENT '最近登录时间',
  `login_pwd` varchar(32) DEFAULT NULL COMMENT '登录密码,md5($login_name.$login_pwd)',
  `isdel` int(11) DEFAULT '0' COMMENT '{0正常,1:删除}',
  `issuper` int(11) DEFAULT '0' COMMENT '{0:普通管理员,1超级管理员}',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1472440216', 'f6fdffe48c908deb0f4c3bd36c032e72', '0', '1');
INSERT INTO `user` VALUES ('2', 'root', 'root', '1472441521', 'b4b8daf4b8ea9d39568719e1e320076f', '0', '1');
SET FOREIGN_KEY_CHECKS=1;
