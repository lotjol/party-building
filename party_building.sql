-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2025-10-23 04:06:09
-- 服务器版本： 5.7.31
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `party_building`
--

-- --------------------------------------------------------

--
-- 表的结构 `party_admin`
--

DROP TABLE IF EXISTS `party_admin`;
CREATE TABLE IF NOT EXISTS `party_admin` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` varchar(30) DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `email` varchar(100) DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` bigint(16) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT NULL COMMENT '登录IP',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

--
-- 转存表中的数据 `party_admin`
--

INSERT INTO `party_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `mobile`, `loginfailure`, `logintime`, `loginip`, `createtime`, `updatetime`, `token`, `status`) VALUES
(1, 'admin', 'Admin', '2b4a3b6ed5c54571f745ef375dd7e6ed', '55f607', '/assets/img/avatar.png', 'admin@admin.com', '', 0, 1761124434, '0.0.0.0', 1491635035, 1761124434, 'd785690e-fbea-4b6b-8f38-18379902df57', 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_admin_log`
--

DROP TABLE IF EXISTS `party_admin_log`;
CREATE TABLE IF NOT EXISTS `party_admin_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` longtext NOT NULL COMMENT '内容',
  `ip` varchar(50) DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `createtime` bigint(16) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员日志表';

-- --------------------------------------------------------

--
-- 表的结构 `party_area`
--

DROP TABLE IF EXISTS `party_area`;
CREATE TABLE IF NOT EXISTS `party_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) DEFAULT NULL COMMENT '简称',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级:1=省,2=市,3=区/县',
  `pinyin` varchar(100) DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区表';

-- --------------------------------------------------------

--
-- 表的结构 `party_attachment`
--

DROP TABLE IF EXISTS `party_attachment`;
CREATE TABLE IF NOT EXISTS `party_attachment` (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category` varchar(50) DEFAULT '' COMMENT '类别',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) DEFAULT '' COMMENT '物理路径',
  `imagewidth` int(10) UNSIGNED DEFAULT '0' COMMENT '宽度',
  `imageheight` int(10) UNSIGNED DEFAULT '0' COMMENT '高度',
  `imagetype` varchar(30) DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filename` varchar(100) DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) DEFAULT '' COMMENT '透传数据',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建日期',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` bigint(16) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='附件表';

--
-- 转存表中的数据 `party_attachment`
--

