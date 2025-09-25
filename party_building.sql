-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2025-09-25 10:43:10
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
(1, 'admin', 'Admin', '2b4a3b6ed5c54571f745ef375dd7e6ed', '55f607', '/assets/img/avatar.png', 'admin@admin.com', '', 0, 1758711877, '0.0.0.0', 1491635035, 1758711877, 'e770a1c4-138a-4bdf-a4a7-a7bd32db68f9', 'normal');

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
) ENGINE=InnoDB AUTO_INCREMENT=807 DEFAULT CHARSET=utf8mb4 COMMENT='管理员日志表';

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
(191, 1, 'admin', '/admin.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"qxaq\",\"keeplogin\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758257776),
(192, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758261983),
(193, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758261983),
(194, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758261983),
(195, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262001),
(196, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"im\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262039),
(197, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"imj\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262039),
(198, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262039),
(199, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"im\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262040),
(200, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"测ya\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262041),
(201, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"测试文\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262042),
(202, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"测试文siv\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262042),
(203, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"测试文档\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262043),
(204, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"ce-shi-wen-dang\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262113),
(205, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"1\",\"special_ids\":\"\",\"title\":\"测试文档\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"ce-shi-wen-dang\",\"content\":\"测试测试\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"flag\":[\"new\"],\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-19 14:06:39\",\"channel_ids\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262113),
(206, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262113),
(207, 1, 'admin', '/admin.php/cms/archives/get_channel_model_info', 'CMS管理 / 内容管理', '{\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262120),
(208, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262145),
(209, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"ce-shi-wen-dang\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262164),
(210, 1, 'admin', '/admin.php/cms/archives/edit/ids/1?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"1\",\"special_ids\":\"\",\"title\":\"测试文档\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"ce-shi-wen-dang\",\"content\":\"测试测试\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"1\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"flag\":[\"new\"],\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"1\",\"iscomment\":\"0\",\"createtime\":\"2025-09-19 14:08:33\",\"publishtime\":\"2025-09-19 14:06:39\",\"channel_ids\":[\"\"]},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758262164),
(211, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758597886),
(212, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"special\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758597923),
(213, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758598756),
(214, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758598784),
(215, 1, 'admin', '/admin.php/cms/ajax/check_content_islegal', 'CMS管理', '{\"content\":\"妈的\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758598825),
(216, 1, 'admin', '/admin.php/cms/ajax/check_content_islegal', 'CMS管理', '{\"content\":\"他妈的\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758598832),
(217, 1, 'admin', '/admin.php/cms/ajax/check_content_islegal', 'CMS管理', '{\"content\":\"傻逼\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758598838),
(218, 1, 'admin', '/admin.php/cms/ajax/check_content_islegal', 'CMS管理', '{\"content\":\"共产党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758598852),
(219, 1, 'admin', '/admin.php/cms/ajax/check_content_islegal', 'CMS管理', '{\"content\":\"习近平\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758598859),
(220, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599049),
(221, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599049),
(222, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599049),
(223, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599074),
(224, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599074),
(225, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599074),
(226, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599079),
(227, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党v动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599080),
(228, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党建动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599081),
(229, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"3\",\"name\":\"row[diyname]\",\"value\":\"dangjiandongtai\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599105),
(230, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599109),
(231, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599109),
(232, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599109),
(233, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"3\",\"name\":\"row[diyname]\",\"value\":\"activities\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599118),
(234, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599120),
(235, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党v动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599120),
(236, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党vfhp动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599121),
(237, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党建动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599121),
(238, 1, 'admin', '/admin.php/cms/channel/edit/ids/3?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"党建动态\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"activities\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"2\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599136),
(239, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599146),
(240, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599146),
(241, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599146),
(242, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"4\",\"name\":\"row[diyname]\",\"value\":\"services\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599154),
(243, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党服务\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599155),
(244, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党v服务\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599156),
(245, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党vfhp服务\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599156),
(246, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党建服务\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599157),
(247, 1, 'admin', '/admin.php/cms/channel/edit/ids/4?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"党建服务\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"services\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"1\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599166),
(248, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599294),
(249, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599294),
(250, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599294),
(251, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"dg\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599308),
(252, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"三\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599309),
(253, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"三wf\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599309),
(254, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"三会\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599310),
(255, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"三会一\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599310),
(256, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"三会一y\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599311),
(257, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"三会一yj\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599311),
(258, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"三会一课\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599311),
(259, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"三会一课\",\"name\":\"row[name]\",\"value\":\"三会一课\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599318),
(260, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"meeting\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599357),
(261, 1, 'admin', '/admin.php/cms/channel/add/parent_id/2?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"2\",\"name\":\"三会一课\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"meeting\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"parent_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599363),
(262, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599376),
(263, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599376),
(264, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599376),
(265, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599382),
(266, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ige\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599383),
(267, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599383),
(268, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"精\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599384),
(269, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"精选\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599385),
(270, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"精选shu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599386),
(271, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"精选shu\'ji\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599386),
(272, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"精选书籍\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599387),
(273, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"精选书籍\",\"name\":\"row[name]\",\"value\":\"精选书籍\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599393),
(274, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"books\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599398),
(275, 1, 'admin', '/admin.php/cms/channel/add/parent_id/2?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"2\",\"name\":\"精选书籍\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"books\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"parent_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599399),
(276, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599410),
(277, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599410),
(278, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599410),
(279, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599435),
(280, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599435),
(281, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599435),
(282, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipkm\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599437),
(283, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599437),
(284, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党k\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599438),
(285, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党km\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599438),
(286, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599438),
(287, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员y\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599439),
(288, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员课\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599439),
(289, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员课tkg\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599440),
(290, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员课程\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599440),
(291, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"党员课程\",\"name\":\"row[name]\",\"value\":\"党员课程\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599442),
(292, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"lessons\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599457),
(293, 1, 'admin', '/admin.php/cms/channel/add/parent_id/2?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"2\",\"name\":\"党员课程\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"lessons\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"parent_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599458),
(294, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599473),
(295, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599473),
(296, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599473),
(297, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"a\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599476),
(298, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ad\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599476),
(299, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"a\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599476),
(300, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"a\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599477),
(301, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"基\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599477);
INSERT INTO `party_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(302, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"基nf\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599478),
(303, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"基层\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599478),
(304, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"基层f\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599479),
(305, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"基层动\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599479),
(306, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"基层动dy\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599479),
(307, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"基层动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599480),
(308, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"基层动态\",\"name\":\"row[name]\",\"value\":\"基层动态\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599482),
(309, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"primary\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599635),
(310, 1, 'admin', '/admin.php/cms/channel/add/parent_id/3?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"3\",\"name\":\"基层动态\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"primary\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"parent_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599636),
(311, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599641),
(312, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599641),
(313, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599641),
(314, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599769),
(315, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599769),
(316, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599769),
(317, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"xe\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599774),
(318, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"级\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599775),
(319, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"组\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599776),
(320, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"组织it\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599777),
(321, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"组织活f\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599778),
(322, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"组织活动\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599779),
(323, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"组织活动\",\"name\":\"row[name]\",\"value\":\"组织活动\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599781),
(324, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"party\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599824),
(325, 1, 'admin', '/admin.php/cms/channel/add/parent_id/3?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"3\",\"name\":\"组织活动\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"party\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"parent_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599832),
(326, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600208),
(327, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600218),
(328, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党旗\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600235),
(329, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600281),
(330, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党旗\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600327),
(331, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600328),
(332, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"q_word\":[\"党的基本符号\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"党的基本符号\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600470),
(333, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"page\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600482),
(334, 1, 'admin', '/admin.php/cms/page/check_element_available', 'CMS管理 / 单页管理', '{\"id\":\"\",\"name\":\"row[diyname]\",\"value\":\"Symbols\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600569),
(335, 1, 'admin', '/admin.php/cms/page/check_element_available', 'CMS管理 / 单页管理', '{\"id\":\"\",\"name\":\"row[diyname]\",\"value\":\"flag\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600638),
(336, 1, 'admin', '/admin.php/cms/page/add?dialog=1', 'CMS管理 / 单页管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"type\":\"党的基本符号\",\"title\":\"中国共产党党旗\",\"image\":\"\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"flag\",\"showtpl\":\"page.html\",\"weigh\":\"0\",\"iscomment\":\"0\",\"parsetpl\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600638),
(337, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600643),
(338, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党旗\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600647),
(339, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600649),
(340, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600650),
(341, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党ujj\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600651),
(342, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党uj\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600651),
(343, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600652),
(344, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600652),
(345, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600652),
(346, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党ujj\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600653),
(347, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党章\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600653),
(348, 1, 'admin', '/admin.php/cms/page/check_element_available', 'CMS管理 / 单页管理', '{\"id\":\"\",\"name\":\"row[diyname]\",\"value\":\"charter\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600719),
(349, 1, 'admin', '/admin.php/cms/page/add?dialog=1', 'CMS管理 / 单页管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"type\":\"党的基本符号\",\"title\":\"中国共产党党章\",\"image\":\"\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"charter\",\"showtpl\":\"\",\"weigh\":\"0\",\"iscomment\":\"0\",\"parsetpl\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600729),
(350, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"中国共产党党徽\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600745),
(351, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600746),
(352, 1, 'admin', '/admin.php/cms/page/check_element_available', 'CMS管理 / 单页管理', '{\"id\":\"\",\"name\":\"row[diyname]\",\"value\":\"zhongguogongchandangdanghui\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600751),
(353, 1, 'admin', '/admin.php/cms/page/check_element_available', 'CMS管理 / 单页管理', '{\"id\":\"\",\"name\":\"row[diyname]\",\"value\":\"symbols\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600766),
(354, 1, 'admin', '/admin.php/cms/page/add?dialog=1', 'CMS管理 / 单页管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"type\":\"党的基本符号\",\"title\":\"中国共产党党徽\",\"image\":\"\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"symbols\",\"showtpl\":\"\",\"weigh\":\"0\",\"iscomment\":\"0\",\"parsetpl\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600771),
(355, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600846),
(356, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600846),
(357, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600846),
(358, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600852),
(359, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"uth\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600853),
(360, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"u\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600853),
(361, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"uth\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600854),
(362, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600855),
(363, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首dm\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600855),
(364, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首dmu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600855),
(365, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"首页\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600856),
(366, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"首页\",\"name\":\"row[name]\",\"value\":\"首页\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600908),
(367, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"shouye\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600910),
(368, 1, 'admin', '/admin.php/cms/channel/add?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"首页\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"shouye\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600910),
(369, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600923),
(370, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600923),
(371, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600923),
(372, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"news\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600939),
(373, 1, 'admin', '/admin.php/cms/channel/edit/ids/1?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"parent_id\":\"11\",\"name\":\"头条新闻\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"news\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"4\",\"iscontribute\":\"0\",\"isnav\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758600940),
(374, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758601065),
(375, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758601065),
(376, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758601065),
(377, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"news\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758601076),
(378, 1, 'admin', '/admin.php/cms/channel/edit/ids/1?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"parent_id\":\"0\",\"name\":\"头条新闻\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"news\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"4\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758601077),
(379, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"11\",\"params\":\"isnav=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758601097),
(380, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758601355),
(381, 1, 'admin', '/admin.php/addon/install', '插件管理', '{\"name\":\"tinymce\",\"force\":\"0\",\"uid\":\"106637\",\"token\":\"***\",\"version\":\"1.0.6\",\"faversion\":\"1.6.1.20250430\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603355),
(382, 1, 'admin', '/admin.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"tinymce\",\"action\":\"enable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603355),
(383, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603375),
(384, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603597),
(385, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603597),
(386, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603597),
(387, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603604),
(388, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603604),
(389, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603605),
(390, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党k\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603605),
(391, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603605),
(392, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员x\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603606),
(393, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员xn\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603607),
(394, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员纪\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603608),
(395, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员纪pu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603608),
(396, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员纪实\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603608),
(397, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"11\",\"name\":\"row[diyname]\",\"value\":\"dangyuanjishi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603613),
(398, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"11\",\"name\":\"row[diyname]\",\"value\":\"record\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603670),
(399, 1, 'admin', '/admin.php/cms/channel/edit/ids/11?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"党员纪实\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"record\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"11\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"11\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603671),
(400, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603754),
(401, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603754),
(402, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603754),
(403, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603759),
(404, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603759),
(405, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ip\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603760),
(406, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603760),
(407, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipkm\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603761),
(408, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"赏\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603761),
(409, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603762),
(410, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603763),
(411, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党k\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603763),
(412, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603763),
(413, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员t\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603764),
(414, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员tfq\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603764),
(415, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员先\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603764),
(416, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员先mt\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603765),
(417, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员先mtd\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603765),
(418, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员先峰\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603766),
(419, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"党员先峰\",\"name\":\"row[name]\",\"value\":\"党员先峰\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603771),
(420, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员先\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603830),
(421, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员先q\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603831),
(422, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员先qt\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603831),
(423, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员先qtd\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603832),
(424, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党员先锋\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603832),
(425, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"党员先锋\",\"name\":\"row[name]\",\"value\":\"党员先锋\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603834),
(426, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"pioneer\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603844),
(427, 1, 'admin', '/admin.php/cms/channel/add?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"党员先锋\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"pioneer\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603844),
(428, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"5\",\"params\":\"weigh=13\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603868),
(429, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"weigh=12\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603880),
(430, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"5\",\"params\":\"weigh=12\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603894),
(431, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"12\",\"params\":\"weigh=10\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603911),
(432, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603977),
(433, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603977),
(434, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603977),
(435, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603982),
(436, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603982),
(437, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"yt\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603983),
(438, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"放\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603984),
(439, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ty\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603984),
(440, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"入\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603985),
(441, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"入ipk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603985),
(442, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"入党\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603986),
(443, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"入党iy\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603987),
(444, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"入党流程\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603988),
(445, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"入党流程\",\"name\":\"row[name]\",\"value\":\"入党流程\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758603993),
(446, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"name\":\"row[diyname]\",\"value\":\"process\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604046),
(447, 1, 'admin', '/admin.php/cms/channel/add?dialog=1', 'CMS管理 / 栏目管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"入党流程\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"process\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"listtype\":\"0\",\"iscontribute\":\"0\",\"isnav\":\"1\",\"status\":\"normal\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604047),
(448, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"5\",\"params\":\"weigh=13\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604072),
(449, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"13\",\"params\":\"weigh=12\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604109),
(450, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"13\",\"params\":\"weigh=11\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604127),
(451, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"11\",\"params\":\"weigh=10\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604159),
(452, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"12\",\"params\":\"weigh=9\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604187),
(453, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"weigh=4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604322),
(454, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"iscontribute=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604584),
(455, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"iscontribute=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604586),
(456, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"isnav=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604588),
(457, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"13\",\"params\":\"isnav=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604590),
(458, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"11\",\"params\":\"isnav=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604593),
(459, 1, 'admin', '/admin.php/cms/channel/multi', 'CMS管理 / 栏目管理 / 批量更新', '{\"action\":\"\",\"ids\":\"12\",\"params\":\"isnav=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604594),
(460, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604858);
INSERT INTO `party_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(461, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604861),
(462, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入党申请\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604876),
(463, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604950),
(464, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604978),
(465, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604978),
(466, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758604978),
(467, 1, 'admin', '/admin.php/cms/fields/multi/source/model/source_id/1', 'CMS管理 / 字段管理 / 批量更新', '{\"action\":\"\",\"ids\":\"price\",\"params\":\"ispublish=0\",\"source\":\"model\",\"source_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605057),
(468, 1, 'admin', '/admin.php/cms/fields/multi/source/model/source_id/1', 'CMS管理 / 字段管理 / 批量更新', '{\"action\":\"\",\"ids\":\"price\",\"params\":\"iscontribute=0\",\"source\":\"model\",\"source_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605061),
(469, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605076),
(470, 1, 'admin', '/admin.php/cms/fields/multi/source/model/source_id/1', 'CMS管理 / 字段管理 / 批量更新', '{\"action\":\"\",\"ids\":\"outlink\",\"params\":\"ispublish=0\",\"source\":\"model\",\"source_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605115),
(471, 1, 'admin', '/admin.php/cms/fields/multi/source/model/source_id/1', 'CMS管理 / 字段管理 / 批量更新', '{\"action\":\"\",\"ids\":\"outlink\",\"params\":\"iscontribute=0\",\"source\":\"model\",\"source_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605118),
(472, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605170),
(473, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605244),
(474, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605272),
(475, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605277),
(476, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"rj\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605282),
(477, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"r\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605282),
(478, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605284),
(479, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605284),
(480, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入ip\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605285),
(481, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入ipk\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605285),
(482, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入党\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605286),
(483, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入党j\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605287),
(484, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入党jh\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605287),
(485, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入党jhk\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605287),
(486, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入党申y\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605288),
(487, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"提交入党申请\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605288),
(488, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"ti-jiao-ru-dang-shen-qing\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605293),
(489, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"提交入党申请\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"ti-jiao-ru-dang-shen-qing\",\"content\":\"\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-23 13:27:52\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605293),
(490, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605301),
(491, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"i\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605308),
(492, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ipk\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605309),
(493, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605310),
(494, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党xeg\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605310),
(495, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党组\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605311),
(496, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党组织\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605312),
(497, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党组织y\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605312),
(498, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党组织yo\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605313),
(499, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党组织谈yt\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605314),
(500, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党组织谈ytd\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605314),
(501, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"党组织谈话\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605314),
(502, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"dang-zu-zhi-tan-hua\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605320),
(503, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"党组织谈话\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"dang-zu-zhi-tan-hua\",\"content\":\"\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-23 13:28:20\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605320),
(504, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605329),
(505, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605363),
(506, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"rwyg\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605367),
(507, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推a\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605368),
(508, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推adh\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605368),
(509, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605369),
(510, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605369),
(511, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和w\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605370),
(512, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605370),
(513, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公f\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605371),
(514, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公fi\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605371),
(515, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公示\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605371),
(516, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公示tk\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605372),
(517, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公示tkw\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605372),
(518, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公示积se\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605373),
(519, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公示积极\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605373),
(520, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公示积极w\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605374),
(521, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公示积极wv\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605374),
(522, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公示积极分bb\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605375),
(523, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"推荐和公示积极分子\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605375),
(524, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"tui-jian-he-gong-shi-ji-ji-fen-zi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605378),
(525, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"推荐和公示积极分子\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"tui-jian-he-gong-shi-ji-ji-fen-zi\",\"content\":\"\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-23 13:29:22\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605378),
(526, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605385),
(527, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"g\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605387),
(528, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605388),
(529, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年c\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605388),
(530, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年马上就\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605389),
(531, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年马上就f\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605389),
(532, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605390),
(533, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年c\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605390),
(534, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605391),
(535, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以上fu\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605391),
(536, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以上fuk\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605392),
(537, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以上培yang\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605392),
(538, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以上培养\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605395),
(539, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以上培养ftb\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605395),
(540, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以上培养ftbt\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605396),
(541, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以上培养教yc\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605396),
(542, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以上培养教yce\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605396),
(543, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年以上培养教育\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605397),
(544, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"yi-nian-yi-shang-pei-yang-jiao-yu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605400),
(545, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"一年以上培养教育\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"yi-nian-yi-shang-pei-yang-jiao-yu\",\"content\":\"\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-23 13:29:45\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605400),
(546, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605412),
(547, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"确\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605416),
(548, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"确定发\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605417),
(549, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"确定发naf\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605417),
(550, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"确定发展示\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605418),
(551, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"确定发展\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605418),
(552, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"确定发展对qje\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605419),
(553, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"确定发展对象\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605419),
(554, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"que-ding-fa-zhan-dui-xiang\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605421),
(555, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"确定发展对象\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"que-ding-fa-zhan-dui-xiang\",\"content\":\"\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-23 13:30:12\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605421),
(556, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605427),
(557, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"gbt\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605431),
(558, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"g\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605432),
(559, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"g\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605432),
(560, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"gh\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605433),
(561, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"ght\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605433),
(562, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"政\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605433),
(563, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"政pj\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605434),
(564, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"政审\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605434),
(565, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"政审\\/\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605436),
(566, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"政审\\/fu\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605436),
(567, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"政审\\/fuk\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605436),
(568, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"政审\\/培\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605437),
(569, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"政审\\/培y\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605437),
(570, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"政审\\/培训\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605437),
(571, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"zheng-shen-pei-xun\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605441),
(572, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"政审\\/培训\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"zheng-shen-pei-xun\",\"content\":\"\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-23 13:30:26\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605441),
(573, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605452),
(574, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"接收预备党员\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605455),
(575, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"jie-shou-yu-bei-dang-yuan\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605456),
(576, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"接收预备党员\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"jie-shou-yu-bei-dang-yuan\",\"content\":\"\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-23 13:30:52\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605456),
(577, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605465),
(578, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"一年考察期\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605468),
(579, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"yi-nian-kao-cha-qi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605469),
(580, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"一年考察期\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"yi-nian-kao-cha-qi\",\"content\":\"\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-23 13:31:05\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605469),
(581, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605478),
(582, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"转正审批\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605483),
(583, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"name\":\"row[diyname]\",\"value\":\"zhuan-zheng-shen-pi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605485),
(584, 1, 'admin', '/admin.php/cms/archives/add?channel=&dialog=1', 'CMS管理 / 内容管理 / 添加', '{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"转正审批\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"zhuan-zheng-shen-pi\",\"content\":\"\",\"price\":\"0\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2025-09-23 13:31:18\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605485),
(585, 1, 'admin', '/admin.php/cms/archives/get_channel_model_info', 'CMS管理 / 内容管理', '{\"ids\":\"13\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605506),
(586, 1, 'admin', '/admin.php/cms/archives/get_channel_model_info', 'CMS管理 / 内容管理', '{\"ids\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605512),
(587, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"10\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605520),
(588, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605528),
(589, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605530),
(590, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"4\",\"name\":\"row[diyname]\",\"value\":\"tui-jian-he-gong-shi-ji-ji-fen-zi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605532),
(591, 1, 'admin', '/admin.php/cms/archives/edit/ids/4?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"推荐和公示积极分子\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"tui-jian-he-gong-shi-ji-ji-fen-zi\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:29:38\",\"publishtime\":\"2025-09-23 13:29:22\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605532),
(592, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"5\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605538),
(593, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"5\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605541),
(594, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"5\",\"name\":\"row[diyname]\",\"value\":\"yi-nian-yi-shang-pei-yang-jiao-yu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605542),
(595, 1, 'admin', '/admin.php/cms/archives/edit/ids/5?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"一年以上培养教育\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"yi-nian-yi-shang-pei-yang-jiao-yu\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:30:00\",\"publishtime\":\"2025-09-23 13:29:45\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"5\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605542),
(596, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"6\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605545),
(597, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"6\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605548),
(598, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"6\",\"name\":\"row[diyname]\",\"value\":\"que-ding-fa-zhan-dui-xiang\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605549),
(599, 1, 'admin', '/admin.php/cms/archives/edit/ids/6?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"确定发展对象\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"que-ding-fa-zhan-dui-xiang\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:30:21\",\"publishtime\":\"2025-09-23 13:30:12\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"6\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605549),
(600, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"7\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605553),
(601, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"7\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605556),
(602, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"7\",\"name\":\"row[diyname]\",\"value\":\"zheng-shen-pei-xun\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605557),
(603, 1, 'admin', '/admin.php/cms/archives/edit/ids/7?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"政审\\/培训\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"zheng-shen-pei-xun\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:30:41\",\"publishtime\":\"2025-09-23 13:30:26\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"7\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605557),
(604, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"8\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605560),
(605, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"8\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605562),
(606, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"8\",\"name\":\"row[diyname]\",\"value\":\"jie-shou-yu-bei-dang-yuan\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605563),
(607, 1, 'admin', '/admin.php/cms/archives/edit/ids/8?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"接收预备党员\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"jie-shou-yu-bei-dang-yuan\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:30:56\",\"publishtime\":\"2025-09-23 13:30:52\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"8\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605563),
(608, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605567),
(609, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605569),
(610, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"9\",\"name\":\"row[diyname]\",\"value\":\"yi-nian-kao-cha-qi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605570),
(611, 1, 'admin', '/admin.php/cms/archives/edit/ids/9?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"一年考察期\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"yi-nian-kao-cha-qi\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:31:09\",\"publishtime\":\"2025-09-23 13:31:05\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605570),
(612, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"10\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605574),
(613, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"10\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605576),
(614, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"10\",\"name\":\"row[diyname]\",\"value\":\"zhuan-zheng-shen-pi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605577);
INSERT INTO `party_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(615, 1, 'admin', '/admin.php/cms/archives/edit/ids/10?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"转正审批\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"zhuan-zheng-shen-pi\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:31:25\",\"publishtime\":\"2025-09-23 13:31:18\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"10\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605577),
(616, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"10\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605608),
(617, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"1\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605827),
(618, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"bp\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605841),
(619, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605842),
(620, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605842),
(621, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605870),
(622, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源eg\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605871),
(623, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源egc\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605871),
(624, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605872),
(625, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县i\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605876),
(626, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县iy\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605876),
(627, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县iyo\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605877),
(628, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605877),
(629, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾q\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605878),
(630, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾ql\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605878),
(631, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605878),
(632, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qhf\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605880),
(633, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qhg\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605880),
(634, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605881),
(635, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qh\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605881),
(636, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qhw\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605882),
(637, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605882),
(638, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子q\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605883),
(639, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qfw\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605883),
(640, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qf\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605884),
(641, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qfh\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605885),
(642, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子釬\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605885),
(643, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605886),
(644, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子q\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605887),
(645, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qf\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605887),
(646, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qfh\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605889),
(647, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子qfhw\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605890),
(648, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605892),
(649, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605893),
(650, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605895),
(651, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605895),
(652, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605896),
(653, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“l”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605897),
(654, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“lh”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605897),
(655, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605898),
(656, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四t”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605898),
(657, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四tb”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605898),
(658, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605899),
(659, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季sfy”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605900),
(660, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605900),
(661, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605901),
(662, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605901),
(663, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”r\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605902),
(664, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”rvy\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605903),
(665, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”rvyo\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605903),
(666, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605903),
(667, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热u\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605905),
(668, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热uy\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605906),
(669, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热uym\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605906),
(670, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605906),
(671, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹g\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605908),
(672, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹ga\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605909),
(673, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605909),
(674, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开ipg\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605909),
(675, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605910),
(676, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 s\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605911),
(677, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 sfy\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605911),
(678, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村n\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605912),
(679, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605913),
(680, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民qi\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605914),
(681, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605915),
(682, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐xiang\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605916),
(683, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐xiang\'shou\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605918),
(684, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享受\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605919),
(685, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605919),
(686, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文w\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605922),
(687, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605922),
(688, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化dn\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605922),
(689, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化dnl\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605923),
(690, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化dn\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605923),
(691, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化dng\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605924),
(692, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化d\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605925),
(693, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605925),
(694, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化dn\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605926),
(695, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化dnl\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605926),
(696, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化d\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605927),
(697, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化dnl\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605927),
(698, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化dn\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605928),
(699, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605928),
(700, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化shen\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605929),
(701, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化sheng\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605930),
(702, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化sheng\'y\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605930),
(703, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化sheng\'yan\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605931),
(704, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化盛宴\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605931),
(705, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清源县湾甸子镇：“四季村晚”热闹开演 村民乐享文化盛宴\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605953),
(706, 1, 'admin', '/admin.php/cms/ajax/get_title_pinyin', 'CMS管理', '{\"title\":\"辽宁省清原县湾甸子镇:“四季村晚”热闹开演 村民乐享文化盛宴\",\"delimiter\":\"-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758605975),
(707, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606105),
(708, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"liao-ning-sheng-qing-yuan-xian-wan-dian-zi-zhen-si-ji-cun-wan-re-nao-kai-yan-cun-min-yue-xiang-wen-h\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606112),
(709, 1, 'admin', '/admin.php/cms/archives/edit/ids/1?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"1\",\"user_id\":\"1\",\"special_ids\":\"\",\"title\":\"辽宁省清原县湾甸子镇:“四季村晚”热闹开演 村民乐享文化盛宴\",\"image\":\"\\/uploads\\/20250923\\/980a0e9d6746fb880de3396ea195436e.png\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"liao-ning-sheng-qing-yuan-xian-wan-dian-zi-zhen-si-ji-cun-wan-re-nao-kai-yan-cun-min-yue-xiang-wen-h\",\"content\":\"测试测试\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"3\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"flag\":[\"new\"],\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"1\",\"iscomment\":\"0\",\"createtime\":\"2025-09-19 14:08:33\",\"publishtime\":\"2025-09-19 14:06:39\",\"channel_ids\":[\"\"]},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606113),
(710, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606467),
(711, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606473),
(712, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"2\",\"name\":\"row[diyname]\",\"value\":\"ti-jiao-ru-dang-shen-qing\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606475),
(713, 1, 'admin', '/admin.php/cms/archives/edit/ids/2?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"提交入党申请\",\"image\":\"\\/uploads\\/20250923\\/c2e9beac513e1c47dd4dabab1f925c5d.webp\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"ti-jiao-ru-dang-shen-qing\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:28:13\",\"publishtime\":\"2025-09-23 13:27:52\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606475),
(714, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606552),
(715, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606591),
(716, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"3\",\"name\":\"row[diyname]\",\"value\":\"dang-zu-zhi-tan-hua\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606593),
(717, 1, 'admin', '/admin.php/cms/archives/edit/ids/3?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"党组织谈话\",\"image\":\"\\/uploads\\/20250923\\/fff1d91f04cdfacb092de4aaac7dd04a.jpg\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"dang-zu-zhi-tan-hua\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:28:40\",\"publishtime\":\"2025-09-23 13:28:20\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606593),
(718, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606683),
(719, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606687),
(720, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"4\",\"name\":\"row[diyname]\",\"value\":\"tui-jian-he-gong-shi-ji-ji-fen-zi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606689),
(721, 1, 'admin', '/admin.php/cms/archives/edit/ids/4?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"推荐和公示积极分子\",\"image\":\"\\/uploads\\/20250923\\/99a8530e450c600bbeab18ddf7d86962.webp\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"tui-jian-he-gong-shi-ji-ji-fen-zi\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:29:38\",\"publishtime\":\"2025-09-23 13:29:22\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606689),
(722, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"5\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606740),
(723, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606743),
(724, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"5\",\"name\":\"row[diyname]\",\"value\":\"yi-nian-yi-shang-pei-yang-jiao-yu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606745),
(725, 1, 'admin', '/admin.php/cms/archives/edit/ids/5?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"一年以上培养教育\",\"image\":\"\\/uploads\\/20250923\\/41d7f0386c1f3906853f8e17bdd8cbf6.png\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"yi-nian-yi-shang-pei-yang-jiao-yu\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:30:00\",\"publishtime\":\"2025-09-23 13:29:45\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"5\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606745),
(726, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"6\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606901),
(727, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606907),
(728, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"6\",\"name\":\"row[diyname]\",\"value\":\"que-ding-fa-zhan-dui-xiang\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606908),
(729, 1, 'admin', '/admin.php/cms/archives/edit/ids/6?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"确定发展对象\",\"image\":\"\\/uploads\\/20250923\\/3e6467230f5cafac6012a7847d9950b7.jpeg\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"que-ding-fa-zhan-dui-xiang\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:30:21\",\"publishtime\":\"2025-09-23 13:30:12\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"6\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606908),
(730, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"7\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606979),
(731, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606981),
(732, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"7\",\"name\":\"row[diyname]\",\"value\":\"zheng-shen-pei-xun\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606983),
(733, 1, 'admin', '/admin.php/cms/archives/edit/ids/7?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"政审\\/培训\",\"image\":\"\\/uploads\\/20250923\\/42ff1e405465dc433d49119dbb7b7919.jpg\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"zheng-shen-pei-xun\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:30:41\",\"publishtime\":\"2025-09-23 13:30:26\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"7\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758606983),
(734, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"8\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607017),
(735, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607021),
(736, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"8\",\"name\":\"row[diyname]\",\"value\":\"jie-shou-yu-bei-dang-yuan\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607022),
(737, 1, 'admin', '/admin.php/cms/archives/edit/ids/8?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"接收预备党员\",\"image\":\"\\/uploads\\/20250923\\/25d2551637be95bbc9953317b291ac38.png\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"jie-shou-yu-bei-dang-yuan\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:30:56\",\"publishtime\":\"2025-09-23 13:30:52\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"8\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607022),
(738, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607025),
(739, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607060),
(740, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"9\",\"name\":\"row[diyname]\",\"value\":\"yi-nian-kao-cha-qi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607062),
(741, 1, 'admin', '/admin.php/cms/archives/edit/ids/9?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"一年考察期\",\"image\":\"\\/uploads\\/20250923\\/c6c80e045b0cfb04e9f872b9a0b6c74e.png\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"yi-nian-kao-cha-qi\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:31:09\",\"publishtime\":\"2025-09-23 13:31:05\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607062),
(742, 1, 'admin', '/admin.php/cms/archives/get_fields_html', 'CMS管理 / 内容管理', '{\"channel_id\":\"13\",\"archives_id\":\"10\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607117),
(743, 1, 'admin', '/admin.php/ajax/upload', '', '{\"category\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607120),
(744, 1, 'admin', '/admin.php/cms/archives/check_element_available', 'CMS管理 / 内容管理', '{\"id\":\"10\",\"name\":\"row[diyname]\",\"value\":\"zhuan-zheng-shen-pi\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607122),
(745, 1, 'admin', '/admin.php/cms/archives/edit/ids/10?dialog=1', 'CMS管理 / 内容管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"13\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"转正审批\",\"image\":\"\\/uploads\\/20250923\\/24e31ff84a5ef79842d75331eeee3253.webp\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"zhuan-zheng-shen-pi\",\"content\":\"\",\"price\":\"0.00\",\"outlink\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"createby\":[\"admin\"],\"status\":\"normal\",\"memo\":\"\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2025-09-23 13:31:25\",\"publishtime\":\"2025-09-23 13:31:18\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"10\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758607122),
(746, 1, 'admin', '/admin.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"upvv\",\"keeplogin\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758711877),
(747, 1, 'admin', '/admin.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"86\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758712030),
(748, 1, 'admin', '/admin.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758712097),
(749, 1, 'admin', '/admin.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"79\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758712220),
(750, 1, 'admin', '/admin.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758712250),
(751, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"党的基本符号\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"党的基本符号\",\"searchField\":[\"type\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758712642),
(752, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"党的基本符号\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"党的基本符号\",\"searchField\":[\"type\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758770344),
(753, 1, 'admin', '/admin.php/cms/page/selectpage_type', 'CMS管理 / 单页管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"党的基本符号\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"党的基本符号\",\"searchField\":[\"type\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758772620),
(754, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774105),
(755, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774105),
(756, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774105),
(757, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774127),
(758, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774127),
(759, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774127),
(760, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774452),
(761, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774452),
(762, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774452),
(763, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"news\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774468),
(764, 1, 'admin', '/admin.php/cms/channel/edit/ids/1?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"parent_id\":\"5\",\"name\":\"头条新闻\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"news\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"12\",\"iscontribute\":\"0\",\"isnav\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774468),
(765, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774473);
INSERT INTO `party_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(766, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774473),
(767, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774473),
(768, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"13\",\"name\":\"row[diyname]\",\"value\":\"process\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774480),
(769, 1, 'admin', '/admin.php/cms/channel/edit/ids/13?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"parent_id\":\"13\",\"name\":\"入党流程\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"process\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"11\",\"iscontribute\":\"0\",\"isnav\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"13\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774480),
(770, 1, 'admin', '/admin.php/cms/channel/edit/ids/13?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"parent_id\":\"5\",\"name\":\"入党流程\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"process\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"11\",\"iscontribute\":\"0\",\"isnav\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"13\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774490),
(771, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774496),
(772, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774496),
(773, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774496),
(774, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"11\",\"name\":\"row[diyname]\",\"value\":\"record\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774500),
(775, 1, 'admin', '/admin.php/cms/channel/edit/ids/11?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"5\",\"name\":\"党员纪实\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"record\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"10\",\"iscontribute\":\"0\",\"isnav\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"11\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774500),
(776, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774513),
(777, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774513),
(778, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774513),
(779, 1, 'admin', '/admin.php/cms/channel/check_element_available', 'CMS管理 / 栏目管理', '{\"id\":\"12\",\"name\":\"row[diyname]\",\"value\":\"pioneer\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774518),
(780, 1, 'admin', '/admin.php/cms/channel/edit/ids/12?dialog=1', 'CMS管理 / 栏目管理 / 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"5\",\"name\":\"党员先锋\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"pioneer\",\"outlink\":\"\",\"linktype\":\"\",\"linkid\":\"0\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"listtype\":\"0\",\"pagesize\":\"10\",\"weigh\":\"9\",\"iscontribute\":\"0\",\"isnav\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"12\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758774518),
(781, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758775375),
(782, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758775375),
(783, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758775376),
(784, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"],\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758775552),
(785, 1, 'admin', '/admin.php/cms/ajax/get_template_list', 'CMS管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758775552),
(786, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784794),
(787, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784805),
(788, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784827),
(789, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"sh\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"sh\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784834),
(790, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"首页\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"首页\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784836),
(791, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"首页焦\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"首页焦\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784838),
(792, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"焦hk\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"焦hk\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784841),
(793, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"焦点图\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"焦点图\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784842),
(794, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"焦点图-\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"焦点图-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784843),
(795, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"焦点图-首页\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"焦点图-首页\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758784845),
(796, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"焦点图-首页\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"焦点图-首页\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758785055),
(797, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758785059),
(798, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758785061),
(799, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758785067),
(800, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"carousel-\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"carousel-\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758785069),
(801, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"carousel\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"carousel\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758785071),
(802, 1, 'admin', '/admin.php/cms/block/add?dialog=1', 'CMS管理 / 区块管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"type\":\"carousel\",\"name\":\"carousel-index\",\"title\":\"焦点图-首页\",\"image\":\"\",\"url\":\"\",\"content\":\"\",\"parsetpl\":\"0\",\"begintime\":\"\",\"endtime\":\"\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758785079),
(803, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"carousel\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"carousel\",\"searchField\":[\"type\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758785145),
(804, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"carousel\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"carousel\",\"searchField\":[\"type\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758786381),
(805, 1, 'admin', '/admin.php/cms/block/selectpage_type', 'CMS管理 / 区块管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"type\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"type\",\"keyField\":\"type\",\"searchField\":[\"type\"],\"type\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758786872),
(806, 1, 'admin', '/admin.php/cms/block/add?dialog=1', 'CMS管理 / 区块管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"type\":\"carousel\",\"name\":\"carousel-index\",\"title\":\"焦点图-首页\",\"image\":\"\",\"url\":\"\",\"content\":\"\",\"parsetpl\":\"0\",\"begintime\":\"\",\"endtime\":\"\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758786887);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='附件表';

--
-- 转存表中的数据 `party_attachment`
--

INSERT INTO `party_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
(1, '', 1, 0, '/assets/img/qrcode.png', 150, 150, 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6'),
(2, '', 1, 0, '/uploads/20250923/980a0e9d6746fb880de3396ea195436e.png', 1375, 784, 'png', 0, '2019052411133160801.png', 1322138, 'image/png', '', 1758606105, 1758606105, 1758606105, 'local', '86eb631c1963655a4a77b6ae0740a9f6d24ca1a8'),
(3, '', 1, 0, '/uploads/20250923/c2e9beac513e1c47dd4dabab1f925c5d.webp', 1080, 720, 'webp', 0, 'd6968a4ee3b2498a93f904c5b0045897.webp', 136878, 'image/webp', '', 1758606473, 1758606473, 1758606473, 'local', 'b1681476fef9f1093f534f287f10d736cf4b3102'),
(4, '', 1, 0, '/uploads/20250923/fff1d91f04cdfacb092de4aaac7dd04a.jpg', 1920, 1280, 'jpg', 0, '20d67ff42f2f6c3_size599_w1920_h1280.jpg', 443054, 'image/jpeg', '', 1758606591, 1758606591, 1758606591, 'local', '990005dc02ae085ec89bf1965c073edc0e3199f4'),
(5, '', 1, 0, '/uploads/20250923/99a8530e450c600bbeab18ddf7d86962.webp', 1080, 590, 'webp', 0, 'c47ed13daa5b4b908259e5b48a8f1dc4.webp', 28782, 'image/webp', '', 1758606687, 1758606687, 1758606687, 'local', '1b27f4010cafaf3ffd1e2f06fad84f414f0dafed'),
(6, '', 1, 0, '/uploads/20250923/41d7f0386c1f3906853f8e17bdd8cbf6.png', 1200, 800, 'png', 0, 'Flag_of_the_Chinese_Communist_Party.svg.png', 5766, 'image/png', '', 1758606743, 1758606743, 1758606743, 'local', 'edaeeb2df2dfcba5610ea43b6a0e23716c60f596'),
(7, '', 1, 0, '/uploads/20250923/3e6467230f5cafac6012a7847d9950b7.jpeg', 1080, 506, 'jpeg', 0, '20211214082730_2066.jpeg', 58725, 'image/jpeg', '', 1758606907, 1758606907, 1758606907, 'local', '709472b981374b2a57d918a970521063a4693985'),
(8, '', 1, 0, '/uploads/20250923/42ff1e405465dc433d49119dbb7b7919.jpg', 1199, 674, 'jpg', 0, 's3fce62899c6347fe805bcdcb56c39f1d.jpg', 811026, 'image/jpeg', '', 1758606981, 1758606981, 1758606981, 'local', '93e1eb7d50eb011314e4fad5af7e1826243b53c1'),
(9, '', 1, 0, '/uploads/20250923/25d2551637be95bbc9953317b291ac38.png', 1268, 952, 'png', 0, '51637BE95BBC9953317B291AC38_235A6E0B_1A8704.png', 1738500, 'image/png', '', 1758607021, 1758607021, 1758607021, 'local', '1be1fedd839730c30c0946eb2726747df9fdc2bb'),
(10, '', 1, 0, '/uploads/20250923/c6c80e045b0cfb04e9f872b9a0b6c74e.png', 864, 576, 'png', 0, 'E045B0CFB04E9F872B9A0B6C74E_E3C6335F_F6BCF.png', 1010639, 'image/png', '', 1758607060, 1758607060, 1758607060, 'local', '31d91a60fdd07ad169d29426bfbc42738b2a8f4d'),
(11, '', 1, 0, '/uploads/20250923/24e31ff84a5ef79842d75331eeee3253.webp', 684, 385, 'webp', 0, 'ffe9fa0e1d304e9fb588ac06b2e158b4.webp', 8120, 'image/webp', '', 1758607120, 1758607120, 1758607120, 'local', 'ad284d52a33454dcf56c28d074808c3d7139457b');

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
(86, 'file', 85, 'cms/config', '站点配置', 'fa fa-gears', '', '', '', 0, NULL, '', 'zdpz', 'zhandianpeizhi', 1758155809, 1758712030, 22, 'normal'),
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

--
-- 转存表中的数据 `party_cms_addon_article`
--

INSERT INTO `party_cms_addon_article` (`id`, `content`) VALUES
(1, '<p>测试测试</p>'),
(2, ''),
(3, ''),
(4, ''),
(5, ''),
(6, ''),
(7, ''),
(8, ''),
(9, ''),
(10, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='内容表';

--
-- 转存表中的数据 `party_cms_archives`
--

INSERT INTO `party_cms_archives` (`id`, `user_id`, `channel_id`, `channel_ids`, `model_id`, `special_ids`, `admin_id`, `title`, `flag`, `style`, `image`, `images`, `seotitle`, `keywords`, `description`, `tags`, `price`, `outlink`, `weigh`, `views`, `comments`, `likes`, `dislikes`, `diyname`, `isguest`, `iscomment`, `createtime`, `updatetime`, `publishtime`, `deletetime`, `createby`, `memo`, `status`) VALUES
(1, 1, 1, '', 1, '', 1, '辽宁省清原县湾甸子镇:“四季村晚”热闹开演 村民乐享文化盛宴', 'new', '', '/uploads/20250923/980a0e9d6746fb880de3396ea195436e.png', '', '', '', '', '', 0.00, '', 0, 13, 0, 1, 0, 'liao-ning-sheng-qing-yuan-xian-wan-dian-zi-zhen-si-ji-cun-wan-re-nao-kai-yan-cun-min-yue-xiang-wen-h', 1, 0, 1758262113, 1758606113, 1758261999, NULL, 'admin', '', 'normal'),
(2, 0, 13, '', 1, '', 1, '提交入党申请', '', '', '/uploads/20250923/c2e9beac513e1c47dd4dabab1f925c5d.webp', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'ti-jiao-ru-dang-shen-qing', 10, 10, 1758605293, 1758606475, 1758605272, NULL, 'admin', '', 'normal'),
(3, 0, 13, '', 1, '', 1, '党组织谈话', '', '', '/uploads/20250923/fff1d91f04cdfacb092de4aaac7dd04a.jpg', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'dang-zu-zhi-tan-hua', 10, 10, 1758605320, 1758606593, 1758605300, NULL, 'admin', '', 'normal'),
(4, 0, 13, '', 1, '', 1, '推荐和公示积极分子', '', '', '/uploads/20250923/99a8530e450c600bbeab18ddf7d86962.webp', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'tui-jian-he-gong-shi-ji-ji-fen-zi', 10, 10, 1758605378, 1758606689, 1758605362, NULL, 'admin', '', 'normal'),
(5, 0, 13, '', 1, '', 1, '一年以上培养教育', '', '', '/uploads/20250923/41d7f0386c1f3906853f8e17bdd8cbf6.png', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'yi-nian-yi-shang-pei-yang-jiao-yu', 10, 10, 1758605400, 1758606745, 1758605385, NULL, 'admin', '', 'normal'),
(6, 0, 13, '', 1, '', 1, '确定发展对象', '', '', '/uploads/20250923/3e6467230f5cafac6012a7847d9950b7.jpeg', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'que-ding-fa-zhan-dui-xiang', 10, 10, 1758605421, 1758606908, 1758605412, NULL, 'admin', '', 'normal'),
(7, 0, 13, '', 1, '', 1, '政审/培训', '', '', '/uploads/20250923/42ff1e405465dc433d49119dbb7b7919.jpg', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'zheng-shen-pei-xun', 10, 10, 1758605441, 1758606983, 1758605426, NULL, 'admin', '', 'normal'),
(8, 0, 13, '', 1, '', 1, '接收预备党员', '', '', '/uploads/20250923/25d2551637be95bbc9953317b291ac38.png', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'jie-shou-yu-bei-dang-yuan', 10, 10, 1758605456, 1758607022, 1758605452, NULL, 'admin', '', 'normal'),
(9, 0, 13, '', 1, '', 1, '一年考察期', '', '', '/uploads/20250923/c6c80e045b0cfb04e9f872b9a0b6c74e.png', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'yi-nian-kao-cha-qi', 10, 10, 1758605469, 1758607062, 1758605465, NULL, 'admin', '', 'normal'),
(10, 0, 13, '', 1, '', 1, '转正审批', '', '', '/uploads/20250923/24e31ff84a5ef79842d75331eeee3253.webp', '', '', '', '', '', 0.00, '', 0, 0, 0, 0, 0, 'zhuan-zheng-shen-pi', 10, 10, 1758605485, 1758607122, 1758605478, NULL, 'admin', '', 'normal');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='区块表';

--
-- 转存表中的数据 `party_cms_block`
--

INSERT INTO `party_cms_block` (`id`, `type`, `name`, `title`, `image`, `url`, `content`, `parsetpl`, `weigh`, `createtime`, `updatetime`, `begintime`, `endtime`, `status`) VALUES
(1, 'carousel', 'carousel-index', '焦点图-首页', '', '', '', 0, 1, 1758785079, 1758785079, NULL, NULL, 'normal'),
(2, 'carousel', 'carousel-index', '焦点图-首页', '', '', '', 0, 2, 1758786887, 1758786887, NULL, NULL, 'normal');

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
(1, 'list', 1, 5, '头条新闻', '', '', '', '', '', 'news', '', '', 0, 1, 12, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758184411, 1758774468, 'normal'),
(2, 'channel', 1, 0, '党员学习', '', '', '', '', '', 'study', '', '', 0, 0, 4, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758184553, 1758604322, 'normal'),
(3, 'channel', 1, 0, '党建动态', '', '', '', '', '', 'activities', '', '', 0, 0, 2, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758184990, 1758599136, 'normal'),
(4, 'channel', 1, 0, '党建服务', '', '', '', '', '', 'services', '', '', 0, 0, 1, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758185067, 1758599166, 'normal'),
(5, 'link', 0, 0, '首页', '', '', '', '', '', 'index', '/', '', 0, 0, 13, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758185628, 1758604072, 'normal'),
(6, 'list', 1, 2, '三会一课', '', '', '', '', '', 'meeting', '', '', 0, 0, 6, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758599363, 1758599363, 'normal'),
(7, 'list', 1, 2, '精选书籍', '', '', '', '', '', 'books', '', '', 0, 0, 7, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758599399, 1758599399, 'normal'),
(8, 'list', 1, 2, '党员课程', '', '', '', '', '', 'lessons', '', '', 0, 0, 8, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758599458, 1758599458, 'normal'),
(9, 'list', 1, 3, '基层动态', '', '', '', '', '', 'primary', '', '', 0, 0, 9, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758599636, 1758599636, 'normal'),
(10, 'list', 1, 3, '组织活动', '', '', '', '', '', 'party', '', '', 0, 0, 10, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 1, 1758599831, 1758599831, 'normal'),
(11, 'list', 1, 5, '党员纪实', '', '', '', '', '', 'record', '', '', 0, 0, 10, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758600910, 1758774500, 'normal'),
(12, 'list', 1, 5, '党员先锋', '', '', '', '', '', 'pioneer', '', '', 0, 0, 9, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758603844, 1758774518, 'normal'),
(13, 'list', 1, 5, '入党流程', '', '', '', '', '', 'process', '', '', 0, 9, 11, 'channel_news.html', 'list_news.html', 'show_news.html', 10, 0, 0, 0, 0, 1758604047, 1758774490, 'normal');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='收藏表';

--
-- 转存表中的数据 `party_cms_collection`
--

INSERT INTO `party_cms_collection` (`id`, `type`, `aid`, `user_id`, `title`, `image`, `url`, `createtime`, `updatetime`) VALUES
(2, 'archives', 1, 4, '辽宁省清原县湾甸子镇:“四季村晚”热闹开演 村民乐享文化盛宴', 'http://party-building.local/uploads/20250923/980a0e9d6746fb880de3396ea195436e.png', 'http://party-building.local/news/1.html', 1758794938, 1758794938),
(5, 'archives', 1, 7, '辽宁省清原县湾甸子镇:“四季村晚”热闹开演 村民乐享文化盛宴', 'http://party-building.local/uploads/20250923/980a0e9d6746fb880de3396ea195436e.png', 'http://party-building.local/news/1.html', 1758795502, 1758795502);

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
(1, '文章', 'cms_addon_article', NULL, 'channel_news.html', 'list_news.html', 'show_news.html', 1758184280, 1758605118, '{\"contributefields\":[\"channel_ids\",\"image\",\"images\",\"tags\",\"content\",\"keywords\",\"description\"],\"publishfields\":[\"channel_ids\",\"user_id\",\"special_ids\",\"image\",\"images\",\"diyname\",\"tags\",\"content\",\"seotitle\",\"keywords\",\"description\"]}');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='单页表';

--
-- 转存表中的数据 `party_cms_page`
--

INSERT INTO `party_cms_page` (`id`, `category_id`, `admin_id`, `type`, `title`, `seotitle`, `keywords`, `description`, `flag`, `image`, `content`, `icon`, `views`, `likes`, `dislikes`, `comments`, `diyname`, `showtpl`, `iscomment`, `parsetpl`, `createtime`, `updatetime`, `deletetime`, `weigh`, `status`) VALUES
(1, 0, 1, '党的基本符号', '中国共产党党旗', '', '', '', '', '', '', '', 3, 0, 0, 0, 'flag', 'page.html', 0, 0, 1758600638, 1758600638, NULL, 1, 'normal'),
(2, 0, 1, '党的基本符号', '中国共产党党章', '', '', '', '', '', '', '', 0, 0, 0, 0, 'charter', '', 0, 0, 1758600729, 1758600729, NULL, 2, 'normal'),
(3, 0, 1, '党的基本符号', '中国共产党党徽', '', '', '', '', '', '', '', 2, 0, 0, 0, 'symbols', '', 0, 0, 1758600771, 1758600771, NULL, 3, 'normal');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞记录表';

--
-- 转存表中的数据 `party_cms_user_like`
--

INSERT INTO `party_cms_user_like` (`id`, `user_id`, `type`, `aid`, `createtime`, `updatetime`) VALUES
(3, 4, 'archives', 1, 1758793883, 1758793883);

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COMMENT='短信验证码表';

--
-- 转存表中的数据 `party_sms`
--

INSERT INTO `party_sms` (`id`, `event`, `mobile`, `code`, `times`, `ip`, `createtime`) VALUES
(1, 'register', '16830982844', '380816', 0, '127.0.0.1', 1758701533),
(2, 'register', '16830982844', '416542', 0, '127.0.0.1', 1758701951),
(3, 'register', '13073567604', '531283', 0, '127.0.0.1', 1758702681),
(4, 'register', '13073567604', '959245', 0, '127.0.0.1', 1758703153),
(5, 'register', '13073567604', '050395', 0, '127.0.0.1', 1758703321),
(6, 'register', '13073567604', '563964', 0, '127.0.0.1', 1758704188),
(9, 'register', '13973836967', '920415', 0, '127.0.0.1', 1758706873),
(13, 'register', '13973836988', '801226', 0, '0.0.0.0', 1758789567),
(14, 'register', '13973836989', '778050', 0, '0.0.0.0', 1758790412);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

--
-- 转存表中的数据 `party_user`
--

INSERT INTO `party_user` (`id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `loginfailuretime`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`) VALUES
(1, 1, 'admin', 'admin', '2b5791008fe4243a543befc33ced1b3b', 'b44dc1', 'admin@163.com', '13000000000', '/assets/img/avatar.png', 1, 0, '2017-04-08', '', 0.00, 2, 1, 1, 1491635035, 1491635035, '127.0.0.1', 0, 1491635035, '127.0.0.1', 1491635035, 0, 1758262113, '', 'normal', ''),
(2, 0, 'pcuser', 'pcuser', '8254c8bf6e20f7b96c14017255141b35', 'I1xbyc', 'user@test.com', '13212345678', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1758254295, 1758260254, '0.0.0.0', 0, NULL, '0.0.0.0', 1758244923, 1758244923, 1758260254, '', 'normal', ''),
(3, 1, 'user_13073567604_fRBt', '烨华_驹69', 'ad6fa6396d1ca86a8c8309588827e606', '0jy6lZ', '', '13073567604', '', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '127.0.0.1', 1758704211, 1758704211, 1758704211, '', 'normal', ''),
(4, 1, 'user_13973836987_Hp2n', '烨华_驹69', '946fad2e1d4fd1c2fd600e54f38f2b84', '3noETM', '', '13973836987', '', 0, 0, NULL, '', 0.00, 0, 1, 1, 1758792977, 1758792977, '127.0.0.1', 0, NULL, '127.0.0.1', 1758704663, 1758704663, 1758792977, '', 'normal', ''),
(5, 1, 'user_13973836977_FO2T', '烨华_驹69', 'f6a3ba6650273dfee714fd1318080b71', 'sXlDqo', '', '13973836977', '', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '127.0.0.1', 1758706625, 1758706625, 1758706625, '', 'normal', ''),
(6, 1, 'user_13973836988_zcgH', '用户6988', '618250970747c7595a68cc15fea1f308', 'USZ8xu', '', '13973836988', '', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '0.0.0.0', 1758789576, 1758789576, 1758789576, '', 'normal', ''),
(7, 1, 'user_13973836989_AVMB', '用户6989', '87e5a32e86a19086b5a128b2a4d8c190', 'aZ2uqd', '', '13973836989', '', 0, 0, NULL, '', 0.00, 0, 1, 1, 1758793151, 1758793151, '0.0.0.0', 0, NULL, '0.0.0.0', 1758790417, 1758790417, 1758793151, '', 'normal', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='会员积分变动表';

--
-- 转存表中的数据 `party_user_score_log`
--

INSERT INTO `party_user_score_log` (`id`, `user_id`, `score`, `before`, `after`, `memo`, `createtime`) VALUES
(1, 1, 2, 0, 2, '发布文章', 1758262113);

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
('00d8ef6d731d8f1bf5ecae55ff2f3ca0cb8d7fb9', 4, 1758792100, 1761384100),
('1a5181ab5e10d6f9f5d28ed18fafb85c8aa0c47f', 7, 1758792799, 1761384799),
('5cc6afe066bf571a5b28f64bbbea4d1d2b866f5e', 7, 1758792894, 1761384894),
('638ed603635dd3ac981aaa70b7d6c81182799cfe', 2, 1758260254, 1760852254),
('6d58f345fc1fd887a35eac9564e3ce0e96f7900d', 4, 1758711489, 1761303489),
('86abbc77b9a5b7fc0601f9fa69b8f53f5359e77e', 4, 1758708342, 1761300342),
('93eea89691a066ecfaaa93e5af59ac3459dce05f', 4, 1758707778, 1761299778),
('97b01aedd491fd6036e22b118e776f6ca6e1bedf', 4, 1758708194, 1761300194),
('a246e042f1c86656146b90983a4e1b53312a678c', 4, 1758792977, 1761384977),
('ac86a094e7465849483d4f9bdbf224da79b190e7', 7, 1758790435, 1761382435),
('af67d8aefa0d5999713efebe6105ef8dd95ef473', 7, 1758793151, 1761385151),
('b5eca33d7dae8c47d26e1c5ce706c1b761e30ef9', 7, 1758792829, 1761384829),
('bb25daf8f2b86e431221a7c4a188c5e2bb533882', 5, 1758706625, 1761298625),
('ceba5c8ee8ff5c6a0df317afd45591d69fe8f223', 7, 1758792923, 1761384923),
('d42149159c71951681aa5d1f3d712a8386c3b556', 7, 1758792818, 1761384818),
('e63f02c8db1ca3a02051f8eb921fc7cc457db568', 4, 1758704663, 1761296663),
('e95aa02a0902c86f1cc06b4ed046ab231b8b39d3', 7, 1758792779, 1761384779),
('efb2c1ae5f310d714ce7494d4c4ecf5b8baccd29', 7, 1758792875, 1761384875),
('f21cdb81ac1d07564ab8fd4a54530efdea3a2f2c', 7, 1758790443, 1761382443),
('f65659e70b7e3e4a8a3ff4d179c1050478fa70d3', 7, 1758792902, 1761384902);

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
