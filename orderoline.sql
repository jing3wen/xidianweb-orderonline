-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 49.235.51.187    Database: orderonline234
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

use orderonline234;
--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'奶茶专区'),(2,'甜品/蛋糕'),(3,'包子/早点'),(4,'午饭套餐'),(5,'肉类炒菜'),(6,'素菜专区'),(7,'烧烤专区'),(8,'养生汤品'),(9,'特价处理'),(10,'西式餐点');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '买家地址',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '买家联系方式',
  `status` int DEFAULT '0' COMMENT '状态，0：普通用户，1：会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'byh','12345','5A124','123456',1),(5,'zhang3','123','11','123456',1),(8,'wang5','123','wode dizhi ','1112424212',0),(9,'沈靖文','123456','西安电子科技大学海棠10号楼','123456',1),(10,'kyq','123456','天天','123456',0),(11,'康亚钦','123456','123@qq.com','111',0),(12,'test沈','123456','123@.com','12346667890',1),(13,'张熙','123456','西安电子科技大学','15809216586',1),(15,'12345','12345','123456789@qq.com','123456',0),(16,'TEST1','123456','1234','123456',0),(20,'test0','123456','619','123456',0),(21,'万雨','123456','3414897247@qq.com','18705549876',0),(23,'test','123456','123@.com','123456',1),(24,'sliver','123','123@qq.com','12345678901',0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_`
--

