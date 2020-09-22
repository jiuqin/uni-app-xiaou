/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : shop_db

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-05-30 20:03:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `title` varchar(50) NOT NULL COMMENT '轮播图标题',
  `img` varchar(255) NOT NULL COMMENT '轮播图图片地址',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '轮播图1', '/uploads/banner/8f581960-7033-11ea-90dd-3b8abd26afb2.jpg', '1');
INSERT INTO `banner` VALUES ('2', '轮播图2', '/uploads/banner/972ca570-7033-11ea-90dd-3b8abd26afb2.jpg', '1');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车主键',
  `uid` varchar(50) NOT NULL COMMENT '用户id',
  `goodsid` int(11) NOT NULL COMMENT '商品编号',
  `num` tinyint(3) NOT NULL COMMENT '数量',
  `status` tinyint(1) NOT NULL COMMENT '选中状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`goodsid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('2', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '2', '3', '1');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级分类编号',
  `catename` varchar(50) NOT NULL COMMENT '分类名称',
  `img` varchar(255) NOT NULL COMMENT '分类图片',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '家用电器', '', '1');
INSERT INTO `category` VALUES ('2', '0', '手机通讯', '', '1');
INSERT INTO `category` VALUES ('3', '0', '电脑办公', '', '1');
INSERT INTO `category` VALUES ('4', '0', '家居', '', '1');
INSERT INTO `category` VALUES ('5', '0', '服装', '', '1');
INSERT INTO `category` VALUES ('7', '1', '电视', '/uploads/category/fc3abc50-6c2c-11ea-b86c-579aced212c2.jpg', '1');
INSERT INTO `category` VALUES ('8', '1', '空调', '/uploads/category/354b31f0-6c2d-11ea-b86c-579aced212c2.jpg', '1');
INSERT INTO `category` VALUES ('9', '1', '洗衣机', '/uploads/category/436e9470-6c2d-11ea-b86c-579aced212c2.jpg', '1');
INSERT INTO `category` VALUES ('10', '2', '诺基亚手机', '/uploads/category/fee7e580-6c2d-11ea-b86c-579aced212c2.png', '1');
INSERT INTO `category` VALUES ('11', '3', '笔记本', '/uploads/category/ddb0b9f0-6de0-11ea-a8e1-0d680bf54839.jpg', '1');
INSERT INTO `category` VALUES ('12', '2', '手机配件', '/uploads/category/764b6740-9673-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('13', '2', '小米手机', '/uploads/category/91238110-9673-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('14', '2', 'oppo手机', '/uploads/category/5f200c50-9674-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('15', '3', 'mac本', '/uploads/category/86b1e680-9674-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('16', '3', '华为笔记本', '/uploads/category/a740dc80-9674-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('17', '3', '戴尔笔记本', '/uploads/category/b63aeff0-9674-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('18', '0', '男鞋', '', '1');
INSERT INTO `category` VALUES ('19', '0', '女鞋', '', '1');
INSERT INTO `category` VALUES ('20', '0', '化妆品', '', '1');
INSERT INTO `category` VALUES ('21', '0', '运动户外', '', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `first_cateid` smallint(5) unsigned NOT NULL COMMENT '一级分类编号',
  `second_cateid` smallint(6) NOT NULL COMMENT '二级分类编号',
  `goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `img` varchar(255) NOT NULL COMMENT '商品图片',
  `description` text COMMENT '商品描述',
  `specsid` int(11) NOT NULL COMMENT '规格id',
  `specsattr` varchar(255) NOT NULL COMMENT '规则属性值',
  `isnew` tinyint(1) NOT NULL COMMENT '是否新品1是2不是',
  `ishot` tinyint(1) NOT NULL COMMENT '是否热卖1是2不是',
  `status` tinyint(1) NOT NULL COMMENT '状态1启用2禁用',
  `number` tinyint(5) NOT NULL DEFAULT '100' COMMENT '商品库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '2', '10', '小米10', '3999.00', '3999.00', '/uploads/fa5c2790-6c48-11ea-b894-9bd516f4e52e.jpg', '<p>11</p><p>22</p><p>33</p>', '3', '白色,黑色', '0', '1', '1', '100');
INSERT INTO `goods` VALUES ('2', '3', '11', '联想小新', '4499.00', '4699.00', '/uploads/2747d670-6de1-11ea-a8e1-0d680bf54839.jpg', '<p><img src=\"https://img30.360buyimg.com/sku/jfs/t1/92075/21/15594/69153/5e7332afE99041ba5/6796969792546bcf.jpg\" style=\"max-width:100%;\"><br></p>', '3', '白色', '1', '0', '1', '100');
INSERT INTO `goods` VALUES ('3', '2', '10', '荣耀9X', '1299.00', '1399.00', '/uploads/d6a0eff0-70be-11ea-91a2-9395060d7390.jpg', '', '3', '白色', '1', '2', '1', '100');
INSERT INTO `goods` VALUES ('4', '2', '10', '华为matep30', '3999.00', '4999.00', '/uploads/fb704ec0-70be-11ea-91a2-9395060d7390.jpg', '', '3', '黑色', '2', '2', '1', '100');
INSERT INTO `goods` VALUES ('5', '3', '11', '华为MateBook13', '4299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('6', '3', '11', '华为MateBook14', '5299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('7', '3', '11', '华为MateBook15', '6299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('8', '3', '11', '华为MateBook16', '7299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('9', '3', '11', '华为MateBook17', '8299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('10', '3', '11', '华为MateBook18', '9299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '', '3', '白色', '2', '1', '1', '100');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用户编号',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `password` char(32) NOT NULL COMMENT '密码',
  `randstr` char(5) NOT NULL COMMENT '密码随机串',
  `addtime` char(13) NOT NULL COMMENT '注册时间',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('2', '2be08210-70fa-11ea-9c17-a5b3f9b0d2ba', '18811112222', '小U', '', 'O6ImO', '1585403036849', '1');
INSERT INTO `member` VALUES ('3', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '13716052241', '', '', '', '1589351244904', '1');
INSERT INTO `member` VALUES ('5', '6c841ac0-94e5-11ea-bcf6-033ff179583c', '', '', '', '', '1589352367728', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `pid` smallint(6) NOT NULL COMMENT '上级菜单编号',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(100) NOT NULL COMMENT '菜单图标',
  `type` tinyint(1) NOT NULL COMMENT '菜单类型1目录2菜单',
  `url` varchar(100) NOT NULL COMMENT '菜单地址',
  `status` tinyint(1) NOT NULL COMMENT '菜单状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单权限表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', 'el-icon-setting', '1', '', '1');
INSERT INTO `menu` VALUES ('2', '1', '菜单管理', '', '2', '/menu', '1');
INSERT INTO `menu` VALUES ('3', '1', '角色管理', '', '2', '/role', '1');
INSERT INTO `menu` VALUES ('7', '1', '管理员管理', '', '2', '/user', '1');
INSERT INTO `menu` VALUES ('8', '0', '商城管理', 'el-icon-s-goods', '1', '', '1');
INSERT INTO `menu` VALUES ('9', '8', '商品分类', '', '2', '/category', '1');
INSERT INTO `menu` VALUES ('10', '8', '商品规格', '', '2', '/specs', '1');
INSERT INTO `menu` VALUES ('11', '8', '商品管理', '', '2', '/goods', '1');
INSERT INTO `menu` VALUES ('12', '8', '会员管理', '', '2', '/member', '1');
INSERT INTO `menu` VALUES ('14', '8', '轮播图管理', '', '2', '/banner', '1');
INSERT INTO `menu` VALUES ('15', '8', '秒杀活动', '', '2', '/seckill', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL COMMENT '会员id',
  `orderid` int(11) DEFAULT NULL COMMENT '主订单id',
  `goodsid` int(11) DEFAULT NULL COMMENT '商品id',
  `num` tinyint(3) DEFAULT NULL COMMENT '购买的商品数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('32', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '22', '1', '1');
INSERT INTO `orders` VALUES ('33', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '23', '2', '1');
INSERT INTO `orders` VALUES ('34', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '23', '4', '1');
INSERT INTO `orders` VALUES ('35', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '24', '5', '2');
INSERT INTO `orders` VALUES ('36', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '24', '1', '1');
INSERT INTO `orders` VALUES ('37', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '25', '1', '2');
INSERT INTO `orders` VALUES ('38', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '26', '5', '1');
INSERT INTO `orders` VALUES ('39', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '27', '1', '1');
INSERT INTO `orders` VALUES ('40', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '28', '1', '1');
INSERT INTO `orders` VALUES ('41', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '29', '5', '1');
INSERT INTO `orders` VALUES ('42', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '30', '1', '3');
INSERT INTO `orders` VALUES ('43', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '30', '5', '1');
INSERT INTO `orders` VALUES ('44', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '31', '5', '1');
INSERT INTO `orders` VALUES ('45', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '32', '1', '1');
INSERT INTO `orders` VALUES ('46', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '33', '7', '1');
INSERT INTO `orders` VALUES ('47', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '34', '5', '3');
INSERT INTO `orders` VALUES ('48', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '34', '1', '1');
INSERT INTO `orders` VALUES ('49', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '35', '1', '3');
INSERT INTO `orders` VALUES ('50', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '36', '5', '1');
INSERT INTO `orders` VALUES ('51', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '37', '1', '1');
INSERT INTO `orders` VALUES ('52', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '39', '1', '1');
INSERT INTO `orders` VALUES ('53', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '40', '7', '1');
INSERT INTO `orders` VALUES ('54', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '40', '1', '1');
INSERT INTO `orders` VALUES ('55', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '40', '5', '1');
INSERT INTO `orders` VALUES ('56', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '41', '1', '2');
INSERT INTO `orders` VALUES ('57', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '42', '6', '5');
INSERT INTO `orders` VALUES ('58', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '43', '8', '5');
INSERT INTO `orders` VALUES ('59', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '44', '1', '7');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `rolename` varchar(100) NOT NULL COMMENT '角色名称',
  `menus` varchar(255) NOT NULL COMMENT '菜单权限 存放的是菜单编号，用逗号隔开',
  `status` tinyint(1) NOT NULL COMMENT '角色状态1正常2禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('3', '系统管理员', '1,2,3,7,8,9,10,11,12,13,14,15', '1');
INSERT INTO `role` VALUES ('4', '客服专员', '8,9,10,11,12,13', '1');

-- ----------------------------
-- Table structure for seckill
-- ----------------------------
DROP TABLE IF EXISTS `seckill`;
CREATE TABLE `seckill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '秒杀表id',
  `title` varchar(100) NOT NULL COMMENT '活动名称',
  `begintime` char(13) NOT NULL COMMENT '秒杀开始时间',
  `endtime` char(13) NOT NULL COMMENT '秒杀结束时间',
  `first_cateid` smallint(5) NOT NULL COMMENT '商品一级分类编号',
  `second_cateid` smallint(5) NOT NULL COMMENT '商品二级分类编号',
  `goodsid` int(11) NOT NULL COMMENT '商品编号',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='限时秒杀活动表';

-- ----------------------------
-- Records of seckill
-- ----------------------------
INSERT INTO `seckill` VALUES ('6', '活动2', '1590838961000', '1590853361000', '2', '10', '4', '1');

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL COMMENT '会员id',
  `username` char(10) DEFAULT NULL COMMENT '收件人姓名',
  `userphone` char(11) DEFAULT NULL COMMENT '收件人手机号',
  `address` varchar(50) DEFAULT NULL COMMENT '收件人地址',
  `countmoney` decimal(10,2) DEFAULT NULL COMMENT '订单支付金额',
  `countnumber` smallint(5) DEFAULT NULL COMMENT '商品数量',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0:是待支付，1是代发货',
  `addtime` datetime DEFAULT NULL COMMENT '订单添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO `shop_order` VALUES ('22', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '3999.00', '1', '0', '2020-05-15 01:46:20');
INSERT INTO `shop_order` VALUES ('23', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '8498.00', '2', '0', '2020-05-24 04:59:09');
INSERT INTO `shop_order` VALUES ('24', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '12597.00', '2', '0', '2020-05-24 04:59:56');
INSERT INTO `shop_order` VALUES ('25', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '7998.00', '1', '0', '2020-05-24 05:01:46');
INSERT INTO `shop_order` VALUES ('26', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '4299.00', '1', '0', '2020-05-24 05:03:49');
INSERT INTO `shop_order` VALUES ('27', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '3999.00', '1', '0', '2020-05-24 05:04:48');
INSERT INTO `shop_order` VALUES ('28', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '3999.00', '1', '0', '2020-05-24 05:05:18');
INSERT INTO `shop_order` VALUES ('29', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '4299.00', '1', '0', '2020-05-24 05:05:46');
INSERT INTO `shop_order` VALUES ('30', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '16296.00', '2', '0', '2020-05-25 06:24:29');
INSERT INTO `shop_order` VALUES ('31', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '4299.00', '1', '0', '2020-05-25 07:00:21');
INSERT INTO `shop_order` VALUES ('32', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '3999.00', '1', '0', '2020-05-25 07:01:39');
INSERT INTO `shop_order` VALUES ('33', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '6299.00', '1', '0', '2020-05-25 07:02:38');
INSERT INTO `shop_order` VALUES ('34', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '16896.00', '2', '0', '2020-05-27 03:36:24');
INSERT INTO `shop_order` VALUES ('35', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '11997.00', '1', '0', '2020-05-27 06:43:18');
INSERT INTO `shop_order` VALUES ('36', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '4299.00', '1', '0', '2020-05-27 08:09:32');
INSERT INTO `shop_order` VALUES ('37', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '3999.00', '1', '0', '2020-05-27 08:10:46');
INSERT INTO `shop_order` VALUES ('38', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '3999.00', '1', '0', '2020-05-27 08:11:06');
INSERT INTO `shop_order` VALUES ('39', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '3999.00', '1', '0', '2020-05-27 08:11:35');
INSERT INTO `shop_order` VALUES ('40', '112112', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '14597.00', '3', '0', '2020-05-27 08:12:51');
INSERT INTO `shop_order` VALUES ('41', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '7998.00', '1', '0', '2020-05-28 10:07:24');
INSERT INTO `shop_order` VALUES ('42', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '26495.00', '1', '0', '2020-05-28 10:07:58');
INSERT INTO `shop_order` VALUES ('43', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '36495.00', '1', '0', '2020-05-28 10:08:46');
INSERT INTO `shop_order` VALUES ('44', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', 'YouSu', '18240279221', '北京市海淀区隐泉路清林苑6号楼中公优就业总部3层', '27993.00', '1', '0', '2020-05-30 11:52:07');

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `specsname` varchar(50) NOT NULL COMMENT '规格名称',
  `status` tinyint(1) NOT NULL COMMENT '规格状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格表';

-- ----------------------------
-- Records of specs
-- ----------------------------
INSERT INTO `specs` VALUES ('3', '颜色', '1');
INSERT INTO `specs` VALUES ('5', '尺寸', '1');

-- ----------------------------
-- Table structure for specs_attr
-- ----------------------------
DROP TABLE IF EXISTS `specs_attr`;
CREATE TABLE `specs_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格项编号',
  `specsid` int(11) NOT NULL COMMENT '规格的specsid',
  `specsval` varchar(50) NOT NULL COMMENT '规格值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格明细表';

-- ----------------------------
-- Records of specs_attr
-- ----------------------------
INSERT INTO `specs_attr` VALUES ('7', '5', '55英寸');
INSERT INTO `specs_attr` VALUES ('8', '5', '60英寸');
INSERT INTO `specs_attr` VALUES ('13', '3', '白色');
INSERT INTO `specs_attr` VALUES ('14', '3', '黑色');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '住建',
  `uid` varchar(50) NOT NULL COMMENT '管理员编号',
  `roleid` smallint(5) NOT NULL COMMENT '角色编号',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `randstr` char(5) NOT NULL COMMENT '随机加密串',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '7f412140-6b72-11ea-a476-bbdc6fb709e3', '3', 'admin', '904793bd8f8b17435798173c6af24eff', 'LFLK8', '1');
INSERT INTO `user` VALUES ('2', 'ef0d6e20-6b72-11ea-86b6-ff96b988db92', '4', 'kefu', '51a956280a6ecc833943d0db633c3bc8', 'N9vs3', '1');
