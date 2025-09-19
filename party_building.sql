-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2025-09-19 05:24:46
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
(1, 'admin', 'Admin', '2b4a3b6ed5c54571f745ef375dd7e6ed', '55f607', '/assets/img/avatar.png', 'admin@admin.com', '', 0, 1758257776, '0.0.0.0', 1491635035, 1758257776, '3de26c2c-8b56-409e-921d-0444d4d678b3', 'normal');

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
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COMMENT='管理员日志表';

--
-- 转存表中的数据 `party_admin_log`
--

INSERT INTO `party_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(1, 1, 'admin', '/ETgoRnSQIP.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"e2wq\",\"keeplogin\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758151594),
(2, 1, 'admin', '/ETgoRnSQIP.php/addon/install', '插件管理', '{\"name\":\"cms\",\"force\":\"0\",\"uid\":\"106637\",\"token\":\"***\",\"version\":\"2.2.0\",\"faversion\":\"1.6.1.20250430\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758155811),
(3, 1, 'admin', '/ETgoRnSQIP.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"cms\",\"action\":\"enable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758155812),
(4, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/clearcache', 'CMS管理', '', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758158388),
(5, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"169\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182632),
(6, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"156\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182644),
(7, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"184\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182654),
(8, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"187\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182668),
(9, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"193\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182678),
(10, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"141\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182687),
(11, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"88\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182738),
(12, 1, 'admin', '/ETgoRnSQIP.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;默认&quot;,&quot;page&quot;:&quot;单页&quot;,&quot;article&quot;:&quot;文章&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;基础配置&quot;,&quot;email&quot;:&quot;邮件配置&quot;,&quot;dictionary&quot;:&quot;字典配置&quot;,&quot;user&quot;:&quot;会员配置&quot;}\",\"attachmentcategory\":\"{&quot;category1&quot;:&quot;分类一&quot;,&quot;category2&quot;:&quot;分类二&quot;,&quot;custom&quot;:&quot;自定义&quot;}\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182793),
(13, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"8\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182849),
(14, 1, 'admin', '/ETgoRnSQIP.php/ajax/weigh', '', '{\"ids\":\"1,85,2,3,5,4,66\",\"changeid\":\"85\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758182954),
(15, 1, 'admin', '/ETgoRnSQIP.php/ajax/weigh', '', '{\"ids\":\"1,85,2,3,5,66,4\",\"changeid\":\"4\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183024),
(16, 1, 'admin', '/ETgoRnSQIP.php/ajax/weigh', '', '{\"ids\":\"1,85,2,3,5,4,66\",\"changeid\":\"5\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183029),
(17, 1, 'admin', '/ETgoRnSQIP.php/ajax/weigh', '', '{\"ids\":\"1,85,2,5,3,4,66\",\"changeid\":\"5\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183034),
(18, 1, 'admin', '/ETgoRnSQIP.php/ajax/weigh', '', '{\"ids\":\"1,85,2,5,66,3,4\",\"changeid\":\"66\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183041),
(19, 1, 'admin', '/ETgoRnSQIP.php/ajax/weigh', '', '{\"ids\":\"1,85,2,5,66,3,4\",\"changeid\":\"66\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183049),
(20, 1, 'admin', '/ETgoRnSQIP.php/ajax/weigh', '', '{\"ids\":\"1,85,2,5,66,3,4\",\"changeid\":\"66\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183064),
(21, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/edit/ids/4?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"addon\",\"title\":\"插件管理\",\"url\":\"\",\"icon\":\"fa fa-rocket\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"可在线安装、卸载、禁用、启用、配置、升级插件，插件升级前请做好备份。\",\"weigh\":\"88\",\"status\":\"normal\"},\"ids\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183094),
(22, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/edit/ids/4?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"addon\",\"title\":\"插件管理\",\"url\":\"\",\"icon\":\"fa fa-rocket\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"可在线安装、卸载、禁用、启用、配置、升级插件，插件升级前请做好备份。\",\"weigh\":\"0\",\"status\":\"normal\"},\"ids\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183106),
(23, 1, 'admin', '/ETgoRnSQIP.php/auth/rule/edit/ids/66?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"user\",\"title\":\"会员管理\",\"url\":\"\",\"icon\":\"fa fa-user-circle\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"weigh\":\"88\",\"status\":\"normal\"},\"ids\":\"66\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183117),
(24, 1, 'admin', '/ETgoRnSQIP.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"name\":\"智慧党建\",\"beian\":\"\",\"version\":\"1.0.2\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183164),
(25, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/clearcache', 'CMS管理', '', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183223),
(26, 1, 'admin', '/ETgoRnSQIP.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183843),
(27, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183942),
(28, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183942),
(29, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183942),
(30, 1, 'admin', '/ETgoRnSQIP.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758183987),
(31, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184045),
(32, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184045),
(33, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184045),
(34, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"y\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184050),
(35, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"yy\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184050),
(36, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"y\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184050),
(37, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"yyyg\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184051),
(38, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"言\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184052),
(39, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"yygy\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184053),
(40, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"文\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184053),
(41, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"文u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184054),
(42, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"文ujj\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184054),
(43, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"文章\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184054),
(44, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184219),
(45, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184247),
(46, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184250),
(47, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184257),
(48, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184269),
(49, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184273),
(50, 1, 'admin', '/ETgoRnSQIP.php/cms/modelx/add?dialog=1', 'CMS管理 / 模型管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"文章\",\"table\":\"cms_addon_article\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184280),
(51, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184322),
(52, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184322),
(53, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184322),
(54, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184353),
(55, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"udi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184354),
(56, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184354),
(57, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"头t\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184355),
(58, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"头条\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184356),
(59, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"头条u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184356),
(60, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"头条新bu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184357),
(61, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"头条新\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184357),
(62, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"头条新ub\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184358),
(63, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"头条新闻\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184359),
(64, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"头条新闻\",\"name\":\"row[name]\",\"value\":\"头条新闻\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184360),
(65, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"news\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184401),
(66, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184401),
(67, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/add?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"头条新闻\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"news\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184411),
(68, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184499),
(69, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184499),
(70, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184499),
(71, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184516),
(72, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184516),
(73, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184516),
(74, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184517),
(75, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipkh\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184518),
(76, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"常\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184518),
(77, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184519),
(78, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184520),
(79, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipkm\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184520),
(80, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"赏\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184520),
(81, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184521),
(82, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184522),
(83, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184522),
(84, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党k\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184523),
(85, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党km\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184523),
(86, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184523),
(87, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员学\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184524),
(88, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员学n\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184524),
(89, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员学nu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184524),
(90, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员学习\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184525),
(91, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"党员学习\",\"name\":\"row[name]\",\"value\":\"党员学习\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184536),
(92, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"study\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184544),
(93, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/add?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"党员学习\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"study\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184553),
(94, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184589),
(95, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184589),
(96, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184589),
(97, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184728),
(98, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184728),
(99, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184728),
(100, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184741),
(101, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184741),
(102, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184741),
(103, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184757),
(104, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184757),
(105, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184757),
(106, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184820),
(107, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184820),
(108, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184820),
(109, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184824),
(110, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184824),
(111, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184825),
(112, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184825),
(113, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipkm\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184825),
(114, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"赏\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184826),
(115, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184827),
(116, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184827),
(117, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184828),
(118, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党k\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184828),
(119, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员f\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184829),
(120, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员动dy\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184830),
(121, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员动dyn\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184830),
(122, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184830),
(123, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"党员动态\",\"name\":\"row[name]\",\"value\":\"党员动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184833),
(124, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"dangyuandongtai\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184836),
(125, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"activities\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184986),
(126, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/add?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"党员动态\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"activities\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758184990),
(127, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185005),
(128, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185005),
(129, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185005),
(130, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185049),
(131, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185049),
(132, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185050),
(133, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipkm\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185050),
(134, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"赏\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185051),
(135, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185052),
(136, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185052),
(137, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党k\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185053),
(138, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员服务\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185054),
(139, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"党员服务\",\"name\":\"row[name]\",\"value\":\"党员服务\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185056),
(140, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"services\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185066),
(141, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/add?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"党员服务\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"services\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185067),
(142, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185337),
(143, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185337),
(144, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185337),
(145, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185373),
(146, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185373),
(147, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185373),
(148, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"uth\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185379),
(149, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185380),
(150, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"uth\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185381),
(151, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185381);
INSERT INTO `party_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(152, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首dm\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185381),
(153, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首页\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185381),
(154, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"首页\",\"name\":\"row[name]\",\"value\":\"首页\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185384),
(155, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"index\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185420),
(156, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185603),
(157, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185603),
(158, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185603),
(159, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185607),
(160, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"uth\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185607),
(161, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185607),
(162, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"uth\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185608),
(163, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185608),
(164, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首dm\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185609),
(165, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首页\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185609),
(166, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"首页\",\"name\":\"row[name]\",\"value\":\"首页\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185611),
(167, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"index\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185617),
(168, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/add?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"link\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"首页\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"index\",\"outlink\":\"\\/\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185628),
(169, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185801),
(170, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185801),
(171, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185801),
(172, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"news\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185808),
(173, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/edit/ids/1?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"5\",\"name\":\"头条新闻\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"news\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"1\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185808),
(174, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185851),
(175, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185851),
(176, 1, 'admin', '/ETgoRnSQIP.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185851),
(177, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"news\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185859),
(178, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/edit/ids/1?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"头条新闻\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"news\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"1\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185859),
(179, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"weigh=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185911),
(180, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"weigh=4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185929),
(181, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"weigh=2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185941),
(182, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"isnav=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758185960),
(183, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"weigh=3\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758186010),
(184, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"weigh=4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758186016),
(185, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"weigh=4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758186030),
(186, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"weigh=3\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758186040),
(187, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"weigh=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758186048),
(188, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"3\",\"params\":\"weigh=2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758186053),
(189, 1, 'admin', '/ETgoRnSQIP.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"isnav=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758186071),
(190, 0, 'Unknown', '/admin.php/index/login', '', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"IMZO\",\"keeplogin\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758257767),
(191, 1, 'admin', '/admin.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"qxaq\",\"keeplogin\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758257776);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='附件表';

--
-- 转存表中的数据 `party_attachment`
--

INSERT INTO `party_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
(1, '', 1, 0, '/assets/img/qrcode.png', 150, 150, 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');

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
(4, 'file', 0, 'addon', '插件管理', 'fa fa-rocket', '', '', '可在线安装、卸载、禁用、启用、配置、升级插件，插件升级前请做好备份。', 1, 'addtabs', '', 'cjgl', 'chajianguanli', 1491635035, 1758183106, 0, 'normal'),
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
(79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1491635035, 0, 'normal'),
(80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(85, 'file', 0, 'cms', 'CMS管理', 'fa fa-file-text', '', '', '', 1, NULL, '', 'Cgl', 'CMSguanli', 1758155809, 1758155809, 137, 'normal'),
(86, 'file', 85, 'cms/config', '站点配置', 'fa fa-gears', '', '', '', 1, NULL, '', 'zdpz', 'zhandianpeizhi', 1758155809, 1758155809, 22, 'normal'),
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
(120, 'file', 85, 'cms/tag', '标签管理', 'fa fa-tags', '', '', '用于管理文章关联的标签,标签的添加在添加文章时自动维护,无需手动添加标签', 1, NULL, '', 'bqgl', 'biaoqianguanli', 1758155809, 1758155809, 17, 'normal'),
(121, 'file', 120, 'cms/tag/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(122, 'file', 120, 'cms/tag/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(123, 'file', 120, 'cms/tag/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(124, 'file', 120, 'cms/tag/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(125, 'file', 120, 'cms/tag/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(126, 'file', 85, 'cms/block', '区块管理', 'fa fa-th-large', '', '', '用于管理站点的自定义区块内容，常用于广告、JS脚本、焦点图、片段代码等', 1, NULL, '', 'qkgl', 'qukuaiguanli', 1758155809, 1758155809, 16, 'normal'),
(127, 'file', 126, 'cms/block/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(128, 'file', 126, 'cms/block/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(129, 'file', 126, 'cms/block/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(130, 'file', 126, 'cms/block/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(131, 'file', 126, 'cms/block/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(132, 'file', 85, 'cms/page', '单页管理', 'fa fa-file', '', '', '用于管理网站的单页面', 1, NULL, '', 'dygl', 'danyeguanli', 1758155809, 1758155809, 15, 'normal'),
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
(147, 'file', 85, 'cms/comment', '评论管理', 'fa fa-comment', '', '', '用于管理用户在网站上发表的评论', 1, NULL, '', 'plgl', 'pinglunguanli', 1758155809, 1758155809, 14, 'normal'),
(148, 'file', 147, 'cms/comment/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758155809, 1758155809, 0, 'normal'),
(149, 'file', 147, 'cms/comment/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758155809, 1758155809, 0, 'normal'),
(150, 'file', 147, 'cms/comment/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1758155809, 1758155809, 0, 'normal'),
(151, 'file', 147, 'cms/comment/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758155809, 1758155809, 0, 'normal'),
(152, 'file', 147, 'cms/comment/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758155809, 1758155809, 0, 'normal'),
(153, 'file', 147, 'cms/comment/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1758155809, 1758155809, 0, 'normal'),
(154, 'file', 147, 'cms/comment/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1758155809, 1758155809, 0, 'normal'),
(155, 'file', 147, 'cms/comment/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1758155809, 1758155809, 0, 'normal'),
(156, 'file', 85, 'cms/diyform', '自定义表单管理', 'fa fa-list', '', '', '可在线创建自定义表单，管理表单字段和数据列表', 0, NULL, '', 'zdybdgl', 'zidingyibiaodanguanli', 1758155809, 1758182644, 13, 'normal'),
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
(175, 'file', 85, 'cms/special', '专题管理', 'fa fa-newspaper-o', '', '', '可在线管理专题列表', 1, NULL, '', 'ztgl', 'zhuantiguanli', 1758155809, 1758155809, 10, 'normal'),
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

--
-- 转存表中的数据 `party_category`
--

INSERT INTO `party_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1491635035, 1491635035, 1, 'normal'),
(2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1491635035, 1491635035, 2, 'normal'),
(3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1491635035, 1491635035, 3, 'normal'),
(4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1491635035, 1491635035, 4, 'normal'),
(5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1491635035, 1491635035, 5, 'normal'),
(6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1491635035, 1491635035, 6, 'normal'),
(7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1491635035, 1491635035, 7, 'normal'),
(8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1491635035, 1491635035, 8, 'normal'),
(9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1491635035, 1491635035, 9, 'normal'),
(10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1491635035, 1491635035, 10, 'normal'),
(11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1491635035, 1491635035, 11, 'normal'),
(12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1491635035, 1491635035, 12, 'normal'),
(13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1491635035, 1491635035, 13, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_addondownload`
--

DROP TABLE IF EXISTS `party_cms_addondownload`;
CREATE TABLE IF NOT EXISTS `party_cms_addondownload` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `os` set('windows','linux','mac','ubuntu') DEFAULT '' COMMENT '操作系统',
  `version` varchar(255) DEFAULT '' COMMENT '最新版本',
  `filesize` varchar(255) DEFAULT '' COMMENT '文件大小',
  `language` set('zh-cn','en') DEFAULT '' COMMENT '语言',
  `downloadurl` varchar(1500) DEFAULT '' COMMENT '下载地址',
  `screenshots` varchar(1500) DEFAULT '' COMMENT '预览截图',
  `downloads` varchar(10) DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='下载';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_addonnews`
--

DROP TABLE IF EXISTS `party_cms_addonnews`;
CREATE TABLE IF NOT EXISTS `party_cms_addonnews` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `author` varchar(50) DEFAULT '' COMMENT '作者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新闻';

-- --------------------------------------------------------

--
-- 表的结构 `party_cms_addonproduct`
--

DROP TABLE IF EXISTS `party_cms_addonproduct`;
CREATE TABLE IF NOT EXISTS `party_cms_addonproduct` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `productdata` varchar(1500) DEFAULT '' COMMENT '产品列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='内容表';

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
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区块表';

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='栏目表';

--
-- 转存表中的数据 `party_cms_channel`
--

INSERT INTO `party_cms_channel` (`id`, `type`, `model_id`, `parent_id`, `name`, `image`, `flag`, `seotitle`, `keywords`, `description`, `diyname`, `outlink`, `linktype`, `linkid`, `items`, `weigh`, `channeltpl`, `listtpl`, `showtpl`, `pagesize`, `vip`, `listtype`, `iscontribute`, `isnav`, `createtime`, `updatetime`, `status`) VALUES
(1, 'list', 1, 0, '头条新闻', '', '', '', '', '', 'news', '', '', 0, 0, 4, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758184411, 1758186071, 'normal'),
(2, 'channel', 1, 0, '党员学习', '', '', '', '', '', 'study', '', '', 0, 0, 3, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758184553, 1758186040, 'normal'),
(3, 'list', 1, 0, '党员动态', '', '', '', '', '', 'activities', '', '', 0, 0, 2, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758184990, 1758186053, 'normal'),
(4, 'list', 1, 0, '党员服务', '', '', '', '', '', 'services', '', '', 0, 0, 1, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758185067, 1758186048, 'normal'),
(5, 'link', 0, 0, '首页', '', '', '', '', '', 'index', '/', '', 0, 0, 5, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758185628, 1758185628, 'normal');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='自定义表单表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模型字段表';

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='内容模型表';

--
-- 转存表中的数据 `party_cms_model`
--

INSERT INTO `party_cms_model` (`id`, `name`, `table`, `fields`, `channeltpl`, `listtpl`, `showtpl`, `createtime`, `updatetime`, `setting`) VALUES
(1, '文章', 'cms_addon_article', NULL, 'channel_news.html', 'list_news.html', 'show_news.html', 1758184280, 1758184280, '{\"contributefields\":[\"channel_ids\",\"image\",\"images\",\"tags\",\"price\",\"outlink\",\"content\",\"keywords\",\"description\"],\"publishfields\":[\"channel_ids\",\"user_id\",\"special_ids\",\"image\",\"images\",\"diyname\",\"tags\",\"price\",\"outlink\",\"content\",\"seotitle\",\"keywords\",\"description\"]}');

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
-- 表的结构 `party_test`
--

DROP TABLE IF EXISTS `party_test`;
CREATE TABLE IF NOT EXISTS `party_test` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) DEFAULT '0' COMMENT '会员ID',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) DEFAULT NULL COMMENT '分类ID(多选)',
  `tags` varchar(255) DEFAULT '' COMMENT '标签',
  `week` enum('monday','tuesday','wednesday') DEFAULT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') DEFAULT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `image` varchar(100) DEFAULT '' COMMENT '图片',
  `images` varchar(1500) DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) DEFAULT '' COMMENT '附件',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `city` varchar(100) DEFAULT '' COMMENT '省市',
  `array` varchar(255) DEFAULT '' COMMENT '数组:value=值',
  `json` varchar(255) DEFAULT '' COMMENT '配置:key=名称,value=值',
  `multiplejson` varchar(1500) DEFAULT '' COMMENT '二维数组:title=标题,intro=介绍,author=作者,age=年龄',
  `price` decimal(10,2) UNSIGNED DEFAULT '0.00' COMMENT '价格',
  `views` int(10) UNSIGNED DEFAULT '0' COMMENT '点击',
  `workrange` varchar(100) DEFAULT '' COMMENT '时间区间',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` bigint(16) DEFAULT NULL COMMENT '刷新时间',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(16) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='测试表';

--
-- 转存表中的数据 `party_test`
--

INSERT INTO `party_test` (`id`, `user_id`, `admin_id`, `category_id`, `category_ids`, `tags`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `array`, `json`, `multiplejson`, `price`, `views`, `workrange`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `deletetime`, `weigh`, `switch`, `status`, `state`) VALUES
(1, 1, 1, 12, '12,13', '互联网,计算机', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '我是一篇测试文章描述，内容过多时将自动隐藏', '广西壮族自治区/百色市/平果县', '[\"a\",\"b\"]', '{\"a\":\"1\",\"b\":\"2\"}', '[{\"title\":\"标题一\",\"intro\":\"介绍一\",\"author\":\"小明\",\"age\":\"21\"}]', 0.00, 0, '2020-10-01 00:00:00 - 2021-10-31 23:59:59', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', 1491635035, 1491635035, 1491635035, NULL, 0, 1, 'normal', '1');

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
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

--
-- 转存表中的数据 `party_user`
--

INSERT INTO `party_user` (`id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `loginfailuretime`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`) VALUES
(1, 1, 'admin', 'admin', '2b5791008fe4243a543befc33ced1b3b', 'b44dc1', 'admin@163.com', '13000000000', '/assets/img/avatar.png', 0, 0, '2017-04-08', '', 0.00, 0, 1, 1, 1491635035, 1491635035, '127.0.0.1', 0, 1491635035, '127.0.0.1', 1491635035, 0, 1491635035, '', 'normal', ''),
(2, 0, 'pcuser', 'pcuser', '8254c8bf6e20f7b96c14017255141b35', 'I1xbyc', 'user@test.com', '13212345678', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1758254171, 1758254295, '0.0.0.0', 0, NULL, '0.0.0.0', 1758244923, 1758244923, 1758254295, '', 'normal', '');

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