DROP TABLE IF EXISTS `order_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '买家地址',
  `status` int DEFAULT '0' COMMENT '支付状态，0：未支付，1：正在发货，2：已发货，3：已收货',
  `cstid` int DEFAULT NULL COMMENT '买家id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cstid` (`cstid`) USING BTREE,
  CONSTRAINT `order__ibfk_1` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_`
--

LOCK TABLES `order_` WRITE;
/*!40000 ALTER TABLE `order_` DISABLE KEYS */;
INSERT INTO `order_` VALUES (20,'202006031353354435095','姓名：沈靖文,邮箱：123.com,配送地址：西安电子科技大学海棠10号楼,手机号：12345678901',2,1),(21,'202006031403503295813','姓名：沈靖文,邮箱：123.com,配送地址：西安电子科技大学海棠10号楼,手机号：15771921401',2,1),(22,'202006031421053634269','姓名：chaobo,邮箱：123.com,配送地址：西安电子科技大学海棠10号楼,手机号：15771921401',2,1),(23,'202006031443512061179','姓名：沈靖文,邮箱：123.com,配送地址：西安电子科技大学海棠10号楼,手机号：123456',2,9),(24,'202006031824121561184','姓名：kyq,邮箱：1397034158@qq.com,配送地址：xxx,手机号：123456',2,10),(25,'202006032043454867980','姓名：沈靖文,邮箱：123@123.com,配送地址：西安电子科技大学海棠10号楼1区,手机号：15771921401',2,9),(26,'202006040926038568590','姓名：薛征,邮箱：1965935476@qq.com,配送地址：西电教学楼,手机号：158293',2,1),(27,'202006061027356731929','姓名：康亚钦,邮箱：123@qq.com,配送地址：海棠十号楼,手机号：1235',2,11),(28,'202006061037373133090','姓名：康亚钦,邮箱：123@qq.com,配送地址：海棠十号楼,手机号：1235',2,11),(29,'2020060716430606763','姓名：qddx2017200064,邮箱：123@qq.com,配送地址：海棠十号楼,手机号：1235',1,11),(30,'202006081317235347959','姓名：test沈,邮箱：17130130234.com,配送地址：丁香宿舍楼,手机号：12346667890',2,12),(31,'202006081750009254201','姓名：test沈,邮箱：17130130234.com,配送地址：丁香宿舍楼,手机号：12346667890',1,12),(32,'202006081814540906055','姓名：test沈,邮箱：17130130234.com,配送地址：丁香宿舍楼,手机号：12346667890',1,12),(33,'202006081855321762953','姓名：康亚钦,邮箱：123@qq.com,配送地址：海棠十号楼,手机号：1235',1,11),(34,'202006081919577118892','姓名：张熙,邮箱：2534436483@qq.com,配送地址：西安电子科技大学,手机号：15808216586',2,13),(35,'202006081933381602433','姓名：123456,邮箱：123456789@qq.com,配送地址：12345,手机号：123456',1,15),(39,'202006082012238095511','姓名：test沈,邮箱：17130130234.com,配送地址：丁香宿舍楼,手机号：12346667890',1,12),(40,'202006082244140333728','姓名：test沈,邮箱：17130130234.com,配送地址：丁香宿舍楼,手机号：12346667890',1,12),(41,'202006082244351266410','姓名：test沈,邮箱：17130130234.com,配送地址：丁香宿舍楼,手机号：12346667890',1,12),(42,'202006082245581061516','姓名：test沈,邮箱：17130130234.com,配送地址：丁香宿舍楼,手机号：12346667890',2,12),(43,'202006091331407964564','姓名：test沈,邮箱：1584591284@qq.com,配送地址：西安电子科技大学海棠10号楼1区,手机号：15771921401',2,12),(44,'202006091403467779324','姓名：test沈,邮箱：1584591284@qq.com,配送地址：西安电子科技大学海棠10号楼,手机号：15771921401',2,12),(45,'202006091713017861874','姓名：12,邮箱：12,配送地址：12,手机号：12',1,15),(46,'202006091951400965935','姓名：test,邮箱：123.com,配送地址：西安电子科技大学海棠10号楼,手机号：123456',2,23);
/*!40000 ALTER TABLE `order_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL COMMENT '商品id',
  `oid` int DEFAULT NULL COMMENT '订单id',
  `cstid` int DEFAULT NULL COMMENT '买家id',
  `number` int DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE,
  KEY `cstid` (`cstid`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,4,NULL,1,5),(2,5,NULL,1,1),(5,3,NULL,5,1),(8,2,NULL,5,1),(13,4,NULL,1,3),(14,5,NULL,1,2),(18,8,NULL,1,1),(34,10,NULL,1,11),(41,1,20,1,14),(46,2,20,1,5),(47,9,21,1,2),(48,27,20,1,6),(49,7,21,1,1),(50,17,22,1,1),(51,14,22,1,1),(52,4,25,9,1),(53,26,23,9,1),(54,3,24,10,1),(55,32,25,9,4),(56,2,25,9,1),(57,32,NULL,9,1),(58,5,26,1,1),(59,2,27,11,1),(60,10,27,11,1),(61,2,28,11,1),(62,38,29,11,2),(64,35,30,12,2),(66,32,31,12,1),(67,1,32,12,1),(68,20,32,12,1),(69,1,33,11,1),(71,30,34,13,1),(72,10,34,13,1),(73,14,35,15,2),(78,9,39,12,1),(79,14,39,12,2),(80,9,40,12,1),(81,14,40,12,2),(82,9,41,12,1),(83,14,41,12,2),(84,9,42,12,1),(85,14,42,12,2),(86,30,NULL,21,1),(87,14,43,12,2),(88,1,44,12,2),(89,2,45,15,1),(90,1,46,23,1);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'删除分类','删除分类','/category/delCategory'),(2,'分类列表','查看分类列表','/category/list'),(15,'修改分类页面','修改分类页面','/category/editCategory'),(17,'添加商品分类','添加商品分类','/category/addCategory'),(18,'查看管理员列表','查看管理员列表','/config/listUser'),(20,'查看角色列表','可增删改查','/config/listRole'),(21,'查看权限列表','无','/config/listPermission'),(23,'修改管理员信息界面','修改界面','/config/editUser'),(24,'更新管理员信息','无','/config/updateUser'),(25,'管理员删除','删除','/config/deleteUser'),(26,'添加管理员界面','无','/config/adminAdd'),(27,'添加管理员','无','/config/addUser'),(28,'商品列表','查看商品列表','/product/list'),(29,'添加商品','添加上线商品','/product/addProduct'),(30,'删除商品','暂无','/product/deleteProduct'),(31,'修改商品界面','暂无','/product/editProduct'),(32,'更新商品','暂无','/product/updateProduct'),(33,'添加商品界面','暂无','/product/productAddUI'),(34,'商品上线','暂无','/product/enableStatus'),(35,'商品下线','暂无','/product/stopStatus'),(36,'订单发货','暂无','/order/orderDelivery'),(37,'查看订单项','暂无','/order/seeOrderItem'),(38,'评论列表','暂无','/review/list'),(39,'删除评论','暂无','/review/del'),(40,'查看订单列表','暂无','/order/list'),(41,'添加权限UI','暂无','/config/adminPerAddUI'),(42,'添加权限','暂无','/config/addPermission'),(43,'删除权限','暂无','/config/deletePermission'),(44,'修改权限ui','暂无','/config/editPermission'),(45,'更新权限','暂无','/config/updatePermission'),(46,'查看用户列表','暂无','/customer/list'),(47,'删除角色','暂无','/config/deleteRole'),(48,'添加管理员UI','暂无','/config/adminAdd'),(49,'添加管理员','暂未','/config/addUser'),(50,'修改角色UI','暂无','/config/editRole'),(51,'修改角色','暂无','/config/updateRole'),(52,'添加角色UI','暂无','/config/addRoleUI'),(53,'添加角色','暂无','/config/addRole');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `zan` int DEFAULT NULL COMMENT '赞',
  `number` int DEFAULT NULL COMMENT '销量',
  `status` int DEFAULT '1' COMMENT '状态，1：上线，0：下线',
  `imageurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品图片url',
  `miaoshu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品描述',
  `cid` int DEFAULT NULL COMMENT '分类id',
  `bid` bigint DEFAULT NULL COMMENT '商家id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_ibfk_1` (`cid`) USING BTREE,
  KEY `product_ibfk_2` (`bid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'红豆布丁烧奶',9.00,54,94,1,'images/product/1.jpg','软糯红豆嫩布丁，鲜香甘甜，浓郁的奶香与红豆完美相融，满足感充分体现在你的唇齿和心间',1,32),(2,'焦糖珍奶',10.00,98,103,1,'images/product/2.jpg','奶茶中的经典款，用不过时，焦糖的甜珍奶的鲜，永远有人喜欢。',1,28),(3,'葡萄柚益菌多',15.00,45,63,1,'images/product/3.jpg','新鲜葡萄柚与优菌多相遇，酸甜的滋味在唇齿间流转，只需闭上眼用心品味这让人欲罢不能的清爽感。',1,28),(4,'芒果布丁奶绿',13.00,41,43,1,'images/product/4.jpg','清香可口的海南大金煌与柔滑香的甜奶布丁，层层叠加，混搭滋味，随心选择。',1,28),(5,'金桔柠檬茶',18.00,72,168,1,'images/product/5.jpg','打破传统奶盖与茶饮分离的做法，将咸奶盖与芒果冰均匀融合。芒果冰的爽滑细腻与咸奶盖的香浓完美融合，口感清甜饱满，独家特制芒砂糖将芒果本身的香甜气息发挥到极致。',1,29),(6,'蜂蜜柚子茶',18.00,74,159,1,'images/product/6.jpg','不仅是味道清香可口，更是一款有美白祛斑、嫩肤养颜功效的食品。蜂蜜中含有的L－半胱氨酸具有排毒作用，具有一定的祛斑效果。',1,30),(7,'巧克力水果蛋糕',68.00,75,101,1,'images/product/7.jpg','本店蛋糕现做现卖，由于蛋糕的特殊性，请顾客提前义雄安史预定。联系电话：12312345678',2,29),(8,'心心相印',88.00,45,99,1,'images/product/8.jpg','为了保证蛋糕的新鲜！所有商品均为顾客下单现做！为了不耽误亲们的宝贵时间，请尽量提前一小时下单！详情致电：12312345678',2,29),(9,'美味奶油蛋糕',45.00,45,56,1,'images/product/9.jpg','本店蛋糕现做现卖，请顾客朋友提前预定电话：12312345678',2,29),(10,'至尊奶油蛋糕',98.00,235,420,1,'images/product/10.jpg','本店蛋糕现做现卖，由于蛋糕的特殊性，请顾客提前2小时预定。联系电话：12312345678',2,30),(11,'丰盛果园',133.00,356,2762,1,'images/product/11.jpg','（15人餐）本店蛋糕现做现卖，请顾客提亲1小时预定，联系电话：12312345678',2,30),(12,'太阳花',166.00,124,369,1,'images/product/12.jpg','（20人餐）本店蛋糕现做现卖，请顾客提前一小时预定。联系电话：12312345678',2,30),(13,'初见',105.00,124,234,1,'images/product/13.jpg','（12餐）本店蛋糕现做现卖，请顾客提前一小时预定，联系电话：12312345678',2,31),(14,'香辣鸡腿堡',5.00,124,254,1,'images/product/14.jpg','开业特惠，豪吃不贵！限时特价商品',3,31),(15,'墨西哥肌肉卷',19.00,453,454,1,'images/product/15.jpg','里面用的是番茄酱哈',3,31),(16,'爆浆鸡排',12.00,45,4654,1,'images/product/16.jpg','香脆可口',3,31),(17,'椰奶芝士蛋糕',11.00,54,132,1,'images/product/17.jpg','该商品暂无描述',3,31),(18,'南瓜脆皮芝士包',8.00,15,232,1,'images/product/18.jpg','暂无商品信息',3,31),(19,'核桃布里奥斯',23.00,33,323,1,'images/product/19.jpg','定制设计',3,30),(20,'卤肉配牛丸',45.00,45,555,1,'images/product/20.jpg','把简单的事情做到不简单，这就是我们存在的意义。优质猪后腿肉，在浓郁的老卤的怀抱中千回百转。30余味的精选香料与肉块的完美融合。',4,30),(25,'雪花鸡排饭',42.00,444,444,1,'images/product/25.jpg','鸡腿+脆骨肠+配菜+饮料+米饭',4,30),(26,'劲爆麻辣牛肉饭',35.00,23,43,1,'images/product/26.jpg','牛排+脆骨肠+配菜+饮料+米饭',4,30),(27,'蜜汁牛排饭',25.00,34,53,1,'images/product/27.jpg','牛排+脆骨肠+配菜+饮料+米饭',4,30),(28,'小熊卤肉饭',23.00,34,23,1,'images/product/28.jpg','卤香十足，香甜可口，回味无穷，超级好吃',4,30),(29,'法式炸鸡饭',23.00,43,65,1,'images/product/29.jpg','暂无介绍',4,30),(30,'清蒸大闸蟹',98.00,456,998,1,'images/product/30.jpg','3.5重的大公蟹，肉质鲜美，淘宝都卖一百四五一只，本店只卖98',5,31),(31,'单煎牛排',45.00,98,564,1,'images/product/31.jpg','暂无介绍',6,29),(32,'烧仙草',12.00,120,0,1,'images/product/32.jpg','新品上市',1,32),(34,'巴西烤肉',20.00,90,110,1,'images/product/34.jpg','美味四射！',1,34),(35,'招牌烤奶',7.00,80,120,1,'images/product/35.jpg','本店招牌产品',1,36),(36,'秘制小汉堡',15.00,99,214,1,'images/product/36.jpg','老八秘制小汉堡，既实惠还管饱',10,36),(37,'麻辣香锅',17.00,67,43,1,'images/product/37.jpg','很辣很辣。。。',4,36),(38,'西红柿炒鸡蛋',8.00,3,0,1,'images/product/38.jpg','好吃不贵',4,36),(39,'手抓饼',5.00,3,0,1,'images/product/39.jpg','营养早餐',3,36),(41,'煎饼果子',7.00,99,99,1,'images/product/41.jpg','双倍薄脆，双倍快乐',3,36),(43,'炸鸡',20.00,111,111,1,'images/product/43.jpg','新品',4,37);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '该用户默认给出了好评！！！' COMMENT '评论内容',
  `cstid` int DEFAULT NULL COMMENT '用户id',
  `pid` int DEFAULT NULL COMMENT '商品id',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cstid` (`cstid`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (15,'棒极了',1,5,'2020-06-04 09:26:28'),(16,'还不错，能吃',11,2,'2020-06-06 02:28:00');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','超级管理员'),(2,'productManager','商品管理员'),(3,'游客','只能查看，不能增删改');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rid` bigint DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (134,3,2),(135,3,18),(136,3,20),(137,3,21),(138,3,28),(139,3,37),(140,3,38),(141,3,40),(346,1,53),(347,1,52),(348,1,51),(349,1,50),(350,1,49),(351,1,48),(352,1,47),(353,1,46),(354,1,45),(355,1,44),(356,1,43),(357,1,42),(358,1,41),(359,1,40),(360,1,39),(361,1,38),(362,1,37),(363,1,36),(364,1,35),(365,1,34),(366,1,33),(367,1,32),(368,1,31),(369,1,30),(370,1,29),(371,1,28),(372,1,27),(373,1,26),(374,1,25),(375,1,24),(376,1,23),(377,1,21),(378,1,20),(379,1,18),(380,1,17),(381,1,15),(382,1,2),(383,1,1),(461,2,40),(462,2,39),(463,2,38),(464,2,37),(465,2,36),(466,2,35),(467,2,34),(468,2,33),(469,2,32),(470,2,31),(471,2,30),(472,2,29),(473,2,28),(474,2,17),(475,2,15),(476,2,2);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员姓名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员密码',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '状态，1：启用，0：停用',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '暂无' COMMENT '商家管理员地址',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'沈靖文','bd4b9f244abc416c9eb798c5eccdf911','YI7h6q+GgynkQyK2pZiPcQ==',1,'暂无','12445242532','2020-06-09 11:52:36'),(15,'visitor','d5613a30d19728d18cc60c96bba0f79f','dQF/H7yh6unc3ihiHl0gIA==',1,'暂无','12456458532','2020-06-04 11:12:09'),(28,'鸡公煲','d314fc5cd8eab3a5a9fbee3213923773','9y9Ncau4r8IWbLZRoO7TtA==',1,'西电综合楼B','18224235623','2020-06-04 11:13:09'),(29,'三全包','2818be6832a36d75e8e6ce54fa6dff1f','zyn+SchrTEBI/y8gdmbh0A==',1,'西电综合楼A','12453265428','2020-06-04 11:12:29'),(30,'美味私厨','6e83416d59f0c0be97c36c8f1aeab002','Z4vvzvJlDG1AdDPUMxhw3w==',1,'西电老综21号','15684569753','2020-06-04 11:13:59'),(31,'华莱士','86b9cf35fc5c5c711848834c0adc3268','NzJrcoggxkDDqTrh21Pecg==',1,'西电综合楼B','12452253264','2020-06-03 21:15:58'),(32,'冰雪蜜城','83041215e4cee4c6355e3a792ddfe4e9','l4k4Cy2Za0kgejEleulwdw==',1,'西电综合楼A','13898888467','2020-06-04 08:51:44'),(34,'薛征','a1a8dfa3bf0a878a3784b3326b3e5326','TfKeuVsesCEXiU7aw1v68g==',1,'西电教学楼A','15829309186','2020-06-09 06:14:36'),(35,'冯海军','9246b3be886a9e2805fc42b2520e22d6','Pc0oCUUODOGwQt7W71CRuQ==',1,'西电教学楼B','17839267482','2020-06-04 21:51:49'),(36,'万雨铭','dcd58a7af93a832be6163dad587d8f3a','xt92Ljh7nQVpd9dpxm+NYg==',1,'西电海棠宿舍楼','12345678910','2020-06-09 11:55:23'),(37,'迈德思客','f09a82a6419e81b27a8f037587d6b8a7','+lR8eJK/O13Wzrfzmi8ZQQ==',1,'西电综合楼A','13457685874','2020-06-04 10:29:35'),(43,'荆凡','2ef8b5921ed0b8f548da9a38d1d2b79b','ZRICxBpf1qm4SX7qMmVe4w==',1,'西电海棠六号楼','12345678910','2020-06-08 15:46:40');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint DEFAULT NULL,
  `rid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (88,1,1),(98,32,2),(103,31,2),(109,35,1),(110,34,1),(112,36,2),(113,37,2),(116,29,2),(117,30,2),(118,28,2),(119,15,3),(120,43,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zixun`
--

DROP TABLE IF EXISTS `zixun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zixun` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资讯内容',
  `cstid` int DEFAULT NULL COMMENT '客户id',
  `status` int DEFAULT '0' COMMENT '审核状态，1：通过，0：未通过;',
  `fabudate` datetime DEFAULT NULL COMMENT '发布时间;',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zixun`
--

LOCK TABLES `zixun` WRITE;
/*!40000 ALTER TABLE `zixun` DISABLE KEYS */;
INSERT INTO `zixun` VALUES (7,'烧仙草太贵了',9,1,'2020-06-03 20:45:20'),(8,'薛征测试，到此一游',1,1,'2020-06-04 09:29:01'),(9,'今天期末考试',12,1,'2020-06-09 05:32:26'),(10,'明天维护',12,1,'2020-06-09 06:04:28'),(11,'test咨询',23,0,'2020-06-09 11:52:14');
/*!40000 ALTER TABLE `zixun` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-10  0:14:32
