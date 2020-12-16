-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.32 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  10.2.0.5704
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 shixun 的数据库结构
CREATE DATABASE IF NOT EXISTS `shixun` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `shixun`;

-- 导出  表 shixun.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- 正在导出表  shixun.user 的数据：~107 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `age`, `address`, `qq`, `email`, `username`, `password`, `gender`) VALUES
	(50, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(51, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(52, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(53, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(54, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(55, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(56, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(58, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(60, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(61, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(62, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(63, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(64, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(65, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(66, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(67, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(68, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(69, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(70, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(71, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(72, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(73, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(74, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(75, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(76, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(77, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(78, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(79, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(80, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(81, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(82, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(83, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(84, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(85, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(86, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(87, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(88, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(89, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(90, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(91, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(92, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(93, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(94, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(95, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(96, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(97, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(98, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(99, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(100, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(101, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(103, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(104, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(105, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(106, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(107, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(108, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(109, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(110, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(111, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(112, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(113, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(114, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(115, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(116, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(117, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(118, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(119, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(120, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(121, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(122, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(123, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(124, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(180, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(181, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(182, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(183, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(184, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(185, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(186, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(187, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(188, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(189, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(190, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(191, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(192, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(193, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(194, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(240, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(241, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(242, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(243, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(244, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(245, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(246, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(247, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(248, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(249, '测试狗', 28, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(260, '刘晔大傻叉', 60, '上海', '123', '123@qq.com', 'root', 'root', '男'),
	(261, '刘禹锡', 12, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(265, '刘晔大傻叉', 60, '北京', '123', '123@qq.com', 'root', 'root', '女'),
	(266, '刘禹锡', 12, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(270, '刘晔大傻叉', 60, '陕西', '123123', '123@qq.com', 'root', 'root', '男'),
	(272, '张三', 12, '陕西', '123', '123@qq.com', 'root', 'root', '男'),
	(273, '刘晔大傻叉', 60, '北京', '123', '123@qq.com', 'root', 'root', '女'),
	(274, 'admin', 60, '陕西', '123', '123@qq.com', 'root', 'root', '男'),
	(275, '土豆丝', 24, '北京', '123', '123@qq.com', 'root', 'root', '男'),
	(276, '嗡嗡嗡', 24, '陕西', '123123', '123@qq.com', 'root', 'root', '男');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
