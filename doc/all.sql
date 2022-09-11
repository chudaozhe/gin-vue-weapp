-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-09-10 23:59:12
-- 服务器版本： 8.0.18
-- PHP 版本： 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `ent`
--
CREATE DATABASE IF NOT EXISTS `ent` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ent`;

-- --------------------------------------------------------

--
-- 表的结构 `cw_admin`
--

CREATE TABLE `cw_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '',
  `salt` varchar(6) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `mobile` varchar(12) NOT NULL DEFAULT '',
  `avatar` varchar(150) NOT NULL DEFAULT '' COMMENT '头像',
  `init` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `auth` varchar(150) NOT NULL DEFAULT '',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员';

--
-- 转存表中的数据 `cw_admin`
--

INSERT INTO `cw_admin` (`id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `init`, `status`, `auth`, `create_time`, `update_time`) VALUES
(1, 'admin', '小哥', '3f8534ce0125a0172dbbdb95009876da', '49(fe6', 'chudaozhe@outlook.com', '', '', 1, 1, '', 1609163027, 1662725045);

-- --------------------------------------------------------

--
-- 表的结构 `cw_article`
--

CREATE TABLE `cw_article` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(75) NOT NULL DEFAULT '',
  `keywords` varchar(150) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(150) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL,
  `image` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `images` varchar(250) NOT NULL DEFAULT '' COMMENT '图集',
  `source` varchar(150) NOT NULL DEFAULT '' COMMENT '来源',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序值 desc',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '外部链接',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否显示，1是 0否',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='新闻资讯';

-- --------------------------------------------------------

--
-- 表的结构 `cw_case`
--

CREATE TABLE `cw_case` (
  `id` int(11) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(75) NOT NULL DEFAULT '',
  `image` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `images` text NOT NULL COMMENT '图集',
  `description` varchar(150) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序值desc',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '链接',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否显示，1是 0否',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='案例';

-- --------------------------------------------------------

--
-- 表的结构 `cw_category`
--

CREATE TABLE `cw_category` (
  `id` int(11) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '类型：1文件 2新闻 3案例 4单页 5技术支持',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序值,desc',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类下的条目数',
  `memo` varchar(30) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否显示，1是 0否',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='分类';

-- --------------------------------------------------------

--
-- 表的结构 `cw_files`
--

CREATE TABLE `cw_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类id',
  `url` varchar(200) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '文件名',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '文件类型',
  `width` int(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片width',
  `height` int(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片height',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文件管理';

-- --------------------------------------------------------

--
-- 表的结构 `cw_flash`
--

CREATE TABLE `cw_flash` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL DEFAULT '',
  `image` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '链接',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否显示，1是 0否',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序desc',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='焦点图';

-- --------------------------------------------------------

--
-- 表的结构 `cw_pages`
--

CREATE TABLE `cw_pages` (
  `id` int(11) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(75) NOT NULL DEFAULT '',
  `image` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text NOT NULL COMMENT '主要内容',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否显示，1是 0否',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='单页';

-- --------------------------------------------------------

--
-- 表的结构 `cw_shortcut`
--

CREATE TABLE `cw_shortcut` (
  `id` int(11) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1普通分类2单页',
  `title` varchar(45) NOT NULL DEFAULT '',
  `image` varchar(150) NOT NULL DEFAULT '',
  `url` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类或单页id',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否显示，1是 0否',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序desc',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='快捷方式';

--
-- 转储表的索引
--

--
-- 表的索引 `cw_admin`
--
ALTER TABLE `cw_admin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cw_article`
--
ALTER TABLE `cw_article`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cw_case`
--
ALTER TABLE `cw_case`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cw_category`
--
ALTER TABLE `cw_category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cw_files`
--
ALTER TABLE `cw_files`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cw_flash`
--
ALTER TABLE `cw_flash`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cw_pages`
--
ALTER TABLE `cw_pages`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cw_shortcut`
--
ALTER TABLE `cw_shortcut`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cw_admin`
--
ALTER TABLE `cw_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cw_article`
--
ALTER TABLE `cw_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cw_case`
--
ALTER TABLE `cw_case`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cw_category`
--
ALTER TABLE `cw_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cw_files`
--
ALTER TABLE `cw_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cw_flash`
--
ALTER TABLE `cw_flash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cw_pages`
--
ALTER TABLE `cw_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cw_shortcut`
--
ALTER TABLE `cw_shortcut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
