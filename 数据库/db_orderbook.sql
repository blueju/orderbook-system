-- 关闭外键约束
SET FOREIGN_KEY_CHECKS=0;

-- 创建数据库 db_orderbook
CREATE DATABASE
IF NOT EXISTS db_orderbook DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建教材价格表 tb_book
DROP TABLE IF EXISTS `tb_book`;
CREATE TABLE `tb_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `one_price` float NOT NULL DEFAULT '0' COMMENT '正版书',
  `two_price` float NOT NULL DEFAULT '0' COMMENT '二手书',
  `three_price` float NOT NULL DEFAULT '0' COMMENT '复印书',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='教材价格表';

-- 创建编辑权限表 tb_jurisdiction
DROP TABLE IF EXISTS `tb_jurisdiction`;
CREATE TABLE `tb_jurisdiction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(30) NOT NULL COMMENT '权限名',
  `jurisdiction` int(2) NOT NULL DEFAULT '0' COMMENT '权限，1：可编辑，2：不可编辑',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='编辑权限表';

-- 创建登录日志表 tb_login_log
DROP TABLE IF EXISTS `tb_login_log`;
CREATE TABLE `tb_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `ip` varchar(30) NOT NULL COMMENT 'IP',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `name` varchar(20) NOT NULL COMMENT '登录用户姓名',
  `browser` varchar(20) NOT NULL COMMENT '浏览器',
  `user_agent` varchar(255) NOT NULL COMMENT 'UserAgent',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- 创建通知公告表 tb_notice
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `content` varchar(255) DEFAULT '' COMMENT '通知内容',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '通知时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- 创建订单详情表 tb_order
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` varchar(15) NOT NULL COMMENT '学号',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `firstbook` int(11) NOT NULL DEFAULT '0' COMMENT '计算机网络',
  `secondbook` int(11) NOT NULL DEFAULT '0' COMMENT 'ERP原理、实施与管理',
  `thirdbook` int(11) NOT NULL DEFAULT '0' COMMENT '移动开发技术与应用',
  `fourthbook` int(11) NOT NULL DEFAULT '0' COMMENT '决策支持系统',
  `fifthbook` int(11) NOT NULL DEFAULT '0' COMMENT 'IT项目管理',
  `sixthbook` int(11) NOT NULL DEFAULT '0' COMMENT '信息安全',
  `seventhbook` int(11) NOT NULL DEFAULT '0' COMMENT '数据库应用系统设计',
  `eighthbook` int(11) NOT NULL DEFAULT '0' COMMENT '数据处理技术与SPSS',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '总量',
  `totalprice` int(11) NOT NULL DEFAULT '0' COMMENT '总价',
  `paystatus` int(4) NOT NULL DEFAULT '0' COMMENT '支付状态，1：管理员，2：普通',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- 创建班级用户表 tb_user
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` varchar(11) NOT NULL COMMENT '学号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码，订书系统管理员密码为root',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(4) NOT NULL COMMENT '性别',
  `permission` varchar(10) NOT NULL DEFAULT '2' COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级用户表';

-- 开启外键约束
SET FOREIGN_KEY_CHECKS=1;