INSERT INTO `party_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
(1, '', 1, 0, '/uploads/20251023/4cf3b5704ffa1116c8897cde074ed890.jpg', 400, 118, 'jpg', 0, '2f366aaa08324573bdf29fed69ca64b3.jpg', 36559, 'image/jpeg', '', 1761184745, 1761184745, 1761184745, 'local', '3ae015657580b89d2f5d1aeef7d50181acd65503'),
(2, '', 1, 0, '/uploads/20251023/d95a0f60ad359ff08ba7fca5c1be4db5.jpg', 400, 269, 'jpg', 0, '05b60ad7d5d7430f8627eb662e093fc5.jpg', 62750, 'image/jpeg', '', 1761184800, 1761184800, 1761184800, 'local', '137daa21bbad09ab2cc7bca2578e73dc787263c3'),
(3, '', 1, 0, '/uploads/20251023/a71bc22df9b686f588f6c38fda52cf5f.jpg', 400, 106, 'jpg', 0, '1d877b9884ea440db85c9f02636755d9.jpg', 37992, 'image/jpeg', '', 1761184877, 1761184877, 1761184877, 'local', '3a488851d6fa09d638ae8c5ad3bf0df8a025fa74'),
(4, '', 1, 0, '/uploads/20251023/657ca54b07d5a1e5520942750d4fdc8f.jpg', 400, 207, 'jpg', 0, '155e292c23cc4640a11d8831e59056b5.jpg', 52251, 'image/jpeg', '', 1761184959, 1761184959, 1761184959, 'local', '35a222d0ba94ece83f8fa0b9b15bfeb2dbec1f60'),
(5, '', 1, 0, '/uploads/20251023/5768c8d85b01385abc4ea82f21ad66b5.jpg', 1024, 683, 'jpg', 0, 'fe9e5049324b4b8a9ab614579b25f766.jpg', 103714, 'image/jpeg', '', 1761185145, 1761185145, 1761185145, 'local', '1e370fda47d0f3d48eacfd097b9832423c9595a0'),
(6, '', 1, 0, '/uploads/20251023/2c1502ac4198e17efbc135397f1e1010.jpg', 400, 300, 'jpg', 0, 'a76194d9e07c42b6ae3605167fa40c59.jpg', 211326, 'image/jpeg', '', 1761185676, 1761185676, 1761185676, 'local', 'd653c06178b56f51e163d0e150d4bf5cf25bd090'),
(7, '', 1, 0, '/uploads/20251023/2c1502ac4198e17efbc135397f1e1010.jpg', 400, 300, 'jpg', 0, 'a76194d9e07c42b6ae3605167fa40c59.jpg', 211326, 'image/jpeg', '', 1761185710, 1761185710, 1761185710, 'local', 'd653c06178b56f51e163d0e150d4bf5cf25bd090'),
(8, '', 1, 0, '/uploads/20251023/ba0d8c19db0f45930428f17308278129.png', 980, 510, 'png', 0, 'c244d8f6ad973eeb36e830cb5d1ddaadc3920a97.png', 864814, 'image/png', '', 1761186821, 1761186821, 1761186821, 'local', 'a647fe7148fecad1ca4067beb89b7c875e89c509'),
(9, '', 1, 0, '/uploads/20251023/c1027681da202ceb7492a1d8a78d87c1.png', 1842, 2256, 'png', 0, 'afb85246e674e44c333a82a95881dec2b0fb1cc0.png', 1216933, 'image/png', '', 1761187204, 1761187204, 1761187204, 'local', 'afb85246e674e44c333a82a95881dec2b0fb1cc0'),
(10, '', 1, 0, '/uploads/20251023/b9057476aa20f46cdb8ab41ada0161f0.png', 1438, 1918, 'png', 0, '647b1ff8577f5107383574be87fcf3654f53bff2.png', 667259, 'image/png', '', 1761187221, 1761187221, 1761187221, 'local', 'ce42ebbe97caa503601a30d35e4efdaba9955040'),
(11, '', 1, 0, '/uploads/20251023/f077c77c7207de8053ef395e6798a07d.jpg', 867, 567, 'jpg', 0, 'MAIN17611467823246O5JXOV79M (1).jpg', 609673, 'image/jpeg', '', 1761189223, 1761189223, 1761189223, 'local', '4262f4074c9b0d1fbcc4cdd5cd2cbbca2e204c40'),
(12, '', 1, 0, '/uploads/20251023/a08313c51362cabf19c0e0afc6397690.jpg', 867, 567, 'jpg', 0, 'MAIN1761182746839SUHAO0BPQS.jpg', 365845, 'image/jpeg', '', 1761189270, 1761189270, 1761189270, 'local', 'a3a10ba45194086b6be207568eb104baea29e57f'),
(13, '', 1, 0, '/uploads/20251023/6742ae004e841d78558b0d863151e3d0.jpg', 1060, 672, 'jpg', 0, 'MAIN1760595306443V6TVV8K9WV.jpg', 430529, 'image/jpeg', '', 1761189321, 1761189321, 1761189321, 'local', '276bf3c1171d68aa39bbc89fc42d7030292b2852'),
(14, '', 1, 0, '/uploads/20251023/afeb629d10b6c56ec184302b7f864317.jpg', 867, 567, 'jpg', 0, 'MAIN1757801890416XMWU2HO261.jpg', 478430, 'image/jpeg', '', 1761189393, 1761189393, 1761189393, 'local', '0f5c338005309541abb9a576d5f7ccdbe750adeb'),
(15, '', 1, 0, '/uploads/20251023/1526c52602ef047b239926b86fedbe1e.png', 1200, 712, 'png', 0, 'MAIN1759234571616KN9DLC7V9R.png', 938189, 'image/png', '', 1761189557, 1761189557, 1761189557, 'local', '529f5b0e49762d95c6b3bacaa0913f1f1d1eb3f7'),
(16, '', 1, 0, '/uploads/20251023/a66ee73bd9e2ad42bfcfb891b8369b20.jpg', 1242, 2208, 'jpg', 0, 'f179d43848feeb3b1fd773801ee3c108f6d29c65.jpg', 964403, 'image/jpeg', '', 1761189721, 1761189721, 1761189721, 'local', 'f179d43848feeb3b1fd773801ee3c108f6d29c65'),
(17, '', 1, 0, '/uploads/20251023/35eb6a8437abcc9a57e3fbc7fba76b63.png', 1000, 575, 'png', 0, '26608c38cc7f015524a2d8819e580fa845e927d3.png', 593992, 'image/png', '', 1761190328, 1761190328, 1761190328, 'local', 'e677fec25e43d704cd35e300d2cabdf3df30d734'),
(18, '', 1, 0, '/uploads/20251023/f4b40e6076118b381a251eb1d5a8b763.jpg', 1080, 1434, 'jpg', 0, '2f180cab58909165c138669cd2d54ac11e7d16e2.jpg', 271751, 'image/jpeg', '', 1761190522, 1761190522, 1761190522, 'local', '2f180cab58909165c138669cd2d54ac11e7d16e2'),
(19, '', 1, 0, '/uploads/20251023/21af6543b6010a7e5e38d0b6c4a120cb.jpg', 1000, 575, 'jpg', 0, 'bada0f15c01f2eae22141ccb7dada103af1802d7.jpg', 830642, 'image/jpeg', '', 1761190602, 1761190602, 1761190602, 'local', 'a5e71401959317c1c5ee57b843d52c52723efa31'),
(20, '', 1, 0, '/uploads/20251023/8de6de5827e2f7b6ffa25dc24488abaf.png', 1000, 678, 'png', 0, 'f928f269b98839c6858e533233022dee9a2e368b.png', 607851, 'image/png', '', 1761190656, 1761190656, 1761190656, 'local', '6a79e8d10f9ca3de81a977b03ce752d18a61fef7'),
(21, '', 1, 0, '/uploads/20251023/ec531b4fdda19f7a7c75e46b9bd39dc3.png', 1000, 915, 'png', 0, 'fd4078920c66db9c2de6cfe95080914bb4ec9bb5.png', 908588, 'image/png', '', 1761190692, 1761190692, 1761190692, 'local', 'c6089570216bb47fc0e3691c343c57fb0644fc03'),
(22, '', 1, 0, '/uploads/20251023/6c8b8af51b8ffe4bb80563854890d905.png', 1000, 914, 'png', 0, 'ab12d26bea7382dd457c5eb0922a9d145094dcb5 (1).png', 1101808, 'image/png', '', 1761190811, 1761190811, 1761190811, 'local', 'f4d268bdd709f929e95b199b31c26d8da626fcee'),
(23, '', 1, 0, '/uploads/20251023/206038497bfe83b871d60c85c9868f1b.png', 1000, 617, 'png', 0, '0e26f99110f137fcb1d43edc79f18f91f1ec5d85.png', 1005817, 'image/png', '', 1761190845, 1761190845, 1761190845, 'local', '6170dc31c416a3176ca2429b0bf9445820ae7d67'),
(24, '', 1, 0, '/uploads/20251023/99f4f16796cb65d992accb3b6ab2e8ba.png', 1000, 610, 'png', 0, '718c8dd61696c10ce54d82eb6e265f0b1656616b.png', 280700, 'image/png', '', 1761190874, 1761190874, 1761190874, 'local', '50315ba16a022ee2a37d41ecd56cba8930cabc8e'),
(25, '', 1, 0, '/uploads/20251023/e7c5ab21733722a401f38dd91e55cb9e.png', 758, 774, 'png', 0, 'e281569de3c2a527880d81d2299b4c358c085203.png', 927850, 'image/png', '', 1761190903, 1761190903, 1761190903, 'local', 'e281569de3c2a527880d81d2299b4c358c085203'),
(26, '', 1, 0, '/uploads/20251023/2f1449788796420eaef22ad9d6d5aa77.jpg', 867, 567, 'jpg', 0, 'MAIN1761182746882UMAAILZMLT.jpg', 220090, 'image/jpeg', '', 1761190913, 1761190913, 1761190913, 'local', '2552b6935033bc323a976b9086b4e1fd8be21522'),
(27, '', 1, 0, '/uploads/20251023/c63d23339f085839072dbb85c31abb50.jpg', 867, 567, 'jpg', 0, 'MAIN1761182746827V2GQS7EVQ2.jpg', 169584, 'image/jpeg', '', 1761190921, 1761190921, 1761190921, 'local', '0df465ad69edd3e5a6efb7da8461b469f33a7326'),
(28, '', 1, 0, '/uploads/20251023/b225905c05b5068dca73e927f5afddd4.jpg', 1200, 675, 'jpg', 0, 'c6956456a2c1470e82c0a686ee8ad665.jpg', 182504, 'image/jpeg', '', 1761190937, 1761190937, 1761190937, 'local', '375be5e7a81d869d2221569faa601626efcdf37c'),
(29, '', 1, 0, '/uploads/20251023/b19bbe0d314a94d42cfcfef4ca6d173f.jpg', 1200, 675, 'jpg', 0, '95222db52a0a42c59cfb9369b5df5dd1.jpg', 154342, 'image/jpeg', '', 1761190946, 1761190946, 1761190946, 'local', 'ef550639d8b671be14c69327416d47e17df03442'),
(30, '', 1, 0, '/uploads/20251023/7116db58af4b019117e96d08417aca91.png', 738, 1008, 'png', 0, '56dfda7106d01a578e844b8769289637d35e841d.png', 466789, 'image/png', '', 1761191207, 1761191207, 1761191207, 'local', '56dfda7106d01a578e844b8769289637d35e841d'),
(31, '', 1, 0, '/uploads/20251023/d91b56083bd3e554df6628d8bc24aa4a.jpg', 1920, 1080, 'jpg', 0, '042b8e8fd97a4a0286d48a3d1cab8b85.jpg', 250706, 'image/jpeg', '', 1761191954, 1761191954, 1761191954, 'local', '8a19286d22b36e18ee2235df341a88c68759b3b2'),
(32, '', 1, 0, '/uploads/20251023/b68c91d4ce0b5e993683adf7c502cd7f.jpg', 1920, 1080, 'jpg', 0, '4b3a55f3f35c4be7bf2401d75e2b5c50.jpg', 279770, 'image/jpeg', '', 1761191998, 1761191998, 1761191998, 'local', '47e77c64f30727de5e5526ef59140afe0bbb2f59'),
(33, '', 1, 0, '/uploads/20251023/a83ebb008eb54c1bb85937d44d24285b.jpg', 1920, 1080, 'jpg', 0, 'd335f94130414e5ea985999714a1e891.jpg', 171848, 'image/jpeg', '', 1761192113, 1761192113, 1761192113, 'local', 'a752c990d5c81356c119ca3c5ba3a2d2c91bedc5');

-- --------------------------------------------------------

--
-- 表的结构 `party_auth_group`
--

DROP TABLE IF EXISTS `party_auth_group`;
CREATE TABLE IF NOT EXISTS `party_auth_group` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='分组表';

--
-- 转存表中的数据 `party_auth_group`
--

INSERT INTO `party_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal'),
(2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1491635035, 1491635035, 'normal'),
(3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1491635035, 1491635035, 'normal'),
(4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal'),
(5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1491635035, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_auth_group_access`
--

DROP TABLE IF EXISTS `party_auth_group_access`;
CREATE TABLE IF NOT EXISTS `party_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限分组表';

--
-- 转存表中的数据 `party_auth_group_access`
--

INSERT INTO `party_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `party_auth_rule`
--

DROP TABLE IF EXISTS `party_auth_rule`;
CREATE TABLE IF NOT EXISTS `party_auth_rule` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `url` varchar(255) DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) DEFAULT '' COMMENT '条件',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) DEFAULT '' COMMENT '拼音',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COMMENT='节点表';

--
-- 转存表中的数据 `party_auth_rule`
--

INSERT INTO `party_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal'),
(2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', '', 1, NULL, '', 'cggl', 'changguiguanli', 1491635035, 1491635035, 119, 'normal'),
(3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', '', 'Category tips', 0, NULL, '', 'flgl', 'fenleiguanli', 1491635035, 1491635035, 0, 'normal'),
(4, 'file', 0, 'addon', '插件管理', 'fa fa-rocket', '', '', '可在线安装、卸载、禁用、启用、配置、升级插件，插件升级前请做好备份。', 0, 'addtabs', '', 'cjgl', 'chajianguanli', 1491635035, 1758712097, 0, 'normal'),
(5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', '', 1, NULL, '', 'qxgl', 'quanxianguanli', 1491635035, 1491635035, 99, 'normal'),
(6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1491635035, 1491635035, 60, 'normal'),
(7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 'fjgl', 'fujianguanli', 1491635035, 1491635035, 53, 'normal'),
(8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 0, NULL, '', 'grzl', 'gerenziliao', 1491635035, 1758182849, 34, 'normal'),
(9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 'glygl', 'guanliyuanguanli', 1491635035, 1491635035, 118, 'normal'),
(10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 'glyrz', 'guanliyuanrizhi', 1491635035, 1491635035, 113, 'normal'),
(11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 'jsz', 'juesezu', 1491635035, 1491635035, 109, 'normal'),
(12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 'cdgz', 'caidanguize', 1491635035, 1491635035, 104, 'normal'),
(13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal'),
(14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal'),
(15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal'),
(16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal'),
(17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal'),
(18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal'),
(19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal'),
(20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal'),
(21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal'),
(22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal'),
(23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal'),
(24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal'),
(25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal'),
(26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal'),
(27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal'),
(28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal'),
(29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal'),
(30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal'),
(31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal'),
(32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal'),
(33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal'),
(34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal'),
(35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', '', '', 1491635035, 1491635035, 142, 'normal'),
(36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 141, 'normal'),
(37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 140, 'normal'),
(38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 139, 'normal'),
(39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 138, 'normal'),
(40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal'),
(41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal'),
(42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal'),
(43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal'),
(44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal'),
(45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal'),
(46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal'),
(47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal'),
(48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal'),
(49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal'),
(50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal'),
(51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal'),
(52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal'),
(53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal'),
(54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal'),
(55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(66, 'file', 0, 'user', '会员管理', 'fa fa-user-circle', '', '', '', 1, 'addtabs', '', 'hygl', 'huiyuanguanli', 1491635035, 1758183117, 88, 'normal'),
(67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal'),
(68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 1, NULL, '', 'hyfz', 'huiyuanfenzu', 1491635035, 1491635035, 0, 'normal'),
(74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1758712220, 0, 'normal'),
(80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(85, 'file', 0, 'cms', 'CMS管理', 'fa fa-file-text', '', '', '', 1, NULL, '', 'Cgl', 'CMSguanli', 1758155809, 1758155809, 137, 'normal'),
(86, 'file', 85, 'cms/config', '站点配置', 'fa fa-gears', '', '', '', 0, NULL, '', 'zdpz', 'zhandianpeizhi', 1758155809, 1761129435, 22, 'normal'),
(87, 'file', 86, 'cms/config/index', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(88, 'file', 85, 'cms/statistics', '统计控制台', 'fa fa-bar-chart', '', '', '', 0, NULL, '', 'tjkzt', 'tongjikongzhitai', 1758155809, 1758182738, 21, 'normal'),
(89, 'file', 88, 'cms/statistics/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(90, 'file', 85, 'cms/channel', '栏目管理', 'fa fa-list', '', '', '用于管理网站的分类、设置导航分类', 1, NULL, '', 'lmgl', 'lanmuguanli', 1758155809, 1758155809, 20, 'normal'),
(91, 'file', 90, 'cms/channel/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(92, 'file', 90, 'cms/channel/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(93, 'file', 90, 'cms/channel/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(94, 'file', 90, 'cms/channel/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(95, 'file', 90, 'cms/channel/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(96, 'file', 90, 'cms/channel/admin', '栏目授权', 'fa fa-circle-o', '', '', '分配管理员可管理的栏目数据，此功能需要先开启站点配置栏目授权开关', 0, NULL, '', 'lmsq', 'lanmushouquan', 1758155809, 1758155809, 0, 'normal'),
(97, 'file', 85, 'cms/archives', '内容管理', 'fa fa-file-text-o', '', '', '', 1, NULL, '', 'nrgl', 'neirongguanli', 1758155809, 1758155809, 19, 'normal'),
(98, 'file', 97, 'cms/archives/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(99, 'file', 97, 'cms/archives/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(100, 'file', 97, 'cms/archives/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(101, 'file', 97, 'cms/archives/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(102, 'file', 97, 'cms/archives/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(103, 'file', 97, 'cms/archives/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1758155809, 1758155809, 0, 'normal'),
(104, 'file', 97, 'cms/archives/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1758155809, 1758155809, 0, 'normal'),
(105, 'file', 97, 'cms/archives/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1758155809, 1758155809, 0, 'normal'),
(106, 'file', 85, 'cms/modelx', '模型管理', 'fa fa-th', '', '', '在线添加修改删除模型，管理模型字段', 1, NULL, '', 'mxgl', 'moxingguanli', 1758155809, 1758155809, 18, 'normal'),
(107, 'file', 106, 'cms/modelx/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(108, 'file', 106, 'cms/modelx/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(109, 'file', 106, 'cms/modelx/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(110, 'file', 106, 'cms/modelx/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(111, 'file', 106, 'cms/modelx/duplicate', '复制', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'fz', 'fuzhi', 1758155809, 1758155809, 0, 'normal'),
(112, 'file', 106, 'cms/modelx/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(113, 'file', 85, 'cms/fields', '字段管理', 'fa fa-fields', '', '', '用于管理模型或表单的字段，灰色为主表字段无法删除', 0, NULL, '', 'zdgl', 'ziduanguanli', 1758155809, 1758155809, 0, 'normal'),
(114, 'file', 113, 'cms/fields/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(115, 'file', 113, 'cms/fields/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(116, 'file', 113, 'cms/fields/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(117, 'file', 113, 'cms/fields/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(118, 'file', 113, 'cms/fields/duplicate', '复制', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'fz', 'fuzhi', 1758155809, 1758155809, 0, 'normal'),
(119, 'file', 113, 'cms/fields/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(120, 'file', 85, 'cms/tag', '标签管理', 'fa fa-tags', '', '', '用于管理文章关联的标签,标签的添加在添加文章时自动维护,无需手动添加标签', 0, NULL, '', 'bqgl', 'biaoqianguanli', 1758155809, 1761129464, 17, 'normal'),
(121, 'file', 120, 'cms/tag/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(122, 'file', 120, 'cms/tag/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(123, 'file', 120, 'cms/tag/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(124, 'file', 120, 'cms/tag/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(125, 'file', 120, 'cms/tag/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(126, 'file', 85, 'cms/block', '焦点图管理', 'fa fa-th-large', '', '', '用于管理站点的自定义区块内容，常用于广告、JS脚本、焦点图、片段代码等', 1, 'addtabs', '', 'jdtgl', 'jiaodiantuguanli', 1758155809, 1761129568, 16, 'normal'),
(127, 'file', 126, 'cms/block/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(128, 'file', 126, 'cms/block/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(129, 'file', 126, 'cms/block/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(130, 'file', 126, 'cms/block/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(131, 'file', 126, 'cms/block/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(132, 'file', 85, 'cms/page', '单页管理', 'fa fa-file', '', '', '用于管理网站的单页面', 0, NULL, '', 'dygl', 'danyeguanli', 1758155809, 1761127287, 15, 'normal'),
(133, 'file', 132, 'cms/page/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(134, 'file', 132, 'cms/page/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(135, 'file', 132, 'cms/page/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(136, 'file', 132, 'cms/page/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(137, 'file', 132, 'cms/page/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(138, 'file', 132, 'cms/page/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1758155809, 1758155809, 0, 'normal'),
(139, 'file', 132, 'cms/page/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1758155809, 1758155809, 0, 'normal'),
(140, 'file', 132, 'cms/page/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1758155809, 1758155809, 0, 'normal'),
(141, 'file', 85, 'cms/search_log', '搜索记录管理', 'fa fa-history', '', '', '用于管理网站的搜索记录日志', 0, NULL, '', 'ssjlgl', 'sousuojiluguanli', 1758155809, 1758182686, 15, 'normal'),
(142, 'file', 141, 'cms/search_log/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(143, 'file', 141, 'cms/search_log/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(144, 'file', 141, 'cms/search_log/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(145, 'file', 141, 'cms/search_log/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(146, 'file', 141, 'cms/search_log/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(147, 'file', 85, 'cms/comment', '评论管理', 'fa fa-comment', '', '', '用于管理用户在网站上发表的评论', 0, NULL, '', 'plgl', 'pinglunguanli', 1758155809, 1760613079, 14, 'normal'),
(148, 'file', 147, 'cms/comment/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(149, 'file', 147, 'cms/comment/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(150, 'file', 147, 'cms/comment/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(151, 'file', 147, 'cms/comment/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(152, 'file', 147, 'cms/comment/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(153, 'file', 147, 'cms/comment/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1758155809, 1758155809, 0, 'normal'),
(154, 'file', 147, 'cms/comment/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1758155809, 1758155809, 0, 'normal'),
(155, 'file', 147, 'cms/comment/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1758155809, 1758155809, 0, 'normal'),
(156, 'file', 85, 'cms/diyform', '自定义表单管理', 'fa fa-list', '', '', '可在线创建自定义表单，管理表单字段和数据列表', 1, NULL, '', 'zdybdgl', 'zidingyibiaodanguanli', 1758155809, 1760539283, 13, 'normal'),
(157, 'file', 156, 'cms/diyform/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(158, 'file', 156, 'cms/diyform/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(159, 'file', 156, 'cms/diyform/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(160, 'file', 156, 'cms/diyform/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(161, 'file', 156, 'cms/diyform/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(162, 'file', 85, 'cms/diydata', '自定义表单数据管理', 'fa fa-list', '', '', '可在线管理自定义表单的数据列表', 0, NULL, '', 'zdybdsjgl', 'zidingyibiaodanshujuguanli', 1758155809, 1758155809, 12, 'normal'),
(163, 'file', 162, 'cms/diydata/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(164, 'file', 162, 'cms/diydata/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(165, 'file', 162, 'cms/diydata/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(166, 'file', 162, 'cms/diydata/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(167, 'file', 162, 'cms/diydata/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(168, 'file', 162, 'cms/diydata/import', '导入', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'dr', 'daoru', 1758155809, 1758155809, 0, 'normal'),
(169, 'file', 85, 'cms/order', '订单管理', 'fa fa-cny', '', '', '可在线管理付费查看所产生的订单', 0, NULL, '', 'ddgl', 'dingdanguanli', 1758155809, 1758182632, 11, 'normal'),
(170, 'file', 169, 'cms/order/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(171, 'file', 169, 'cms/order/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(172, 'file', 169, 'cms/order/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(173, 'file', 169, 'cms/order/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(174, 'file', 169, 'cms/order/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(175, 'file', 85, 'cms/special', '专题管理', 'fa fa-newspaper-o', '', '', '可在线管理专题列表', 0, NULL, '', 'ztgl', 'zhuantiguanli', 1758155809, 1761127280, 10, 'normal'),
(176, 'file', 175, 'cms/special/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(177, 'file', 175, 'cms/special/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(178, 'file', 175, 'cms/special/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(179, 'file', 175, 'cms/special/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(180, 'file', 175, 'cms/special/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(181, 'file', 175, 'cms/special/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1758155809, 1758155809, 0, 'normal'),
(182, 'file', 175, 'cms/special/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1758155809, 1758155809, 0, 'normal'),
(183, 'file', 175, 'cms/special/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1758155809, 1758155809, 0, 'normal'),
(184, 'file', 85, 'cms/builder', '标签生成器', 'fa fa-code', '', '', '可在线生成模板标签并进行渲染标签', 0, NULL, '', 'bqscq', 'biaoqianshengchengqi', 1758155809, 1758182654, 10, 'normal'),
(185, 'file', 184, 'cms/builder/index', '生成', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shengcheng', 1758155809, 1758155809, 0, 'normal'),
(186, 'file', 184, 'cms/builder/parse', '解析', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'jx', 'jiexi', 1758155809, 1758155809, 0, 'normal'),
(187, 'file', 85, 'cms/autolink', '自动链接管理', 'fa fa-link', '', '', '管理文章正文内文本自动链接', 0, NULL, '', 'zdljgl', 'zidonglianjieguanli', 1758155809, 1758182668, 11, 'normal'),
(188, 'file', 187, 'cms/autolink/index', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(189, 'file', 187, 'cms/autolink/add', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(190, 'file', 187, 'cms/autolink/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(191, 'file', 187, 'cms/autolink/del', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(192, 'file', 187, 'cms/autolink/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(193, 'file', 85, 'cms/spider_log', '搜索引擎来访管理', 'fa fa-search', '', '', '可在线管理搜索引擎蜘蛛来访记录', 0, NULL, '', 'ssyqlfgl', 'sousuoyinqinglaifangguanli', 1758155809, 1758182678, 14, 'normal'),
(194, 'file', 193, 'cms/spider_log/index', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(195, 'file', 193, 'cms/spider_log/add', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(196, 'file', 193, 'cms/spider_log/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(197, 'file', 193, 'cms/spider_log/del', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(198, 'file', 193, 'cms/spider_log/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_category`
--

DROP TABLE IF EXISTS `party_category`;
CREATE TABLE IF NOT EXISTS `party_category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  `flag` set('hot','index','recommend') DEFAULT '',
  `image` varchar(100) DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) DEFAULT '' COMMENT '自定义名称',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_addon_activity`
--

DROP TABLE IF EXISTS `party_cms_addon_activity`;
CREATE TABLE IF NOT EXISTS `party_cms_addon_activity` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织活动';

--
-- 转存表中的数据 `party_cms_addon_activity`
--

INSERT INTO `party_cms_addon_activity` (`id`, `content`, `start_date`, `end_date`) VALUES
(33, '<p>1、活动时间：2025.10.23-2025.11.23</p>\r\n<p>2、活动内容：<br />由路南街道&ldquo;艺路向南&rdquo;文艺轻骑兵与群众自编自演的13个精彩节目轮番登场，舞龙、非洲鼓、电吹管等艺术形式交织碰撞，为现场观众献上了一场充满本土特色与艺术魅力的文化盛宴。</p>\r\n<p>3、活动规则：<br />在人才建设上，团队通过&ldquo;内培外引&rdquo;壮大队伍：吸纳省市文化下沉力量、高校师生等专业力量，引进&ldquo;台州人艺话剧团&rdquo;3名骨干；建立&ldquo;乡村艺校&rdquo;</p>', '2025-10-23', '2025-11-23'),
(34, '<p>1、活动时间：2025.08.07-2025.10.31</p>\r\n<p>2、活动内容：<br />由路南街道&ldquo;艺路向南&rdquo;文艺轻骑兵与群众自编自演的13个精彩节目轮番登场，舞龙、非洲鼓、电吹管等艺术形式交织碰撞，为现场观众献上了一场充满本土特色与艺术魅力的文化盛宴。</p>\r\n<p>3、活动规则：<br />在人才建设上，团队通过&ldquo;内培外引&rdquo;壮大队伍：吸纳省市文化下沉力量、高校师生等专业力量，引进&ldquo;台州人艺话剧团&rdquo;3名骨干；建立&ldquo;乡村艺校&rdquo;</p>', '2025-08-07', '2025-10-31');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_addon_article`
--

DROP TABLE IF EXISTS `party_cms_addon_article`;
CREATE TABLE IF NOT EXISTS `party_cms_addon_article` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章';

--
-- 转存表中的数据 `party_cms_addon_article`
--

INSERT INTO `party_cms_addon_article` (`id`, `content`) VALUES
(1, '<p>本报咸阳讯（通讯员阎晋于文哲）&ldquo;爬了十几年楼，如今&lsquo;一键到家&rsquo;，实在太方便了。没想到老小区现在也能让人住得这么舒心！&rdquo;国庆假期，家住陕西省咸阳市渭城区石化小区的王小津老人按下电梯按钮，笑容满面地说。今年9月，石化小区老旧住宅楼加装的43部电梯全部投入使用，&ldquo;爬楼难&rdquo;已成历史。</p>\r\n<p>为破解城市社区基层治理&ldquo;服务不细&rdquo;问题，近些年来，咸阳市系统谋划、健全机制，以社区党组织为民服务&ldquo;一年10件实事&rdquo;活动为抓手，推动社区党组织精准对接民生痛点，解决一大批居民关切的操心事、烦心事、揪心事，不断提升基层治理精细化水平。</p>\r\n<p>让居民群众成为实事项目的&ldquo;出题人&rdquo;。咸阳市着力解决好&ldquo;供需匹配&rdquo;问题，坚持把解决群众急难愁盼作为出发点和落脚点，群众期盼什么、社区就干什么。采取&ldquo;线上+线下&rdquo;相结合的方式，通过网格员入户走访、居民议事会共商、网络征询等途径，深入了解社情民意，把准群众需求脉搏。对收集到的意见诉求梳理分析、归类合并，由社区党组织研究、街道党工委审核、县（市、区）委组织部审定，形成&ldquo;一年10件实事&rdquo;清单，并通过社区公告栏、微信公众号等公开公示，确保实事项目精准可行、直达痛点。截至今年8月底，已办结民生实事2573件。</p>\r\n<p>聚焦群众最关心、最直接、最现实的利益问题，咸阳市从一件件惠民便民&ldquo;关键小事&rdquo;入手，将顺民意、暖民心的工作做到群众心坎上，解决好&ldquo;可感可及&rdquo;问题。突出基础设施补短板，实施基础设施维护更新、环境绿化美化等工程，小区居住环境明显改善，居民生活品质大幅提升。持续提升&ldquo;一老一小&rdquo;服务水平，建设日间照料中心、社区食堂、早教空间等服务阵地，开展爱心义诊进社区、高龄年检上门服务，举办亲子活动、暑期托管等6800多场次。秦都区陕广社区依托医养服务中心，为90岁以上老人提供营养套餐和上门养老服务。筑牢安全治理防线，集中整治消防通道堵塞、飞线充电等问题，安装智能充电桩3200多个，新增高清监控探头5800多个。坚持和发展新时代&ldquo;枫桥经验&rdquo;，组建&ldquo;邻里议事厅&rdquo;&ldquo;银发调解队&rdquo;，调解邻里纠纷等3800余起，及时化解矛盾纠纷。依托新时代文明实践站常态化开展各类文体活动，打造聚人气、扬正气、淳风气的精神家园。</p>\r\n<p>在推行&ldquo;一年10件实事&rdquo;过程中，有些事项仅靠社区力量难以办到。为此，咸阳市各街道、社区党组织积极整合各类资源、创新服务模式，变&ldquo;社区单独干&rdquo;为&ldquo;社区牵头办&rdquo;，解决好&ldquo;力量聚合&rdquo;问题。社区能办理的及时办，需要部门协同的由街道吹哨，通过党建联席会议等机制，统筹物业、业委会、驻区单位等力量共同推动解决。探索&ldquo;党建+公益+市场&rdquo;等模式，引入&ldquo;小滨工坊&rdquo;&ldquo;秦大姐手工坊&rdquo;等社会组织，提供免费或低偿服务，满足居民多元化需求。引导群众参与共建共治，培育&ldquo;邻里帮帮团&rdquo;&ldquo;红色代办队&rdquo;等居民自治力量，推行&ldquo;时间银行&rdquo;、志愿服务积分制等做法，调动群众依靠自身力量解决社区治理问题的积极性。彬州市东街社区举办&ldquo;红心物业服务集市&rdquo;17场次，带动辖区商户、机关单位参与，提供家电维修、免费理发等服务，惠及群众1.4万人次。</p>\r\n<p>为防止搞&ldquo;一阵风&rdquo;，咸阳市探索建立&ldquo;听民意、定承诺、办实事、评结果&rdquo;闭环体系，确保承诺落地有声、践诺扎实有效，解决好&ldquo;常态长效&rdquo;问题。建立市级指导、县区统筹、街道主抓、社区落实推进机制，将深化&ldquo;一年10件实事&rdquo;活动纳入年度基层党建工作重点任务，定期调度推进，层层压实责任，形成上下联动、齐抓共管的工作格局。对确定的实事项目，建立台账、动态管理，推行&ldquo;一件实事、一名责任人、一套方案、一抓到底&rdquo;的&ldquo;四个一&rdquo;工作法，切实把好事做实、实事做好。渭城区渭阳街道探索建立&ldquo;向群众汇报&rdquo;工作机制，社区党组织定期召开汇报会，现场向群众汇报实事办理和反映问题解决情况，去年以来，在所辖26个社区召开&ldquo;向群众汇报&rdquo;会107场次，参加人员3500余人次，解决物业服务、环境卫生、社区安全等问题209个，实现了有事让群众知情、议事让群众参与、办事让群众监督、成事让群众满意。</p>'),
(2, '<p>如今，在云南省丽江市华坪县兴泉镇党群服务中心，村民不到一刻钟就办完育儿补贴发放登记；宁蒗县红桥镇遭遇强降雨，&ldquo;一站救&rdquo;队伍6小时抢通3公里受阻道路&hellip;&hellip;一桩桩基层治理难题的高效解决，是丽江市推行党建引领基层治理&ldquo;六个一&rdquo;改革的生动缩影。</p>\r\n<p>丽江市位于云南省西北部、滇川藏三省区交汇处，山区占92.3%，少数民族人口占55.8%。近些年来，针对基层治理碎片化问题突出、应急响应能力弱、协同力量不足等问题，丽江市系统化推行党建引领基层治理&ldquo;六个一&rdquo;改革，通过推进基层治理&ldquo;一网清&rdquo;、数据共享&ldquo;一表通&rdquo;、履责事项&ldquo;一单明&rdquo;、服务审批&ldquo;一窗办&rdquo;、综合执法&ldquo;一队管&rdquo;、应急处突&ldquo;一站救&rdquo;，着力破解基层治理&ldquo;小马拉大车&rdquo;难题，以治理现代化绘出&ldquo;和美丽江&rdquo;新画卷。</p>\r\n<p><strong>&ldquo;一网清&rdquo;强治理&ldquo;一表通&rdquo;提效能</strong></p>\r\n<p>新开业民宿需补录员工信息&rdquo;&ldquo;独居老人需定期探望&rdquo;&hellip;&hellip;翻开古城区大研街道北门社区党委书记刘林军的笔记本，密密麻麻记满了群众需求。这些民生小事被一一纳入网格，迅速响应、高效办结。</p>\r\n<p>丽江将全市科学划分为6963个网格、17482个微网格，选优配强网格长和专职网格员6928名，建立网格党支部4022个，形成&ldquo;乡镇（街道）党（工）委&mdash;村（社区）党组织&mdash;网格党支部（党小组）&mdash;党员中心户&rdquo;四级组织体系。通过&ldquo;以奖代补&rdquo;&ldquo;以案定补&rdquo;等激励机制，今年以来，已排查化解2915件风险隐患。</p>\r\n<p>同时，上线&ldquo;一表通数字平台&rdquo;，基层报表从8610张压减至278张，自动填表、一键汇总等功能，让党员干部从重复填报中解放出来。组织部门统筹协调，成立数据赋能基层治理暨&ldquo;云表通&rdquo;工作专班，整合政法、数据局、社会工作、政务服务等部门资源，破除工作壁垒。按照&ldquo;人、房、企、事、物&rdquo;5个重点目标对象，通过回流、归集、共享等途径，整理入库人口数据122.8万条、房屋数据37.1万条、企业数据21.57万条，持续加强基层全量数据采集归集和动态更新，实现数据&ldquo;一次采集、多方共用&rdquo;。</p>\r\n<p><strong>&ldquo;一单明&rdquo;促规范&ldquo;一窗办&rdquo;优服务</strong></p>\r\n<p>走进玉龙县黄山街道白华社区党群服务中心，居民张哲刚刚办完电表安装业务：&ldquo;一进门就有人接待，一会儿就办好了，真方便！&rdquo;</p>\r\n<p>&ldquo;一窗办&rdquo;改革全面推行&ldquo;一门集成、一窗受理、一章审批、一网通办&rdquo;，实行&ldquo;前台综合收件、后台专业审批、统一窗口发证&rdquo;模式，严格执行首问负责、一次性告知、限时办结制度。电子政务外网覆盖所有村（社区），政务服务事项清单全面公开，专用章整合审批环节，实现&ldquo;减环节、减材料、减跑动、减时限&rdquo;，群众在家门口就能办好身边事。</p>\r\n<p>聚焦基层&ldquo;该干什么、能干什么&rdquo;，丽江市县乡三级联动，系统梳理乡镇（街道）工作事项，编制履职清单，将平均事项从2147项压减至377项。乡镇（街道）立足自身定位，结合资源优势，精准提炼个性事项融入清单。建立岗位责任清单，推动党员干部照单履职、精准尽责。</p>\r\n<p><strong>&ldquo;一队管&rdquo;夯基础&ldquo;一站救&rdquo;保平安</strong></p>\r\n<p>8月22日20时许，宁蒗县翠玉乡接到汛情预警后，&ldquo;一站救&rdquo;应急救援队伍迅速响应，10分钟内完成集结，30分钟抵达现场。队员们通过无人机航拍和现场勘查，发现某村民房屋上游冲沟积水严重，存在山洪暴发高风险。救援队伍立即启动转移方案，及时排除险情。这次成功抢险是丽江市&ldquo;一站救&rdquo;应急队伍在基层发挥作用的生动体现。</p>\r\n<p>针对基层执法&ldquo;看得见的管不了、管得了的看不见&rdquo;难题，丽江市推行&ldquo;机构整合+标准重塑+能力跃升&rdquo;的综合执法改革。每个乡镇（街道）统一组建不少于5人的执法队，执法服装、办公设备、办公场所均按规范化建设要求配备。以&ldquo;清单明责&mdash;明晰程序&mdash;数字赋能&mdash;阳光监督&rdquo;四维改革为抓手，推动基层执法从&ldquo;粗放管理&rdquo;向&ldquo;精准治理&rdquo;转型升级。加强政策法规培训和实战作训，让执法人员从&ldquo;专科&rdquo;向&ldquo;全科&rdquo;转变。完善审核、评查、协作、评价、调整五项机制，强化审核评查和执法协作，实现从&ldquo;单打独斗&rdquo;到&ldquo;协同作战&rdquo;的转变。</p>\r\n<p>应急响应机制同样实现突破。丽江市通过实行人员、资金、物资、场所、职责&ldquo;五整合&rdquo;，指挥、管理、训练、值守&ldquo;四统一&rdquo;，进退、培育、考核机制&ldquo;三健全&rdquo;的&ldquo;543&rdquo;工作法，整合扑火队、基干民兵、气象防雹员等力量，各乡镇（街道）组建&ldquo;一站救&rdquo;综合应急救援队，做到&ldquo;平时服务、急时应急、战时应战&rdquo;。规范建设应急物资储备点，强化区域资源协同，实现从&ldquo;分散储备&rdquo;到&ldquo;立体保障&rdquo;的升级。今年汛期，全市依托&ldquo;一站救&rdquo;队伍处置险情137起，安全转移群众2008人，牢牢守住群众生命财产安全底线。</p>'),
(3, '<p>近日，北京市石景山区八角街道八角南路社区在推行停车管理过程中，不少居民向网格长反映车辆进主路时存在安全隐患。网格长迅速响应、研判办理，积极协调停车管理公司在路边安装凸透镜。&ldquo;网格长的解释答复我很满意，解决安全隐患效率很高，现在我有什么事就找网格长，好使！&rdquo;居民孙瑛赞赏道。</p>\r\n<p>去年以来，北京市石景山区围绕深化党建引领网格治理，在全区创新开展&ldquo;智网实格&rdquo;建设，打造网格设置科学合理、工作力量充足管用、运行机制健全完善、功能作用有效发挥的精细化治理体系，推动基层治理提质增效，不断增强居民群众的获得感、幸福感、安全感。</p>\r\n<p>一网格一支部</p>\r\n<p><strong>四级组织一贯到底</strong></p>\r\n<p>&ldquo;我们将社区无缝划分成14个网格，网格间边界清晰、责任明确，而且每个网格都有1个党支部或党小组，切实把党的组织覆盖到治理最末梢。&rdquo;老山街道玉泉西路社区党委书记、居委会主任左东芳说。</p>\r\n<p>石景山区坚持按照规模适度、界定清晰、便于服务、无缝衔接的原则，以每个网格覆盖100&mdash;300户为标准，督促指导155个社区在住宅小区、楼院、平房区等区域划分网格2052个。及时调整社区党组织设置，结合网格划分实际，建立网格党支部1178个，形成&ldquo;区委&mdash;街道党工委&mdash;社区党组织&mdash;网格党支部&rdquo;一贯到底的四级党组织架构。</p>\r\n<p>&ldquo;以前我们是分散在不同楼门单元的社区党员，现在有了网格，党支部建到网格上，党小组设到楼院里，我们就是联系基层群众的主心骨，串起为民服务千条线。&rdquo;鲁谷街道双锦园社区网格党支部书记熊焱说。</p>\r\n<p>按照&ldquo;1+8+N&rdquo;的标准配备网格力量，2052名社区工作者担任网格长、认领&ldquo;责任田&rdquo;，楼门长、片区民警、家庭医生等8类人员担任网格员，积极发动在职党员、&ldquo;老街坊&rdquo;志愿者、基层行政执法力量等入网入格、发挥作用，目前已组建1.3万余人的网格员队伍。网格划分后，各社区通过设立公示牌、发放联系卡等方式，公布网格基本信息以及网格长、网格员联系方式，让居民看得到网、找得到人。</p>\r\n<p>强化数智赋能</p>\r\n<p><strong>夯实基层治理硬支撑</strong></p>\r\n<p>8月4日，北京市发布暴雨红色预警。因辖区内平房区地处永定河畔低洼易涝区域，广宁街道麻峪社区、麻峪北社区需要开展群众转移工作。社区依托&ldquo;石网E通&rdquo;中的基础信息模块，及时生成重点人员台账，网格长纷纷到自己的网格中逐门逐户开展走访，并依托网格微信群及时发布预警信息、避险安置点位置、物资领取方式、应急联系人等注意事项，片区民警、物业负责人、志愿者等在群里随时做好解答工作，最终成功转移安置居民1400余人，以实际行动守护居民的生命财产安全。</p>\r\n<p>&ldquo;以前我们人口信息都是纸质台账，查找、更新都得回办公室翻台账。现在有了&lsquo;石网E通&rsquo;，走访后在手机上操作就可以直接更新完善，查看居民信息更加方便。&rdquo;古城街道建兴街社区第十网格网格长梁远兰介绍说。</p>\r\n<p>石景山区聚焦当前基层治理中存在的基础信息更新不及时、数字化水平不够高等问题，在京办平台上线&ldquo;石网E通&rdquo;端口，设置基础信息管理、事件上报、诉求统计、民情日志等功能模块，实现基础信息实时录入、政务服务随时查询、相关报表一键生成、民生诉求实时分析。目前，已收集基础信息62万余条、记录民情日志19万余篇。</p>\r\n<p>同时，整合社区各类微信工作群成网格微信群，网格长和网格员全部入群并做好信息发布、问题解答、协商议事等工作，将网格微信群打造成为政策解读的&ldquo;传声筒&rdquo;、民生问题的&ldquo;减压阀&rdquo;和邻里议事的&ldquo;召集人&rdquo;。</p>\r\n<p>健全工作机制</p>\r\n<p><strong>筑牢主动治理&ldquo;桥头堡&rdquo;</strong></p>\r\n<p>2024年底的一个周末，苹果园街道下庄社区居民王健看到小区地下活动室门口全是美国白蛾，立马打电话给网格长张雅欣。她赶到现场，看到密密麻麻的虫子正在啃食树叶后，立马拿起手机，在&ldquo;石网E通&rdquo;中进行事件上报，街道城建科当天就调来了消杀车辆，物业配合提供喷洒药物，不到24小时，虫患就被彻底清除了。</p>\r\n<p>楼道堆物堆料、房屋漏水、城市家具破损&hellip;&hellip;社区问题虽小，但与居民生活息息相关。石景山区坚持网格事件分级分类办理，对巡查主动发现、居民线上线下反映的事件，小微问题由网格长和网格员就地处置、自办自结；复杂事件由网格长在&ldquo;石网E通&rdquo;中进行上报，街道启动&ldquo;吹哨报到&rdquo;或上报区城管指挥中心派单办理，相关职能部门在规定时间内办结，并及时向社区反馈办理情况，网格长对办理结果进行复核、评价，形成网格信息收集、问题发现、事件处置、结果反馈工作闭环。</p>\r\n<p>压牢压实网格长工作责任，将网格工作开展情况作为社区工作者绩效考核的重要参考，与绩效奖金直接挂钩，社区工作者季度绩效奖金实现优秀、合格档次分级梯度发放。将考核结果作为社区工作者调整岗位等级、续聘解聘、奖励惩戒的重要依据，有效激励督促网格长发挥好&ldquo;前哨探头&rdquo;作用，早发现、早预警、早应对、早处置，进一步履职尽责、担当作为。2025年1&mdash;8月，全区接诉即办诉求同比减少9957件、降幅7.66%，8月降幅更是达到17.14%，切实以网格主动治理推动接诉即办降量增效。</p>'),
(4, '<div>经济发展取得新成效、改革开放迈出新步伐、社会文明程度得到新提高、生态文明建设实现新进步、民生福祉达到新水平、国家治理效能得到新提升&hellip;&hellip;</div>\r\n<div>&ldquo;十四五&rdquo;时期，以习近平同志为核心的党中央团结带领全党全国各族人民勠力同心、踔厉奋发，在以中国式现代化全面推进强国建设、民族复兴伟业的壮阔征程上，用新的伟大奋斗创造出新的历史伟业。</div>\r\n<div>站在又一个五年的时间交汇点，回望&ldquo;十四五&rdquo;，本报记者深入基层采访干部群众，重温总书记的殷殷嘱托，记录各地区各部门在习近平新时代中国特色社会主义思想指引下取得的新成就、发生的新变化。</div>\r\n<div>\r\n<div style=\"text-align: center;\"><strong>经济发展取得新成效</strong></div>\r\n<div style=\"text-align: center;\"><strong>&ldquo;要守牢实体经济这个根基&rdquo;</strong></div>\r\n<div style=\"text-align: left;\"><strong><img src=\"/uploads/20251023/4cf3b5704ffa1116c8897cde074ed890.jpg\" alt=\"\" width=\"100%\" /></strong></div>\r\n<div>深中通道是全球首个集&ldquo;桥、岛、隧、水下互通&rdquo;为一体的跨海集群工程。</div>\r\n<div><img src=\"/uploads/20251023/d95a0f60ad359ff08ba7fca5c1be4db5.jpg\" alt=\"\" width=\"100%\" /></div>\r\n<div>\r\n<div>2025年2月 听取吉林省委和省政府工作汇报</div>\r\n<div>一句话，指明了方向。</div>\r\n<div>&ldquo;要守牢实体经济这个根基，统筹推动传统产业转型、优势产业壮大和新质生产力培育&rdquo;，今年2月，习近平总书记在听取吉林省委和省政府工作汇报时深刻指出。</div>\r\n<div>吉林省吉林市，是一座因工业而兴的城市。&ldquo;一五&rdquo;时期，新中国156个重点项目，7个半落在吉林市。</div>\r\n<div>这里，曾生产出新中国第一袋化肥、第一桶染料、第一炉电石。然而，与其他老工业基地一样，吉林市也因产业结构偏重、竞争力不强等问题，一度面临发展难题。</div>\r\n<div>&ldquo;总书记的这句话，为吉林市发展规划指明方向。&rdquo;吉林市委书记胡斌表示，&ldquo;以实体经济为根基，强化集群培育、精准服务企业、突出创新驱动，吉林市高质量发展稳步向前。&rdquo;</div>\r\n<div>锻长板，巩固优势产业领先地位。</div>\r\n<div>中石油吉林石化启动转型升级项目，总投资339亿元，在166公顷土地上展开&ldquo;炼油向化工、化工向材料、材料向中高端&rdquo;的深度转型。现场办公助企纾困解难，组建工作专班挂图作战，吉林市全力以赴确保项目如期投产。</div>\r\n<div>今年8月，吉林石化转型升级项目核心装置120万吨/年乙烯装置一次开车成功，吉林石化乙烯产能跻身全国先进行列。</div>\r\n<div>促转型，让老树发新芽。</div>\r\n<div>传统产业改造升级，也能发展新质生产力。&ldquo;作为老工业基地，吉林市传统产业比重大，老企业数量多。帮助老企业焕发新生，对吉林市发展十分关键。&rdquo;胡斌说。</div>\r\n<div>吉林建龙钢铁有限责任公司是市里的冶金产业重点企业。近几年，钢铁行业正经历从&ldquo;增量发展&rdquo;向&ldquo;减量发展、存量优化&rdquo;的转变阶段。面对挑战，建龙钢铁如何应对？</div>\r\n<div>组织专家上门会诊、提供智改数转资金支持，帮助寻找数字化转型、智能化升级的突围之路。</div>\r\n<div>步入建龙钢铁生产车间，机器人、无人车等智能装备配合有序，集控大厅实时监测各项数据，企业热轧效率提升17.1%。</div>\r\n<div>育新机，开辟新兴产业。</div>\r\n<div>巩固好存量，吉林市还牢牢扭住自主创新这个&ldquo;牛鼻子&rdquo;，在拓展增量、延伸产业链、提高附加值上下功夫，培育新的增长点。</div>\r\n<div>吉林市着力捋清两张清单：可转化科技成果清单与企业需求清单。召开对接会、线上线下同步接洽，今年以来，吉林市实现科技成果本地转化206项，技术合同成交额同比增长22.9%。</div>\r\n<div>9月底，第一届城市低空交通运输国际会议在吉林市举行。其间，吉林化纤集团的展台备受关注，多家企业前来洽谈碳纤维合作事宜。&ldquo;我们已通过多家低空经济企业碳纤维材料端供应准入，产品市场进一步拓宽。&rdquo;吉林化纤集团党委副书记王宏说。</div>\r\n<div>实体经济是一国经济的立身之本，是财富创造的根本源泉，是国家强盛的重要支柱。&ldquo;十四五&rdquo;以来，我国工业增加值从31.3万亿元增至40.5万亿元。制造业总体规模连续多年全球第一，制造强国建设步履铿锵。</div>\r\n<div>\r\n<div style=\"text-align: center;\"><strong>改革开放迈出新步伐</strong></div>\r\n<div style=\"text-align: center;\"><strong>&ldquo;要把全面深化改革作为推进中国式现代化的根本动力&rdquo;</strong></div>\r\n<div style=\"text-align: center;\"><strong><img src=\"/uploads/20251023/a71bc22df9b686f588f6c38fda52cf5f.jpg\" alt=\"\" width=\"100%\" /></strong></div>\r\n<div style=\"text-align: center;\">海南自由贸易港是我国新时代对外开放的重要门户</div>\r\n<div style=\"text-align: center;\"><img src=\"/uploads/20251023/657ca54b07d5a1e5520942750d4fdc8f.jpg\" alt=\"\" width=\"100%\" /></div>\r\n<div style=\"text-align: left;\">\r\n<div>2023年4月 主持召开二十届中央全面深化改革委员会第一次会议</div>\r\n<div>今年是&ldquo;十四五&rdquo;规划收官之年，也是进一步全面深化改革的重要一年。</div>\r\n<div>2023年4月，习近平总书记主持召开二十届中央全面深化改革委员会第一次会议时强调：&ldquo;实现新时代新征程的目标任务，要把全面深化改革作为推进中国式现代化的根本动力，作为稳大局、应变局、开新局的重要抓手&rdquo;。2024年7月，党的二十届三中全会紧紧围绕推进中国式现代化，擘画进一步全面深化改革战略举措。</div>\r\n<div>&ldquo;十四五&rdquo;时期，习近平总书记在地方考察时，多次就西部陆海新通道建设作出重要指示：&ldquo;要共建西部陆海新通道，实施一批重大交通基础设施项目&rdquo;&ldquo;大力推进西部陆海新通道建设，推动沿线地区开发开放，深度融入共建&lsquo;一带一路&rsquo;&rdquo;&hellip;&hellip;</div>\r\n<div>建设过程中，改革故事不断发生，直指发展堵点难点。</div>\r\n<div>&ldquo;现在通关更方便了。&rdquo;重庆江津区小南垭站，一批新能源汽车&ldquo;乘&rdquo;铁路专列出发，前往广西钦州港，再&ldquo;坐船&rdquo;到埃及。货运代理公司负责人任燕海说，以前，运送一批新能源汽车需要紧急调运大量运载车辆，集齐后再接受查验，成本高、难度大。</div>\r\n<div>改革要奔着问题去。西永海关监控二科科长姚阳介绍，去年，&ldquo;分送集报、一票多车&rdquo;监管模式改革落地，一辆运载车辆可多次运送汽车进出综保区，缓解企业调车难题。</div>\r\n<div>&ldquo;公司的海外业务越来越红火，我们也更加体会到&lsquo;要把全面深化改革作为推进中国式现代化的根本动力&rsquo;这句话的高瞻远瞩。&rdquo;任燕海说。</div>\r\n<div>&ldquo;这批车下了火车很快就能上船。&rdquo;广西中远海运物流有限公司总经理助理印才伟说。钦州港码头与铁路货场曾被围网分隔，随着铁海联运一体化改革推进，隔离围网拆除，集卡运输路线、查验流程优化，每辆集卡运输一趟的成本能节约150元左右。</div>\r\n<div>北部湾港股份有限公司副总经理李凯善说，除了打通物理分隔，虚拟藩篱也加快破除。当地海关、铁路、港口成立铁海联运一体化联合调度中心，及时交换铁路堆场堆存数据和班列发车数据，提升服务效率。</div>\r\n<div>西部陆海新通道开通以来，北部湾港（本港）集装箱吞吐量年均增长22%，通道物流网络覆盖120多个国家和地区。各类要素合理流动、高效聚集，西部陆海新通道日益成为畅通双循环的重要纽带。</div>\r\n<div>物流接力&ldquo;加速跑&rdquo;，背后是改革的决心和行动。一题接着一题解，改革成效不断转化为发展实效。</div>\r\n<div>&ldquo;乘着改革开放的时代大潮阔步前行，中国式现代化必将在改革开放中开辟更加广阔的前景。&rdquo;今日中国，改革由局部探索、破冰突围到系统集成、全面深化，许多领域实现历史性变革、系统性重塑、整体性重构。进一步全面深化改革，坚定不移扩大高水平对外开放，必将为中国式现代化注入更多动力和活力，也将继续为全球经济注入强劲动能</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>'),
(5, '<div>郭嘉昆说，中方持续举办人工智能能力建设研讨班，是落实联合国大会通过的&ldquo;加强人工智能能力建设国际合作&rdquo;决议和《人工智能能力建设普惠计划》的务实举措。研讨班广泛邀请各国政府代表参加，共商促进人工智能普惠发展和全球治理，获得各国代表高度赞赏，彰显了中方言必信、行必果的大国担当。</div>\r\n<div>郭嘉昆表示，中方愿以举办研讨班为契机，与各方深入交流研讨，让包括人工智能技术在内的现代化成果惠及各国民众，以中国式现代化的新成就为世界发展提供新机遇。</div>'),
(6, '<p><img src=\"/uploads/20251023/5768c8d85b01385abc4ea82f21ad66b5.jpg\" alt=\"\" width=\"100%\" /></p>\r\n<p>10月20日，嘉宾在国际调解院开业仪式上合影。</p>\r\n<p>新华社香港10月20日电（记者王昕怡）总部设在中国香港的国际调解院20日举行开业仪式，《关于建立国际调解院的公约》缔约国、签署国代表及香港特别行政区各界人士近200人出席仪式。</p>\r\n<p>&emsp;&emsp;中国外交部副部长华春莹致辞表示，短短5个月内，国际调解院实现了公约签署、生效和开业运营，速度之快在国际组织建设史上十分罕见，充分表明国际调解院顺应时代潮流，受到国际社会的广泛支持。</p>\r\n<p>&emsp;&emsp;她指出，国际调解院理念与全球治理倡议高度契合，将为构建人类命运共同体注入法治正能量，也将助力香港打造&ldquo;调解之都&rdquo;。她欢迎更多国家积极加入，充分利用国际调解院为和平解决国际争端作出新贡献。</p>\r\n<p>&emsp;&emsp;国际调解院秘书长郑若骅致辞指出，国际调解院珍视并践行多边主义，致力于成为和平解决国际争端领域的全球公共产品和重要支柱。国际调解院旨在为国家间争议、国际投资争议以及国际商事争议提供调解服务。</p>\r\n<p>&emsp;&emsp;香港特区行政长官李家超致辞表示，很荣幸香港能成为国际调解院总部的所在地。香港享有&ldquo;背靠祖国、联通世界&rdquo;的优势，同时秉持着悠久的法治传统。香港将进一步发挥&ldquo;超级联系人&rdquo;与&ldquo;超级增值人&rdquo;角色，支持国际调解院和争端解决事业发展。</p>\r\n<p>&emsp;&emsp;尼加拉瓜、委内瑞拉、刚果（布）、基里巴斯、巴基斯坦、肯尼亚、多米尼克等缔约国代表致辞指出，国际调解院的成立践行了《联合国宪章》宗旨和原则，将填补国际调解领域机制的空白，是为完善全球治理提供的重要法治公共产品。他们高度评价国际调解院的重要意义，期待以此为平台，推动和平解决国际争端，为构建更加公正合理的国际秩序贡献力量。</p>\r\n<p>&emsp;&emsp;《关于建立国际调解院的公约》签署仪式于2025年5月30日举行，公约于2025年8月29日正式生效。截至目前，签署国总数达37个。已有中国、尼加拉瓜、委内瑞拉、刚果（布）、基里巴斯、巴基斯坦、肯尼亚、多米尼克8个国家批准公约。</p>\r\n<p>&emsp;&emsp;国际调解院总部大楼前身为香港特别行政区历史建筑旧湾仔警署。总部配备了先进的会议室与讨论室，用于开展调解工作与能力建设。</p>'),
(7, '<p>近日，习近平总书记电贺郑丽文当选中国国民党主席，期望两党坚持共同政治基础，团结广大台湾同胞，增强做中国人的志气、骨气、底气，深化交流合作，促进共同发展，推进国家统一，坚定守护中华民族共同家园，守护两岸同胞根本利益，携手开创中华民族更加美好的未来。习近平总书记这一殷切期望，既是对两岸关系正确发展方向的科学指引，更是对全体中华儿女凝聚民族力量、共创民族复兴伟业的召唤。今天，<strong>党建网</strong>梳理了习近平总书记的部分相关重要论述，与您一同学习领会。</p>\r\n<p><strong>两岸同胞一路走来，始终一脉相承、心手相连、守望相助</strong></p>\r\n<p>明天的中国，力量源于团结。中国这么大，不同人会有不同诉求，对同一件事也会有不同看法，这很正常，要通过沟通协商凝聚共识。<span lang=\"EN-US\">14</span>亿多中国人心往一处想、劲往一处使，同舟共济、众志成城，就没有干不成的事、迈不过的坎。海峡两岸一家亲。衷心希望两岸同胞相向而行、携手并进，共创中华民族绵长福祉。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2022</span>年<span lang=\"EN-US\">12</span>月<span lang=\"EN-US\">31</span>日，习近平发表二〇二三年新年贺词</p>\r\n<p>两岸同胞都是中国人，没有什么心结不能化解，没有什么问题不能商量，没有什么势力能把我们分开。海峡的距离，阻隔不断两岸同胞的骨肉亲情。制度的不同，改变不了两岸同属一个国家、一个民族的客观事实。外部的干涉，阻挡不了家国团圆的历史大势。两岸同胞一路走来，始终一脉相承、心手相连、守望相助。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2024</span>年<span lang=\"EN-US\">4</span>月<span lang=\"EN-US\">10</span>日，习近平会见马英九一行</p>\r\n<p>两岸同胞一家亲，谁也无法割断我们的血脉亲情，谁也不能阻挡祖国统一的历史大势！</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2024</span>年<span lang=\"EN-US\">12</span>月<span lang=\"EN-US\">31</span>日，习近平发表二〇二五年新年贺词</p>\r\n<p><strong>实现祖国完全统一，是海内外中华儿女的共同心愿</strong></p>\r\n<p>解决台湾问题、实现祖国完全统一，是中国共产党矢志不渝的历史任务，是全体中华儿女的共同愿望。要坚持一个中国原则和&ldquo;九二共识&rdquo;，推进祖国和平统一进程。包括两岸同胞在内的所有中华儿女，要和衷共济、团结向前，坚决粉碎任何&ldquo;台独&rdquo;图谋，共创民族复兴美好未来。任何人都不要低估中国人民捍卫国家主权和领土完整的坚强决心、坚定意志、强大能力！</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2021</span>年<span lang=\"EN-US\">7</span>月<span lang=\"EN-US\">1</span>日，习近平在庆祝中国共产党成立<span lang=\"EN-US\">100</span>周年大会上的讲话</p>\r\n<p>实现祖国完全统一是大势所趋、大义所在、民心所向，祖国必须统一，也必然统一。我们要坚持贯彻新时代党解决台湾问题的总体方略，坚持一个中国原则和&ldquo;九二共识&rdquo;，深化两岸各领域融合发展，推动两岸关系和平发展。中国人民有坚定的意志、充分的信心、足够的能力，坚决防止任何人以任何方式把台湾从中国分裂出去。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2023</span>年<span lang=\"EN-US\">12</span>月<span lang=\"EN-US\">26</span>日，习近平在纪念毛泽东同志诞辰<span lang=\"EN-US\">130</span>周年座谈会上的讲话</p>\r\n<p>台湾是中国的神圣领土，两岸人民血脉相连、血浓于水。我们要坚持一个中国原则和&ldquo;九二共识&rdquo;，深化两岸经济文化交流合作，促进两岸同胞心灵契合，坚决反对&ldquo;台独&rdquo;分裂活动。实现祖国完全统一，是海内外中华儿女的共同心愿，是大势所趋、大义所在、民心所向，历史的车轮谁都无法阻挡！</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2024</span>年<span lang=\"EN-US\">9</span>月<span lang=\"EN-US\">30</span>日，习近平在庆祝中华人民共和国成立<span lang=\"EN-US\">75</span>周年招待会上的讲话</p>\r\n<p><strong>民族复兴的历史车轮滚滚向前，需要两岸同胞同心共创、接续奋斗</strong></p>\r\n<p>实现中华民族伟大复兴是全体中华儿女的共同夙愿。两岸青年生逢其时，施展才干的舞台无比广阔，实现梦想的前景无比光明。我们欢迎台湾青年来大陆追梦、筑梦、圆梦。希望两岸青年把握历史大势，坚守民族大义，维护国家统一，勇担时代重任，坚定走两岸关系和平发展正确道路，把两岸关系发展的前途命运牢牢掌握在两岸中国人手中。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2023</span>年<span lang=\"EN-US\">9</span>月<span lang=\"EN-US\">15</span>日，习近平向第六届海峡两岸青年发展论坛致贺信</p>\r\n<p>实现中华民族伟大复兴为两岸经济合作开辟广阔空间，实现中华民族伟大复兴需要两岸同胞共同奋斗。我们将继续致力于促进两岸经济交流合作，深化两岸各领域融合发展，完善增进台湾同胞福祉的制度和政策，助力台胞台企融入新发展格局、实现高质量发展。希望两岸企业家秉持民族大义，把握历史大势，勇担时代责任，共同推动两岸关系和平发展、融合发展，共同创造祖国统一、民族复兴的历史伟业！</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2023</span>年<span lang=\"EN-US\">11</span>月<span lang=\"EN-US\">14</span>日，习近平向<span lang=\"EN-US\">2023</span>两岸企业家峰会<span lang=\"EN-US\">10</span>周年年会致贺信</p>\r\n<p>经过百年奋斗，我们成功走出了一条中国式现代化道路，迎来了民族复兴的光明前景，不仅实现了孙中山先生当年描绘的蓝图，而且创造了许多远远超出孙中山先生设想的成就。民族复兴的历史车轮滚滚向前，凝结着两岸同胞的奋斗和汗水，需要两岸同胞同心共创、接续奋斗，也终将在两岸同胞的接力奋斗中实现。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2024</span>年<span lang=\"EN-US\">4</span>月<span lang=\"EN-US\">10</span>日，习近平会见马英九一行</p>'),
(8, '<p>习近平总书记在庆祝中华人民共和国成立<span lang=\"EN-US\">76</span>周年招待会上指出：&ldquo;前不久，我们隆重纪念中国人民抗日战争暨世界反法西斯战争胜利<span lang=\"EN-US\">80</span>周年，极大振奋了民族精神、激发了爱国热情、凝聚了奋斗力量。&rdquo;爱国，是人世间最深层、最持久的情感。党的十八大以来，习近平总书记多次在不同场合强调爱国的重要性、要求弘扬爱国主义精神，强调要在厚植爱国主义情怀上下功夫。今天，<strong>党建网</strong>梳理了习近平总书记的部分相关重要论述，与您一同学习领会。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>爱国主义自古以来就流淌在中华民族血脉之中，去不掉，打不破，灭不了</strong></p>\r\n<p>《复兴之路》这个展览，回顾了中华民族的昨天，展示了中华民族的今天，宣示了中华民族的明天，给人以深刻教育和启示。中华民族的昨天，可以说是&ldquo;雄关漫道真如铁&rdquo;。近代以后，中华民族遭受的苦难之重、付出的牺牲之大，在世界历史上都是罕见的。但是，中国人民从不屈服，不断奋起抗争，终于掌握了自己的命运，开始了建设自己国家的伟大进程，充分展示了以爱国主义为核心的伟大民族精神。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2012</span>年<span lang=\"EN-US\">11</span>月<span lang=\"EN-US\">29</span>日，习近平在参观《复兴之路》展览时的讲话</p>\r\n<p>&nbsp;</p>\r\n<p>实现中国梦必须弘扬中国精神。这就是以爱国主义为核心的民族精神，以改革创新为核心的时代精神。这种精神是凝心聚力的兴国之魂、强国之魂。爱国主义始终是把中华民族坚强团结在一起的精神力量，改革创新始终是鞭策我们在改革开放中与时俱进的精神力量。全国各族人民一定要弘扬伟大的民族精神和时代精神，不断增强团结一心的精神纽带、自强不息的精神动力，永远朝气蓬勃迈向未来。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2013</span>年<span lang=\"EN-US\">3</span>月<span lang=\"EN-US\">17</span>日，习近平在第十二届全国人民代表大会第一次会议上的讲话</p>\r\n<p>&nbsp;</p>\r\n<p>历史深刻表明，爱国主义自古以来就流淌在中华民族血脉之中，去不掉，打不破，灭不了，是中国人民和中华民族维护民族独立和民族尊严的强大精神动力，只要高举爱国主义的伟大旗帜，中国人民和中华民族就能在改造中国、改造世界的拼搏中迸发出排山倒海的历史伟力！</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2019</span>年<span lang=\"EN-US\">4</span>月<span lang=\"EN-US\">30</span>日，习近平在纪念五四运动<span lang=\"EN-US\">100</span>周年大会上的讲话</p>\r\n<p>&nbsp;</p>\r\n<p><strong>爱国主义是我们民族精神的核心，是中华民族团结奋斗、自强不息的精神纽带</strong></p>\r\n<p>爱国主义是中华民族精神的核心。爱国主义精神深深植根于中华民族心中，是中华民族的精神基因，维系着华夏大地上各个民族的团结统一，激励着一代又一代中华儿女为祖国发展繁荣而不懈奋斗。<span lang=\"EN-US\">5000</span>多年来，中华民族之所以能够经受住无数难以想象的风险和考验，始终保持旺盛生命力，生生不息，薪火相传，同中华民族有深厚持久的爱国主义传统是密不可分的。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2015</span>年<span lang=\"EN-US\">12</span>月<span lang=\"EN-US\">30</span>日，习近平在十八届中央政治局第二十九次集体学习时的讲话</p>\r\n<p>&nbsp;</p>\r\n<p>爱国主义是我们民族精神的核心，是中华民族团结奋斗、自强不息的精神纽带。五四运动时，面对国家和民族生死存亡，一批爱国青年挺身而出，全国民众奋起抗争，誓言&ldquo;国土不可断送、人民不可低头&rdquo;，奏响了浩气长存的爱国主义壮歌。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2019</span>年<span lang=\"EN-US\">4</span>月<span lang=\"EN-US\">30</span>日，习近平在纪念五四运动<span lang=\"EN-US\">100</span>周年大会上的讲话</p>\r\n<p>&nbsp;</p>\r\n<p>中国人民抗日战争胜利是以爱国主义为核心的民族精神的伟大胜利。爱国主义是我们民族精神的核心，是中国人民和中华民族同心同德、自强不息的精神纽带。面对国家和民族生死存亡，全体中华儿女同仇敌忾、众志成城，奏响了气吞山河的爱国主义壮歌。爱国主义是激励中国人民维护民族独立和民族尊严、在历史洪流中奋勇向前的强大精神动力，是驱动中华民族这艘航船乘风破浪、奋勇前行的强劲引擎，是引领中国人民和中华民族迸发排山倒海的历史伟力、战胜前进道路上一切艰难险阻的壮丽旗帜！</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2020</span>年<span lang=\"EN-US\">9</span>月<span lang=\"EN-US\">3</span>日，习近平在纪念中国人民抗日战争暨世界反法西斯战争胜利<span lang=\"EN-US\">75</span>周年座谈会上的讲话</p>\r\n<p>&nbsp;</p>\r\n<p><strong>大力弘扬爱国主义精神，推动中华民族伟大复兴的航船乘风破浪、扬帆远航</strong></p>\r\n<p>弘扬爱国主义精神，必须把爱国主义教育作为永恒主题。要把爱国主义教育贯穿国民教育和精神文明建设全过程。要深化爱国主义教育研究和爱国主义精神阐释，不断丰富教育内容、创新教育载体、增强教育效果。要充分利用我国改革发展的伟大成就、重大历史事件纪念活动、爱国主义教育基地、中华民族传统节庆、国家公祭仪式等来增强人民的爱国主义情怀和意识，运用艺术形式和新媒体，以理服人、以文化人、以情感人，生动传播爱国主义精神，唱响爱国主义主旋律，让爱国主义成为每一个中国人的坚定信念和精神依靠。要结合弘扬和践行社会主义核心价值观，在广大青少年中开展深入、持久、生动的爱国主义宣传教育，让爱国主义精神在广大青少年心中牢牢扎根，让广大青少年培养爱国之情、砥砺强国之志、实践报国之行，让爱国主义精神代代相传、发扬光大。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2015</span>年<span lang=\"EN-US\">12</span>月<span lang=\"EN-US\">30</span>日，习近平在十八届中央政治局第二十九次集体学习时的讲话</p>\r\n<p>&nbsp;</p>\r\n<p>爱国主义是具体的、现实的。在当代中国，弘扬爱国主义就必须深刻认识到，中国共产党领导和中国社会主义制度必须长期坚持，不可动摇；中国共产党领导中国人民开辟的中国特色社会主义必须长期坚持，不可动摇；中国共产党和中国人民扎根中国大地、借鉴人类文明优秀成果、独立自主实现国家发展的大政方针必须长期坚持，不可动摇。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2016</span>年<span lang=\"EN-US\">11</span>月<span lang=\"EN-US\">11</span>日，习近平在纪念孙中山先生诞辰<span lang=\"EN-US\">150</span>周年大会上的讲话</p>\r\n<p>&nbsp;</p>\r\n<p>在新的征程上，我们要高举团结的旗帜，紧密团结在党中央周围，巩固全国各族人民的大团结，加强海内外中华儿女的大团结，增强各党派、各团体、各民族、各阶层以及各方面的大团结，保持党同人民群众的血肉联系，大力弘扬爱国主义精神，凝聚成一往无前的力量，推动中华民族伟大复兴的航船乘风破浪、扬帆远航。</p>\r\n<p>&mdash;&mdash;<span lang=\"EN-US\">2019</span>年<span lang=\"EN-US\">9</span>月<span lang=\"EN-US\">30</span>日，习近平在庆祝中华人民共和国成立<span lang=\"EN-US\">70</span>周年招待会上的讲话</p>'),
(9, '<div>习近平总书记近期就作风建设作出重要指示，强调锲而不舍落实中央八项规定精神，推进作风建设常态化长效化。制定实施中央八项规定，体现了以习近平同志为核心的党中央深邃高远的政治考量、清醒坚定的惕厉自醒，彰显了中国共产党人&ldquo;打铁必须自身硬&rdquo;的底气、坚定不移推进全面从严治党的决心。新时代以来，以习近平同志为核心的党中央从制定和落实中央八项规定开局破题，以钉钉子精神纠治&ldquo;四风&rdquo;，刹住了一些长期没有刹住的歪风，纠治了一些多年未除的顽瘴痼疾，推动全面从严治党向纵深发展，开辟以伟大自我革命引领伟大社会革命新境界，在党的建设史上具有重要里程碑意义。作风建设永远在路上，我们要把贯彻落实中央八项规定这项新时代管党治党的标志性措施锲而不舍坚持下去，推进作风建设常态化长效化，把新时代管党治党的&ldquo;金色名片&rdquo;擦得更亮，着力打造一支党性纯洁的队伍、纪律严明的队伍，使我们党始终不负人民，团结带领人民在中国式现代化道路上行稳致远。</div>\r\n<div><strong>深入学习贯彻习近平总书记关于加强党的作风建设的重要论述</strong></div>\r\n<div>深入贯彻中央八项规定精神之所以能够取得显著成效，根本在于有习近平总书记领航掌舵，有习近平新时代中国特色社会主义思想科学指引。党的十八大以来，习近平总书记围绕深入贯彻中央八项规定精神、加强党的作风建设发表一系列重要论述，提出一系列新思想新观点新论断，深刻回答了新形势下作风建设抓什么、怎么抓的重大问题，深刻阐明了为什么要制定、如何看待、怎样贯彻中央八项规定的重大问题，为深入贯彻中央八项规定精神、加强新时代党的作风建设提供了根本遵循。</div>\r\n<div>深刻阐明了加强党的作风建设的重要性紧迫性。习近平总书记指出，党的作风就是党的形象，关系人心向背，关系党的生死存亡；风险越大、挑战越多、任务越重，越要加强党的作风建设，以好的作风振奋精神、激发斗志、树立形象、赢得民心；自我革命是我们党跳出治乱兴衰历史周期率的第二个答案，从抓作风入手推进全面从严治党是新时代党的自我革命一条重要经验，等等。这些重要论述，深刻揭示了新时代加强党的作风建设的重大意义，是对新时代我们党为什么加强作风建设重大理论和实践问题的科学回答。</div>\r\n<div>深刻阐明了加强党的作风建设的本质要求。习近平总书记指出，作风问题根本上是党性问题；作风反映的是形象和素质，体现的是党性，起决定作用的也是党性；党性、党风、党纪是有机整体，党性是根本，党风是表现，党纪是保障；对我们共产党人来讲，能不能解决好作风问题，是衡量对马克思主义信仰、对社会主义和共产主义信念、对党和人民忠诚的一把十分重要的尺子，等等。这些重要论述，充分体现了党要管党、全面从严治党的根本要求，体现了我们党的性质宗旨、初心使命。</div>\r\n<div>深刻阐明了加强党的作风建设的关键点着力点。习近平总书记指出，加强作风建设必须紧扣保持党同人民群众血肉联系这个关键；作风问题核心是党同人民群众的关系问题；江山就是人民、人民就是江山，打江山、守江山，守的是人民的心；在任何时候任何情况下，与人民同呼吸共命运的立场不能变，全心全意为人民服务的宗旨不能忘，群众是真正英雄的历史唯物主义观点不能丢，等等。这些重要论述，彰显了我们党赤诚的为民情怀和以人民为中心的崇高价值追求。</div>\r\n<div>深刻阐明了加强党的作风建设的实践路径。习近平总书记指出，中央八项规定是改进作风的切入口和动员令；是长期有效的铁规矩、硬杠杠；必须坚持从严治党，落实管党治党责任，把作风建设要求融入党的思想建设、组织建设、反腐倡廉建设、制度建设之中，全面提高党的建设工作水平；必须把正风肃纪反腐结合起来一起抓，始终坚持严的基调、严的措施、严的氛围，以优良作风作引领，以严明纪律强保障，以反腐惩恶清障碍，推动党的自我革命环环相扣、层层递进，不断在革故鼎新、守正创新中实现自身跨越，等等。这些重要论述，深化拓展了推进党的自我革命、永葆党的先进性和纯洁性的具体举措，创新发展了破除作风问题怪圈、形成常态长效的有力抓手，为不断取得作风建设新成效提供了方向指引。</div>\r\n<div>深刻阐明了加强党的作风建设的科学方法。习近平总书记指出，领导机关是国家治理体系中的重要机关，领导干部是党和国家事业发展的&ldquo;关键少数&rdquo;，对全党全社会都具有风向标作用；中央八项规定堤坝是好不容易筑起的，一定要倍加珍惜，不断巡堤检修、培土加固；要鼓励基层大胆探索实践，努力取得有利于从根本上解决问题、形成长效化体制机制的创新成果，等等。这些重要论述，揭示了加强党的作风建设的方法论，使党的作风建设思路举措更加科学、更加严密、更加有效。</div>\r\n<div><strong>坚持好运用好深入贯彻中央八项规定精神的经验做法</strong></div>\r\n<div>中央八项规定带来的变化是全方位的，不仅使党的作风焕然一新，更是推动了当代中国在政治、经济、社会、文化和国家治理等方面发生巨大变化；中央八项规定带来的变化是深刻的，不仅荡涤了看得见的歪风，更是带动了思想观念之变、政治生态之变、社会风气之变；中央八项规定带来的变化是深远的，不只是解决了当下的具体问题，更是厚植了党长期执政的根基、凝聚了奋进前行的力量。要坚持好、运用好深入贯彻中央八项规定精神的经验做法，以优良作风凝心聚力，不断开创中国式现代化建设新局面。</div>\r\n<div>坚持好运用好固本培元、以学正风的成功经验。信念是本，作风是形，本正而形聚，本不正则形必散。坚定理想信念，持续改进作风，思想教育是根本。习近平总书记指出，&ldquo;党的历次集中教育活动，都以思想教育打头，着力解决学习不深入、思想不统一、行动跟不上的问题，既绵绵用力又集中发力，推动全党思想上统一、政治上团结、行动上一致。&rdquo;新时代以来，包括深入贯彻中央八项规定精神学习教育在内的历次党内集中教育，都把坚定理想信念作为重要内容，牢牢抓住思想教育这个根本，教育引导党员干部筑牢信仰之基、补足精神之钙、把稳思想之舵，为作风建设打下坚实思想基础。锲而不舍落实中央八项规定精神，必须坚持经常性教育和集中性教育相结合，教育引导广大党员干部学深悟透习近平新时代中国特色社会主义思想，以坚强党性固本培元，以优良党风激浊扬清，以严明党纪整饬作风。</div>\r\n<div>坚持好运用好以上率下、示范带动的成功经验。行动为令，身教为镜。作风建设，重在引领，形成&ldquo;头雁效应&rdquo;。习近平总书记指出，&ldquo;党风廉政建设，关键在领导干部&rdquo;&ldquo;要求别人做到的，自己首先要做到；要求别人不做的，自己首先不做。&rdquo;党的十八大以来，习近平总书记坚持最严要求，把改进作风、密切联系群众体现在治国理政的各方面，把勤俭节约、务求实效贯穿国内考察和国外出访活动全过程，以身教作示范，以行动发号令，为全党树立了标杆、作出了表率。锲而不舍落实中央八项规定精神，各级领导干部要向党中央看齐，坚持带头做、带头抓，以&ldquo;关键少数&rdquo;示范带动&ldquo;绝大多数&rdquo;，坚定不移把作风建设的各项要求落到实处。</div>\r\n<div>坚持好运用好系统治理、标本兼治的成功经验。善除害者察其本，善理疾者绝其源。中央八项规定这张新时代共产党人作风建设的&ldquo;金色名片&rdquo;之所以越擦越亮，就是因为精准把握了&ldquo;标&rdquo;与&ldquo;本&rdquo;、&ldquo;破&rdquo;与&ldquo;立&rdquo;、&ldquo;点&rdquo;与&ldquo;面&rdquo;的辩证关系，既以小切口撬动大变局，又注重建章立制，从体制机制上堵塞漏洞；既紧紧抓住遏制&ldquo;舌尖上的浪费&rdquo;&ldquo;车轮上的腐败&rdquo;&ldquo;会所里的歪风&rdquo;等具体问题，又坚持正风肃纪反腐相贯通；既以雷霆之势&ldquo;治标&rdquo;，形成强大震慑，又以固本之策&ldquo;治本&rdquo;，不断拧紧党员干部世界观、人生观、价值观的&ldquo;总开关&rdquo;，从思想根源上消除&ldquo;四风&rdquo;问题的诱因。锲而不舍落实中央八项规定精神，要坚持用改革精神和严的标准管党治党，坚持思想建党和制度治党同向发力，全方位扎紧制度笼子，增强制度权威性和执行力，推进党的作风建设常态化长效化。</div>\r\n<div>坚持好运用好一以贯之、抓常抓细抓长的成功经验。习近平总书记指出，制定实施中央八项规定，是我们党在新时代的徙木立信之举，必须常抓不懈、久久为功，十年不够就二十年，二十年不够就三十年，直至真正化风成俗，以优良党风引领社风民风。自中央八项规定出台以来，我们党始终保持对作风问题的高压态势，一个节点一个节点坚守，一年接着一年抓。从抓月饼、贺卡、土特产品等具体问题入手，到整治&ldquo;四风&rdquo;问题的各种变异表现，持续发力、久久为功，不断巩固和拓展作风建设成效。一些党员干部群众曾经存在&ldquo;一阵风&rdquo;的忧虑、&ldquo;走着看&rdquo;的心态，时间和实践已经给出了答案。锲而不舍落实中央八项规定精神，必须拿出恒心和韧劲，牢固树立经常抓、深入抓、持久抓的思想观念，在常和长、严和实、深和细上下功夫，管出习惯、抓出成效。</div>\r\n<div>坚持好运用好明确责任、动真碰硬的成功经验。习近平总书记指出，规矩是起约束作用的，所以要紧一点。规定就是规定，不加&ldquo;试行&rdquo;两字，就是要表明一个坚决的态度，表明这个规定是刚性的。既然作规定，就要朝严一点的标准去努力，就要来真格的。深入贯彻中央八项规定精神，靠的是紧紧扭住责任制这个&ldquo;牛鼻子&rdquo;。党的十八大以来，全国共查处&ldquo;四风&rdquo;问题116.7万起、处分108.1万人，有力遏制了歪风邪气。放眼全世界，没有哪个国家和政党，能有这样的政治气魄和历史担当，敢于大刀阔斧、刀刃向内、自我革命。锲而不舍落实中央八项规定精神，必须牢记加强作风建设是全党的共同责任，&ldquo;马不离鞍、缰不松手&rdquo;，推动责任主体到位、责任要求到位、考核问责到位。</div>\r\n<div><strong>着力打造一支党性纯洁的队伍、纪律严明的队伍</strong></div>\r\n<div>遵道而行，但到半途须努力；会心不远，要登绝顶莫辞劳。习近平总书记指出，&ldquo;要持续抓好中央八项规定精神贯彻落实，进一步下大气力把党建设好，打造一支党性纯洁的队伍、纪律严明的队伍。&rdquo;新时代新征程，广大党员干部要牢记习近平总书记的殷殷嘱托，以优良作风凝心聚力、干事创业，让清风正气浩荡充盈、生生不息，确保我们党始终团结带领人民顺利完成所肩负的历史使命。</div>\r\n<div>推动党员干部把党的创新理论转化为改造主观世界和客观世界的强大思想武器。《菜根谭》里有句话：&ldquo;操存要有真宰&rdquo;，讲的就是要把住内心深处的&ldquo;总开关&rdquo;。习近平新时代中国特色社会主义思想的世界观、方法论和贯穿其中的立场观点方法，不仅致力于科学地解释世界，而且致力于积极地改造世界；不仅指导我们改造客观世界，同时也指导我们改造主观世界。锲而不舍贯彻落实中央八项规定精神，要自觉用习近平新时代中国特色社会主义思想武装头脑，不断在思想上进行检视、剖析、反思，对作风问题进行对照、查摆、整治，为中央八项规定精神落地生根打下坚实思想基础。</div>\r\n<div>持续纠治作风顽疾、提高发现和解决作风问题的穿透力有效性。&ldquo;逆水行舟，一篙不可放缓；滴水穿石，一滴不可弃滞。&rdquo;习近平总书记在贵州、云南考察时，在讲到中央八项规定成效的同时深刻指出，&ldquo;要看到，有一些地方发生了松动，有一些方面还存在盲区死角，一些不良风气出现了反弹回潮。钉钉子嘛，再钉几下，久久为功，化风为俗。&rdquo;锲而不舍贯彻落实中央八项规定精神，必须始终坚持零容忍，不降低标准、不放松要求、不减少措施，重点纠正形式主义、官僚主义问题，坚决反对特权思想、特权现象；聚焦&ldquo;关键少数&rdquo;和重点领域，善于从群众反映的&ldquo;小事小节&rdquo;中洞察作风问题的蛛丝马迹，抓具体、补短板、防反弹；始终保持高压态势、深化源头防治，不断把作风建设引向深入。</div>\r\n<div>抓好严肃党内政治生活这个全面从严治党的基础。习近平总书记指出，&ldquo;党要管党，首先要从党内政治生活管起；从严治党，首先要从党内政治生活严起。&rdquo;党内政治生活是党员干部进行党性锻炼的主要平台，有什么样的党内政治生活，就有什么样的党员干部作风。一个班子强不强、有没有战斗力，同有没有严肃认真的党内政治生活密切相关；一个领导干部强不强、威信高不高，也同是否经过严肃认真的党内政治生活锻炼密切相关。锲而不舍贯彻落实中央八项规定精神，必须促使各级党组织和全体党员干部都按照党内政治生活准则和党的各项规定办事，破&ldquo;潜规则&rdquo;，立&ldquo;明规矩&rdquo;，坚决防止搞&ldquo;小圈子&rdquo;&ldquo;拜码头&rdquo;&ldquo;搭天线&rdquo;，涵养积极健康的党内政治文化，营造风清气正的政治生态。</div>\r\n<div>健全经常性全方位考察干部的制度机制。&ldquo;治本在得人，得人在审举，审举在核真。&rdquo;习近平总书记在二十届中共中央政治局第二十一次集体学习时强调，&ldquo;坚持从抓作风入手推进全面从严治党，把新时代党的自我革命要求进一步落实到位。&rdquo;&ldquo;选人用人要加强党性鉴别，注重考察干部的境界格局和忠诚度廉洁度。&rdquo;锲而不舍贯彻落实中央八项规定精神，要加强对干部动态性、持续性、系统性、全面性考察，既在日常工作中观察干部的政治表现和思想境界，又在急难险重任务、重大关键时刻考察干部的责任担当和能力格局，实现对党员干部全方位、多角度、立体化评价；要建立日常考核、分类考核、近距离考核的知事识人体系，通过干部调研、列席民主生活会、谈心谈话、工作约谈、督查检查等方式掌握干部在政治上是否过得硬；加强与多个部门的协同联动，综合运用干部监督信息和其他各方面的信息反馈，坚持共性和个性、定性和定量、正向和反向、一贯和一时相结合，对干部&ldquo;八小时内的表现&rdquo;和&ldquo;八小时外的情况&rdquo;、&ldquo;以前怎么样&rdquo;和&ldquo;现在又如何&rdquo;做好系统精准的梳理汇总工作，针对党性修养、境界格局、忠诚度廉洁度进行相互印证、核实甄别、综合研判，切实把各方面情况了解全、掌握准，真正用好干部考察的&ldquo;指挥棒&rdquo;，树立起能者上、优者奖、庸者下、劣者汰的鲜明导向，锻造高素质干部队伍，推动事业高质量发展。</div>\r\n<div>从严监督执纪，加大风腐同查同治力度。习近平总书记强调，&ldquo;坚持正风肃纪反腐相贯通，以&lsquo;同查&rsquo;严惩风腐交织问题，以&lsquo;同治&rsquo;铲除风腐共性根源&rdquo;。风腐问题同根同源、互为表里。古人讲，&ldquo;白袍点墨，终不可湔&rdquo;，墨渍虽微，却能蚀穿白袍经纬；贪念虽小，足以毁掉终身清誉。追溯那些被查处的违纪违法党员干部，他们的蜕变过程，往往是从&ldquo;吃顿饭&rdquo;&ldquo;喝瓶酒&rdquo;&ldquo;收张卡&rdquo;开始，从&ldquo;偶一为之&rdquo;到&ldquo;习以为常&rdquo;，逐步堕向腐败的深渊。锲而不舍贯彻落实中央八项规定精神，要始终坚持问题导向，保持战略定力，发扬彻底的自我革命精神，针对&ldquo;四风&rdquo;问题易发多发岗位和领域，特别是在高压之下仍然顶风违反中央八项规定精神的人和事，深入查找规定执行薄弱点、权力运行风险点、监督管理空白点，科学制定防范举措，持续增强贯彻落实中央八项规定精神的综合效能，为以中国式现代化全面推进强国建设、民族复兴伟业提供坚强作风保障。</div>'),
(10, '<div>勇于自我革命是我们党最鲜明的品格，也是党的事业不断从胜利走向新的胜利的根本保证。在开启全面建设社会主义现代化国家新征程、向第二个百年奋斗目标进军的关键时期，梳理总结党的自我革命实践经验与历史成就，加快构建具有中国特色、中国风格、中国气派的自我革命话语体系，不仅是丰富马克思主义建党学说、深化中国共产党执政规律认识的必然要求，也是巩固党的长期执政地位、向世界讲好中国共产党故事的关键举措。</div>\r\n<div><strong>坚持以习近平总书记关于党的自我革命的重要思想为引领</strong></div>\r\n<div>理论指引方向。党的十八大以来，习近平总书记带领全党以前所未有的政治担当和决心力度推进全面从严治党，创造性提出一系列具有原创性、标志性的新理念新思想新战略，形成了习近平总书记关于党的自我革命的重要思想，为构建中国共产党自我革命话语体系提供了根本遵循。</div>\r\n<div>1945年，毛泽东同志在延安提出破解治乱兴衰历史周期率的第一个答案：&ldquo;让人民来监督政府。&rdquo;习近平总书记在此基础上提出自我革命是我们党跳出治乱兴衰历史周期率的第二个答案。习近平总书记将自我革命提升到前所未有的战略高度，构建中国共产党自我革命话语体系必须牢牢立足这一战略定位，坚持不懈用党的创新理论武装全党，深刻阐释自我革命对于确保党始终成为中国特色社会主义事业坚强领导核心的决定性意义，以高度的政治警醒及时清除侵蚀党的健康肌体的病毒和损害党的执政根基的各种隐患。</div>\r\n<div>习近平总书记关于党的自我革命的重要思想，是一个系统科学、逻辑严密、内涵丰富的理论体系。其理论体系涵盖了&ldquo;自我净化、自我完善、自我革新、自我提高&rdquo;的核心内涵以及&ldquo;九个以&rdquo;的实践要求。现阶段，构建中国共产党自我革命话语体系，必须全面、准确、深入地诠释其核心内容，并挖掘理论来源，梳理历史脉络，阐释现实意义，形成概念清晰、逻辑严密、系统科学的中国共产党自我革命话语体系。</div>\r\n<div>党的十八大以来，以习近平同志为核心的党中央打出自我革命的&ldquo;组合拳&rdquo;，刹住了一些多年未刹住的歪风邪气，解决了许多长期没有解决的顽瘴痼疾，从根本上扭转了管党治党宽松软状况，反腐败斗争取得压倒性胜利并全面巩固。构建中国共产党自我革命话语体系，必须将全面从严治党取得历史性成就系统联系起来，用生动的事实展现自我革命的真理性和实践性，增强自我革命话语的说服力和感染力。</div>\r\n<div><strong>坚持以解决大党独有难题为导向</strong></div>\r\n<div>问题是时代的声音。习近平总书记指出：&ldquo;我们中国共产党人干革命、搞建设、抓改革，从来都是为了解决中国的现实问题。&rdquo;中国共产党始终坚持问题导向，把发现问题、分析问题、解决问题作为自我革命的出发点和落脚点。党的自我革命不是抽象的概念演绎，而是扎根实践、解决问题的主动革命。构建中国共产党自我革命话语体系，必须坚持问题意识，直面现实矛盾，回应时代关切。</div>\r\n<div>话语体系不能回避问题，要准确把握党在新时代面临的问题与挑战。随着全面从严治党走向纵深，党的自我革命不断深入，&ldquo;六个如何始终&rdquo;的大党独有难题依旧摆在前面，新的问题也在不断出现。当前，党面临的执政考验、改革开放考验、市场经济考验、外部环境考验长期存在，精神懈怠危险、能力不足危险、脱离群众危险、消极腐败危险尖锐严峻。从思想层面看，部分党员干部存在理想信念动摇、宗旨意识淡薄等问题；从组织层面看，一些党组织存在软弱涣散、战斗力不强等问题；从作风层面看，形式主义、官僚主义问题尚未得到根本解决，享乐主义、奢靡之风在一定范围内仍然存在。针对这些问题，必须通过构建中国共产党自我革命话语体系，深入分析问题来源与危害，系统总结解决问题的办法与经验，不断丰富和完善中国共产党自我革命话语体系的内容与形式，为指导自我革命实践提供坚实理论支撑。</div>\r\n<div>话语体系构建与实践协同一体推进。通过构建中国共产党自我革命话语体系，加强党的自我革命话语与中国式现代化、共同富裕、乡村振兴等重大实践的协同机制研究，实现自我革命与社会革命的协同推进；深入挖掘基层党建中的党的自我革命话语实践案例，总结基层话语实践的有效模式，提炼可复制、可推广的经验，推动党的自我革命话语在基层落地生根。通过全党上下一心、综合施策、协同发力、锲而不舍、久久为功，积小胜为大胜，在话语体系层面展现出大党优势。</div>\r\n<div><strong>坚持以融合多学科资源为抓手</strong></div>\r\n<div>党的自我革命涉及经济、政治、文化、社会、心理等多个方面，是一项复杂的系统工程。构建中国共产党自我革命话语体系，要打破学科壁垒，整合政治学、历史学、社会学、传播学、语言学、心理学等多学科资源，进行跨学科的融合与创新，形成交叉研究的理论合力。</div>\r\n<div>科学运用政治学的理论与方法。深入分析党的自我革命对于优化政治生态、规范权力运行、提升治理效能、发展全过程人民民主的重大作用。借鉴权力制约与监督、政治发展、政治文化、政党比较等理论资源，增强党的自我革命话语的学理厚度。</div>\r\n<div>充分挖掘和整合历史学资源。系统梳理我们党自我革命的历史，深刻总结其经验与规律，吸取国际共运史上政党建设的教训，深入挖掘中华优秀传统文化中关于自省、修身、革新等思想精髓，并将其与马克思主义理论相结合，彰显自我革命这一理论的文化底蕴和历史传承，为党的自我革命话语体系构建提供借鉴。通过揭示其历史必然性和现实必要性，增强党的自我革命话语的历史深度。</div>\r\n<div>合理借鉴社会学、语言学、传播学、心理学等学科成果。运用社会学理论，采用数据分析、社会调查、案例研究等方法，分析党的自我革命与社会环境的相互作用，精准研判社情民意的变化态势；运用语言学方法，建立党的自我革命话语语料库，对党的重要文献中的自我革命话语进行词频统计、语义分析，揭示党的自我革命话语的演变趋势与核心议题；运用传播学理论，分析传播主体、传播渠道、传播受众的互动关系，研究新媒体环境下话语传播的路径创新；运用心理学方法，了解党员干部的心理需求与特点，采用适合的话语表达方式，增强党的自我革命的说服力和感召力。通过融合多学科资源，使中国共产党自我革命话语体系更加全面、科学，既具有理论指导性，又具有现实针对性，从而更好满足新时代党的自我革命实践的需要。</div>\r\n<div>加快构建中国共产党自我革命话语体系，既是深化马克思主义建党学说的理论命题，也是推进全面从严治党的实践课题。必须坚持以习近平总书记关于党的自我革命的重要思想为根本指引，立足实践，坚持鲜明的问题导向，广泛融合多学科资源，最终形成兼具政治性、实践性和学术性的话语体系，为党的自我革命提供坚实的理论支撑和话语支撑，为世界政党治理贡献中国智慧与中国方案。</div>'),
(11, '<div>习近平总书记指出，&ldquo;十五五&rdquo;时期是基本实现社会主义现代化夯实基础、全面发力的关键时期，要保持战略定力，增强必胜信心，积极识变应变求变，集中力量办好自己的事，在激烈国际竞争中赢得战略主动，推动事关中国式现代化全局的战略任务取得重大突破。中国共产党在治国理政中，不断弘扬和赓续中华优秀传统文化，从1953年制定和实施第一个五年计划开始到2025年完成&ldquo;十四五&rdquo;规划这70多年间，始终牢记初心使命，锚定实现现代化的宏伟目标，坚持一张蓝图绘到底，使我国社会生产力、综合国力、人民生活水平、国际地位发生了历史性的变化，社会主义现代化强国建设蓝图一步步变为现实，中华民族迎来了从站起来、富起来到强起来的伟大飞跃。站在新的历史起点上，中国共产党人和中国人民有信心也有能力，始终保持一张蓝图绘到底的战略定力，以中国式现代化全面推进中华民族伟大复兴。</div>\r\n<div><strong>中国共产党是一个具有高度战略定力的马克思主义执政党</strong></div>\r\n<div>中国共产党具有高度的战略定力。党的十八大以来，习近平总书记反复强调保持战略定力的重要性，倡导发扬钉钉子精神，不折腾、不反复，保持历史耐心，做出经得起实践、人民、历史检验的实绩。钉钉子精神、保持历史耐心，讲的就是战略定力。我们党能够接续不断地编制和实施十四个五年规划，这确实是世所罕见的。能制定如此宏大的战略决策，并且保持一张蓝图绘到底的战略定力，这是由中国共产党的特质所决定的。</div>\r\n<div>中国共产党是马克思主义政党。马克思主义科学地揭示了人类社会发展规律和资本主义发展的大趋势，为无产阶级政党提供了认识世界、改造世界的科学工具。中国共产党坚持把马克思主义基本原理同中国具体实际相结合、同中华优秀传统文化相结合，不断推进马克思主义中国化时代化，不断深化对共产党执政规律、社会主义建设规律、人类社会发展规律的认识。以当代中国马克思主义、21世纪马克思主义这一先进理论为指导，我们党能够站得更高、看得更远，从规律高度整体把握我国发展的历史方位，编制实施经济社会发展规划，制定长远发展战略。</div>\r\n<div>中国共产党具有强烈的历史使命感。为中国人民谋幸福、为中华民族谋复兴，这是中国共产党的初心和使命所在。同时，中国共产党致力于为人类谋进步、为世界谋大同。在党的百余年奋斗历程中，我们党无论取得多么辉煌的成就，无论面临多么险峻的风险，始终坚守初心、不负使命，牢记共产主义远大理想，坚定中国特色社会主义共同理想。初心不改、使命不变、理想不移，是保持一张蓝图绘到底战略定力的强大精神支撑。</div>\r\n<div>中国共产党是长期执政的马克思主义政党。党的执政地位决定了党能够通过各级党组织的力量和体制机制的作用，对改革发展稳定等事关现代化建设的重大事项进行系统规划、作出战略安排，动员人财物各种资源，持续发力、久久为功去实施战略；党能够通过法定程序，把党的主张上升为国家意志，保证党确定的重大方针政策能够始终如一贯彻落实。同时，我国的政党制度是中国共产党领导的多党合作和政治协商制度，中国共产党是执政党，各民主党派是参政党，不存在在野党、反对党，也不存在两党、多党轮流执政。党长期执政的地位决定了，党能够制定和实施长期规划，只要定下来的事，就能够义无反顾地一代人接着一代人干下去，做到一张蓝图绘到底。</div>\r\n<div><strong>&ldquo;十四五&rdquo;时期取得的成就进一步增强了党和人民的战略定力</strong></div>\r\n<div>一张蓝图绘到底的战略定力既源于中国共产党的特质，也来自于党和国家事业接续取得的成就。就&ldquo;十四五&rdquo;时期来看，面对严峻复杂的国内外形势，以习近平同志为核心的党中央表现出高度的战略定力，任凭风浪起，稳坐钓鱼台，采取一系列战略性举措，推进一系列变革性实践，实现一系列突破性进展。</div>\r\n<div>在经济发展方面，&ldquo;十四五&rdquo;时期，我国经济总量连续跨越110万亿元、120万亿元、130万亿元，今年预计可以达到140万亿元左右。在世界经济发展低迷的情况下，我国对世界经济增长的贡献率一直保持在30%左右，成为世界经济增长的主要贡献者。创新驱动能力明显提高，研发经费投入占国内生产总值比重接近2.7%，接近经济合作与发展组织（OECD）国家平均水平，新质生产力发展势头迅猛，绿色发展已经成为我国发展的鲜明底色。我国拥有全球规模最大、门类最齐全、体系最完整的制造体系，产业链供应链韧性和安全水平不断提升。</div>\r\n<div>在民生福祉方面，我国建成了全球规模最大的教育体系、社会保障体系、医疗卫生体系，九年义务教育巩固率和基本养老保险、基本医疗保险参保率都在95%以上。我国高铁运营里程是其他国家总和的2倍，交通出行和快递服务更加高效。人民群众生活质量不断改善和提升，2024年我国人均预期寿命达到79岁。经济发展成果正在转化为人民群众的获得感、幸福感、安全感。</div>\r\n<div>在国家治理方面，国家治理体系和治理能力现代化深入推进，努力构建高水平社会主义市场经济体制，坚持有效市场和有为政府相结合，营商环境越来越好，全国统一大市场&ldquo;四梁八柱&rdquo;基本建立。全面从严治党成效显著，风清气正的政治环境为高质量发展提供了坚强的政治保障。全球发展倡议、全球安全倡议、全球文明倡议、全球治理倡议的提出，为全球治理贡献了中国智慧、中国方案，彰显了中国的大国形象。</div>\r\n<div>&ldquo;十四五&rdquo;时期，党和国家事业取得的伟大成就再次证明我们走的路是对的，制定的方针政策、作出的战略安排是正确的。搞&ldquo;小院高墙&rdquo;&ldquo;脱钩断链&rdquo;不仅阻挡不了中国发展的步伐，反而更加激发了中国人民的道路自信、理论自信、制度自信、文化自信，进一步增强了一张蓝图绘到底的战略定力和决心。</div>\r\n<div><strong>保持战略定力，绘就中国式现代化最美蓝图</strong></div>\r\n<div>进入新时代以来，在党中央的坚强领导下，我们如期全面建成小康社会、实现第一个百年奋斗目标，向第二个百年奋斗目标进军。党的二十大对全面建成社会主义现代化强国作出分两步走的总的战略安排，描绘了到2035年基本实现社会主义现代化、到本世纪中叶建成富强民主文明和谐美丽的社会主义现代化强国的宏伟蓝图。党的二十届三中全会吹响了以进一步全面深化改革开辟中国式现代化广阔前景的时代号角，为推进中国式现代化提供体制机制保障。党的二十届四中全会将研究制定&ldquo;十五五&rdquo;规划建议。可以说，中国式现代化蓝图已经描绘出来，但要把蓝图变为现实，就必须保持一张蓝图绘到底的战略定力，坚持党的全面领导，坚持人民至上，坚持高质量发展，坚持全面深化改革，坚持有效市场和有为政府相结合，坚持统筹发展和安全，扎实做好&ldquo;十五五&rdquo;时期经济社会发展工作，不断开创社会主义现代化建设新局面。</div>\r\n<div>在坚持党的全面领导、坚持人民至上方面始终保持战略定力。办好中国的事情关键在党，党是中国式现代化蓝图的设计者、发起者、执行者。当前，世界百年变局加速演进，中华民族伟大复兴正处于关键时期，一些风险可以预见，还有许多风险难以预见。在这样的背景下，推进中国式现代化，必须坚持党的全面领导，深刻领悟&ldquo;两个确立&rdquo;的决定性意义，增强&ldquo;四个意识&rdquo;、坚定&ldquo;四个自信&rdquo;、做到&ldquo;两个维护&rdquo;。中国式现代化是社会主义性质的现代化，人民是推进中国式现代化的主体力量，也共同享有现代化成果。我国经济社会发展的根本目的在于增进人民福祉、维护人民权益、实现共同富裕、促进人的全面发展和社会全面进步。如果丢掉了人民至上的价值理念，中国式现代化就会失去动力和意义，也就不是社会主义现代化了。</div>\r\n<div>在推进高质量发展上始终保持战略定力。高质量发展是全面建设社会主义现代化国家的首要任务。发展是党执政兴国的第一要务。在全面建设社会主义现代化国家新征程上，人民日益增长的美好生活需要和不平衡不充分的发展之间的矛盾是主要矛盾。解决主要矛盾，必须立足于新发展阶段，完整准确全面贯彻新发展理念，把实施扩大内需战略同深化供给侧结构性改革有机结合起来，加快构建以国内大循环为主体、国内国际双循环相互促进的新发展格局。积极建设创新型国家，抓住新一轮科技革命带来的产业转型契机，发展新质生产力，推动经济实现质的有效提升和量的合理增长。</div>\r\n<div>在坚持全面深化改革开放、实现有效市场和有为政府相结合方面始终保持战略定力。改革开放是决定当代中国命运的关键一招，到今天好改的已经改完了，容易吃的肉已经吃光了，剩下的都是硬骨头、要过的都是险滩。然而，改革只有进行时，没有完成时。特别是现在思想上的障碍、体制机制的弊端、利益固化的藩篱依然不少，阻碍着中国式现代化的顺利推进，必须把改革摆在更加突出位置，以壮士断腕的勇气进一步全面深化改革。开放是中国式现代化的鲜明标识。在逆全球化思潮抬头，单边主义、保护主义明显上升的今天，我们必须站在历史正确的一边，以更加开放的姿态和胸怀，扩大高水平对外开放，坚持以开放促改革，在扩大国际合作中提升开放能力，建设更高水平开放型经济新体制。建立和完善社会主义市场经济体制，就必须把有效市场和有为政府结合起来。既要遵循市场经济基本规律，让市场在资源配置中起决定性作用；也要发挥社会主义制度的优势，更好维护市场秩序、弥补市场失灵，把两者有机结合起来，实现资源配置效率最优化和效益最大化，畅通国民经济循环，激发全社会内生动力和创新活力。</div>\r\n<div>在统筹发展和安全方面始终保持战略定力。发展是解决所有问题的关键，安全是中国式现代化行稳致远的重要基础。推进中国式现代化归根结底需要高质量发展，没有高质量发展作支撑的安全一定是脆弱的。同时，中国式现代化建设的整个进程、各个环节都存在着风险和挑战，如果没有安全这个基础作保障，不但发展进程难以顺利，而且发展成果也得不到维护。因此，在推进经济社会发展进程中，我们必须全面贯彻落实总体国家安全观，完善维护国家安全体制机制，实现高质量发展和高水平安全良性互动，切实保障国家长治久安。</div>\r\n<div>迈向新征程的号角已经吹响，只要我们始终保持一张蓝图绘到底的战略定力，就一定能够把富强民主文明和谐美丽的社会主义现代化强国蓝图变为现实。</div>'),
(12, '<div>2025年7月召开的中央城市工作会议强调，要认真践行人民城市理念，把&ldquo;坚持城市内涵式发展&rdquo;作为主线，将&ldquo;推进城市更新&rdquo;作为重要抓手。这标志着中国城市发展从过去追求规模扩张的&ldquo;外延式发展&rdquo;，全面转向注重质量、效益和可持续性的&ldquo;内涵式发展&rdquo;新阶段。这一历史性转变既需要深刻的理论指引，也需要回应现实的时代命题，更呼唤先行地区的实践探索。</div>\r\n<div><strong>人民城市的理论根基</strong></div>\r\n<div>&ldquo;人民城市&rdquo;理念的形成与发展，既根植于中华优秀传统文化的深厚土壤，又吸纳了人类城市文明的先进成果，呈现出从传统&ldquo;民本&rdquo;思想到现代&ldquo;城市权&rdquo;概念的创造性融合与升华。</div>\r\n<div>中国传统文化中的民本思想是理论之基。中国自古以来便有丰富的民本思想遗产。《尚书》中&ldquo;民惟邦本，本固邦宁&rdquo;的论述，确立了民众在治国安邦中的根本地位。儒家倡导&ldquo;仁政&rdquo;与&ldquo;惠民&rdquo;，主张统治者应体恤民情、关注民生，如孔子所言&ldquo;因民之所利而利之&rdquo;。孟子进一步提出&ldquo;民为贵，社稷次之，君为轻&rdquo;的思想，将民众地位提升到前所未有的高度。</div>\r\n<div>然而，传统的民本思想本质上是一种&ldquo;自上而下&rdquo;的治理理念，虽然强调重视民生，但并未赋予人民真正的主体地位。直至现代，中国共产党创造性地继承和发展民本思想，将其与马克思主义人民观相结合，提出以人民为中心的发展思想，实现从&ldquo;为民做主&rdquo;到&ldquo;由民做主&rdquo;的根本性转变。</div>\r\n<div>西方城市理论中的城市权是他山之石。20世纪中后期，西方城市理论提出了具有革命性的&ldquo;城市权&rdquo;概念。法国思想家亨利&middot;列斐伏尔在1968年首次系统阐述这一理论，他指出城市权不仅是居民使用城市空间的权利，更是参与城市塑造过程的集体权力。大卫&middot;哈维进一步深化了这一概念，强调城市权意味着城市资源生产和分配的公平性，特别是边缘群体对城市决策的介入权利。</div>\r\n<div>人民城市理念是中西融合的理论创新。人民城市理念实现了中西理论的创造性融合。它既汲取民本思想重视民生的精髓，又吸纳城市权理论强调权力参与的内核，形成了独具特色的理论体系：首先，在价值取向上，坚持&ldquo;人民至上&rdquo;的根本立场，将满足人民日益增长的美好生活需要作为城市发展的出发点和落脚点。其次，在实践路径上，强调&ldquo;共建共治共享&rdquo;，既要求政府履行保障民生的责任，又鼓励市民积极参与城市治理。最后，在评价标准上，确立&ldquo;人民群众满意度&rdquo;作为衡量城市工作成效的根本标准，实现评价主体从专家精英向普通市民的转变。这种理论创新超越西方城市权理论的批判性局限，构建了具有建设性的城市发展范式；同时突破传统民本思想的&ldquo;为民做主&rdquo;做派，确立人民的城市主体地位。</div>\r\n<div><strong>人民城市建设需平衡好四对关系</strong></div>\r\n<div>人民城市建设本质上是一场持续不断的平衡艺术实践，是在多元价值、多元利益、多元目标之间寻找动态平衡点的过程。在人民城市建设过程中，如何平衡好不同群体、不同价值、不同发展阶段之间的关系，成为城市治理者和全社会共同面对的重要课题。当前，人民城市建设尤其需要平衡好以下四对关系。</div>\r\n<div>一是弱势与优势的关系，要构建包容共享的发展格局。在城市发展进程中，弱势群体与优势群体之间的张力日益凸显。这种分化若不能得到有效弥合，将最终损害城市的整体活力与和谐稳定。</div>\r\n<div>应对这一挑战，关键在于构建更加包容和共享的城市发展机制。一方面，要着力补齐公共服务的短板，推动教育、医疗、住房等资源更加公平地配置。另一方面，也要畅通社会纵向流动渠道，让每一个城市居民都能通过自身努力实现人生价值。</div>\r\n<div>二是个体与全体的关系，要实现从被动接受到主动创造的治理转型。随着社会发展和教育水平的提高，越来越多的人不再满足于作为城市发展的被动接受者，而是渴望成为城市建设的参与者和共创者。在这种情况下，个体诉求的多样化如何与公共利益相协调？个性化表达如何不损害整体秩序？</div>\r\n<div>应对这一挑战，需要推动城市治理从&ldquo;管理&rdquo;向&ldquo;治理&rdquo;转型，构建多元参与、协商共治的新格局。城市管理者应当积极搭建参与平台、拓宽参与渠道，通过社区议事会、公众咨询、协同规划等形式，让市民的意见和创意能够真正影响决策。同时，通过提供多元化、差异化的公共服务选项，满足不同群体的合理需求。例如，在城市公共空间设计中，既要有满足老年人休闲需求的场所，也要有适合年轻人创意活动的空间；既要有保护个人隐私的隔离区域，也要有促进社区交往的开放场地。</div>\r\n<div>三是现代与传统的关系，要在创新与传承中塑造城市认同。中国正处于两次现代化叠加的特殊时期。这种双重转型也给人民城市建设带来了严峻挑战：一方面，城市需要积极引入新技术、新产业、新生活方式，以满足人民群众对美好生活的向往；另一方面，城市又面临着如何保护历史文脉和地方特色，避免&ldquo;千城一面&rdquo;的认同危机。如何在现代化进程中保护好人民的集体记忆和文化认同，如何让城市发展既面向未来又不失人文温度，成为当前人民城市建设必须直面的重要课题。</div>\r\n<div>面对这一挑战，关键在于坚持以人民为中心的发展理念，采取因地制宜的差异化策略。以城市更新为例，发达城市应重点关注人民群众对文化认同和精神归属的深层需求，通过&ldquo;有机更新&rdquo;的方式，在现代化建设中注重保护历史街区和传统风貌。发展中城市则要着力解决人民群众最关心的现代基础设施和公共服务不足的问题，在推进现代化进程中注重保护地方特色。成功的城市更新应该是一种充分听取市民意见、尊重居民生活方式的创新性传承，既不是对传统的简单复制，也不是对现代的盲目追随。</div>\r\n<div>四是公平与效率的关系，这是人民城市的双重价值追求。人民城市的本质特征在于其人民性，这必然要求将公平正义作为城市发展的基本价值取向。但强调公平并非否定效率的重要性。恰恰相反，只有建立在效率基础上的公平才是可持续的、真实的公平。城市资源的有限性要求我们必须思考：如何在满足部分群体需求与实现资源最优化配置之间找到平衡点？</div>\r\n<div>人民城市的建设资金来自人民，也必须用之于人民，这就要求城市管理者必须具备成本意识和效率思维。例如，在保障性住房建设中，既要确保住房供给的公平分配，也要通过科学的规划设计、合理的建设标准提高资源利用效率；在公共交通发展中，既要考虑偏远地区的覆盖性（公平），也要评估线路运营的可持续性（效率）。这种平衡不是简单的折中主义，而是在深刻理解城市运行规律基础上的精细化管理艺术。数字技术的发展为同时提升公平与效率提供了新的可能，通过大数据、人工智能等工具，可以更加精准地识别需求、优化配置、提升服务质量。</div>\r\n<div><strong>人民城市建设的浙江实践与未来发力点</strong></div>\r\n<div>近年来，浙江作为共同富裕示范区，在人民城市建设中围绕以上四对关系开展了系统性的创新实践。在&ldquo;弱势与优势&rdquo;关系上，打造&ldquo;普惠共享&rdquo;的民生共同体。浙江通过制度创新推动普惠共享，例如深化山海协作升级版，推动优势地区的产业、科技与山区海岛县精准对接；建立新市民积分共享机制，将社保、居住年限转化为公共服务获取权，避免城市内部二元分割。试点&ldquo;共性+个性&rdquo;的共富型政策工具箱，通过保障性租赁住房、普惠托育等服务覆盖弱势群体，让城市化红利惠及农业转移人口和低收入群体。</div>\r\n<div>在&ldquo;个体与全体&rdquo;关系上，构建&ldquo;人民提案&rdquo;的治理生态圈。依托数字化治理优势，浙江创新性构建&ldquo;平台化+民主协商&rdquo;的治理新模式。杭州市依托&ldquo;城市大脑&rdquo;系统，通过&ldquo;民呼我为&rdquo;平台收集市民诉求，解决群众急难愁盼。在全省推广的未来社区建设中，普遍建立了&ldquo;居民会客厅&rdquo;等民主协商载体，如杭州缤纷未来社区借助&ldquo;邻聚里&rdquo;会客厅，实现&ldquo;大事共商、小事共议、实事共办、难事共解&rdquo;。</div>\r\n<div>在&ldquo;现代与传统&rdquo;关系上，探索&ldquo;基因活化&rdquo;的文化传承范式。浙江创新性地实施文化基因解码工程，系统梳理全省县域文化元素并建立数字化资源库，推动传统文化与现代生活融合。比如，绍兴鲁迅故里通过AR技术打造沉浸式戏剧街区，使传统街区成为可体验的现代文化消费场景；丽水松阳采用&ldquo;针灸式微更新&rdquo;策略，在保留古村落肌理的同时植入先锋书店、非遗工坊等新功能。</div>\r\n<div>在&ldquo;公平与效率&rdquo;关系上，创新&ldquo;绩效导向&rdquo;的资源配置模式。浙江积极探索以数字化和市场化手段优化资源配置的创新模式。例如，在全省域推广的&ldquo;浙里未来社区在线&rdquo;数字化平台，运用大数据精准画像，为不同年龄结构、不同需求的社区智慧化配置托育、养老、医疗等公共服务设施，实现从&ldquo;被动供给&rdquo;到&ldquo;主动匹配&rdquo;的转变，显著提升财政资金的使用效益和服务的精准度。</div>\r\n<div>浙江在人民城市建设上虽处于前列，但对照2025年中央城市工作会议精神，接下来仍需在以下三个关键点上发力。一是在发展理念上，真正从&ldquo;规模扩张&rdquo;转向&ldquo;内涵式提升&rdquo;，聚焦存量的精细化运营。以杭州轨道交通为例，应严格控制新线大规模扩张，防范财政压力过度累积。重点转向提升既有网络服务效能：优化换乘接驳、完善无障碍设施、延长运营时间等，挖掘现有线路潜力，真正实现从&ldquo;重建设&rdquo;到&ldquo;优服务&rdquo;的转变，让市民出行更便捷、更舒心。</div>\r\n<div>二是在核心目标上，紧紧围绕&ldquo;创新、宜居、美丽、韧性、文明、智慧&rdquo;六大维度构建一体化发展体系，统筹推进而非单点突破。尤其应以&ldquo;韧性&rdquo;筑牢安全底线，升级防洪排涝等生命线工程，构建从基础设施到社区自救的全域防灾体系。同时，兜牢民生底线，通过保障房供给、旧改新模式等降低居住成本，增强城市包容性与归属感，真正让人民城市建设成果惠及全体市民。</div>\r\n<div>三是在实现路径上，坚决扭转&ldquo;政府主导、大包大揽&rdquo;的传统模式，真正落实&ldquo;人民城市人民建&rdquo;理念。要健全制度化的公众参与渠道，全面推行社区规划师、居民议事会等机制，保障市民在规划、建设、管理全流程中的知情权、参与权和监督权。同时，积极培育社会组织，通过政府购买服务、公益创投等方式，引导专业社会力量参与社区微更新、养老服务、儿童托管等公共事务，构建多元共治、可持续的长效治理新格局。</div>'),
(13, '<p>来沪流动党员第一课&rdquo;&ldquo;抵沪第一杯咖啡&rdquo;，一项项举措传递着党组织的温暖；&ldquo;治理建言官&rdquo;&ldquo;社区主理人&rdquo;，一个个称呼闪耀着流动党员的风采。</p>\r\n<p>作为全国最大经济中心城市和重要枢纽，来自全国各地的流动党员已成为上海不可或缺的一分子。近年来，上海充分发挥城市精细化管理优势，深入探索符合超大城市特点的流动党员管理模式，依托一体严密的基层组织体系、链路畅达的信息网络系统和遍布全市的党群服务阵地，让流动党员一经确认就能及时纳入组织管理、规范过上组织生活、切实感受组织关怀、充分发挥先锋作用。</p>\r\n<p><strong>全链条排摸纳管</strong></p>\r\n<p>&ldquo;像漂泊许久的船只终于找到了港湾。&rdquo;在上海打拼多年，有着30余年党龄的虹桥火车站浦江物业公司安保人员钱永刚，在街道党群服务站点了解到线下报到渠道，主动向街区书记亮明身份，被纳入所在街区党支部管理。</p>\r\n<p>为及时发现每一名来沪流动党员，上海各级党组织运用&ldquo;大数据+铁脚板&rdquo;的方式，在全市范围内构建起发现渠道多元、联系核查高效、信息接转通畅、接收纳管及时的工作链条，切实将流动党员底数摸清。</p>\r\n<p>在上海&ldquo;智慧党建&rdquo;平台推出流动党员市内转接联系、接续纳管、工作预警提示等功能。广泛推行&ldquo;四访四问四清&rdquo;&ldquo;三主动三了解&rdquo;等做法，实现排摸名单第一时间分解推送、基本信息第一时间联系核实、纳管结果第一时间沟通反馈，有效提升流入党员线上接收效率。</p>\r\n<p>结合深入推进全市新兴领域党的组织体系全覆盖，做好常态化走访联系，对于&ldquo;小个专&rdquo;群体中的流动党员，由街区党组织牵头走访；对于楼宇、园区等&ldquo;白领&rdquo;集中区域，由基层党组织牵头职能部门、产权方、物业公司等联合走访；对于居民区内灵活就业等群体，由居民区党组织牵头，做好分类建档排查工作。</p>\r\n<p>推出流动党员报到码，实现党员抵沪一键报到、流向信息一键录入。在全市党群服务阵地设置流动党员报到专区，在高铁站点、客运码头、公交车站等建立报到站，通过发放联系卡、给流动党员的一封信等方式，不断增强流动党员身份意识和组织观念，引导更多流动党员主动报到。</p>\r\n<p><strong>全市域联通联管</strong></p>\r\n<p>党员流动到哪里，教育管理就跟进到哪里。上海充分发挥组织、系统、阵地&ldquo;三网协同&rdquo;作用，确保流动党员一经确认就有明确对应的党组织及时对接联系、在全市流动都有就近就便的党群阵地接续提供服务，全面打造坚实可靠、凝聚有力的&ldquo;流动党员之家&rdquo;。</p>\r\n<p>坚持&ldquo;工作单位党组织优先纳管一批、居住地党组织协助纳管一批、街区党组织兜底纳管一批&rdquo;以及&ldquo;来沪流动党员应转尽转一批&rdquo;等，全市已累计实现纳管流动党员3.4万余人，完成组织关系正式转入2281名。</p>\r\n<p>深化落实专人结对联系制度及流动党员纳管报到必谈、年底返乡必谈、连续无故缺勤必谈&ldquo;三必谈&rdquo;要求，及时掌握流动党员近况和思想动态，引导过好组织生活。市级层面每月下发工作提示和资源清单，各党群服务阵地主动提供&ldquo;包干&rdquo;服务，为流动党员纳管支部开展组织生活提供全方位支撑保障。</p>\r\n<p>组织流动党员参与全市党员&ldquo;同上一堂党课&rdquo;。牢牢把握流动党员&ldquo;在网上&rdquo;&ldquo;在路上&rdquo;特性，坚持线上线下相结合，下沉优质资源，运用&ldquo;智慧党建&rdquo;&ldquo;先锋上海&rdquo;等线上学习平台做好&ldquo;配餐送学&rdquo;，畅通流动党员&ldquo;随身学&rdquo;渠道。</p>\r\n<p>将全市党群服务阵地打造成实现流动党员全市域联管的重要节点，党员点单、支部下单、阵地接单，为流动党员、流动党员党组织提供精准化、一对一服务。</p>\r\n<p><strong>全方位引领带动</strong></p>\r\n<p>居住在黄浦区的流动党员史晶晶，在纳管街区党支部书记的支持鼓励下，担任街区新兴领域项目主理人，协助街区党支部推出&ldquo;探营青春跑&rdquo;项目，带领党员群众实地体验黄浦区多个红色场馆和改革实践场景；静安区某连锁餐饮企业的运营总监孙静，主动认领&ldquo;一个支部一件实事&rdquo;项目，参与商圈共享单车文明停放引导和乱停乱放整治等志愿服务，用实际行动感染和带动身边人&hellip;&hellip;在上海城市建设的大街小巷、基层治理的一线前沿，一名名流动党员成了一面面先锋旗帜。</p>\r\n<p>做好特长登记、征求志愿服务岗位意愿等已成为上海各级党组织接收纳管流动党员时的&ldquo;规定动作&rdquo;，通过专人化服务、清单化管理、定向化供给等多种方式，有针对性地为流动党员匹配岗位、提供平台、对接项目，让更多流动党员有机会投身&ldquo;一个支部一件实事&rdquo;&ldquo;美好社区先锋行动&rdquo;&ldquo;15分钟社区生活圈建设&rdquo;等项目，为上海城市发展作贡献，既建设他乡，又反哺故乡。</p>\r\n<p>主动加强与流入党员集中来源地区联系，深入探索组织共建、信息共享、教育共抓、作用共促有效模式，健全完善长三角地区流动党员协同共管长效机制。普陀区注重发挥驻沪流动党员党组织作用，定期与福建莆田、江苏泰州等地驻沪流动党员党组织开展党建共建，为两地之间开展招商引资、产业创新合作等添砖加瓦。奉贤区协同安徽、江苏、江西等集中来源地党组织，发挥已纳管党员骨干地缘相近、人缘相亲、方言相同等优势，通过认老乡、聊家乡、话家常等方式，开展同籍贯流动党员身份挖掘和日常管理，通过党员率先垂范树标杆，带动老乡见贤思齐共行动。</p>'),
(14, '<p>&ldquo;以前，小区内电瓶车充电难、停车乱，大家没少为这事闹心，自从有了党群服务站，问题解决得又快又好。&rdquo;近日，家住江西省井冈山市香榭丽小区的居民郭娟感慨。</p>\r\n<p>原来，小区电瓶车充电桩不足、停车位规划不合理等问题纳入党群服务站议事清单后，一周内就重新规划了停车位，并新增智能充电桩，居民纷纷为此点赞。</p>\r\n<p>近些年来，井冈山市创新&ldquo;小区党群服务站&rdquo;治理模式，将红色堡垒建在群众家门口，通过前移阵地、下沉力量、延伸服务，有效打通服务群众的&ldquo;最后一公里&rdquo;。目前，全市建成小区党群服务站24个。</p>\r\n<p>井冈山市将党群阵地前移，依托物业办公室、新时代文明实践站等场所，采取政府投、对口帮、小区筹、社会捐等渠道，因地制宜、因需规划，打造集便民服务、矛盾调解、学习交流等功能于一体的小区党群服务站，持续凝聚党员力量。</p>\r\n<p>建好不是目的，用好才是关键。井冈山市推行街道包联干部兼任站长，社区干部、专职网格员、物业公司负责人、业委会主任担任副站长，下辖N名楼栋长的&ldquo;1+4+N&rdquo;架构，吸纳补充党员骨干、离退休党员、退役军人等群体，成立&ldquo;邻里帮帮团&rdquo;等志愿者队伍，健全党员轮值、社工主导、志愿者补充的&ldquo;365天不打烊&rdquo;模式，共同打造睦邻友好的&ldquo;熟人小区&rdquo;。</p>\r\n<p>坚持把群众小事当作治理大事来抓，井冈山市畅通诉求渠道、方便群众报诉，不仅在服务站内搭建集议事协商、矛盾调解等功能于一体的&ldquo;井冈议事厅&rdquo;，设置&ldquo;党员进网格井冈议家亲&rdquo;居民诉求公开征集窗口，及时回应群众关切；还在线上开通&ldquo;纮星到家&rdquo;等15个民声通道小程序，让居民诉求&ldquo;码&rdquo;上反映、及时响应；更以小区党群服务站为中转，常态化开展&ldquo;党员进网格井冈议家亲&rdquo;活动，推动3390名在职党员沉网入格，全面收集民情民意。</p>\r\n<p>如今，小区党群服务站不仅是居民反映问题的窗口，更成为凝聚治理合力的&ldquo;纽带&rdquo;。井冈山市推动169家共驻单位投入共建资金保障服务站运转，又推动住建、城管、供水等部门常态进驻，特别是对于需多部门联办诉求及时启动&ldquo;吹哨&rdquo;程序，由挂小区市领导开展&ldquo;民声面对面&rdquo;督促相关部门&ldquo;应哨&rdquo;，确保问题妥善解决。</p>\r\n<p>家住怡园新村小区的李婷夫妇，因为工作时常需要加班，家里没人做饭，如何让孩子吃饱吃好成了她最头疼的问题。李婷这样的家庭并非个例，&ldquo;小区能建个食堂&rdquo;已成为居民们共同的期盼。</p>\r\n<p>了解到这一需求后，怡园新村小区党群服务站迅速将&ldquo;小区共享食堂&rdquo;列入共建项目，联合共建单位出资改造闲置用房，引入专业餐饮团队运营，按照&ldquo;公益+低偿&rdquo;模式每日提供营养均衡的餐食。服务站还开设托幼托管服务，为幼儿打造儿童活动室，为老人打造&ldquo;夕阳红&rdquo;活动室，让居民在家门口就能享受温馨服务。</p>\r\n<p>服务站生命力的强弱在于为民服务质效的高低。井冈山市将便民服务下沉到服务站，提供微波炉、雨具梯子等工具，将帮代办服务矩阵延伸至每个楼栋单元，围绕居民代缴代购、上门诊疗等便民服务帮代办，开展&ldquo;我们的节日&rdquo;等文明实践活动，真正实现&ldquo;小事不出小区、大事不出社区&rdquo;。</p>'),
(15, '<p>本报天津讯（通讯员津组轩）一个个城市更新项目落地开工，一面面党旗也在项目一线飘扬起来。&ldquo;把支部建到项目上，让党员亮出身份、带头攻坚，为城市更新项目顺利推进实施提供了源动力。&rdquo;近日，天津城投集团所属城市更新公司党总支负责人介绍。</p>\r\n<p>今年以来，天津把抓实项目党建作为推进国有企业党建工作的重要任务，市委组织部会同市国资委党委经常深入重点项目一线指导推动，为项目高质量实施增能加力。有关市管企业党委在推进城市更新项目建设中同步谋划推进党建工作，充分发挥党建引领服务保障作用。</p>\r\n<p>坚持项目建设到哪里、党的组织就建到哪里、党的工作就开展到哪里。结合项目建设特点和实际，加强分类指导，通过成立项目公司党支部、临时党支部等方式，及时健全党的组织，开展党的工作。目前，市管企业已开工的14个城市更新项目均实现党的组织和党的工作覆盖。城投集团所属城市更新公司结合所承担城市更新项目建设周期长、投资规模大、跨区域建设等特点，专门成立项目公司及项目公司党支部，党支部书记由项目公司主要负责同志担任。市政建设集团党委指导城市更新项目公司成立联合党支部，选优配强党支部书记和专职副书记。</p>\r\n<p>立足搭建高效联动的沟通平台，推动建立属地政府机关、参建单位、街道社区等共同参与的沟通协商和党建联建共建机制，定期研究解决项目建设和党建工作中存在的难点问题，开展多种形式的共建活动。城市更新公司党总支推动金钟城更公司党支部注重加强与项目所在辖区政府沟通会商，着力解决项目跨区建设手续办理问题，推动项目快速审批落地。轨道交通集团所属城市发展公司党总支组织城市更新项目党员突击队与街道、社区联合行动，聚焦社区改造提升过程中居民反映集中的急难愁盼问题，开展入户访谈、居民座谈，着力解决群众合理诉求。</p>\r\n<p>紧紧围绕推进项目实施找准对接点、着力点，通过设立党员责任区、党员先锋岗等，组织党员亮身份、亮职责、亮承诺，做到关键岗位有党员领着、关键环节有党员把着、关键时刻有党员顶着。泰达城投集团党委推动南门外项目临时党支部组织党员骨干跑出审批&ldquo;加速度&rdquo;，第一时间协调联系取得质量安全监督登记及建设用地规划许可，做到&ldquo;拿地即开工&rdquo;。</p>\r\n<p>坚持围绕项目抓党建、抓好党建促项目，探索打造各具特色的党建工作品牌，切实以高质量党建服务保障项目高质量实施。城市发展公司党总支深化&ldquo;效益型&rdquo;项目党建品牌，强化作风建设、完善考核机制，引导党员干部争做项目建设的干将、难题攻坚的闯将。泰达城投集团党委结合项目所在区域历史文化特点，打造&ldquo;传承红色、津一焕芯&rdquo;等特色项目党建，为项目建设提供有力支撑。</p>'),
(16, ''),
(17, ''),
(18, ''),
(19, ''),
(20, ''),
(21, ''),
(22, ''),
(23, ''),
(24, ''),
(25, '<p>本报滕州讯（通讯员滕组轩）山东省滕州市地处鲁西南地区，是全省人口最多的县级市。近些年来，滕州市靶向发力加强居民小区党建工作，通过建体系、强阵地、优服务，充分激发党建引领小区治理动能，绘就城市幸福家园新图景。</p>\r\n<p>推进把&ldquo;支部建在小区上&rdquo;，新组建216个小区党支部，下设4126个楼栋党小组、1.2万个党员中心户，推动支部建到小区、党员联系到户、服务延伸到家。推动社区&ldquo;两委&rdquo;成员、社区专职工作者等担任小区党支部书记，1739名社区工作者全面&ldquo;定岗小区&rdquo;。深化小区党建联建机制，推进小区分类管理，实行红色物业、红色合伙人、党组织领办公益企业等共建联动制度，精选100个小区开展示范创建，以点带面提升小区治理服务效能。</p>\r\n<p>把阵地作为服务群众的重要载体，以15分钟为服务半径，统筹布局10处党群服务圈，优化提升社区党群服务中心、小区驿站，下放水电燃气自助缴费、居民医保等14项公共服务，定制化嵌入小区食堂、老年理发等30余项服务项目，形成覆盖全域、功能完备的服务矩阵。打造&ldquo;睦邻会客厅&rdquo;&ldquo;说事拉理亭&rdquo;，让群众在家门就能找到组织、享受服务。</p>\r\n<p>建立&ldquo;线上+线下&rdquo;双向问需机制，通过网格员&ldquo;敲门问需&rdquo;、开设网络&ldquo;民意直通车&rdquo;等动态收集群众诉求；推行分级处理机制，推动小事在小区及时化解，大事在社区协商办理，难事&ldquo;吹哨报到&rdquo;上报街道、部门联合处理。建立健全协商议事制度，小区党支部牵头制定议事章程，每月组织业委会、物业、居民代表等召开现场议事会，协商解决停车难、飞线充电等关键小事。下沉&ldquo;双报到&rdquo;单位包联小区，常态化开展邻里文化节、义修义诊等服务，惠及居民30余万人。</p>'),
(26, '<p>为加快推动社会治理重心向基层下移，坚持和发展新时代&ldquo;枫桥经验&rdquo;，今年以来，四川省犍为县持续深化党建引领心连心接诉即办改革工作，创新服务品牌，推出&ldquo;小板凳&rdquo;服务在前、&ldquo;小铃铛&rdquo;教育在前、&ldquo;小拐杖&rdquo;扶助在前、&ldquo;小嫩芽&rdquo;关爱在前的&ldquo;四小工作法&rdquo;，突出抓好未诉先办治理和&ldquo;一老一小&rdquo;关爱保障服务，通过&ldquo;小工具&rdquo;撬动&ldquo;大治理&rdquo;。</p>\r\n<p>服务在前解民忧</p>\r\n<p><strong>&ldquo;小板凳&rdquo;下沉一线</strong></p>\r\n<p>&ldquo;以往靠打热线反映诉求，现在&lsquo;小板凳&rsquo;队员主动&lsquo;敲门问需&rsquo;，问题解决又快又好。之前反映的路面破损问题，上周已整修扩宽了。&rdquo;犍为县玉津镇凤凰社区居民黄方权连连称赞。</p>\r\n<p>变&ldquo;被动响应&rdquo;为&ldquo;主动作为&rdquo;。依托全覆盖联户四级包联体系，组建&ldquo;小板凳&rdquo;志愿服务队，累计开展&ldquo;敲门行动&rdquo;3000余次。建立健全问题诉求&ldquo;村&mdash;镇&mdash;县&rdquo;三级联动处置机制，推行常规问题限时办、高频问题专项办、遗留问题挂联办、重难问题攻坚办，以现场办公会、专项联席会等推动解决群众季节性缺水等问题72个。</p>\r\n<p>充分发挥数字赋能作用，县心连心服务中心定期对热点难点问题分析研判，找准全县&ldquo;冒热气&rdquo;社情民意，适时向服务队发出走访建议书，推动问题响应率、办结率、满意率和退件率&ldquo;三升一降&rdquo;。</p>\r\n<p>教育在前树新风</p>\r\n<p><strong>&ldquo;小铃铛&rdquo;警醒常在</strong></p>\r\n<p>&ldquo;叔叔、嬢嬢们，高息借贷陷阱需警惕，熟人介绍也要多个心眼&hellip;&hellip;&rdquo;今年以来，犍为县玉津派出所副所长黄远志一有空就来到玉津社区文庙广场，通过发放民法典宣传资料、现场提供法律咨询服务等方式开展普法宣传，摇响普法&ldquo;小铃铛&rdquo;。</p>\r\n<p>围绕群众法律意识提升需求，用好党员&ldquo;双报到&rdquo;&ldquo;四下基层&rdquo;载体，犍为县组建&ldquo;三官一律&rdquo;&ldquo;50+调解队&rdquo;等宣讲队16支，常态化进社区、进农村、进企业、进小区开展&ldquo;法治研学游&rdquo;&ldquo;民法典大转盘&rdquo;等活动。为切实满足群众多样化普法需求，利用&ldquo;乡村大喇叭&rdquo;&ldquo;微犍为&rdquo;等平台，通过方言快板、三句半等喜闻乐见形式，制作发布政策解读、移风易俗等音频。</p>\r\n<p>加强普法、守法、用法等先进典型选树推介，常态评选&ldquo;身边好人&rdquo;&ldquo;道德模范&rdquo;等，打造&ldquo;初心&rdquo;广场以及&ldquo;鱼跃龙门&rdquo;&ldquo;美丽犍程&middot;花开少年&rdquo;法治教育基地，在重要节日集中开展事迹展播，切实用身边事教育身边人。</p>\r\n<p>扶助在前暖桑榆</p>\r\n<p><strong>&ldquo;小拐杖&rdquo;精准帮扶</strong></p>\r\n<p>8月，在九井镇回龙村&ldquo;打平伙&rdquo;食堂，一场为村里100多位70岁以上老人举办的生日会温暖了老人们的心。&ldquo;通过举办集体生日会传递组织温暖，纾解空巢老人的孤独，营造守望相助的浓厚氛围。&rdquo;九井镇党委委员、组织委员梁琴说。聚焦孤寡留守老人吃饭难问题，推行&ldquo;打平伙&rdquo;食堂、人民食堂模式，引入&ldquo;犍嬢嬢&rdquo;&ldquo;犍小茉&rdquo;等社会力量，通过有菜出菜、有力出力、场地共享等方式，为1.2万余名独居老人就近提供就餐服务，定期开展集体生日会等活动，为老人们打造舒适&ldquo;小拐杖&rdquo;。</p>\r\n<p>大力推行&ldquo;邻里对子&rdquo;互助模式，推选452名身体好、热心肠的退休党员等担任&ldquo;互助中心户&rdquo;，让留守老人平时有人问、难时有人帮、病时有人管。充分发挥老党员等&ldquo;五老&rdquo;人员经验资源优势，组建&ldquo;银发生辉&rdquo;志愿服务队65支，积极参与小区治理、村级事务管理，提出建设性意见建议，将银发智慧转化为治理良方。</p>\r\n<p>关爱在前促成长</p>\r\n<p><strong>&ldquo;小嫩芽&rdquo;悉心呵护</strong></p>\r\n<p>正值暑假期间，在九井镇金鼓村&ldquo;周五课栈&rdquo;里，&ldquo;小嫩芽&rdquo;们正茁壮成长。小朋友可以在大学生志愿者帮助下开展美术、手工等活动，也可以静静地写作业、看书。针对农村留守儿童校外照料、课后辅导以及节假日看护难问题，依托村（社区）党群服务中心、童伴之家等阵地搭建&ldquo;周五课栈&rdquo;，招募退休教师、大学生志愿者等组建爱心师资团80余个，采取&ldquo;低偿+无偿&rdquo;方式提供课后辅导、陪伴看护服务。</p>\r\n<p>开展&ldquo;护未行动&rdquo;，全覆盖选派法治副校长，明确每周一走访、每月一宣传、每季一讲座&ldquo;三个一&rdquo;工作要求，收集并消除隐患问题232个；成立&ldquo;犍伴&rdquo;心灵成长工作室，开通&ldquo;7&times;24小时&rdquo;心理辅导热线，为心理困扰儿童提供一对一精准辅导。围绕树文明新风、承优良家风、扬乡土遗风等主题，广泛开展&ldquo;小手拉大手&rdquo;实践活动，以孩子带动家庭、以家庭影响社会，促进社风民风持续向上向善。</p>\r\n<p>&ldquo;四小工作法&rdquo;实行以来，犍为县心连心接诉即办退件率环比下降75%，办理满意率持续保持在99%以上。</p>'),
(27, '<div>本报崇仁讯（通讯员黄思明刘福恒）近年来，江西崇仁县创新实施&ldquo;一企业一博士、一产业一团队&rdquo;人才引进&ldquo;双一工程&rdquo;，出台一揽子政策举措，设立2000万元人才发展专项资金，为产业发展精准引进人才。</div>\r\n<p>加大人才引进力度。锚定产业需求，围绕输变电设备等特色产业转型升级需求，分领域建立产业人才&ldquo;需求库&rdquo;。广泛深入开展企业调研，围绕企业提出的人才需求，向省内外合作高校和科研院所广发&ldquo;招贤帖&rdquo;，形成专业博士&ldquo;人才库&rdquo;。开展双向匹配，对照产业人才&ldquo;需求库&rdquo;和专业博士&ldquo;人才库&rdquo;，按照&ldquo;供需匹配、专业对口、协商一致&rdquo;原则，组织企业与入库博士逐一开展对接匹配，累计为30家企业匹配博士54人，为两大产业匹配团队3个，精准匹配率达到85%以上。</p>\r\n<p>实施结对联帮。明确对引进的博士人才均通过项目攻关、课题申报、技术升级等具体形式与企业开展结对帮扶，突出以用为本的引才方向，调动企业引才积极性，避免人才&ldquo;引进空挂&rdquo;和&ldquo;引而不用&rdquo;。目前已对接博士中，有7位博士参与了各级&ldquo;揭榜挂帅&rdquo;重大项目攻关，揭榜资金达1000多万元，20余名博士领衔或参与了企业重大项目申报，其余博士均已按照既定方向开展合作。</p>\r\n<p>完善配套服务。按照一个企业+三个专员的形式，组建百人&ldquo;双一工程&rdquo;综合服务专员队伍，即分别为每家企业选派一名跟踪服务单位专员、一名高新区服务专员、一名企业服务专员，专项对接服务博士。在高新区设立&ldquo;人才创新创业服务中心&rdquo;，开通&ldquo;人才服务专线&rdquo;，发放集旅游住宿、休闲娱乐、政策兑现等于一体的&ldquo;崇仁英才卡&rdquo;，为人才到崇创新发展构建全生命周期综合服务体系。</p>');
INSERT INTO `party_cms_addon_article` (`id`, `content`) VALUES
(28, '<p>今年以来，浙江省金华市民政局坚持党建引领，聚焦民政领域<span lang=\"EN-US\">&ldquo;一老一小&rdquo;，充分发挥党支部战斗堡垒作用和党员先锋模范作用，</span>以党建<span lang=\"EN-US\">&ldquo;</span>红色动能<span lang=\"EN-US\">&rdquo;</span>助推党组织<span lang=\"EN-US\">&ldquo;</span>红色引擎<span lang=\"EN-US\">&rdquo;</span>，强化<span lang=\"EN-US\">&ldquo;</span>一老一小<span lang=\"EN-US\">&rdquo;</span>群众基本服务保障，兜准兜牢民生底线。</p>\r\n<p><strong>上下联动共建共创。</strong>建立民政系统党建纵向联动工作机制，开展全市民政系统党员&ldquo;三亮两促&rdquo;基层党建争先攀高行动，引导党员干部亮身份、亮目标、亮承诺，提高工作质效，提升群众获得感。创建党建品牌，设立党员先锋岗、党建攻坚小组、党员突击队等，开展攻坚突击项目，涵盖各业务条线重点工作。针对养老服务突出问题开展专项整治工作，创设养老服务&ldquo;爱心卡&rdquo;，整合政府、家庭、社会、市场等多方资源，为老年人提供助餐、助洁等多元化服务。针对孤儿、事实无人抚养儿童、留守儿童、重点流动儿童以及其他低保、低边等经济困难家庭儿童，量身定制精准帮扶方案，&ldquo;一人一案一策&rdquo;精准施策，为困境儿童提供全方位的关怀与支持。</p>\r\n<p><strong>整合力量释放动能。</strong>继续深化市民政局&ldquo;争先进位年、改革创新年、作风提升年&rdquo;活动，大力弘扬&ldquo;严真细实快&rdquo;工作作风，明确金华民政十方面民生实事。发动市、县、乡、村四级力量实地排查问题，联合财政、市场监督管理、农业农村部门抽查老年食堂，发现问题并认真整改。实施&ldquo;<span lang=\"EN-US\">1+2+N&rdquo;儿童关爱保护模式，&ldquo;1&rdquo;是以增加预警标签为核心，变主动排查为主动预警；&ldquo;2&rdquo;是开展&ldquo;儿童+家庭&rdquo;双排查，变&ldquo;人找政策&rdquo;为&ldquo;政策找人&rdquo;；&ldquo;N&rdquo;是实施N重关爱，汇聚政府、社会、市场、慈善四股力量，将生存保障优化为&ldquo;物质+权益&rdquo;保障。</span></p>\r\n<p><strong>建强品牌提质增效。</strong>以开展党建品牌服务为切入点，全面提升服务&ldquo;一老一小&rdquo;工作质效。市福利中心和护理院联合党支部以&ldquo;康养助老先锋&rdquo;党建品牌为依托，聚力提升老年休养群体幸福生活指数，建立党员楼栋联户制度<span lang=\"EN-US\">,</span>畅通休养员、员工和家属诉求表达渠道，打通为老服务&ldquo;最后一米&rdquo;。市儿童福利院党支部以&ldquo;红心筑梦&middot;幸福一家&rdquo;党建品牌为依托，充分发挥区域型儿童福利机构作用，实现全市孤儿（义乌除外）集中养育，持续发挥&ldquo;红心先锋队&rdquo;党员突击队作用，深化&ldquo;开门办院&rdquo;，组织开展青少年保护宣传教育，面向困境儿童开展&ldquo;添翼计划&rdquo;&ldquo;明天计划&rdquo;，全面提升&ldquo;养治康教社&rdquo;服务水平，全力打造温馨幸福的&ldquo;爱之家&rdquo;。</p>'),
(29, '<p>3座钢构大棚、水肥一体化控制系统、自动卷膜机等现代化蓝莓种植技术&hellip;&hellip;日前，走进陕西省渭南市潼关县太要镇欧家城村，现代化大棚让人耳目一新。通过村企联建种植的优质蓝莓，很快被抢购一空。&ldquo;和公司一起合作种蓝莓，人家有资金、有技术、有市场，不愁卖不出。&rdquo;村民纷纷点赞。</p>\r\n<p>渭南市地处关中平原东部，土地广袤肥沃，农耕历史悠久，素有陕西&ldquo;粮仓&rdquo;之称。但随着城市化进程的加快，一些村在发展的过程中出现了村级带头人发展产业缺思路、集体增收缺项目、群众致富缺途径的瓶颈。近些年来，渭南市以&ldquo;分类指导、争先进位&rdquo;三年行动为牵引，蹚出了一条以党建为引领，&ldquo;六联&rdquo;为内核，&ldquo;千企兴千村&rdquo;为驱动的村企联建新路径，为发展壮大村级集体经济注入强劲动能。</p>\r\n<p><strong>头雁领衔精准结对</strong></p>\r\n<p>在推进村企联建工作过程中，渭南市通过&ldquo;村党组织主动联、党组织书记主动找&rdquo;的方式与企业进行对接，不断激发村级层面的内生动力。</p>\r\n<p>对于没有主导产业、集体经济年收益低于5万元的&ldquo;薄弱村&rdquo;，注重选配年富力强、敢闯敢干、能够带动产业发展的头雁，注重结对有经济实力、社会责任感强的企业；对有主导产业、集体经济年收益在5万&mdash;50万元的村，注重选配有技术能力、市场经验、能够带动产业发展壮大的头雁，注重结对有资源优势、市场渠道的企业；对主导产业有一定规模、集体经济年收益在50万元以上的村，注重选配善经营会管理、具备一定专业能力的头雁，注重结对有管理经验、金融背景、善风险防控的企业。通过分类选配头雁，科学确定结对企业，推动村企联建工作取得实效。</p>\r\n<p>大荔县许庄镇西渠头村村民吕新发在外经商办企业，懂经营、善管理、有经验。在组织的召唤下，他回村成立了陕西同州时荔合塑业有限公司，担任了村党组织书记，并积极促成公司与西渠头村建立了联建关系。公司实施&ldquo;年产8000吨纳米级环保新材料&rdquo;项目，产值突破2000万元，带动西渠头村集体经济增收近40万元，安置劳动力130余人，实现了经济效益和社会效益双赢。</p>\r\n<p><strong>&ldquo;六联&rdquo;模式推动&ldquo;联姻&rdquo;</strong></p>\r\n<p>村企联建&ldquo;联什么&rdquo;是重点。渭南市坚持边联建、边总结、边完善，形成了&ldquo;六联&rdquo;模式，让村企双方从&ldquo;面上联建&rdquo;迈向&ldquo;深度联结&rdquo;。</p>\r\n<p>通过组织村企党组织共同开展理论学习、举办主题党日活动、促进党员联系交流等，推动组织联建；通过建立企业投资意向和农村发展需求两个清单，促成双方签订框架协议等，推动产业联营；通过盘点村企优势资源，唤醒&ldquo;沉睡&rdquo;资源，建立科学利用机制等，推动资源联动；通过搭建骨干培养平台，建立相互交流机制，打通劳动力供需堵点等，推动人员联用；通过发挥党员先锋模范作用，设置党员示范岗、责任区、先锋队，推动活动联办；通过构建村企收益共同体，建立科学收益分配和带农益农机制，推动发展联享。</p>\r\n<p>合阳县甘井镇麻阳社区流转91.7亩土地，利用专项资金入股，按照&ldquo;产业联营、资源联动&rdquo;的模式，与陕西宏图富强惠民农业有限公司建起了&ldquo;北京鸭&rdquo;养殖场，企业每年按投资额的8%给村集体分红，每年给脱贫户分红500元。麻阳社区还与合阳兴坤生态农业有限责任公司联建，建设了有机肥厂，将鸭粪和餐厨垃圾变废为宝，社区每年保底分红8万元。&ldquo;我们现在是&lsquo;一社联两企，收益双保障&rsquo;，去年社区集体就有68万元收入。&rdquo;社区党支部书记梁登昌说。</p>\r\n<p><strong>&ldquo;千企兴千村&rdquo;提质扩面</strong></p>\r\n<p>村企联建&ldquo;怎么联&rdquo;是关键。渭南市坚持示范带动、全域推进，在全市开展&ldquo;千企兴千村、结对促振兴&rdquo;行动，以典型示范带动更多村企结对联建，进一步推动&ldquo;村企联建&rdquo;工作提质扩面增效。</p>\r\n<p>通过摸排调研、座谈走访，精心筛选出产业基础扎实、经营收益稳定、社会责任感强的企业，划分农业类、金融类、商贸类等不同类型；根据企业要求建立企业投资意向清单，根据各村实际和发展需要建立村级发展需求清单，按照&ldquo;产业相近、地域相邻、市场趋同、经济一体&rdquo;的原则，为各村精准选配联建企业，按需自愿&ldquo;结对联建&rdquo;。</p>\r\n<p>富平县庄里镇永安村通过产业联营、资源联享等方式，盘活奶山羊养殖厂、废旧小学等集体闲置资产，&ldquo;点对点&rdquo;招商引资，建成豆制品深加工厂，引进了柿香型养生白酒企业，建成冰柿、柿饼加工及包装车间，解决了本村柿农的柿饼销售问题，安置剩余劳动力50余人，为村集体每年带来16.3万元的收益。</p>\r\n<p>市级统筹指导、县级牵线搭桥、乡镇组织实施、村企&ldquo;结亲联姻&rdquo;；组织观摩学习、现场示范签约、帮助解决问题，确保&ldquo;成熟&rdquo;一对、&ldquo;结亲&rdquo;一对、&ldquo;稳固&rdquo;一对，今年全市已有227对村企确立了联建关系，村集体收益10万元以上的村达1959个。</p>'),
(30, '<p>本报钦州讯（通讯员黎东桂王一渊）&ldquo;有村里党员服务队守护家里老人小孩，我们在海上生产作业很安心。&rdquo;近日，长期在海上工作的广西钦州市钦南区犀牛脚镇大环社区村民杨富国说。今年2月,杨富国出海捕鱼时，70多岁老父亲突发车祸，由于家中无人照料，他心急如焚。关键时刻，社区党员服务队迅速联系医疗机构，让老人得到及时治疗，并帮助办理医保报销事宜，这份跨越山海的温暖，让漂泊海上的杨富国吃下了&ldquo;定心丸&rdquo;。</p>\r\n<p>钦南区有522.6公里海岸线，5000余名渔民从事海上养殖和渔业生产。近些年来，钦南区创新实施&ldquo;潮汐行动&rdquo;，组建53支党员服务队，奔走在7个沿海乡镇46个渔村，用精细化服务守护渔村&ldquo;一老一小&rdquo;。</p>\r\n<p>织密&ldquo;帮扶网&rdquo;，以党员为主体，镇党委统筹整合村（社区）&ldquo;两委&rdquo;干部、村医、志愿者等人员力量，组建党员服务队，结合日常走访、主题党日、认领微心愿等活动，深入渔民家庭了解&ldquo;一老一小&rdquo;实际需求，建立一户一册&ldquo;需求档案&rdquo;，定期开展&ldquo;一对一&rdquo;或&ldquo;多对一&rdquo;结对联系服务。今年以来，累计上门走访服务2400多户渔民家庭。</p>\r\n<p>用好服务阵地，以村（社区）党群服务中心、农家书屋、新时代文明实践站等为依托，打造&ldquo;平时有问候、生活有服务、困难有帮助&rdquo;的邻里式服务模式。针对涉及&ldquo;一老一小&rdquo;健康维护、心理疏导、安全照护等需求，服务队通过开展&ldquo;潮汐护航课堂&rdquo;、&ldquo;健康潮声行动&rdquo;等活动，用心解决渔民急难愁盼。今年以来，共开展各类活动675次，服务渔民家庭老少群体超6100多人次。</p>'),
(31, '<div>2025年9月1日，习近平主席在&ldquo;上海合作组织+&rdquo;会议上郑重提出全球治理倡议，这是继全球发展倡议、全球安全倡议、全球文明倡议之后中国提供的又一重要国际公共产品，旨在同各国一道，推动构建更加公正合理的全球治理体系，携手迈向人类命运共同体。外交部随后发布的《全球治理倡议概念文件》，系统阐述了全球治理倡议的缘起、目标与实施重点，进一步彰显其作为引领全球治理体系变革的重要思想旗帜与中国方案的时代意义。</div>\r\n<div>当前，百年未有之大变局加速演进，世界进入新的动荡变革期。单边主义、保护主义逆流涌动，地缘冲突、热点问题此起彼伏，传统安全与非传统安全问题交织叠加，气候变化、公共卫生、人工智能治理等问题对全人类发展构成挑战。面对新形势，需要不断增强现行国际体系和国际机制的执行力、有效性，使之更符合变化的形势，更及时有效应对各种全球性挑战，更好服务各国特别是发展中国家利益。今年是联合国成立80周年、联合国2030年可持续发展议程提出10周年、《巴黎协定》达成10周年。在这样一个特殊的历史和时代节点，在全球治理走到新的十字路口的当下，中国提出全球治理倡议正当其时。全球治理倡议植根于中华优秀传统文化的深厚智慧，又彰显鲜明的时代精神，系统回答了&ldquo;由谁治理、如何治理、为谁治理&rdquo;等关键问题，为充满不确定性的世界注入了宝贵的稳定性和正能量。</div>\r\n<div>它奉行主权平等，明确&ldquo;由谁治理&rdquo;。倡议主张国家不分大小、强弱、贫富，都是国际社会的平等成员，其主权与尊严必须得到切实尊重。这从原则上保证了全球治理主体的普遍性与包容性，有助于打破少数国家垄断国际事务、主导议程设置的不公格局。</div>\r\n<div>它遵守国际法治，规范&ldquo;如何治理&rdquo;。坚定维护以国际法为基础的国际秩序，全面、充分、完整遵守联合国宪章宗旨和原则等公认的国际关系基本准则，主张以规则与制度协调国家关系、调节利益分配，旗帜鲜明地反对双重标准与&ldquo;规则霸权&rdquo;，确保全球治理始终沿着法治轨道有序运行。</div>\r\n<div>它践行多边主义，落实&ldquo;如何治理&rdquo;。倡议倡导真正的多边主义，核心是维护以联合国为中心的国际体系，反对单边主义与集团政治，推动各国通过对话协商、共建共享，共同应对全球性挑战，切实提升全球治理机制的公信力与执行力。</div>\r\n<div>它倡导以人为本，锚定&ldquo;为谁治理&rdquo;。倡议坚持以人民为中心的发展思想，回应各国人民对和平与发展、公平与正义、民主与自由的共同诉求，推动全球治理成果惠及所有国家与人群，特别关注发展中国家与弱势群体的切身利益。</div>\r\n<div>它还注重行动导向，确保治理效能。大道至简，实干为要。倡议不仅着眼理念引领，更强调务实行动与问题导向。它呼吁将发展置于全球宏观政策的突出位置，合力应对气候变化、公共卫生等紧迫议题，推动治理体系改革，彰显出鲜明的实践品格与现实关切。</div>\r\n<div>在全球治理倡议这五大核心理念中，奉行主权平等为首要前提、遵守国际法治为根本保障、践行多边主义为基本路径、倡导以人为本为价值取向、注重行动导向为重要原则。这些重要理念为改革完善全球治理体系指明了前进方向，为应对世界变局贡献了中国智慧。</div>\r\n<div>需要强调的是，全球治理倡议并非另起炉灶、推倒重来，而是对现有国际体系的改革与完善；不是中国一家的独奏，而是世界各国的合唱。它立足对历史潮流的深刻洞察，守联合国宪章之正，开全球治理之新，回应了各国人民对更加公正合理秩序的普遍期待。因此，倡议一经提出，便得到了国际社会尤其是广大发展中国家的广泛认同与积极响应。</div>\r\n<div>&ldquo;国治而后天下平。&rdquo;完善全球治理，中国一直在行动。中国方案的底气，源自自身卓有成效的治理实践。无论是历史性地解决绝对贫困问题，还是实现经济社会的长期稳定发展，中国在国家治理方面的成就为世界提供了可信赖的范本，也为中国参与和引领全球治理积累了宝贵经验。中国不仅是倡议的提出者，更是坚定的行动派：从积极参与联合国维和行动，到率先签署《区域全面经济伙伴关系协定》；从高质量共建&ldquo;一带一路&rdquo;，到主动开展人工智能全球治理、推动形成包容性国际框架&hellip;&hellip;中国一直以实际行动践行全球治理倡议所倡导的核心理念，充分表明中国始终是世界和平的建设者、全球发展的贡献者、国际秩序的维护者、公共产品的提供者。大道之行，天下为公。全球治理倡议以系统的理念架构、清晰的逻辑体系与务实的行动路径，为通向更加公正合理的全球治理体系提供了中国智慧与中国方案。</div>'),
(32, '<div>习近平总书记指出：&ldquo;今年是&lsquo;十四五&rsquo;规划收官之年，要在加紧落实规划目标任务的同时，适应形势变化，把握战略重点，科学谋划好&lsquo;十五五&rsquo;时期经济社会发展。&rdquo;五年规划并非中国独有，也不是中国首创，然而坚持接续编制和实施五年规划的唯有中国。五年规划已经成为我国社会主义现代化建设特色鲜明的实践，深嵌于中国特色社会主义制度之中。由此形成的坚持党中央集中统一领导、集中力量办大事、有效市场和有为政府相结合、&ldquo;一张蓝图绘到底&rdquo;和坚持全国一盘棋的制度优势，有力推动了我国经济社会发展、综合国力提升、人民生活改善，创造了世所罕见的经济快速发展奇迹和社会长期稳定奇迹。面向未来，坚持好、发挥好五年规划的制度优势，对于以中国式现代化全面推进强国建设、民族复兴伟业具有重大意义。</div>\r\n<div><strong>坚持党中央集中统一领导的制度优势</strong></div>\r\n<div>习近平总书记指出：&ldquo;用中长期规划指导经济社会发展，是我们党治国理政的一种重要方式。&rdquo;自1953年实施第一个五年计划起，我国已经接续编制和实施了14个五年规划（计划）。坚持党中央集中统一领导，确保了规划在编制中充分体现党的战略意图，也确保规划实施中能够有效调动和汇聚各方力量，为把我国从一个积贫积弱的农业国建设成为世界第一制造业大国、世界第二大经济体并向全面建成社会主义现代化强国目标迈进提供了坚强保障。</div>\r\n<div>新中国成立之初，我国的基本国情是&ldquo;一穷二白&rdquo;，工业基础十分薄弱，&ldquo;一辆汽车、一架飞机、一辆坦克、一辆拖拉机都不能造&rdquo;。为了改变这一面貌，我们党致力于实现&ldquo;使中国由农业国变为工业国&rdquo;的宏伟目标，把落后的农业大国建设成为社会主义工业化国家。1951年，党中央决定编制第一个五年计划，并于1953年付诸实施，通过确立和实施重工业优先发展战略，建设156项重点工程等，为我国的工业化奠定初步基础。此后，除了国民经济调整时期外，我国接续编制和实施了&ldquo;二五&rdquo;至&ldquo;五五&rdquo;计划，对建立起独立的比较完整的工业体系和国民经济体系、把我国从一个农业大国转变为一个初具规模的工业化国家发挥了重要作用。</div>\r\n<div>改革开放后，我们党对我国社会主义现代化建设进行新的部署，明确提出&ldquo;三步走&rdquo;战略。党的十四大确立了建立社会主义市场经济体制的改革目标。五年规划的功能、内容和形式也相应调整。&ldquo;六五&rdquo;计划将国民经济计划更名为&ldquo;国民经济和社会发展计划&rdquo;，&ldquo;十一五&rdquo;规划将&ldquo;计划&rdquo;更名为&ldquo;规划&rdquo;。五年规划在推进社会主义现代化建设、引领经济社会发展中所起的作用更加凸显。这个时期，中国经济发展进入快车道，国内生产总值先后超过意大利、法国、英国、德国，2010年超过日本，成为世界第二大经济体，跨入上中等收入国家行列，社会主义现代化建设的物质基础更加巩固。</div>\r\n<div>党的十八大以来，中国特色社会主义进入新时代。党的十九大确立了将实现第二个百年奋斗目标分为两个阶段安排的战略部署。党的二十大擘画了全面建成社会主义现代化强国、实现第二个百年奋斗目标的宏伟蓝图。习近平总书记亲自担任&ldquo;十三五&rdquo;&ldquo;十四五&rdquo;规划建议文件起草组组长，亲自谋划、亲自推动五年规划编制工作。&ldquo;十三五&rdquo;规划建议聚焦全面建成小康社会目标，强调必须牢固树立创新、协调、绿色、开放、共享的发展理念。&ldquo;十四五&rdquo;规划建议以推动高质量发展为主题，以深化供给侧结构性改革为主线，围绕创新驱动、产业升级、绿色发展等重大战略作出系统部署，为开启全面建设社会主义现代化国家新征程提供了行动指南。这个时期，在五年规划的引领下，我国经济实力、科技实力、综合国力和人民生活水平跃上新的大台阶，开创了中国式现代化的崭新局面。</div>\r\n<div>中国特色社会主义最本质的特征是中国共产党领导，中国特色社会主义制度的最大优势是中国共产党领导。党中央集中统一领导在五年规划编制和实施中发挥了定海神针作用。每一次编制五年规划，党中央都提出关于制定五年规划的建议，阐明经济社会发展指导方针、主要目标和重点任务，把党的主张转化为国家意志。在编制过程中，我们党广泛征求社会各界意见，充分吸收民智民意，使五年规划充分反映专家意见、群众智慧、社会期盼，凝聚全社会共识，激发全体人民奋斗力量。在实施过程中，党发挥总揽全局、协调各方的作用，保证规划高效实施。总之，我们党通过五年规划这一治国理政方式，凝聚起广大人民群众的智慧，形成推进中国式现代化势不可挡的磅礴力量。</div>\r\n<div><strong>集中力量办大事的制度优势</strong></div>\r\n<div>习近平总书记指出：&ldquo;我们最大的优势是我国社会主义制度能够集中力量办大事。这是我们成就事业的重要法宝。&rdquo;集中力量办大事是我国&ldquo;赶上时代&rdquo;，自立于世界民族之林的战略选择。新中国成立之初，为尽快改变落后面貌，我们通过实施五年计划，将有限人力、物力、财力集中起来推动工业化，在&ldquo;人均钢铁产量只够打一把镰刀&rdquo;的条件下，在较短时间里建成了独立的比较完整的工业体系和国民经济体系。改革开放后，通过实施五年规划调动各方面资源和力量，保障实施&ldquo;三步走&rdquo;战略。&ldquo;七五&rdquo;时期，我国基本上解决了人民温饱问题；&ldquo;九五&rdquo;时期，人民生活总体达到小康水平；&ldquo;十一五&rdquo;时期，我国实现了从进入下中等收入国家行列向进入上中等收入国家行列的跨越。党的十八大以来，五年规划对引领经济社会发展的作用更加凸显。&ldquo;十三五&rdquo;时期决胜全面建成小康社会取得决定性成就，为开启全面建设社会主义现代化国家新征程奠定了扎实基础。即将收官的&ldquo;十四五&rdquo;规划，引领我国经济规模稳步增长、质量显著提升、结构持续优化，推动全面建设社会主义现代化国家迈出坚实步伐。可以说，正是集中力量办大事的制度优势，才使我国实现了跨越式发展，用几十年的时间走完西方发达国家几百年走过的工业化历程，彰显出强大的制度优势。</div>\r\n<div>集中力量办大事，集中力量是前提，集中优势资源才能办大事、办成大事。新中国成立以来，我国之所以能够在重大工程建设、重大科技攻关、精准脱贫攻坚、推进绿色发展、防范化解重大风险等方面取得一系列重大成果，关键就在于发挥集中力量办大事的制度优势。近年来，在科技创新领域，面对个别国家的&ldquo;脱钩断链&rdquo;和&ldquo;小院高墙&rdquo;，正是依靠集中力量办大事的制度优势，加快健全新型举国体制，强化国家战略科技力量，整合优势科技资源，开展关键核心技术联合攻关，我国在量子科技、生命科学、物质科学、空间科学等领域取得一批重大原创性成果，全球创新指数排名跃升至第十位，实现高水平科技自立自强的步伐明显加快。当前，世界百年变局加速演进，不稳定、不确定、难预料因素增多。面对更加严峻复杂的外部环境，更需要用好集中力量办大事的制度优势。</div>\r\n<div>五年规划是集中力量办大事的重要实现形式。五年规划按照中国式现代化的顶层设计，确定每个五年期的发展目标、重点任务、重大工程和重要举措，也就是明确每个阶段的&ldquo;大事&rdquo;。在此基础上，通过专项规划、区域规划，形成&ldquo;施工蓝图&rdquo;，并动员各方面资源向重点领域和关键环节汇聚，引导各类资源高效优化配置，促进全社会协同发力，也就是要办成&ldquo;大事&rdquo;。同时，通过接续编制和实施五年规划，保持中国式现代化进程的连续性，一个五年接着一个五年干，不断构筑起中国式现代化的宏伟大厦。</div>\r\n<div><strong>有效市场和有为政府相结合的制度优势</strong></div>\r\n<div>习近平总书记指出：&ldquo;中长期发展规划既能充分发挥市场在资源配置中的决定性作用，又能更好发挥政府作用。&rdquo;改革开放以来，随着社会主义市场经济体制的建立和完善，五年规划的功能、内容和形式也随着时代发展不断调整完善。从性质看，从早期计划经济体制下的指令性计划调整为指导性计划，再调整为社会主义市场经济体制下的战略性、纲领性、指导性规划；从理念看，从追求发展速度转向注重发展质量，再到更加注重促进人的全面发展和社会全面进步；从内容看，从微观经济活动管理转向加强对宏观经济的战略性引领，从经济建设扩展到经济社会发展，再扩展为经济建设、政治建设、文化建设、社会建设、生态文明建设&ldquo;五位一体&rdquo;总体布局；从指标看，从以经济指标为主，扩展到吸纳更多社会、文化、绿色发展等方面的指标；从实施看，从政府主导转变为有效市场和有为政府相结合。</div>\r\n<div>五年规划是有效市场和有为政府更好结合的重要制度载体。自党的十四大确立社会主义市场经济体制的改革目标以来，五年规划都注重对改革完善社会主义市场经济体制作出部署。比如，《中共中央关于制定国民经济和社会发展第十四个五年规划和二〇三五年远景目标的建议》强调，充分发挥市场在资源配置中的决定性作用，更好发挥政府作用，推动有效市场和有为政府更好结合。五年规划将党和国家的发展理念、战略意图、主要目标、重点任务和重大举措统一发布，给经营主体明确的发展方向和预期；五年规划将发展和改革统一起来，推动发展目标任务与改革重大举措相结合，既通过改革推动高质量发展，又着力构建高水平社会主义市场经济体制；五年规划加快市场基础设施联通，推动完善要素市场制度和规制，加快构建全国统一大市场，更好发挥市场配置资源的决定性作用。可以说，社会主义市场经济条件下的五年规划是以市场机制为基础，促进有效市场和有为政府更好结合的发展规划。</div>\r\n<div>编制和实施五年规划，是政府更好发挥作用的重要方式。规划是中长期发展之纲。五年规划阐明国家战略意图，明确政府工作重点，优化公共资源配置，引导规范经营主体行为，是政府对经济社会发展的战略引领。不同于短期的宏观调控，这种引领是战略性的，是为实现国家战略目标、从国家整体利益和长远利益出发对中长期经济社会发展进行的总体部署，以推动市场自发作用下的发展过程向有利于实现战略目标的发展过程转换。正是通过五年规划更好发挥政府的&ldquo;有为&rdquo;，才能有效推动我国持续向全面建成社会主义现代化强国的目标迈进。</div>\r\n<div><strong>&ldquo;一张蓝图绘到底&rdquo;的制度优势</strong></div>\r\n<div>习近平总书记指出：&ldquo;从第一个五年计划到第十四个五年规划，一以贯之的主题是把我国建设成为社会主义现代化国家。&rdquo;一个国家、一个民族要有共同的奋斗目标。中国人民的共同奋斗目标，就是要全面建成社会主义现代化强国、实现中华民族伟大复兴。五年规划是确保实现共同奋斗目标的重要手段，也彰显了&ldquo;一张蓝图绘到底&rdquo;的制度优势。</div>\r\n<div>&ldquo;一张蓝图绘到底&rdquo;彰显了着眼长远的战略定力。中国共产党是有着远大而坚定理想的政党，保持战略定力和历史耐心，不断推进强国建设、民族复兴伟业。正是保持这种战略定力和历史耐心，才能让我们不为风高浪急所扰，不为一时一事所惑，向着既定目标迈进。从1953年新中国开始实施第一个五年计划，到今年&ldquo;十四五&rdquo;规划即将收官，70多年间国际环境风云变幻，我国发展之路并不平坦。但我们始终以实施一个又一个五年规划的坚定不移，将中国式现代化推向前进，充分彰显了&ldquo;一张蓝图绘到底&rdquo;的战略定力。</div>\r\n<div>&ldquo;一张蓝图绘到底&rdquo;彰显了坚持不懈的奋斗精神。全面建成社会主义现代化强国、实现中华民族伟大复兴，不可能毕其功于一役，实施五年规划是新长征路上的&ldquo;接力跑&rdquo;，必须一棒接着一棒跑下去，每一棒都要为下一棒跑出一个好成绩。纵观我国已经实施的14个五年规划（计划），从推进国家工业化到人民生活总体小康，再到全面建成小康社会、开启全面建设社会主义现代化国家新征程，五年规划如同历史的刻度，标记着中国式现代化的历史进程。党的十八大以来，以习近平同志为核心的党中央团结带领全国各族人民共同奋斗，在中华大地上全面建成小康社会，实现第一个百年奋斗目标，开启全面建设社会主义现代化国家新征程，并将在胜利完成&ldquo;十四五&rdquo;规划目标任务基础上，接续实施&ldquo;十五五&rdquo;规划，向着第二个百年奋斗目标坚定迈进。</div>\r\n<div><strong>坚持全国一盘棋的制度优势</strong></div>\r\n<div>2016年1月，习近平总书记在省部级主要领导干部学习贯彻党的十八届五中全会精神专题研讨班上指出：&ldquo;下好&lsquo;十三五&rsquo;时期发展的全国一盘棋，协调发展是制胜要诀&rdquo;；在今年4月30日主持召开部分省区市&ldquo;十五五&rdquo;时期经济社会发展座谈会时指出：&ldquo;要深入研究优化区域布局、促进区域协调发展和巩固拓展脱贫攻坚成果、推进乡村全面振兴和城乡融合发展、加快农业农村现代化等方面的有效措施，稳步增加城乡群众收入。&rdquo;坚持全国一盘棋，既要考虑&ldquo;全局之所需&rdquo;，把国家发展总目标分解为不同层级、不同类别的子目标，落实到区域规划中，以确保国家发展总目标的实现，又要兼顾&ldquo;一域之所能&rdquo;，实施区域重大战略，推动各区域充分发挥比较优势，深化区际分工，促进各地区找准定位，更好融入国家发展大局。</div>\r\n<div>坚持全国一盘棋，有利于增强区域发展的协同性、联动性、整体性。我国幅员辽阔、区域差异大，下好发展的全国一盘棋，促进各地区按照比较优势进行分工，可以避免重复建设、同质化竞争与产业结构趋同。改革开放以来，每一个五年规划都高度重视通过区域经济布局下好发展的全国一盘棋。特别是本世纪以来，党中央先后实施了推进西部大开发、振兴东北地区等老工业基地、促进中部地区崛起等战略。&ldquo;十一五&rdquo;规划纲要明确提出&ldquo;坚持实施推进西部大开发，振兴东北地区等老工业基地，促进中部地区崛起，鼓励东部地区率先发展的区域发展总体战略&rdquo;。&ldquo;十二五&rdquo;规划纲要进一步强调要&ldquo;实施区域发展总体战略&rdquo;。党的十八大以来，以习近平同志为核心的党中央在坚持实施区域协调发展战略的同时，高质量推进京津冀协同发展、长江经济带发展、粤港澳大湾区建设、长三角区域一体化发展、黄河流域生态保护和高质量发展等区域重大战略的实施，从全局谋划区域，以区域服务全局，区域发展协调性进一步增强，推动形成全国一盘棋发展新格局。</div>\r\n<div>坚持全国一盘棋，有利于推进全国统一大市场建设。构建全国统一大市场，打通制约经济循环的关键堵点，促进人才、资金、技术、数据等生产要素跨区域流动，打破地方保护和市场分割，能够更好形成优势互补、高质量发展的区域经济布局。通过编制和实施五年规划，建设高标准联通的市场基础设施，完善现代物流体系，健全现代商贸流通体系，降低全社会物流成本和交易成本，促进商品要素资源在更大范围内顺畅流动，提高市场运行效率和资源配置效率，能够更好联通国内国际两个市场，为构建新发展格局提供强大支撑。</div>\r\n<div>当前，世界之变、时代之变、历史之变正以前所未有的方式展开，科学制定&ldquo;十五五&rdquo;规划使命在肩。面向未来，我们要坚持好、发挥好五年规划的制度优势，让五年规划汇聚起全国人民推进强国建设、民族复兴伟业的磅礴力量，把中国式现代化推向更加光明的未来。</div>'),
(38, '<h3 style=\"text-align: center;\">从&ldquo;异乡客&rdquo;到&ldquo;筑梦人&rdquo;</h3>\r\n<h3 style=\"text-align: center;\">&mdash;&mdash;记河南省信阳市固始县高级中学副校长郭慧茹</h3>\r\n<p>清晨的固始高中校园里，总能看到郭慧茹步履轻快而坚定的身影。她时而俯身与学生亲切交谈，时而埋首与同事探讨教学。22年前，大学毕业，她从家乡河南濮阳来到信阳这片红色热土，从此扎根固始教育沃土，将最美的青春年华奉献给了这里的孩子们。二十二载光阴流转，她始终坚守讲台。&ldquo;课堂才是教师的根。&rdquo;她说。她用爱心点亮希望，用智慧浇灌未来，默默为革命老区的教育事业添砖加瓦。</p>\r\n<p><strong>一步一印，筑牢教育基石</strong></p>\r\n<p>初到固始时，比起饮食上的不适，更让郭慧茹感到压力的是面对学生时的紧张与稚嫩。但她从不服输，一有空就深入老教师的课堂观摩学习，不断积累经验。渐渐地，她摸索出了自己的教学方法，后来担任班主任工作，教学也越来越得心应手。</p>\r\n<p>&ldquo;学高为师，身正为范&rdquo;是她的座右铭。即便走上管理岗位，她依然坚守教学一线。有人问：&ldquo;都是副校长了，何必这么拼？&rdquo;她只是微微一笑，转身又站回讲台，继续做那个离不开学生的班主任。</p>\r\n<p>春风化雨二十二载，郭慧茹所带的班级先后培养出24名清华、北大学子，更有河南省理科第一名谢远航、信阳市理科第一名程志立等优秀学生。面对这些沉甸甸的育人成果，她目光坚定：&ldquo;我还想再干20年！&rdquo;</p>\r\n<p><strong>一言一行，做好爱心&ldquo;妈妈&rdquo;</strong></p>\r\n<p>&ldquo;不仅要关心学生飞得高不高，更要关心他们飞得累不累。&rdquo;郭慧茹始终把学生的身心健康放在首位。</p>\r\n<p>她是老师，是班主任，是副校长，更是孩子们信赖的&ldquo;郭妈妈&rdquo;。她一次次走近陷入情绪低谷的学生，用耐心陪伴他们走出阴霾；她发短信鼓励生病住院的副班长，用温暖的话语助他战胜病痛；她时刻关注困难学子，积极为他们争取政策帮扶、送上温暖关怀。</p>\r\n<p>在纪念中国人民抗日战争暨世界反法西斯战争胜利80周年阅兵式当天，郭慧茹收到2018届学生周挺发来的信息：&ldquo;老师看阅兵式了吗？倒数第二个梯队就是我们单位，我差点就上了！&rdquo;她欣慰地回复：&ldquo;你还年轻，未来可期！&rdquo;那个曾被北大和空军航空大学同时录取的少年，如今已驾驶歼-10战机，将&ldquo;强国有我&rdquo;的誓言写在蓝天上。从青涩学子到蓝天卫士，周挺的成长正是郭老师育人成果的生动写照。</p>\r\n<p><strong>一心一意，争做&ldquo;她&rdquo;先锋</strong></p>\r\n<p>高中教学不仅考验学生，更考验教师的执着与担当。作为河南省学术技术带头人，在课程改革浪潮中，郭慧茹始终勇立潮头。她深耕教材，钻研新课标，博览教育专著，持续更新教育理念。她主持的课题《县域高中校级名师工作室发展模式探究》获得良好等次，带领团队总结出的&ldquo;三环六步&rdquo;教学法，有效推动了课堂教学转型，提升了全校教科研水平。</p>\r\n<p>在她的引领下，固始高中先后获评&ldquo;河南省教育科研基地校&rdquo;&ldquo;新课程新教材实施省级示范校&rdquo;&ldquo;普通高中语文省二级学科基地&rdquo;，被中共信阳市委、信阳市人民政府授予&ldquo;集体三等功&rdquo;。作为女性教育工作者、省妇代会代表和市人大代表，她还积极建言献策，为教育发声、为妇女儿童代言。她提出的改善办学条件、加强教师队伍建设、关注青少年心理健康等建议，受到相关部门高度重视。她用实际行动诠释：教育，是使命，更是情怀。</p>\r\n<p><strong>育木成林，静待参天</strong></p>\r\n<p>记者短评</p>\r\n<p>万程同</p>\r\n<p>岁月如歌，吟咏桃李芬芳；年轮流转，初心始终炽热。郭慧茹扎根教学一线二十二载，以三尺讲台为阵地，以赤诚之心为基石，坚定守望教育事业。她不问收获、只问耕耘，将最美好的年华奉献给了&ldquo;异乡&rdquo;的孩子们。</p>\r\n<p>她教书，不为培养多少&ldquo;状元&rdquo;，而为点亮学生心中的明灯；她育人，不为博取多少赞誉，而为守护每一片成长的蓝天。从青涩教师成长为教学中坚，她始终坚守讲台，从未离开学生。</p>\r\n<p>她说：&ldquo;教育是一场温暖的修行，是以生命影响生命，以灵魂唤醒灵魂。&rdquo;她将每一个孩子视为一颗独特的种子，用心浇灌、静待参天。郭慧茹以实际行动诠释新时代女性的责任担当与精神风采，用爱心与责任谱写了一曲感人至深的教育赞歌。</p>'),
(39, '<p>&ldquo;我29岁离开家时，带着60万现金闯深圳。&rdquo;作为黄石市楚商联合会常务副会长、第二届黄石&ldquo;双招双引&rdquo;大使，何红玲的创业历程始终绕不开家乡黄石。</p>\r\n<p>从2004年带着两箱行李奔赴深圳，到如今每年往返深黄两地数十次，她用二十年时间完成了从&ldquo;闯深圳&rdquo;到&ldquo;带深圳资源回黄石&rdquo;的转身，成为黄石楚商回乡，服务全省支点建设的生动缩影。</p>\r\n<p><strong>出走黄石闯深圳</strong></p>\r\n<p>2004年深秋，29岁的何红玲踏上了去往深圳打拼的征程。当年的何红玲经过打拼，已经在黄石积累了第一桶金：&ldquo;我爱人是福建人，总听他说福建人在深圳做实业的多，遍地是机会。&rdquo;</p>\r\n<p>就这样，何红玲带着60万元现金，满怀豪情地前往深圳。在福建亲戚的带动下，何红玲与港资方合伙在龙华文华路开了家酒楼，那是她深圳事业的起点。在与当地客家人频繁打交道的过程中，何红玲迎来了新的机遇。</p>\r\n<p>2007年，何红玲与龙华当地的一个村合作建房。&ldquo;那时候，我对房地产行业知之甚少。&rdquo;何红玲坦言，这还不是最难的，后来合伙人的退出，再加上现金投资的压力，让何红玲倍感辛苦。</p>\r\n<p>不过，对于敢想敢拼的何红玲来说，困难也是挑战。两年之后，有3栋14层高楼的红林雅居顺利竣工，在周边低矮厂房中格外醒目。&ldquo;当时，这几栋楼成了远近闻名的地标。&rdquo;再一次品尝到成功滋味的何红玲也逐渐在深圳站稳了脚跟。</p>\r\n<p><strong>抱团黄商连家乡</strong></p>\r\n<p>&ldquo;自己在深圳根基稳了之后，就开始惦记起家乡，毕竟我家人都在黄石，这份情感还是割舍不掉的。&rdquo;事实上，也正是这份家乡情结，让何红玲萌发了成立深圳黄石商会的想法。</p>\r\n<p>&ldquo;当时，经常有我们黄石的相关负责人过来召开黄石招商推介会，但是却没有黄石商会来对接。&rdquo;更让何红玲触动的是，不少在深圳发展的湖北县市区，诸如宜昌、襄阳、黄冈、浠水等都成立了商会。</p>\r\n<p>&ldquo;当时，还有别的商会拉我进去。我说开玩笑，我生长在黄石，怎么可能黄石不成立一个商会。&rdquo;何红玲说，对于一座城市的发展和招商来说，成立异地商会是必须做的事情，对于提升城市知名度、吸引外地发展资源都是有利的。</p>\r\n<p>2019年，在黄石市工商联的支持下，深圳黄石商会成立。2022年，何红玲返乡的步伐更密集了，&ldquo;仅2022年，我们就往返深圳、黄石多次，与黄石市招商局联系，并不断为深圳各大优秀企业牵线搭桥。&rdquo;在这个过程中，何红玲获评黄石市&ldquo;双招双引&rdquo;大使，黄石市为她颁发了&ldquo;招商突出贡献奖&rdquo;。</p>\r\n<p><strong>两地熟变两地兴</strong></p>\r\n<p>2022年9月，湖北比沃斯光电有限公司、湖北百仑文化发展有限公司、湖北中青瑞吉稀土科技有限公司在黄石科技城完成注册并签约入驻；2023年6月，西子电梯科技有限公司在黄石完成用地选址，正在做一期建设规划设计；2023年7月，水大陆（湖北）生态科技发展有限公司在黄石科技城完成注册并签约入驻&hellip;&hellip;这是一份2022年异地黄石商会引荐项目统计汇总表，在这些项目的最后备注栏，均标注有&ldquo;何红玲引荐&rdquo;字样。而在通过异地商会反哺家乡黄石的发展上，何红玲远还做了更多。</p>\r\n<p>&ldquo;说实话，成立商会，我更多的是想把黄石的城市名片打出去，让更多人知道黄石、了解黄石、投资黄石。&rdquo;在何红玲看来，黄石这样一座秀美、灵动的山水之城，值得被更多人认识。而客商的反馈，也真切印证了她的想法。</p>\r\n<p>广东深圳地区的客商对于山水有着独特的偏好，但故事再讲得好，总不及亲眼所见来得真切。于是，2022年以来，在何红玲的引荐下，多批次客商亲身来到黄石，感受这座山水名城的魅力，&ldquo;他们踏到黄石这片山水之后，纷纷感叹城市很好、很美。&rdquo;何红玲坦言，这么多批次的客商过来，也有没签约成功的，但通过深圳黄石商会这个窗口，许多外地的企业家对黄石留下了好印象。用何红玲的话来说，&ldquo;不成也算是交上了一个新朋友。&rdquo;</p>\r\n<p>近年来，深圳黄石商会做实大湾区产业外溢文章，推动电子信息产业、光芯屏端网产业等一批优质企业落户黄石。截至目前，深圳黄石商会先后招引、协调黄石各级党政团体赴深圳考察企业（项目）55家，邀请深圳企业赴黄石考察30余次，成功引荐7家企业入驻科技城，总投资达20亿元。</p>\r\n<p>如今，在何红玲的带领下，深圳黄石商会在连接深黄两地上发挥更大作用，双向互动让合作更顺畅，&ldquo;现在企业来考察，不用等政府安排，商会直接对接，效率提高了一倍。&rdquo;何红玲说。</p>\r\n<p><strong>在公益里写大爱</strong></p>\r\n<p>在何红玲的推动下，如今的深圳黄石商会加持了&ldquo;科创飞地&rdquo;&ldquo;公益中心&rdquo;&ldquo;政企平台&rdquo;等属性。而在何红玲本人豪爽、热心的性格加持下，深圳黄石商会在为年轻人创造机会的同时，还操心起了他们的&ldquo;人生大事&rdquo;。</p>\r\n<p>&ldquo;300多个会员，基本是年轻人。他们当中很多都是从黄石走出来的人才，但由于平时忙工作，不少人的个人问题成了老大难。&rdquo;精准对接一番之后，每逢节假日，何红玲都会搞起联谊会，引导年轻人之间形成互动。渐渐地，她从别人口中的&ldquo;红姐&rdquo;变成了&ldquo;红娘&rdquo;。</p>\r\n<p>从何红玲骨子里透出的这种热心，在公益和大爱上有着更多体现。疫情期间，何红玲得知黄石防疫物资紧缺，当即从深圳采购20多万元的口罩、防护服等防疫物资，并以个人名义捐款8万元。在深圳，她给红林雅居的租户减免了一年到一年半租金，总计近百万。</p>\r\n<p>在深圳的黄石老乡圈里，&ldquo;有事找红姐&rdquo;成了大家的共识，&ldquo;我不怕麻烦，也不图回报，说到底，还是心里的那份家乡情结。&rdquo;何红玲说。</p>\r\n<p>2024年，何红玲提出&ldquo;2.0版黄商回归计划&rdquo;&mdash;&mdash;不仅要引项目，更要引技术、引人才，让黄石融入大湾区产业链。对于&ldquo;楚商回乡共建支点&rdquo;的意义，何红玲有自己的理解。&ldquo;不是说赚了钱回来捐多少，而是把外面的理念、技术、资源带回来，让家乡跟上时代。&rdquo;</p>\r\n<p>如今的何红玲依然忙碌，依旧在深黄两地来回奔波。对于商会未来发展，何红玲信心满满、豪情满怀，&ldquo;要继续把我们的家乡推介宣传出去，要么就不举这个旗，举就要努力举好了。&rdquo;在何红玲看来，黄石和深圳的发展有同频的地方。未来，在产业融合，科技融合、文旅融合等方面，深圳黄石商会在连接深黄两地上将持续大有作为。</p>'),
(40, '<p>在黑龙江省佳木斯市汤原县香兰镇中学，有一位教师，身形娇小，乌黑的波浪卷发披在双肩，一双充满智慧与温柔的眼睛，眼神中透着坚定与热忱，仿佛藏着无数关于教育的梦想与希望，她叫王昕欣。</p>\r\n<p>王昕欣出生在一个教育世家，姥爷、姥姥和妈妈都扎根乡村教育。&ldquo;小时候我就坐在教室一角，看着妈妈在讲台上讲课，黑板上的粉笔字写了又擦，擦了又写。能将自己所知传递给更多需要的人，我认为老师是一个很神圣的职业。&rdquo;王昕欣心里想着，&ldquo;长大后，我要像妈妈一样，当老师，教学生！&rdquo;在家庭氛围的熏陶下，教书育人对她来说，是与生俱来的使命。</p>\r\n<p>2015年，王昕欣从哈尔滨师范大学英语专业毕业。同年，教育部主办的&ldquo;播种未来与希望&rdquo;特岗教师巡回报告会走进她的母校，5位乡村教师扎根乡村教育一线的故事深深打动了她。她毅然决然回到了家乡，成了&ldquo;王老师&rdquo;，踏上了那条小时候走过无数次的山路。</p>\r\n<p>初到村小，闲暇时，王昕欣会给班里女孩子们扎头发、剪指甲，和孩子们一起在萝卜地、土豆地劳作，教孩子们用英语说出各种蔬菜的名字，让孩子们在欢乐中学习。</p>\r\n<p>一次，她发现班里有同学父母离婚，孩子变得沉默寡言。王昕欣看在眼里，疼在心里，便在生活上给予这个孩子更多爱与温暖。她经常找孩子谈心，送孩子学习用品，孩子也感受到了这份温暖，会悄悄把喜欢的小雪人彩泥放在她桌上。从那时起，她就想尽办法为孩子们送温暖，在团县委支持下，通过腾讯公益&ldquo;爱心衣橱&rdquo;项目为全校150名孩子申请到棉衣，当崭新的棉衣发到孩子们手中时，他们脸上洋溢着幸福的笑容，这个冬天也变得格外温暖。</p>\r\n<p>2017年王昕欣被分岗到香兰镇中学任教。香兰镇中学生源覆盖周边53个自然村，学生分散，家访难度大。起初王昕欣独自家访，遇到雨雪天，道路泥泞不堪，她深一脚浅一脚地走在乡间小路上。后来和爱人一起，如今全校老师都参与进来，组成家访小分队，有组织地开展家访。对于留守儿童、单亲家庭的孩子，她更是给予了格外的关爱。她创建了微信视频号&ldquo;香中育梦星辰闪烁&rdquo;，用来发布孩子们参加活动的内容，让家长们无论在哪里都能看到孩子在学校的情况。家长们纷纷点赞留言，表达对她的感谢。</p>\r\n<p>她所教的班级单亲家庭、贫困家庭、留守儿童多，家访中她收获了许多感动。小博爷爷奶奶送她时那饱含嘱托与期望的目光，小诺离别时渴望拥抱的请求，还有小旭在她辅导下英语成绩大幅提升&hellip;&hellip;</p>\r\n<p>&ldquo;王老师就像我们的大姐姐一样，她总是那么温柔，那么有耐心。&rdquo;学生们常常这样评价她。&ldquo;有一次我考试没考好，心情特别低落，王老师发现后，不仅耐心地给我讲解错题，还一直鼓励我，让我重新找回了自信。&rdquo;学生小旭感激地说道。</p>\r\n<p>在同事的眼中，王昕欣是一位充满活力和创造力的教师。&ldquo;她总是能想出各种新颖的教学方法，把枯燥的英语课堂变得生动有趣，我们都很佩服她。&rdquo;同事吕俊毅老师称赞道，&ldquo;而且她对学生的那种关爱，真的让我们很感动，她总是默默地为学生们付出，从不计较个人得失。&rdquo;</p>\r\n<p>王昕欣深知，乡村学生英语基础薄弱，学校教学资源有限。如何才能提高学生成绩？她不断探索，率先将AR技术融入课堂，枯燥的单词变成了可爱的动画形象，课文中的场景变得栩栩如生。</p>\r\n<p>当孩子手捧课本问她&ldquo;青花瓷是什么&rdquo;时，她意识到孩子的课堂不仅仅是在学校，还要见多识广，扩宽视野。于是她决定带学生们走进实验室、博物馆，让学生们在虚拟与现实的结合中，感受知识的魅力，调动大家的学习兴趣。第九届亚冬会召开之前，王昕欣还带学生们通过视频认识了不少冬季运动项目，教学生们用英语介绍这些项目，学生们不仅学到了知识，还能用英语向外国游客介绍家乡的美。</p>\r\n<p>王昕欣在教育事业上成绩斐然，2023年入选优秀特岗教师巡回报告团成员，赴武汉参加集训。在巡回报告团成员座谈会上发言汇报时，她分享了自己的教学故事和心得，得到同仁们的鼓励与肯定。</p>\r\n<p>同年9月，作为全国百名优秀乡村教师代表走进杭州亚运场馆，现场的热烈氛围让她心潮起伏，她迫不及待地和孩子们连线分享亚运盛况，让孩子们也感受到那份激情。</p>\r\n<p>2023年教师节，她在全省师德报告会上讲述和孩子们的故事，朴实的话语、真挚的情感，打动了在场的每一个人，事迹在全省教育系统展播。2024年，她荣获全国优秀教师称号；2025年，荣获全国优秀少先队辅导员荣誉称号。这是对她多年付出的高度认可。</p>\r\n<p>2025年教师节前夕，王昕欣很荣幸作为全国8位优秀教师代表之一致信习近平总书记，把扎根基层教育的心里话讲给总书记听。当她收到总书记的回信时，心情无比激动，泪水夺眶而出。她说，总书记的回信是对她和所有扎根基层教育工作者的最大鼓舞和肯定。</p>\r\n<p>不久前，她收到了高三学生的消息，许多学生的志愿都是报考师范类，选择回乡从教，续写&ldquo;长大之后，我要成为你&rdquo;的故事。王昕欣动情地说：&ldquo;人们常用蜡烛、园丁和灯塔比喻教师这个职业，而我更喜欢蒲公英，它深深地扎根于广袤的乡村大地，却将种子播撒四方，年复一年，永不停息。我不苛求每一名学生都能成长为&lsquo;参天大树&rsquo;、国之栋梁，我要他们开心、自信、自强，哪怕只是一棵&lsquo;小草&rsquo;，也要活出精彩的人生。&rdquo;</p>'),
(41, '<p>作为合肥聚能电物理高技术开发有限公司制造中心副主任、高级技师的陈建林，负责EAST核心部件的总装与调试，这些年来，他一直在守护&ldquo;小太阳&rdquo;。</p>\r\n<p>全超导托卡马克实验装置（EAST），又称人造太阳，其中的核心部件之一&mdash;&mdash;内嵌式低温泵就是陈建林在守护。</p>\r\n<p>1990年9月，陈建林进入合肥聚能电物理高技术开发有限公司任精密装配车间钳工，其间，他在不断充实自己技能的同时，也逐渐融入了这个处处&ldquo;科里科气&rdquo;的团队。2000年，他与EAST装置结缘，当时，装置正在建设中，而陈建林负责的，正是内置式低温泵的总装工作。</p>\r\n<p>&ldquo;这套用于核聚变装置内置式液氦条件低温泵，保障着EAST实现高参数条件下的等离子长脉冲放电。&rdquo;陈建林说，&ldquo;由于低温泵的环体部件加工工序繁多，总装精度要求高，需要像外科医生一样，将每一段环体部件精准控制在毫厘之间，一旦误差超出要求，重新寻找原因消除误差将会影响EAST总装整体进度。&rdquo;</p>\r\n<p>装配的那段时间对陈建林来说，连做梦都在想着如何能精准地安装到位。最终，陈建林不仅实现了一次性总装成功的目标，并且测量数据完全符合设计要求，至今，这套低温泵系统已在EAST装置内部运行十余年，性能稳定，运行良好。</p>\r\n<p>国际热核聚变实验堆（ITER）计划是目前全球规模最大、影响最为深远的国际大科学工程。作为ITER大型超导磁体馈线系统（FEEDER）总装负责人，陈建林要完成世界上载流最高的52kA及68kA电流引线，以及CS及PFPF内馈线、CS、PF及TF终端盒以及高压诊断线盒总装工作。</p>\r\n<p>起初，外方专家并不相信陈建林可以完成，面对外方专家的质疑，陈建林决心啃下这块&ldquo;硬骨头&rdquo;。凭借多年来积累的大科学装置一线工程经验，与技术人员一起，经过反复试验，在掌握大量第一手的实验数据基础上，成功实现最高参数全电流52kA稳态和57kA过流运行。</p>\r\n<p>面对鲜花与掌声，陈建林脚步不歇。</p>\r\n<p>在国家大科学工程中国散裂中子源（CSNS）的研制过程中，陈建林负责RCS主准直器、次准直器、主剥离膜等多项核心部件总装工作。</p>\r\n<p>在国家重大科研装备研制项目上海光源&ldquo;梦之线&rdquo;中，陈建林负责双椭圆极化波荡器（DEPU）核心部件中铝梁和磁结构的总装工作。</p>\r\n<p>作为首席技师，陈建林一次又一次出色地完成任务。</p>\r\n<p>如今的陈建林，奖章无数、荣誉无数，他现在想的，是如何在有限的时间里把技术更多地传承下去。在陈建林的带领下，公司的精密总装车间已从最初的十余人充实到近百人，先后培养出多名技能能手和技术骨干，陈建林带着这支团队奋战在各大科学工程的一线，攻坚克难，为大科学装置建设注入更多动能。</p>\r\n<p>&ldquo;探索未来的过程中，需要我们更深入、更细致地思考与研究，我现在能做的就是守护好国之重器。&rdquo;陈建林说。</p>'),
(42, '<p>儿时的白玛次仁一直有一个梦想：拥有一把属于自己的扎念琴。这个梦想直到他读初二时才实现。那年，父亲花了500多元为他买了一把扎念琴，从电话中得知消息的那晚，身在学校的白玛次仁兴奋得彻夜未眠。多年后，再次讲起这段往事，白玛次仁依然难掩激动之情。</p>\r\n<p><strong>从家乡走来，与古老扎念琴结下不解之缘</strong></p>\r\n<p>一弹起扎念琴，并随着音乐唱跳，白玛次仁瞬间变得欢快、活泼起来，与之前安静、寡言的性格形成反差，判若两人。</p>\r\n<p>白玛次仁任职于拉萨市第一中等职业技术学校，是一名音乐教师。他的家乡是位于西藏日喀则市昂仁县桑桑镇一个名为鲁姆琼的自然村落，全村只有十几户人家。</p>\r\n<p>在这片交织着游牧文明与农耕文明的高原上，能歌善舞烙印在藏族人民的基因中，也影响着白玛次仁，让他自幼在耳濡目染中深深喜欢上扎念琴。</p>\r\n<p>扎念，在藏语中意为&ldquo;悦耳之音&rdquo;，又因多为六弦，俗称&ldquo;六弦琴&rdquo;。扎念琴是一种历史悠久的藏族弹拨乐器，广泛流行于西藏各地，其扎根于藏族人民生活之中，不可或缺，颇受欢迎。2014年，&ldquo;扎念琴制作技艺&rdquo;入选第四批国家级非物质文化遗产代表性项目名录。</p>\r\n<p>白玛次仁说，在婚礼庆典、藏历节日或劳作之余，大家都会聚在一起，弹奏起扎念琴，载歌载舞，享受喜悦、轻松的时刻。在白玛次仁的记忆中，在家乡，几乎家家户户都会有一把扎念琴，那是幸福指数高的代表。</p>\r\n<p>在白玛次仁家里，也有一把扎念琴，那是家人用一头牦牛换来的。全家将其视若珍宝，年幼的白玛次仁被禁止触碰扎念琴。每当大人外出劳作，扎念琴便被高高挂在墙上，白玛次仁望着琴，心中充满渴望。少年时期，身为民间艺人的爷爷、叔叔成为白玛次仁的启蒙老师。&ldquo;外出劳作时，叔叔背着扎念琴，休息时弹奏一段，口传心授教给我弹奏的方法。&rdquo;他说，扎念琴表演是唱、跳、弹三位一体，学习扎念琴要先会唱，再会跳，最后再摸琴。</p>\r\n<p>那是段悠闲、惬意的时光，在家乡的旷野上，陪伴着牛羊，拨弄着一根根琴弦，白玛次仁至今难以忘怀。</p>\r\n<p>因为极想拥有一把属于自己的扎念琴，在上小学时，白玛次仁用不锈钢碗、羊皮和找来的几根木头、塑料线，自己制作了一把只有三根弦的扎念琴。虽然这把简易的扎念琴在音准、音量上有瑕疵，但白玛次仁依然爱不释手，日夜弹奏。</p>\r\n<p>凭借对扎念琴的挚爱，2013年，白玛次仁考入西藏大学艺术学院，继续在扎念琴演奏技艺上深造。为深入了解、学习西藏各地不同风格的扎念琴演奏技艺，他利用寒暑假，开展一场场田野调查，实地走访乡野山村，先后拜访160多位民间艺人，细心搜集、整理与扎念琴相关的历史典故、传说和各种唱法、曲目等，形成宝贵的文字资料。在西藏大学就读硕士研究生期间，他依此撰写的毕业论文荣获西藏自治区区级优秀论文。</p>\r\n<p><strong>向未来走去，以传承扎念琴为己任</strong></p>\r\n<p>演员、教师，曾是白玛次仁最向往的两个职业。经过慎重考虑，他最终选择成为一名音乐教师，在2020年毕业那年，入职拉萨市第一中等职业技术学校。在白玛次仁看来，作为教师，教授学生扎念琴能更好地将这份民族文化技艺传承下去。也因白玛次仁和另外两名音乐教师的入职，该校第一次有了扎念琴演奏技艺课程。</p>\r\n<p>&ldquo;第一届民族音乐与舞蹈专业班有50名学生，来自西藏各地。&rdquo;白玛次仁说，由于没有现成的教材，他凭借多年所学所思，研发了一套教材，但在课堂上，他没有照本宣科，&ldquo;扎念琴传递的是快乐和自信，不应被条条框框束缚&rdquo;。</p>\r\n<p>在白玛次仁的课堂上，他和学生以朋友身份相处。&ldquo;曾经有一个女生，一受到打击或批评就会晕倒。&rdquo;白玛次仁说，在第一个学期，这个女生曾晕倒过两次。白玛次仁相信，音乐能消除这个女生的自卑和胆怯，于是在课堂上鼓励她表演，通过音乐进行对话。渐渐地，这个女生变得开朗、自信起来，不仅再也没有晕倒过，而且敢在公开场合弹琴唱歌，成为学生中的佼佼者，最终考上拉萨师范高等专科学校。</p>\r\n<p>白玛次仁也有自己的&ldquo;苦恼&rdquo;&mdash;&mdash;有时工作忙，他没有时间弹奏扎念琴，难免会想念。一次，为了缓解&ldquo;相思之苦&rdquo;，他一连弹唱跳了42首曲目，痛痛快快地玩了一次。虽然汗流浃背，但他心里却满是充实和开心。</p>\r\n<p>年少时，在叔叔的指导下，白玛次仁曾创作了一首赞美家乡的扎念琴歌词，其中写道：&ldquo;上有快乐牧场，下有美丽田野，处在上下部间的鲁姆琼，是我可爱的家园&hellip;&hellip;&rdquo;如今，白玛次仁会弹唱的扎念琴歌曲有300多首，他曾应邀赴西藏、四川、青海等地表演，将扎念琴的魅力声情并茂地展示给观众。在2022年春节藏历新年联欢晚会上，白玛次仁和叔叔、弟弟、妹妹、侄子一起在舞台上表演了一个扎念琴节目。他说，节目讲的就是一家三代对扎念琴的传承。</p>\r\n<p>成为教师后，如何传承扎念琴成为白玛次仁思考最多的问题。他坦言，随着网络和手机的普及，现在的娱乐方式多，诱惑也多，真心热爱扎念琴、愿意传承扎念琴的年轻人越来越少。</p>\r\n<p>在白玛次仁看来，扎念琴音乐同样要与时俱进，在继承好传统技艺、曲目的基础上推陈出新，包括创新演奏技艺、创作新曲目、加强理论性研究等，以此增强扎念琴对年轻人的吸引力。为此，他编创《扎念丹真汪杰》《扎念琴的故事》《扎西巴卓》等新作品，广受好评。</p>\r\n<p>每当悠扬的琴声响起，白玛次仁都会情不自禁地深陷其中。谈及梦想，他说，自己最大的梦想是将一生献给扎念，一直弹下去。</p>'),
(43, '<p>&ldquo;老乡，牛卖了没？千万不要牵牛过铁路啊！&rdquo;8月29日清晨7时，薄雾未散，湖南省怀化市鹤城区黄金坳镇上的集市已热闹非凡。广州铁路公安局怀化公安处怀化站派出所黄金坳警务区民警周海军与妻子在此设立宣传台，一边向村民发放印有铁路安全提示的草帽，一边用乡音反复叮嘱。</p>\r\n<p>黄金坳警务区地处焦柳铁路蜿蜒穿行的湘西群山之间。作为该警务区唯一的驻站民警，周海军扎根一线，在平凡岗位上做出了不平凡的业绩。他与妻子的&ldquo;夫妻岗&rdquo;，不仅守护着13多公里的铁路安全，更用真心与担当，守护着南来北往的旅客。</p>\r\n<p><strong>耕织&ldquo;平安路&rdquo;</strong></p>\r\n<p>黄金坳站警务区管辖13多公里的线路，该区域桥梁多、隧道多、人口多、单位多，治安情况复杂。焦柳线绕村而过，村民耕作、孩子上学横穿铁路，险象环生。</p>\r\n<p>周海军看在眼里，急在心头。他每天清晨7点便守在铁路旁，劝导村民不要横穿铁路，但他深知&mdash;&mdash;堵不如疏，疏不如引。只有解决村民的出行难题，才能从根本上消除安全隐患。于是，一个大胆的构想在他心中萌发：修路！</p>\r\n<p>2021年起，他20余次奔走协调于地方政府、铁路部门与村民之间，在上级部门的支持下，反复进行踏勘论证，终于在2023年达成方案&mdash;&mdash;铁路方改造涵洞，地方政府出资修建绕行道路。2024年3月工程动工，7月竣工，一条宽2米、长1.8公里的&ldquo;便民路&rdquo;由此诞生。</p>\r\n<p>&ldquo;以前过年过节，子女回家，车子都进不来，现在可以直接开到家门口了。&rdquo;村民丁某说道。这条路不仅畅通了村民的出行，更搭起了警民&ldquo;连心桥&rdquo;。村民们与周海军夫妇的情谊愈发深厚，逢年过节常常热情相邀，警务区也成了村民们拉家常的&ldquo;暖心驿站&rdquo;。</p>\r\n<p><strong>驻站&ldquo;夫妻岗&rdquo;</strong></p>\r\n<p>自2009年起，周海军调任怀化铁路公安处公坪警务区驻站，至今已在铁路公安战线奋战16年。巡查线路、排查隐患、宣传走访、调解纠纷&hellip;&hellip;繁忙的工作使他常常顾不上吃饭。</p>\r\n<p>2020年年底，周海军调至黄金坳警务区，妻子张和英也随之而来。起初她只想做好&ldquo;贤内助&rdquo;，但看着丈夫早出晚归，便决定成为他的&ldquo;好帮手&rdquo;&mdash;&mdash;陪他徒步巡线、走村入户宣传、撰写材料、联系地方政府。久而久之，大家亲切地称他们为&ldquo;夫妻岗&rdquo;。</p>\r\n<p>2022年10月12日，夫妻俩正在吃午饭，突然听到&ldquo;起火了！&rdquo;的呼喊。只见山林浓烟滚滚，他们立刻丢下碗筷，与车站站长沈湘友一起提着灭火器冲向火场，组织救援。周海军用树枝扑火，衣服被火星烧出一个个破洞，眉毛、头发也被烧焦，却丝毫没有退缩。经过四五个小时的奋战，山火终于被扑灭。大家后怕地说：&ldquo;太危险了，多亏了你们及时处置！&rdquo;</p>\r\n<p>十几年来，张和英不仅熟悉了小站警务区的工作，还与车站职工及周边十里八村的村民建立了深厚友谊。2023年，她被怀化铁路公安处评为&ldquo;年度好警嫂&rdquo;。</p>\r\n<p><strong>警民&ldquo;鱼水情&rdquo;</strong></p>\r\n<p>在黄金坳镇里三元村，78岁的留守老人丁仁风与老伴相依为命，生活全靠家中的两头牛。春耕时节，老人为了耕田，不得不牵牛横跨铁路，几次逼停疾驰的火车，险象环生。2021年，刚到黄金坳警务区的周海军在走访中得知这一情况，立刻带人修了一条200米的便民小道，又用铁丝网围起500米护栏。多年来，周海军和妻子张和英常常为留守老人、困难户送去米油、衣物，把他们的冷暖放在心上。村民丁中平要修房但手中的钱不够，张和英悄悄借给他家3万元。</p>\r\n<p>&ldquo;驻站工作，贵在以真心换民心。&rdquo;周海军说。谈到自己即将退休，周海军心中满是不舍，不舍的不只是那身穿了多年的警服，还有那条倾注了自己无数心血的铁路，以及朝夕相伴的乡亲们。他最大的心愿&mdash;&mdash;铁路永远平安畅通，辖区居民永远幸福安康。</p>'),
(44, '<p>从最初6个人、5万元的汽车零部件自动化领域的&ldquo;小作坊&rdquo;，发展成为集&ldquo;好产品、好服务、好智能&rdquo;于一身的智能制造综合服务商，为全球TOP1客户提供自动化+数字化整体解决方案，长春合心机械制造有限公司用23年时间，书写了一段从&ldquo;起步&rdquo;逐步迈向&ldquo;深耕&rdquo;，由&ldquo;制造&rdquo;逐步迈向&ldquo;智造&rdquo;，传统产业由&ldquo;量大&rdquo;逐步迈向&ldquo;质优&rdquo;的传奇。</p>\r\n<p><strong>持之以恒，方能行稳致远</strong></p>\r\n<p>&ldquo;时间是雕塑家，他镌刻着我奋斗的年轮，记录着我在这条路上历经的风雨。&rdquo;长春合心机械制造有限公司董事长胡天伟说。</p>\r\n<p>胡天伟1992年毕业于吉林财贸学院会计学专业，之后加入长铃摩托车工业有限公司。2002年，从财务领域跨界创立合心机械。</p>\r\n<p>经过多次走访调研，胡天伟察觉到非标自动化行业虽技术门槛高，却是突破口。他有三重考量：其一，破解行业痛点；其二，追求自主技术；其三，践行产业报国。</p>\r\n<p>有了明确的方向后，接下来就要持之以恒地向目标不断靠近。胡天伟深耕行业二十载，通过&ldquo;战略前瞻、技术筑基、管理增效&rdquo;三位一体的经营方式，他主导研发的智能生产系统已成功应用于多家汽车及零部件龙头企业，推动行业智能化转型取得显著成效。</p>\r\n<p><strong>垂直深耕，构建创新矩阵</strong></p>\r\n<p>胡天伟带领公司避开通用设备竞争，选择汽车天窗、轮胎、座椅、涡轮增压器等汽车零部件非标自动化&ldquo;赛道&rdquo;，通过深度研发实现技术突破，成功&ldquo;出圈&rdquo;。</p>\r\n<p>2015年，胡天伟敏锐捕捉欧美制造业升级机遇，先后成立合心德国、合心美国、合心墨西哥、合心泰国等海外分公司，走上了全球化与本地化双轮驱动之路。</p>\r\n<p>为此，胡天伟带领公司不断攻克技术难关。目前，合心机械累计获得发明专利31项、实用新型专利190项、软件著作权107项，外观设计专利4项，60%以上产品出口海外，客户覆盖特斯拉、宝马、大众、奥迪、米其林、伟巴斯特、大陆电子等。</p>\r\n<p>正是有了此番战略布局，才使得合心机械从自动化走向人工智能创新矩阵&mdash;&mdash;</p>\r\n<p>2002年到2015年，公司以硬件制造为核心，为国际客户提供自动化产线，奠定行业地位。</p>\r\n<p>2016年到2020年，合心机械启动数字化转型，自主研发HIMS智能制造管理系统，转型为自动化+数字化为一体的综合服务商。</p>\r\n<p>2021年至今，合心机械布局人工智能与工业互联网，计划未来3年到5年内实现设备自学习、生产自优化，向&ldquo;智造+AI&rdquo;跃迁。</p>\r\n<p><strong>转型升级，实现生态重构</strong></p>\r\n<p>&ldquo;我不是一个墨守成规的人，我喜欢永远进取。&rdquo;胡天伟是这样说的，也是这样做的。</p>\r\n<p>他力排众议，投入大量人员团队，自主研发HIMS（合心智造管理系统），实现从设计、采购、生产到交付的全流程数字化管理。</p>\r\n<p>HIMS打破传统供应链孤岛，允许上下游客户实时接入平台，例如客户可以通过系统直接追踪设备调试进度，供应商可同步调整原材料供应节奏，效率提升30%以上。</p>\r\n<p>2022年，合心机械与法国达索系统达成战略合作，联合共建达索系统赋能长春创新中心。该合作项目通过自主研发的HIMS数字化平台与达索3DE平台的深度集成，构建了覆盖设计仿真、生产管控到运维服务的全流程数字化解决方案。目前该解决方案已服务一汽集团富维海拉等企业，助力客户生产效率平均提升25%。</p>\r\n<p>在汽车行业成本和现金流双重压力下，2023年胡天伟提出了非标定制自动化产线的租赁模式，使客户压力得到缓解，获得了发展空间。</p>\r\n<p>2024年胡天伟开辟重构产业生态的试验田，与美国沃尔玛一T1公司合作共享工厂。新的模式创新使零部件的制造商、贸易商，以及消费者都得到了利益的共赢，创造了高效、和谐的产业生态。</p>\r\n<p>回顾过去20多年的奋斗生涯，胡天伟说：&ldquo;作为一名民营企业家，我深知自己的责任和使命。这一路走来虽然充满挑战，但我从未后悔过自己的选择。因为我知道，只要心中有梦，脚下就有力量。&rdquo;</p>'),
(45, '<p>近日，在靖州苗族侗族自治县太阳花幼儿园，幼儿园创办者、89岁的谭松明正拿着小锄头在菜地，将蔬菜种子一粒粒埋进土中。</p>\r\n<p>自2015年起，谭松明每年都资助几名学生，直到其完成学业。至今，累计已资助19名学生，在当地传为佳话。前不久，谭松明获评助人为乐类&ldquo;湖南好人&rdquo;。</p>\r\n<p><strong>创立助学基金，10年资助19名学子</strong></p>\r\n<p>1996年，从靖州交通局副局长岗位退休的谭松明，没有闲下来。2005年，他创办&ldquo;太阳花幼儿园&rdquo;。办学期间，谭松明将办园收入、个人存款利息、退休金结余等&ldquo;捆绑成堆&rdquo;，想干点更有意义的事。</p>\r\n<p>2015年，谭松明来到靖州一中，希望学校每年推荐两名当年考取大学的困难学生，由他给予每人每年5000元至1万元的助学基金，直至完成学业。同年，谭松明用自筹的20万元资金，加上谭氏后辈的助力，发起创立&ldquo;谭氏助学基金&rdquo;，既资助家庭困难的大学生，又奖励学业有成的谭氏后辈。目前，助学基金累计结余近220万元。</p>\r\n<p>为了让&ldquo;谭氏助学基金&rdquo;得以延续，2021年4月，谭松明签署了一份特殊的遗嘱：本人离世后，所有存款均作为助学基金，任何人不得挪用，并聘请原县一中校长李松青作为助学基金监护人。</p>\r\n<p>谭松明年少时家境贫寒，依靠国家助学金和社会上好心人的资助才得以完成学业。&ldquo;我内心一直有个朴素的愿望，那就是，感恩党和国家的培养，回馈社会。&rdquo;谭松明说。</p>\r\n<p>这些年，谭松明资助的困难学生总数达19人，资助金额近40万元。这些被资助的学生当中，有的已顺利走上工作岗位，有的还在读研、读博深造。</p>\r\n<p><strong>&ldquo;希望他们做个对国家有用的人&rdquo;</strong></p>\r\n<p>幼儿园内的居民楼，谭松明一住便是20年，桌椅、柜子等均是40多年的老家具，屋子不大却干净整洁。谭松明笑称，自己没什么物质上的追求，每月生活花费很少。</p>\r\n<p>退休生活很简朴，谭松明说，最让他感到激动和欣慰的，是收到来自孩子们成长进步的喜讯。</p>\r\n<p>&ldquo;我定会传承您的精神，在我有帮助他人的能力时，将爱心传递下去。&rdquo;在一摞谭松明资助的学生档案中，夹着这样一封信，落款人是曾照龙。2018年，曾照龙得到谭松明的资助，顺利进入西北工业大学。去年夏天，曾照龙来看望谭松明并向他报喜：自己已考上博士，将继续在航空制造领域深造。今年春节时，曾获谭松明资助的袁伟打来电话拜年，从云南大学毕业的他，如今在昆明衡水中学任职历史老师，高兴地向谭松明分享自己生活和工作上的感受，畅谈新目标&hellip;&hellip;</p>\r\n<p>&ldquo;希望他们做个对国家有用的人。&rdquo;谭松明对他们充满了期待。</p>\r\n<p>谈起自己的助学举动，谭松明表示会一直做下去。他说：&ldquo;一个人能力有大小，但只要有这点精神，就是一个高尚的人，一个纯粹的人，一个有道德的人，一个脱离了低级趣味的人，一个有益于人民的人。&rdquo;</p>'),
(46, '<p>&ldquo;输电带电作业是指在高压电气设备上不停电进行检修和测试，由于操作难度大、危险性高，被形象地称为&lsquo;在刀尖上跳舞&rsquo;。&rdquo;全国五一劳动奖章获得者、国网浙江省电力有限公司金华供电公司&ldquo;带电作业特战班&rdquo;领衔人蒋卫东这样形容从事了30多年的事业。</p>\r\n<p>蒋卫东介绍，带电作业经常要面对常人难以想象的极端状况，解决十分棘手的问题，必须具备勇往直前的勇气。2024年春节期间，金华市遭遇寒潮，电力线路覆冰厚度严重超出设计标准，供电线路遭到严重损害。在抗冰抢险前线，50多岁的蒋卫东全力以赴，冒着寒风、顶着冻雨，带领团队在冰凌密布的&ldquo;钢铁丛林&rdquo;中连续鏖战，顺利完成最严重受灾线路的抢修工作，保障电力安全稳定供应。</p>\r\n<p>&ldquo;每当看到经过我们的努力，一条条&lsquo;银线&rsquo;跨越山川，将光明和温暖输送到千家万户，心中就充满了自豪感和成就感，深知自己的付出是特别值得的。&rdquo;蒋卫东说。</p>\r\n<p>这只是蒋卫东从事电力事业以来不惧困难、敢于挑战的缩影。他曾率队登上370米高的舟山大猫山岛输电铁塔进行带电作业，顶着六级海风在高空抢修；完成全国首次1000千伏同塔双回线路带电作业，为我国高电压带电作业领域积累了宝贵经验。</p>\r\n<p>输电线路是电网的命脉，故障如同病灶，而蒋卫东是精准切除病灶的&ldquo;手术专家&rdquo;。他最拿手的带电作业是快速、无痕消除输电线路缺陷的方式。这是一项对安全要求极高的工作。&ldquo;高空、高电压的环境要求作业中每一个动作都精准无比，每一次操作都关乎着带电作业人员的生命安全和电力的稳定供应。&rdquo;蒋卫东说。</p>\r\n<p>&ldquo;输电线路带电作业要求极高，传统工具有时无法满足复杂的作业环境和严格的安全要求。&rdquo;蒋卫东认为，唯有通过不断的技术创新，才能提升带电作业效率并充分保障安全。因此，他组建起&ldquo;蒋卫东劳模创新工作室&rdquo;这一技术攻坚团队，以解决现场难题为导向，开展高压输电线路带电作业新工法、新工具的创新研究，并取得较好成效。</p>\r\n<p>&ldquo;实践中产生的问题和需求，就是我们攻关的着力点。我们要敢为人先、大胆探索、能闯难关，用工匠精神挑战一切不可能。&rdquo;蒋卫东说。</p>\r\n<p>依托系统化技术攻关体系，蒋卫东带领团队构建&ldquo;需求分析&mdash;理论研究&mdash;实践改进&rdquo;的研发模式，深度解构带电作业全流程技术痛点。他们首创的&ldquo;绝缘小士字梯等电位作业法&rdquo;被纳入国网超高压作业标准体系，研发的&ldquo;承力工具绳索化作业法&rdquo;开创国内绝缘承力工器具绳索化的先河。他带领工作室取得诸多创新成果，逐步构建起覆盖常规电压到特高压、从地面作业到空中操作的全方位带电作业技术体系。</p>\r\n<p>&ldquo;输电线路带电作业技艺传承下去，才能让国家的电力事业不断发展壮大。&rdquo;近年来，蒋卫东马不停蹄地投入教学工作，将带电作业全套流程拆解为多个标准动作模块，主导编制《带电作业标准化操作流程》等23部技术教材，构建起输电专业岗位能力标准图谱，为浙江省电力行业输电线路岗位培训提供有效参考。</p>\r\n<p>目前，他带出来的学生构建起老中青梯次衔接的技术团队，活跃在浙闽皖三省电力一线，将标准化作业流程与精益求精的工匠精神融入日常工作。</p>\r\n<p>&ldquo;我的愿望很简单，希望在我的手上没有修不好的输电线路。&rdquo;蒋卫东始终保持着电力工人的赤诚与初心，用他自己的话说，输电线路就像他的孩子，照顾孩子是他的责任。正是成千上万像蒋卫东一样的&ldquo;电网卫士&rdquo;，在空中&ldquo;起舞&rdquo;，与高压线&ldquo;对话&rdquo;，在实验室奋力钻研，在铁塔施展拳脚，守护着千家万户的用电安全，用奋斗书写人生华章。</p>'),
(47, '<p>赵春玲是全国三八红旗手标兵。由她参与设计研制、试验试飞的国产支线飞机C909、国产大飞机C919已投入市场，实现规模化运营。</p>\r\n<p><img src=\"/uploads/20251023/d91b56083bd3e554df6628d8bc24aa4a.jpg\" alt=\"\" width=\"100%\" /></p>\r\n<p>从国产商用飞机事业发展的长卷看，C909、C919的研制仅是开篇，宽体客机领域是更大的挑战。2023年，赵春玲被任命为C929宽体客机总设计师。</p>\r\n<p><img src=\"/uploads/20251023/b68c91d4ce0b5e993683adf7c502cd7f.jpg\" alt=\"\" width=\"100%\" /></p>\r\n<p>面对一道道高难度的技术关卡，赵春玲带领团队一往无前，完成了C929总体技术方案确定工作。</p>\r\n<p><img src=\"/uploads/20251023/a83ebb008eb54c1bb85937d44d24285b.jpg\" alt=\"\" width=\"100%\" /></p>');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_addon_books`
--

DROP TABLE IF EXISTS `party_cms_addon_books`;
CREATE TABLE IF NOT EXISTS `party_cms_addon_books` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `download` varchar(255) DEFAULT '' COMMENT '下载地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='精选书籍';

--
-- 转存表中的数据 `party_cms_addon_books`
--

INSERT INTO `party_cms_addon_books` (`id`, `content`, `download`) VALUES
(37, '', 'https://dwgk.ecnu.edu.cn/_upload/article/files/c2/a9/56d2585b4602862871287ef4fe20/b8c988e7-da2e-452a-9f45-8466bd1c6a7a.pdf');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_addon_member`
--

DROP TABLE IF EXISTS `party_cms_addon_member`;
CREATE TABLE IF NOT EXISTS `party_cms_addon_member` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='党员先锋';

--
-- 转存表中的数据 `party_cms_addon_member`
--

INSERT INTO `party_cms_addon_member` (`id`, `content`) VALUES
(35, ''),
(36, '');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_archives`
--

DROP TABLE IF EXISTS `party_cms_archives`;
CREATE TABLE IF NOT EXISTS `party_cms_archives` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `channel_ids` varchar(100) DEFAULT '' COMMENT '副栏目ID集合',
  `model_id` int(10) NOT NULL DEFAULT '0' COMMENT '模型ID',
  `special_ids` varchar(100) DEFAULT '' COMMENT '专题ID集合',
  `admin_id` int(10) UNSIGNED DEFAULT '0' COMMENT '管理员ID',
  `title` varchar(255) DEFAULT '' COMMENT '文章标题',
  `flag` varchar(100) DEFAULT '' COMMENT '标志',
  `style` varchar(100) DEFAULT '' COMMENT '样式',
  `image` varchar(255) DEFAULT '' COMMENT '缩略图',
  `images` varchar(1500) DEFAULT '' COMMENT '组图',
  `seotitle` varchar(255) DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `tags` varchar(255) DEFAULT '' COMMENT 'TAG',
  `price` decimal(10,2) UNSIGNED DEFAULT '0.00' COMMENT '价格',
  `outlink` varchar(255) DEFAULT '' COMMENT '外部链接',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `comments` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论次数',
  `likes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislikes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点踩数',
  `diyname` varchar(100) DEFAULT '' COMMENT '自定义URL',
  `isguest` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '是否访客访问',
  `iscomment` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '是否允许评论',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `publishtime` bigint(16) DEFAULT NULL COMMENT '发布时间',
  `deletetime` bigint(16) DEFAULT NULL COMMENT '删除时间',
  `createby` varchar(30) DEFAULT '' COMMENT '创建者',
  `memo` varchar(100) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','draft','prepare','rejected','pulloff') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `diyname` (`diyname`),
  KEY `channel_id` (`channel_id`),
  KEY `channel_ids` (`channel_ids`),
  KEY `weigh` (`weigh`,`publishtime`),
  KEY `channel_id_2` (`channel_id`),
  KEY `channel_ids_2` (`channel_ids`),
  KEY `diyname_2` (`diyname`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='内容表';

--
-- 转存表中的数据 `party_cms_archives`
--

INSERT INTO `party_cms_archives` (`id`, `user_id`, `channel_id`, `channel_ids`, `model_id`, `special_ids`, `admin_id`, `title`, `flag`, `style`, `image`, `images`, `seotitle`, `keywords`, `description`, `tags`, `price`, `outlink`, `weigh`, `views`, `comments`, `likes`, `dislikes`, `diyname`, `isguest`, `iscomment`, `createtime`, `updatetime`, `publishtime`, `deletetime`, `createby`, `memo`, `status`) VALUES
(1, 0, 9, '', 1, '', 1, '陕西咸阳：社区开展“一年10件实事”活动 精准解痛点 精细优服务', 'recommend', '', '/uploads/20251023/1526c52602ef047b239926b86fedbe1e.png', '', '', '', '本报咸阳讯（通讯员阎晋于文哲）“爬了十几年楼，如今‘一键到家’，实在太方便了。没想到老小区现在也能让人住得这么舒心！”国庆假期，家住陕西省咸阳市渭城区石化小区的王小津老人按下电梯按钮，笑容满面地说。今年9月，石化小区老旧住宅楼加装的43部电梯全部投入使用，“爬楼难”已成历史。', '', 0.00, '', 0, 0, 0, 0, 0, 'shan-xi-xian-yang-she-qu-kai-zhan-yi-nian-10-jian-shi-shi-huo-dong-jing-zhun-jie-tong-dian-jing-xi-y', 10, 10, 1761184405, 1761191071, 1761184267, NULL, 'admin', '', 'normal'),
(2, 0, 9, '', 1, '', 1, '云南丽江推行党建引领基层治理“六个一”改革 协同共治和美家园', '', '', '/uploads/20251023/5768c8d85b01385abc4ea82f21ad66b5.jpg', '', '', '', '如今，在云南省丽江市华坪县兴泉镇党群服务中心，村民不到一刻钟就办完育儿补贴发放登记；宁蒗县红桥镇遭遇强降雨，“一站救”队伍6小时抢通3公里受阻道路……一桩桩基层治理难题的高效解决，是丽江市推行党建引领基层治理“六个一”改革的生动缩影。', '', 0.00, '', 0, 0, 0, 0, 0, 'yun-nan-li-jiang-tui-xing-dang-jian-yin-ling-ji-ceng-zhi-li-liu-ge-yi-gai-ge-xie-tong-gong-zhi-he-me', 10, 10, 1761184500, 1761190972, 1761184425, NULL, 'admin', '', 'normal'),
(3, 0, 9, '', 1, '', 1, '北京市石景山区扎实推进“智网实格”建设 串起为民服务千条线', '', '', '/uploads/20251023/f077c77c7207de8053ef395e6798a07d.jpg', '', '', '', '近日，北京市石景山区八角街道八角南路社区在推行停车管理过程中，不少居民向网格长反映车辆进主路时存在安全隐患。网格长迅速响应、研判办理，积极协调停车管理公司在路边安装凸透镜。“网格长的解释答复我很满意，解决安全隐患效率很高，现在我有什么事就找网格长，好使！”居民孙瑛赞赏道。', '', 0.00, '', 0, 0, 0, 0, 0, 'bei-jing-shi-shi-jing-shan-qu-zha-shi-tui-jin-zhi-wang-shi-ge-jian-she-chuan-qi-wei-min-fu-wu-qian-t', 10, 10, 1761184580, 1761190960, 1761184544, NULL, 'admin', '', 'normal'),
(4, 0, 6, '', 1, '', 1, '回望“十四五”，想起总书记这句话', 'top', '', '/uploads/20251023/f4b40e6076118b381a251eb1d5a8b763.jpg', '', '', '', '经济发展取得新成效、改革开放迈出新步伐、社会文明程度得到新提高、生态文明建设实现新进步、民生福祉达到新水平、国家治理效能得到新提升……', '', 0.00, '', 9999, 0, 0, 0, 0, 'hui-wang-shi-si-wu-xiang-qi-zong-shu-ji-zhe-ju-hua', 10, 10, 1761185003, 1761190723, 1761184613, NULL, 'admin', '', 'normal'),
(5, 0, 6, '', 1, '', 1, '中方持续举办人工智能能力建设研讨班 外交部：让现代化成果惠及各国民众', 'top', '', '/uploads/20251023/f4b40e6076118b381a251eb1d5a8b763.jpg', '', '', '', '新华社北京10月21日电（记者邵艺博、董雪）第三期人工智能能力建设研讨班20日举行开班式，外交部发言人郭嘉昆21日在例行记者会上介绍了有关情况。', '', 0.00, '', 9999, 0, 0, 0, 0, 'zhong-fang-chi-xu-ju-ban-ren-gong-zhi-neng-neng-li-jian-she-yan-tao-ban-wai-jiao-bu-rang-xian-dai-hu', 10, 10, 1761185059, 1761190708, 1761185036, NULL, 'admin', '', 'normal'),
(6, 0, 6, '', 1, '', 1, '国际调解院开业仪式在香港举行', '', '', '/uploads/20251023/5768c8d85b01385abc4ea82f21ad66b5.jpg', '', '', '', '新华社香港10月20日电（记者王昕怡）总部设在中国香港的国际调解院20日举行开业仪式，《关于建立国际调解院的公约》缔约国、签署国代表及香港特别行政区各界人士近200人出席仪式。', '', 0.00, '', 0, 0, 0, 0, 0, 'guo-ji-tiao-jie-yuan-kai-ye-yi-shi-zai-xiang-gang-ju-xing', 10, 10, 1761185162, 1761185162, 1761185081, NULL, 'admin', '', 'normal'),
(7, 0, 6, '', 1, '', 1, '学习语丨增强做中国人的志气、骨气、底气', '', '', '/uploads/20251023/ec531b4fdda19f7a7c75e46b9bd39dc3.png', '', '', '', '近日，习近平总书记电贺郑丽文当选中国国民党主席，期望两党坚持共同政治基础，团结广大台湾同胞，增强做中国人的志气、骨气、底气，深化交流合作，促进共同发展，推进国家统一，坚定守护中华民族共同家园，守护两岸同胞根本利益，携手开创中华民族更加美好的未来。习近平总书记这一殷切期望，既是对两岸关系正确发展方向的科学指引，更是对全体中华儿女凝聚民族力量、共创民族复兴伟业的召唤。今天，党建网梳理了习近平总书记的部分相关重要论述，与您一同学习领会。', '', 0.00, '', 0, 0, 0, 0, 0, 'xue-xi-yu-gun-zeng-qiang-zuo-zhong-guo-ren-de-zhi-qi-gu-qi-di-qi', 10, 10, 1761185252, 1761190694, 1761185192, NULL, 'admin', '', 'normal'),
(8, 0, 6, '', 1, '', 1, '学习语｜爱国主义是我们民族精神的核心', 'recommend', '', '/uploads/20251023/8de6de5827e2f7b6ffa25dc24488abaf.png', '', '', '', '习近平总书记在庆祝中华人民共和国成立76周年招待会上指出：“前不久，我们隆重纪念中国人民抗日战争暨世界反法西斯战争胜利80周年，极大振奋了民族精神、激发了爱国热情、凝聚了奋斗力量。”爱国，是人世间最深层、最持久的情感。党的十八大以来，习近平总书记多次在不同场合强调爱国的重要性、要求弘扬爱国主义精神，强调要在厚植爱国主义情怀上下功夫。今天，党建网梳理了习近平总书记的部分相关重要论述，与您一同学习领会。', '', 0.00, '', 0, 0, 0, 0, 0, 'xue-xi-yu-ai-guo-zhu-yi-shi-wo-men-min-zu-jing-shen-de-he-xin', 10, 10, 1761185302, 1761191047, 1761185266, NULL, 'admin', '', 'normal'),
(9, 0, 6, '', 1, '', 1, '推进作风建设常态化长效化', '', '', '/uploads/20251023/21af6543b6010a7e5e38d0b6c4a120cb.jpg', '', '', '', '习近平总书记近期就作风建设作出重要指示，强调锲而不舍落实中央八项规定精神，推进作风建设常态化长效化。制定实施中央八项规定，体现了以习近平同志为核心的党中央深邃高远的政治考量、清醒坚定的惕厉自醒，彰显了中国共产党人“打铁必须自身硬”的底气、坚定不移推进全面从严治党的决心。', '', 0.00, '', 0, 0, 0, 0, 0, 'tui-jin-zuo-feng-jian-she-chang-tai-hua-chang-xiao-hua', 10, 10, 1761185369, 1761190605, 1761185331, NULL, 'admin', '', 'normal'),
(10, 0, 6, '', 1, '', 1, '加快构建中国共产党自我革命话语体系', 'top', '', '/uploads/20251023/f4b40e6076118b381a251eb1d5a8b763.jpg', '', '', '', '勇于自我革命是我们党最鲜明的品格，也是党的事业不断从胜利走向新的胜利的根本保证。在开启全面建设社会主义现代化国家新征程、向第二个百年奋斗目标进军的关键时期，梳理总结党的自我革命实践经验与历史成就，加快构建具有中国特色、中国风格、中国气派的自我革命话语体系，不仅是丰富马克思主义建党学说、深化中国共产党执政规律认识的必然要求，也是巩固党的长期执政地位、向世界讲好中国共产党故事的关键举措。', '', 0.00, '', 9999, 0, 0, 0, 0, 'jia-kuai-gou-jian-zhong-guo-gong-chan-dang-zi-wo-ge-ming-hua-yu-ti-xi', 10, 10, 1761185412, 1761190548, 1761185387, NULL, 'admin', '', 'normal'),
(11, 0, 6, '', 1, '', 1, '始终保持一张蓝图绘到底的战略定力', 'top', '', '/uploads/20251023/f4b40e6076118b381a251eb1d5a8b763.jpg', '', '', '', '习近平总书记指出，“十五五”时期是基本实现社会主义现代化夯实基础、全面发力的关键时期，要保持战略定力，增强必胜信心，积极识变应变求变，集中力量办好自己的事，在激烈国际竞争中赢得战略主动，推动事关中国式现代化全局的战略任务取得重大突破。', '', 0.00, '', 9999, 0, 0, 0, 0, 'shi-zhong-bao-chi-yi-zhang-lan-tu-hui-dao-di-de-zhan-lue-ding-li', 10, 10, 1761185463, 1761190535, 1761185430, NULL, 'admin', '', 'normal'),
(12, 0, 6, '', 1, '', 1, '人民城市的理论根基与实践探索', '', '', '/uploads/20251023/6742ae004e841d78558b0d863151e3d0.jpg', '', '', '', '2025年7月召开的中央城市工作会议强调，要认真践行人民城市理念，把“坚持城市内涵式发展”作为主线，将“推进城市更新”作为重要抓手。这标志着中国城市发展从过去追求规模扩张的“外延式发展”，全面转向注重质量、效益和可持续性的“内涵式发展”新阶段。这一历史性转变既需要深刻的理论指引，也需要回应现实的时代命题，更呼唤先行地区的实践探索。', '', 0.00, '', 0, 0, 0, 0, 0, 'ren-min-cheng-shi-de-li-lun-gen-ji-yu-shi-jian-tan-suo', 10, 10, 1761185539, 1761190507, 1761185512, NULL, 'admin', '', 'normal'),
(13, 0, 9, '', 1, '', 1, '上海加强流动党员管理取得实效 在沪有“家”亦有为', '', '', '/uploads/20251023/b19bbe0d314a94d42cfcfef4ca6d173f.jpg', '', '', '', '“来沪流动党员第一课”“抵沪第一杯咖啡”，一项项举措传递着党组织的温暖；“治理建言官”“社区主理人”，一个个称呼闪耀着流动党员的风采。', '', 0.00, '', 0, 0, 0, 0, 0, 'shang-hai-jia-qiang-liu-dong-dang-yuan-guan-li-qu-de-shi-xiao-zai-hu-you-jia-yi-you-wei', 10, 10, 1761185592, 1761190948, 1761185552, NULL, 'admin', '', 'normal'),
(14, 0, 9, '', 1, '', 1, '江西井冈山：小区有了党群服务站 居民有了“幸福站”', 'recommend', '', '/uploads/20251023/b225905c05b5068dca73e927f5afddd4.jpg', '', '', '', '以前，小区内电瓶车充电难、停车乱，大家没少为这事闹心，自从有了党群服务站，问题解决得又快又好。”近日，家住江西省井冈山市香榭丽小区的居民郭娟感慨。', '', 0.00, '', 0, 0, 0, 0, 0, 'jiang-xi-jing-gang-shan-xiao-qu-you-le-dang-qun-fu-wu-zhan-ju-min-you-le-xing-fu-zhan', 10, 10, 1761185641, 1761191062, 1761185607, NULL, 'admin', '', 'normal'),
(15, 0, 9, '', 1, '', 1, '天津抓实项目党建助力城市更新 党旗飘扬处 老街展新颜', '', '', '/uploads/20251023/2c1502ac4198e17efbc135397f1e1010.jpg', '', '', '', '本报天津讯（通讯员津组轩）一个个城市更新项目落地开工，一面面党旗也在项目一线飘扬起来。“把支部建到项目上，让党员亮出身份、带头攻坚，为城市更新项目顺利推进实施提供了源动力。”近日，天津城投集团所属城市更新公司党总支负责人介绍。', '', 0.00, '', 0, 0, 0, 0, 0, 'tian-jin-zhua-shi-xiang-mu-dang-jian-zhu-li-cheng-shi-geng-xin-dang-qi-piao-yang-chu-lao-jie-zhan-xi', 10, 10, 1761185789, 1761185789, 1761185663, NULL, 'admin', '', 'normal'),
(16, 0, 13, '', 1, '', 1, '申请入党申请', '', '', '', '', '', '', '《发展党员工作细则第x条》要求入党的人，自题提出入党申请。入党申请，应当采用致媒形式，先了解下入党的流...', '', 0.00, '', 0, 0, 0, 0, 0, 'shen-qing-ru-dang-shen-qing', 10, 10, 1761185942, 1761185942, 1761185879, NULL, 'admin', '', 'normal'),
(17, 0, 13, '', 1, '', 1, '党组织谈话', '', '', '', '', '', '', '《发展党员工作细则第x条》要求入党的人，自题提出入党申请。入党申请，应当采用致媒形式，先了解下入党的流...', '', 0.00, '', 0, 0, 0, 0, 0, 'dang-zu-zhi-tan-hua', 10, 10, 1761185969, 1761185969, 1761185946, NULL, 'admin', '', 'normal'),
(18, 0, 13, '', 1, '', 1, '推荐和公式积极分子', '', '', '', '', '', '', '《发展党员工作细则第x条》要求入党的人，自题提出入党申请。入党申请，应当采用致媒形式，先了解下入党的流...', '', 0.00, '', 0, 0, 0, 0, 0, 'tui-jian-he-gong-shi-ji-ji-fen-zi', 10, 10, 1761185996, 1761185996, 1761185977, NULL, 'admin', '', 'normal'),
(19, 0, 13, '', 1, '', 1, '1年以上培养教育', '', '', '', '', '', '', '《发展党员工作细则第x条》要求入党的人，自题提出入党申请。入党申请，应当采用致媒形式，先了解下入党的流...', '', 0.00, '', 0, 0, 0, 0, 0, '1-nian-yi-shang-pei-yang-jiao-yu', 10, 10, 1761186020, 1761186020, 1761186005, NULL, 'admin', '', 'normal'),
(20, 0, 13, '', 1, '', 1, '确定发展对象', '', '', '', '', '', '', '《发展党员工作细则第x条》要求入党的人，自题提出入党申请。入党申请，应当采用致媒形式，先了解下入党的流...', '', 0.00, '', 0, 0, 0, 0, 0, 'que-ding-fa-zhan-dui-xiang', 10, 10, 1761186039, 1761186039, 1761186028, NULL, 'admin', '', 'normal'),
(21, 0, 5, '', 1, '', 1, '党员提出申请', '', '', '', '', '', '', '填写资料，向原党组织提交书面申请，说明转移原因、目标党组织名称等信息。', '', 0.00, '', 0, 0, 0, 0, 0, 'dang-yuan-ti-chu-shen-qing', 10, 10, 1761186078, 1761186078, 1761186058, NULL, 'admin', '', 'normal'),
(22, 0, 5, '', 1, '', 1, '原党组织审核', '', '', '', '', '', '', '1.审核资格，检查党员档案完整性。2.开具转接凭证,《中国共产党党员组织关系介绍信》', '', 0.00, '', 0, 0, 0, 0, 0, 'yuan-dang-zu-zhi-shen-he', 10, 10, 1761186103, 1761186103, 1761186086, NULL, 'admin', '', 'normal'),
(23, 0, 5, '', 1, '', 1, '目标党组织接收', '', '', '', '', '', '', '1.接收审核，审查档案。2.编入支部，根据党员情况分配至具体党支部，通知参加组织生活', '', 0.00, '', 0, 0, 0, 0, 0, 'mu-biao-dang-zu-zhi-jie-shou', 10, 10, 1761186119, 1761186119, 1761186106, NULL, 'admin', '', 'normal'),
(24, 0, 5, '', 1, '', 1, '回执反馈', '', '', '', '', '', '', '目标党组织在接收后，需将回执联（纸质）或系统回执反馈至原党组织。', '', 0.00, '', 0, 0, 0, 0, 0, 'hui-zhi-fan-kui', 10, 10, 1761186142, 1761186142, 1761186132, NULL, 'admin', '', 'normal'),
(25, 0, 9, '', 1, '', 1, '山东滕州：小区建支部 服务送到家', '', '', '/uploads/20251023/c63d23339f085839072dbb85c31abb50.jpg', '', '', '', '本报滕州讯（通讯员滕组轩）山东省滕州市地处鲁西南地区，是全省人口最多的县级市。近些年来，滕州市靶向发力加强居民小区党建工作，通过建体系、强阵地、优服务，充分激发党建引领小区治理动能，绘就城市幸福家园新图景。', '', 0.00, '', 0, 0, 0, 0, 0, 'shan-dong-teng-zhou-xiao-qu-jian-zhi-bu-fu-wu-song-dao-jia', 10, 10, 1761186196, 1761190923, 1761186167, NULL, 'admin', '', 'normal'),
(26, 0, 9, '', 1, '', 1, '四川犍为用活“四小工作法”打好组合拳 未诉先办 主动靠前', '', '', '/uploads/20251023/2f1449788796420eaef22ad9d6d5aa77.jpg', '', '', '', '为加快推动社会治理重心向基层下移，坚持和发展新时代“枫桥经验”，今年以来，四川省犍为县持续深化党建引领心连心接诉即办改革工作，创新服务品牌，推出“小板凳”服务在前、“小铃铛”教育在前、“小拐杖”扶助在前、“小嫩芽”关爱在前的“四小工作法”，突出抓好未诉先办治理和“一老一小”关爱保障服务，通过“小工具”撬动“大治理”。', '', 0.00, '', 0, 0, 0, 0, 0, 'si-chuan-qian-wei-yong-huo-si-xiao-gong-zuo-fa-da-hao-zu-he-quan-wei-su-xian-ban-zhu-dong-kao-qian', 10, 10, 1761186239, 1761190915, 1761186217, NULL, 'admin', '', 'normal'),
(27, 0, 9, '', 1, '', 1, '青海玉树州持之以恒为基层减负赋能', 'recommend', '', '/uploads/20251023/e7c5ab21733722a401f38dd91e55cb9e.png', '', '', '', '本报崇仁讯（通讯员黄思明刘福恒）近年来，江西崇仁县创新实施“一企业一博士、一产业一团队”人才引进“双一工程”，出台一揽子政策举措，设立2000万元人才发展专项资金，为产业发展精准引进人才。', '', 0.00, '', 0, 0, 0, 0, 0, 'qing-hai-yu-shu-zhou-chi-zhi-yi-heng-wei-ji-ceng-jian-fu-fu-neng', 10, 10, 1761186283, 1761191087, 1761186261, NULL, 'admin', '', 'normal'),
(28, 0, 9, '', 1, '', 1, '浙江省金华市民政局：以党建赋能提升“一老一小”服务保障水平', '', '', '/uploads/20251023/99f4f16796cb65d992accb3b6ab2e8ba.png', '', '', '', '今年以来，浙江省金华市民政局坚持党建引领，聚焦民政领域“一老一小”，充分发挥党支部战斗堡垒作用和党员先锋模范作用，以党建“红色动能”助推党组织“红色引擎”，强化“一老一小”群众基本服务保障，兜准兜牢民生底线。', '', 0.00, '', 0, 0, 0, 0, 0, 'zhe-jiang-sheng-jin-hua-shi-min-zheng-ju-yi-dang-jian-fu-neng-ti-sheng-yi-lao-yi-xiao-fu-wu-bao-zhan', 10, 10, 1761186319, 1761190875, 1761186298, NULL, 'admin', '', 'normal'),
(29, 0, 9, '', 1, '', 1, '陕西渭南以村企联建破解产业发展瓶颈 “结亲”奔富 共绘“丰景”', '', '', '/uploads/20251023/206038497bfe83b871d60c85c9868f1b.png', '', '', '', '3座钢构大棚、水肥一体化控制系统、自动卷膜机等现代化蓝莓种植技术……日前，走进陕西省渭南市潼关县太要镇欧家城村，现代化大棚让人耳目一新。通过村企联建种植的优质蓝莓，很快被抢购一空。“和公司一起合作种蓝莓，人家有资金、有技术、有市场，不愁卖不出。”村民纷纷点赞。', '', 0.00, '', 0, 0, 0, 0, 0, 'shan-xi-wei-nan-yi-cun-qi-lian-jian-po-jie-chan-ye-fa-zhan-ping-jing-jie-qin-ben-fu-gong-hui-feng-ji', 10, 10, 1761186360, 1761190848, 1761186338, NULL, 'admin', '', 'normal'),
(30, 0, 9, '', 1, '', 1, '广西钦州市钦南区 “潮汐行动”守护“一老一小”', '', '', '/uploads/20251023/6c8b8af51b8ffe4bb80563854890d905.png', '', '', '', '本报钦州讯（通讯员黎东桂王一渊）“有村里党员服务队守护家里老人小孩，我们在海上生产作业很安心。”近日，长期在海上工作的广西钦州市钦南区犀牛脚镇大环社区村民杨富国说。今年2月,杨富国出海捕鱼时，70多岁老父亲突发车祸，由于家中无人照料，他心急如焚。关键时刻，社区党员服务队迅速联系医疗机构，让老人得到及时治疗，并帮助办理医保报销事宜，这份跨越山海的温暖，让漂泊海上的杨富国吃下了“定心丸”。', '', 0.00, '', 0, 0, 0, 0, 0, 'guang-xi-qin-zhou-shi-qin-nan-qu-chao-xi-xing-dong-shou-hu-yi-lao-yi-xiao', 10, 10, 1761186405, 1761190813, 1761186376, NULL, 'admin', '', 'normal'),
(31, 0, 6, '', 1, '', 1, '全球治理倡议，是世界的合唱', 'recommend', '', '/uploads/20251023/afeb629d10b6c56ec184302b7f864317.jpg', '', '', '', '2025年9月1日，习近平主席在“上海合作组织+”会议上郑重提出全球治理倡议，这是继全球发展倡议、全球安全倡议、全球文明倡议之后中国提供的又一重要国际公共产品，旨在同各国一道，推动构建更加公正合理的全球治理体系，携手迈向人类命运共同体。', '', 0.00, '', 0, 0, 0, 0, 0, 'quan-qiu-zhi-li-chang-yi-shi-shi-jie-de-he-chang', 10, 10, 1761186469, 1761191037, 1761186438, NULL, 'admin', '', 'normal'),
(32, 0, 6, '', 1, '', 1, '深刻认识五年规划彰显的制度优势', '', '', '/uploads/20251023/2c1502ac4198e17efbc135397f1e1010.jpg', '', '', '', '习近平总书记指出：“今年是‘十四五’规划收官之年，要在加紧落实规划目标任务的同时，适应形势变化，把握战略重点，科学谋划好‘十五五’时期经济社会发展。', '', 0.00, '', 0, 0, 0, 0, 0, 'shen-ke-ren-shi-wu-nian-gui-hua-zhang-xian-de-zhi-du-you-shi', 10, 10, 1761186518, 1761190487, 1761186490, NULL, 'admin', '', 'normal'),
(33, 0, 10, '', 2, '', 1, '以艺赋能乡村振兴 点亮群众文化生活星火夏夜 共聚杨戴', '', '', '/uploads/20251023/ba0d8c19db0f45930428f17308278129.png', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'yi-yi-fu-neng-xiang-cun-zhen-xing-dian-liang-qun-zhong-wen-hua-sheng-huo-xing-huo-xia-ye-gong-ju-yan', 10, 10, 1761186861, 1761186942, 1761186604, NULL, 'admin', '', 'normal'),
(34, 0, 10, '', 2, '', 1, '积跬步 至千里', '', '', '/uploads/20251023/6742ae004e841d78558b0d863151e3d0.jpg', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'ji-kui-bu-zhi-qian-li', 10, 10, 1761186919, 1761190760, 1761186879, NULL, 'admin', '', 'normal'),
(35, 0, 12, '', 4, '', 1, '张国华', '', '', '/uploads/20251023/c1027681da202ceb7492a1d8a78d87c1.png', '', '', '', '张同志作为中国共产党党员，在疫情期间，自告奋勇要支援武汉，同时在岗位坚守48小时没有合眼，为抗疫做出巨大贡献，是时代楷模。', '', 0.00, '', 0, 0, 0, 0, 0, 'zhang-guo-hua', 10, 10, 1761187207, 1761187207, 1761187179, NULL, 'admin', '', 'normal'),
(36, 0, 12, '', 4, '', 1, '李国栋', '', '', '/uploads/20251023/b9057476aa20f46cdb8ab41ada0161f0.png', '', '', '', '李同志作为中国共产党党员，在疫情期间，自告奋勇要支援武汉，同时在岗位坚守48小时没有合眼，为抗疫做出巨大贡献，是时代楷模。', '', 0.00, '', 0, 0, 0, 0, 0, 'li-guo-dong', 10, 10, 1761187231, 1761187231, 1761187209, NULL, 'admin', '', 'normal'),
(37, 0, 8, '', 3, '', 1, '共产党宣言', 'recommend', '', '/uploads/20251023/7116db58af4b019117e96d08417aca91.png', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'gong-chan-dang-xuan-yan', 10, 10, 1761191244, 1761191374, 1761191189, NULL, 'admin', '', 'normal'),
(38, 0, 11, '', 1, '', 1, '郭慧茹：从“异乡客”到“筑梦人”', '', '', '/uploads/20251023/c63d23339f085839072dbb85c31abb50.jpg', '', '', '', '清晨的固始高中校园里，总能看到郭慧茹步履轻快而坚定的身影。她时而俯身与学生亲切交谈，时而埋首与同事探讨教学。22年前，大学毕业，她从家乡河南濮阳来到信阳这片红色热土，从此扎根固始教育沃土，将最美的青春年华奉献给了这里的孩子们。二十二载光阴流转，她始终坚守讲台。“课堂才是教师的根。”她说。她用爱心点亮希望，用智慧浇灌未来，默默为革命老区的教育事业添砖加瓦。', '', 0.00, '', 0, 0, 0, 0, 0, 'guo-hui-ru-cong-yi-xiang-ke-dao-zhu-meng-ren', 10, 10, 1761191529, 1761192229, 1761191450, NULL, 'admin', '', 'normal'),
(39, 0, 11, '', 1, '', 1, '何红玲：初心载乡愁 深黄一线牵', '', '', '/uploads/20251023/ba0d8c19db0f45930428f17308278129.png', '', '', '', '“我29岁离开家时，带着60万现金闯深圳。”作为黄石市楚商联合会常务副会长、第二届黄石“双招双引”大使，何红玲的创业历程始终绕不开家乡黄石。', '', 0.00, '', 0, 0, 0, 0, 0, 'he-hong-ling-chu-xin-zai-xiang-chou-shen-huang-yi-xian-qian', 10, 10, 1761191577, 1761192220, 1761191547, NULL, 'admin', '', 'normal'),
(40, 0, 11, '', 1, '', 1, '王昕欣：扎根乡村教育的“蒲公英”', '', '', '/uploads/20251023/6742ae004e841d78558b0d863151e3d0.jpg', '', '', '', '在黑龙江省佳木斯市汤原县香兰镇中学，有一位教师，身形娇小，乌黑的波浪卷发披在双肩，一双充满智慧与温柔的眼睛，眼神中透着坚定与热忱，仿佛藏着无数关于教育的梦想与希望，她叫王昕欣。', '', 0.00, '', 0, 0, 0, 0, 0, 'wang-xin-xin-zha-gen-xiang-cun-jiao-yu-de-pu-gong-ying', 10, 10, 1761191617, 1761192210, 1761191593, NULL, 'admin', '', 'normal'),
(41, 0, 11, '', 1, '', 1, '陈建林：助力“小太阳”点亮未来', '', '', '/uploads/20251023/afeb629d10b6c56ec184302b7f864317.jpg', '', '', '', '作为合肥聚能电物理高技术开发有限公司制造中心副主任、高级技师的陈建林，负责EAST核心部件的总装与调试，这些年来，他一直在守护“小太阳”。', '', 0.00, '', 0, 0, 0, 0, 0, 'chen-jian-lin-zhu-li-xiao-tai-yang-dian-liang-wei-lai', 10, 10, 1761191660, 1761192196, 1761191631, NULL, 'admin', '', 'normal'),
(42, 0, 11, '', 1, '', 1, '白玛次仁：弹起扎念琴，唱响新时代', '', '', '/uploads/20251023/f077c77c7207de8053ef395e6798a07d.jpg', '', '', '', '儿时的白玛次仁一直有一个梦想：拥有一把属于自己的扎念琴。这个梦想直到他读初二时才实现。那年，父亲花了500多元为他买了一把扎念琴，从电话中得知消息的那晚，身在学校的白玛次仁兴奋得彻夜未眠。多年后，再次讲起这段往事，白玛次仁依然难掩激动之情。', '', 0.00, '', 0, 0, 0, 0, 0, 'bai-ma-ci-ren-dan-qi-zha-nian-qin-chang-xiang-xin-shi-dai', 10, 10, 1761191723, 1761192183, 1761191700, NULL, 'admin', '', 'normal'),
(43, 0, 11, '', 1, '', 1, '周海军：扎根山乡 守护铁路畅通', '', '', '/uploads/20251023/2c1502ac4198e17efbc135397f1e1010.jpg', '', '', '', '老乡，牛卖了没？千万不要牵牛过铁路啊！”8月29日清晨7时，薄雾未散，湖南省怀化市鹤城区黄金坳镇上的集市已热闹非凡。广州铁路公安局怀化公安处怀化站派出所黄金坳警务区民警周海军与妻子在此设立宣传台，一边向村民发放印有铁路安全提示的草帽，一边用乡音反复叮嘱。', '', 0.00, '', 0, 0, 0, 0, 0, 'zhou-hai-jun-zha-gen-shan-xiang-shou-hu-tie-lu-chang-tong', 10, 10, 1761191760, 1761192170, 1761191739, NULL, 'admin', '', 'normal'),
(44, 0, 11, '', 1, '', 1, '胡天伟：从“拓荒播种”到“精耕沃土”', '', '', '/uploads/20251023/a08313c51362cabf19c0e0afc6397690.jpg', '', '', '', '从最初6个人、5万元的汽车零部件自动化领域的“小作坊”，发展成为集“好产品、好服务、好智能”于一身的智能制造综合服务商，为全球TOP1客户提供自动化+数字化整体解决方案，长春合心机械制造有限公司用23年时间，书写了一段从“起步”逐步迈向“深耕”，由“制造”逐步迈向“智造”，传统产业由“量大”逐步迈向“质优”的传奇。', '', 0.00, '', 0, 0, 0, 0, 0, 'hu-tian-wei-cong-tuo-huang-bo-zhong-dao-jing-geng-wo-tu', 10, 10, 1761191801, 1761192161, 1761191776, NULL, 'admin', '', 'normal'),
(45, 0, 11, '', 1, '', 1, '谭松明：自筹资金资助19名大学生', '', '', '/uploads/20251023/2f1449788796420eaef22ad9d6d5aa77.jpg', '', '', '', '近日，在靖州苗族侗族自治县太阳花幼儿园，幼儿园创办者、89岁的谭松明正拿着小锄头在菜地，将蔬菜种子一粒粒埋进土中。', '', 0.00, '', 0, 0, 0, 0, 0, 'tan-song-ming-zi-chou-zi-jin-zi-zhu-19-ming-da-xue-sheng', 10, 10, 1761191848, 1761192149, 1761191827, NULL, 'admin', '', 'normal'),
(46, 0, 11, '', 1, '', 1, '蒋卫东：刀尖上跳舞的光明卫士', '', '', '/uploads/20251023/a83ebb008eb54c1bb85937d44d24285b.jpg', '', '', '', '“输电带电作业是指在高压电气设备上不停电进行检修和测试，由于操作难度大、危险性高，被形象地称为‘在刀尖上跳舞’。”全国五一劳动奖章获得者、国网浙江省电力有限公司金华供电公司“带电作业特战班”领衔人蒋卫东这样形容从事了30多年的事业。', '', 0.00, '', 0, 0, 0, 0, 0, 'jiang-wei-dong-dao-jian-shang-tiao-wu-de-guang-ming-wei-shi', 10, 10, 1761191882, 1761192141, 1761191859, NULL, 'admin', '', 'normal'),
(47, 0, 11, '', 1, '', 1, '赵春玲：用创新与实干浇灌大飞机“梦想之花”', '', '', '/uploads/20251023/d91b56083bd3e554df6628d8bc24aa4a.jpg', '', '', '', '赵春玲是全国三八红旗手标兵。由她参与设计研制、试验试飞的国产支线飞机C909、国产大飞机C919已投入市场，实现规模化运营。', '', 0.00, '', 0, 0, 0, 0, 0, 'zhao-chun-ling-yong-chuang-xin-yu-shi-gan-jiao-guan-da-fei-ji-meng-xiang-zhi-hua', 10, 10, 1761192117, 1761192117, 1761191903, NULL, 'admin', '', 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_autolink`
--

DROP TABLE IF EXISTS `party_cms_autolink`;
CREATE TABLE IF NOT EXISTS `party_cms_autolink` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT '' COMMENT '链接',
  `target` enum('self','blank') DEFAULT 'blank' COMMENT '打开方式',
  `weigh` int(10) DEFAULT '0' COMMENT '排序',
  `views` int(10) UNSIGNED DEFAULT '0' COMMENT '点击次数',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='自动链接表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_block`
--

DROP TABLE IF EXISTS `party_cms_block`;
CREATE TABLE IF NOT EXISTS `party_cms_block` (
  `id` smallint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) DEFAULT '' COMMENT '类型',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `image` varchar(255) DEFAULT '' COMMENT '图片',
  `url` varchar(255) DEFAULT '' COMMENT '链接',
  `content` mediumtext COMMENT '内容',
  `parsetpl` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '解析模板标签',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `begintime` bigint(16) DEFAULT NULL COMMENT '开始时间',
  `endtime` bigint(16) DEFAULT NULL COMMENT '结束时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `urltype` varchar(255) DEFAULT 'link' COMMENT '链接类型',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='区块表';

--
-- 转存表中的数据 `party_cms_block`
--

INSERT INTO `party_cms_block` (`id`, `type`, `name`, `title`, `image`, `url`, `content`, `parsetpl`, `weigh`, `createtime`, `updatetime`, `begintime`, `endtime`, `status`, `urltype`) VALUES
(1, '首页焦点图', 'index-focus', '祖国万岁', '/uploads/20251023/35eb6a8437abcc9a57e3fbc7fba76b63.png', '', NULL, 0, 1, 1761189231, 1761190414, NULL, NULL, 'normal', 'link'),
(2, '首页焦点图', 'index-focus', '修复古树名木 留住绿色“活化石”', '/uploads/20251023/a08313c51362cabf19c0e0afc6397690.jpg', '', NULL, 0, 2, 1761189274, 1761189274, NULL, NULL, 'normal', 'link'),
(3, '首页焦点图', 'index-focus', '2025中国—北欧经贸合作论坛开幕', '/uploads/20251023/6742ae004e841d78558b0d863151e3d0.jpg', '', NULL, 0, 3, 1761189323, 1761189323, NULL, NULL, 'normal', 'link'),
(4, '首页焦点图', 'index-focus', '行进中国调研行', '/uploads/20251023/afeb629d10b6c56ec184302b7f864317.jpg', 'https://video.people.cn/upload/vod/user1739759454736028/1760622351036294/origin.mp4', NULL, 0, 4, 1761189396, 1761189881, NULL, NULL, 'normal', 'video'),
(5, '党员学习焦点图', 'party-focus', '庆祝中华人民共和国成立76周年招待会', '/uploads/20251023/1526c52602ef047b239926b86fedbe1e.png', '', NULL, 0, 5, 1761189565, 1761190361, NULL, NULL, 'normal', 'link'),
(6, '三会一课焦点图', 'meeting-focus', '定期召开党会  按时上党课', '/uploads/20251023/a66ee73bd9e2ad42bfcfb891b8369b20.jpg', '', NULL, 0, 6, 1761189741, 1761189741, NULL, NULL, 'normal', 'link'),
(7, '首页焦点图', 'index-focus', '空客亚洲第二条A320系列飞机总装线在天津投产', '/uploads/20251023/f077c77c7207de8053ef395e6798a07d.jpg', '', NULL, 0, 7, 1761190331, 1761190422, NULL, NULL, 'normal', 'link');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_channel`
--

DROP TABLE IF EXISTS `party_cms_channel`;
CREATE TABLE IF NOT EXISTS `party_cms_channel` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` enum('channel','page','link','list') NOT NULL COMMENT '类型',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '模型ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(30) DEFAULT '' COMMENT '名称',
  `image` varchar(255) DEFAULT '' COMMENT '图片',
  `flag` varchar(100) DEFAULT '' COMMENT '标志',
  `seotitle` varchar(255) DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `diyname` varchar(100) DEFAULT '' COMMENT '自定义名称',
  `outlink` varchar(255) DEFAULT '' COMMENT '外部链接',
  `linktype` varchar(100) DEFAULT '' COMMENT '链接类型',
  `linkid` int(10) DEFAULT '0' COMMENT '链接ID',
  `items` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章数量',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `channeltpl` varchar(100) DEFAULT '' COMMENT '栏目页模板',
  `listtpl` varchar(100) DEFAULT '' COMMENT '列表页模板',
  `showtpl` varchar(100) DEFAULT '' COMMENT '详情页模板',
  `pagesize` smallint(5) NOT NULL DEFAULT '0' COMMENT '分页大小',
  `vip` tinyint(1) UNSIGNED DEFAULT '0' COMMENT 'VIP',
  `listtype` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '列表数据类型',
  `iscontribute` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可投稿',
  `isnav` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否导航显示',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `diyname` (`diyname`),
  KEY `type` (`type`),
  KEY `weigh` (`weigh`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_2` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='栏目表';

--
-- 转存表中的数据 `party_cms_channel`
--

INSERT INTO `party_cms_channel` (`id`, `type`, `model_id`, `parent_id`, `name`, `image`, `flag`, `seotitle`, `keywords`, `description`, `diyname`, `outlink`, `linktype`, `linkid`, `items`, `weigh`, `channeltpl`, `listtpl`, `showtpl`, `pagesize`, `vip`, `listtype`, `iscontribute`, `isnav`, `createtime`, `updatetime`, `status`) VALUES
(1, 'list', 3, 7, '经济', '', '', '', '', '', 'economy', '', '', 0, 1, 12, 'channel.html', 'list.html', 'show.html', 10, 0, 0, 0, 0, 1758184411, 1761140448, 'normal'),
(2, 'channel', 1, 0, '党员学习', '', '', '', '', '', 'study', '', '', 0, 0, 4, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758184553, 1760538446, 'normal'),
(3, 'channel', 1, 0, '党建动态', '', '', '', '', '', 'activities', '', '', 0, 0, 2, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758184990, 1760538448, 'normal'),
(4, 'channel', 1, 0, '党建服务', '', '', '', '', '', 'services', '', '', 0, 0, 1, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758185067, 1760538449, 'normal'),
(5, 'list', 1, 4, '组织关系转移', '', '', '', '', '', 'zuzhiguanxizhuanyi', '/', '', 0, 4, 13, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758185628, 1761186143, 'normal'),
(6, 'list', 1, 2, '三会一课', '', '', '', '', '', 'meeting', '', '', 0, 11, 6, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758599363, 1761186518, 'normal'),
(7, 'list', 3, 2, '精选书籍', '', '', '', '', '', 'books', '', '', 0, 0, 7, 'channel.html', 'list.html', 'show.html', 10, 0, 0, 0, 0, 1758599399, 1761132549, 'normal'),
(8, 'list', 3, 7, '时政', '', '', '', '', '', 'political', '', '', 0, 1, 8, 'channel.html', 'list.html', 'show.html', 10, 0, 0, 0, 0, 1758599458, 1761191266, 'normal'),
(9, 'list', 1, 3, '基层动态', '', '', '', '', '', 'primary', '', '', 0, 12, 9, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758599636, 1761186405, 'normal'),
(10, 'list', 2, 3, '组织活动', '', '', '', '', '', 'party', '', '', 0, 2, 10, 'channel.html', 'list.html', 'show.html', 10, 0, 0, 0, 0, 1758599831, 1761186919, 'normal'),
(11, 'list', 1, 3, '党员风采', '', '', '', '', '', 'record', '', '', 0, 10, 10, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758600910, 1761192117, 'normal'),
(12, 'list', 4, 3, '党员先锋', '', '', '', '', '', 'pioneer', '', '', 0, 2, 9, 'channel.html', 'list.html', 'show.html', 10, 0, 0, 0, 0, 1758603844, 1761187231, 'normal'),
(13, 'list', 1, 4, '入党流程', '', '', '', '', '', 'process', '', '', 0, 5, 11, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758604047, 1761186040, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_channel_admin`
--

DROP TABLE IF EXISTS `party_cms_channel_admin`;
CREATE TABLE IF NOT EXISTS `party_cms_channel_admin` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '栏目ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='栏目权限表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_collection`
--

DROP TABLE IF EXISTS `party_cms_collection`;
CREATE TABLE IF NOT EXISTS `party_cms_collection` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` enum('archives','special','page','diyform') DEFAULT NULL COMMENT '类型',
  `aid` int(10) UNSIGNED DEFAULT '0' COMMENT '关联ID',
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏标题',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `aid` (`type`,`aid`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收藏表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_comment`
--

DROP TABLE IF EXISTS `party_cms_comment`;
CREATE TABLE IF NOT EXISTS `party_cms_comment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `type` enum('archives','page','special') NOT NULL DEFAULT 'archives' COMMENT '类型',
  `aid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关联ID',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父ID',
  `content` longtext COMMENT '内容',
  `comments` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论数',
  `ip` varchar(50) DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User Agent',
  `subscribe` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订阅',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(16) DEFAULT NULL COMMENT '删除时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `post_id` (`aid`,`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_diyform`
--

DROP TABLE IF EXISTS `party_cms_diyform`;
CREATE TABLE IF NOT EXISTS `party_cms_diyform` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED DEFAULT '0' COMMENT '管理员ID',
  `name` char(30) DEFAULT '' COMMENT '表单名称',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `seotitle` varchar(255) DEFAULT '' COMMENT 'SEO标题',
  `posttitle` varchar(255) DEFAULT '' COMMENT '发布标题',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `table` varchar(50) DEFAULT '' COMMENT '表名',
  `fields` text COMMENT '字段列表',
  `isguest` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否访客访问',
  `needlogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要登录发布',
  `isedit` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '是否允许编辑',
  `iscaptcha` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '是否启用验证码',
  `successtips` varchar(255) DEFAULT NULL COMMENT '成功提示文字',
  `redirecturl` varchar(255) DEFAULT NULL COMMENT '成功后跳转链接',
  `posttpl` varchar(50) DEFAULT '' COMMENT '表单页模板',
  `listtpl` varchar(50) DEFAULT '' COMMENT '列表页模板',
  `showtpl` varchar(50) DEFAULT '' COMMENT '详情页模板',
  `diyname` varchar(100) DEFAULT NULL COMMENT '自定义名称',
  `usermode` enum('all','user') DEFAULT 'all' COMMENT '用户筛选模式',
  `statusmode` enum('all','normal','hidden') DEFAULT 'all' COMMENT '状态筛选模式',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `setting` varchar(1500) DEFAULT NULL COMMENT '表单配置',
  `status` enum('normal','hidden') DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `diyname` (`diyname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='自定义表单表';

--
-- 转存表中的数据 `party_cms_diyform`
--

INSERT INTO `party_cms_diyform` (`id`, `admin_id`, `name`, `title`, `seotitle`, `posttitle`, `keywords`, `description`, `table`, `fields`, `isguest`, `needlogin`, `isedit`, `iscaptcha`, `successtips`, `redirecturl`, `posttpl`, `listtpl`, `showtpl`, `diyname`, `usermode`, `statusmode`, `createtime`, `updatetime`, `setting`, `status`) VALUES
(1, 1, '随手拍', '随手拍', '', '', '', '', 'cms_diyform_casual_snapshot', 'images,content,locate,username', 0, 0, 0, 0, '', '', '', '', '', 'snapshot', 'user', 'all', 1760539482, 1760540273, NULL, 'normal'),
(2, 1, '建言献策', '建言献策', '', '', '', '', 'cms_diyform_suggestion', 'archives_id,title,content,label,username', 0, 0, 0, 0, '', '', '', '', '', 'suggestion', 'user', 'all', 1760612654, 1760613795, NULL, 'normal'),
(3, 1, '入党申请', '入常申请', '', '', '', '', 'cms_diyform_join_party', 'images,username,mobile', 0, 0, 0, 0, '', '', '', '', '', 'join', 'user', 'all', 1760616742, 1760616742, NULL, 'normal'),
(4, 1, '组织关系转移', '组织关系转移', '', '', '', '', 'cms_diyform_organization', 'title,images,reason,member_id,role,username', 0, 0, 0, 0, '', '', '', '', '', 'organization', 'user', 'normal', 1760618929, 1760618929, NULL, 'normal'),
(5, 1, '组织活动报名', '组织活动报名', '', '', '', '', 'cms_diyform_activity_signup', 'archives_id,username', 0, 0, 0, 0, '', '', '', '', '', 'activity', 'user', 'all', 1760673983, 1760673983, NULL, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_diyform_activity_signup`
--

DROP TABLE IF EXISTS `party_cms_diyform_activity_signup`;
CREATE TABLE IF NOT EXISTS `party_cms_diyform_activity_signup` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `archives_id` int(255) DEFAULT NULL COMMENT '活动ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(1500) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected') DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_archives` (`user_id`,`archives_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `createtime` (`createtime`),
  KEY `archives_id` (`archives_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织活动报名';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_diyform_casual_snapshot`
--

DROP TABLE IF EXISTS `party_cms_diyform_casual_snapshot`;
CREATE TABLE IF NOT EXISTS `party_cms_diyform_casual_snapshot` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `images` varchar(1500) DEFAULT '' COMMENT '图片',
  `content` text COMMENT '内容',
  `locate` varchar(255) DEFAULT NULL COMMENT '位置',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(1500) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected') DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `createtime` (`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='随手拍';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_diyform_join_party`
--

DROP TABLE IF EXISTS `party_cms_diyform_join_party`;
CREATE TABLE IF NOT EXISTS `party_cms_diyform_join_party` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `username` varchar(255) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `images` varchar(1500) DEFAULT '' COMMENT '申请书',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(1500) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected') DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `createtime` (`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='入党申请';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_diyform_organization`
--

DROP TABLE IF EXISTS `party_cms_diyform_organization`;
CREATE TABLE IF NOT EXISTS `party_cms_diyform_organization` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `member_id` varchar(255) DEFAULT NULL COMMENT '党员编号',
  `title` varchar(255) DEFAULT '' COMMENT '织组名称',
  `images` varchar(1500) DEFAULT '' COMMENT '资料证明',
  `reason` varchar(255) DEFAULT NULL COMMENT '调转原因',
  `role` varchar(255) DEFAULT NULL COMMENT ' 职务',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(1500) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected') DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `createtime` (`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织关系转移';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_diyform_suggestion`
--

DROP TABLE IF EXISTS `party_cms_diyform_suggestion`;
CREATE TABLE IF NOT EXISTS `party_cms_diyform_suggestion` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `label` varchar(255) DEFAULT '' COMMENT '标签',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(1500) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected') DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `createtime` (`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='建言献策';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_fields`
--

DROP TABLE IF EXISTS `party_cms_fields`;
CREATE TABLE IF NOT EXISTS `party_cms_fields` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `source` varchar(30) DEFAULT '' COMMENT '来源',
  `source_id` int(10) NOT NULL DEFAULT '0' COMMENT '来源ID',
  `name` char(30) DEFAULT '' COMMENT '名称',
  `type` varchar(30) DEFAULT '' COMMENT '类型',
  `title` varchar(30) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `filterlist` text COMMENT '筛选列表',
  `defaultvalue` varchar(100) DEFAULT '' COMMENT '默认值',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `msg` varchar(100) DEFAULT '' COMMENT '错误消息',
  `ok` varchar(100) DEFAULT '' COMMENT '成功消息',
  `tip` varchar(100) DEFAULT '' COMMENT '提示消息',
  `decimals` tinyint(1) DEFAULT NULL COMMENT '小数点',
  `length` mediumint(8) DEFAULT NULL COMMENT '长度',
  `minimum` smallint(6) DEFAULT NULL COMMENT '最小数量',
  `maximum` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最大数量',
  `extend` varchar(255) DEFAULT '' COMMENT '扩展信息',
  `setting` varchar(1500) DEFAULT '' COMMENT '配置信息',
  `favisible` varchar(1500) DEFAULT '' COMMENT '显示条件',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `isorder` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可排序',
  `iscontribute` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可投稿',
  `isfilter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '筛选',
  `status` enum('normal','hidden') NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `source` (`source`) USING BTREE,
  KEY `source_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COMMENT='模型字段表';

--
-- 转存表中的数据 `party_cms_fields`
--

INSERT INTO `party_cms_fields` (`id`, `source`, `source_id`, `name`, `type`, `title`, `content`, `filterlist`, `defaultvalue`, `rule`, `msg`, `ok`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend`, `setting`, `favisible`, `weigh`, `createtime`, `updatetime`, `isorder`, `iscontribute`, `isfilter`, `status`) VALUES
(2, 'diyform', 1, 'images', 'images', '图片', 'value1|title1\r\nvalue2|title2', NULL, '', '', '', '', '', NULL, 1500, NULL, 0, '', '', '', 4, 1760539482, 1760539482, 0, 1, 0, 'normal'),
(3, 'diyform', 1, 'content', 'editor', '内容', 'value1|title1\r\nvalue2|title2', NULL, '', '', '', '', '', NULL, 0, NULL, 0, '', '', '', 2, 1760539482, 1760539482, 0, 1, 0, 'normal'),
(4, 'diyform', 1, 'locate', 'string', '位置', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 1, 1760540344, 1760540344, 0, 0, 0, 'normal'),
(8, 'diyform', 2, 'archives_id', 'number', '文章ID', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 8, 1760592734, 1760592754, 0, 0, 0, 'normal'),
(9, 'diyform', 2, 'title', 'string', '标题', 'value1|title1\r\nvalue2|title2', NULL, '', '', '', '', '', NULL, 255, NULL, 0, '', '', '', 3, 1760612654, 1760612654, 0, 1, 0, 'normal'),
(11, 'diyform', 2, 'content', 'editor', '内容', 'value1|title1\r\nvalue2|title2', NULL, '', '', '', '', '', NULL, 0, NULL, 0, '', '', '', 1, 1760612654, 1760612654, 0, 1, 0, 'normal'),
(12, 'diyform', 2, 'label', 'string', '标签', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 12, 1760613726, 1760613894, 0, 0, 0, 'normal'),
(14, 'diyform', 3, 'images', 'image', '申请书', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 1500, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 2, 1760616743, 1760617136, 0, 1, 0, 'normal'),
(16, 'diyform', 3, 'username', 'string', '姓名', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 17, 1760617053, 1760617053, 0, 0, 0, 'normal'),
(17, 'diyform', 3, 'mobile', 'string', '手机号', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 17, 1760617076, 1760617076, 0, 0, 0, 'normal'),
(18, 'diyform', 4, 'title', 'string', '织组名称', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 22, 1760618929, 1760619014, 0, 1, 0, 'normal'),
(19, 'diyform', 4, 'images', 'images', '资料证明', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 1500, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 21, 1760618929, 1760619068, 0, 1, 0, 'normal'),
(21, 'diyform', 4, 'reason', 'string', '调转原因', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 3, 1760619144, 1760619144, 0, 0, 0, 'normal'),
(22, 'diyform', 4, 'member_id', 'string', '党员编号', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 34, 1760621195, 1760621195, 0, 0, 0, 'normal'),
(23, 'diyform', 4, 'role', 'string', ' 职务', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 2, 1760621265, 1760621265, 0, 0, 0, 'normal'),
(24, 'model', 2, 'start_date', 'date', '开始日期', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 25, 1760668828, 1760668887, 0, 0, 0, 'normal'),
(25, 'model', 2, 'end_date', 'date', '结束日期', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 25, 1760668861, 1760668861, 0, 0, 0, 'normal'),
(30, 'diyform', 5, 'archives_id', 'number', '活动ID', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 31, 1760674299, 1760674299, 0, 0, 0, 'normal'),
(31, 'diyform', 5, 'username', 'string', '用户名称', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 31, 1760676261, 1760676261, 0, 0, 0, 'normal'),
(32, 'diyform', 1, 'username', 'string', '用户名称', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 32, 1760681760, 1760681760, 0, 0, 0, 'normal'),
(33, 'diyform', 2, 'username', 'string', '用户名称', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 33, 1760681791, 1760681791, 0, 0, 0, 'normal'),
(34, 'diyform', 4, 'username', 'string', '用户名称', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 34, 1760681831, 1760681831, 0, 0, 0, 'normal'),
(35, 'block', 0, 'urltype', 'select', '链接类型', 'video|视频\r\nlink|链接', NULL, 'link', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 35, 1761130131, 1761130332, 0, 0, 0, 'normal'),
(36, 'model', 3, 'download', 'string', '下载地址', 'value1|title1\r\nvalue2|title2', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', '', 36, 1761132366, 1761132366, 0, 0, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_friendlink`
--

DROP TABLE IF EXISTS `party_cms_friendlink`;
CREATE TABLE IF NOT EXISTS `party_cms_friendlink` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `title` varchar(255) DEFAULT '' COMMENT '站点名称',
  `image` varchar(1500) DEFAULT '' COMMENT '站点Logo',
  `website` varchar(100) DEFAULT '' COMMENT '站点链接',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(1500) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected') DEFAULT 'hidden' COMMENT '状态',
  `intro` varchar(255) DEFAULT '' COMMENT '站点介绍',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `createtime` (`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='友情链接';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_message`
--

DROP TABLE IF EXISTS `party_cms_message`;
CREATE TABLE IF NOT EXISTS `party_cms_message` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `name` varchar(50) DEFAULT '' COMMENT '姓名',
  `telephone` varchar(100) DEFAULT '' COMMENT '电话',
  `qq` varchar(30) DEFAULT '' COMMENT 'QQ',
  `content` longtext COMMENT '内容',
  `os` enum('windows','mac') DEFAULT 'windows' COMMENT '操作系统',
  `language` set('zh-cn','en') DEFAULT '' COMMENT '语言',
  `address` varchar(255) DEFAULT '' COMMENT '地区',
  `category` varchar(255) DEFAULT '' COMMENT '分类',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `image` varchar(500) DEFAULT '' COMMENT '图片',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden','rejected') DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `createtime` (`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='站内留言';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_model`
--

DROP TABLE IF EXISTS `party_cms_model`;
CREATE TABLE IF NOT EXISTS `party_cms_model` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` char(30) DEFAULT '' COMMENT '模型名称',
  `table` char(20) DEFAULT '' COMMENT '表名',
  `fields` text COMMENT '字段列表',
  `channeltpl` varchar(100) DEFAULT '' COMMENT '栏目页模板',
  `listtpl` varchar(100) DEFAULT '' COMMENT '列表页模板',
  `showtpl` varchar(100) DEFAULT '' COMMENT '详情页模板',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `setting` text COMMENT '模型配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='内容模型表';

--
-- 转存表中的数据 `party_cms_model`
--

INSERT INTO `party_cms_model` (`id`, `name`, `table`, `fields`, `channeltpl`, `listtpl`, `showtpl`, `createtime`, `updatetime`, `setting`) VALUES
(1, '通用文章', 'cms_addon_article', NULL, 'channel.html', 'list.html', 'show.html', 1758184280, 1761132242, '{\"contributefields\":[],\"publishfields\":[\"image\",\"tags\",\"content\",\"description\"]}'),
(2, '组织活动', 'cms_addon_activity', 'start_date,end_date', 'channel.html', 'list.html', 'show.html', 1760666664, 1760670964, '{\"contributefields\":[],\"publishfields\":[\"image\",\"tags\",\"content\",\"description\"]}'),
(3, '精选书籍', 'cms_addon_books', 'download', 'channel.html', 'list.html', 'show.html', 1761132206, 1761132695, '{\"contributefields\":[],\"publishfields\":[\"image\",\"tags\",\"content\"]}'),
(4, '党员先锋', 'cms_addon_member', NULL, 'channel.html', 'list.html', 'show.html', 1761144550, 1761144647, '{\"contributefields\":[],\"publishfields\":[\"image\",\"tags\",\"content\",\"description\"]}');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_navigation`
--

DROP TABLE IF EXISTS `party_cms_navigation`;
CREATE TABLE IF NOT EXISTS `party_cms_navigation` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `image` varchar(255) DEFAULT '' COMMENT '图片',
  `website` varchar(255) DEFAULT '' COMMENT '导航链接',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(1500) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected') DEFAULT 'hidden' COMMENT '状态',
  `intro` varchar(255) DEFAULT '' COMMENT '介绍',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `createtime` (`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='热门导航';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_order`
--

DROP TABLE IF EXISTS `party_cms_order`;
CREATE TABLE IF NOT EXISTS `party_cms_order` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `orderid` varchar(50) DEFAULT '' COMMENT '订单ID',
  `user_id` int(10) UNSIGNED DEFAULT '0' COMMENT '会员ID',
  `archives_id` int(10) UNSIGNED DEFAULT '0' COMMENT '文档ID',
  `title` varchar(100) DEFAULT NULL COMMENT '订单标题',
  `amount` decimal(10,2) UNSIGNED DEFAULT '0.00' COMMENT '订单金额',
  `payamount` decimal(10,2) UNSIGNED DEFAULT '0.00' COMMENT '支付金额',
  `paytype` varchar(50) DEFAULT NULL COMMENT '支付类型',
  `paytime` bigint(16) DEFAULT NULL COMMENT '支付时间',
  `method` varchar(100) DEFAULT '' COMMENT '支付方法',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `useragent` varchar(255) DEFAULT NULL COMMENT 'UserAgent',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` enum('created','paid','expired') DEFAULT 'created' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `archives_id` (`archives_id`),
  KEY `orderid` (`orderid`),
  KEY `orderid_2` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_page`
--

DROP TABLE IF EXISTS `party_cms_page`;
CREATE TABLE IF NOT EXISTS `party_cms_page` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(10) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `admin_id` int(10) UNSIGNED DEFAULT '0' COMMENT '管理员ID',
  `type` varchar(50) DEFAULT '' COMMENT '类型',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `seotitle` varchar(255) DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `flag` varchar(100) DEFAULT '' COMMENT '标志',
  `image` varchar(255) DEFAULT '' COMMENT '头像',
  `content` longtext COMMENT '内容',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击',
  `likes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点赞',
  `dislikes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点踩',
  `comments` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论',
  `diyname` varchar(100) DEFAULT '' COMMENT '自定义',
  `showtpl` varchar(50) DEFAULT '' COMMENT '视图模板',
  `iscomment` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '是否允许评论',
  `parsetpl` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '解析模板标签',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(16) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `diyname` (`diyname`),
  KEY `type` (`type`),
  KEY `diyname_2` (`diyname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单页表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_search_log`
--

DROP TABLE IF EXISTS `party_cms_search_log`;
CREATE TABLE IF NOT EXISTS `party_cms_search_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `keywords` varchar(100) DEFAULT '' COMMENT '关键字',
  `nums` int(10) UNSIGNED DEFAULT '0' COMMENT '搜索次数',
  `createtime` bigint(16) DEFAULT NULL COMMENT '搜索时间',
  `status` varchar(50) DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keywords` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='搜索记录表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_special`
--

DROP TABLE IF EXISTS `party_cms_special`;
CREATE TABLE IF NOT EXISTS `party_cms_special` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED DEFAULT '0' COMMENT '管理员ID',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `tag_ids` varchar(1500) DEFAULT '' COMMENT '标签ID集合',
  `flag` varchar(100) DEFAULT '' COMMENT '标志',
  `label` varchar(50) DEFAULT '' COMMENT '标签',
  `image` varchar(255) DEFAULT '' COMMENT '图片',
  `banner` varchar(255) DEFAULT '' COMMENT 'Banner图片',
  `diyname` varchar(100) DEFAULT '' COMMENT '自定义名称',
  `seotitle` varchar(255) DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `intro` varchar(255) DEFAULT NULL COMMENT '专题介绍',
  `views` int(10) UNSIGNED DEFAULT '0' COMMENT '浏览次数',
  `comments` int(10) UNSIGNED DEFAULT '0' COMMENT '评论次数',
  `iscomment` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '是否允许评论',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(16) DEFAULT NULL COMMENT '删除时间',
  `template` varchar(100) DEFAULT '' COMMENT '专题模板',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `diyname` (`diyname`),
  KEY `diyname_2` (`diyname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专题表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_spider_log`
--

DROP TABLE IF EXISTS `party_cms_spider_log`;
CREATE TABLE IF NOT EXISTS `party_cms_spider_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` enum('index','archives','page','special','channel','diyform','tag','user') DEFAULT NULL COMMENT '类型',
  `aid` int(10) DEFAULT '0' COMMENT '关联ID',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `url` varchar(255) DEFAULT '' COMMENT '来访页面',
  `nums` int(10) UNSIGNED DEFAULT '0' COMMENT '来访次数',
  `firsttime` bigint(16) DEFAULT NULL COMMENT '首次来访时间',
  `lastdata` varchar(100) DEFAULT '' COMMENT '最后5次来访时间',
  `lasttime` bigint(16) DEFAULT NULL COMMENT '最后来访时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='搜索引擎来访记录';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_study_record`
--

DROP TABLE IF EXISTS `party_cms_study_record`;
CREATE TABLE IF NOT EXISTS `party_cms_study_record` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `archives_id` int(10) UNSIGNED DEFAULT NULL COMMENT '文章ID',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(1500) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected') DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_archives` (`user_id`,`archives_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `createtime` (`createtime`),
  KEY `archives_id` (`archives_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习记录';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_tag`
--

DROP TABLE IF EXISTS `party_cms_tag`;
CREATE TABLE IF NOT EXISTS `party_cms_tag` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT '' COMMENT '标签名称',
  `nums` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文档数量',
  `seotitle` varchar(100) DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(10) DEFAULT NULL COMMENT '浏览次数',
  `autolink` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '自动内链',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `nums` (`nums`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_taggable`
--

DROP TABLE IF EXISTS `party_cms_taggable`;
CREATE TABLE IF NOT EXISTS `party_cms_taggable` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tag_id` int(10) DEFAULT NULL COMMENT '标签ID',
  `archives_id` int(10) DEFAULT NULL COMMENT '文档ID',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `archives_id` (`archives_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签列表';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_user_like`
--

DROP TABLE IF EXISTS `party_cms_user_like`;
CREATE TABLE IF NOT EXISTS `party_cms_user_like` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` enum('archives','page','special') DEFAULT 'archives' COMMENT '类型',
  `aid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关联ID（文章ID等）',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_type_aid` (`user_id`,`type`,`aid`),
  KEY `user_id` (`user_id`),
  KEY `type_aid` (`type`,`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞记录表';

-- --------------------------------------------------------

--
-- 表的结构 `party_config`
--

DROP TABLE IF EXISTS `party_config`;
CREATE TABLE IF NOT EXISTS `party_config` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '变量名',
  `group` varchar(30) DEFAULT '' COMMENT '分组',
  `title` varchar(100) DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `visible` varchar(255) DEFAULT '' COMMENT '可见条件',
  `value` text COMMENT '变量值',
  `content` text COMMENT '变量字典数据',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置';

--
-- 转存表中的数据 `party_config`
--

INSERT INTO `party_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES
(1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '', '智慧党建', '', 'required', '', NULL),
(2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '', NULL),
(3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '', ''),
(4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '', '1.0.2', '', 'required', '', NULL),
(5, 'timezone', 'basic', 'Timezone', '', 'string', '', 'Asia/Shanghai', '', 'required', '', NULL),
(6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '', NULL),
(7, 'languages', 'basic', 'Languages', '', 'array', '', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', NULL),
(8, 'fixedpage', 'basic', 'Fixed page', '请输入左侧菜单栏存在的链接', 'string', '', 'dashboard', '', 'required', '', NULL),
(9, 'categorytype', 'dictionary', 'Category type', '', 'array', '', '{\"default\":\"默认\",\"page\":\"单页\",\"article\":\"文章\"}', '', '', '', NULL),
(10, 'configgroup', 'dictionary', 'Config group', '', 'array', '', '{\"basic\":\"基础配置\",\"email\":\"邮件配置\",\"dictionary\":\"字典配置\",\"user\":\"会员配置\"}', '', '', '', NULL),
(11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '', '1', '[\"请选择\",\"SMTP\"]', '', '', ''),
(12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', '', 'smtp.qq.com', '', '', '', ''),
(13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '', '465', '', '', '', ''),
(14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '', '', '', '', '', ''),
(15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'password', '', '', '', '', '', ''),
(16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', ''),
(17, 'mail_from', 'email', 'Mail from', '', 'string', '', '', '', '', '', ''),
(18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '', '{\"category1\":\"分类一\",\"category2\":\"分类二\",\"custom\":\"自定义\"}', '', '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `party_ems`
--

DROP TABLE IF EXISTS `party_ems`;
CREATE TABLE IF NOT EXISTS `party_ems` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) DEFAULT '' COMMENT '事件',
  `email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邮箱验证码表';

-- --------------------------------------------------------

--
-- 表的结构 `party_sms`
--

DROP TABLE IF EXISTS `party_sms`;
CREATE TABLE IF NOT EXISTS `party_sms` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) UNSIGNED DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信验证码表';

-- --------------------------------------------------------

--
-- 表的结构 `party_user`
--

DROP TABLE IF EXISTS `party_user`;
CREATE TABLE IF NOT EXISTS `party_user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` varchar(30) DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `idcard` varchar(18) DEFAULT '' COMMENT '身份证号',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` bigint(16) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` bigint(16) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `loginfailuretime` bigint(16) DEFAULT NULL COMMENT '最后登录失败时间',
  `joinip` varchar(50) DEFAULT '' COMMENT '加入IP',
  `jointime` bigint(16) DEFAULT NULL COMMENT '加入时间',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) DEFAULT '' COMMENT 'Token',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  `verification` varchar(255) DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`),
  KEY `idcard` (`idcard`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

--
-- 转存表中的数据 `party_user`
--

INSERT INTO `party_user` (`id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `idcard`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `loginfailuretime`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`) VALUES
(1, 1, 'user_13973836967_b6Lg', '张三', 'd79d759db3f6a8951d51aae562ed4721', '716wrn', '', '13973836967', '121319960407914502', '', 0, 0, '1996-04-07', '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '127.0.0.1', 1761124748, 1761124748, 1761124748, '', 'normal', '');

-- --------------------------------------------------------

--
-- 表的结构 `party_user_group`
--

DROP TABLE IF EXISTS `party_user_group`;
CREATE TABLE IF NOT EXISTS `party_user_group` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='会员组表';

--
-- 转存表中的数据 `party_user_group`
--

INSERT INTO `party_user_group` (`id`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_user_money_log`
--

DROP TABLE IF EXISTS `party_user_money_log`;
CREATE TABLE IF NOT EXISTS `party_user_money_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员余额变动表';

-- --------------------------------------------------------

--
-- 表的结构 `party_user_rule`
--

DROP TABLE IF EXISTS `party_user_rule`;
CREATE TABLE IF NOT EXISTS `party_user_rule` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='会员规则表';

--
-- 转存表中的数据 `party_user_rule`
--

INSERT INTO `party_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal'),
(2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal'),
(3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal'),
(4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal'),
(5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal'),
(6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal'),
(7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal'),
(8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal'),
(9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal'),
(10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal'),
(11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal'),
(12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_user_score_log`
--

DROP TABLE IF EXISTS `party_user_score_log`;
CREATE TABLE IF NOT EXISTS `party_user_score_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员积分变动表';

-- --------------------------------------------------------

--
-- 表的结构 `party_user_token`
--

DROP TABLE IF EXISTS `party_user_token`;
CREATE TABLE IF NOT EXISTS `party_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `expiretime` bigint(16) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员Token表';

--
-- 转存表中的数据 `party_user_token`
--

INSERT INTO `party_user_token` (`token`, `user_id`, `createtime`, `expiretime`) VALUES
('67064809aef8e476ef20dcabae922dcf5899eb30', 1, 1761124748, 1763716748);

-- --------------------------------------------------------

--
-- 表的结构 `party_version`
--

DROP TABLE IF EXISTS `party_version`;
CREATE TABLE IF NOT EXISTS `party_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) DEFAULT '' COMMENT '包大小',
  `content` varchar(500) DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='版本表';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
