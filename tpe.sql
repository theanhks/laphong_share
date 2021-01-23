-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2015 at 04:15 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tpe`
--

-- --------------------------------------------------------

--
-- Table structure for table `counter_ips`
--

CREATE TABLE IF NOT EXISTS `counter_ips` (
  `ip` varchar(15) NOT NULL,
  `visit` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter_ips`
--

INSERT INTO `counter_ips` (`ip`, `visit`) VALUES
('42.117.67.206', '2015-04-16 15:03:28'),
('1.53.229.166', '2015-04-16 15:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `counter_values`
--

CREATE TABLE IF NOT EXISTS `counter_values` (
  `id` bigint(11) NOT NULL,
  `day_id` bigint(11) NOT NULL,
  `day_value` bigint(11) NOT NULL,
  `yesterday_id` bigint(11) NOT NULL,
  `yesterday_value` bigint(11) NOT NULL,
  `week_id` bigint(11) NOT NULL,
  `week_value` bigint(11) NOT NULL,
  `month_id` bigint(11) NOT NULL,
  `month_value` bigint(11) NOT NULL,
  `year_id` bigint(11) NOT NULL,
  `year_value` bigint(11) NOT NULL,
  `all_value` bigint(11) NOT NULL,
  `record_date` datetime NOT NULL,
  `record_value` bigint(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter_values`
--

INSERT INTO `counter_values` (`id`, `day_id`, `day_value`, `yesterday_id`, `yesterday_value`, `week_id`, `week_value`, `month_id`, `month_value`, `year_id`, `year_value`, `all_value`, `record_date`, `record_value`) VALUES
(1, 105, 18, 104, 15, 16, 61, 4, 62, 2015, 152, 152, '2015-02-26 19:17:52', 49);

-- --------------------------------------------------------

--
-- Table structure for table `ep_archives`
--

CREATE TABLE IF NOT EXISTS `ep_archives` (
  `date` int(15) NOT NULL DEFAULT '0',
  `hits` int(9) NOT NULL DEFAULT '0',
  `visits` int(9) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ep_stats`
--

CREATE TABLE IF NOT EXISTS `ep_stats` (
  `ip` varchar(15) NOT NULL DEFAULT '',
  `hits` int(9) NOT NULL DEFAULT '1',
  `visits` int(9) NOT NULL DEFAULT '1',
  `time` int(15) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `n_ads`
--

CREATE TABLE IF NOT EXISTS `n_ads` (
`id` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `vn_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=194 ;

--
-- Dumping data for table `n_ads`
--

INSERT INTO `n_ads` (`id`, `gid`, `vn_name`, `en_name`, `logo_url`, `url`, `position`, `status`) VALUES
(192, 1, 'quang cao 1', 'quang cao 1', '21811_ban-11.jpg', '#', 1, 1),
(193, 1, 'quang cao 2', '', '240_ban-22.jpg', '#', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_ads_home`
--

CREATE TABLE IF NOT EXISTS `n_ads_home` (
`id` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `logo_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_ad_groups`
--

CREATE TABLE IF NOT EXISTS `n_ad_groups` (
`id` int(11) NOT NULL,
  `vn_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `n_ad_groups`
--

INSERT INTO `n_ad_groups` (`id`, `vn_name`, `en_name`, `status`) VALUES
(1, 'Banner trang chủ', 'Banner trang chủ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_ad_groups_home`
--

CREATE TABLE IF NOT EXISTS `n_ad_groups_home` (
`id` int(11) NOT NULL,
  `vn_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `n_ad_groups_home`
--

INSERT INTO `n_ad_groups_home` (`id`, `vn_name`, `en_name`, `status`) VALUES
(1, '300x300', '', ''),
(2, '300x149', 'live-tile red', 'data-initdelay="2500" data-delay="4000"'),
(3, '149x149', 'live-tile yellow', 'data-initdelay="8000"'),
(4, '245x149', 'live-tile green', 'data-direction="horizontal" data-initdelay="6500" data-delay="5500"'),
(5, '149x149', 'live-tile blue', 'data-initdelay="12000"'),
(6, '149x149', '', ''),
(7, '245x149', 'live-tile purple', 'data-mode="flip" data-delay="4000"'),
(8, '149x149', 'live-tile magenta', '');

-- --------------------------------------------------------

--
-- Table structure for table `n_album`
--

CREATE TABLE IF NOT EXISTS `n_album` (
`id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vn_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vn_description` mediumtext COLLATE utf8_unicode_ci,
  `en_description` mediumtext COLLATE utf8_unicode_ci,
  `cn_description` mediumtext COLLATE utf8_unicode_ci,
  `private` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `resources` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `avatar_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `n_album`
--

INSERT INTO `n_album` (`id`, `pid`, `slug`, `vn_name`, `en_name`, `cn_name`, `vn_description`, `en_description`, `cn_description`, `private`, `status`, `date_created`, `resources`, `children`, `avatar_id`, `position`) VALUES
(1, 0, 'bang-gia', 'Bảng giá', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_albumproduct`
--

CREATE TABLE IF NOT EXISTS `n_albumproduct` (
`id` tinyint(11) NOT NULL,
  `idpro` tinyint(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `vn_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` tinyint(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_cart_items`
--

CREATE TABLE IF NOT EXISTS `n_cart_items` (
`id` int(11) NOT NULL,
  `sid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `price` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_size` varchar(255) DEFAULT '',
  `product_color` varchar(200) DEFAULT NULL,
  `s_price` int(11) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=601 ;

--
-- Dumping data for table `n_cart_items`
--

INSERT INTO `n_cart_items` (`id`, `sid`, `oid`, `pid`, `slug`, `product_name`, `product_code`, `quantity`, `price`, `avatar`, `time_stamp`, `product_size`, `product_color`, `s_price`) VALUES
(517, 'mqvp61469sjge7o5rgk2rc6rt5', NULL, 7882, 'ten-tieng-viet', 'ten tieng viet', 'MSP12345', '2', '43534542', '12269_011.jpg', '2014-08-18 17:38:27', 'kich thuoc 1,kich thuoc 2', 'mau sac 1', 324242),
(518, '9qmufd1mvai9pofqlard0ccq97', NULL, 7874, 'san-pham-2', 'san pham 2', '-11', '1', '300000', '2061_13380951741400.jpg', '2014-08-18 18:17:00', 'size l', 'màu sắc 11', 0),
(519, '9qmufd1mvai9pofqlard0ccq97', NULL, 7882, 'ten-tieng-viet', 'ten tieng viet', 'MSP12345', '2', '43534542', '12269_011.jpg', '2014-08-18 23:43:53', 'kich thuoc 1,0', 'mau sac 1', 324242),
(520, 'pbe92r48agff91a4u56dcodpd6', NULL, 7882, 'ten-tieng-viet', 'ten tieng viet', 'MSP12345', '3', '43534542', '12269_011.jpg', '2014-08-20 21:56:05', 'kich thuoc 1,kich thuoc 1,kich thuoc 1', 'mau sac 1', 324242),
(521, 'd0l1lv798vj7cmdvu7r395q4p4', NULL, 7882, 'ten-tieng-viet', 'ten tieng viet', 'MSP12345', '7', '43534542', '12269_011.jpg', '2014-09-08 11:54:40', 'kich thuoc 2,kich thuoc 2,kich thuoc 2,kich thuoc 2,kich thuoc 1,kich thuoc 2,968768', 'mau sac 1', 324242),
(522, 'n9406b5clk98a5njsu4ibgj994', NULL, 7882, 'ten-tieng-viet', 'ten tieng viet', 'MSP12345', '1', '43534542', '12269_011.jpg', '2014-09-13 23:40:00', '0', '0', 324242),
(523, 'p1ihohlpu7g9o90mai84vl0v94', NULL, 7881, 'egferg', 'egferg', 'thygtrfbtg', '1', '34535', '19850_banner11.jpg', '2014-09-14 09:29:00', '0', '0', 34345),
(524, 'p1ihohlpu7g9o90mai84vl0v94', NULL, 7882, 'ten-tieng-viet', 'ten tieng viet', 'MSP12345', '1', '43534542', '12269_011.jpg', '2014-09-14 09:44:00', '0', '0', 324242),
(525, '7c043e2568814c212c02844f134ab434', NULL, 7884, 'mouse-apoint-m1', 'Mouse Apoint M1', 'Apoint M1', '1', '65000', '1331926037_apoint-m-11.jpg', '2014-09-19 10:25:00', '0', '0', 0),
(526, '4d176cea263755db99966f31362d2c2d', NULL, 7884, 'mouse-apoint-m1', 'Mouse Apoint M1', 'Apoint M1', '1', '65000', '1331926037_apoint-m-11.jpg', '2014-09-20 02:30:00', '0', '0', 0),
(527, 'e835d41918f70e2d18d3718207b160ec', NULL, 7884, 'mouse-apoint-m1', 'Mouse Apoint M1', 'Mouse Apoint M1', '1', '65000', '1331926037_apoint-m-11.jpg', '2014-09-20 04:35:00', '0', '0', 0),
(528, 'd9d20e875bab64293591caa6c4d17655', NULL, 7888, 'mouse-wireless-apoint-t1', 'Mouse Wireless Apoint T1', 'Mouse Wireless Apoint T1', '2', '105000', '249003516_apoint-t11.jpg', '2014-09-22 05:14:29', '0,0', '0', 0),
(529, '7b41382d915b8c9a161f66863d8e0e4b', NULL, 7898, 'phim-wincom-k7--mouse-apoint-m6-', 'Phím  WINCOM  K7 + Mouse Apoint  M6 ', 'K7 + M6', '1', '186000', '1558374857_key-mouse-apointt.jpg', '2014-10-01 07:43:00', '0', '0', 0),
(535, '8472b054694db83da7b0a2d34b73cea6', NULL, 7892, 'mouse-apoint-m6', 'Mouse  Apoint M6', 'M6', '1', '71000', '2091761026_apoint-m66.jpg', '2014-10-02 01:00:00', '0', '0', 0),
(533, '00346ff034890a8aa31e7a06f1e27b6b', NULL, 7898, 'phim-wincom-k7--mouse-apoint-m6-', 'Phím  WINCOM  K7 + Mouse Apoint  M6 ', 'K7 + M6', '1', '186000', '1558374857_key-mouse-apointt.jpg', '2014-10-01 18:28:00', '0', '0', 0),
(534, '920d78252ca6366ec5bb1ae1b56e1e7c', NULL, 7898, 'phim-wincom-k7--mouse-apoint-m6-', 'Phím  WINCOM  K7 + Mouse Apoint  M6 ', 'K7 + M6', '2', '186000', '1558374857_key-mouse-apointt.jpg', '2014-10-02 01:47:16', '0,0', '0', 0),
(536, 'cf51a72335eab07c6646bba5be343acc', NULL, 7896, 'phim--chuot-wireless-apoint-ta4300-', 'Phím + chuột Wireless Apoint TA4300 ', 'TA4300 ', '1', '235000', '531069621_apoint-ta43000.jpg', '2014-10-02 02:20:00', '0', '0', 0),
(537, '2242486a2274b3bf6eed8600de7aea28', NULL, 7895, 'phim-apoint-wincom-k7', 'Phím  Apoint  WINCOM  K7', ' K7', '1', '115000', '695958471_key-wincom-k77.JPG', '2014-10-15 15:00:00', '0', '0', 0),
(541, 'd14da731fb12a5f04b12b52475bfe9ae', NULL, 7924, 'man-chieu-dien-84-x-84', 'Màn Chiếu Điện 84&quot; x 84&quot;', 'Màn Chiếu Điện 84\\" x 84\\"', '1', '0', '1254721668_bbb.JPG', '2014-10-30 17:57:00', '0', '0', 0),
(542, 'd14da731fb12a5f04b12b52475bfe9ae', NULL, 7913, 'svf1421psg', 'SVF1421PSG', '-1', '1', '9990000', '130762502_55.jpg', '2014-10-30 18:05:00', '0', '0', 0),
(548, 'd0ea396cf8f3f9c92117327b1019cfff', NULL, 7893, 'mouse-wireless-apoint-t1', 'Mouse Wireless  Apoint  T1', '-1', '1', '105000', '1280468441_apoint-t11.jpg', '2014-11-01 04:36:00', '0', '0', 0),
(547, 'd0ea396cf8f3f9c92117327b1019cfff', NULL, 7912, 'svf1421esg', 'SVF1421ESG', '-2', '1', '9990000', '1435440076_11.jpg', '2014-11-01 04:16:00', '0', '0', 0),
(546, 'acb48b1fd4f4d6c9dbc6ae4e5417a3aa', NULL, 7894, 'mouse-wireless-apoint-t6', 'Mouse Wireless  Apoint  T6', 'Apoint  T6', '1', '107000', '1993474459_apoint-t-66.jpg', '2014-11-01 04:01:00', '0', '0', 0),
(549, 'cb61557ea1339e4d1d89a5f2c3f76afe', NULL, 7912, 'svf1421esg', 'SVF1421ESG', '-2', '1', '9990000', '1435440076_11.jpg', '2014-11-01 07:45:00', '0', '0', 0),
(550, 'cb61557ea1339e4d1d89a5f2c3f76afe', NULL, 7901, 'epson-ebx11', 'EPSON EB-X11', 'EB-X11', '1', '10450000', '2059164035_111.jpg', '2014-11-01 07:01:00', '0', '0', 0),
(564, '8f790ae65d89a02b6f7192684587338c', NULL, 7913, 'svf1421psg', 'SVF1421PSG', '-1', '1', '9990000', '130762502_55.jpg', '2014-11-07 01:17:00', '0', '0', 0),
(562, 'ecd3e08bdfc48ad9b7ed8a95a0a17b6f', NULL, 7913, 'svf1421psg', 'SVF1421PSG', '-1', '2', '9990000', '130762502_55.jpg', '2014-11-07 01:43:09', '0,0', '0', 0),
(563, 'ecd3e08bdfc48ad9b7ed8a95a0a17b6f', NULL, 7903, 'epson-ebx18', 'EPSON EB-X18', 'EB-X18', '2', '15550000', '572246552_epson-eb-x18_11.jpg', '2014-11-07 01:37:00', '0,0', '0', 0),
(561, '7ea46e9f55b666245ed9f104ee00cefb', NULL, 7923, 'man-chieu-dien-70-x-70', 'Màn Chiếu Điện 70&quot; x 70&quot;', '-4', '1', '0', '1675619112_aaa.JPG', '2014-11-05 02:02:00', '0', '0', 0),
(560, '7ea46e9f55b666245ed9f104ee00cefb', NULL, 7906, 'prc46ipw-13', 'PRC-46IPW 1.3', 'PRC-46IPW 1.3', '1', '5774000', '921302744_44.jpg', '2014-11-05 02:05:00', '0', '0', 0),
(565, 'cd80fae7c012f8f539f2c733794c956b', NULL, 7912, 'svf1421esg', 'SVF1421ESG', '-5', '1', '9990000', '1435440076_11.jpg', '2014-11-07 01:03:00', '0', '0', 0),
(566, '8e81bab17bc22fab72604afdd27a5694', NULL, 7923, 'man-chieu-dien-70-x-70', 'Màn Chiếu Điện 70&quot; x 70&quot;', '-4', '1', '0', '1675619112_aaa.JPG', '2014-11-07 02:15:00', '0', '0', 0),
(567, '8af1846cbeab105109dc1d4ff941c217', NULL, 7910, 'toshiba-nps15a-', 'Toshiba NPS15A ', 'NPS15A ', '1', '10000000', '271889502_22.jpg', '2014-11-07 02:05:00', '0', '0', 0),
(568, '8af1846cbeab105109dc1d4ff941c217', NULL, 7899, 'epson-ebs02', 'EPSON EB-S02', 'EB-S02', '1', '8010000', '915163415_epson-11.png', '2014-11-07 02:13:00', '0', '0', 0),
(569, 'c0f5dd1a40d874f1092c480ebfc20993', NULL, 7913, 'svf1421psg', 'SVF1421PSG', '-1', '1', '9990000', '130762502_55.jpg', '2014-11-07 07:06:00', '0', '0', 0),
(570, 'c0f5dd1a40d874f1092c480ebfc20993', NULL, 7892, 'mouse-apoint-m6', 'Mouse  Apoint M6', '-3', '1', '71000', '2091761026_apoint-m66.jpg', '2014-11-07 07:01:00', '0', '0', 0),
(571, 'ded8ec5e0bd2fc090d5f7f34042d1966', NULL, 7909, 'prc208ebs', 'PRC-208EBs', 'PRC-208EBs', '1', '980000', '585092221_44.jpg', '2014-11-07 07:01:00', '0', '0', 0),
(572, '9e439a3755f3cbf03c494ebbaf46d03b', NULL, 7906, 'prc46ipw-13', 'PRC-46IPW 1.3', 'PRC-46IPW 1.3', '1', '5774000', '921302744_44.jpg', '2014-11-07 15:00:00', '0', '0', 0),
(573, '5d282a1821888ecadae504622abfbcb5', NULL, 7902, 'epson-ebs18', 'EPSON EB-S18', '-1', '1', '10550000', '554690168_epson-18-22.png', '2014-11-07 15:03:00', '0', '0', 0),
(574, 'e2c8a5d7d2c3bc4761204b435bbb1d02', NULL, 7905, 'prc127ptw-10', 'PRC-127PTW 1.0', 'PRC-127PTW 1.0', '1', '3696000', '1962493550_55.jpg', '2014-11-08 01:17:00', '0', '0', 0),
(575, '7791a12e79908d4fb83c8985280d5686', NULL, 7913, 'svf1421psg', 'SVF1421PSG', '-1', '1', '9990000', '130762502_55.jpg', '2014-11-08 01:33:00', '0', '0', 0),
(587, '525e8b9b61f917b275a53afcbaefeee9', NULL, 7957, 'may-huy-bingo-c36', 'MÁY HỦY BINGO C36', 'MÁY HỦY BINGO C36', '1', '5880000', '1460857884_tai-xuong-4).jpg', '2014-11-16 14:28:00', '0', '0', 0),
(588, '9b6d6ad74c4589fa31a143ae253b9525', NULL, 7968, 'may-soi-tien-ht-106', 'MÁY SOI TIỀN HT - 106', 'HT - 106', '1', '5900000', '872065571_tai-xuongg.jpg', '2014-11-17 01:54:00', '0', '0', 0),
(578, 'f737f95d5ea6dddba75c040f56e6d1d7', NULL, 7909, 'prc208ebs', 'PRC-208EBs', 'PRC-208EBs', '1', '980000', '585092221_44.jpg', '2014-11-08 01:04:00', '0', '0', 0),
(582, '58bd418bb31337ad0b54f440e2df38ae', NULL, 7895, 'phim-apoint-wincom-k7', 'Phím  Apoint  WINCOM  K7', ' K7', '1', '115000', '695958471_key-wincom-k77.JPG', '2014-11-11 05:18:00', '0', '0', 0),
(580, '05f3d4e6c514d65caedf0a6f836e3a5a', NULL, 7913, 'svf1421psg', 'SVF1421PSG', '-1', '1', '9990000', '130762502_55.jpg', '2014-11-08 02:58:00', '0', '0', 0),
(590, '3r1evsghkdiggmm22v4i6tiiq2', NULL, 7967, 'may-dem-tien-balion-nh-306s', 'MÁY ĐẾM TIỀN BALION NH 306S', 'BALION NH 306S', '1', '6000000', '1072136610_vke1320391396_71666.jpg', '2015-01-29 10:21:00', '0', '0', 0),
(593, 'st05plg6f4eaenbt2jtkr0bd84', NULL, 7970, 'laptop-dell-alienware-m17x-r3-', 'Laptop Dell AlienWare M17x R3 ', '0', '3', '21500000', '9295_img_12844.JPG', '2015-03-16 18:24:58', '0,0,0', '0', 0),
(596, '1600gfe29ett6mtqrjgr9numl2', NULL, 7970, 'laptop-dell-alienware-m17x-r3-', 'Laptop Dell AlienWare M17x R3 ', '0', '1', '21500000', '9295_img_12844.JPG', '2015-03-16 13:43:00', '0', '0', 0),
(597, '1600gfe29ett6mtqrjgr9numl2', NULL, 7969, 'dell-alienware-m17x-r5-card-card-roi-4g', 'DELL ALIENWARE M17X R5 CARD CARD RỜI 4G', '0', '1', '7000000', '8381_pd-11.jpg', '2015-03-16 13:57:00', '0', '0', 0),
(598, '79mbocagfdacbvtahaehc68vf0', NULL, 7970, 'laptop-dell-alienware-m17x-r3-', 'Laptop Dell AlienWare M17x R3 ', '0', '1', '21500000', '9295_img_12844.JPG', '2015-06-09 15:01:00', '0', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `n_category`
--

CREATE TABLE IF NOT EXISTS `n_category` (
`id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `vn_name` text COLLATE utf8_unicode_ci NOT NULL,
  `en_name` text COLLATE utf8_unicode_ci,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vn_sapo` text COLLATE utf8_unicode_ci,
  `en_sapo` text COLLATE utf8_unicode_ci,
  `vn_details` text COLLATE utf8_unicode_ci NOT NULL,
  `en_details` text COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `properties` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `n_category`
--

INSERT INTO `n_category` (`id`, `pid`, `vn_name`, `en_name`, `slug`, `vn_sapo`, `en_sapo`, `vn_details`, `en_details`, `avatar`, `status`, `position`, `properties`) VALUES
(1, 0, 'Giới thiệu', 'Introduction', 'gioi-thieu', '', '', '<p><span style="font-family: times new roman,times; font-size: 20px;"><strong>QU&Aacute; TR&Igrave;NH PH&Aacute;T TRIỂN</strong></span><br /> <br /><span style="font-family: times new roman,times; font-size: 16px;"><span style="font-size: 18px;"> <strong>C&ocirc;ng ty TNHH TM v&agrave; DV Hưng Nam</strong></span> được th&agrave;nh lập với niềm tin v&agrave; l&yacute; tưởng độc đ&aacute;o, s&aacute;ng tạo, lu&ocirc;n kh&aacute;t mang đến cho kh&aacute;ch h&agrave;ng những sản phẩm hiệu quả trong c&ocirc;ng nghệ th&ocirc;ng tin (CNTT). H&igrave;nh th&agrave;nh trong giai đoạn nền kinh tế ph&aacute;t triển c&ocirc;ng nghệ th&ocirc;ng tin, hội nhập, nhận thức được tầm quan trọng c&aacute;c nhu cầu của kh&aacute;ch h&agrave;ng &ndash; Hưng Nam tiến h&agrave;nh đầu tư, cải thiện từng bước x&acirc;y dựng nhiều sản phẩm đ&aacute;p ứng nhu cầu ng&agrave;y c&agrave;ng một ph&aacute;t triển.</span></p>\r\n<p><br /><span style="font-family: times new roman,times; font-size: 16px;"> Trong đ&oacute; dịch vụ sản phẩm chủ lực của Hưng Nam:</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - Dịch vụ tư vấn thiết kế, lắp đặt c&aacute;c hệ thống CNTT.</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - Dịch vụ tư vấn, hổ trợ người d&ugrave;ng trong lĩnh vực CNTT.</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - Dịch vụ bảo tr&igrave; hệ thống CNTT.</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - Dịch vụ sửa chữa, thay thế thiết bị CNTT.</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - Dịch vụ cho thu&ecirc; IT hệ thống.</span></p>\r\n<p><br /><span style="font-family: times new roman,times; font-size: 16px;"> Ngo&agrave;i ra c&ocirc;ng ty c&ograve;n đa dạng h&oacute;a c&aacute;c sản phẩm cung cấp, với mong muốn đem đến cho kh&aacute;ch h&agrave;ng sự tiện lợi v&agrave; giải ph&aacute;p trọn g&oacute;i:</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - C&ocirc;ng nghệ Online: Domain Name, Business E-mail, Website&hellip;</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - C&ocirc;ng nghệ m&aacute;y t&iacute;nh: Desktop, Laptop.</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - C&ocirc;ng nghệ tr&igrave;nh chiếu: Projector&hellip;</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - C&ocirc;ng nghệ gi&aacute;m s&aacute;t: IP Camera, Anolog Camera&hellip;</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - C&ocirc;ng nghệ thoại VoIP, PBX&hellip;</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - C&ocirc;ng nghệ thời trang: USB Flash&hellip;</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - Thiết bị văn ph&ograve;ng: Printer, Scanner, Fax&hellip;</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - Thiết bị theo nhu cầu: Kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ đến số (84-8) 0987782434 or&nbsp; để được tư vấn v&agrave; đ&aacute;p ứng theo nhu cầu kh&aacute;ch h&agrave;ng (như mực, photocopier&hellip;.).</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - Hổ trợ doanh nghiệp mới th&agrave;nh lập c&aacute;c vấn đề li&ecirc;n quan tới c&ocirc;ng nghệ th&ocirc;ng tin.</span><br /><span style="font-family: times new roman,times; font-size: 16px;"> - Ph&acirc;n phối c&aacute;c sản phẩm c&ocirc;ng nghệ đạt chất lượng: Hard disk. Lan Card, Cable RJ45, Ram, CPU.</span></p>\r\n<p><br /><span style="font-family: times new roman,times; font-size: 16px;"> Với phương ch&acirc;m: &ldquo;<strong>CHẤT LƯỢNG - UY T&Iacute;N - CHUY&Ecirc;N NGHIỆP - TẬN T&Igrave;NH</strong>&rdquo;</span><br /> <br /><span style="font-family: times new roman,times; font-size: 18px;"> <strong>Hưng Nam h&acirc;n hạnh được phục vụ qu&yacute; kh&aacute;ch!</strong></span></p>', '', '', 1, 1, '0'),
(26, 0, 'Liên hệ', '', 'lien-he', '', '', '<h1>C&ocirc;ng ty TNHH ĐIỆN - ĐIỆN TỬ T&Iacute;N AN</h1>\r\n<p><em class="fa fa-fw"></em> Địa chỉ: 353 T&acirc;n Hương ,P T&acirc;n Qu&yacute; ,Q T&acirc;n Ph&uacute; TP Hồ Ch&iacute; Minh</p>\r\n<p><em class="fa fa-fw"></em> ĐT: 083 5073695 - DD: 0907 019689 (gặp Đạt)</p>\r\n<p><em class="fa fa-fw"></em> <a href="mailto:dientutinan@gmail.com">dientutinan@gmail.com</a></p>\r\n<p>Để li&ecirc;n hệ trực tiếp với ch&uacute;ng t&ocirc;i, vui l&ograve;ng điền th&ocirc;ng tin b&ecirc;n dưới</p>', '', '', 1, 11, '0'),
(13, 0, 'Giải Pháp', '', 'giai-phap', '', '', '', '', '', 1, 8, '0'),
(14, 0, 'Đại lý', '', 'dai-ly', '', '', '', '', '', 1, 10, '0'),
(15, 0, 'Hướng dẫn mua hàng', '', 'huong-dan-mua-hang', '', '', '<div class="col-sm-12" style="padding: 0; margin-top: 10px;">\r\n<div class="col-sm-7" style="padding: 0; margin-top: 10px;"><strong>Qu&yacute; kh&aacute;ch thanh to&aacute;n khi trực tiếp khi nhận h&agrave;ng, hoặc đến si&ecirc;u thị hanam.com.vn gần nhất để thanh to&aacute;n.</strong> (Vui l&ograve;ng giữ phiếu thu để đối chiếu khi cần thiết)</div>\r\n</div>\r\n<div class="col-sm-12" style="padding: 0; margin-top: 10px;">\r\n<div class="col-sm-7" style="padding: 0; margin-top: 10px;"><strong>Ng&acirc;n H&agrave;ng Ngoại Thương VN - Vietcombank - Chi nh&aacute;nh S&oacute;ng Thần, TP HCM</strong></div>\r\n</div>\r\n<div class="col-sm-12" style="padding: 0; margin-top: 10px;">\r\n<div class="col-sm-7" style="padding: 0; margin-top: 10px;"><strong>Bạn c&oacute; thẻ ATM nội địa, hoặc thẻ thanh to&aacute;n quốc tế, nh&acirc;n vi&ecirc;n giao h&agrave;ng sẻ mang m&aacute;y qu&eacute;t thẻ để thanh to&aacute;n khi giao h&agrave;ng</strong></div>\r\n</div>', '', '', 1, 2, '0');

-- --------------------------------------------------------

--
-- Table structure for table `n_comments`
--

CREATE TABLE IF NOT EXISTS `n_comments` (
`id` int(4) NOT NULL,
  `cid` int(4) DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `date_created` bigint(11) DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=670 ;

--
-- Dumping data for table `n_comments`
--

INSERT INTO `n_comments` (`id`, `cid`, `details`, `date_created`, `user`) VALUES
(668, 455, 'chia lại cho mình 400K nha', 1340873709, 'test_voucher'),
(669, 455, '450K ok, nha bạn', 1340874014, 'nguyen_nhutmc');

-- --------------------------------------------------------

--
-- Table structure for table `n_config`
--

CREATE TABLE IF NOT EXISTS `n_config` (
`id` int(11) NOT NULL,
  `config_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_value` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `n_config`
--

INSERT INTO `n_config` (`id`, `config_key`, `config_value`) VALUES
(1, 'general', 'a:44:{s:15:"item_news_index";s:2:"10";s:17:"item_news_per_row";s:1:"8";s:21:"related_news_per_page";s:1:"5";s:17:"products_per_page";s:2:"16";s:15:"image_row_items";i:0;s:10:"admin_mail";s:23:"phidung892000@gmail.com";s:3:"tel";s:11:"083 5073695";s:7:"hotline";s:1:"0";s:3:"fax";s:14:"(08) 1234 5678";s:7:"address";s:67:"L24 Quang Trung, phường.11, quận .Gò Vấp, Tp.Hồ Chí Minh";s:10:"popup_home";i:0;s:13:"sprice_active";i:0;s:11:"address_eng";i:0;s:13:"banner_active";i:0;s:8:"hotline1";s:26:"0907 019689 (gặp Đạt)";s:8:"hotline2";s:10:"0932132751";s:3:"tax";s:11:" 0309506296";s:8:"keywords";s:44:"Công ty TNHH ĐIỆN - ĐIỆN TỬ TÍN AN";s:7:"company";s:44:"CÔNG TY CỔ PHẦN THỜI TRANG NAM VIỆT";s:10:"company_en";s:1:"0";s:7:"website";s:12:" www.tpe.com";s:8:"hotline3";i:0;s:11:"description";s:44:"Công ty TNHH ĐIỆN - ĐIỆN TỬ TÍN AN";s:10:"company_vn";s:44:"Công ty TNHH ĐIỆN - ĐIỆN TỬ TÍN AN";s:10:"address_vn";s:60:"353 Tân Hương ,P Tân Quý ,Q Tân Phú TP Hồ Chí Minh";s:10:"address_en";s:76:"190A Phan Văn Trị, Phường 12, Quận Bình Thạnh, Tp. Hồ Chí Minh";s:15:"nguoidaidien_vn";i:0;s:15:"nguoidaidien_en";i:0;s:9:"chucvu_vn";i:0;s:9:"chucvu_en";i:0;s:23:"products_spmoi_per_page";s:2:"12";s:25:"products_spchinh_per_page";s:2:"35";s:27:"products_spbanchay_per_page";i:0;s:26:"products_spnoibat_per_page";i:0;s:12:"facebooklink";s:37:"http://www.facebook.com/sieuthiphinam";s:29:"products_spkhuyenmai_per_page";s:2:"35";s:33:"products_spgiasocmoingay_per_page";s:3:"100";s:8:"facebook";s:19:"chuyen.quan.ao.teen";s:7:"youtube";s:11:"x8CK7ZU4FrM";s:6:"google";s:1:"#";s:6:"zingme";s:1:"#";s:7:"twitter";s:1:"#";s:24:"related_product_per_page";s:1:"4";s:7:"marquee";i:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `n_customers`
--

CREATE TABLE IF NOT EXISTS `n_customers` (
`id` bigint(11) NOT NULL,
  `nhomid` bigint(11) DEFAULT NULL,
  `ngonnguid` int(11) DEFAULT NULL,
  `dotuoiid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=91 ;

--
-- Dumping data for table `n_customers`
--

INSERT INTO `n_customers` (`id`, `nhomid`, `ngonnguid`, `dotuoiid`, `name`, `address`, `email`, `tel`, `status`) VALUES
(1, 20099, 0, 0, 'customers1370512675', '', 'xxx@aaa.com', '', 1),
(2, 29271, 0, 0, 'customers1370570730', '', 'testnewsleter@test.com', '', 1),
(3, 27610, 0, 0, 'customers1370600001', '', 'sendto@test.com', '', 1),
(4, 31530, 0, 0, 'customers1374573557', '', 'test@email.com', '', 1),
(5, 6919, 0, 0, 'customers1374577027', '', 'phukienvitinh.com.vn@gmail.com', '', 1),
(6, 11990, 0, 0, 'customers1374659173', '', 'phung_du@yahoo.com', '', 1),
(7, 7797, 0, 0, 'customers1374737291', '', 'haoptk.vinatech@gmail.com', '', 1),
(8, 8568, 0, 0, 'customers1375265789', '', 'nhan.nguyen@hangchinhhieu.vn', '', 1),
(9, 81, 0, 0, 'customers1375265816', '', 'nguyennhanbus@yahoo.com', '', 1),
(10, 16866, 0, 0, 'customers1375552346', '', 'vodison@yahoo.com', '', 1),
(11, 26987, 0, 0, 'customers1376292996', '', 'lengocthanhthanh@gmail.com', '', 1),
(12, 726, 0, 0, 'customers1376353371', '', 'hoangtu_den95@yahoo.com', '', 1),
(13, 1920, 0, 0, 'customers1376877648', '', 'vovanthanhbs@hotmail.com', '', 1),
(14, 9997, 0, 0, 'customers1377334916', '', 'dungvicomputer@yahoo.com', '', 1),
(15, 29764, 0, 0, 'customers1377364435', '', 'ducquang415@yahoo.com', '', 1),
(16, 9310, 0, 0, 'customers1377683558', '', 'vp1.lekhang@yahoo.com', '', 1),
(17, 23561, 0, 0, 'customers1377853629', '', 'tdcomputer2006@yahoo.com', '', 1),
(18, 32739, 0, 0, 'customers1378192734', '', 'dutieubinh@yahoo.com', '', 1),
(19, 5546, 0, 0, 'customers1378437848', '', 'nguyendanhva@vinatoanluc.vn', '', 1),
(20, 8552, 0, 0, 'customers1378530613', '', 'duccung3787@gmail.com', '', 1),
(21, 15759, 0, 0, 'customers1378796427', '', 'trung.tbest@yahoo.com', '', 1),
(22, 20740, 0, 0, 'customers1378817917', '', 'quangtuyenvn@gmail.com', '', 1),
(23, 11459, 0, 0, 'customers1380962035', '', 'phungct.phunhuan@gmail.com', '', 1),
(24, 4320, 0, 0, 'customers1381524868', '', 'cafeit141@gmail.com', '', 1),
(25, 13432, 0, 0, 'customers1381915596', '', 'laptoplequan@yahoo.com', '', 1),
(26, 5969, 0, 0, 'customers1381915626', '', 'maihuycomputer@yahoo.com', '', 1),
(27, 18395, 0, 0, 'customers1382955942', '', 'baochautbc73@gmail.com', '', 1),
(28, 6594, 0, 0, 'customers1382955973', '', 'baochaucomputer@yahoo.com', '', 1),
(29, 20384, 0, 0, 'customers1383031059', '', 'songlapthanh@gmail.com', '', 1),
(30, 10383, 0, 0, 'customers1384156361', '', 'sale.thuangia@yahoo.com', '', 1),
(31, 10838, 0, 0, 'customers1385357348', '', 'hung_nguyenthanh25@yahoo.com', '', 1),
(32, 28444, 0, 0, 'customers1385377092', '', 'thanh_mtt@yahoo.com.vn', '', 1),
(33, 14375, 0, 0, 'customers1386316186', '', 'nh0kmind0u@yahoo.com.vn', '', 1),
(34, 3369, 0, 0, 'customers1386405276', '', 'kienktc@gmail.com', '', 1),
(35, 6882, 0, 0, 'customers1386815711', '', 'chuifquachhongkhanh02@gmail.com', '', 1),
(36, 9335, 0, 0, 'customers1387013255', '', 'quangkhaivn@yahoo.com', '', 1),
(37, 10505, 0, 0, 'customers1387014339', '', 'spc_daklak@yahoo.com', '', 1),
(38, 17453, 0, 0, 'customers1387254414', '', 'vitinhvungtau@gmail.com', '', 1),
(39, 3881, 0, 0, 'customers1388114231', '', 'tung.tran@maiphuong.vn', '', 1),
(40, 14417, 0, 0, 'customers1388519312', '', 'vuquach@gmail.com', '', 1),
(41, 15560, 0, 0, 'customers1389254951', '', 'vbanhatvn@yahoo.com', '', 1),
(42, 22480, 0, 0, 'customers1389758650', '', 'nguyenduong186@gmail.com', '', 1),
(43, 26076, 0, 0, 'customers1391655754', '', 'info@npc.vn', '', 1),
(44, 5861, 0, 0, 'customers1391655765', '', 'nhanphuocpc@gmail.com', '', 1),
(45, 10937, 0, 0, 'customers1392118172', '', 'thanhcnm2@gmail.com', '', 1),
(46, 20544, 0, 0, 'customers1392199159', '', 'bki_baokha@yahoo.com', '', 1),
(47, 9986, 0, 0, 'customers1392259178', '', 'nguyennk.tdg@gmail.com', '', 1),
(48, 4677, 0, 0, 'customers1392349310', '', 'minhtridl@gmail.com', '', 1),
(49, 32154, 0, 0, 'customers1392349332', '', 'tri.do@dalatresorts.com', '', 1),
(50, 23640, 0, 0, 'customers1392360433', '', 'viethung@tanhoanggia.net', '', 1),
(51, 27197, 0, 0, 'customers1392782960', '', 'phamsonlt@yahoo.com.vn', '', 1),
(52, 8916, 0, 0, 'customers1392889208', '', 'truongvi57@gmail.com', '', 1),
(53, 9125, 0, 0, 'customers1393036327', '', 'tuan8cntmk2080@yahoo.com.vn', '', 1),
(54, 17448, 0, 0, 'customers1394777869', '', '3niemtin@gmail.com', '', 1),
(55, 968, 0, 0, 'customers1395048122', '', 'anninhngoclinh@gmail.com', '', 1),
(56, 28708, 0, 0, 'customers1395203004', '', 'dinhlecomputer@gmail.com', '', 1),
(57, 25643, 0, 0, 'customers1395843551', '', 'nhandesign1306@gmail.com', '', 1),
(58, 13228, 0, 0, 'customers1396457092', '', 'trongman83@gmail.com', '', 1),
(59, 12748, 0, 0, 'customers1396624947', '', 'llit@hcm.vnn.vn', '', 1),
(60, 26063, 0, 0, 'customers1397710183', '', 'phunhan52@gmail.com', '', 1),
(61, 30664, 0, 0, 'customers1398003923', '', 'ictnhdang@yahoo.com.vn', '', 1),
(62, 19042, 0, 0, 'customers1398329517', '', 'ngoctuan1506@gmail.com', '', 1),
(63, 16091, 0, 0, 'customers1398343825', '', 'nicomvn@gmail.com', '', 1),
(64, 13535, 0, 0, 'customers1398659302', '', 'mytinmobile@gmail.com', '', 1),
(65, 1891, 0, 0, 'customers1398919072', '', 'trieuvinh.hcm@gmail.com', '', 1),
(66, 14132, 0, 0, 'customers1399193605', '', 'nguyenluhung@gmail.com', '', 1),
(67, 30952, 0, 0, 'customers1399382405', '', 'manh.pham@datducthinh.vn', '', 1),
(68, 12545, 0, 0, 'customers1399478694', '', 'minhty1987@yahoo.com.vn', '', 1),
(69, 18079, 0, 0, 'customers1399691037', '', 'pinbaotin@yahoo.com', '', 1),
(70, 29386, 0, 0, 'customers1400471562', '', 'moonlight8911@yahoo.com', '', 1),
(71, 7643, 0, 0, 'customers1400513574', '', 'hoangduchpc@gmail.com', '', 1),
(72, 13128, 0, 0, 'customers1400568843', '', 'thuy_hoanganh2009@yahoo.com', '', 1),
(73, 12850, 0, 0, 'customers1400743312', '', 'duongdaovan86@yahoo.com', '', 1),
(74, 31941, 0, 0, 'customers1401621405', '', 'vinhlth@stw.', '', 1),
(75, 22042, 0, 0, 'customers1401621410', '', 'vinhlth@stw.vn', '', 1),
(76, 23483, 0, 0, 'customers1401959307', '', 'nguyenkinhdang.dang@gmail.com', '', 1),
(77, 20113, 0, 0, 'customers1402908043', '', 'huynhhuutai97@gmail.com', '', 1),
(78, 11132, 0, 0, 'customers1403714384', '', 'hungminhcomputer@gmail.com', '', 1),
(79, 2569, 0, 0, 'customers1404371966', '', 'phamlegiaco@yahoo.com', '', 1),
(80, 29576, 0, 0, 'customers1404449142', '', 'capsulshop@gmail.com', '', 1),
(81, 31935, 0, 0, 'customers1404485643', '', 'phamnhuvu.ou@gmail.com', '', 1),
(82, 15609, 0, 0, 'customers1404543023', '', 'kieuhue0984009977@gmail.com', '', 1),
(83, 4106, 0, 0, 'customers1405064884', '', 'sangsang02@gmail.com', '', 1),
(84, 14115, 0, 0, 'customers1405320710', '', 'maytinhnhattin@gmail.com', '', 1),
(85, 20501, 0, 0, 'customers1405911812', '', 'hainp88@gmail.com', '', 1),
(86, 4727, 0, 0, 'customers1406093616', '', 'bki.baokha@gmail.com', '', 1),
(87, 5872, 0, 0, 'customers1406176545', '', 'baogia@tantienco.com', '', 1),
(88, 11542, 0, 0, 'customers1406470721', '', 'saigon204@gmail.com', '', 1),
(89, 23895, 0, 0, 'customers1406948859', '', 'kinhdoanhanhhao@gmail.com', '', 1),
(90, 14059, 0, 0, 'customers1407036207', '', 'quy0905013467@gmail.com', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_email`
--

CREATE TABLE IF NOT EXISTS `n_email` (
`id` int(10) NOT NULL,
  `to` text COLLATE utf8_unicode_ci,
  `cc` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci,
  `attach` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_flashbanner`
--

CREATE TABLE IF NOT EXISTS `n_flashbanner` (
`id` int(11) NOT NULL,
  `logo_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_gallery`
--

CREATE TABLE IF NOT EXISTS `n_gallery` (
`id` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `logo_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=94 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_gallery_groups`
--

CREATE TABLE IF NOT EXISTS `n_gallery_groups` (
`id` int(11) NOT NULL,
  `vn_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_imgbanner`
--

CREATE TABLE IF NOT EXISTS `n_imgbanner` (
`id` int(11) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  `logo_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `vn_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vn_details` text COLLATE utf8_unicode_ci,
  `en_details` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_imgproducts`
--

CREATE TABLE IF NOT EXISTS `n_imgproducts` (
`id` tinyint(11) NOT NULL,
  `idpro` bigint(11) DEFAULT NULL,
  `idalpro` tinyint(11) DEFAULT NULL,
  `vn_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `file1` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `file4` varchar(255) DEFAULT NULL,
  `file5` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `n_imgproducts`
--

INSERT INTO `n_imgproducts` (`id`, `idpro`, `idalpro`, `vn_name`, `en_name`, `file1`, `file2`, `file3`, `file4`, `file5`, `status`) VALUES
(15, 1, 1, 'bang bao gia 1', '', '28433_bang_gia_sonyvfesvesvv.doc', NULL, NULL, NULL, NULL, 1),
(16, 1, 1, 'bang bao gia 1', '', '26290_bang-gi-sony-vaio .doc', NULL, NULL, NULL, NULL, 1),
(17, 1, 1, 'sgvsr', '', '24872_bang_gia_sonyy.doc', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_members`
--

CREATE TABLE IF NOT EXISTS `n_members` (
`id` bigint(20) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) DEFAULT NULL,
  `fullname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tinh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phai` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cell` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `n_members`
--

INSERT INTO `n_members` (`id`, `username`, `password`, `type`, `fullname`, `birthday`, `about`, `email`, `country`, `tinh`, `company`, `phai`, `address`, `cel`, `tel`, `fax`, `cell`, `date_created`, `last_login`, `properties`, `status`) VALUES
(11, '', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Nguyen Thanh Nhut', '', '', 'thanhnhut@ava.vn', '', '', 'Cong Ty AVA', '', '92 dang nguyen can', '', '123456', '', NULL, '2013-06-05 15:55:20', '2013-07-10 13:10:38', 'a:6:{s:11:"chk_service";i:0;s:11:"chk_product";i:0;s:12:"chk_visistor";i:0;s:11:"chk_project";i:0;s:14:"chk_isvietcons";i:0;s:13:"chk_ispartner";i:0;}', 1),
(12, '', 'd5033f20161347670a760e373acaab3d', 0, 'Nguyên Lê', '', '', 'ngocvien@ava.vn', '', '', 'AVA', '', '92 đặng nguyên cẩn', '', '0983 911 911', '', NULL, '2013-06-05 16:08:00', '2013-06-05 16:10:10', 'a:6:{s:11:"chk_service";i:0;s:11:"chk_product";i:0;s:12:"chk_visistor";i:0;s:11:"chk_project";i:0;s:14:"chk_isvietcons";i:0;s:13:"chk_ispartner";i:0;}', 1),
(13, '', 'd41d8cd98f00b204e9800998ecf8427e', 0, '', '', '', '', '', '', '', '', '', '', '', '', NULL, '2013-07-09 17:38:38', '2013-07-09 17:38:38', 'a:6:{s:11:"chk_service";i:0;s:11:"chk_product";i:0;s:12:"chk_visistor";i:0;s:11:"chk_project";i:0;s:14:"chk_isvietcons";i:0;s:13:"chk_ispartner";i:0;}', 1),
(14, '', '15f8182445bac21b05802649a8a698e7', 0, 'Thư Khôi', '', '', 'ntngocvien@yahoo.com', '', '', '', '', '123', '', '01223 911911', '', NULL, '2013-07-10 13:09:37', '2013-07-10 13:10:00', 'a:6:{s:11:"chk_service";i:0;s:11:"chk_product";i:0;s:12:"chk_visistor";i:0;s:11:"chk_project";i:0;s:14:"chk_isvietcons";i:0;s:13:"chk_ispartner";i:0;}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_menus`
--

CREATE TABLE IF NOT EXISTS `n_menus` (
`id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `mgid` tinyint(4) DEFAULT NULL,
  `vn_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vn_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` tinyint(4) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=83 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_menu_groups`
--

CREATE TABLE IF NOT EXISTS `n_menu_groups` (
`id` int(11) NOT NULL,
  `vn_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_news`
--

CREATE TABLE IF NOT EXISTS `n_news` (
`id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT 'slug',
  `lang` varchar(255) DEFAULT 'vn',
  `vn_name` varchar(255) DEFAULT NULL,
  `en_name` varchar(255) DEFAULT NULL,
  `vn_sapo` text,
  `en_sapo` text,
  `vn_details` text,
  `en_details` text,
  `popup` tinyint(4) DEFAULT NULL,
  `home` tinyint(4) DEFAULT NULL,
  `cid` int(11) DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `n_news`
--

INSERT INTO `n_news` (`id`, `slug`, `lang`, `vn_name`, `en_name`, `vn_sapo`, `en_sapo`, `vn_details`, `en_details`, `popup`, `home`, `cid`, `avatar`, `position`, `date_created`, `keywords`, `status`) VALUES
(1, 'thi-phan-windows-8-moi-gan-bang-vista', 'vn', 'Thị phần Windows 8 mới gần bằng Vista', '', '<p>C&aacute;c số liệu vừa c&ocirc;ng bố của Net Applications một lần nữa khẳng định Windows 8 vẫn chưa tạo ra được cuộc bứt ph&aacute; cho thị trường trước c&aacute;c "anh em" kh&aacute;c.</p>', '', '<p class="dt-pts">C&aacute;c số liệu vừa c&ocirc;ng bố của Net Applications một lần nữa khẳng định Windows 8 vẫn chưa tạo ra được cuộc bứt ph&aacute; cho thị trường trước c&aacute;c "anh em" kh&aacute;c.</p>\r\n<ul class="new-relate">\r\n<li>Windows XP bị hạ bệ sau hơn 10 năm</li>\r\n</ul>\r\n<div id="article_content">\r\n<p>Thị phần của Windows 8 hiện mới chỉ c&oacute; 4,27%, k&eacute;m hơn một ch&uacute;t so với Vista đang ở mức 4,51%. Hai hệ điều h&agrave;nh đang nắm giữ thị phần lớn nhất l&agrave; Windows 7 với 44,85% v&agrave; XP l&agrave; 37,74%.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: center;"><img style="width: 500px;" src="http://l.f5.img.vnexpress.net/2013/06/03/share-1370226852_500x0.jpg" alt="share-1370226852_500x0.jpg" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Thị phần của c&aacute;c hệ điều h&agrave;nh. Ảnh: <em>Cnet.</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Brian T. Gladden, Gi&aacute;m đốc t&agrave;i ch&iacute;nh của Dell, cho biết c&oacute; h&agrave;ng triệu kh&aacute;ch h&agrave;ng của h&atilde;ng vẫn sử dụng hệ điều h&agrave;nh XP thay v&igrave; Windows 8. Gần đ&acirc;y, c&aacute;c "thượng đế'' của Dell mới bắt đầu n&acirc;ng cấp dần l&ecirc;n phi&ecirc;n bản mới hơn l&agrave; Windows 7. Thậm ch&iacute;, đại diện của Dell c&ograve;n cho biết: "Windows 8 đ&atilde; kh&ocirc;ng k&iacute;ch th&iacute;ch thị trường tăng trưởng như những g&igrave; h&atilde;ng từng hi vọng". Trước đ&oacute;, phi&ecirc;n bản Windows mới nhất của Microsoft kh&ocirc;ng &iacute;t lần bị giới c&ocirc;ng nghệ ch&ecirc; bai bởi n&oacute; kh&ocirc;ng tạo ra được "c&uacute; hu&yacute;ch" cho thị trường như những g&igrave; hứa hẹn hồi mới ra mắt.</p>\r\n<p>Ra mắt từ th&aacute;ng 8/2001, Windows XP thống trị thị trường trong hơn một thập kỷ. Đầu th&aacute;ng 9 năm ngo&aacute;i, phi&ecirc;n bản hệ điều h&agrave;nh n&agrave;y mới bị Windows 7 "hạ bệ". Tuy nhi&ecirc;n, trong gần một năm vừa qua, Windows XP vẫn trụ vững ở vị tr&iacute; thứ hai. Số liệu từ Net Applications cho thấy thị phần của phi&ecirc;n bản n&agrave;y chỉ giảm 0,57% so với th&aacute;ng 4 năm nay.</p>\r\n<p>Theo dự kiến, Windows XP sẽ bi ngưng hỗ trợ v&agrave;o ng&agrave;y 8/4 năm sau. Điều n&agrave;y c&oacute; thể tạo điều kiện cho những phi&ecirc;n bản như Windows 8 cải thiện được vị tr&iacute; trong tương lai.</p>\r\n<p style="text-align: right;"><strong>Thanh Thu&yacute;</strong></p>\r\n</div>', '', NULL, 0, 2, '8075_windows_8_-100010033-gallery-ad5511.jpg', 1, '2013-06-03 16:15:33', '', 0),
(2, 'danh-gia-may-anh-vuong-sang-tao-canon-powershot-n-', 'vn', 'Đánh giá máy ảnh vuông sáng tạo Canon Powershot N ', '', '<p>Model compact mới của Canon với thiết kế độc đ&aacute;o c&ugrave;ng chất lượng h&igrave;nh ảnh đẹp hướng tới người d&ugrave;ng y&ecirc;u th&iacute;ch chụp ảnh cần sự tiện lợi v&agrave; phong c&aacute;ch.</p>', '', '<div class="dtab-left">\r\n<p class="ptit">Model compact mới của Canon với thiết kế độc đ&aacute;o c&ugrave;ng chất lượng h&igrave;nh ảnh đẹp hướng tới người d&ugrave;ng y&ecirc;u th&iacute;ch chụp ảnh cần sự tiện lợi v&agrave; phong c&aacute;ch.</p>\r\n<div id="article_content" class="content">\r\n<p class="Normal">Canon thiết kết model Powershot N d&agrave;nh cho người th&iacute;ch phong c&aacute;ch Lomography hay Instargram nhờ c&aacute;c hiệu ứng độc đ&aacute;o v&agrave; sự tiện cho việc chụp ảnh ở nhiều g&oacute;c độ kh&aacute;c nhau</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img style="width: 500px;" src="http://l.f5.img.vnexpress.net/2013/05/28/powershot-N-1-1369683855_500x0.jpg" alt="powershot-N-1_1369683344[1186083644].jpg" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Canon Powershot N với thiết kế h&igrave;nh vu&ocirc;ng độc đ&aacute;o.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Sản phẩm được thiết kế gần như h&igrave;nh vu&ocirc;ng với ống k&iacute;nh v&agrave; 2 v&ograve;ng xoay zoom - chụp chiếm hết phần trước m&aacute;y. Th&acirc;n m&aacute;y được l&agrave;m bằng kim loại phủ sơn tĩnh điện cho cảm gi&aacute;c cầm chắc chắn.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img style="width: 500px;" src="http://l.f5.img.vnexpress.net/2013/05/28/powershot-N-7-1369683855_500x0.jpg" alt="powershot-N-7_1369683358[1186083644].jpg" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Với cơ cấu zoom chụp độc đ&aacute;o m&aacute;y c&oacute; thể sử dụng dễ d&agrave;ng bằng 1 tay.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal"><span style="font-size: 11.8pt;">Điểm độc đ&aacute;o nhất của Powershot N l&agrave; cơ cấu zoom v&agrave; chụp với 2 v&ograve;ng xoay ở ph&iacute;a trước m&aacute;y bao quanh ống k&iacute;nh. Ở v&ograve;ng xoay d&ugrave;ng để chụp, Canon thiết kế hệ thống n&uacute;t chụp k&eacute;p, người d&ugrave;ng c&oacute; thể thao t&aacute;c bằng c&aacute;ch ấn l&ecirc;n hoặc xuống, cơ cấu zoom cũng hoạt động tương tự do đ&oacute; bạn c&oacute; thể sử dụng m&aacute;y để zoom v&agrave; chụp bằng một tay dễ d&agrave;ng.</span></p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img style="width: 500px;" src="http://l.f5.img.vnexpress.net/2013/05/28/powershot-N-8-1369683855_500x0.jpg" alt="powershot-N-8_1369683385[1186083644].jpg" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">M&agrave;n h&igrave;nh cảm ứng 2.8 inch c&oacute; thể lật 90 độ gi&uacute;p chụp nhiều g&oacute;c độ kh&oacute; dễ d&agrave;ng.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal"><span style="font-size: 11.8pt;">Ph&iacute;a sau m&aacute;y l&agrave; m&agrave;n h&igrave;nh cảm ứng k&iacute;ch thước 2.8 inch - mọi t&ugrave;y chỉnh đều được thực hiện qua m&agrave;n h&igrave;nh n&agrave;y. M&agrave;n h&igrave;nh cũng l&agrave; k&iacute;nh ngắm v&agrave; c&oacute; thể lật một g&oacute;c 90 độ để chụp được nhiều g&oacute;c độ kh&aacute;c nhau. M&agrave;n h&igrave;nh chỉ lật được 90 độ cũng khiến việc tự chụp ch&acirc;n dung kh&oacute; hơn bởi người chụp kh&ocirc;ng quan s&aacute;t được h&igrave;nh ảnh của m&igrave;nh. &nbsp;Tuy nhi&ecirc;n, nhờ ống k&iacute;nh g&oacute;c kh&aacute; rộng n&ecirc;n sau thời gian l&agrave;m quen, bạn sẽ thấy dễ d&agrave;ng hơn với thao t&aacute;c tự chụp.</span></p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/05/28/powershot-N-2-1369683879_500x0.jpg" alt="powershot-N-2_1369683589[1186083644].jpg" width="500" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Hai v&ograve;ng tr&ograve;n zoom v&agrave; chụp với v&ograve;ng chụp ph&iacute;a tr&ecirc;n nhỏ hơn v&ograve;ng zoom.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/05/28/powershot-N-3-1369683879_500x0.jpg" alt="powershot-N-3_1369683589[1186083644].jpg" width="500" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">N&uacute;t gạt chuyển chế độ Creative shot, n&uacute;t kết nối Wi-Fi v&agrave; n&uacute;t xem lại h&igrave;nh c&ugrave;ng cổng kết nối mini USB ở cạnh phải m&aacute;y.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/05/28/powershot-N-4-1369683879_500x0.jpg" alt="powershot-N-4_1369683589[1186083644].jpg" width="500" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">N&uacute;t nguồn ở cạnh tr&aacute;i m&aacute;y.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/05/28/powershot-N-4a-1369683879_500x0.jpg" alt="powershot-N-4a_1369683589[1186083644].jp" width="500" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Ph&iacute;a dưới c&oacute; khe lắp thẻ nhớ v&agrave; pin.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal"><span style="font-size: 11.8pt;">M&aacute;y chỉ c&oacute; 4 n&uacute;t bấm trong đ&oacute; n&uacute;t nguồn được bố tr&iacute; ở cạnh tr&aacute;i.&nbsp; Cạnh phải l&agrave; n&uacute;t Wi-Fi d&ugrave;ng để kết nối v&agrave; chia sẻ nhanh h&igrave;nh ảnh với c&aacute;c thiết bị di động kh&aacute;c như điện thoại, m&aacute;y t&iacute;nh bảng, laptop hay một m&aacute;y Poweshot N kh&aacute;c. Cạnh phải m&aacute;y c&ograve;n c&oacute; cần gạt d&ugrave;ng để chuyển qua chế độ chụp Creative Shot.</span></p>\r\n<p class="Normal">Với h&igrave;nh d&aacute;ng nhỏ gọn, Powershot N chỉ được trang bị đ&egrave;n flash LED c&oacute; cường độ s&aacute;ng thấp n&ecirc;n với những trường hợp cần b&ugrave; s&aacute;ng nhiều th&igrave; đ&egrave;n flash led n&agrave;y kh&ocirc;ng c&oacute; t&aacute;c dụng nhiều. D&ugrave; vậy, với khả năng chụp h&igrave;nh ở ISO cao tới 6400, việc sử dụng đ&egrave;n flash dường như l&agrave; kh&ocirc;ng c&ograve;n cần thiết nữa.</p>\r\n<p class="Normal" style="text-align: center;"><strong>&gt;&gt; Xem đ&aacute;nh gi&aacute; chất lượng h&igrave;nh ảnh v&agrave; chế độ chụp</strong></p>\r\n<p class="Normal" align="right"><em>B&agrave;i v&agrave; ảnh:</em> <strong>Huy Đức</strong></p>\r\n</div>\r\n</div>', '', NULL, 0, 21, '30824_powershot-n-1-1369683855_500x00.jpg', 2, '2014-10-31 01:31:26', '', 0),
(3, 'nikon-d400-se-co-gia-tu-1700-usd-cho-than-may', 'vn', 'Nikon D400 sẽ có giá từ 1.700 USD cho thân máy', '', '<p>Nhiều khả năng model DSLR định dạng DX n&agrave;y sẽ được c&ocirc;ng bố trong th&aacute;ng 9/2013.</p>', '', '<div id="article_content">\r\n<p class="Normal">Trở lại thời điểm c&aacute;ch đ&acirc;y gần 3 th&aacute;ng, đại diện Nikon khu vực Ch&acirc;u &Acirc;u từng thừa nhận D7100 kh&ocirc;ng phải l&agrave; mẫu DSLR được thiết kế nhằm thay thế model D300s của h&atilde;ng. Nhưng phải đến h&ocirc;m nay, <em>Photographylife </em>mới đăng tải những th&ocirc;ng tin mới nhất cho thấy - D400 - phi&ecirc;n bản thay thế mẫu D300s sẽ xuất hiện sau khi &ldquo;người tiền nhiệm&rdquo; mừng sinh nhật lần thứ 4 của m&igrave;nh.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/Nikon-D400-1370188159_500x0.jpg" alt="Nikon-D400-1370188159_500x0.jpg" width="500" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Nkon D400 sẽ được trang bị bộ xử l&yacute; h&igrave;nh ảnh Expeed 4 v&agrave; hệ thống lấy n&eacute;t mạnh mẽ hơn nhiều so với model D7100. Ảnh: <em>Photographylife .</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Cũng theo trang c&ocirc;ng nghệ n&agrave;y, Nikon D400 sẽ sở hữu cảm biến định dạng DX độ ph&acirc;n giải 24 megapixel hỗ trợ dải nhạy s&aacute;ng ISO 100 &ndash; 6.400. Bộ cảm biến của phi&ecirc;n bản mới cũng sẽ được lược bỏ th&agrave;nh phần k&iacute;nh lọc khử răng cưa nhằm tối ưu chất lượng v&agrave; độ sắc n&eacute;t ảnh chụp. B&ecirc;n cạnh hệ thống lấy n&eacute;t AF ho&agrave;n to&agrave;n mới (Nikon dự định sẽ trang bị cho model D4s v&agrave;o năm 2014), Nikon D400 c&ograve;n được trang bị bộ xử l&yacute; h&igrave;nh ảnh tốc độ cao Expeed 4 mới nhất với thiết kế bộ nhớ đệm lớn, hỗ trợ ghi h&igrave;nh HD 60p. Về ngoại h&igrave;nh, D400 sẽ sở hữu phần khung xương hợp kim magie si&ecirc;u bền, hệ thống n&uacute;t điều khiển tựa như model D800 v&agrave; k&iacute;nh ngắm quang dạng lăng k&iacute;nh 5 mặt với độ phủ l&ecirc;n đến 100%.</p>\r\n<p class="Normal">Đại diện <em>Photographylife </em>cho hay nhiều khả năng D400 sẽ được ch&iacute;nh thức ra mắt v&agrave;o th&aacute;ng 9 năm nay với mức gi&aacute; khoảng 1.700 USD cho th&acirc;n m&aacute;y. V&agrave; nếu như đ&uacute;ng theo c&aacute;c kế hoạch đ&atilde; được đưa ra, D400 sẽ được thương mại h&oacute;a trong qu&yacute; 1 năm 2014 nhằm cạnh tranh trực tiếp với model Canon 7D Mark II.</p>\r\n<p class="Normal" style="text-align: right;"><strong>Quỳnh L&acirc;m</strong></p>\r\n</div>', '', NULL, 0, 2, '9345_nikon-d400-1370188159_500x00.jpg', 3, '2013-06-03 16:18:05', '', 0),
(4, 'fpt-b5-va-fpt-b8-cho-nguoi-dung-pho-thong-', 'vn', 'FPT B5 và FPT B8 cho người dùng phổ thông ', '', '<p>C&ocirc;ng ty TNHH Sản phẩm C&ocirc;ng nghệ FPT ra mắt bộ đ&ocirc;i sản phẩm điện thoại phổ th&ocirc;ng FPT B5 v&agrave; FPT B8 với mức gi&aacute; hấp dẫn.</p>', '', '<p class="dt-pts">C&ocirc;ng ty TNHH Sản phẩm C&ocirc;ng nghệ FPT ra mắt bộ đ&ocirc;i sản phẩm điện thoại phổ th&ocirc;ng FPT B5 v&agrave; FPT B8 với mức gi&aacute; hấp dẫn.</p>\r\n<div id="article_content">\r\n<p>Điện thoại th&ocirc;ng minh đang b&ugrave;ng nổ, gia tăng mạnh thị phần tuy nhi&ecirc;n d&ograve;ng điện thoại phổ th&ocirc;ng vẫn c&oacute; vị thế ri&ecirc;ng của m&igrave;nh. Để đ&aacute;p ứng nhu cầu đa dạng của người d&ugrave;ng, C&ocirc;ng ty TNHH Sản phẩm C&ocirc;ng nghệ FPT đ&atilde; tung ra thị trường hai mẫu điện thoại phổ th&ocirc;ng FPT B5 v&agrave; FPT B8 với thiết kế trẻ trung, đầy đủ c&aacute;c t&iacute;nh năng cơ bản, kết nối 2 sim, pin dung lượng lớn, hoạt động bền bỉ nhưng c&oacute; mức gi&aacute; rẻ.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: center;"><img src="http://l.f5.img.vnexpress.net/2013/06/02/1-1370166985_500x0.jpg" alt="1.jpg" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Thiết kế khỏe khoắn ấn tượng của FPT B5.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Điểm nhấn của bộ đ&ocirc;i sản phẩm n&agrave;y nằm ở thiết kế dạng thanh nhưng mỏng v&agrave; nhẹ (chỉ xấp xỉ 100g) gi&uacute;p người d&ugrave;ng sử dụng thoải m&aacute;i. M&agrave;n h&igrave;nh FPT B5 rộng 2,4 inch c&ograve;n B8 l&agrave; 2,6 inch, b&agrave;n ph&iacute;m vật l&yacute; r&otilde; r&agrave;ng, dễ bấm mang lại những trải nghiệm tốt cả khi giải tr&iacute; hay nghe gọi, nhắn tin.</p>\r\n<p>Cả hai điện thoại đều c&oacute; những t&iacute;nh năng cơ bản như kết nối hai sim, Bluetooth, cổng USB, camera độ ph&acirc;n giải VGA, xem video, nghe nhạc, nghe FM, khe cắm thẻ nhớ (c&oacute; thể mở rộng l&ecirc;n 4 GB đối với FPT B5 v&agrave; 32 GB đối với FPT B8).</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: center;"><img src="http://l.f5.img.vnexpress.net/2013/06/02/2-1370166986_500x0.jpg" alt="2.JPG" width="400" height="422" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Pin "khủng" 2.100 mAh gi&uacute;p FPT B8 c&oacute; thể duy tr&igrave; thời gian chờ l&ecirc;n đến 2 th&aacute;ng.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>FPT B8 sở hữu dung lượng pin l&ecirc;n đến 2.100 mAh cho thời gian gọi 8,3 giờ li&ecirc;n tục v&agrave; thời gian chờ l&ecirc;n đến 1.400 giờ (tương đương 2 th&aacute;ng) trong điều kiện ti&ecirc;u chuẩn. Đ&acirc;y l&agrave; một trong những mẫu điện thoại cho thời gian sử dụng bền bỉ nhất hiện nay tr&ecirc;n thị trường.</p>\r\n<p>C&ograve;n FPT B5 c&oacute; dung lượng pin thấp hơn 1.400 mAh, tuy nhi&ecirc;n đ&acirc;y cũng l&agrave; mức dung lượng chấp nhận được khi cho ph&eacute;p người d&ugrave;ng sử dụng li&ecirc;n tục trong 4 giờ hoặc ở chế độ chờ trong hơn 8 ng&agrave;y.</p>\r\n<p>Hiện nay FPT B5 v&agrave; FPT B8 được b&aacute;n rộng r&atilde;i tại c&aacute;c cửa h&agrave;ng v&agrave; đại l&yacute; của FPT với mức gi&aacute; lần lượt l&agrave; 529.000 đồng v&agrave; 599.000 đồng (đ&atilde; bao gồm VAT). C&aacute;c m&aacute;y b&aacute;n ra đều nhận được chế độ bảo h&agrave;nh 13 th&aacute;ng từ FPT. Th&ocirc;ng tin chi tiết FPT B5 v&agrave; FPT B8 tham khảo tại website: <a href="http://www.fptproduct.com.vn/">http://www.fptproduct.com.vn/</a>.</p>\r\n<p style="text-align: right;"><strong>Minh Tr&iacute;</strong></p>\r\n</div>', '', NULL, 0, 2, '2342_1-1370166985_500x00.jpg', 4, '2013-06-03 16:19:47', '', 0),
(5, 'samsung-cho-dat-hang-tv-ultrahd-4k-gia-mem', 'vn', 'Samsung cho đặt hàng TV UltraHD 4K giá mềm', '', '<p>B&ecirc;n cạnh model 84 hay 85 inch với gi&aacute; v&agrave;i chục ngh&igrave;n USD đang c&oacute; tr&ecirc;n thị trường, Samsung bắt đầu cho người d&ugrave;ng đặt mua TV 4K k&iacute;ch thước 55 v&agrave; 65 inch với gi&aacute; chỉ từ 5.670 USD cho tới 7.900 USD.</p>', '', '<p class="dt-pts">B&ecirc;n cạnh model 84 hay 85 inch với gi&aacute; v&agrave;i chục ngh&igrave;n USD đang c&oacute; tr&ecirc;n thị trường, Samsung bắt đầu cho người d&ugrave;ng đặt mua TV 4K k&iacute;ch thước 55 v&agrave; 65 inch với gi&aacute; chỉ từ 5.670 USD cho tới 7.900 USD.</p>\r\n<ul class="new-relate">\r\n<li>TV 4K 85 inch của Samsung c&oacute; gi&aacute; gần 800 triệu đồng</li>\r\n<li>Samsung sẽ giới thiệu c&aacute;c model TV 4K k&iacute;ch thước nhỏ</li>\r\n</ul>\r\n<div id="article_content">\r\n<p class="Normal">Mức gi&aacute; từ 5.000 cho tới 8.000 của USD của hai mẫu TV UltraHD 4K Samsung vẫn c&ograve;n kh&aacute; cao so với c&aacute;c model Full HD đang c&oacute; tr&ecirc;n thị trường, nhưng so với c&aacute;c TV 4K đầu ti&ecirc;n c&oacute; mặt tr&ecirc;n thị trường với k&iacute;ch thước 84 hay 85 inch, th&igrave; đ&atilde; rẻ hơn kh&aacute; nhiều.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img style="width: 500px;" src="http://l.f5.img.vnexpress.net/2013/06/02/Samsung-TV-4K-1370138041_500x0.jpg" alt="Samsung-TV-4K-1370138041_500x0.jpg" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">TV 4K cho khả năng hiển thị sắc n&eacute;t gấp 4 lần TV Full HD c&ugrave;ng k&iacute;ch thước.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Khi cuối năm ngo&aacute;i ở Việt Nam, LG tung ra model 84LM9600 4K với gi&aacute; b&aacute;n hơn 300 triệu đồng ở Việt Nam (khoảng 15.000 USD), trong khi Sony c&ograve;n b&aacute;n ra model 84 inch tương tự với gi&aacute; l&ecirc;n tới hơn 800 triệu đồng (khoảng 40.000 USD). C&ograve;n mới đ&acirc;y, Samsung cũng tr&igrave;nh l&agrave;ng TV 4K đầu ti&ecirc;n của h&atilde;ng tại triển l&atilde;m CES 2013, model 85S9 85 inch, với gi&aacute; l&ecirc;n tới 38.000 USD.</p>\r\n<p class="Normal">2 mẫu TV 4K gi&aacute; mềm của Samsung c&oacute; k&iacute;ch thước chỉ 55 v&agrave; 65 inch. M&agrave;n h&igrave;nh vẫn sở hữu độ ph&acirc;n giải 4K (3.840 x 2.160 pixel), sắc n&eacute;t gấp 4 lần chuẩn Full HD c&ugrave;ng k&iacute;ch thước. Sản phẩm c&oacute; thiết kế tương đồng với d&ograve;ng TV Full HD F9000, kiểu d&aacute;ng si&ecirc;u mỏng với ch&acirc;n đế kim loại thanh mảnh. Ngo&agrave;i ra, c&aacute;c model n&agrave;y cũng được trang bị t&iacute;nh năng Smart TV với c&aacute;c t&iacute;nh năng tương t&aacute;c th&ocirc;ng minh thế hệ 2, c&oacute; webcam t&iacute;ch hợp v&agrave; hỗ trợ 3D.</p>\r\n<p class="Normal">Tuy nhi&ecirc;n, theo <em>Engadget</em>, Samsung mới chỉ cho ph&eacute;p người d&ugrave;ng tại H&agrave;n Quốc đặt mua hai mẫu TV 4K gi&aacute; mềm của h&atilde;ng từ th&aacute;ng 6. Trong khi tại c&aacute;c thị trường kh&aacute;c như Việt Nam, h&atilde;ng chưa đưa ra th&ocirc;ng b&aacute;o cụ thể.</p>\r\n<p class="Normal" style="text-align: right;"><strong>Mỹ Anh</strong></p>\r\n</div>', '', NULL, 0, 2, '32757_samsung-tv-4k-1370138041_500x00.jpg', 5, '2013-06-03 16:24:23', '', 0),
(6, 'pin-blackberry-q10-cho-thoi-gian-dam-thoai-gap-doi-z10', 'vn', 'Pin BlackBerry Q10 cho thời gian đàm thoại gấp đôi Z10', '', '<p>M&agrave;n h&igrave;nh nhỏ hơn, pin dung lượng lớn hơn khiến cho Q10 cho ph&eacute;p đ&agrave;m loại li&ecirc;n tục tới 20 giờ tr&ecirc;n mạng 3G, trong khi thử nghiệm tương tự với Z10 chỉ được 8 giờ 20 ph&uacute;t.</p>', '', '<p class="dt-pts">M&agrave;n h&igrave;nh nhỏ hơn, pin dung lượng lớn hơn khiến cho Q10 cho ph&eacute;p đ&agrave;m loại li&ecirc;n tục tới 20 giờ tr&ecirc;n mạng 3G, trong khi thử nghiệm tương tự với Z10 chỉ được 8 giờ 20 ph&uacute;t.</p>\r\n<ul class="new-relate">\r\n<li>Đ&aacute;nh gi&aacute; BlackBerry Z10</li>\r\n<li>BlackBerry Q10 trắng về VN với gi&aacute; 17 triệu đồng</li>\r\n</ul>\r\n<div id="article_content">\r\n<p class="Normal">Q10 v&agrave; Z10 l&agrave; hai chiếc smartphone đầu ti&ecirc;n sử dụng hệ điều h&agrave;nh BlackBerry 10 (BB10) của BlackBerry. Trong khi "đ&agrave;n anh" Z10 l&agrave; model cảm ứng ho&agrave;n to&agrave;n th&igrave; Q10 lại mang kiểu d&aacute;ng truyền thống với b&agrave;n ph&iacute;m QWERTY đầy đủ, kết hợp c&ugrave;ng m&agrave;n h&igrave;nh cảm ứng nhỏ gọn hơn.</p>\r\n<p class="Normal">C&ugrave;ng cấu h&igrave;nh nhưng với pin dung lượng 2.100 mAh, cao hơn 300 mAh so với BlackBerry Z10, những đ&aacute;nh gi&aacute; thực tế của <em>GSM Arena</em> về thời gian sử dụng pin cho thấy Q10 tốt hơn model tiền nhiệm về nhiều mặt.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/Screen-Shot-2013-06-1370136820_500x0.jpg" alt="Screen-Shot-2013-06-1370136820_500x0.jpg" width="500" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Trong b&agrave;i đ&aacute;nh gi&aacute; đầu ti&ecirc;n về thời gian đ&agrave;m thoại khi sử dụng mạng 3G. Q10 cho thời gian sử dụng li&ecirc;n tục tới 20 tiếng sau mỗi lần pin được sạc đầy. Kết quả đứng h&agrave;ng top v&agrave; gần tương đương với chiếc smartphone pin "khủng" nhất hiện nay l&agrave; Razr Maxx của Motorola. Trong khi đ&oacute;, đ&agrave;n anh Z10 chỉ đạt hơn 8 giờ sử dụng trong b&agrave;i đ&aacute;nh gi&aacute; n&agrave;y.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/Screen-Shot-2013-06-1370136820_500x0.jpg" alt="Screen-Shot-2013-06-1370136820_500x0.jpg" width="500" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Ở b&agrave;i đ&aacute;nh gi&aacute; thứ hai về thời lượng sử dụng khi lướt web, Q10 cũng g&acirc;y ấn tượng mạnh khi kết quả xếp trong nh&oacute;m dẫn đầu, chịu thua iPhone 5 v&agrave; HTC One. Điểm đ&aacute;ng ch&uacute; &yacute; l&agrave; tr&igrave;nh duyệt tr&ecirc;n Q10 hỗ trợ đầy đủ cả Flash lẫn HTML5.</p>\r\n<p class="Normal">So với Z10, thời lượng pin sử dụng Wi-Fi để lướt web của Q10 nhiều hơn tới 30%. Chiếc BlackBerry 10 b&agrave;n ph&iacute;m QWERTY cho thời gian sử dụng li&ecirc;n tục trong 8 giờ 42 ph&uacute;t c&ograve;n Z10 chỉ đạt 6 giờ 27 ph&uacute;t.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/Screen-Shot-2013-06-1370136820_500x0.jpg" alt="Screen-Shot-2013-06-1370136820_500x0.jpg" width="500" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Với m&agrave;n h&igrave;nh nhỏ nhắn 3,1 inch, chiếc smartphone BlackBerry kh&ocirc;ng phải l&agrave; model th&iacute;ch hợp để tr&igrave;nh diễn phim ảnh. Tuy nhi&ecirc;n, Q10 lại cho ph&eacute;p người d&ugrave;ng c&oacute; thể thưởng thức thoải m&aacute;i từ 3 đến 4 phim li&ecirc;n tục khi cần. Sau mỗi lần sạc đầy, m&aacute;y c&oacute; thể tr&igrave;nh diễn phim li&ecirc;n tục trong hơn 11 giờ, thời gian sử dụng tốt hơn cả iPhone 5 lẫn HTC One.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/Screen-Shot-2013-06-1370136821_500x0.jpg" alt="Screen-Shot-2013-06-1370136821_500x0.jpg" width="500" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Kh&ocirc;ng chỉ, thắng thế so với BlackBerry Z10 trong cả ba b&agrave;i đ&aacute;nh gi&aacute; cụ thể, Q10 c&ograve;n c&oacute; pin tốt hơn đ&agrave;n anh khi đ&aacute;nh gi&aacute; tổng thể.</p>\r\n<p class="Normal">Nếu sử dụng lần lượt 3 t&aacute;c vụ tr&ecirc;n mỗi tiếng một ng&agrave;y th&igrave; pin BlackBerry Q10 cho ph&eacute;p hoạt động li&ecirc;n tục trong v&ograve;ng 56 giờ, gần 2 ng&agrave;y rưỡi. Trong khi đ&oacute;, thời gian sử dụng của Z10 l&agrave; 46 tiếng, chưa đến 2 ng&agrave;y theo những đ&aacute;nh gi&aacute; tương tự từ <em>GSM Arena</em>.</p>\r\n<p class="Normal" style="text-align: right;"><strong>Mỹ Anh</strong></p>\r\n</div>', '', NULL, 0, 2, '10599_screen-shot-2013-06-1370136821_500x00.jpg', 6, '2014-10-31 16:07:22', '', 0),
(7, 'htc-one-nang-cap-len-android-422-voi-nhieu-thay-doi', 'vn', 'HTC One nâng cấp lên Android 4.2.2 với nhiều thay đổi', '', '<p>Chiếc smartphone Full HD cao cấp nhất của HTC chuẩn bị cập nhật phần mềm từ hệ điều h&agrave;nh Android 4.1.2 hiện tại l&ecirc;n 4.2.2, bản Android mới nhất giống như tr&ecirc;n Galaxy S4 v&agrave; Nexus 4.</p>', '', '<p class="dt-pts">Chiếc smartphone Full HD cao cấp nhất của HTC chuẩn bị cập nhật phần mềm từ hệ điều h&agrave;nh Android 4.1.2 hiện tại l&ecirc;n 4.2.2, bản Android mới nhất giống như tr&ecirc;n Galaxy S4 v&agrave; Nexus 4.</p>\r\n<ul class="new-relate">\r\n<li>Đ&aacute;nh gi&aacute; HTC One, smartphone được chờ đợi nhất hiện nay</li>\r\n</ul>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/HTC-One-4-1370134381_500x0.jpg" alt="HTC-One-4-1370134381_500x0.jpg" width="500" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">HTC One hiện tại đang chạy Android 4.1.2, chưa phải Android 4.2.2 giống đối thủ Galaxy S4. Ảnh: <em>Tuấn Anh.</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Hiện tại, h&atilde;ng Đ&agrave;i Loan chưa đưa ra lịch tr&igrave;nh cập nhật cụ thể Android 4.2.2 cho HTC One. Tuy nhi&ecirc;n, c&aacute;c thay đổi đ&aacute;ng ch&uacute; &yacute; về phần mềm trong bản cập nhật phần mềm đ&atilde; được <em>Android Revolution</em> chỉ ra.</p>\r\n<p class="Normal">Theo đ&oacute;, HTC One sẽ c&oacute; những cải tiến về giao diện, bổ sung c&aacute;c n&uacute;t c&agrave;i đặt nhanh ở thanh th&ocirc;ng b&aacute;o, cho ph&eacute;p giữ ph&iacute;m Home tương đương với việc bấm Menu - loại ph&iacute;m ảo trong m&agrave;n h&igrave;nh, hay bỏ thanh ứng dụng thường d&ugrave;ng khi truy cập v&agrave;o phần quản l&yacute; ứng dụng (App Drawer), th&ecirc;m hiển thị % pin... Ngo&agrave;i ra, một số t&iacute;nh năng mới tr&ecirc;n Android 4.2.2 như Day Dream, chế độ sử dụng đa t&agrave;i khoản, cải thiện năng lượng... cũng sẽ được đem l&ecirc;n HTC One.</p>\r\n<p class="Normal"><em>Một số thay đổi tr&ecirc;n HTC One với Android 4.2.2 mới:</em></p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/HTC-One-1-1370134381_500x0.jpg" alt="HTC-One-1-1370134381_500x0.jpg" width="500" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Pin c&oacute; thể hiển thị dung lượng bằng %.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/HTC-One-2-1370134381_500x0.jpg" alt="HTC-One-2-1370134381_500x0.jpg" width="270" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Thanh Notification với c&aacute;c n&uacute;t bấm c&agrave;i đặt nhanh.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/HTC-One-3-1370134382_500x0.jpg" alt="HTC-One-3-1370134382_500x0.jpg" width="500" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Chế độ m&agrave;n h&igrave;nh chờ Day Dream của Android 4.2.2 Jelly Bean.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/HTC-One-5-1370134382_500x0.jpg" alt="HTC-One-5-1370134382_500x0.jpg" width="270" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Ph&iacute;m Menu/Settings kh&ocirc;ng c&ograve;n xuất hiện tr&ecirc;n m&agrave;n h&igrave;nh, thay v&agrave;o đ&oacute; c&oacute; thể sử dụng ph&iacute;m Home để k&iacute;ch hoạt.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/02/HTC-One-6-1370134382_500x0.png" alt="[Caption]" width="262" height="466" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Thay ứng dụng thường d&ugrave;ng được loại bỏ gi&uacute;p giao diện tr&ocirc;ng tho&aacute;ng hơn. Ngo&agrave;i ra,HTC sẽ c&ograve;n c&oacute; th&ecirc;m nhiều cập nhật mới kh&aacute;c.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal" style="text-align: right;"><strong>Tuấn Anh</strong><br /> Ảnh: <em>Android Revolution</em></p>', '', NULL, 0, 2, '13076_htc-one-4-1370134381_500x00.jpg', 7, '2013-06-03 16:26:34', '', 0),
(8, 'nokia-lumia-1030-man-hinh-6-inch-lo-dien', 'vn', 'Nokia Lumia 1030 màn hình 6 inch lộ diện', '', '<p>Chiếc Windows Phone m&agrave;n h&igrave;nh cỡ bự của Nokia xuất hiện b&ecirc;n cạnh HTC One Mini c&ugrave;ng một điện thoại Full HD 6,5 inch kh&aacute;c được cho l&agrave; Sony Xperia L4.</p>', '', '<p class="dt-pts">Chiếc Windows Phone m&agrave;n h&igrave;nh cỡ bự của Nokia xuất hiện b&ecirc;n cạnh HTC One Mini c&ugrave;ng một điện thoại Full HD 6,5 inch kh&aacute;c được cho l&agrave; Sony Xperia L4.</p>\r\n<div id="article_content">\r\n<p class="Normal">Trang c&ocirc;ng nghệ <em>Test-mobile</em> g&acirc;y x&ocirc;n xao khi vừa tung l&ecirc;n một bức ảnh thực tế với sự g&oacute;p mặt của h&agrave;ng loạt "si&ecirc;u phẩm" chưa từng được Nokia, Sony hay HTC c&ocirc;ng bố, nhưng đ&atilde; c&oacute; nhiều tin đồn li&ecirc;n quan. Bức h&igrave;nh được cung cấp tr&ocirc;ng giống như được chụp từ b&agrave;n l&agrave;m việc với nhiều sản phẩm mẫu, dạng thử nghiệm xuất hiện tr&ecirc;n b&agrave;n.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img style="width: 380px; height: 615px;" src="http://l.f5.img.vnexpress.net/2013/06/01/nokia-1030-leak-hum-1370051655_500x0.jpg" alt="[Caption]" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Trong đ&oacute;, một chiếc điện thoại Lumia m&agrave;n h&igrave;nh rộng của Nokia xuất hiện ở ph&iacute;a xa, với vỏ m&agrave;u xanh quen thuộc giống Lumia 900 v&agrave; 800. Theo <em>Test-mobile</em>, đ&acirc;y ch&iacute;nh l&agrave; Lumia 1030, chiếc Phablet Nokia đang ph&aacute;t triển v&agrave; c&oacute; thể tung ra trong năm nay. Sản phẩm cho thấy c&oacute; m&agrave;n h&igrave;nh kh&aacute; rộng với giao diện Live Tiles gồm tới 3 cột biểu tượng cỡ vừa, nhiều hơn giao diện thường thấy tr&ecirc;n c&aacute;c Windows Phone hiện nay.</p>\r\n<p class="Normal">B&ecirc;n cạnh chiếc Phablet của Nokia, trong ảnh c&ograve;n xuất hiện một chiếc smartphone được cho l&agrave; HTC One Mini (M4), c&oacute; kiểu d&aacute;ng giống HTC One nhưng nhỏ gọn hơn.</p>\r\n<table class="tplCaption" width="1" border="0" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://l.f5.img.vnexpress.net/2013/06/01/Sony-Togari-1370052655_500x0.jpg" alt="Sony-Togari-1370052655_500x0.jpg" width="500" /></td>\r\n</tr>\r\n<tr>\r\n<td class="Image">Chiếc smartphone lạ của Sony được cho l&agrave; Xperia Togari.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class="Normal">Tuy vậy, sản phẩm g&acirc;y ch&uacute; &yacute; v&agrave; gần ống k&iacute;nh nhất l&agrave; Xperia L4 của Sony. Đ&acirc;y được cho l&agrave; smartphone m&agrave;n h&igrave;nh Full HD 6,5 inch mang t&ecirc;n m&atilde; Togari đang được h&atilde;ng điện thoại của Nhật ph&aacute;t triển.</p>\r\n<p class="Normal">C&aacute;c tin tức trước đ&oacute; cho rằng Xperia Togari sẽ xuất hiện v&agrave;o nửa cuối năm nay, chạy Android 4.3 hoặc 5.0 với chip 4 nh&acirc;n Snapdragon 800 của Qualcomm.</p>\r\n<p class="Normal" style="text-align: right;"><strong>Mỹ Anh</strong></p>\r\n</div>', '', NULL, 0, 2, '20073_sony-togari-1370052655_500x00.jpg', 8, '2013-06-03 16:27:55', '', 0),
(9, 'ten-tieng-viet', 'vn', 'ten tieng viet', 'ten tieng anh', '<p>tom tat tieng viet</p>', '<p>tom tat tieng anh</p>', '<p>chi tiet tieng viet</p>', '<p>chi tiet tieng anh</p>', NULL, 1, 2, '13580_abtl-new-logoo.JPG', 1, '2014-08-13 04:13:17', '', 0),
(10, 'huong-dan-su-dung-va-bao-tri-may-chieu', 'vn', 'HƯỚNG DẪN SỬ DỤNG VÀ BẢO TRÌ MÁY CHIẾU', '', '', '', '<p><span style="font-size: 14px;">1. Hướng dẫn sử dụng:</span></p>\r\n<p><span style="font-size: 14px;">&nbsp; &nbsp;1.1 Ph&iacute;ch cắm d&acirc;y nguồn v&agrave; lỗ cắm điện phải vừa vặn</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;1.2.Cắm đ&uacute;ng v&agrave; kh&iacute;t d&acirc;y kết nối (VGA) giữa m&aacute;y t&iacute;nh v&agrave; m&aacute;y chiếu. Khi cắm, qu&yacute; kh&aacute;ch cầm phần đầu cắm đẩy mạnh v&agrave;o khe cắm. Khi th&aacute;o, qu&yacute; kh&aacute;ch kh&ocirc;ng cầm phần d&acirc;y m&agrave; cầm phần đầu cắm để k&eacute;o ra, kh&ocirc;ng bẻ l&ecirc;n bẻ xuống phần d&acirc;y cắm. Vặn v&iacute;t cố định đầu cắm v&agrave; m&aacute;y.&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;1.3 Mở nắp che đ&egrave;n chiếu (nếu c&oacute;)&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;1.4 Kh&ocirc;ng d&ugrave;ng tay hay bất cứ vật g&igrave; cọ s&aacute;t l&ecirc;n đ&egrave;n chiếu.&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;1.5 Khởi động m&aacute;y chiếu bằng c&aacute;ch bật c&ocirc;ng tắc nguồn ph&iacute;a sau (nếu c&oacute;) sau đ&oacute; nhấn n&uacute;t POWER (1 lần). Trong trường hợp m&aacute;y chiếu vừa tắt, để mở lại qu&yacute; kh&aacute;ch vui l&ograve;ng chờ cho quạt trong m&aacute;y ngừng quay.&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;1.6 Khi m&aacute;y t&iacute;nh v&agrave; m&aacute;y chiếu đ&atilde; kết nối v&agrave; khởi động xong, nếu t&iacute;n hiệu vẫn chưa xuất ra qu&yacute; kh&aacute;ch cần lưu &yacute; c&aacute;c điểm sau:&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp; 1.6.1 M&aacute;y chiếu: Chọn đ&uacute;ng cổng suất t&iacute;n hiệu (một số d&ograve;ng AUTO)&nbsp;</span><br /><span style="font-size: 14px;">- TOSHIBA, SONY: Nhấn INPUT&nbsp;</span><br /><span style="font-size: 14px;">- NEC, ACER, OPTOMA: Nhấn SOURCE&nbsp;</span><br /><span style="font-size: 14px;">- PANASONIC: Nhấn INPUT SELECT&nbsp;</span><br /><span style="font-size: 14px;">1.6.2.M&aacute;y t&iacute;nh x&aacute;ch tay: Mở cổng t&iacute;n hiệu&nbsp;</span><br /><span style="font-size: 14px;">- TOSHIBA, HP, SHARP: Fn + F5&nbsp;</span><br /><span style="font-size: 14px;">- SONY, IBM: Fn + F7&nbsp;</span><br /><span style="font-size: 14px;">- PANASONIC, NEC: Fn + F3&nbsp;</span><br /><span style="font-size: 14px;">- DELL, EPSON: Fn + F8&nbsp;</span><br /><span style="font-size: 14px;">- FUJUTSU: Fn + F10&nbsp;</span><br /><span style="font-size: 14px;">- Hoặc nhấn : Fn + Ph&iacute;m c&oacute; biểu tượng m&agrave;n h&igrave;nh&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;1.7 Điều chỉnh ZOOM để ph&oacute;ng to, thu nhỏ k&iacute;ch thước h&igrave;nh chiếu&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;1.8 Điều chỉnh FOCUS để chỉnh độ n&eacute;t h&igrave;nh (Một số d&ograve;ng AUTO FOCUS)&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;1.9 Đặt m&aacute;y chiếu theo hướng chiếu vu&ocirc;ng g&oacute;c với m&agrave;n chiếu (tường). Nếu h&igrave;nh chiếu l&ecirc;n m&agrave;n (tường) c&oacute; h&igrave;nh thang, qu&yacute; kh&aacute;ch chỉnh tăng giảm KEYSTONE (một số d&ograve;ng AUTO SETUP, hoặc AUTO KEYSTONE)&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;1.10 Tắt m&aacute;y chiếu bằng c&aacute;ch nhấn n&uacute;t POWER (2 lần). Qu&yacute; kh&aacute;ch chờ cho quạt của m&aacute;y chiếu ngưng hẳn mới r&uacute;t d&acirc;y điện khỏi nguồn an to&agrave;n (tr&aacute;nh nguy cơ hư hỏng v&agrave; giảm tuổi thọ đ&egrave;n chiếu)&nbsp;</span><br /><span style="font-size: 14px;">2.Y&ecirc;u cầu kỹ thuật:&nbsp;</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;2.1 Nguồn điện:</span><br /><span style="font-size: 14px;">M&aacute;y chiếu c&oacute; khả năng hoạt động tốt v&agrave; ổn định ở điện &aacute;p 100 &ndash; 240V AC @ 1.5V, nhưng rất nhạy cảm với c&aacute;c đột biến hay dao động điện &aacute;p. Đ&acirc;y thường l&agrave; nguy&ecirc;n nh&acirc;n ch&iacute;nh dẫn đến hư hỏng cho Board nguồn, B&oacute;ng đ&egrave;n, v&agrave; Ballast unit.</span><br /><span style="font-size: 14px;">Qu&yacute; kh&aacute;ch kh&ocirc;ng tắt điện đột ngột, điều n&agrave;y khiến cho b&oacute;ng đ&egrave;n chiếu b&ecirc;n trong sẽ bị giảm tuổi thọ, cần thực hiện tắt mở m&aacute;y theo đ&uacute;ng qui tr&igrave;nh của h&atilde;ng đưa ra (S&aacute;ch hướng dẫn sử dụng k&egrave;m theo m&aacute;y). Qu&yacute; kh&aacute;ch c&oacute; thể trang bị nguồn UPS cho m&aacute;y chiếu.</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;2.2 M&ocirc;i trường hoạt động:&nbsp;</span><br /><span style="font-size: 14px;">Khi m&aacute;y hoạt động sẽ tỏa ra lượng nhiệt l&agrave;m m&aacute;t b&ecirc;n trong m&aacute;y, n&ecirc;n sử dụng m&aacute;y trong m&ocirc;i trường tho&aacute;ng m&aacute;t (25oC &ndash; 28oC) kh&ocirc;ng kh&oacute;i thuốc, bụi v&agrave; c&ocirc;n tr&ugrave;ng&hellip; (Tr&aacute;nh được t&igrave;nh trạng m&aacute;y trong l&uacute;c hoạt động thường bị tắt ngang, khởi động lại,&hellip;)</span><br /><span style="font-size: 14px;">Qu&yacute; kh&aacute;c tr&aacute;nh đặt c&aacute;c vật cản hoặc quạt gi&oacute; tại c&aacute;c ng&otilde; tho&aacute;t nhiệt của m&aacute;y (B&oacute;ng đ&egrave;n chiếu, quạt h&uacute;t giải nhiệt)</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;2.3.Kiểm tra m&aacute;y v&agrave; c&aacute;c chức năng hoạt động của m&aacute;y:&nbsp;</span><br /><span style="font-size: 14px;">Mỗi d&ograve;ng m&aacute;y đều c&oacute; nhiều ph&iacute;m bấm với c&aacute;c t&iacute;nh năng l&agrave;m h&igrave;nh ảnh r&otilde; n&eacute;t v&agrave; trung thực về m&agrave;u sắc ứng với nhu cầu sử dụng (Gi&aacute;o dục, giải tr&iacute;,&hellip;). Kiểm tra ph&iacute;m nhấn v&agrave; độ nhạy của ph&iacute;m cũng như remote, khoảng c&aacute;ch sử dụng remote, khả năng tr&igrave;nh chiếu h&igrave;nh ảnh của m&aacute;y chiếu ở mỗi chế độ ph&acirc;n giải kh&aacute;c nhau của m&aacute;y t&iacute;nh.</span><br /><span style="font-size: 14px;">Xem hướng dẫn sử dụng m&aacute;y để thao t&aacute;c điều chỉnh ch&iacute;nh x&aacute;c</span><br /><span style="font-size: 14px;">Th&ocirc;ng thường c&aacute;c linh kiện đi k&egrave;m theo m&aacute;y gồm c&oacute;: D&acirc;y nguồn, D&acirc;y t&iacute;n hiệu VGA, Remote Control, Pin remote v&agrave; s&aacute;ch hướng dẫn đi k&egrave;m.</span><br /><span style="font-size: 14px;">&nbsp; &nbsp;2.4.Bảo tr&igrave; vệ sinh m&aacute;y:&nbsp;</span><br /><span style="font-size: 14px;">Sau khoảng 5 lần sử dụng m&aacute;y, lấy c&aacute;c tấm lọc bụi (Filter) thường nằm b&ecirc;n h&ocirc;ng m&aacute;y ra d&ugrave;ng cọ mềm qu&eacute;t nhẹ để l&agrave;m sạch c&aacute;c tấm lọc n&agrave;y (bảo đảm được h&igrave;nh ảnh v&agrave; m&agrave;u sắc của h&igrave;nh chiếu, tăng tuổi thọ b&oacute;ng đ&egrave;n).</span><br /><span style="font-size: 14px;">Khi h&igrave;nh ảnh v&agrave; m&agrave;u sắc h&igrave;nh chiếu c&oacute; sự thay đổi r&otilde; rệt (Kh&ocirc;ng xuất h&igrave;nh hay cho h&igrave;nh trắng đen, c&oacute; c&aacute;c đốm m&agrave;u xuất hiện,&hellip;) nguy&ecirc;n nh&acirc;n l&agrave; do bụi b&aacute;m v&agrave;o c&aacute;c gương, k&iacute;nh lọc, k&iacute;nh ph&acirc;n cực,&hellip; hay ch&iacute;nh c&aacute;c bộ phận CCD b&ecirc;n trong m&aacute;y.&nbsp;</span></p>\r\n<p><span style="font-size: 14px;">Qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ với ch&uacute;ng t&ocirc;i để được bảo tr&igrave; v&agrave; sửa chữa hoặc hướng dẫn, tư vấn cụ thể.</span></p>\r\n<p><span style="font-size: 14px;">&nbsp;</span></p>', '', NULL, 0, 2, '1569762325_255.png', 1, '2014-10-31 16:07:05', '', 0);
INSERT INTO `n_news` (`id`, `slug`, `lang`, `vn_name`, `en_name`, `vn_sapo`, `en_sapo`, `vn_details`, `en_details`, `popup`, `home`, `cid`, `avatar`, `position`, `date_created`, `keywords`, `status`) VALUES
(11, 'nhung-dieu-can-biet-khi-chon-mua-may-chieu', 'vn', 'NHỮNG ĐIỀU CẦN BIẾT KHI CHỌN MUA MÁY CHIẾU', '', '<p><span style="font-family: times new roman,times; font-size: 16px;">Đối với những người c&oacute; nhu cầu trang bị hệ thống giải tr&iacute; gia đ&igrave;nh, việc chọn mua m&aacute;y chiếu kh&ocirc;ng dễ khi ch&uacute;ng li&ecirc;n tục lỗi mốt.</span></p>\r\n<p><span style="font-family: times new roman,times; font-size: 16px;">Sở dĩ n&oacute;i kh&oacute; mua l&agrave; bởi, tuy c&oacute; rất nhiều d&ograve;ng m&aacute;y chiếu tr&ecirc;n thị trường, nhưng người mua cần c&oacute; một số hiểu biết nhất định về loại sản phẩm n&agrave;y mới c&oacute; thể chọn được loại m&aacute;y đ&aacute;p ứng đ&uacute;ng chất lượng, gi&aacute; cả v&agrave; y&ecirc;u cầu sử dụng.</span></p>', '', '<p><span style="font-size: 16px; font-family: times new roman,times;">Đối với những người c&oacute; nhu cầu trang bị hệ thống giải tr&iacute; gia đ&igrave;nh, việc chọn mua m&aacute;y chiếu kh&ocirc;ng dễ khi ch&uacute;ng li&ecirc;n tục lỗi mốt.<br /><br /><strong>Cần một số hiểu biết nhất định</strong><br /><br />Sở dĩ n&oacute;i kh&oacute; mua l&agrave; bởi, tuy c&oacute; rất nhiều d&ograve;ng m&aacute;y chiếu tr&ecirc;n thị trường, nhưng người mua cần c&oacute; một số hiểu biết nhất định về loại sản phẩm n&agrave;y mới c&oacute; thể chọn được loại m&aacute;y đ&aacute;p ứng đ&uacute;ng chất lượng, gi&aacute; cả v&agrave; y&ecirc;u cầu sử dụng.<br /><br />Mặc d&ugrave; gi&aacute; th&agrave;nh m&aacute;y chiếu li&ecirc;n tục giảm, nhưng hiện nay mức trung b&igrave;nh vẫn được t&iacute;nh bằng đơn vị chục triệu đồng, do vậy bạn cần c&acirc;n nhắc xem loại sản phẩm n&agrave;y c&oacute; thực sự th&iacute;ch hợp với m&igrave;nh, đặc biệt l&agrave; khi đặc th&ugrave; của n&oacute; c&oacute; một số hạn chế nhất định. Chẳng hạn, tỉ lệ tương phản của m&aacute;y chiếu kh&ocirc;ng được xuất sắc. Đ&acirc;y l&agrave; tỉ lệ giữa m&agrave;u đen nhất v&agrave; m&agrave;u trắng nhất c&oacute; thể được thể hiện. Khả năng thể hiện độ đen c&agrave;ng lớn th&igrave; tỉ lệ n&agrave;y c&agrave;ng lớn, m&agrave; đối với một thiết bị hoạt động bằng cơ chế chiếu s&aacute;ng th&igrave; mức độ đen "kịt" hầu như l&agrave; "bất khả thi".<br /><br />R&otilde; r&agrave;ng l&agrave; tỉ lệ tương phản 3000:1 th&igrave; tốt hơn 1000:1, nhưng chớ n&ecirc;n tin v&agrave;o tỉ lệ do nh&agrave; sản xuất quảng c&aacute;o. Đ&acirc;y chỉ l&agrave; tỉ lệ l&yacute; thuyết, được lấy từ mẫu tốt nhất m&agrave; họ c&oacute; được của một loại sản phẩm, do đ&oacute; một m&aacute;y chiếu c&oacute; tỉ lệ tương phản l&yacute; thuyết cao hơn chưa chắc đ&atilde; thực sự cho h&igrave;nh ảnh sắc n&eacute;t hơn một m&aacute;y chiếu c&oacute; tỉ lệ n&agrave;y thấp hơn. C&aacute;ch tốt nhất l&agrave; bạn phải lựa chọn thật kỹ bằng mắt m&igrave;nh.<br /><br />Một vấn đề đặc th&ugrave; nữa của m&aacute;y chiếu l&agrave; "hiệu ứng cửa ra m&agrave;n h&igrave;nh" (screen-door effect). H&atilde;y thử nh&igrave;n kỹ v&agrave;o phần trắng hoặc s&aacute;ng m&agrave;u của h&igrave;nh ảnh được chiếu l&ecirc;n, đối với một số m&aacute;y chiếu bạn c&oacute; thể thấy một đường ch&eacute;o rất mờ ở khu vực n&agrave;y. Mặc d&ugrave; trong phần lớn c&aacute;c trường hợp, đường ch&eacute;o n&agrave;y kh&ocirc;ng r&otilde; lắm v&agrave; bạn chỉ nh&igrave;n thấy khi nh&igrave;n thật gần, nhưng bạn vẫn cần thận trọng kẻo mua phải m&aacute;y chiếu c&oacute; đường ch&eacute;o n&agrave;y r&otilde; tới mức bạn nh&igrave;n thấy n&oacute; ngay cả từ khoảng c&aacute;ch xem b&igrave;nh thường. Vấn đề n&agrave;y thường xảy ra ở loại m&aacute;y chiếu DLP r&otilde; r&agrave;ng hơn so với ở m&aacute;y LCD.<br /><br /><strong>Ống k&iacute;nh v&agrave; m&agrave;n h&igrave;nh</strong><strong><br /></strong><br />M&aacute;y chiếu c&oacute; c&aacute;c loại ống k&iacute;nh kh&aacute;c nhau, do đ&oacute; bạn cần chọn loại m&aacute;y c&oacute; ống k&iacute;nh chiếu được k&iacute;ch cỡ h&igrave;nh ảnh ph&ugrave; hợp từ một khoảng c&aacute;ch ph&ugrave; hợp với diện t&iacute;ch căn ph&ograve;ng m&agrave; bạn định sử dụng. B&ecirc;n cạnh đ&oacute;, chỉ số b&ugrave; g&oacute;c vu&ocirc;ng của m&aacute;y cũng kh&aacute; quan trọng bởi ch&uacute;ng quyết định t&iacute;nh linh hoạt trong việc bố tr&iacute; m&aacute;y. Số g&oacute;c c&oacute; thể b&ugrave; c&agrave;ng lớn, bạn c&agrave;ng c&oacute; thể đặt m&aacute;y chiếu lệch hơn so với điểm ch&iacute;nh giữa nhiều hơn m&agrave; vẫn đạt được h&igrave;nh ảnh vu&ocirc;ng vắn, trung thực.<br /><br />Bạn cần nhớ rằng khi d&ugrave;ng m&aacute;y chiếu, bạn sẽ phải thay b&oacute;ng đ&egrave;n, thường l&agrave; sau khoảng 2.000 - 3.000 giờ sử dụng, tức l&agrave; trung b&igrave;nh khoảng 2 - 3 năm. Do đ&oacute;, gi&aacute; cả của b&oacute;ng đ&egrave;n cũng l&agrave; một yếu tố cần c&acirc;n nhắc trước khi chọn m&aacute;y, bởi n&oacute; sẽ l&agrave;m phụ trội tổng chi ph&iacute; cho m&aacute;y. B&oacute;ng đ&egrave;n thường c&oacute; gi&aacute; v&agrave;i triệu đồng, nhưng cũng c&oacute; loại l&ecirc;n tới hơn chục triệu đồng. Một số loại phải nhờ tới b&agrave;n thay chuy&ecirc;n nghiệp mới thay được, trong khi một số loại m&aacute;y chiếu mới cho ph&eacute;p người d&ugrave;ng tự thay b&oacute;ng đ&egrave;n. Một số m&aacute;y chiếu c&oacute; chế độ chạy tiết kiệm, cho ph&eacute;p k&eacute;o d&agrave;i tuổi thọ b&oacute;ng đ&egrave;n, nhưng chế độ n&agrave;y sẽ l&agrave;m giảm độ s&aacute;ng của h&igrave;nh ảnh.</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;"><strong>3. C&aacute;ch chọn m&aacute;y chiếu tại gia đ&igrave;nh</strong></span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;">M&aacute;y chiếu (projector) được l&ograve;ng d&acirc;n m&ecirc; điện ảnh v&igrave; dễ bố tr&iacute; v&agrave; cho h&igrave;nh ảnh lớn, đẹp. Tuy nhi&ecirc;n, c&aacute;ch sử dụng v&agrave; bảo quản đồ vật h&agrave;ng ngh&igrave;n USD n&agrave;y cũng rắc rối hơn TV đ&ocirc;i ch&uacute;t.<br /><br />&ldquo;Ngay cả m&aacute;y chiếu h&agrave;ng ngh&igrave;n USD, nếu kh&ocirc;ng được c&agrave;i đặt tốt th&igrave; chất lượng h&igrave;nh ảnh cũng kh&ocirc;ng như &yacute; muốn&rdquo;, &ocirc;ng Nguyễn Tuấn Th&agrave;nh, Trưởng ph&ograve;ng Kỹ thuật c&ocirc;ng ty DigiWorld, đơn vị ph&acirc;n phối độc quyền m&aacute;y chiếu Infocus tại Việt Nam, khẳng định.&nbsp;<br /><br />Đa phần những người đam m&ecirc; nghệ thuật thứ bảy đều c&ocirc;ng nhận projector l&agrave; đối thủ đ&aacute;ng gờm nhất của d&ograve;ng TV cỡ lớn hiện nay. Ưu thế của thiết bị thu h&igrave;nh truyền thống nổi bật nhất ở điểm dễ sử dụng v&agrave; lắp đặt. Nhưng m&aacute;y chiếu, ngo&agrave;i k&iacute;ch thước h&igrave;nh ảnh lớn hơn, c&ograve;n c&oacute; ưu thế về gi&aacute;, chất lượng h&igrave;nh ảnh v&agrave; khả năng bố tr&iacute;. So s&aacute;nh c&aacute;c chỉ số kỹ thuật, m&aacute;y chiếu ấn tượng hơn m&agrave;n h&igrave;nh LCD hoặc plasma c&oacute; c&ugrave;ng gi&aacute; tiền cả về độ ph&acirc;n giải, độ s&aacute;ng v&agrave; tương phản. Nhưng sản phẩm &ldquo;xuất th&acirc;n&rdquo; từ ph&ograve;ng họp của c&aacute;c c&ocirc;ng ty lớn n&agrave;y cũng kh&oacute; t&iacute;nh hơn c&aacute;c anh em kh&aacute;c trong d&ograve;ng thiết bị nghe nh&igrave;n v&agrave; đ&ograve;i hỏi sự quan t&acirc;m đặc biệt.&nbsp;<br /><br /><strong>Lựa chọn c&ocirc;ng nghệ: LCD v&agrave; DLP</strong>&nbsp;<br /><br />&ldquo;Hiện tại, một số projector thuộc d&ograve;ng phổ th&ocirc;ng cũng c&oacute; c&ocirc;ng nghệ xử l&yacute; &aacute;nh s&aacute;ng số DLP vốn chỉ c&oacute; trong những d&ograve;ng m&aacute;y chuy&ecirc;n dụng cỡ lớn ở rạp chiếu phim&rdquo;, &ocirc;ng Th&agrave;nh n&oacute;i.&nbsp;<br />Trong c&ocirc;ng nghệ LCD (liquid crystal display &ndash; m&agrave;n h&igrave;nh tinh thể lỏng) trước đ&acirc;y, m&aacute;y chiếu tổng hợp h&igrave;nh ảnh m&agrave;u dựa tr&ecirc;n 3 m&agrave;u cơ bản l&agrave; đỏ, lục v&agrave; xanh dương (RGB). Nguồn s&aacute;ng trắng ban đầu được t&aacute;ch th&agrave;nh 3 nguồn s&aacute;ng đơn sắc l&agrave; đỏ, lục, xanh dương v&agrave; được dẫn đến 3 tấm LCD độc lập. Nếu điểm ảnh tr&ecirc;n LCD ở trạng th&aacute;i đ&oacute;ng, &aacute;nh s&aacute;ng kh&ocirc;ng thể xuy&ecirc;n qua th&igrave; điểm ảnh biểu diễn tr&ecirc;n m&agrave;n h&igrave;nh l&agrave; đen. Tương tự, độ s&aacute;ng của điểm ảnh cũng thay đổi tương ứng theo trạng th&aacute;i mở của điểm ảnh LCD. Điều khiển 3 tấm LCD đ&oacute;ng mở điểm ảnh theo th&ocirc;ng tin ảnh số, ta thu được 3 ảnh đơn sắc theo hệ m&agrave;u RGB. Sau đ&oacute;, tất cả được tổng hợp một c&aacute;ch tự nhi&ecirc;n trong một lăng k&iacute;nh theo cơ chế &aacute;nh s&aacute;ng trước khi xuất đến m&agrave;n chiếu. Nhược điểm của m&aacute;y chiếu LCD thường thể hiện khi chiếu phim l&agrave; lộ điểm ảnh, m&agrave;u đen kh&ocirc;ng thật v&agrave; h&igrave;nh ảnh chuyển động nhanh sẽ bị nh&ograve;e.<br /><br /><strong>C&ocirc;ng nghệ DLP đem lại sự nhỏ gọn của m&aacute;y chiếu tại gia đ&igrave;nh.&nbsp;<br /></strong><br />Khắc phục nhược điểm n&agrave;y, c&ocirc;ng nghệ DLP sử dụng gương để phản chiếu &aacute;nh s&aacute;ng. Một chip DMD (Digital Micromirror Device) được t&iacute;ch hợp h&agrave;ng ngh&igrave;n vi gương, mỗi vi gương tương ứng một điểm ảnh. Vi gương dao động h&agrave;ng ngh&igrave;n lần/gi&acirc;y v&agrave; thể hiện được 1.024 cấp độ x&aacute;m. Để thể hiện h&igrave;nh ảnh m&agrave;u, một b&aacute;nh quay m&agrave;u (color wheel) được đặt giữa nguồn s&aacute;ng v&agrave; DMD. Phổ biến hiện nay l&agrave; hệ thống sử dụng b&aacute;nh quay 4 m&agrave;u gồm đỏ, lục, xanh dương, trắng để lần lượt tạo v&agrave; xuất ra 4 ảnh đơn sắc trong một chu kỳ. Thay v&igrave; tổng hợp tự nhi&ecirc;n tại thấu k&iacute;nh, 4 h&igrave;nh ảnh đơn sắc lần lượt được ghi nhận v&agrave; tổng hợp tại n&atilde;o người (tương tự như phương ph&aacute;p tổng hợp ảnh 3D bằng mắt phổ biến trong điện ảnh). Ưu điểm của DLP l&agrave; tạo được h&igrave;nh ảnh mượt, kh&ocirc;ng lộ điểm ảnh, độ tương phản cao v&agrave; kh&ocirc;ng bị hiện tượng lệch hội tụ như c&ocirc;ng nghệ d&ugrave;ng LCD 3 tấm. Cấu tạo m&aacute;y chiếu DLP đơn giản hơn LCD 3 tấm n&ecirc;n k&iacute;ch thước m&aacute;y nhỏ nhẹ. Nhờ đưa th&ecirc;m m&agrave;u trắng v&agrave;o b&aacute;nh quay m&agrave;u m&agrave; h&igrave;nh ảnh tạo ra bởi m&aacute;y chiếu DLP s&aacute;ng hơn v&agrave; c&oacute; m&agrave;u trắng rất thuần khiết. Điểm ảnh trong m&aacute;y chiếu &ldquo;kh&iacute;t&rdquo; hơn, h&igrave;nh ảnh sắc n&eacute;t hơn so với LCD.&nbsp;<br /><br /><strong>Chỉ số kỹ thuật</strong>&nbsp;<br /><br />Độ s&aacute;ng, độ tương phản v&agrave; độ ph&acirc;n giải l&agrave; ba chỉ số cơ bản ảnh hưởng trực tiếp đến chất lượng h&igrave;nh ảnh của m&aacute;y chiếu. Th&ocirc;ng thường, độ s&aacute;ng được quan t&acirc;m nhiều nhất bởi chỉ số n&agrave;y c&agrave;ng cao th&igrave; chất lượng h&igrave;nh ảnh c&agrave;ng độc lập với &aacute;nh s&aacute;ng b&ecirc;n ngo&agrave;i. Đ&acirc;y cũng l&agrave; căn cứ thể hiện sự kh&aacute;c biệt giữa 2 d&ograve;ng m&aacute;y chiếu gia đ&igrave;nh v&agrave; văn ph&ograve;ng.<br /><br />Ph&ograve;ng họp tại c&aacute;c c&ocirc;ng ty thường c&oacute; &aacute;nh s&aacute;ng phức tạp, người c&oacute; thể đi lại, cần &aacute;nh s&aacute;ng để ghi ch&eacute;p&hellip; n&ecirc;n đ&ograve;i hỏi projector cho nguồn &aacute;nh s&aacute;ng mạnh. Người sử dụng m&aacute;y chiếu tại gia đ&igrave;nh hay thiết kế ph&ograve;ng ri&ecirc;ng để thưởng thức, khi xem phim thường tắt hết đ&egrave;n n&ecirc;n độ s&aacute;ng chỉ khoảng từ 1.500 - 2.200 Ansilumen l&agrave; c&oacute; đ&aacute;p ứng được y&ecirc;u cầu. Gia tăng th&ecirc;m cường độ &aacute;nh s&aacute;ng chỉ c&oacute; sự kh&aacute;c biệt về&hellip; tiền mua m&aacute;y v&agrave; tiền điện.&nbsp;<br /><br />Ngược lại, độ tương phản v&agrave; ph&acirc;n giải những m&aacute;y chiếu cho gia đ&igrave;nh lại được gia tăng đặc biệt. Nếu độ tương phản c&agrave;ng cao, m&agrave;u sắc c&agrave;ng sống động, trung thực. M&agrave;n LCD hiện nay c&oacute; độ tương phản phổ biến ở mức 500 &ndash; 700:1, trong khi m&aacute;y chiếu th&ocirc;ng thường c&oacute; độ tương phản từ 1.700 &ndash; 2.200:1. Những biểu đồ, đồ thị trong c&aacute;c buổi thuyết tr&igrave;nh tại văn ph&ograve;ng kh&ocirc;ng đ&ograve;i hỏi qu&aacute; khắt khe về yếu tố n&agrave;y, nhưng đ&acirc;y lại l&agrave; điểm l&agrave;m n&ecirc;n sức h&uacute;t cho những bộ phim DVD. Mỗi projector c&oacute; thể tương th&iacute;ch với nhiều độ ph&acirc;n giải, chế độ SVGA (800 x 600 pixel) th&iacute;ch hợp với những ph&ograve;ng rộng v&agrave; tối v&igrave; điểm ảnh kh&aacute; lớn. Chế độ chuẩn XGA (1024 x 768) ph&ugrave; hợp với đa số ph&ograve;ng chiếu gia đ&igrave;nh.&nbsp;<br /><br />Chỉ số b&ugrave; g&oacute;c vu&ocirc;ng kh&aacute; quan trọng nhưng thường &iacute;t được người mua để &yacute;. Đ&acirc;y l&agrave; khả năng định hướng luồng s&aacute;ng của m&aacute;y chiếu &aacute;nh s&aacute;ng vu&ocirc;ng g&oacute;c với m&agrave;n ảnh, cho h&igrave;nh ảnh vu&ocirc;ng vắn v&agrave; trung thực. Số g&oacute;c c&oacute; thể b&ugrave; c&agrave;ng lớn, khả năng bố tr&iacute; m&aacute;y c&agrave;ng linh hoạt.&nbsp;<br /><br />Projector d&ugrave;ng để xem phim tại nh&agrave; kh&ocirc;ng cần loại c&oacute; sẵn loa v&igrave; ch&uacute;ng thường c&oacute; c&ocirc;ng suất vừa phải, chỉ th&iacute;ch hợp với ph&ograve;ng họp nhỏ. Mặt kh&aacute;c, hệ thống rạp h&aacute;t gia đ&igrave;nh thường đi k&egrave;m với đầu ampli, m&aacute;y chơi DVD v&agrave; d&agrave;n &acirc;m thanh chuy&ecirc;n dụng.Do đ&oacute;, những t&iacute;nh năng hỗ trợ chiếu khu&ocirc;n h&igrave;nh rộng (16:9), chuẩn kết nối DVI, HDTV,&hellip; quan trọng hơn để c&oacute; được chất lượng h&igrave;nh ảnh tốt nhất.&nbsp;<br /><br /><strong>Bảo quản v&agrave; sử dụng</strong>&nbsp;<br /><br />Kh&ocirc;ng như m&agrave;n h&igrave;nh TV, m&aacute;y chiếu c&oacute; b&oacute;ng đ&egrave;n c&ocirc;ng suất lớn tỏa nhiều nhiệt n&ecirc;n ch&uacute;ng cần được bố tr&iacute; vận h&agrave;nh tại nơi tho&aacute;ng m&aacute;t, nguồn điện ổn định. Sau mỗi lần xem, người d&ugrave;ng phải đợi một l&uacute;c cho m&aacute;y nguội mới cất v&agrave;o hộp hoặc che phủ tr&aacute;nh bụi. Một số gia đ&igrave;nh thiết kế gi&aacute; treo projector tr&ecirc;n trần nh&agrave; để đảm bảo yếu tố n&agrave;y m&agrave; lại tiết kiệm được kh&ocirc;ng gian. B&oacute;ng đ&egrave;n cũng l&agrave; linh kiện cần được &ldquo;chăm s&oacute;c&rdquo; kỹ c&agrave;ng nhất. Th&ocirc;ng thường, to&agrave;n bộ th&acirc;n m&aacute;y chiếu được bảo h&agrave;nh 1-2 năm, nhưng ri&ecirc;ng đ&egrave;n h&igrave;nh chỉ được bảo h&agrave;nh 1 th&aacute;ng hoặc 90 giờ chiếu. Người d&ugrave;ng cần thường xuy&ecirc;n quan s&aacute;t b&oacute;ng đ&egrave;n, nếu c&oacute; hiện tượng nh&ograve;e h&igrave;nh th&igrave; n&ecirc;n thay ngay.&nbsp;<br /><br />Để tiết kiệm diện t&iacute;ch, người d&ugrave;ng c&oacute; thể tận dụng bức tường phẳng sơn nhẵn để chiếu h&igrave;nh. Tuy nhi&ecirc;n, chất lượng h&igrave;nh ảnh kh&ocirc;ng thể bằng tấm ph&ocirc;ng chiếu chuy&ecirc;n dụng. Tấm m&agrave;n n&agrave;y được phủ sơn phản quang để &aacute;nh s&aacute;ng phản xạ đến mắt người nhiều nhất. Phần lớn m&agrave;n chiếu c&oacute; m&agrave;u trắng, nhưng cũng c&oacute; loại m&agrave;u x&aacute;m để chống ch&oacute;i v&agrave; tăng sắc đen cho ảnh. Nếu y&ecirc;u cầu chất lượng cao hơn, kh&aacute;ch h&agrave;ng c&oacute; thể y&ecirc;u cầu loại cao cấp trong sơn c&oacute; pha hạt kim loại tăng độ n&eacute;t v&agrave; độ s&aacute;ng.&nbsp;<br /><br />Hiện tại, kh&aacute;ch h&agrave;ng mua m&aacute;y chiếu thường dựa v&agrave;o thương hiệu hoặc &ldquo;tư vấn&rdquo; của bạn b&egrave; v&igrave; loại sản phẩm n&agrave;y c&ograve;n mới đối với nhiều người. Những thương hiệu phổ biến ở Việt Nam c&oacute; Epson, Canon, Infocus, Optoma, Sony&hellip; Sản xuất c&aacute;c loại m&aacute;y chiếu nhỏ gọn cho văn ph&ograve;ng nhỏ v&agrave; giải tr&iacute; tại gia đ&igrave;nh ng&agrave;y c&agrave;ng được c&aacute;c nh&agrave; sản xuất ch&uacute; trọng.</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;"><strong>4. M&aacute;y chiếu LCD hay m&aacute;y chiếu DLP</strong><br /><br />M&aacute;y chiếu n&oacute;i chung c&oacute; thể ph&acirc;n loại theo hai c&ocirc;ng nghệ, DLP (Digital Light Processing) hay LCD (Liquid Crystal Display). C&ocirc;ng nghệ n&agrave;y li&ecirc;n quan đến cơ chế hoạt động b&ecirc;n trong m&agrave; m&aacute;y chiếu sử dụng để hiển thị h&igrave;nh ảnh. Tr&ecirc;n thị trường, sự cạnh tranh giữa 2 nh&oacute;m m&aacute;y chiếu c&ocirc;ng nghệ LCD (đại diện ti&ecirc;u biểu l&agrave; M&aacute;y chiếu 3M) với m&aacute;y chiếu c&ocirc;ng nghệ DLP (ti&ecirc;u biểu l&agrave; Acer), ng&agrave;y c&agrave;ng quyết liệt.&nbsp;<br />Điều n&agrave;y gi&uacute;p cả hai c&ocirc;ng nghệ tự ho&agrave;n thiện m&igrave;nh hơn nữa để chất lượng h&igrave;nh ảnh ng&agrave;y c&agrave;ng r&otilde;, đẹp, tự nhi&ecirc;n. Đồng thời, gi&aacute; th&agrave;nh sản phẩm cũng v&igrave; thế m&agrave; rẻ đi. Sự kh&aacute;c biệt chất lượng giữa c&aacute;c c&ocirc;ng nghệ ph&oacute;ng h&igrave;nh (LCD, DLP v&agrave; LCOS) giờ đ&acirc;y c&ograve;n rất nhỏ. M&aacute;y chiếu được ph&acirc;n loại theo một số ti&ecirc;u ch&iacute; th&ocirc;ng dụng như t&iacute;nh trong suốt (transparent), t&iacute;nh phản chiếu (reflective) đối với &aacute;nh s&aacute;ng truyền; hoặc 3 tấm, 1 tấm theo số lượng tấm tạo ảnh; hoặc LCD, gương, LCOS theo cấu tạo. Về nguy&ecirc;n l&yacute;, &aacute;nh s&aacute;ng ph&aacute;t ra từ đ&egrave;n c&ocirc;ng suất cao phải đi qua nhiều thấu k&iacute;nh để điều chỉnh cho ổn định, đồng nhất trước khi đến lăng k&iacute;nh điều chế h&igrave;nh ảnh cũng như l&uacute;c xuất ra. Hai phương ph&aacute;p thường được d&ugrave;ng hiện nay l&agrave; trong suốt cho xuy&ecirc;n qua v&agrave; phản chiếu bằng gương.<br /><br />Phương ph&aacute;p trong suốt thường d&ugrave;ng tấm LCD trong khi phương ph&aacute;p phản chiếu lại sử dụng h&agrave;ng ng&agrave;n gương nhỏ tương ứng h&agrave;ng ng&agrave;n điểm ảnh. Mỗi phương ph&aacute;p đều c&oacute; ưu v&agrave; nhược điểm ri&ecirc;ng song mức kh&aacute;c biệt chất lượng hiện tại đ&atilde; được r&uacute;t ngắn đến mức kh&oacute; ph&acirc;n biệt. Tiếc l&agrave; vẫn chưa c&oacute; m&aacute;y chiếu n&agrave;o to&agrave;n năng đến mức đ&aacute;p ứng tốt cả tr&igrave;nh diễn nghiệp vụ v&agrave; chiếu phim. Ch&iacute;nh v&igrave; thế để lựa được m&aacute;y chiếu ph&ugrave; hợp với mục đ&iacute;ch sử dụng, bạn cần hiểu r&otilde; c&ocirc;ng nghệ trước.&nbsp;<br /><br />Cả hai c&ocirc;ng nghệ LCD hay DLP đều c&oacute; những ưu điểm ri&ecirc;ng, điều quan trọng l&agrave; hiểu r&otilde; mỗi c&ocirc;ng nghệ mang lại điều g&igrave;.&nbsp;<br /><br /><strong>C&Ocirc;NG NGHỆ DLP<br /></strong><br />Digital Light Processing l&agrave; giải ph&aacute;p hiển thị kỹ thuật số. C&ocirc;ng nghệ DLP sử dụng một vi mạch b&aacute;n dẫn quang học, gọi l&agrave; Digital Micromirror Device (tạm dịch l&agrave; thiết bị phản chiếu si&ecirc;u nhỏ kỹ thuật số) hay DMD để t&aacute;i tạo dữ liệu nguồn.&nbsp;<br /><br />Tr&aacute;i ngược với phương ph&aacute;p trong suốt cho &aacute;nh s&aacute;ng truyền qua của LCD, c&ocirc;ng nghệ DLP do Texas Instruments ph&aacute;t triển độc quyền v&agrave;o năm 1997 sử dụng gương để phản chiếu &aacute;nh s&aacute;ng. Một chip DMD (Direct Micromirror Device) được t&iacute;ch hợp đến h&agrave;ng ng&agrave;n vi gương, mỗi vi gương tương ứng một điểm ảnh. V&igrave; gương dao động h&agrave;ng ng&agrave;n lần/gi&acirc;y v&agrave; thể hiện được 1.024 cấp độ x&aacute;m. Để thể hiện h&igrave;nh ảnh m&agrave;u, một b&aacute;nh quay m&agrave;u (color wheel) được đặt giữa nguồn s&aacute;ng v&agrave; DMD. Phổ biến hiện nay l&agrave; hệ thống sử dụng b&aacute;nh quay 4 m&agrave;u gồm đỏ, lục, xanh dương, trắng để lần lượt tạo v&agrave; xuất ra 4 ảnh đơn sắc trong một chu kỳ. Thay v&igrave; tổng hợp tự nhi&ecirc;n tại thấu k&iacute;nh, 4 h&igrave;nh ảnh đơn sắc lần lượt được ghi nhận v&agrave; tổng hợp tại n&atilde;o người (tương tự như phương ph&aacute;p tổng hợp ảnh 3D bằng mắt phổ biến trong giới thanh ni&ecirc;n v&agrave;o những năm 1990).&nbsp;<br /><br /><img src="http://www.trungtammaychieu.com/data/upload_file/Image/products/aaa.JPG" alt="" />&nbsp;<br /><br />- light source: nguồn s&aacute;ng&nbsp;<br />- optics: bộ phận quang học<br />- color filter: bộ lọc m&agrave;u<br />- circuit board: bo mạch<br />- DMD: chip DMD<br /><br /><strong>Ưu điểm của DLP</strong>&nbsp;<br /><br />* Hiệu ứng "ca-r&ocirc;" (lưới) nhẹ hơn v&igrave; c&aacute;c ảnh điểm gần nhau hơn. Điều n&agrave;y kh&ocirc;ng cho nhiều kh&aacute;c biệt với dữ liệu, nhưng n&oacute; cho h&igrave;nh ảnh video mịn hơn.&nbsp;<br /><br /><img src="http://www.trungtammaychieu.com/data/upload_file/Image/products/vv.JPG" alt="" />&nbsp;<br /><br />* C&oacute; thể đạt độ tương phản (contrast) cao hơn.&nbsp;<br />* Gọn nhẹ, dễ di động hơn do c&oacute; &iacute;t th&agrave;nh phần hơn.<br />* Một số nghi&ecirc;n cứu cho rằng m&aacute;y chiếu DLP c&oacute; tuổi thọ cao hơn m&aacute;y chiếu LCD.<br /><br />Ưu điểm của DLP l&agrave; tạo được h&igrave;nh ảnh mượt, kh&ocirc;ng lộ điểm ảnh; tương phản cao v&agrave; kh&ocirc;ng bị hiện tượng lệch hội tụ như c&ocirc;ng nghệ d&ugrave;ng LCD 3 tấm. Mặt kh&aacute;c, cấu tạo m&aacute;y chiếu DLP đơn giản hơn LCD 3 tấm n&ecirc;n k&iacute;ch thước m&aacute;y nhỏ v&agrave; nhẹ hơn.&nbsp;<br /><br />Nhờ đưa th&ecirc;m m&agrave;u trắng v&agrave;o b&aacute;nh quay m&agrave;u m&agrave; h&igrave;nh ảnh tạo ra bởi m&aacute;y chiếu DLP s&aacute;ng hơn v&agrave; c&oacute; m&agrave;u trắng rất thuần khiết; tuy nhi&ecirc;n, điều n&agrave;y lại l&agrave;m cho tỷ lệ c&acirc;n bằng giữa c&aacute;c m&agrave;u ch&ecirc;nh lệch v&agrave; l&agrave;m giảm sắc độ m&agrave;u biểu diễn. Để khắc phục, m&aacute;y chiếu DLP trong rạp h&aacute;t gia đ&igrave;nh c&oacute; thể d&ugrave;ng b&aacute;nh quay 6 m&agrave;u (2 bộ m&agrave;u RGB) v&agrave; c&oacute; trường hợp bổ sung th&ecirc;m m&agrave;u lục đậm, xanh dương đậm (b&aacute;nh quay 7 m&agrave;u hoặc 8 m&agrave;u). Việc loại bỏ m&agrave;u trắng v&agrave; d&ugrave;ng b&aacute;nh quay nhiều m&agrave;u gi&uacute;p m&aacute;y chiếu DLP thể hiện m&agrave;u tươi, phong ph&uacute; sắc độ hơn nhưng độ s&aacute;ng bị giảm xuống; v&igrave; thế để xem phim tốt với m&aacute;y chiếu DLP, kh&ocirc;ng gian ph&ograve;ng chiếu cần tối.&nbsp;<br /><br /><strong>Khuyết điểm của DLP</strong>&nbsp;<br /><br />* Độ b&atilde;o ho&agrave; m&agrave;u thấp hơn (ảnh hưởng nhiều đến dữ liệu hơn video).&nbsp;<br />* Hiệu ứng "cầu vồng", xuất hiện dưới dạng một vệt s&aacute;ng giống như cầu vồng lo&eacute; l&ecirc;n, thường theo sau những vật thể s&aacute;ng, khi nh&igrave;n từ cạnh n&agrave;y sang cạnh kia của m&agrave;n ảnh, hay khi từ h&igrave;nh ảnh chiếu tr&ecirc;n m&agrave;n ảnh quay sang nh&igrave;n vật thể ngo&agrave;i m&agrave;n ảnh. Chỉ c&oacute; &iacute;t người nh&igrave;n thấy hiệu ứng n&agrave;y, hoặc ta c&oacute; thể thấy bằng c&aacute;ch nh&igrave;n nhanh ngang qua m&agrave;n ảnh. C&oacute; 2 loại m&aacute;y chiếu DLP, loại cũ c&oacute; 4 phần tr&ecirc;n bộ lọc m&agrave;u, loại mới c&oacute; 6 phần v&agrave; bộ lọc m&agrave;u quay nhanh hơn, điều đ&oacute; l&agrave;m giảm hiệu ứng "cầu vồng" v&agrave; tăng độ b&atilde;o ho&agrave; m&agrave;u.<br />* Hiệu ứng "vầng h&agrave;o quang" (hay lộ s&aacute;ng). N&oacute; c&oacute; thể g&acirc;y kh&oacute; chịu cho những người sử dụng m&aacute;y chiếu xem phim tại nh&agrave;. Về cơ bản, đ&oacute; l&agrave; một dải x&aacute;m xung quanh r&igrave;a của h&igrave;nh ảnh, g&acirc;y ra do &aacute;nh s&aacute;ng "đi lạc" bị bật ra khi đụng c&aacute;c cạnh của c&aacute;c tấm gương nhỏ tr&ecirc;n chip DLP. C&oacute; thể khắc phục bằng c&aacute;ch tạo một đường bi&ecirc;n đen rộng v&agrave;i inch quanh m&agrave;n ảnh, "vầng h&agrave;o quang" sẽ rơi tr&ecirc;n đường bi&ecirc;n n&agrave;y. Tuy nhi&ecirc;n, hiệu ứng "vầng h&agrave;o quang" &iacute;t thấy r&otilde; tr&ecirc;n c&aacute;c chip DLP mới, chẳng hạn như chip DDR.<br />* N&oacute;i chung, DLP l&agrave; c&ocirc;ng nghệ tốt hơn LCD cho việc xem phim tại nh&agrave;. Một số m&aacute;y chiếu d&agrave;nh cho việc xem phim tại nh&agrave; hầu như kh&ocirc;ng bị hiệu ứng "vầng h&agrave;o quang".<br /><br />Nhược điểm của DLP kh&ocirc;ng phải mọi người đều nhận thấy. T&ugrave;y thuộc v&agrave;o khả năng xử l&yacute; h&igrave;nh ảnh của n&atilde;o m&agrave; một số người cảm thấy nhức đầu, hoa mắt v&agrave; thấy vệt cầu vồng viền quanh đối tượng chuyển động nhanh. Hiện tượng n&agrave;y xuất hiện l&agrave; do đối tượng chuyển động qu&aacute; nhanh n&ecirc;n c&oacute; sự x&ecirc; dịch trong qu&aacute; tr&igrave;nh tổng hợp c&aacute;c lớp ảnh đơn m&agrave;u diễn ra trong n&atilde;o. Để loại bỏ hiện tượng n&agrave;y triệt để, dĩ nhi&ecirc;n m&aacute;y chiếu DLP cũng được ph&aacute;t triển theo hướng sử dụng 3 chip DMD nhưng gi&aacute; th&agrave;nh hiện nay c&ograve;n rất cao, khoảng tr&ecirc;n 20.000 USD một m&aacute;y. Một số nh&agrave; sản xuất m&aacute;y chiếu DLP 1 tấm kh&aacute;c đang t&igrave;m c&aacute;ch tăng tốc độ quay v&agrave; tăng số m&agrave;u tr&ecirc;n b&aacute;nh quay m&agrave;u. Điều n&agrave;y đ&atilde; ph&acirc;n h&oacute;a d&ograve;ng m&aacute;y chiếu DLP: hướng đến ph&ograve;ng chiếu phim gia đ&igrave;nh, nh&agrave; sản xuất d&ugrave;ng b&aacute;nh quay 6 m&agrave;u, tốc độ 120Hz (tương đương 7.200 v&ograve;ng/ph&uacute;t) trong khi m&aacute;y chiếu cho ứng dụng nghiệp vụ th&igrave; vẫn d&ugrave;ng b&aacute;nh quay 4 m&agrave;u (c&oacute; m&agrave;u trắng) với tốc độ quay từ 120Hz cho đến 180Hz. Tuy vậy, c&aacute;ch khắc phục n&agrave;y kh&ocirc;ng thể loại bỏ ho&agrave;n to&agrave;n hiện tượng vệt cầu vồng.&nbsp;<br /><br /><strong>C&Ocirc;NG NGHỆ LCD</strong>&nbsp;<br /><br />M&aacute;y chiếu LCD (liquid crystal display, tạm dịch l&agrave; hiển thị tinh thể lỏng) tổng hợp h&igrave;nh ảnh m&agrave;u dựa tr&ecirc;n 3 m&agrave;u cơ bản l&agrave; đỏ, lục v&agrave; xanh dương (RGB) như cơ chế đang được d&ugrave;ng phổ biến trong chế tạo m&agrave;n h&igrave;nh, in ấn. Nguồn s&aacute;ng trắng ban đầu được t&aacute;ch th&agrave;nh 3 nguồn s&aacute;ng đơn sắc l&agrave; đỏ, lục, xanh dương v&agrave; được dẫn đến 3 tấm LCD độc lập. Nếu điểm ảnh tr&ecirc;n LCD ở trạng th&aacute;i đ&oacute;ng, &aacute;nh s&aacute;ng kh&ocirc;ng thể xuy&ecirc;n qua th&igrave; điểm ảnh biểu diễn tr&ecirc;n m&agrave;n h&igrave;nh l&agrave; đen. Tương tự, độ s&aacute;ng của điểm ảnh cũng thay đổi tương ứng theo trạng th&aacute;i mở của điểm ảnh LCD. Điều khiển 3 tấm LCD đ&oacute;ng mở điểm ảnh theo th&ocirc;ng tin ảnh số, ta thu được 3 ảnh đơn sắc theo hệ m&agrave;u RGB. Sau đ&oacute;, tất cả được tổng hợp một c&aacute;ch tự nhi&ecirc;n trong một lăng k&iacute;nh theo cơ chế &aacute;nh s&aacute;ng trước khi xuất đến m&agrave;n chiếu.&nbsp;<br /><br /><img src="http://www.trungtammaychieu.com/data/upload_file/Image/products/dg.JPG" alt="" />&nbsp;<br /><br />- light source: nguồn s&aacute;ng&nbsp;<br />- red dichroic mirror: gương sắc đỏ<br />- blue dichroic mirror: gương sắc xanh<br />- dichroic mirror "wavelength selector": gương chọn lọc bước s&oacute;ng<br />- mirror: guơng phản chiếu<br />- LCD: bộ phận hiển thị tinh thể lỏng<br />- dichroic combiner cube: th&agrave;nh phần tổng hợp 3 sắc đỏ, xanh lục, xanh<br />- lens: thấu k&iacute;nh<br /><br /><strong>Ưu điểm của LCD</strong>&nbsp;<br /><br />* LCD n&oacute;i chung c&oacute; "hiệu quả &aacute;nh s&aacute;ng" hơn DLP (h&igrave;nh ảnh sẽ s&aacute;ng hơn với LCD, với đ&egrave;n c&oacute; c&ugrave;ng c&ocirc;ng suất).&nbsp;<br />* LCD c&oacute; khuynh hướng cho độ b&atilde;o ho&agrave; m&agrave;u cao hơn. Tuy nhi&ecirc;n, độ b&atilde;o ho&agrave; m&agrave;u cao hơn l&agrave;m cho ta thấy m&aacute;y chiếu nh&igrave;n to&agrave;n bộ l&agrave; s&aacute;ng hơn, d&ugrave; l&agrave; m&aacute;y chiếu DLP trắng c&oacute; thể s&aacute;ng hơn.<br />* V&igrave; l&yacute; do n&agrave;y, nếu đặt một m&aacute;y chiếu LCD 1000 lumen kế b&ecirc;n một m&aacute;y chiếu DLP 1200 lumen v&agrave; cho chiếu h&igrave;nh m&agrave;u, ta c&oacute; thể th&iacute;ch m&aacute;y chiếu LCD do độ s&aacute;ng của n&oacute;.<br />* LCD c&oacute; khuynh hướng cho h&igrave;nh ảnh sắc n&eacute;t hơn (hội tụ ch&iacute;nh x&aacute;c hơn).&nbsp;<br /><br />Ưu điểm của m&aacute;y chiếu LCD 3 tấm l&agrave; thể hiện phong ph&uacute; sắc độ m&agrave;u, sắc n&eacute;t v&agrave; độ s&aacute;ng cao. Do tổ hợp c&ugrave;ng l&uacute;c 3 m&agrave;u RGB với nguồn s&aacute;ng ổn định, kh&ocirc;ng suy giảm, m&aacute;y chiếu LCD 3 tấm t&aacute;i hiện m&agrave;u phong ph&uacute; v&agrave; chuyển tiếp m&agrave;u mượt hơn c&ocirc;ng nghệ DLP 1 tấm. Độ sắc n&eacute;t của m&aacute;y chiếu LCD 3 tấm trội hẳn DLP trong c&aacute;c ứng dụng nghiệp vụ. Độ hiệu quả &aacute;nh s&aacute;ng (ANSI lumen xuất ra/c&ocirc;ng suất đ&egrave;n) của m&aacute;y chiếu LCD cũng c&oacute; phần nhỉnh hơn DLP.&nbsp;<br /><br /><strong>Khuyết điểm của LCD</strong>&nbsp;<br /><br />* Hiệu ứng "ca-r&ocirc;" l&agrave;m h&igrave;nh ảnh tr&ocirc;ng bị "vỡ hạt".&nbsp;<br />* Cấu tạo lớn hơn, v&igrave; c&oacute; nhiều th&agrave;nh phần b&ecirc;n trong hơn.<br />* Hiện tượng "điểm chết" - c&aacute;c ảnh điểm c&oacute; thể lu&ocirc;n tắt hay lu&ocirc;n mở, được gọi l&agrave; điểm chết. Nếu m&aacute;y chiếu c&oacute; nhiều điểm chết, n&oacute; sẽ g&acirc;y kh&oacute; chịu cho người d&ugrave;ng.<br />* C&aacute;c tấm k&iacute;nh LCD c&oacute; thể bị hỏng v&agrave; thay thế rất đắt tiền. Chip DLP cũng c&oacute; thể bị hỏng nhưng tương đối hiếm v&igrave; c&oacute; &iacute;t linh kiện b&ecirc;n trong hơn.<br /><br />Nhược điểm của m&aacute;y chiếu LCD thường thể hiện khi chiếu phim l&agrave; lộ điểm ảnh v&agrave; m&agrave;u đen kh&ocirc;ng thật. Tuy nhi&ecirc;n, với thế hệ m&aacute;y chiếu ph&acirc;n giải XGA hiện nay, mắt thường rất kh&oacute; ph&acirc;n biệt được điểm ảnh. Với thế hệ D4 mới nhất m&agrave; Epson chế tạo, khoảng ph&acirc;n c&aacute;ch giữa hai điểm LCD đ&atilde; giảm từ 3 micron xuống 2,5 micron. C&ograve;n để tạo được m&agrave;u đen tự nhi&ecirc;n, Epson vừa &aacute;p dụng kỹ thuật thay đổi động cường độ s&aacute;ng trong mẫu m&aacute;y Dreamio EMP-TW200H. Chế độ cinema tối ưu cho mục đ&iacute;ch chiếu phim tự động giảm c&ocirc;ng suất nguồn đ&egrave;n trong khoảng 1.500lm đến 500lm.&nbsp;<br /><br />Để thể hiện được những chi tiết khuất trong v&ugrave;ng tối hoặc v&ugrave;ng s&aacute;ng, Epson c&oacute; chức năng tăng cường mức trắng v&agrave; đen (black &amp; white level enhancer): đường gamma sẽ được chỉnh cong l&ecirc;n khi khung h&igrave;nh tối v&agrave; chỉnh cong xuống trong trường hợp khung h&igrave;nh s&aacute;ng. K&iacute;nh lọc cinema m&agrave; Epson vừa đưa v&agrave;o gi&uacute;p lọc bớt m&agrave;u lục, xanh dương n&ecirc;n m&agrave;u da người c&oacute; phần hồng h&agrave;o hơn, m&agrave;u sắc chuyển mượt v&agrave; s&acirc;u hơn. Texas Instruments từng t&agrave;i trợ một thử nghiệm để chứng minh m&aacute;y chiếu LCD nhanh xuống m&agrave;u hơn DLP. Kết quả thử nghiệm cho kết quả đ&uacute;ng nhưng tuổi thọ của tấm LCD giờ đ&atilde; được n&acirc;ng l&ecirc;n nhiều nhờ c&ocirc;ng nghệ chế tạo LCD HTPS (high temparature polysilicon) của Epson cho ph&eacute;p LCD chịu được nhiệt độ 1.000 độ C.&nbsp;<br /><br /><strong>C&Ocirc;NG NGHỆ LCOS - Liquid Crystal on Silicon</strong>&nbsp;<br /><br />C&ocirc;ng nghệ LCOS l&agrave; giải ph&aacute;p kết hợp đượcPhương thức LCOS 3 tấm giữa 2 c&ocirc;ng nghệ LCD v&agrave; DLP. B&ecirc;n tr&ecirc;n lớp đế gương phản chiếu l&agrave; lớp phủ thạch anh lỏng. Ứng với trạng th&aacute;i đ&oacute;ng hoặc mở của thạch anh m&agrave; tia s&aacute;ng nguồn được phản chiếu tr&ecirc;n lớp đế gương hoặc kh&ocirc;ng, tạo ra điểm s&aacute;ng hoặc tối. Hơn nữa, việc chế tạo LCOS c&oacute; thể thực hiện ngay tr&ecirc;n những d&acirc;y chuyền sản xuất vi mạch b&aacute;n dẫn hiện c&oacute; n&ecirc;n chi ph&iacute; sản xuất dễ chấp nhận hơn.&nbsp;<br /><img src="http://www.trungtammaychieu.com/data/upload_file/Image/logo/A0411_CN_101b.jpg" alt="" />&nbsp;<br /><strong>Ưu điểm của LCOS</strong>&nbsp;<br /><br />Ưu điểm lớn nhất của c&ocirc;ng nghệ LCOS l&agrave; tạo được h&igrave;nh ảnh mượt, kh&ocirc;ng hề lộ điểm v&agrave; vượt qua cả chip DLP Mustang ph&acirc;n giải cao (1280x720). Độ sắc n&eacute;t của LCOS trội hơn DLP đồng thời thể hiện m&agrave;u tự nhi&ecirc;n hơn. Một điểm kh&aacute;c cũng hết sức quan trọng l&agrave; m&aacute;y chiếu LCOS ho&agrave;n to&agrave;n kh&ocirc;ng g&acirc;y ra hiện tượng vệt cầu vồng hay hoa mắt cho người xem.&nbsp;<br /><br /><strong>Khuyết điểm của LCOS</strong>&nbsp;<br /><br />Điểm yếu hiện tại của c&ocirc;ng nghệ n&agrave;y l&agrave; độ tương phản chưa cao: hiện mới chỉ đạt đến 800:1 trong khi c&ocirc;ng nghệ LCD v&agrave; DLP hiện tại đ&atilde; đạt đến 6.000:1. Ngo&agrave;i ra, tuổi thọ b&oacute;ng đ&egrave;n LCOS c&ograve;n đang ở mức 1.500 giờ v&agrave; gi&aacute; thay thế c&ograve;n rất cao.&nbsp;<br /><br /><strong>KẾT LUẬN</strong>&nbsp;<br /><br />M&aacute;y chiếu c&ocirc;ng nghệ DLP nh&igrave;n chung được ưa th&iacute;ch cho việc xem phim tại nh&agrave; v&agrave; t&iacute;nh di động. M&aacute;y chiếu LCD th&igrave; tốt hơn cho c&aacute;c đ&ograve;i hỏi cao về m&agrave;u sắc.</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;"><strong>5. Chơi HD bằng m&aacute;y chiếu<br /><br /></strong>Xem phim HD bằng m&aacute;y chiếu đem lại cho người xem cả kh&ocirc;ng gian v&agrave; kh&ocirc;ng kh&iacute; thực như đang thưởng thức phim tr&ecirc;n m&agrave;n ảnh rộng tại rạp.<br /><br />Theo một số người s&agrave;nh chơi, c&oacute; nhiều c&aacute;ch xem phim HD nhưng để thưởng thức "m&atilde;n nh&atilde;n" nhất phải l&agrave; m&aacute;y chiếu. Ngay cả c&aacute;c TV LCD hay Plasma m&agrave;n h&igrave;nh cực lớn vẫn nhỏ m&agrave; kh&ocirc;ng đem lại cho người xem một kh&ocirc;ng gian cũng như kh&ocirc;ng kh&iacute; xem phim thực như ở rạp, anh Nguyễn Long th&agrave;nh vi&ecirc;n box HD Film Club của diễn đ&agrave;n Nghe Nh&igrave;n Việt Nam chia sẻ.&nbsp;<br /><br /><img src="http://www.trungtammaychieu.com/data/upload_file/Image/products/HD_maychieu-1-7-12.jpg" alt="" />&nbsp;<br />Xem phim HD bằng m&aacute;y chiếu đem lại 1 cảm gi&aacute;c rất "Xi-ne" (Ảnh V-zone)<br /><br />Tại Việt Nam, thị trường m&aacute;y chiếu giải tr&iacute; gia đ&igrave;nh - Homecinema Projector - c&oacute; sự g&oacute;p mặt của rất nhiều sản phẩm đến từ c&aacute;c t&ecirc;n tuổi uy t&iacute;n như Canon, Panasonic, Sanyo, Sony, Toshiba hay Optoma với gi&aacute; b&aacute;n trung b&igrave;nh khoảng 20 - 40 triệu đồng. Tầm tiền n&agrave;y tương đương với một HDTV tốt, cỡ lớn, như Panasonic Plasma TH-P50S10S 50 inch gi&aacute; 28 triệu đồng hay Samsung LCD LA52B550 52 inch gi&aacute; 39,5 triệu đồng. Khi xem phim HD tr&ecirc;n những TV n&agrave;y, người xem kh&ocirc;ng thấy được sự kh&aacute;c biệt về kh&ocirc;ng gian, đơn giản vẫn l&agrave; xem TV. Với m&aacute;y chiếu, khả năng chiếu h&igrave;nh c&oacute; thể gấp cả 10 lần độ lớn m&agrave;n TV, l&ecirc;n đến cả 100 inch nhưng vẫn đảm bảo cho chất lượng h&igrave;nh ảnh tốt.&nbsp;<br /><br />M&aacute;y chiếu đ&aacute;p ứng tốt c&aacute;c yếu tố kỹ thuật cần thiết cho việc tr&igrave;nh chiếu phim HD. V&iacute; dụ, mẫu Sony VPL-BW7 gi&aacute; chỉ 18 triệu đồng, c&oacute; khả năng chiếu h&igrave;nh 40 - 300 inch, hỗ trợ độ ph&acirc;n giải HD 720p. M&aacute;y sử dụng đ&egrave;n chiếu 3LCD BrightEra độ s&aacute;ng 2.000 ANSIlumens, c&oacute; độ tương phản 1.000:1. Sony VPL-BW7 t&iacute;ch hợp sẵn ng&otilde; v&agrave;o HDMI gi&uacute;p kết nối với c&aacute;c thiết bị như đầu ph&aacute;t HD, đầu Blu-ray, PC hay m&aacute;y chơi game Play Station 3. B&ecirc;n cạnh đ&oacute;, nếu muốn xem TV qua m&aacute;y chiếu cũng ho&agrave;n to&agrave;n c&oacute; thể thực hiện dễ d&agrave;ng khi kết nối với PC hay laptop c&oacute; bộ thu truyền h&igrave;nh số t&iacute;ch hợp sẵn hoặc c&oacute; thể mua v&agrave; gắn ngo&agrave;i qua cổng USB.&nbsp;<br /><br /><img src="http://www.trungtammaychieu.com/data/upload_file/Image/products/HD_maychieu.jpg" alt="" />&nbsp;<br />Một khoảng tường rộng qu&eacute;t sơn trắng v&agrave; mịn trong ph&ograve;ng c&oacute; thể l&agrave; m&agrave;n chiếu tốt<br />(ảnh Saaria)<br /><br />Vấn đề ph&ocirc;ng chiếu cũng được đơn giản h&oacute;a, c&oacute; thể sử dụng c&aacute;c m&agrave;n ph&ocirc;ng chiếu chuy&ecirc;n dụng hay d&ugrave;ng ngay một khoảng tường rộng qu&eacute;t sơn trắng v&agrave; mịn trong ph&ograve;ng để l&agrave;m m&agrave;n chiếu khu&ocirc;n h&igrave;nh l&ecirc;n, vừa đảm bảo t&iacute;nh thẩm mỹ vừa kinh tế. L&ecirc;n đến tầm chuy&ecirc;n nghiệp, c&aacute;c tay chơi c&oacute; khả năng c&ograve;n dựng ri&ecirc;ng ph&ograve;ng chiếu chuy&ecirc;n dụng được thiết kế với điều kiện &aacute;nh s&aacute;ng ph&ugrave; hợp v&agrave; c&aacute;ch &acirc;m, cũng như trang bị c&aacute;c d&agrave;n &acirc;m thanh cao cấp để phục vụ tốt nhất cho nhu cầu xem phim tại gia thực như đi rạp.&nbsp;<br /><br />Ph&ograve;ng chiếu chuy&ecirc;n dụng rộng 40m2 bố tr&iacute; khoảng c&aacute;ch chỗ ngồi xem c&aacute;ch tường hoặc m&agrave;n chiếu 100 inch tầm 3 m&eacute;t l&agrave; lựa chọn ph&ugrave; hợp. Kh&ocirc;ng n&ecirc;n đặt m&aacute;y chiếu ngay tại ph&ograve;ng kh&aacute;ch v&igrave; thế sẽ l&agrave;m lo&atilde;ng kh&ocirc;ng kh&iacute; "xi-n&ecirc;" v&agrave; dễ bị yếu tố &aacute;nh &aacute;ng l&agrave;m ảnh hưởng tới chất lượng h&igrave;nh ảnh. Ngo&agrave;i ra t&iacute;nh cơ động cao của m&aacute;y chiếu cũng được đ&aacute;nh gi&aacute; cao, bởi với trọng lượng khoảng 3 kg, người chơi c&oacute; thể dễ d&agrave;ng di chuyển m&aacute;y đến vị tr&iacute; ph&ugrave; hợp hay tới nh&agrave; bạn b&egrave; để c&ugrave;ng thưởng thức phim.&nbsp;<br /><br />Nhưng một nhược điểm của m&aacute;y chiếu l&agrave; sau một thời gian thưởng thức phim HD, người d&ugrave;ng sẽ phải thay b&oacute;ng chiếu, trung b&igrave;nh l&agrave; từ 2-3 năm v&agrave; gi&aacute; tiền khoảng tr&ecirc;n 200 USD t&ugrave;y thuộc loại b&oacute;ng m&agrave; m&aacute;y sử dụng.</span></p>', '', NULL, 0, 2, '58450937_244.png', 2, '2014-11-07 14:20:00', '', 1),
(12, 'trinh-duyet-chrome-chinh-la-nguyen-nhan-hut-can-pin-laptop', 'vn', 'TRÌNH DUYỆT CHROME CHÍNH LÀ NGUYÊN NHÂN HÚT CẠN PIN LAPTOP', '', '<p><span style="font-family: times new roman,times; font-size: 16px;">&lsquo;Nếu muốn pin laptop c&oacute; thể sử dụng được l&acirc;u, h&atilde;y ngừng sử dụng tr&igrave;nh duyệt Chrome&rsquo;, đ&oacute; l&agrave; lời khuy&ecirc;n m&agrave; Forbes đưa ra sau khi ph&aacute;t hiện về độ &lsquo;ăn pin&rsquo; do tr&igrave;nh duyệt của Google g&acirc;y ra đối với laptop.</span></p>', '', '<p><span style="font-size: 16px; font-family: times new roman,times;">Cụ thể, nếu bạn bật tr&igrave;nh duyệt Chrome khi sử dụng m&aacute;y t&iacute;nh x&aacute;ch tay, pin của thiết bị sẽ nhanh cạn kiệt hơn 25% so với mức độ sử dụng th&ocirc;ng thường.</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;">Về măt kỹ thuật, xung clock trong hệ thống của c&aacute;c m&aacute;y t&iacute;nh Windows sẽ c&oacute; chu kỳ 15,6 phần ngh&igrave;n gi&acirc;y, điều n&agrave;y c&oacute; nghĩa l&agrave; cứ 1 gi&acirc;y, vi xử l&yacute; của m&aacute;y t&iacute;nh sẽ &laquo;&nbsp;thức dậy&nbsp;&raquo; v&agrave; tiến h&agrave;nh kiểm tra c&aacute;c t&aacute;c vụ 64 lần (chu kỳ kh&ocirc;ng đồng nghĩa với số lần &laquo;&nbsp;thức dậy&nbsp;&raquo; của m&aacute;y). Trong khi đ&oacute;, nếu c&oacute; sử dụng tr&igrave;nh duyệt Chrome, bộ vi xử l&yacute; sẽ tiến h&agrave;nh kiểm tra c&aacute;c t&aacute;c vụ tới 1000 lần mỗi gi&acirc;y.</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;">&nbsp;</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;"><img title="Tr&igrave;nh duyệt Chrome ch&iacute;nh l&agrave; nguy&ecirc;n nh&acirc;n h&uacute;t cạn pin laptop" src="http://cache.media.techz.vn/upload/2014/07/16/image-1405498700-google-chrome.jpg" alt="Tr&igrave;nh duyệt Chrome ch&iacute;nh l&agrave; nguy&ecirc;n nh&acirc;n h&uacute;t cạn pin laptop" /></span></p>\r\n<p><span style="font-family: times new roman,times; font-size: 16px;">&nbsp;</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;">T&oacute;m lại, thay v&igrave; l&agrave;m việc 64 lần/gi&acirc;y, vi xử l&yacute; của&nbsp;<a class="auto-link" href="http://www.techz.vn/C/laptop-360" target="_blank">laptop</a>&nbsp;bạn sẽ phải l&agrave;m việc n&agrave;y tới 1.000 lần/gi&acirc;y, v&agrave; việc hao hụt pin l&agrave; kh&ocirc;ng phải b&agrave;n c&atilde;i.</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;">Theo Microsoft, việc tăng tần số &laquo;&nbsp;thức dậy&nbsp;&laquo;&nbsp; v&agrave; kiểm tra c&ocirc;ng việc n&agrave;y l&ecirc;n 1000 lần/gi&acirc;y sẽ g&acirc;y tốn pin hơn 25%. Đ&acirc;y thực sự l&agrave; một vấn đề nghi&ecirc;m trọng bởi phần lờn người d&ugrave;ng kh&ocirc;ng quan t&acirc;m tới những con số tr&ecirc;n, m&agrave; họ chỉ nhận thấy pin của m&igrave;nh hao hụt một c&aacute;ch đ&aacute;ng kể.&nbsp;<a class="auto-link" href="http://www.techz.vn/topic/google-1.html" target="_blank">Google</a>&nbsp;chưa đưa ra lời b&igrave;nh luận hay giải th&iacute;ch n&agrave;o về vấn đề tr&ecirc;n, tuy nhi&ecirc;n nếu muốn sử dụng laptop được thời gian l&acirc;u hơn, h&atilde;y thử d&ugrave;ng một tr&igrave;nh duyệt kh&aacute;c.</span></p>', '', NULL, 0, 2, '1816109953_image-1405498700-google-chromee.jpg', 3, '2014-11-07 14:18:11', '', 1);
INSERT INTO `n_news` (`id`, `slug`, `lang`, `vn_name`, `en_name`, `vn_sapo`, `en_sapo`, `vn_details`, `en_details`, `popup`, `home`, `cid`, `avatar`, `position`, `date_created`, `keywords`, `status`) VALUES
(13, 'kinh-nghiem-mua-chuot-khong-day-cho-dan-van-phong', 'vn', 'KINH NGHIỆM MUA CHUỘT KHÔNG DÂY CHO DÂN VĂN PHÒNG', '', '<p><span style="font-size: 16px; font-family: times new roman,times;">Với c&aacute;c nh&acirc;n vi&ecirc;n c&ocirc;ng sở th&igrave; gần như 8 tiếng một ng&agrave;y l&agrave; họ phải b&aacute;m lấy chiếc m&aacute;y t&iacute;nh, v&agrave; một trong những vật dụng khiến họ &ldquo;chạm&rdquo; v&agrave;o nhiều nhất l&agrave; chuột m&aacute;y t&iacute;nh. Do đ&oacute; sự ổn</span><span style="font-size: 16px;"> định,</span><span style="font-size: 16px;">nha</span><span style="font-size: 16px;">nh</span><span style="font-size: 16px; font-family: times new roman,times;">&nbsp;nhạy của mouse sẽ gi&uacute;p &iacute;ch rất nhiều cho c&ocirc;ng việc văn ph&ograve;ng.</span></p>', '', '<p><span style="font-size: 16px; font-family: times new roman,times;">Ngo&agrave;i thiết kế trang nh&atilde;, lịch sự,&nbsp;chuột m&aacute;y t&iacute;nh&nbsp;ph&ugrave; hợp với d&acirc;n &ldquo;kẹp giấy&rdquo; cần phải đ&aacute;p ứng đầy đủ c&aacute;c nhu cầu cho c&ocirc;ng việc văn ph&ograve;ng.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Với c&aacute;c nh&acirc;n vi&ecirc;n c&ocirc;ng sở th&igrave; gần như 8 tiếng một ng&agrave;y l&agrave; họ phải b&aacute;m lấy chiếc m&aacute;y t&iacute;nh, v&agrave; một trong những vật dụng khiến họ &ldquo;chạm&rdquo; v&agrave;o nhiều nhất l&agrave; chuột m&aacute;y t&iacute;nh. Do đ&oacute; sự ổn định,nhanh&nbsp;nhạy của mouse sẽ gi&uacute;p &iacute;ch rất nhiều cho c&ocirc;ng việc văn ph&ograve;ng.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Nhưng kh&ocirc;ng phải ai cũng biết c&aacute;ch chọn mua chuột vừa đẹp, vừa tiện dụng, vừa hiệu quả cho c&ocirc;ng việc của m&igrave;nh. B&agrave;i viết n&agrave;y xin giới thiệu đến&nbsp;bạn đọc&nbsp;một số kinh nghiệm chọn mua chuột như &yacute;.</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;"><strong>&nbsp;</strong></span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;"><strong>C&oacute; bao nhi&ecirc;u loại chuột?</strong></span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">X&eacute;t về cơ chế cảm ứng, c&oacute; tất cả 3 loại chuột. Đ&oacute; l&agrave; chuột bi, chuột quang v&agrave; chuột laser. Mỗi loại chuột lại c&oacute; những&nbsp;ưu điểm&nbsp;v&agrave;&nbsp;nhược điểm&nbsp;ri&ecirc;ng.</span></p>\r\n<p style="text-align: center;"><span style="font-size: 16px; font-family: times new roman,times;"><img src="../upload/hungnam (2).jpg" alt="" /></span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;">&nbsp;</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;">Chuột laser c&oacute; thiết kế đẹp, đồng thời c&oacute; tốc độ v&agrave; khả năng xử l&yacute; tốt hơn hẳn so với hai đồng nghiệp kể tr&ecirc;n. Tuy nhi&ecirc;n gi&aacute; chuột kh&ocirc;ng d&acirc;y người sử dụng sẽ phải bỏ ra từ 200 ng&agrave;n đến cả triệu đồng để sở hữu thiết bị hiện đại n&agrave;y. Loại chuột n&agrave;y thường chỉ d&agrave;nh cho những nh&acirc;n vi&ecirc;n xử l&yacute; đồ hoạ hoặc game thủ.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Chọn kiểu kết nối</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">C&oacute; hai kiểu k&ecirc;t nối d&agrave;nh cho chuột v&agrave; m&aacute;y t&iacute;nh: kiểu c&oacute; d&acirc;y v&agrave; kh&ocirc;ng d&acirc;y. Chuột c&oacute; d&acirc;y sẽ cho t&iacute;n hiệu ổn định, kh&ocirc;ng bị gi&aacute;n đoạn nhưng lại bị &ldquo;b&oacute; buộc&rdquo; khoảng c&aacute;ch của người d&ugrave;ng với m&aacute;y t&iacute;nh bằng giới hạn của d&acirc;y dẫn.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Nhược điểm của chuột c&oacute; d&acirc;y cũng ch&iacute;nh l&agrave; ưu điểm của c&aacute;c thiết bị kh&ocirc;ng d&acirc;y. Mặc d&ugrave; rất tiện dụng nhưng c&aacute;c thiết bị kh&ocirc;ng d&acirc;y thường được &ldquo;nu&ocirc;i&rdquo; bằng một vi&ecirc;n pin l&agrave;m nguồn điện n&ecirc;n thường nặng hơn so với chuột c&oacute; d&acirc;y.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Chuẩn giao tiếp của chuột</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Với một chiếc&nbsp;m&aacute;y t&iacute;nh để b&agrave;n, cổng giao tiếp PS/2 từ l&acirc;u đ&atilde; lu&ocirc;n l&agrave; một lựa chọn &ldquo;chuẩn mực&rdquo;.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Một l&agrave; bởi tr&ecirc;n c&aacute;c loại mainboard đời cũ, l&uacute;c n&agrave;o cũng c&oacute; một cổng PS/2 m&agrave;u xanh l&aacute; v&agrave; m&agrave;u t&iacute;m d&agrave;nh ri&ecirc;ng cho chuột v&agrave; b&agrave;n ph&iacute;m. Hai l&agrave; tốc độ kết nối nhanh v&agrave; việc để hệ thống nhận ra thiết bị nhanh ch&oacute;ng m&agrave; kh&ocirc;ng tốn thời gian c&agrave;i đặt driver.</span></p>\r\n<p style="text-align: center;"><span style="font-size: 16px; font-family: times new roman,times;"><img src="../upload/hungnam 3.jpg" alt="" /></span></p>\r\n<p style="text-align: left;"><span style="font-size: 16px; font-family: times new roman,times;">&nbsp;</span></p>\r\n<p><span style="font-size: 16px; font-family: times new roman,times;">Hiện giờ rất nhiều nh&agrave; sản xuất lại ưa chuộng chuẩn giao tiếp USB v&agrave; Wireless hơn cả. Mặc d&ugrave; vậy, cả hai giao thức n&agrave;y đều khiến người d&ugrave;ng phải chuẩn bị pin đầy đủ đ&ecirc; thiết bị của m&igrave;nh lu&ocirc;n hoạt động tốt.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Mặc d&ugrave; vậy, n&oacute; lại kh&aacute; thuận tiện v&igrave; người d&ugrave;ng c&oacute; thể mang v&aacute;c chuột, b&agrave;n ph&iacute;m qua lại nhiều m&aacute;y t&iacute;nh, nhất l&agrave; chuyển đổi sang một chiếc laptop để khỏi &ldquo;bỡ ngỡ&rdquo; với ph&iacute;m v&agrave; chuột cảm ứng của loại m&aacute;y n&agrave;y.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Một số lưu &yacute; cần thiết khi<a href="../" target="_blank"> mua chuột</a></span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Khi mua chuột, bạn cũng n&ecirc;n lựa chọn kiểu d&aacute;ng chuột thật chuẩn với k&iacute;ch thước b&agrave;n tay nhằm tr&aacute;nh t&igrave;nh trạng đau nhức, kh&oacute; chịu do sử dụng chuột kh&ocirc;ng hợp l&yacute; trong thời gian d&agrave;i.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Bạn cần ch&uacute; &yacute; đến độ nhạy của ph&iacute;m tr&aacute;i phải v&agrave; n&uacute;t cuộn ở giữa. Kh&ocirc;ng n&ecirc;n chọn chuột c&oacute; n&uacute;t nhạy qu&aacute; v&igrave; dễ khiến bạn sai thao t&aacute;c khi sử dụng.&nbsp;</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Th&ecirc;m nữa l&agrave; h&atilde;y chọn cho ch&uacute; chuột của m&igrave;nh một b&agrave;n di vừa vặn. C&oacute; thể n&oacute;i b&agrave;n di chuột m&aacute;y t&iacute;nh cũng giống như đường để cho &ocirc;-t&ocirc; chạy. Hiện nay một v&agrave;i b&agrave;n di chuột c&ograve;n c&oacute; một miếng đệm ở phần đặt cổ tay cho người d&ugrave;ng đỡ mỏi. Đ&acirc;y l&agrave; một thiết bị kh&aacute; tiện dụng.</span><br /><br /><span style="font-size: 16px; font-family: times new roman,times;">Chuột kh&ocirc;ng d&acirc;y l&agrave; một thiết bị cơ bản v&agrave; phần lớn hệ điều h&agrave;nh đều c&agrave;i đặt sẵn tr&igrave;nh điều khiển. Tuy nhi&ecirc;n, với nh&oacute;m sản phẩm sử dụng c&aacute;c t&iacute;nh năng mở rộng như chuột c&oacute; nhiều n&uacute;t bấm phụ, chuột d&agrave;nh ri&ecirc;ng cho game thủ, chuột d&agrave;nh ri&ecirc;ng cho internet&hellip; th&igrave; cần phải thiết lập driver để hệ thống nhận diện được ch&uacute;ng v&agrave; l&agrave;m việc ch&iacute;nh x&aacute;c.</span></p>', '', NULL, 1, 2, '886611737_apoint-t-66.jpg', 4, '2014-11-05 11:56:29', '', 1),
(14, 'samsung-ngung-ban-may-tinh-xach-tay-tai-chau-au', 'vn', 'SAMSUNG NGỪNG BÁN MÁY TÍNH XÁCH TAY TẠI CHÂU ÂU', '', '<p><span style="font-size: 14px;">Trong b&agrave;i ph&aacute;t biểu với một trang blog của Đức, <em>WP Area</em>, một ph&aacute;t ng&ocirc;n vi&ecirc;n của Samsung cũng cho biết đ&atilde; r&uacute;t to&agrave;n bộ k&ecirc;nh b&aacute;n h&agrave;ng m&aacute;y t&iacute;nh x&aacute;ch tay tại quốc gia n&agrave;y. Quyết định kh&aacute; bất ngờ từ nh&agrave; sản xuất H&agrave;n Quốc bao gồm cả c&aacute;c d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay chạy Windows lẫn Chromebook. <br /></span></p>', '', '<p><span style="font-size: 14px;">Sau Sony, Samsung cũng đ&atilde; c&oacute; những động th&aacute;i cho thấy muốn rời bỏ khỏi thị trường m&aacute;y t&iacute;nh x&aacute;ch tay đang v&agrave;o giai đoạn tho&aacute;i tr&agrave;o. </span></p>\r\n<p style="text-align: center;"><span style="font-size: 14px;"><img src="../upload/HUNG NAM.jpg" alt="" /></span></p>\r\n<p style="text-align: center;"><span style="font-size: 14px;">Samsung sẽ tập trung v&agrave;o mảng điện thoại di động v&agrave; thiết bị gia dụng. </span></p>\r\n<p style="text-align: center;"><span style="font-size: 14px;">&nbsp;</span></p>\r\n<p class="Normal"><span style="font-size: 14px;">Samsung sẽ ngừng b&aacute;n m&aacute;y t&iacute;nh x&aacute;ch tay tại hầu hết c&aacute;c thị trường lớn ở ch&acirc;u &Acirc;u, theo th&ocirc;ng tin từ <em>PC Advisor</em>. Trong b&agrave;i ph&aacute;t biểu với một trang blog của Đức, </span><span style="font-size: 14px;"><em>WP Area</em>,</span><span style="font-size: 14px;"> một ph&aacute;t ng&ocirc;n vi&ecirc;n của Samsung cũng cho biết đ&atilde; r&uacute;t to&agrave;n bộ k&ecirc;nh b&aacute;n h&agrave;ng m&aacute;y t&iacute;nh x&aacute;ch tay tại quốc gia n&agrave;y. Quyết định kh&aacute; bất ngờ từ nh&agrave; sản xuất H&agrave;n Quốc bao gồm cả c&aacute;c d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay chạy Windows lẫn Chromebook.&nbsp;</span></p>\r\n<p class="Normal"><span style="font-size: 14px;">&nbsp;</span></p>\r\n<p class="Normal"><span style="font-size: 14px;">Tuy nhi&ecirc;n, Samsung cũng khẳng định động th&aacute;i n&oacute;i tr&ecirc;n kh&ocirc;ng mang ảnh hưởng tới tương lai của nhiều thị trường kh&aacute;c tr&ecirc;n thế giới. H&atilde;ng cũng để ng&otilde; khả năng trở lại d&ugrave; kh&aacute; d&egrave; dặt.&nbsp;</span></p>\r\n<p class="Normal"><span style="font-size: 14px;">&nbsp;</span></p>\r\n<p class="Normal"><span style="font-size: 14px;">Quyết định của Samsung g&acirc;y nhiều tiếc nuối cho l&agrave;ng m&aacute;y t&iacute;nh x&aacute;ch tay nhưng thực tế kh&ocirc;ng phải qu&aacute; bất ngờ. Trước đ&oacute;, Sony đ&atilde; b&aacute;n bộ phận m&aacute;y t&iacute;nh x&aacute;ch tay Vaio của m&igrave;nh v&agrave;o đầu năm trong khi Toshiba cũng c&ocirc;ng bố kế hoạch giảm c&aacute;c hoạt động li&ecirc;n quan đến m&aacute;y t&iacute;nh trong lĩnh vực ti&ecirc;u d&ugrave;ng phổ th&ocirc;ng.&nbsp;</span></p>\r\n<p class="Normal"><span style="font-size: 14px;">&nbsp;</span></p>\r\n<p class="Normal"><span style="font-size: 14px;">Tại Việt Nam, Samsung từ l&acirc;u cũng kh&ocirc;ng đưa ra th&ecirc;m model laptop n&agrave;o mới v&agrave; cũng vắng b&oacute;ng tr&ecirc;n kệ của nhiều hệ thống si&ecirc;u thị điện m&aacute;y hay cửa h&agrave;ng m&aacute;y t&iacute;nh. Tuy nhi&ecirc;n, h&atilde;ng chưa đưa ra th&ocirc;ng c&aacute;o ch&iacute;nh thức về t&igrave;nh h&igrave;nh kinh doanh n&agrave;y. Trong khi đ&oacute;, Sony đ&atilde; rời bỏ hẳn thị trường Việt Nam c&ograve;n Toshiba Việt Nam cũng kh&ocirc;ng c&ograve;n trực tiếp quản l&yacute; việc b&aacute;n v&agrave; nhập khẩu m&aacute;y t&iacute;nh trong nước. </span></p>', '', NULL, 0, 13, '104785438_hung-namM.jpg', 5, '2014-10-31 01:31:01', '', 0),
(15, 'chip-viet-nam-ra-thi-truong', 'vn', 'CHIP VIỆT NAM RA THỊ TRƯỜNG', '', '<h3>Ng&agrave;y 3/10, Trung t&acirc;m nghi&ecirc;n cứu v&agrave; đ&agrave;o tạo thiết kế vi mạch (ICDREC) - ĐH Quốc gia TP HCM c&ocirc;ng bố thương mại h&oacute;a sản phẩm vi xử l&iacute; SG8V1 c&ugrave;ng bộ KIT ph&aacute;t triển v&agrave; gi&aacute;o dục DE-SG8V1 do đơn vị n&agrave;y nghi&ecirc;n cứu, sản xuất.</h3>', '', '<h3><span style="font-size: 14px; color: #333333;">Ng&agrave;y 3/10, Trung t&acirc;m nghi&ecirc;n cứu v&agrave; đ&agrave;o tạo thiết kế vi mạch (ICDREC) - ĐH Quốc gia TP HCM c&ocirc;ng bố thương mại h&oacute;a sản phẩm vi xử l&iacute; SG8V1 c&ugrave;ng bộ KIT ph&aacute;t triển v&agrave; gi&aacute;o dục DE-SG8V1 do đơn vị n&agrave;y nghi&ecirc;n cứu, sản xuất.</span></h3>\r\n<p><span style="font-size: 14px;">&Ocirc;ng Ng&ocirc; Đức Ho&agrave;ng, Gi&aacute;m đốc ICDREC, cho biết sản phẩm chip do người Việt Nam nghi&ecirc;n cứu v&agrave; ph&aacute;t triển n&agrave;y ho&agrave;n to&agrave;n c&oacute; khả năng cạnh tranh về t&iacute;nh năng v&agrave; gi&aacute; b&aacute;n rẻ hơn 30% so với c&aacute;c chip ngoại nhập. Trong thời gian qua, chip thương mại SG8V1 đ&atilde; được ICDREC sử dụng tr&ecirc;n nhiều d&ograve;ng sản phẩm thương mại tr&ecirc;n thị trường, như thiết bị gi&aacute;m s&aacute;t h&agrave;nh tr&igrave;nh xe &ocirc; t&ocirc;, hộp đen xe m&aacute;y, kh&oacute;a điện tử gi&aacute;m s&aacute;t quản l&iacute; container, điện kế điện tử 1 pha, modem thu thập dữ liệu điện kế từ xa.</span></p>\r\n<p><span style="font-size: 14px;">Trong Q4/2014, h&agrave;ng loạt sản phẩm ứng dụng SG8V1 kh&aacute;c sẽ được tung ra thị trường, như KIT ph&aacute;t triển v&agrave; gi&aacute;o dục, thiết bị gi&aacute;m s&aacute;t container lạnh, đầu đọc RFID HF/UHF, điện kế điện tử 3 pha, thiết bị đọc dữ liệu điện kế cầm tay, thiết bị quản l&iacute; v&agrave; định vị nguồn ph&oacute;ng xạ.</span></p>', '', NULL, 1, 21, '1432651302_hnam1-copyy.jpg', 6, '2014-10-31 01:26:11', '', 0),
(16, 'giai-phap-1', 'vn', 'giải pháp 1', '', '<p>tom tat</p>', '', '<p>noi dung</p>', '', NULL, 0, 13, '1091089979_10378249_761143017283266_8182854592948285678_nn.png', 1, '2014-10-31 15:24:08', '', 0),
(17, '-toshiba', 'vn', ' TOSHIBA', '', '<table class="Partner">\r\n<tbody>\r\n<tr>\r\n<td><strong>Địa chỉ:</strong></td>\r\n<td colspan="4">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Điện thoại:</strong></td>\r\n<td>&nbsp;</td>\r\n<td style="width: 20px;">&nbsp;</td>\r\n<td style="width: 60px;"><strong> Fax:</strong></td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Email:</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td><strong> Website:</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', '', NULL, 0, 17, '666186347_toshibaa.png', 1, '2014-10-31 16:03:55', '', 0),
(18, '-toshiba', 'vn', ' TOSHIBA', '', '<table class="Partner">\r\n<tbody>\r\n<tr>\r\n<td><strong>Địa chỉ:</strong></td>\r\n<td colspan="4">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Điện thoại:</strong></td>\r\n<td>&nbsp;</td>\r\n<td style="width: 20px;">&nbsp;</td>\r\n<td style="width: 60px;"><strong> Fax:</strong></td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Email:</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td><strong> Website:</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', '', NULL, 0, 17, '1325990019_toshibaa.png', 1, '2014-10-31 20:51:02', '', 1),
(19, 'bang-gia-may-chieu-sony', 'vn', 'Bảng Giá Máy Chiếu Sony', '', '<p>bảng b&aacute;o gi&aacute; m&aacute;y chiếu sony</p>', '', '<p><iframe style="border: none;" src="http://docs.google.com/viewer?url=http%3A%2F%2Fhungnamcomputer.com.vn%2Fupload%2FBANG%20BAO%20GIA%20MAY%20CHIEU%20SONY%202014.xls&amp;embedded=true" width="750" height="780"></iframe></p>', '', NULL, 0, 19, '1875643601_may-chieu-sonyy.jpg', 1, '2014-11-07 13:34:38', '', 1),
(20, 'sony', 'vn', 'Sony', '', '<table class="Partner">\r\n<tbody>\r\n<tr>\r\n<td><strong>Địa chỉ:</strong></td>\r\n<td colspan="4">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Điện thoại:</strong></td>\r\n<td>&nbsp;</td>\r\n<td style="width: 20px;">&nbsp;</td>\r\n<td style="width: 60px;"><strong> Fax:</strong></td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Email:</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td><strong> Website:</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', '', NULL, 0, 17, '1994314665_sonyy.jpg', 1, '2014-11-04 02:01:20', '', 1),
(21, 'sua-chua-laptop-gia-re', 'vn', 'Sửa Chữa Laptop Giá Rẻ', '', '<p>Laptop l&agrave; một trong những thiết bị bất ly th&acirc;n h&agrave;ng ng&agrave;y của bạn, bỗng nhi&ecirc;n một ng&agrave;y n&oacute; vận h&agrave;nh kh&ocirc;ng ổn định, hoặc ph&aacute;t sinh nhiều trục trặc m&agrave; bạn kh&ocirc;ng biết nguy&ecirc;n nh&acirc;n, bạn đ&atilde; mang đến nhiều trung t&acirc;m để sửa chữa laptop của m&igrave;nh nhưng vẫn kh&ocirc;ng khắc phục được sự cố. Khi đ&oacute;, bạn h&atilde;y gọi đến dịch vụ sửa sửa laptop của <strong>Hưng Nam</strong>, với đội ngũ nh&acirc;n vi&ecirc;n gi&agrave;u kinh nghiệm, nhiệt t&igrave;nh, chu đ&aacute;o kết hợp c&ugrave;ng c&aacute;c trang thiết bị sửa chữa hiện đại, c&ocirc;ng nghệ cao ch&uacute;ng t&ocirc;i lu&ocirc;n mang đến sự h&agrave;i l&ograve;ng tối đa cho Qu&iacute; kh&aacute;ch h&agrave;ng.</p>', '', '<h2 style="color: #ff6600; font-size: 18px;">Dịch Vụ Sửa Chữa Laptop Chuy&ecirc;n Nghiệp - Uy T&iacute;n - Tận T&acirc;m</h2>\r\n<h3 style="font-size: 16px; padding-left: 8px; color: #3399ff; margin-bottom: 10px;">Cam kết của dịch vụ sửa chữa laptop HƯNG NAM</h3>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Kiểm tra, đ&aacute;nh gi&aacute; kỹ lưỡng, đo&aacute;n đ&uacute;ng bệnh b&aacute;o đ&uacute;ng gi&aacute;.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Tất cả c&aacute;c thiết bị đều được kiểm tra trước khi nhập kho v&agrave; c&oacute; d&aacute;n tem ni&ecirc;m phong v&agrave; chữ k&yacute; của kh&aacute;ch h&agrave;ng tr&ecirc;n sản phẩm tr&aacute;nh t&igrave;nh trạng nhầm lẫn, trao đổi thiết bị của kh&aacute;ch h&agrave;ng.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">T&igrave;nh trạng m&aacute;y, phương hướng giải quyết v&agrave; chi ph&iacute; khắc phục sự cố được kiểm tra ngay v&agrave; th&ocirc;ng b&aacute;o lại cho Qu&yacute; kh&aacute;ch h&agrave;ng kh&ocirc;ng qu&aacute; 24h trước khi tiến h&agrave;nh sửa chữa laptop</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Kh&ocirc;ng thay đổi bất kỳ linh kiện n&agrave;o khi chưa c&oacute; sự đồng &yacute; của kh&aacute;ch h&agrave;ng.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Thời gian khắc phục m&aacute;y kh&ocirc;ng qu&aacute; 03 ng&agrave;y kể từ ng&agrave;y kh&aacute;ch h&agrave;ng được nhận th&ocirc;ng b&aacute;o lỗi về sản phẩm của m&igrave;nh.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Cam kết bảo mật dữ liệu trong m&aacute;y của Qu&iacute; kh&aacute;ch khi đến sửa chữa laptop</div>\r\n<h4 align="center"><img title="Khắc phục mọi sựu cố" src="http://hungthinhco.com.vn/image/data/Dich-vu/sua-chua-laptop/sua-chua-laptop-htc-2.jpg" alt="sua-chua-laptop-gia-re" border="0" /></h4>\r\n<div style="color: #a9a9a9; font-size: 12px; margin-bottom: 10px;" align="center">Khắc phục mọi sự cố một c&aacute;ch nhanh ch&oacute;ng</div>\r\n<h3 style="font-size: 16px; padding-left: 8px; color: #3399ff; margin-bottom: 10px;">Qui tr&igrave;nh sửa chữa Laptop tại HƯNG NAM</h3>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 1 :</span> </strong>Tiếp nhận th&ocirc;ng tin từ kh&aacute;ch h&agrave;ng<br /> Khi c&oacute; hư hỏng về laptop cần được sữa chữa qu&yacute; kh&aacute;ch gửi th&ocirc;ng tin về laptop đến ch&uacute;ng t&ocirc;i th&ocirc;ng qua email hoặc điện thoại trực tiếp đến ph&ograve;ng dịch vụ v&agrave; chăm s&oacute;c kh&aacute;ch h&agrave;ng</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 2 : </span></strong>Tiếp nhận sản phẩm<br /> Qu&iacute; kh&aacute;ch c&oacute; thể mang m&aacute;y trực tiếp đến HƯNG NAM để sửa chữa laptop, hoặc gọi điện cho ch&uacute;ng t&ocirc;i, sẽ c&oacute; nh&acirc;n vi&ecirc;n đến sửa chữa trực tiếp tại nơi của Qu&iacute; kh&aacute;ch, nếu hư hỏng nặng th&igrave; nh&acirc;n vi&ecirc;n sẽ l&agrave;m bi&ecirc;n nhận v&agrave; mang m&aacute;y về c&ocirc;ng ty để tiến h&agrave;nh sửa chữa.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 3: </span></strong>Th&ocirc;ng b&aacute;o t&igrave;nh trạng thiết bị<br /> <span style="color: #ff6600;">HƯNG NAM</span> sẽ gọi điện cho qu&iacute; kh&aacute;ch để th&ocirc;ng b&aacute;o t&igrave;nh trạng hư hỏng, c&aacute;ch khắc phục v&agrave; gi&aacute; cả.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 4:</span> </strong>Tiến h&agrave;nh sửa chữa latop</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 5: </span></strong>B&agrave;n giao thiết bị v&agrave; phiếu bảo h&agrave;nh cho qu&iacute; kh&aacute;ch</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 6: </span></strong>Chăm s&oacute;c kh&aacute;ch h&agrave;ng sau sữa chữa v&agrave; cập nhật t&igrave;nh trạng thiết bị định kỳ h&agrave;ng th&aacute;ng.</div>\r\n<h4 align="center"><img title="Qui tr&igrave;nh sửa chữa chuy&ecirc;n nghiệp" src="http://hungthinhco.com.vn/image/data/Dich-vu/sua-chua-laptop/sua-chua-laptop-htc-1.jpg" alt="sua-chua-laptop-chuyen-nghiep" width="400" height="350" border="0" /></h4>\r\n<div style="color: #a9a9a9; font-size: 12px; margin-bottom: 10px;" align="center">Qui tr&igrave;nh sửa chữa chuy&ecirc;n nghiệp chu đ&aacute;o</div>\r\n<div style="font-size: 16px; margin-bottom: 10px; margin-top: 10px;">Mọi chi tiết xin vui l&ograve;ng li&ecirc;n hệ</div>\r\n<div style="text-align: center; font-size: 16px; color: #ff6600;"><span style="color: #03f;">Ph&ograve;ng Dịch Vụ V&agrave; Chăm S&oacute;c Kh&aacute;ch H&agrave;ng</span><br /> Điện thoại: ( 08).36030375<br /> </div>', '', NULL, 0, 21, '976334951_11.png', 1, '2014-10-31 21:11:22', '', 1),
(22, 'giai-phap-cho-viec-ngoi-may-tinh-qua-lau-', 'vn', 'Giải pháp cho việc ngồi máy tính quá lâu ', '', '<p>Việc sử dụng v&agrave; l&agrave;m việc tr&ecirc;n m&aacute;y t&iacute;nh qu&aacute; l&acirc;u sẽ c&oacute; nhiều t&aacute;c hại đến cơ thể của bạn. Tuy nhi&ecirc;n, nếu bạn c&oacute; thể &aacute;p dụng một v&agrave;i phương ph&aacute;p sau đ&acirc;y c&oacute; thể phần n&agrave;o gi&uacute;p bạn giảm được c&aacute;c t&aacute;c hại từ <em>"căn bệnh nghề nghiệp"</em> đồng thời gi&uacute;p c&ocirc;ng việc của bạn được hiệu quả hơn.</p>', '', '<h3>Ngồi đ&uacute;ng tư thế khi sử dụng m&aacute;y t&iacute;nh</h3>\r\n<p>T&ugrave;y theo v&oacute;c d&aacute;ng của người, bạn cần điều chỉnh chiều cao của ghế sao cho ph&ugrave; hợp với tư thế "chuẩn" để tr&aacute;nh c&aacute;c vấn đề li&ecirc;n quan đến mắt v&agrave; cột sống.</p>\r\n<p style="text-align: center;"><img src="http://topthuthuat.com/images/thu_thuat/ngoi_may_tinh_lau/tac_hai_ngoi_may_tinh_qua_lau_5.png" alt="tac hai ngoi may tinh qua lau" /></p>\r\n<p style="text-align: center;">Tư thế ngồi chuẩn khi l&agrave;m việc m&aacute;y t&iacute;nh</p>\r\n<p>Tư thế tay: Lu&ocirc;n giữ c&aacute;nh tay vu&ocirc;ng g&oacute;c tại khuỷu&nbsp;tay khi bạn&nbsp;đ&aacute;nh m&aacute;y hoặc l&agrave;m c&aacute;c thao t&aacute;c kh&aacute;c tr&ecirc;n b&agrave;n ph&iacute;m hoặc chuột m&aacute;y t&iacute;nh.</p>\r\n<p>Tr&aacute;nh t&igrave; đ&egrave; b&agrave;n tay l&ecirc;n b&agrave;n ph&iacute;m hoặc chuột đồng thời kh&ocirc;ng d&ugrave;ng qu&aacute; nhiều lực để g&otilde; hoặc nhấn chuột.</p>\r\n<p style="text-align: center;"><img src="http://topthuthuat.com/images/thu_thuat/ngoi_may_tinh_lau/tac_hai_ngoi_may_tinh_qua_lau_2.png" alt="tac hai ngoi may tinh qua lau" /></p>\r\n<h3>Giải lao cho đ&ocirc;i mắt</h3>\r\n<p>Việc tập trung qu&aacute; cao độ v&agrave;o m&agrave;n h&igrave;nh sẽ l&agrave;m cho mắt bạn nhanh ch&oacute;ng mờ v&agrave; dần giảm thị lực. Ch&iacute;nh v&igrave; v&acirc;y, bạn cần c&oacute; thời gian nghĩ ngơi hợp l&yacute; cho mắt.</p>\r\n<p style="text-align: center;"><img src="http://topthuthuat.com/images/thu_thuat/ngoi_may_tinh_lau/tac_hai_ngoi_may_tinh_qua_lau.jpg" alt="tac hai ngoi may tinh qua lau" width="300" height="225" /></p>\r\n<p>Cụ thể trong khoảng thời gian 30 - 45 ph&uacute;t, bạn n&ecirc;n c&oacute; những h&agrave;nh động để thư giản mắt như:&nbsp;</p>\r\n<ul>\r\n<li>Nh&igrave;n thẳng, sau đ&oacute; nh&igrave;n phải, tr&aacute;i, nh&igrave;n l&ecirc;n tr&ecirc;n, nh&igrave;n xuống dưới cũng 10 gi&acirc;y.</li>\r\n<li>Nhắm mắt v&agrave; lấy hai tay xoa nh&atilde;n cầu (10 gi&acirc;y).</li>\r\n<li>Nheo mắt lại rồi mở mắt nhanh hơn trong 10 gi&acirc;y.</li>\r\n</ul>\r\n<p><strong><span style="text-decoration: underline;">Lưu &yacute;:</span></strong> Bạn n&ecirc;n chỉnh cường độ s&aacute;ng m&agrave;n h&igrave;nh sao cho mắt c&oacute; cảm gi&aacute;c dễ chịu tr&aacute;nh để cường độ &aacute;nh s&aacute;ng qu&aacute; cao.</p>\r\n<h2>Thực hiện c&aacute;c thao t&aacute;c thể dục đơn giản</h2>\r\n<p><img src="http://topthuthuat.com/images/thu_thuat/ngoi_may_tinh_lau/tac_hai_ngoi_may_tinh_qua_lau_1.jpg" alt="tac hai ngoi may tinh qua lau" /></p>\r\n<h2>Sử dụng phần mềm nhắc nhở giải lao</h2>\r\n<p>Nếu bạn kh&ocirc;ng thể chủ động được thời gian thể dục hoặc giải lao cho mắt cũng như cơ thể, bạn c&oacute; thể sử dụng c&aacute;c phần mềm nhắc nhở giải lao.</p>\r\n<p>Với phần mềm n&agrave;y, bạn c&oacute; thể định sẵn khoảng thời gian cụ thể (30, 45, 60, 1g30p) khi đ&oacute; phần mềm sẽ hiện thị th&ocirc;ng b&aacute;o l&ecirc;n m&agrave;n h&igrave;nh. V&agrave; đ&oacute; ch&iacute;nh l&agrave; l&uacute;c bạn n&ecirc;n thực hiện v&agrave;i thao t&aacute;c thể dục, giải lao cho đ&ocirc;i mắt hoặc những việc kh&aacute;c c&oacute; thể gi&uacute;p bạn thư giản.</p>\r\n<h2>T&oacute;m lại</h2>\r\n<p>Việc sử dụng v&agrave; l&agrave;m việc tr&ecirc;n m&aacute;y t&iacute;nh qu&aacute; l&acirc;u c&oacute; ảnh hưởng rất lớn đối với sức khỏe của bạn về sau v&igrave; vậy khi l&agrave;m việc với m&aacute;y t&iacute;nh, bạn cần c&oacute; được những khoảng thời giản nghỉ ngơi, thể dục hợp l&yacute;. H&agrave;nh động n&agrave;y kh&ocirc;ng những c&oacute; thể gi&uacute;p sức khỏe bạn được tốt hơn m&agrave; c&ograve;n l&agrave;m tăng hiệu quả c&ocirc;ng việc của bạn.</p>\r\n<p>Hy vọng với những th&ocirc;ng tin tổng hợp tr&ecirc;n c&oacute; thể phần n&agrave;o gi&uacute;p bạn c&oacute; được một c&ocirc;ng việc v&agrave; một sức khỏe tối ưu hơn.</p>', '', NULL, 0, 13, '2069235280_111.jpg', 1, '2014-10-31 21:31:14', '', 1),
(23, 'chinh-sach-bao-hanh', 'vn', 'Chính sách bảo hành', '', '<p>Qu&yacute; kh&aacute;ch phải kiểm tra h&agrave;ng kỹ trước khi nhận h&agrave;ng. H&agrave;ng được giao ho&agrave;n to&agrave;n mới 100% v&agrave; c&oacute; d&aacute;n tem bảo h&agrave;nh của Cty. Tr&ecirc;n tem c&oacute; ghi r&otilde; ng&agrave;y th&aacute;ng năm v&agrave; thời hạn bảo h&agrave;nh theo đ&uacute;ng quy định bảo h&agrave;nh của nh&agrave; sản xuất.</p>', '', '<p>I. Đối với tất cả c&aacute;c linh kiện thiết bị mua rời</p>\r\n<p>&nbsp;</p>\r\n<p>Qu&yacute; kh&aacute;ch phải kiểm tra h&agrave;ng kỹ trước khi nhận h&agrave;ng. H&agrave;ng được giao ho&agrave;n to&agrave;n mới 100% v&agrave; c&oacute; d&aacute;n tem bảo h&agrave;nh của Cty. Tr&ecirc;n tem c&oacute; ghi r&otilde; ng&agrave;y th&aacute;ng năm v&agrave; thời hạn bảo h&agrave;nh theo đ&uacute;ng quy định bảo h&agrave;nh của nh&agrave; sản xuất.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>1. Điều kiện bảo h&agrave;nh:</strong></p>\r\n<ul>\r\n<li>Tất cả c&aacute;c linh kiện, thiết bị phải c&oacute; tem bảo h&agrave;nh của Cty HƯNG NAM v&agrave; tem phải c&ograve;n trong thời hạn bảo h&agrave;nh.</li>\r\n<li>Phiếu bảo h&agrave;nh (đối với c&aacute;c thiết bị, linh kiện c&oacute; k&egrave;m phiếu bảo h&agrave;nh), tem bảo h&agrave;nh, m&atilde; vạch seri number phải c&ograve;n nguy&ecirc;n vein, kh&ocirc;ng c&oacute; dấu hiệu cạo sửa, tẩy xo&aacute; hay bị r&aacute;ch mờ.</li>\r\n<li>Hư hỏng được x&aacute;c định do lỗi kỹ thuật hoặc lỗi của nh&agrave; sản xuất.</li>\r\n</ul>\r\n<p><strong>2. Điều kiện kh&ocirc;ng bảo h&agrave;nh:</strong></p>\r\n<ul>\r\n<li>Thiết bị do va chạm hoặc đ&atilde; bị rơi rớt, bể mẻ, m&oacute;p m&eacute;o, biến dạng, trầy xước, rỉ x&eacute;t, x&igrave; hoặc ph&ugrave; tụ &hellip;</li>\r\n<li>Thiết bị c&oacute; dấu hiệu ch&aacute;y nổ, chuột bọ, c&ocirc;n tr&ugrave;ng x&acirc;m nhập hoặc đặt trong m&ocirc;i trường ẩm ướt.</li>\r\n<li>Hư hỏng do thi&ecirc;n tai hoả hoạn, sử dụng nguồn điện kh&ocirc;ng ổn định hoặc do v&acirc;n chuyển kh&ocirc;ng đ&uacute;ng quy c&aacute;ch.</li>\r\n<li>Kh&ocirc;ng bảo h&agrave;nh c&aacute;c thiết bị phụ kiện như: &hellip;&hellip;</li>\r\n<li>Kh&ocirc;ng đảm bảo dữ liệu khi bảo h&agrave;nh thiết bị.</li>\r\n</ul>\r\n<p><strong>3. Phương thức bảo h&agrave;nh:</strong></p>\r\n<ul>\r\n<li>Tất cả c&aacute;c thiết bị được bảo h&agrave;nh miễn ph&iacute; trong suốt thời hạn bảo h&agrave;nh.</li>\r\n<li>H&agrave;ng mới mua trong v&ograve;ng 10 ng&agrave;y sẽ được đổi ngay h&agrave;ng mới nếu việc kiểm tra h&agrave;ng đ&oacute; hư hỏng do lỗi của nh&agrave; sản xuất. Trong trường hợp kh&ocirc;ng c&oacute; h&agrave;ng mới để đổi th&igrave; sẽ thỏa thuận đổi sang h&agrave;ng mới kh&aacute;c c&oacute; gi&aacute; trị tương đương hoặc sẽ ho&agrave;n trả lại đ&uacute;ng số tiền m&agrave; qu&yacute; kh&aacute;ch đ&atilde; mua. Ch&uacute; &yacute;: kh&ocirc;ng &aacute;p dụng đối với c&aacute;c thiết bị như: m&aacute;y in, mực in, c&aacute;c thiết bị c&oacute; t&iacute;nh chất hao m&ograve;n, c&aacute;c thiết bị bị cắt rời, bẻ g&atilde;y, l&agrave;m mất bao b&igrave; hoặc bị trầy xước, dơ bẩn&hellip;</li>\r\n<li>Trường hợp h&agrave;ng đ&atilde; mua qu&aacute; thời hạn 10ng&agrave;y th&igrave; sẽ được nhận lại để bảo h&agrave;nh (sửa chữa). Nếu kh&ocirc;ng thể sửa chữa được th&igrave; cửa h&agrave;ng sẽ thay thế một sản phẩm kh&aacute;c tương đương v&agrave; sản phẩm n&agrave;y kh&ocirc;ng nhất thiết mới 100%.</li>\r\n<li>Thời gian giải quyết bảo h&agrave;nh từ 3-&gt;7 ng&agrave;y kể từ ng&agrave;y nhận (trừ ng&agrave;y chủ nhật v&agrave; c&aacute;c ng&agrave;y lễ) v&agrave; tuỳ từng trường hợp c&oacute; thể giải quyết sớm hơn hoặc chậm hơn.</li>\r\n<li>Đối với c&aacute;c thiết bị kh&ocirc;ng thể sửa chữa được m&agrave; thiết bị n&agrave;y hết h&agrave;ng do kh&ocirc;ng c&ograve;n sản xuất nữa hoặc kh&ocirc;ng c&ograve;n lưu h&agrave;nh tr&ecirc;n thị trường, qu&yacute; kh&aacute;ch phải đợi nh&agrave; ph&acirc;n phối đổi h&agrave;ng kh&aacute;c c&oacute; gi&aacute; trị tương đương hoặc cao hơn v&agrave; b&ugrave; tiền theo thỏa thuận theo gi&aacute; cả hiện h&agrave;nh tr&ecirc;n thị trường. Thời hạn bảo h&agrave;nh đối với sản phẩm được thay thế sẽ được t&iacute;nh tiếp tục chứ kh&ocirc;ng bảo h&agrave;nh lại từ đầu.</li>\r\n<li>Đối với c&aacute;c thiết bị kh&ocirc;ng sửa chữa được trong nước phải gởi sang nh&agrave; sản xuất ở nước ngo&agrave;i th&igrave; thời hạn c&oacute; thể k&eacute;o d&agrave;i từ 4 đến 6 tuần. Trong trường hợp n&agrave;y cửa h&agrave;ng sẽ thay thế một sản phảm c&oacute; t&iacute;nh năng tương đương để qu&yacute; kh&aacute;ch tạm sử dụng.</li>\r\n</ul>\r\n<p>II. Đối với c&aacute;c linh kiện, thiết bị được cấp phiếu bảo h&agrave;nh ch&iacute;nh h&atilde;ng:</p>\r\n<p>&nbsp;</p>\r\n<p>Như c&aacute;c loại: M&aacute;y in, m&aacute;y scanner, &hellip;<br /> Khi mua c&aacute;c thiết bị, linh kiện n&agrave;y qu&yacute; kh&aacute;ch sẽ nhận được phiếu bảo h&agrave;nh, tr&ecirc;n phiếu c&oacute; ghi r&otilde; c&aacute;c điều kiện bảo h&agrave;nh, địa chỉ bảo h&agrave;nh, quyền lợi của kh&aacute;ch h&agrave;ng&hellip;Kh&aacute;ch h&agrave;ng phải xuất tr&igrave;nh phiếu bảo h&agrave;nh khi bảo h&agrave;nh sản phẩm trực tiếp tại trung t&acirc;m bảo h&agrave;nh ghi tr&ecirc;n phiếu hoặc tại Cty HƯNG NAM</p>\r\n<p>&nbsp;</p>\r\n<p>III. Đối với c&aacute;c thiết bị m&aacute;y được mua theo bảng gi&aacute; m&aacute;y bộ:</p>\r\n<p>&nbsp;</p>\r\n<p>Khi mua m&aacute;y qu&yacute; kh&aacute;ch sẽ được cấp phiếu bảo h&agrave;nh tr&ecirc;n phiếu ghi r&otilde;: điều kiện bảo h&agrave;nh, thời hạn bảo h&agrave;nh, địa chỉ bảo h&agrave;nh v&agrave; quyền lợi của kh&aacute;ch h&agrave;ng.</p>\r\n<p><br /> Ch&acirc;n th&agrave;nh c&aacute;m ơn qu&yacute; kh&aacute;ch đ&atilde; tin tưởng sử dụng sản phẩm v&agrave; ủng hộ Qui Định Bảo H&agrave;nh của HƯNG NAM Rất h&acirc;n hạnh v&agrave; sẵn s&agrave;ng phục vụ qu&yacute; kh&aacute;ch.</p>\r\n<p>&nbsp;</p>', '', NULL, 0, 15, '787250575_122.png', 1, '2014-10-31 21:45:14', '', 1),
(24, 'sua-chua-may-chieu-gia-re', 'vn', 'Sửa Chữa Máy Chiếu Giá Rẻ', '', '<p>Nếu m&aacute;y chiếu của bạn xuất hiện t&igrave;nh trạng hư hỏng đừng chần chờ g&igrave; nữa, h&atilde;y li&ecirc;n hệ ngay đến trung t&acirc;m sửa chữa m&aacute;y chiếu của&nbsp;<span style="color: #ff0000;">Hưng Nam</span> nh&eacute; !</p>', '', '<h2 style="color: #ff6600; font-size: 18px;"><span style="font-size: 16px;"><span style="color: #f00;">Cam kết của dịch vụ sữa chữa m&aacute;y chiếu tại HƯNG NAM<br /></span></span></h2>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Dịch vụ sửa chữa m&aacute;y chiếu uy t&iacute;n, chất lượng v&agrave; chuy&ecirc;n nghiệp.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">X&aacute;c định hư hỏng sau 4 &ndash; 8 giờ l&agrave;m việc.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Chi ph&iacute; sửa chữa hợp l&yacute;.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Phục vụ tận nơi nếu kh&aacute;ch h&agrave;ng c&oacute; nhu cầu.</div>\r\n<h4 align="center"><img title="Sữa chữa m&aacute;y chiếu tại ph&ograve;ng kỹ thuật" src="http://hungthinhco.com.vn/image/data/May-chieu/Sua-chua/sua-chua-may-chieu-2.jpg" alt="sua-chua-may-chieu-phong-ky-thuat" /></h4>\r\n<div style="color: #a9a9a9; font-size: 12px; margin-bottom: 10px;" align="center">Sữa chữa m&aacute;y chiếu tại ph&ograve;ng kỹ thuật</div>\r\n<h2><span style="color: #ff6600; font-size: 16px;"><strong><span style="color: #f00;">Những bảo đảm của dịch vụ sửa chữa m&aacute;y chiếu tại Hưng Nam</span></strong></span><strong style="color: #ff6600; font-size: 16px;"><span style="color: #f00;"> khi bạn đến với ch&uacute;ng t&ocirc;i</span></strong></h2>\r\n<h3 style="font-size: 16px; padding-left: 8px; color: #3399ff; margin-bottom: 10px;">Đội ngũ kỹ thuật vi&ecirc;n :</h3>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">100% kỹ thuật vi&ecirc;n sửa chữa m&aacute;y chiế<strong>u</strong> cho qu&iacute; kh&aacute;ch đều được đ&agrave;o tạo 1 c&aacute;ch b&agrave;i bản, c&oacute; chứng nhận tay nghề của c&aacute;c trung t&acirc;m nổi tiếng, c&oacute; kinh nghiệm &iacute;t nhất 5 năm trong lĩnh vực sửa chữa m&aacute;y chiếu.</div>\r\n<h3 style="font-size: 16px; padding-left: 8px; color: #3399ff; margin-bottom: 10px;">Thay thế phụ kiện ch&iacute;nh h&atilde;ng :</h3>\r\n<div style="padding-left: 8px; margin-bottom: 10px;" align="justify"><span style="font-size: 14px;">L&agrave; nh&agrave; ph&acirc;n phối ủy quyền của nhiều h&atilde;ng m&aacute;y chiếu nổi tiếng n&ecirc;n </span><span style="color: #f00;"><span style="font-size: 14px;">Hưng Nam</span></span><span style="font-size: 14px;"> cam kết cung cấp linh kiện thay thế ch&iacute;nh h&atilde;ng với chất lượng vượt trội v&agrave; chế độ bảo h&agrave;nh đ&uacute;ng ti&ecirc;u chuẩn của nh&agrave; sản xuất.</span></div>\r\n<h3 style="font-size: 16px; padding-left: 8px; color: #3399ff; margin-bottom: 10px;">Dịch vụ sửa chữa tận nơi :</h3>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Khi c&oacute; bất cứ hư hỏng n&agrave;o xảy ra với m&aacute;y chiếu của bạn, bạn chỉ cần gọi điện đến <span style="color: #ff0000;">Hưng Nam</span>, sẽ c&oacute; nh&acirc;n vi&ecirc;n kỹ thuật đến tận nơi <em>sửa chữa m&aacute;y chiếu</em> cho bạn.</div>\r\n<h3 style="font-size: 16px; padding-left: 8px; color: #3399ff; margin-bottom: 10px;">Thanh to&aacute;n c&oacute; h&oacute;a đơn GTGT :</h3>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">Nếu bạn l&agrave; c&ocirc;ng ty, cơ quan, x&iacute; nghiệp, <span style="color: #ff0000;">Hưng Nam</span> lu&ocirc;n cam kết xuất ho&aacute; đơn đầy đủ theo y&ecirc;u cầu của qu&iacute; kh&aacute;ch h&agrave;ng.</div>\r\n<h4 align="center"><img title="Sữa chữa m&aacute;y chiếu với đội ngũ l&agrave;nh nghề" src="http://hungthinhco.com.vn/image/data/May-chieu/Sua-chua/sua-chua-may-chieu-3.jpg" alt="sua-chua-may-chieu-nhan-vien-lanh-nghe" /></h4>\r\n<div style="color: #a9a9a9; font-size: 12px; margin-bottom: 10px;" align="center">Sữa chữa m&aacute;y chiếu với c&aacute;c nh&acirc;n vi&ecirc;n kỹ thuật l&agrave;nh nghề</div>\r\n<h2 style="color: #ff6600; font-size: 18px;"><span style="font-size: 16px;"><span style="color: #f00;">Qui tr&igrave;nh sửa chữa m&aacute;y chiếu tại Hưng <span style="text-align: justify;">Nam<br /></span></span></span></h2>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 1 :</span> </strong>Tiếp nhận th&ocirc;ng tin từ kh&aacute;ch h&agrave;ng<br /> Khi c&oacute; hư hỏng về m&aacute;y chiếu cần được sữa chữa qu&yacute; kh&aacute;ch gửi th&ocirc;ng tin về m&aacute;y chiếu đến ch&uacute;ng t&ocirc;i th&ocirc;ng qua email hoặc điện thoại trực tiếp đến ph&ograve;ng dịch vụ v&agrave; chăm s&oacute;c kh&aacute;ch h&agrave;ng</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 2 : </span></strong>Tiếp nhận sản phẩm<br /> Với c&aacute;c trường hợp m&aacute;y chiếu c&ograve;n bảo h&agrave;nh &ndash; cần sữa chữa can thiệp của kỹ thuật, nh&acirc;n vi&ecirc;n kỹ thuật của <span style="color: #ff0000;">Hưng Nam</span> sẽ đến tận nơi đển khắc phục hoặc kiểm tra thiết bị v&agrave; vận chuyển m&aacute;y về trung t&acirc;m bảo h&agrave;nh của c&ocirc;ng ty để sữa chữa</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 3: </span></strong>Th&ocirc;ng b&aacute;o t&igrave;nh trạng thiết bị<br /> <span style="color: #ff0000;">Hưng Nam</span>sẽ gọi điện cho qu&iacute; kh&aacute;ch để th&ocirc;ng b&aacute;o t&igrave;nh trạng hư hỏng, c&aacute;ch khắc phục v&agrave; gi&aacute; cả nếu thiết bị đ&atilde; hết hạn bảo h&agrave;nh.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 4:</span> </strong>Tiến h&agrave;nh sửa chữa &ndash; bảo h&agrave;nh m&aacute;y chiếu.</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 5: </span></strong>B&agrave;n giao thiết bị v&agrave; phiếu bảo h&agrave;nh cho qu&iacute; kh&aacute;ch</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify"><strong><span style="color: #3399ff;">Bước 6: </span></strong>Chăm s&oacute;c kh&aacute;ch h&agrave;ng sau sửa chữa m&aacute;y chiếu v&agrave; cập nhật t&igrave;nh trạng thiết bị định kỳ h&agrave;ng th&aacute;ng.</div>\r\n<h4 align="center"><img title="Sữa chữa m&aacute;y chiếu qui tr&igrave;nh" src="http://hungthinhco.com.vn/image/data/May-chieu/Sua-chua/sua-chua-may-chieu-4.jpg" alt="sua-chua-may-chieu-qui-trinh" height="300" /></h4>\r\n<div style="color: #a9a9a9; font-size: 12px; margin-bottom: 10px;" align="center">Qui tr&igrave;nh sửa chữa m&aacute;y chiếu</div>\r\n<h2 style="color: #ff6600; font-size: 18px;">Chuy&ecirc;n khắc phục c&aacute;c sự cố về m&aacute;y chiếu như :</h2>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">- M&aacute;y chiếu kh&ocirc;ng kết nối được với m&aacute;y t&iacute;nh</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">- M&aacute;y chiếu l&ecirc;n h&igrave;nh được 5s th&igrave; tắt ( hiện ra logo )</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">- M&aacute;y chiếu bị sai m&agrave;u, nho&egrave;, trắng m&agrave;n h&igrave;nh</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">- C&aacute;c n&uacute;t điều khiển của m&aacute;y chiếu kh&ocirc;ng hoạt động</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">- Kh&ocirc;ng chỉnh được k&iacute;ch cỡ, độ ph&acirc;n giải của m&agrave;n h&igrave;nh m&aacute;y chiếu</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">- Chiếu khoảng 15'' th&igrave; bị tắt, l&uacute;c l&ecirc;n l&uacute;c kh&ocirc;ng</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">- Chiếu h&igrave;nh bị nghi&ecirc;ng, lệch h&igrave;nh, c&oacute; b&oacute;ng mờ</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">- B&oacute;ng đ&egrave;n bị hư, kh&ocirc;ng l&ecirc;n, mờ, chớp tắt</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">- Board nguồn bị ch&aacute;y nổ, chết IC nguồn, IC điều khiển, Board điền khiển bị hư, hư quạt tản nhiệt - Thay đ&egrave;n m&aacute;y chiếu, m&aacute;y chiếu bị v&agrave;ng, m&aacute;y chiếu bị mất m&agrave;u</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">..............</div>\r\n<div style="font-size: 14px; padding-left: 8px; margin-bottom: 10px;" align="justify">&nbsp;</div>\r\n<div style="font-size: 16px; margin-bottom: 10px; margin-top: 10px;">Mọi chi tiết xin vui l&ograve;ng li&ecirc;n hệ</div>\r\n<div style="font-size: 16px; margin-bottom: 10px; margin-top: 10px;">\r\n<p style="text-align: center;"><span style="color: #0033ff; font-size: 16px;">Ph&ograve;ng Dịch Vụ V&agrave; Chăm S&oacute;c Kh&aacute;ch H&agrave;ng</span><br /><span style="color: #ff0000; font-size: 16px;"> Điện thoại: ( 08).36030375</span></p>\r\n</div>', '', NULL, 0, 21, '1069059800_133.jpg', 2, '2014-10-31 22:30:32', '', 1),
(25, 'bang-gia-pc-lcd-lenovo-t10-2014-', 'vn', 'BANG GIA PC & LCD  LENOVO  T10  2014 ', '', '<p>BANG GIA PC &amp; LCD&nbsp; LENOVO&nbsp; T10&nbsp; 2014</p>', '', '', '', NULL, 0, 19, '1210862798_bang-gia-pc-lcd-lenovo-t10-2014 .pdf', 1, '2014-10-31 22:40:21', '', 0),
(26, 'lenovo', 'vn', 'LENOVO', '', '<table class="Partner">\r\n<tbody>\r\n<tr>\r\n<td style="width: 90px;"><strong>T&ecirc;n c&ocirc;ng ty:</strong></td>\r\n<td colspan="4"><a class="default" title="" href="http://nguyenphatcomputer.com/vi-vn/partner/doi-tac-tieu-bieu-142.aspx"> <span style="font: bold 13px Arial; color: red; text-transform: uppercase;"> LENOVO </span></a></td>\r\n</tr>\r\n<tr>\r\n<td><strong> Địa chỉ:</strong></td>\r\n<td colspan="4">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Điện thoại:</strong></td>\r\n<td>&nbsp;</td>\r\n<td style="width: 20px;">&nbsp;</td>\r\n<td style="width: 60px;"><strong> Fax:</strong></td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Email:</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td><strong> Website:</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', '', NULL, 0, 17, '2035772488_lenovoO.jpg', 3, '2014-11-04 14:01:49', '', 0),
(27, 'lenovo', 'vn', 'LENOVO', '', '<table class="Partner">\r\n<tbody>\r\n<tr>\r\n<td><strong>Địa chỉ:</strong></td>\r\n<td colspan="4">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Điện thoại:</strong></td>\r\n<td>&nbsp;</td>\r\n<td style="width: 20px;">&nbsp;</td>\r\n<td style="width: 60px;"><strong> Fax:</strong></td>\r\n</tr>\r\n<tr>\r\n<td><strong> Email:</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td><strong> Website:</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', '', NULL, 0, 17, '116394655_lenovoO.jpg', 3, '2014-11-04 14:04:52', '', 1),
(28, 'intel', 'vn', 'INTEL', '', '<table class="Partner">\r\n<tbody>\r\n<tr>\r\n<td><strong>Địa chỉ:</strong></td>\r\n<td colspan="4">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Điện thoại:</strong></td>\r\n<td>&nbsp;</td>\r\n<td style="width: 20px;">&nbsp;</td>\r\n<td style="width: 60px;"><strong> Fax:</strong></td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Email:</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td><strong> Website:</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', '', NULL, 0, 17, '1030727263_intell.png', 4, '2014-11-04 14:06:08', '', 1);
INSERT INTO `n_news` (`id`, `slug`, `lang`, `vn_name`, `en_name`, `vn_sapo`, `en_sapo`, `vn_details`, `en_details`, `popup`, `home`, `cid`, `avatar`, `position`, `date_created`, `keywords`, `status`) VALUES
(29, 'epson', 'vn', 'EPSON', '', '<table class="Partner">\r\n<tbody>\r\n<tr>\r\n<td><strong>Địa chỉ:</strong></td>\r\n<td colspan="4">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Điện thoại:</strong></td>\r\n<td>&nbsp;</td>\r\n<td style="width: 20px;">&nbsp;</td>\r\n<td style="width: 60px;"><strong> Fax:</strong></td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong> Email:</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td><strong> Website:</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', '', NULL, 0, 17, '1447218684_epson-logoo.jpg', 5, '2014-11-04 14:21:23', '', 1),
(30, 'bang-bao-gia-may-chieu-sony-2014', 'vn', 'BANG BAO GIA MAY CHIEU SONY 2014', '', '', '', '', '', NULL, 0, 19, '1854051374_bang-bao-gia-may-chieu-sony-20144.xls', 1, '2014-11-05 08:58:44', '', 0),
(31, 'bang-bao-gia-may-chieu-sony-2014', 'vn', 'BANG BAO GIA MAY CHIEU SONY 2014', '', '<table width="952" border="0" cellspacing="0" cellpadding="0"><colgroup><col width="191" /><col width="198" /><col span="2" width="97" /><col width="65" /><col width="128" /><col width="176" /></colgroup>\r\n<tbody>\r\n<tr>\r\n<td class="xl69" colspan="7" width="952" height="68"><span class="font5">C&ocirc;ng Ty Hưng Nam </span><span class="font6">&nbsp;Nh&agrave; Ph&acirc;n Phối ch&iacute;nh thức M&aacute;y Chiếu SONY v&agrave; cung cấp m&aacute;y vi t&iacute;nh x&aacute;ch tay, m&aacute;y ảnh kỹ thu&acirc;t số, m&aacute;y quay phim SONY, Điện thoại Sony Xperia tại Việt Nam<br /> Ch&uacute;ng t&ocirc;i xin tr&acirc;n trọng gửi tới Qu&yacute; Kh&aacute;ch H&agrave;ng bảng gi&aacute; Phụ kiện m&aacute;y chiếu:&nbsp;</span></td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '<table width="952" border="0" cellspacing="0" cellpadding="0"><colgroup><col width="191" /> <col width="198" /> <col span="2" width="97" /> <col width="65" /> <col width="128" /> <col width="176" /> </colgroup>\r\n<tbody>\r\n<tr>\r\n<td class="xl169" colspan="7" width="952" height="50">M&Agrave;N CHIẾU</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="38">SẢN PHẨM&nbsp;</td>\r\n<td class="xl73">M&atilde; H&agrave;ng</td>\r\n<td class="xl74" width="97">K.Thước (inch)</td>\r\n<td class="xl74" width="97">K.Thước (cm)</td>\r\n<td class="xl74" width="65">Tỉ Lệ</td>\r\n<td class="xl75">Gi&aacute; VNĐ</td>\r\n<td class="xl76">&nbsp;H&igrave;nh Ảnh&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl159" rowspan="7" width="191" height="266">M&agrave;n Chiếu <br /> Treo Tường<br /> Wall Screen</td>\r\n<td class="xl87" align="left">&nbsp;DMS180 ( 100 '''')&nbsp;</td>\r\n<td class="xl93">70"x70"</td>\r\n<td class="xl93">180x180</td>\r\n<td class="xl94">1:1</td>\r\n<td class="xl95">754,000</td>\r\n<td rowspan="7" align="left" valign="top" width="176" height="266">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl162" rowspan="7" width="176" height="266">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;DMS220 ( 120 '''')&nbsp;</td>\r\n<td class="xl96">84"X84"</td>\r\n<td class="xl96">220X220</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl98">1,179,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;DMS240 ( 135 '''')&nbsp;</td>\r\n<td class="xl96">96"x96"</td>\r\n<td class="xl96">240x240</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl98">1,520,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;DMS300 ( 170'''')&nbsp;</td>\r\n<td class="xl96">120"X120"</td>\r\n<td class="xl96">305x305</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl98">2,890,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;DMV220 ( 110 '''')&nbsp;</td>\r\n<td class="xl96">84"x63"</td>\r\n<td class="xl96">213x160</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">1,245,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;DMV240 ( 120 '''')&nbsp;</td>\r\n<td class="xl96">96"x72"</td>\r\n<td class="xl96">240x180</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">1,600,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl89" align="left" height="38">&nbsp;DMV300 ( 150 '''')&nbsp;</td>\r\n<td class="xl99">120"x90"</td>\r\n<td class="xl99">300x225</td>\r\n<td class="xl99">4:3</td>\r\n<td class="xl100">2,710,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl159" rowspan="9" width="191" height="342">M&agrave;n Chiếu 03 Ch&acirc;n<br /> Tripod Screen</td>\r\n<td class="xl90">&nbsp;TRS160D ( 84 '''') S&nbsp;</td>\r\n<td class="xl93">60"x60"</td>\r\n<td class="xl93">150x150</td>\r\n<td class="xl94">1:1</td>\r\n<td class="xl95">796,000</td>\r\n<td rowspan="9" align="left" valign="top" width="176" height="342">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl162" rowspan="9" width="176" height="342">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="xl91" height="38">&nbsp;TRS180D( 100 '''') S&nbsp;</td>\r\n<td class="xl96">70"x70"</td>\r\n<td class="xl96">180x180</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl98">850,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl91" height="38">&nbsp;TRS180 ( 100 '''') Inox&nbsp;</td>\r\n<td class="xl96">70"x70"</td>\r\n<td class="xl96">180x180</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl98">890,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;TRS220D( 120 '''') S&nbsp;</td>\r\n<td class="xl96">84"X84"</td>\r\n<td class="xl96">220X220</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl98">1,305,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;TRS220 ( 120 '''') Inox&nbsp;</td>\r\n<td class="xl96">84"X84"</td>\r\n<td class="xl96">220X220</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl98">1,480,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;TRS240( 135 '''') Inox&nbsp;</td>\r\n<td class="xl96">96"x96"</td>\r\n<td class="xl96">240x240</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl98">1,775,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;TRV200D( 100 '''') S&nbsp;</td>\r\n<td class="xl96">80"x60"</td>\r\n<td class="xl96">200x150</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">1,305,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;TRV240( 120 '''') Inox&nbsp;</td>\r\n<td class="xl96">96"x96"</td>\r\n<td class="xl96">240x240</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl98">1,775,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl89" align="left" height="38">&nbsp;TRV300( 150 '''') Inox&nbsp;</td>\r\n<td class="xl99">120"x90"</td>\r\n<td class="xl99">300x225</td>\r\n<td class="xl99">4:3</td>\r\n<td class="xl100">3,950,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl159" rowspan="14" width="191" height="532">M&agrave;n Chiếu Điện C&oacute; Remote<br /> Electric Screen</td>\r\n<td class="xl87" align="left">&nbsp;ELS180 ( 100 '''')&nbsp;</td>\r\n<td class="xl93">70"x70"</td>\r\n<td class="xl93">180x180</td>\r\n<td class="xl101">1:1</td>\r\n<td class="xl102">1,670,000</td>\r\n<td rowspan="14" align="left" valign="top" width="176" height="532">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl162" rowspan="14" width="176" height="532">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELS220 ( 120 '''')&nbsp;</td>\r\n<td class="xl96">84"X84"</td>\r\n<td class="xl96">220X220</td>\r\n<td class="xl103">1:1</td>\r\n<td class="xl104">1,920,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELS240( 135'''')&nbsp;</td>\r\n<td class="xl96">96"x96"</td>\r\n<td class="xl96">240x240</td>\r\n<td class="xl103">1:1</td>\r\n<td class="xl104">2,150,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELS300 ( 170 '''')&nbsp;</td>\r\n<td class="xl96">120"X120"</td>\r\n<td class="xl96">300X300</td>\r\n<td class="xl103">1:1</td>\r\n<td class="xl104">4,590,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELS360&nbsp; ( 200 '''')&nbsp;</td>\r\n<td class="xl96">144"X144"</td>\r\n<td class="xl96">360X360</td>\r\n<td class="xl103">1:1</td>\r\n<td class="xl104">7,950,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELS420&nbsp;&nbsp; ( 235 '''')&nbsp;</td>\r\n<td class="xl96">165"X165"</td>\r\n<td class="xl96">420X420</td>\r\n<td class="xl97">1:1</td>\r\n<td class="xl105">14,520,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELV220 ( 110 '''')&nbsp;</td>\r\n<td class="xl96">84"x63"</td>\r\n<td class="xl96">213x162</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">1,920,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELV240&nbsp; ( 120 '''')&nbsp;</td>\r\n<td class="xl96">96"x72"</td>\r\n<td class="xl96">240x180</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">2,350,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELV300&nbsp; ( 150 '''')&nbsp;</td>\r\n<td class="xl96">120"x90"</td>\r\n<td class="xl96">300x225</td>\r\n<td class="xl106">4:3</td>\r\n<td class="xl107">3,980,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELV360&nbsp; ( 180 '''')&nbsp;</td>\r\n<td class="xl96">140"x102"</td>\r\n<td class="xl96">355x260</td>\r\n<td class="xl106">4:3</td>\r\n<td class="xl107">7,850,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELV400&nbsp; ( 200 '''')&nbsp;</td>\r\n<td class="xl96">160"x120"</td>\r\n<td class="xl96">400x300</td>\r\n<td class="xl106">4:3</td>\r\n<td class="xl107">8,300,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELV500&nbsp; ( 250 '''')&nbsp;</td>\r\n<td class="xl96">198"x150"</td>\r\n<td class="xl96">502x380</td>\r\n<td class="xl106">4:3</td>\r\n<td class="xl107">27,300,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;ELV600&nbsp; ( 300 '''')&nbsp;</td>\r\n<td class="xl96">236"x177"</td>\r\n<td class="xl96">600x450</td>\r\n<td class="xl106">4:3</td>\r\n<td class="xl107">29,400,,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl89" align="left" height="38">&nbsp;ELV800&nbsp; ( 400 '''')&nbsp;</td>\r\n<td class="xl99">320"X240"</td>\r\n<td class="xl99">813X610</td>\r\n<td class="xl108">4:3</td>\r\n<td class="xl109">CALL</td>\r\n</tr>\r\n<tr>\r\n<td class="xl165" rowspan="2" width="191" height="76">M&agrave;n Chiếu X&aacute;ch Tay<br /> &nbsp;Floor Screen</td>\r\n<td class="xl87" align="left">&nbsp;PSS180&nbsp; ( 100 '''')&nbsp;</td>\r\n<td class="xl93">70"x70"</td>\r\n<td class="xl93">180x180</td>\r\n<td class="xl101">1:1</td>\r\n<td class="xl102">2,717,000</td>\r\n<td class="xl167" rowspan="2">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl89" align="left" height="38">&nbsp;PSV200&nbsp; ( 100 '''')&nbsp;</td>\r\n<td class="xl99">80"x60"</td>\r\n<td class="xl99">203x152</td>\r\n<td class="xl108">4:3</td>\r\n<td class="xl110">2,950,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl153" rowspan="5" width="191" height="190">&nbsp;M&agrave;n Chiếu <br /> Sau c&oacute; ch&acirc;n&nbsp;&nbsp;</td>\r\n<td class="xl87" align="left">&nbsp;FF200V-R ( 100 '''')&nbsp;</td>\r\n<td class="xl93">80"x60"</td>\r\n<td class="xl93">203x152</td>\r\n<td class="xl93">4:3</td>\r\n<td class="xl95">12,408,000</td>\r\n<td class="xl156" rowspan="5">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;FF240V-R ( 120 '''')&nbsp;</td>\r\n<td class="xl96">96"x72"</td>\r\n<td class="xl96">240x180</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">14,500,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;FF300V-R ( 150 '''')&nbsp;</td>\r\n<td class="xl96">120"x90"</td>\r\n<td class="xl96">300x225</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">17,500,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;FF360V-R ( 180 '''')&nbsp;</td>\r\n<td class="xl96">140"x102"</td>\r\n<td class="xl96">355x260</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">23,550,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl89" align="left" height="38">&nbsp;FF400V-R ( 200 '''')&nbsp;</td>\r\n<td class="xl99">160"x120"</td>\r\n<td class="xl99">400x300</td>\r\n<td class="xl99">4:3</td>\r\n<td class="xl100">27,720,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl153" rowspan="5" width="191" height="190">&nbsp;M&agrave;n Chiếu Bảng<br /> &nbsp;c&oacute; ch&acirc;n&nbsp;&nbsp;</td>\r\n<td class="xl87" align="left">&nbsp;FF200V ( 100 '''')&nbsp;</td>\r\n<td class="xl93">80"x60"</td>\r\n<td class="xl93">203x152</td>\r\n<td class="xl93">4:3</td>\r\n<td class="xl95">11,900,000</td>\r\n<td class="xl156" rowspan="5">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;FF240V ( 120 '''')&nbsp;</td>\r\n<td class="xl96">96"x72"</td>\r\n<td class="xl96">240x180</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">13,200,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;FF300V( 150 '''')&nbsp;</td>\r\n<td class="xl96">120"x90"</td>\r\n<td class="xl96">300x225</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">16.900,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl88" align="left" height="38">&nbsp;FF360V ( 180 '''')&nbsp;</td>\r\n<td class="xl96">140"x102"</td>\r\n<td class="xl96">355x260</td>\r\n<td class="xl96">4:3</td>\r\n<td class="xl98">20,990,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl89" align="left" height="38">&nbsp;FF400V ( 200 '''')&nbsp;</td>\r\n<td class="xl99">160"x120"</td>\r\n<td class="xl99">400x300</td>\r\n<td class="xl99">4:3</td>\r\n<td class="xl100">21,500,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl77" height="17">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl77">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl138" colspan="7" height="35">GI&Aacute; TREO -B&Uacute;T TR&Igrave;NH CHIẾU</td>\r\n</tr>\r\n<tr>\r\n<td class="xl78" width="191" height="37">SẢN PHẨM</td>\r\n<td class="xl140" colspan="5" width="585">Ch&iacute; Tiết Kỹ thuật</td>\r\n<td class="xl79" width="176">Gi&aacute; VNĐ</td>\r\n</tr>\r\n<tr>\r\n<td rowspan="6" align="left" valign="top" width="191" height="261">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl143" rowspan="6" width="191" height="261">GI&Aacute; TREO M&Aacute;Y CHIẾU</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n<td class="xl119" rowspan="4" colspan="5" width="585">&bull; Sử dụng đa năng, d&ugrave;ng cho tất cả c&aacute;c loại m&aacute;y chiếu <br /> &bull; Độ d&agrave;i từ 30 &ndash; 60cm.<br /> &bull; Cấu tạo bằng nh&ocirc;m chất lượng cao, sơn tĩnh điện.<br /> &bull; Chịu lực cao: 1- 30kg, kiều d&aacute;ng đẹp gọn.</td>\r\n<td class="xl125" rowspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 600,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl134" colspan="5" width="585" height="92">&bull; Sử dụng đa năng, d&ugrave;ng cho tất cả c&aacute;c loại m&aacute;y chiếu <br /> &bull; Độ d&agrave;i từ 60 &ndash; 100cm.<br /> &bull; Cấu tạo bằng nh&ocirc;m chất lượng cao, sơn tĩnh điện.<br /> &bull; Chịu lực cao: 1- 30kg, kiều d&aacute;ng đẹp gọn.</td>\r\n<td class="xl80">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl134" colspan="5" width="585" height="87">&bull; Sử dụng đa năng, d&ugrave;ng cho tất cả c&aacute;c loại m&aacute;y chiếu <br /> &bull; Độ d&agrave;i từ 100 &ndash; 200cm.<br /> &bull; Cấu tạo bằng nh&ocirc;m chất lượng cao, sơn tĩnh điện.<br /> &bull; Chịu lực cao : 1- 30kg, kiều d&aacute;ng đẹp gọn.</td>\r\n<td class="xl81">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td align="left" valign="top" width="191" height="131">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl82" align="left" width="191" height="131">REMOTE M&Aacute;Y T&Iacute;NH&nbsp; <br /> AVOV<br /> &nbsp;PS2411</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n<td class="xl134" colspan="5" width="585">CHỨC NĂNG:&nbsp;Điều khiển từ xa &nbsp;nội dung thuyết tr&igrave;nh tr&ecirc;n M&agrave;n Chiếu&nbsp;th&ocirc;ng qua m&aacute;y t&iacute;nh, gồm: powerpoint control, wireless mouse, laser pointer (500m), multimedia control, Alt tab, &hellip;<br /> ĐỘ NHẠY:&nbsp;b&aacute;n k&iacute;nh tối đa 140 M&Eacute;T, hoặc xuy&ecirc;n nhiều vật cản d&agrave;y.Với chức năng n&agrave;y th&igrave; chỉ AVOV mới thực sự l&agrave; Remote M&aacute;y T&iacute;nh (v&igrave; khi thuyết tr&igrave;nh, thuyết tr&igrave;nh vi&ecirc;n&nbsp;lu&ocirc;n gặp vật cản l&agrave; những th&iacute;nh giả v&agrave; c&aacute;c vật dụng).<br /> Bảo h&agrave;nh&nbsp;: 36 th&aacute;ng (một đổi một)</td>\r\n<td class="xl83" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,470,000</td>\r\n</tr>\r\n<tr>\r\n<td rowspan="2" align="left" valign="top" width="191" height="178">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl117" rowspan="2" width="191" height="178">&nbsp;GI&Aacute; ĐỂ M&Aacute;Y CHIẾU<br /> KH&Ocirc;NG B&Aacute;NH XE</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n<td class="xl119" rowspan="2" colspan="5" width="585">L&agrave;m từ nh&ocirc;m cao cấp, trơn, nhẵn chắc chắn.<br /> Th&iacute;ch hợp cho tr&igrave;nh chiếu di động.<br /> C&acirc;n nặng: 2.6kg (chưa c&oacute; b&aacute;nh xe).<br /> Mang được tối đa: 5kg.<br /> chiều cao tối thiểu: 565 (mm)<br /> chiều cao tối đa: 1460 (mm) <br /> phạm vi điều chỉnh: 895 (mm)<br /> Bảo h&agrave;nh: 1&nbsp; năm</td>\r\n<td class="xl125" rowspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,200,000</td>\r\n</tr>\r\n<tr>\r\n<td rowspan="2" align="left" valign="top" width="191" height="174">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl117" rowspan="2" width="191" height="174">&nbsp;GI&Aacute; ĐỂ M&Aacute;Y CHIẾU<br /> C&Oacute; B&Aacute;NH XE</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n<td class="xl119" rowspan="2" colspan="5" width="585">L&agrave;m từ nh&ocirc;m cao cấp, trơn, nhẵn chắc chắn.<br /> Th&iacute;ch hợp cho tr&igrave;nh chiếu di động.<br /> C&acirc;n nặng: 2.6kg (chưa c&oacute; b&aacute;nh xe).<br /> Mang được tối đa: 5kg.<br /> chiều cao tối thiểu: 565 (mm)<br /> chiều cao tối đa: 1460 (mm) <br /> phạm vi điều chỉnh: 895 (mm)<br /> Bảo h&agrave;nh: 1&nbsp; năm</td>\r\n<td class="xl125" rowspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,800,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl126" rowspan="3" width="191" height="153">&nbsp;Gi&aacute; treo <br /> m&aacute;y chiếu điện&nbsp;</td>\r\n<td class="xl84" width="198">&nbsp;Mini110&nbsp;</td>\r\n<td class="xl188" colspan="3" width="259">&nbsp; Tải trọng &lt; 15kg, độ d&agrave;i 100cm, size: 350x370x190.&nbsp;&nbsp;</td>\r\n<td class="xl86" width="128">5,350,000</td>\r\n<td class="xl191" rowspan="3">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl84" width="198" height="51">&nbsp;Mini115&nbsp;</td>\r\n<td class="xl188" colspan="3" width="259">&nbsp; Tải trọng &lt; 15kg, độ d&agrave;i 150cm, size: 350x370x200.&nbsp;&nbsp;</td>\r\n<td class="xl86" width="128">5,950,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl84" width="198" height="51">&nbsp;Mini215&nbsp;</td>\r\n<td class="xl188" colspan="3" width="259">&nbsp; Tải trọng &lt; 15kg, độ d&agrave;i 200cm, size: 350x370x200.&nbsp;&nbsp;</td>\r\n<td class="xl86" width="128">7,350,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl172" rowspan="17" width="191" height="502">K&ecirc;̣ đ&ecirc;̉ máy chi&ecirc;́u <br /> di đ&ocirc;̣ng</td>\r\n<td class="xl175" rowspan="5">FS9317/6105</td>\r\n<td class="xl176" rowspan="5" colspan="3" width="259">Chất liệu nh&ocirc;m kim nh&ocirc;m cao cấp<br /> C&oacute; thể th&aacute;o lắp, thuận tiện cho việc di chuyển.<br /> Điều chỉnh c&acirc;n bằng m&aacute;y trong địa h&igrave;nh kh&ocirc;ng bằng phẳng.<br /> Khoảng c&aacute;ch điều chỉnh: 545mm - 1400mm<br /> Sức chứa: 3 kg, trọng lượng 4 kg</td>\r\n<td class="xl185" rowspan="5">1,800,000</td>\r\n<td rowspan="17" align="left" valign="top" width="176" height="502">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl129" rowspan="17" width="176" height="502">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="xl175" rowspan="5" height="145">FS9317/6307</td>\r\n<td class="xl176" rowspan="5" colspan="3" width="259">Chất liệu nh&ocirc;m kim nh&ocirc;m cao cấp<br /> C&oacute; thể th&aacute;o lắp, thuận tiện cho việc di chuyển.<br /> Điều chỉnh c&acirc;n bằng m&aacute;y trong địa h&igrave;nh kh&ocirc;ng bằng phẳng.<br /> Khoảng c&aacute;ch điều chỉnh: 700mm - 1550mm<br /> Sức chứa: 4 kg, trọng lượng 5 kg</td>\r\n<td class="xl185" rowspan="5">2,400,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl175" rowspan="5" height="145">FS9317/6702</td>\r\n<td class="xl176" rowspan="5" colspan="3" width="259">Chất liệu nh&ocirc;m kim nh&ocirc;m cao cấp<br /> C&oacute; thể th&aacute;o lắp, thuận tiện cho việc di chuyển.<br /> Điều chỉnh c&acirc;n bằng m&aacute;y trong địa h&igrave;nh kh&ocirc;ng bằng phẳng.<br /> Khoảng c&aacute;ch điều chỉnh: 580mm - 1720mm<br /> Sức chứa: 4,5 kg, trọng lượng 5 kg</td>\r\n<td class="xl185" rowspan="5">2,650,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl132" rowspan="2" height="67">WT600</td>\r\n<td class="xl176" rowspan="2" colspan="3" width="259">B&aacute;nh xe v&agrave; bệ di động cho kệ m&aacute;y chiếu<br /> C&oacute; thể th&aacute;o lắp, thuận tiện cho việc di chuyển.</td>\r\n<td class="xl185" rowspan="2">990,000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl77" height="17">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl77">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl116" colspan="2" height="26"><span class="font5">Điều kiện thương mại</span><span class="font6">:</span></td>\r\n<td class="xl71">&nbsp;</td>\r\n<td class="xl68">&nbsp;</td>\r\n<td class="xl69">&nbsp;</td>\r\n<td class="xl70">&nbsp;</td>\r\n<td class="xl70">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td colspan="7" align="left" valign="top" width="952" height="22">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl114" colspan="7" width="952" height="22">1. Gi&aacute; tr&ecirc;n chưa bao gồm thuế VAT 10%</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="7" align="left" valign="top" width="952" height="22">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl114" colspan="7" width="952" height="22">2. Xuất xứ: C&aacute;c sản phẩm c&oacute; nguồn gốc xuất xứ China.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="7" align="left" valign="top" width="952" height="46">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl115" colspan="7" width="952" height="46">3. Thời hạn bảo h&agrave;nh: Ch&iacute;nh h&atilde;ng 02 năm đối với hệ thống m&aacute;y, 01 năm với khối lăng k&iacute;nh v&agrave; 03 th&aacute;ng đối với <br /> b&oacute;ng đ&egrave;n, tại trung t&acirc;m bảo h&agrave;nh của Sony Việt Nam tr&ecirc;n to&agrave;n quốc.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="7" align="left" valign="top" width="952" height="22">\r\n<table cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="xl114" colspan="7" width="952" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + 248A Nơ Trang Long, Quận B&igrave;nh Thạnh, TP HCM.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="xl114" colspan="7" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + 191 B&agrave; Triệu, Quận Hai B&agrave; Trưng, TP H&Agrave; NỘI.</td>\r\n</tr>\r\n<tr>\r\n<td class="xl114" colspan="7" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + 45 Nguyễn Văn Linh, Đ&agrave; Nẵng.</td>\r\n</tr>\r\n<tr>\r\n<td class="xl114" colspan="7" height="22">4. Thời hạn giao h&agrave;ng: Ngay sau khi x&aacute;c nhận đơn h&agrave;ng</td>\r\n</tr>\r\n<tr>\r\n<td class="xl77" height="25">&nbsp;</td>\r\n<td class="xl192" colspan="4" width="457">CTY TNHH TM - DV HƯNG NAM</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl77">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl77" height="30">&nbsp;</td>\r\n<td class="xl192" colspan="4" width="457">93/6 L&acirc;m Văn Bền,F.T&acirc;n Thuận T&acirc;y,Q.7, TPHCM</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl77">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl77" height="27">&nbsp;</td>\r\n<td class="xl111" colspan="5" align="left">Mọi chi tiết xin li&ecirc;n hệ ph&ograve;ng kinh doanh hỗ trợ gi&aacute; tốt:</td>\r\n<td class="xl77">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl77" height="27">&nbsp;</td>\r\n<td class="xl112" colspan="4" align="left"><a href="tel:0987782434" target="_blank">Nguyễn Văn Hưng : 098.778.2434 &ndash; 093.213.2751&nbsp;</a></td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl77">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl77" height="27">&nbsp;</td>\r\n<td class="xl112" colspan="3" align="left"><a href="mailto:-hungnamcomputer@gmail.com">Email: hungnamcomputer@gmail.com</a></td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl77">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl77" height="27">&nbsp;</td>\r\n<td class="xl111" colspan="2" align="left">Nick chat:<span class="font7">hungnamcomputer</span></td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl77">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="xl77" height="55">&nbsp;</td>\r\n<td class="xl113" colspan="4" align="left">Xin c&aacute;m ơn qu&yacute; kh&aacute;ch</td>\r\n<td class="xl92">&nbsp;</td>\r\n<td class="xl77">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', '', NULL, 0, 19, '', 1, '2014-11-05 09:02:36', '', 0),
(32, 'bang-bao-gia-may-chieu-sony-2014', 'vn', 'BANG BAO GIA MAY CHIEU SONY 2014', '', '', '', '<table width="516" border="0">\r\n<tbody>\r\n<tr>\r\n<td>bang gia</td>\r\n<td>m&aacute;y chiếu</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', '', NULL, 0, 19, '', 1, '2014-11-05 09:19:16', '', 0),
(33, 'bang-gia-man-chieu-sony', 'vn', 'Bảng Giá Màn Chiếu Sony', '', '<p>Bảng Gi&aacute; M&agrave;n Chiếu Sony</p>', '', '', '', NULL, 0, 19, '801863143_man-chieuu.jpg', 2, '2014-11-07 13:43:22', '', 1),
(34, 'may-tinh-hung-nam', 'vn', 'MÁY TÍNH HƯNG NAM', '', '<p>M&aacute;y t&iacute;nh hưng nam chất lượng, gi&aacute; cực rẻ</p>', '', '<p>ffffffffffffffffffffffffffffffffffffffffffffff</p>\r\n<p><img src="../upload/Mau 2.png" alt="" /></p>', '', NULL, 0, 2, '1066972622_img_20141015_1655511.jpg', 0, '2014-11-15 10:40:00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `n_orders`
--

CREATE TABLE IF NOT EXISTS `n_orders` (
`id` bigint(20) NOT NULL,
  `cid` bigint(20) DEFAULT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cell` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `raddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rprovince` int(11) DEFAULT NULL,
  `rtel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rcell` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rdate` date DEFAULT NULL,
  `gift_box` tinyint(4) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deposited` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=126 ;

--
-- Dumping data for table `n_orders`
--

INSERT INTO `n_orders` (`id`, `cid`, `name`, `email`, `address`, `province`, `tel`, `cell`, `rname`, `raddress`, `rprovince`, `rtel`, `rcell`, `rdate`, `gift_box`, `comment`, `date_created`, `last_updated`, `status`, `code`, `deposited`) VALUES
(115, 0, '0', 'dieunga_pham@yahoo.com', '336/56A phan đăng lưu- bình thạnh', '0', '0932132751', '0', '0', '336/56A phan đăng lưu- bình thạnh', 0, '0932132751', '0', '2013-02-26', NULL, '0', '2014-11-04 10:57:06', '2014-11-04 10:57:06', 0, 'RB6Q77', NULL),
(114, 0, '0', 'dieunga_pham@yahoo.com', '336/56A phan đăng lưu- bình thạnh', '0', '0966452538', '0', '0', '336/56A phan đăng lưu- bình thạnh', 0, '0966452538', '0', '2013-02-26', NULL, '0', '2014-11-04 10:35:07', '2014-11-04 10:35:07', 0, 'WWVVZJ', NULL),
(113, 0, '0', 'phidung892000@gmail.com', 'fwfwfwef', '0', 'wfwefew', '0', '0', 'fwfwfwef', 0, 'wfwefew', '0', '2013-02-26', NULL, '0', '2014-11-04 02:45:36', '2014-11-04 02:45:36', 0, 'QWTNCK', NULL),
(112, 0, '0', 'phidung892000@gmail.com', '425 au co', '0', '0909090909', '0', '0', '425 au co', 0, '0909090909', '0', '2013-02-26', NULL, '0', '2014-11-04 02:38:02', '2014-11-04 02:38:02', 0, 'QLE9YA', NULL),
(111, 0, '0', 'dieunga_pham@yahoo.com', '336/56A phan đăng lưu- bình thạnh', '0', '01234581706', '0', '0', '336/56A phan đăng lưu- bình thạnh', 0, '01234581706', '0', '2013-02-26', NULL, '0', '2014-10-31 17:00:50', '2014-10-31 17:00:50', 0, 'WYDDQM', NULL),
(100, 0, '0', 'phidung892000@gmail.com', '425 au co', '0', '0907400754', '0', '0', '425 au o', 0, '09064323123', '0', '2013-02-26', NULL, '0', '2014-08-14 15:54:06', '2014-08-14 15:54:06', 0, 'NB41J7', NULL),
(110, 0, '0', 'dieunga_pham@yahoo.com', 'bình thạnh', '0', '0908457834', '0', '0', 'bình thạnh', 0, '0908457834', '0', '2013-02-26', NULL, '0', '2014-10-24 22:07:10', '2014-10-24 22:07:10', 2, '9YHDX2', NULL),
(109, 0, '0', 'dieunga_pham@yahoo.com', 'bình thạnh', '0', '0908457834', '0', '0', 'bình thạnh', 0, '0908457834', '0', '2013-02-26', NULL, '0', '2014-10-24 22:04:28', '2014-10-24 22:04:28', 0, 'ZKGSA5', NULL),
(116, 0, '0', 'phidung892000@gmail.com', '425 au do', '0', '90093424', '0', '0', '425 au do', 0, '90093424', '0', '2013-02-26', NULL, '0', '2014-11-08 10:09:50', '2014-11-08 10:09:50', 2, '3MRDUJ', NULL),
(117, 0, '0', 'dieunga_pham@yahoo.com', 'Bình Thạnh', '0', '0866834337', '0', '0', 'Bình Thạnh', 0, '0866834337', '0', '2013-02-26', NULL, '0', '2014-11-08 10:11:51', '2014-11-08 10:11:51', 2, 'KXSS1N', NULL),
(118, 0, '0', 'phamthidieunga@gmail.com', 'Bình Thạnh', '0', '0966452538', '0', '0', 'Bình Thạnh', 0, '0966452538', '0', '2013-02-26', NULL, '0', '2014-11-14 10:37:53', '2014-11-14 10:37:53', 2, 'PC97F1', NULL),
(119, 0, '0', 'marketinghome.vn@gmail.com', 'Bình Thạnh', '0', '0966452538', '0', '0', 'Bình Thạnh', 0, '0966452538', '0', '2013-02-26', NULL, '0', '2014-11-14 10:41:35', '2014-11-14 10:41:35', 2, 'MDSBQF', NULL),
(120, 0, '0', 'ffff@gmail.com', 'fff', '0', 'ffff', '0', '0', 'ffff', 0, 'ffffff', '0', '2013-02-26', NULL, '0', '2014-11-15 10:42:31', '2014-11-15 10:42:31', 2, 'T9KWX9', NULL),
(121, 0, '0', 'phidung892000@gmail.com', 'test ', '0', '09', '0', '0', 'test ', 0, '09', '0', '2013-02-26', NULL, '0', '2015-01-29 08:33:25', '2015-01-29 08:33:25', 1, 'WC2MXG', NULL),
(122, 0, '0', 'phidung892000@gmail.com', '0', 'Tiền mặt', '0', '0', 'nguyen phi dung', '425 au co', 0, '0907 4007 54', '0', '0000-00-00', NULL, 'dbgbdd', '2015-03-16 17:39:11', '2015-03-16 17:39:11', 1, 'TF7E53', NULL),
(123, 0, '0', 'phidung892000@gmail.com', '0', 'Chuyển khoản', '0', '0', 'nguyen phi dung', '425 au co', 0, '0907 4007 54', '0', '0000-00-00', NULL, 'dfvrsvrvrevrev', '2015-03-16 19:22:20', '2015-03-16 19:22:20', 1, 'ERDJ6T', NULL),
(124, 0, '0', '0', '0', '0', '0', '0', 'nguyen phi dung', '425 au co', 0, '0907 4007 54', '0', '2015-06-10', NULL, 'FGBRGBREBGERBREB', '2015-06-10 06:07:51', '2015-06-10 06:07:51', 1, 'P35XHJ', NULL),
(125, 0, '0', 'phidung892000@gmail.com', '0', '0', '0', '0', 'nguyen phi dung', '425 au co', 0, '0907 4007 54', '0', '2015-06-10', NULL, 'fvvvev', '2015-06-10 06:10:02', '2015-06-10 06:10:02', 1, 'N9XQK6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `n_order_items`
--

CREATE TABLE IF NOT EXISTS `n_order_items` (
`id` bigint(20) NOT NULL,
  `oid` int(20) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_size` varchar(200) DEFAULT NULL,
  `product_color` varchar(200) DEFAULT NULL,
  `quantity` varchar(20) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `status` int(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=263 ;

--
-- Dumping data for table `n_order_items`
--

INSERT INTO `n_order_items` (`id`, `oid`, `pid`, `slug`, `product_name`, `product_size`, `product_color`, `quantity`, `price`, `date_created`, `status`) VALUES
(227, 100, 7874, '31700_pic-88.jpg', 'san pham 2', 'size x', 'xanh', '1', '300000', '2014-08-14', NULL),
(226, 100, 7873, '22347_pic-55.jpg', 'Quần chip 1', 'size m', 'do', '1', '200000', '2014-08-14', NULL),
(228, 101, 7874, '31700_pic-88.jpg', 'san pham 2', 'size S', 'trang', '1', '300000', '2014-08-14', NULL),
(229, 102, 7874, '31700_pic-88.jpg', 'san pham 2', 'size M', '?en', '1', '300000', '2014-08-14', NULL),
(230, 103, 7874, '31700_pic-88.jpg', 'san pham 2', 'size M', 'Xanh ?en', '1', '300000', '2014-08-14', NULL),
(231, 104, 7874, '31700_pic-88.jpg', 'san pham 2', 'size M', 'Tr?ng', '1', '300000', '2014-08-14', NULL),
(232, 105, 7874, '31700_pic-88.jpg', 'san pham 2', 'size XL', 'Tr?ng', '1', '300000', '2014-08-14', NULL),
(233, 106, 7874, '31700_pic-88.jpg', 'san pham 2', 'size S,size M', 'Tr?ng', '2', '300000', '2014-08-14', NULL),
(234, 107, 7874, '31700_pic-88.jpg', 'san pham 2', '0', '0', '1', '300000', '2014-08-14', NULL),
(235, 108, 7892, '2091761026_apoint-m66.jpg', 'Mouse  Apoint M6', '0', '0', '1', '71000', '2014-10-17', NULL),
(236, 109, 7912, '1435440076_11.jpg', 'SVF1421ESG', '0', '0', '1', '9990000', '2014-10-24', NULL),
(237, 110, 7913, '130762502_55.jpg', 'SVF1421PSG', '0', '0', '1', '9990000', '2014-10-24', NULL),
(238, 111, 7902, '554690168_epson-18-22.png', 'EPSON EB-S18', '0', '0', '1', '10550000', '2014-10-31', NULL),
(239, 111, 7893, '1280468441_apoint-t11.jpg', 'Mouse Wireless  Apoint  T1', '0', '0', '1', '105000', '2014-10-31', NULL),
(240, 111, 7912, '1435440076_11.jpg', 'SVF1421ESG', '0', '0', '1', '9990000', '2014-10-31', NULL),
(241, 112, 7922, '1404200130_44.jpg', 'Màn Chiếu 3 Chân 84&quot; x 84&quot;', '0', '0', '1', '0', '2014-11-04', NULL),
(242, 112, 7912, '1435440076_11.jpg', 'SVF1421ESG', '0', '0', '1', '9990000', '2014-11-04', NULL),
(243, 112, 7921, '2079099647_11.jpg', 'Màn Chiếu 3 Chân 70&quot; x 70&quot;', '0', '0', '1', '0', '2014-11-04', NULL),
(244, 112, 7923, '1675619112_aaa.JPG', 'Màn Chiếu Điện 70&quot; x 70&quot;', '0,0,0,0', '0', '4', '0', '2014-11-04', NULL),
(245, 113, 7912, '1435440076_11.jpg', 'SVF1421ESG', '0', '0', '1', '9990000', '2014-11-04', NULL),
(246, 114, 7891, '242306618_apoint-m-22.jpg', 'Mouse  Apoint M2', '0', '0', '1', '55000', '2014-11-04', NULL),
(247, 114, 7912, '1435440076_11.jpg', 'SVF1421ESG', '0', '0', '1', '9990000', '2014-11-04', NULL),
(248, 115, 7892, '2091761026_apoint-m66.jpg', 'Mouse  Apoint M6', '0,0', '0', '2', '71000', '2014-11-04', NULL),
(249, 115, 7904, '1714864271_epson-eb925-22.jpg', 'EPSON EB-925', '0', '0', '1', '17650000', '2014-11-04', NULL),
(250, 116, 7924, '1254721668_bbb.JPG', 'Màn Chiếu Điện 84&quot; x 84&quot;', '0', '0', '1', '0', '2014-11-08', NULL),
(251, 116, 7925, '616394914_sonyy.jpg', 'Test', '0', '0', '1', '4500000', '2014-11-08', NULL),
(252, 117, 7910, '271889502_22.jpg', 'Toshiba NPS15A ', '0', '0', '1', '10000000', '2014-11-08', NULL),
(253, 117, 7919, '148919222_aa.jpg', 'Màn chiếu treo tường 70&quot; x 70&quot;', '0', '0', '1', '0', '2014-11-08', NULL),
(254, 118, 7912, '1435440076_11.jpg', 'SVF1421ESG', '0', '0', '1', '9990000', '2014-11-14', NULL),
(255, 119, 7902, '554690168_epson-18-22.png', 'EPSON EB-S18', '0', '0', '1', '10550000', '2014-11-14', NULL),
(256, 119, 7913, '130762502_55.jpg', 'SVF1421PSG', '0', '0', '1', '9990000', '2014-11-14', NULL),
(257, 120, 7898, '1558374857_key-mouse-apointt.jpg', 'Phím  WINCOM  K7 + Mouse Apoint  M6 ', '0', '0', '1', '186000', '2014-11-15', NULL),
(258, 121, 7968, '872065571_tai-xuongg.jpg', 'MÁY SOI TIỀN HT - 106', '0', '0', '1', '5900000', '2015-01-29', NULL),
(259, 122, 7970, '9295_img_12844.JPG', 'Laptop Dell AlienWare M17x R3 ', '0,0,0,0,0,0,0,0,0,0,0,0,0', '0', '13', '21500000', '2015-03-16', NULL),
(260, 123, 7970, '9295_img_12844.JPG', 'Laptop Dell AlienWare M17x R3 ', '0', '0', '1', '21500000', '2015-03-16', NULL),
(261, 124, 7969, '8381_pd-11.jpg', 'DELL ALIENWARE M17X R5 CARD CARD RỜI 4G', '0,0,0,0,0,0,0,0,0,0,0,0', '0', '12', '7000000', '2015-06-10', NULL),
(262, 125, 7969, '8381_pd-11.jpg', 'DELL ALIENWARE M17X R5 CARD CARD RỜI 4G', '0,0,0,0', '0', '4', '7000000', '2015-06-10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `n_parts`
--

CREATE TABLE IF NOT EXISTS `n_parts` (
`id` int(10) NOT NULL,
  `vn_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `position` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `n_parts`
--

INSERT INTO `n_parts` (`id`, `vn_name`, `en_name`, `status`, `position`) VALUES
(5, 'Bộ phận chăm sóc khách hàng', 'Bộ phận chăm sóc khách hàng', 1, 2),
(7, 'Bộ phận kinh doanh', 'Bộ phận kinh doanh', 1, 1),
(10, 'Bộ phận bảo hành - kỹ thuật', 'Bộ phận bảo hành - kỹ thuật', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `n_poll`
--

CREATE TABLE IF NOT EXISTS `n_poll` (
`id` int(11) NOT NULL,
  `idproduct` int(11) DEFAULT NULL,
  `iduser` text COLLATE utf8_unicode_ci,
  `chatluong_vote` int(11) DEFAULT NULL,
  `hinhdang_vote` int(11) DEFAULT NULL,
  `gia_vote` int(11) DEFAULT NULL COMMENT 'id category of poll',
  `status` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL,
  `q1_vote` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `n_poll`
--

INSERT INTO `n_poll` (`id`, `idproduct`, `iduser`, `chatluong_vote`, `hinhdang_vote`, `gia_vote`, `status`, `name`, `title`, `comment`, `date_created`, `q1_vote`) VALUES
(1, 1, '', 122, NULL, 1, 1, 'Internet', 'Internet', NULL, '0000-00-00 00:00:00', NULL),
(2, 2, '', 5, NULL, 1, 1, 'Báo chí', 'Báo chí', NULL, '2013-01-21 04:24:58', NULL),
(3, 3, '', 50, NULL, 1, 1, 'Quảng cáo', 'Quảng cáo', NULL, '2013-01-21 05:01:56', NULL),
(4, 4, '', 1, NULL, 1, 1, 'Bạn bè', 'Bạn bè', NULL, '2013-01-21 04:25:04', NULL),
(5, 5, '', 1, NULL, 1, 1, 'Khác', 'Khác', NULL, '2013-01-21 04:25:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `n_productpic_host`
--

CREATE TABLE IF NOT EXISTS `n_productpic_host` (
`productpicid` int(11) NOT NULL,
  `productid` int(11) NOT NULL DEFAULT '0',
  `productpicname` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7515 ;

--
-- Dumping data for table `n_productpic_host`
--

INSERT INTO `n_productpic_host` (`productpicid`, `productid`, `productpicname`) VALUES
(100, 26, '2249578673625DELLPIII933.jpg'),
(1005, 2756, '817717864653EPSON S042071.jpg'),
(1007, 2281, '1500512387528EPSON S041061.jpg'),
(101, 27, '768324223414dell150.jpg'),
(1015, 2758, '6807090156002S042070.png'),
(1016, 2757, '8565583762103C13S041863.jpg'),
(1019, 1952, '3076388492824SpeedTouch 330 USB ADSL Modem.jpg'),
(102, 28, '6285651381319DIMSD128.jpg'),
(1025, 2279, '9699092764461aa.jpg'),
(1026, 2759, '8993926946841ac.jpg'),
(103, 29, '3497222928673Dimen 8100.jpg'),
(104, 29, '5175144280570Dimen 8100 1.jpg'),
(105, 29, '7674413255971Dimen 8100 2.jpg'),
(106, 30, '1987864427256Dimen 4500.jpg'),
(1069, 1953, '155234034478draytekusb.jpg'),
(107, 31, '8750188849122Micron845.jpg'),
(1078, 1965, '1330699360394ADE3400.jpg'),
(1079, 1966, '2315736324663ADE4100.jpg'),
(108, 32, '3477142877534DELL_OPTIPLEX_GX240_1.jpg'),
(1082, 1957, '3740091778104CAR2-804.jpg'),
(1089, 1959, '9851832860846PROLINK4P.jpg'),
(109, 33, '2720105022447EVO D220.jpg'),
(1096, 1960, '8798200011843COMPEX1P.jpg'),
(1097, 1961, '6749469575702COMPEXWL.jpg'),
(1101, 1955, '3641313727208GVC4P.gif'),
(1104, 1987, '9124411670173d624.jpg'),
(1105, 1994, '4587632099412000ap.jpg'),
(1107, 1996, '907532746468zion.jpg'),
(112, 36, '9675312885134Comp 7500.bmp'),
(113, 39, '7518353298714namecard.jpg'),
(1131, 2247, '1140155266480Canon EP22 Black Toner.jpg'),
(1133, 2249, '2743774647658CANON  -  EP25.jpg'),
(1134, 2248, '327699339606CANON  -  303.jpg'),
(1135, 2250, '3547108793909CANON  -  EP26.gif'),
(1136, 2251, '1273383741837CANON  -  EP65.jpg'),
(1137, 2252, '6202531757295CANON  -  BC 02.jpg'),
(1138, 2253, '4519036223985CANON  -  3EBK.jpg'),
(1139, 2254, '2758103527602CANON  -  6I 6M 6C.jpg'),
(114, 40, '9323187218939namecard.jpg'),
(1140, 2255, '2947733037508CANON  -  BCI 21C.jpg'),
(1141, 2256, '7475976282367CANON  -  BCI 24B BCI 24C.jpg'),
(1142, 2257, '8953988920775CANON  -  BCI 15B  BCI 16C.jpg'),
(1143, 2258, '762420552942CANON  -  PG 40 CL 41.jpg'),
(1144, 2259, '5483646881996CANON  -  PGI 5BK.jpg'),
(1145, 2260, '3711738879958CANON  -  CLI 8C.jpg'),
(1148, 2262, '3166935090090CANON  -  EP87C.jpg'),
(1150, 2261, '4909575411195CANON  -  EP87BK.jpg'),
(1152, 2264, '4440074754639OKI 5000K.jpg'),
(1174, 1502, '6481183458194AF630.jpg'),
(1177, 2265, '3559913267581OKI 5000C.jpg'),
(1178, 2263, '5445537923946OKI 8Z.bmp'),
(1180, 2266, '8165288614990XEROX  3110.gif'),
(1181, 2267, '9982317584179XEROX  DP211.jpg'),
(1190, 2273, '3461744938949Laser Xerox.jpg'),
(1191, 2274, '6365942397593Laser Xerox.jpg'),
(1194, 2151, '1650203771367V10_Left.jpg'),
(1201, 1911, '1450208678071MICROLAB - M6664.jpg'),
(1204, 1920, '4462025365950Nansin Speaker S860 4.1.jpg'),
(1205, 1927, '1712397370487CREATIVE  SBS  580.jpg'),
(1272, 1312, '3252908568536NFORCE4-A939.jpg'),
(1273, 1313, '274804285955K8NGM2.jpg'),
(1274, 1314, '1872149575973RS482M4.gif'),
(1277, 2771, '6698556143980M2NPV-MX.jpg'),
(1278, 2772, '3923928724660M2N4-SLI.jpg'),
(1279, 2773, '472183724124M2N32-SLI Deluxe Wireless Edition.jpg'),
(1281, 2775, '934062748092GA-M57SLI-S4.jpg'),
(1282, 2776, '2771213061796GA-M59SLI-S5.jpg'),
(1288, 2780, '8348820798582M2NPV-VM.jpg'),
(1327, 1365, '8814967980848128MB SDRAM.jpg'),
(1328, 1370, '9109777829707twinmos.gif'),
(1330, 1371, '7972915353060untitled.bmp'),
(1333, 1374, '606046196043dd512-333 elixer.jpg'),
(1336, 1378, '4762627878159KINGSTON DDRAM 256-533.jpg'),
(1339, 1380, '1064242410902UMAX DDRAM 2  1 GB - 667.jpg'),
(1340, 1381, '6604960934168twinmos.gif'),
(1343, 1383, '4712933990967Kingston 128MB DDRam Bus 400.jpg'),
(1344, 1385, '949726834370untitled.bmp'),
(1351, 1397, '7662252119204TEAM.jpg'),
(1354, 1403, '2556584028034untitled.bmp'),
(1357, 1406, '117924028169twinmos.gif'),
(1360, 1409, '8069559375418small_sp_pc3200.gif'),
(1361, 1410, '1027657957904TEAM-PC4200.jpg'),
(1366, 2796, '5534560114939untitled.bmp'),
(1367, 2797, '2337686935974DDR2.gif'),
(1368, 2798, '46040950184231056.jpg'),
(1379, 2809, '778359064897sa.jpg'),
(1382, 2812, '8502475578976Twinmos.jpg'),
(1413, 1438, '753877954973Apacer HA202 512MB.jpg'),
(3555, 3501, '6979342073417HP vp15.jpg'),
(3557, 3206, '4211116840933M500F.jpg'),
(3561, 3092, '859674297566i River     T10 1GB.jpg'),
(3563, 3093, '288340539850i River T10 2GB.jpg'),
(3565, 3503, '65141094751592GB iRIVER S10.jpg'),
(3566, 3502, '88314309893302GB iRIVER S10.jpg'),
(3567, 3504, '2240433290129Iriver E10.jpg'),
(3568, 3505, '4516597233704iRiver U10.jpg'),
(3569, 3506, '4310809575837iRiver U10.jpg'),
(3570, 3091, '7810419295549i RIVER T10.jpg'),
(3571, 3184, '16060596260iAUDIO U2.jpg'),
(3577, 3186, '6960744936396iAUDIO U2 2GB.jpg'),
(3579, 3185, '7682983384763iAUDIO    U2 1GB.jpg'),
(3580, 3507, '736201683334iAUDIO X5.jpg'),
(3581, 1984, '9334772346859wrt54gc.jpg'),
(3582, 1985, '253286632064WRT300N_med.jpg'),
(3583, 2958, '8491500273320WUSB54GC_med.jpg'),
(3587, 1461, '2905965843426MuVo V200.jpg'),
(3588, 1462, '335260124662MuVo V200.jpg'),
(3592, 3509, '4089778355239MuVo  Slim.jpg'),
(3593, 3508, '8503999985249MuVo  Slim.jpg'),
(3594, 3096, '8836613731636ZEN V Plus.jpg'),
(3595, 3098, '8231140748921ZEN V Plus.jpg'),
(3596, 1459, '8698202515195MUVO VIDZ.jpg'),
(3597, 3510, '3085839492206JVJ DVR 950.jpg'),
(3598, 3511, '723573812483JVJ DVR 950.jpg'),
(3599, 3512, '7951038376SAFA SR 320N.jpg'),
(3600, 3513, '118838712177SAFA SR 380N.jpg'),
(3601, 3514, '9809150982756SAFA R200.jpg'),
(3602, 3515, '6954952371825SAFA R200.jpg'),
(3603, 3516, '7861637589014SAFA SR-M.jpg'),
(3604, 3517, '266694728072SAFA SR-M.jpg'),
(3606, 1712, '6167776472313LG T530S.jpg'),
(3609, 3518, '6745506279147CENIX VR  -P600.jpg'),
(3612, 3078, '1941355284194OK.jpg'),
(3613, 1554, '3105351114456OK.jpg'),
(3614, 1555, '3071205651740OK.jpg'),
(3615, 1558, '7698836670981OK.jpg'),
(3616, 1559, '4940367398401OK.jpg'),
(3618, 1566, '2733713926011OK.jpg'),
(3623, 3519, '1380698193291GB.jpg'),
(364, 1301, '5538523511493ABIT NF8 V2.jpg'),
(3642, 3524, '1832516311650TEAM.jpg'),
(3651, 3527, '5616570395609VA503m.jpg'),
(3657, 3297, '510597443917HP Pavilion g2000.jpg'),
(3658, 3528, '6884222357331HP Pavilion a6037l.jpg'),
(3660, 3530, '1786480959270SUNNY AF650.jpg'),
(3661, 3531, '8571071464931SUNNY AF650.jpg'),
(3662, 3532, '1649594049102SUNNY AF650.jpg'),
(3663, 3533, '6989707656807Sunny AF670.jpg'),
(3664, 3534, '9118009383337Sunny AF670.jpg'),
(3666, 1452, '28376747192131GB RAMDISK A-DATA.jpg'),
(3668, 3535, '1995927051948Mobile Disk L2.jpg'),
(3669, 2818, '9238738046766Mobile Disk L2.jpg'),
(3670, 2817, '15508159969842GB A-DATA.jpg'),
(3691, 3539, '374015494271KB 220.jpg'),
(3692, 3540, '5946745251715SlimStar 310.jpg'),
(3693, 3541, '1761176673670SlimStar 250.jpg'),
(3694, 3542, '2187690690391ErgoMedia 700.jpg'),
(3695, 3543, '5672056847372ErgoMedia 500.jpg'),
(3696, 3544, '4752567056511SlimStar C100.jpg'),
(3697, 3545, '6811358314299TwinTouch LuxeMate Pro.jpg'),
(3698, 3546, '6526304226565LuxeMate 810 Media.jpg'),
(3699, 3547, '6501914624974SlimStar R610.jpg'),
(3700, 3548, '8316809365624SlimStar 820 Solargizer.jpg'),
(3701, 3549, '9675617646877LuxeMate 300.jpg'),
(3703, 3550, '31712032483871.jpg'),
(3704, 3551, '80034023797441.jpg'),
(3705, 3552, '18529427166872.jpg'),
(3706, 3553, '50967660308191.jpg'),
(3707, 3554, '8178093287440A4 TECH slim.gif'),
(3708, 3555, '7829626156056A4 TECH slim mini.gif'),
(3709, 3556, '284407706049A4 TECH.gif'),
(3710, 3557, '7124460438437X7.gif'),
(3712, 3558, '1448074549533A4          TECH KIP-800.jpg'),
(3713, 3559, '4522389797053KENSINGTON 332A.jpg'),
(3715, 3561, '1964220579512KENSINGTON 365.jpg'),
(3716, 3562, '4680007874002VENR PS2.jpg'),
(3717, 3563, '8818626316880VENR USB.jpg'),
(3718, 3560, '4287944280519KENSINGTON 333A.jpg'),
(3721, 3564, '4611411988046CAKBE3CT.jpg'),
(3723, 3566, '7290919791281CA01E7CH.jpg'),
(3727, 3568, '8347374930CAK1IR8P.jpg'),
(3728, 3567, '8500036688694CAK1IR8P.jpg'),
(3729, 3569, '4623301977709PS2 Multimedia Keyboard.jpg'),
(3730, 3570, '5715958269992HP.jpg'),
(3732, 3572, '8754603549744GIGABYTE.jpg'),
(3736, 3575, '6170215462595CANVHZRO.jpg'),
(3737, 3574, '668941006341CANVHZRO.jpg'),
(3738, 3573, '4053498763984CANVHZRO.jpg'),
(3739, 3576, '7868649598115XScroll 120.jpg'),
(3741, 3578, '6756176724280Traveler 100.jpg'),
(3743, 3580, '2928221316479Traveler 320.jpg'),
(3744, 3581, '5621753137915Traveler P330.jpg'),
(3745, 3582, '9095753711505Traveler 355 Laser.jpg'),
(3746, 3583, '8528084726318Navigator 335.jpg'),
(3747, 3584, '53291538768Navigator 380.jpg'),
(3748, 3585, '129509156089Navigator 535.jpg'),
(3749, 3586, '4857747494244Ergo 3000.jpg'),
(3750, 3587, '6963793648942Wireless Mini Navigator.jpg'),
(3751, 3588, '8582046770586Traveler 915 Laser.jpg'),
(3753, 3590, '2298358632172Media Pointer.jpg'),
(3754, 3591, '2780359199435MITSUMI OPTICAL.jpg'),
(3755, 3592, '3782468894452MITSUMI OPTICAL.jpg'),
(3756, 3593, '5810772925556MITSUMI OPTICAL.jpg'),
(3759, 3596, '4645862312506X6-999D.gif'),
(3760, 3597, '6122960465685HITOM 850.jpg'),
(3761, 3598, '9782017530361HITOM 830.jpg'),
(3762, 3599, '7654020664352HITOM 8901.jpg'),
(3763, 3600, '5566266786153HITOM 8908.jpg'),
(3764, 3595, '7242140488097mop-60D.gif'),
(3765, 3601, '9187824615044A4 R7 - 70D.gif'),
(3766, 3602, '8465586265455A4 R7 - 20D.gif'),
(3767, 3594, '9746957383636OP 620   D.gif'),
(3769, 3604, '5563218073607X-750F.gif'),
(3770, 3605, '6321431252707X5-005D.gif'),
(3771, 3606, '2196531967508MOP-18.gif'),
(3772, 3603, '7807675444746Mop-57.gif'),
(3773, 3607, '3564791148143Acer 5685 WLMi.jpg'),
(3775, 3609, '9952135319237Acer 5585 WXMi.jpg'),
(3777, 3611, '2656276762938CRE  ATIVE.jpg'),
(3780, 3612, '66503866630623D- 510.jpg'),
(3781, 3613, '4201665841551SUPERDELUX.jpg'),
(3782, 3614, '752359831295LO GITECH.jpg'),
(3784, 3615, '703275666369ViewSonic   MU-201.jpg'),
(3785, 3616, '9603668286632KENSINGTON BLUETOOTH 414.jpg'),
(3790, 3619, '6199482944749TVS200.jpg'),
(3791, 3620, '1435879798127CN01V3.jpg'),
(3792, 3621, '952659885113CVR200.jpg'),
(3793, 3622, '1312407183895TSM014AP.jpg'),
(3794, 3623, '5451940210782TLT012.jpg'),
(3795, 3624, '7370795844634CTM300.jpg'),
(3796, 3625, '8073217711451TARGUS CCL416.jpg'),
(3797, 3626, '8890575875904TBT020AP.jpg'),
(3798, 3627, '8533572329146TBT005AP.jpg'),
(3799, 3628, '4301358576455CRV407.jpg'),
(3800, 3629, '795279389766TSB03801AP.jpg'),
(3801, 3630, '4148008657805TSB03802AP.jpg'),
(3802, 3631, '3264188735935TSM012AP.jpg'),
(3803, 3632, '3567839960690TBT004AP.jpg'),
(3804, 3633, '7118972735609CVR600.jpg'),
(3805, 3634, '5354076742672TBT003AP.jpg'),
(3806, 3635, '4151362232094TBT021AP.jpg'),
(3807, 3636, '6735140695757TBT022AP.jpg'),
(3808, 3637, '936806598895TCM005US.jpg'),
(3809, 3638, '4173008081661TBT002AP.jpg'),
(3810, 3639, '2783102951459TSB040AP.jpg'),
(3811, 3640, '1705080499643TCT009US.jpg'),
(3812, 3641, '9133252847290TCG350AP.jpg'),
(3813, 3642, '1089851557024TCG400AP.jpg'),
(3814, 3643, '8306138821712TSB068AP.jpg'),
(3815, 3644, '808760865844TSB06801AP.jpg'),
(3816, 3645, '7879320043248TSB408.jpg'),
(3817, 3646, '2023670227829TSB017AP.jpg'),
(3818, 3647, '367003385170TSB06902AP.jpg'),
(3819, 3648, '47706164686TSB018AP.jpg'),
(3826, 3655, '1249908624253Dynamic VII.jpg'),
(3827, 3656, '4058376744547Dynamic X.jpg'),
(3828, 3657, '1925197037454Dynamic V.jpg'),
(3829, 3658, '9904270698841Dynamic XI.jpg'),
(3830, 3659, '7065010690120Dynamic XIII.jpg'),
(3831, 3664, '5732116317953GOLLA G331.jpg'),
(3832, 3665, '2007512179868GOLLA G337.jpg'),
(3833, 3666, '297797776950Golla G334.jpg'),
(3838, 3667, '2592253995802Geforce 7300GS.jpg'),
(3839, 3234, '2239823567864GeForce 7300.jpg'),
(3857, 3671, '5859857189261ASUS CD.jpg'),
(3858, 3672, '6412282611716ASUS CD den.jpg'),
(3863, 1844, '29816421185DVD 16X Samsung.jpg'),
(3864, 1838, '5875405514957CD 52X   Samsung.jpg'),
(3867, 1846, '5597668496845dvd.jpg'),
(3868, 1847, '5094936762803DVD.jpg'),
(3869, 1848, '213653466520DVD.jpg'),
(3892, 1845, '1130094544833LG H42N.jpg'),
(3893, 1839, '6954647411303LG H42N.jpg'),
(3899, 3215, '7717128847480ThinkCentre E50.jpg'),
(3900, 3216, '796870976181ThinkCentre E50.jpg'),
(3911, 3684, '2285554158501Cable 5C.jpg'),
(3912, 3685, '278584673483Adaptor Camera 12VDC-500mA.jpg'),
(3917, 3687, '9514341135118DCS-950.gif'),
(3918, 3688, '709244905479DCS-950G.gif'),
(3919, 3689, '2711763214700DCS-2100.gif'),
(3920, 3690, '627667771313DCS-2100G.gif'),
(3936, 3691, '9746042799628520T.gif'),
(3937, 3692, '9366174057551DSL-2540T.gif'),
(3938, 3693, '2141960099754DSL-2640T.gif'),
(3942, 3696, '4676349439190WAG200G.jpg'),
(3943, 3697, '3769969182524wag54g.jpg'),
(3944, 3698, '5263225383663WAG325N.jpg'),
(3948, 3695, '3376686044511ag241.jpg'),
(3949, 3694, '158471876501AM 300.jpg'),
(3955, 3704, '856527891581Vigor2800.jpg'),
(3956, 3705, '8025657952798Vigor2800g.jpg'),
(3965, 3707, '209995031708SpeedTouch 330 USB ADSL Modem.jpg'),
(3966, 3708, '9831101694066st510v6.jpg'),
(3967, 3709, '3462964483479st530v6.jpg'),
(3968, 3710, '969482457384546V6.jpg'),
(3974, 3711, '9748786651652mCAR2-701U.jpg'),
(3975, 3712, '6204665785833CNET 4PORT - CAR2-804.jpg'),
(3976, 3713, '139960018093ST585.jpg'),
(3977, 3714, '4927562825951h9200-bb.jpg'),
(3978, 3715, '5318711835425Hurricane 9200P.jpg'),
(3980, 3717, '9401538964798h9200g-b.jpg'),
(3981, 3718, '4516902194226M-600-2.jpg'),
(3983, 3719, '9341784355960TSB04001AP.jpg'),
(3984, 3720, '7470793441282CTM900.jpg'),
(3985, 3721, '2098363538877PLANET 1PORT ADE-3410.jpg'),
(3986, 3723, '9592997742720PLANET 1PORT ADE-3410.jpg'),
(3987, 3724, '3008402330355ADW-4401.jpg'),
(3994, 3725, '3898929399583TD-8810.jpg'),
(3996, 3726, '292614935865TD-8840.jpg'),
(4001, 3727, '8782346725625A2R-411A.jpg'),
(4002, 3728, '6730872438681A2WR-S511A.jpg'),
(4003, 3729, '1754774386834TAMIO  600.jpg'),
(4004, 1901, '4310199853572M-528.jpg'),
(4011, 1904, '8532352883395M-800 2 1.jpg'),
(4012, 1908, '761987512856MICROLAB - M6321.jpg'),
(4014, 3731, '3719665473067p_companion2_m.jpg'),
(4015, 3732, '4599522098383p_companion3_m.jpg'),
(4016, 3733, '6904953524112p_companion5_m.jpg'),
(4017, 3734, '6918672780570512MB USB 2.0.jpg'),
(4028, 3735, '9860369276220WM-G500R_med.jpg'),
(4029, 3736, '6262591227877WL-G54RAP_med.jpg'),
(4030, 3737, '184385884365WLG-54MAR_med.jpg'),
(4031, 3738, '596442775949WLG-108AAP__small.jpg'),
(4032, 3739, '2697129473013WRT54GC.jpg'),
(4033, 3740, '4511414491398WRT54G.jpg'),
(4034, 3741, '9624399453413WRT54GS.jpg'),
(4035, 3742, '2989195469848WRT300N.jpg'),
(4038, 3744, '9872259265884DI-624_angled_right_main.jpg'),
(4040, 3745, '5648644499282000AP.gif'),
(4041, 3746, '202068338599DWL-2100AP.gif'),
(4042, 3747, '4794944172859INWR 48G.jpg'),
(4043, 3748, '6979951795682INAP88GA.jpg'),
(4045, 3750, '8937221050549WGH 950.jpg'),
(4048, 3752, '1809346254588images.jpg'),
(4053, 3387, '174989647493154W.gif'),
(4054, 3753, '659886349075512MB USB 2.0.jpg'),
(4058, 3756, '5999792713196DWL-G510_main.jpg'),
(4059, 3757, '5460171764412DWL-G630_main.jpg'),
(4060, 3758, '5457732874131DWL-G650_main.jpg'),
(4061, 3759, '2120923972452DWL-G520_main.jpg'),
(4062, 3760, '3949233010260DWL-G122_main.jpg'),
(4063, 3761, '898478089202DWL-G520M_main.jpg'),
(4064, 3762, '489860015539DWL-G650M_main.jpg'),
(4069, 3763, '37035073263271.jpg'),
(4070, 3764, '2732799342003DGE-530T.jpg'),
(4071, 3765, '571571597286WL-G54MPC.jpg'),
(4072, 3766, '2351406192432WLG-108APC.gif'),
(4073, 3767, '7273542198790WL-G108AUB.gif'),
(4075, 3768, '7939989236094WLG-54RUB.jpg'),
(4077, 3770, '4184898071325WLG-108AIA.gif'),
(4078, 3769, '4611107127524WL-G54LUB.gif'),
(4079, 3771, '9106119393674TL-6800EK_med.jpg'),
(4080, 3772, '6954647411303TL-8000TX_med.jpg'),
(4081, 3773, '1842272271554WUSB54GC_med.jpg'),
(4082, 3774, '243006271256wmp54g.jpg'),
(4084, 3775, '2186166384118wpc 54g.jpg'),
(4085, 3776, '2032816365468wusb54g.jpg'),
(4086, 3777, '5995829416642CWP- 854.jpg'),
(4087, 3778, '3902892796137CWC- 854.jpg'),
(4088, 3779, '5807419351266CWD- 854.jpg'),
(4089, 3780, '1958123054419FAST200.jpg'),
(4090, 3781, '4503487798289ProG-2000S.jpg'),
(4094, 2816, '6084546745891AH124.jpg'),
(4095, 3784, '5509255929339AH125.jpg'),
(4096, 3785, '2471830094117AH125.jpg'),
(4097, 3786, '7453110987048AH124.jpg'),
(4098, 3787, '1662703483295yp-k3.gif'),
(4100, 3788, '895649028299lcdmon-540n.gif'),
(4101, 2150, '8036938120196V350.jpg'),
(4102, 3789, '4733055335482images.jpg'),
(4108, 3794, '3593144146289X20.jpg'),
(4109, 3795, '4506231650314X20.jpg'),
(4110, 3796, '41848980713252GB iRIVER U20 CLIX.jpg'),
(4115, 3799, '3471195938331yp-k3.gif'),
(4116, 3800, '4152886538367yp-k3.gif'),
(4117, 3801, '3019377636010SH-9305RS_med.jpg'),
(4118, 3802, '9759761957307SH-7250GT_med.jpg'),
(4119, 3803, '9675617646877SH-9308RS_med.jpg'),
(4120, 3804, '5216885070761SH-7280GT_med.gif'),
(4121, 3805, '8906429162121SH-9316R_med.jpg'),
(4122, 3806, '8168337327536SH-9316RS_med.jpg'),
(4123, 3807, '8646984221730SH-9324E_med.jpg'),
(4124, 3808, '4901039094600SH-9324RS_med.jpg'),
(4125, 3809, '1281310334946DES-1016D.jpg'),
(4126, 3810, '2959318165428DES-1018DG.gif'),
(4127, 3811, '8035108952180DGS-1016D.jpg'),
(4128, 3812, '794181854111DES-1024D.jpg'),
(4129, 3813, '8901856043302DES-1026G E.gif'),
(4130, 3814, '5770225176003USB-LAN.jpg'),
(4131, 3815, '9924087281613CABLE - RJ45.jpg'),
(4132, 3816, '6476915299896CABLE - RJ45.jpg'),
(4133, 3817, '879667575570CABLE - RJ45.jpg'),
(4134, 3818, '9321967773188Cable UTP AMP.jpg'),
(4135, 3819, '2994988034418Cable UTP AMP.jpg'),
(4136, 3820, '8385405251580Cable UTP AMP.jpg'),
(4137, 3821, '3227299422415Cable UTP AMP.jpg'),
(4139, 3822, '80064510922911.jpg'),
(4140, 3823, '6983610131714CABLE - RJ45.jpg'),
(4141, 3824, '7411648554709CABLE - RJ45.jpg'),
(4143, 3825, '96698251823072.jpg'),
(4144, 3826, '234689593822CALMN5D9.jpg'),
(4146, 3827, '29145021587993.jpg'),
(4147, 3828, '3100168372151patch-panels.jpg'),
(4148, 3829, '5180605479506patch-panels.jpg'),
(4150, 3830, '3365163584864.jpg'),
(4151, 3831, '40367308937594.jpg'),
(4152, 3832, '88500280275724.jpg'),
(4153, 3833, '94231848155875.jpg'),
(4154, 1843, '6971415380308DVD LITE ON COMBO.jpg'),
(4155, 3834, '432550558579FC661.jpg'),
(4156, 3835, '368222830921XEROX  3119.jpg'),
(4157, 3383, '6108631585740Xerox WorkCentre PE220.jpg'),
(4174, 3842, '5446147746211IN100.gif'),
(4175, 3843, '4550133072934IN1000.gif'),
(4176, 3844, '5196458665724INWA18GA.gif'),
(4177, 3845, '9431721130961INWP18GN.jpg'),
(4178, 3846, '7635118665588INUSB28GB.gif'),
(4182, 3188, '3005353617808C525A.jpg'),
(4196, 3849, '1440147956424ML-1190.jpg'),
(4197, 3850, '7599448896598OKI C9600n.jpg'),
(4201, 3851, '72226287670681.jpg'),
(6613, 4986, '70_1197879874_2038468_sp2.jpg'),
(4204, 3853, '5892478245705CNP430.jpg'),
(4205, 3854, '1444720975244CMP-102U.jpg'),
(4206, 3855, '807846281836CAR-854.jpg'),
(4211, 3859, '5049511033909PS-160A.gif'),
(4212, 3860, '9326235931485CS62.jpg'),
(4213, 3861, '7010438823587CS62A.jpg'),
(4214, 3862, '4284895567973CS62U.jpg'),
(4215, 3863, '7452501164783CS64A.jpg'),
(4216, 3864, '2466647253033CS74E.jpg'),
(4217, 3865, '6393075851209Data Switch USB.jpg'),
(4218, 3866, '8290895357759Data Switch USB.jpg'),
(4219, 3867, '752536529036Data Switch LPT.jpg'),
(4220, 3868, '3928196981737Data Switch LPT.jpg'),
(4221, 3869, '6771725148755VS98A.jpg'),
(4222, 3870, '5479683485442Multi VGA 4.jpg'),
(4223, 3871, '1530999315433Multi VGA 4.jpg'),
(4224, 3872, '74162215735284 Port USB 2.0 Hub.jpg'),
(4225, 3873, '1133752979645CAQR45EP.jpg'),
(4226, 3874, '6161069224956Auto Switch VGA-Key-Mouse.jpg'),
(4227, 3875, '3013890033182Data Switch VGA-Key-Mouse.jpg'),
(4228, 3876, '3307480436290Data Switch VGA-Key-Mouse.jpg'),
(4229, 3877, '7707068125833CACOO2LB.jpg'),
(4230, 3878, '3730335918200cable VGA.jpg'),
(4231, 3879, '137130987455cable VGA.jpg'),
(4232, 3880, '845345318842cable VGA.jpg'),
(4233, 3881, '6401917028326LPT Cable.jpg'),
(4234, 3882, '5738213743046LPT Cable.jpg'),
(4235, 3883, '4402575618854LPT Cable.jpg'),
(4236, 3884, '2625179913989USB Cable.jpg'),
(4237, 3885, '6687580838325USB Cable.jpg'),
(4238, 3886, '3286139447245USB Cable.jpg'),
(4239, 3887, '59016244833442.jpg'),
(4242, 3890, '5669617857090USB to PS 2.jpg'),
(4243, 3889, '39315505560261394.jpg'),
(4244, 3888, '6133935871340cable ipod.jpg'),
(4245, 3891, '931014035546Link USB1.1 USB2.0.jpg'),
(4246, 3892, '8763749687383CAINOVZC.jpg'),
(4247, 3893, '7837552749165CAM1KP61.jpg'),
(4248, 3894, '7522316595269Card Test Mainboard.jpg'),
(4250, 3895, '6722640983829Card Test Mainboard usb.jpg'),
(4251, 3896, '8427782267927CAU1AH0R.jpg'),
(4252, 3897, '5723884863101CAYJW9C9.jpg'),
(4253, 3898, '2700483047302CA4PYX7J.jpg'),
(4254, 3899, '707543824666antistat.jpg'),
(4255, 3900, '6870808061395CAYJYZQX.jpg'),
(4256, 3901, '8896063578731368 2009.jpg'),
(4257, 3902, '7695483096692368 2009.jpg'),
(4258, 3903, '4333065148891031 033.jpg'),
(4259, 3904, '161605829871Car Stereo MP3.jpg'),
(4260, 3905, '3562961980127Car Stereo.jpg'),
(4261, 3906, '878722476187MP-Car.jpg'),
(4262, 3907, '4153191498889Bo sac xe hoi.jpg'),
(4263, 3908, '3664483883048Bo sac xe hoi.jpg'),
(4265, 3909, '97548840767453.jpg'),
(4266, 3910, '79070632191295.jpg'),
(4267, 3911, '76238384981905.jpg'),
(4268, 3912, '7456769323081Power.jpg'),
(4269, 3913, '57427868618655.jpg'),
(4270, 3914, '470354556108cable sata.jpg'),
(4271, 3915, '5068108170930BOP CD.jpg'),
(4272, 3916, '365960593707BOP CD.jpg'),
(4273, 3917, '495683038105tool kits B.jpg'),
(4274, 3918, '4692202725408tool kits B.jpg'),
(4275, 3919, '3984902878029Pin CMOS...jpg'),
(4276, 3920, '1256920633354cable power   sata.jpg'),
(4278, 3921, '204226736485021.jpg'),
(4282, 1937, '8014072824877DFM-562IS.gif'),
(4284, 1935, '8689970960343DU-562M.jpg'),
(4285, 1938, '60683886979311456psa.jpg'),
(4286, 1939, '3804419469831456pvc.jpg'),
(4287, 1943, '17425795366491456TR.jpg'),
(4299, 3848, '3248030687974dv6000.jpg'),
(4300, 1372, '9042096527759ddr400.gif'),
(4301, 3397, '8778688389593ram533.gif'),
(4302, 1398, '904795165938ram533.gif'),
(4303, 3923, '5386697997894XWAVE 5.100.jpg'),
(4304, 3924, '5384868731099SPDN100.jpg'),
(4305, 3925, '8780517557609SPCN-4800SL.jpg'),
(4306, 3926, '423581144267SPIR12.jpg'),
(4307, 3927, '3237969966327SPIR-50.jpg'),
(4308, 3928, '4591900267017SPDB-050045.gif'),
(4309, 3929, '683422369618SPDB-120120.gif'),
(4310, 3930, '774920264871K0416NI.jpg'),
(4311, 3931, '4336723583702K1628NI.jpg'),
(4313, 3932, '5358344999748K0416AI.jpg'),
(4314, 3933, '4897380659788K0660Z.jpg'),
(4322, 3936, '4110204760277HS-02N.jpg'),
(4323, 3937, '3164496099809HS-04A.jpg'),
(4324, 3938, '252067186313HS - 02i.jpg'),
(4325, 3939, '568577605051HS - 04SU.jpg'),
(4326, 3940, '3923014140652BT-02N.jpg'),
(4327, 3941, '916380293858HS-04U.jpg'),
(4328, 3942, '5932721233514HP-04 Live.jpg'),
(4329, 3943, '4862320514284PHILIPS SHM7400.jpg'),
(4332, 3301, '2744384369923dv2000.jpg'),
(4339, 3952, '9815553269591SBC HM385.jpg'),
(4340, 3953, '8443940415888SHM 3300.jpg'),
(4341, 3954, '3769054598515SHM 3100.jpg'),
(4343, 3783, '5220848367315OK 1GB.jpg'),
(4344, 3956, '6405575563137OK 1GB.jpg'),
(4346, 3958, '5138533224901SM750.jpg'),
(4347, 3959, '3040413763312SM750.jpg'),
(4348, 3960, '6780566325872SM340.jpg'),
(4349, 3961, '8146996438491SM350.jpg'),
(4350, 3962, '4110509522020SM360.gif'),
(4351, 3963, '5854369486433SM909.jpg'),
(4352, 3964, '6783919998941SM9088.jpg'),
(4353, 3965, '6226921358887SM2688.jpg'),
(4354, 3966, '8004621825495SM9999.jpg'),
(4355, 3967, '1812699828878V80.jpg'),
(4359, 3970, '8699726821468GH-740.jpg'),
(4360, 3971, '3284005318707GH-760.jpg'),
(4361, 3972, '8931428585978GH-770.jpg'),
(4362, 3968, '2753225647040GH-757.jpg'),
(4363, 3969, '7274456782798GH-767.jpg'),
(4364, 3973, '5917782531304GH-737.jpg'),
(4365, 3974, '3268761854754GH-730.jpg'),
(4366, 3975, '284011379494AVerTV USB 2.0 Lite.jpg'),
(4367, 3976, '250323176031AVerTV Box7 Live.jpg'),
(4368, 3977, '9217397157720AVerTV Box9.jpg'),
(4369, 3978, '5418404470330TV AVER TV GO FM 007 PLUS.jpg'),
(4370, 3979, '8721677532778AVerTV GO FM.jpg'),
(4372, 3980, '5270542254507AVerTV CardBus.jpg'),
(4374, 3981, '9905185282849AVerTV Hybrid FM.jpg'),
(4375, 3982, '1632826178876AVerTV Hybrid FM PCI.jpg'),
(4376, 3983, '5096766030819AVerTV Hybrid FM Volar.jpg'),
(4377, 3984, '9912807015436AVerTV DVB-T Volar.jpg'),
(4378, 3985, '3834296811403SEITEC 2GB USB Flash 2.0.jpg'),
(4383, 3987, '6970195835778PCTV 40i.jpg'),
(4386, 3988, '9916770311990PCTV USB 55E.jpg'),
(4387, 3989, '6122350743420PCTV 310i.jpg'),
(4388, 3990, '625253046230PCTV Hybrid Pro Stick.jpg'),
(4389, 3991, '222189881894Studio 510 USB.jpg'),
(4390, 3992, '3354735333200Studio Plus 700 PCI.jpg'),
(4391, 3993, '3530035963161Dazzle TV Mobile.jpg'),
(4392, 3994, '219622706986Dazzle TV.jpg'),
(4393, 3995, '451757419087Dazzle DV Editor.jpg'),
(4394, 3996, '1007231652867Dazzle DVC 90.jpg'),
(4395, 3997, '4596168425314GAMED TV BOX.gif'),
(4397, 3998, '399014719349TV GENIUS GO A11.jpg'),
(4398, 3999, '4590071099001HUMAX USBTV.jpg'),
(4399, 1483, '3208702384172JVJ M3.jpg'),
(4400, 3482, '1898978167846JVJ M3 Touch.jpg'),
(4401, 1485, '730409119985JVJ M3 Touch.jpg'),
(4404, 4001, '7601887786880CF 512MB.jpg'),
(4405, 4002, '714555833767CF 512MB.jpg'),
(4406, 4003, '6175093343157CF 512MB.jpg'),
(4407, 4004, '568181278497CF 512MB.jpg'),
(4408, 4000, '2244701448427CF 512MB.jpg'),
(4421, 4018, '1045035650395SD Kingston.jpg'),
(4422, 4019, '3271200745035SD Kingston.jpg'),
(4423, 4020, '5088534475967SD Kingston.jpg'),
(4424, 4021, '2107509676516SD Kingston.jpg'),
(4425, 4022, '2561157146853SD Kingston.jpg'),
(4426, 4023, '714555833767SD Kingston.jpg'),
(4427, 4024, '2448659838277JVJ SD card.jpg'),
(4428, 4025, '4763542462167JVJ SD.jpg'),
(4429, 4026, '4419038627337SD  USB.jpg'),
(4430, 4027, '8891185598169SD  USB.jpg'),
(4431, 4028, '9511292422571SD_512_p.jpg'),
(4432, 4029, '1798370848933SD_1G_p.jpg'),
(4433, 4030, '9946342754667SD_1G_p.jpg'),
(4439, 4033, '5428770053720Micro SD.jpg'),
(4440, 4034, '5572364112467Micro SD.jpg'),
(4441, 4035, '474037226326Micro SD.jpg'),
(4442, 4036, '6691849095401Micro SD.jpg'),
(4443, 4037, '780798036489Micro SD.jpg'),
(445, 1364, '7052510978192MAXELL FDD.jpg'),
(4450, 4042, '3922099556644MMC kingston.jpg'),
(4451, 4043, '7940903920102MMC kingston.jpg'),
(4452, 4044, '627692017821MMC kingston.jpg'),
(4453, 4045, '6533621196188MMC kingston.jpg'),
(4454, 4046, '6605265794690DV RS MMC.jpg'),
(4455, 4047, '2140130832959DV RS MMC.jpg'),
(4456, 4048, '799059787294DV RS MMC.jpg'),
(4457, 4049, '2621216617435DV RS MMC.jpg'),
(4458, 4050, '3742835630129Micro MMC.jpg'),
(4459, 4051, '4727567632655Micro MMC.jpg'),
(4460, 4052, '9310992467532MS Sony Pro.jpg'),
(4461, 4053, '1603253736200MS Sony Pro.jpg'),
(4462, 4054, '361235106796MS Sony Pro.jpg'),
(4463, 4055, '2204153698874MS Sony Pro.jpg'),
(4464, 4056, '4093741751794MS Sony Pro.jpg'),
(4465, 4057, '228281027698MS Sony Pro Duo.jpg'),
(4466, 4058, '227677584721MS Sony Pro Duo.jpg'),
(4467, 4059, '258469473148MS Sony Pro Duo.jpg'),
(4468, 4060, '8896978162739MS Sony Pro Duo.jpg'),
(4469, 4061, '4071791040483256MB DUO M2 Sony.jpg'),
(447, 1363, '7016536248680dvd-rmini.jpg'),
(4470, 4062, '1758127961124512MB DUO M2 Sony.jpg'),
(4471, 4038, '1199909875319XD 256MB.jpg'),
(4472, 4039, '6463196043438XD 512MB.jpg'),
(4473, 4040, '1893490565018XD 1GB.jpg'),
(4474, 4041, '7890600210646XD 2GB.jpg'),
(4475, 4015, '4831833486379Mini SD.jpg'),
(4476, 4016, '4177885962224Mini SD.jpg'),
(4477, 4017, '4246177086436Mini SD.jpg'),
(4478, 4031, '3749237916964Mini SD.jpg'),
(4480, 4032, '5494317227129Mini SD.jpg'),
(4481, 4063, '5304382855481READER 3 1.jpg'),
(4482, 4064, '3927587259472READER 7 1.jpg'),
(4483, 4065, '6795505028082READER Diboom.jpg'),
(4484, 4066, '1647459920564READER 52 1 Ztek.jpg'),
(4485, 4067, '4185507793590READER APACER 45 1.jpg'),
(4486, 4068, '7481463985194Box Reader 8 1 USB2.0.jpg'),
(4487, 4069, '4171788537131Box PlayPocket USB2.0.jpg'),
(4488, 4070, '3626984747263Card USB V1.0  2 Port.jpg'),
(4489, 4071, '879667575570Card USB V2.0  4 Port.jpg'),
(449, 1362, '8318333771897t_16162_01.jpg'),
(4490, 4072, '7873527578677Card IEEE1394  2 Port.jpg'),
(4491, 4073, '541261196980Card PCI  Com.jpg'),
(4492, 4074, '4788846647766Card PCI  LPT.jpg'),
(4493, 4075, '6445818450947Card PCMCI IEEE1394.jpg'),
(4494, 4076, '5939428380872Card PCMCI  USB2.0.jpg'),
(4495, 4077, '4093741751794Bluetooth Z TEK.jpg'),
(4496, 4078, '9430806546953Bluetooth BAFO.jpg'),
(4512, 1700, '5444318478195ACBEL E2 Power series.jpg'),
(4513, 1701, '7265005783416ACBEL E2 Power series.jpg'),
(4517, 3167, '4721165445819440W ACBEL.jpg'),
(4518, 1702, '3283700456964440W ACBEL.jpg'),
(4521, 3245, '4323309287766500W ACBEL.jpg'),
(4522, 1706, '916075333336500W ACBEL.jpg'),
(4523, 3168, '4624826383983440W ACBEL.jpg'),
(4525, 4082, '5630289553289CVC 1001.jpg'),
(4526, 4083, '798114687912CVC 1001.jpg'),
(4527, 4084, '3883685836851CVC 1001.jpg'),
(4529, 4086, '5012011996903CVC 2005.jpg'),
(4530, 4087, '9725311534069CVC 306.jpg'),
(4531, 4088, '5999487851453CVC 3002.jpg'),
(4532, 4089, '606631644010JVC 310.jpg'),
(4533, 4090, '9674703062869Diboom 988 998 9001.jpg'),
(4534, 4091, '6220823933794988.jpg'),
(4535, 4092, '5980585852689998.jpg'),
(4536, 4093, '3349857452638pk-835.gif'),
(4537, 4094, '5474500644357PK-935.jpg'),
(4538, 4095, '2662679049774PK-333MB.jpg'),
(4540, 4097, '1715141222511images.jpg'),
(4542, 4099, '1336796785487Colorvis.jpg'),
(4543, 4100, '4462330227693JVC 330.jpg'),
(4544, 1880, '3205043849361A-6600.jpg'),
(4546, 4101, '3146203824531Nansin 638.jpg'),
(4550, 4102, '8276871339558GA-M61SME-S2.jpg'),
(4551, 4103, '479805555490GA-M61PM-S2.jpg'),
(4552, 4104, '7438172284839GA-MA69VM-S2.jpg'),
(4555, 4105, '1206617023898GA-M61P-S3.jpg'),
(4556, 4106, '6693983125161GA-MA69G-S3H.jpg'),
(4561, 4109, '5203775536568M55 SLI S4.jpg'),
(4563, 4110, '3354430471457M55 SLI S4.jpg'),
(4564, 4111, '6821723996469M2N-MX.jpg'),
(4567, 4114, '6472647042820M2R32-MVP.jpg'),
(4568, 4115, '8400953676054M2N32-SLI Deluxe Wireless Edition.jpg'),
(4569, 4116, '8918014290042CROSSHAIR.jpg'),
(4571, 4118, '7032084673155K9VGM-V.jpg'),
(4572, 4119, '9410380241915K9N6SGM-V.jpg'),
(4573, 4120, '2010255931892K9AGM2-L.jpg'),
(4578, 4122, '3574851969790EN6200LE TC256 TD 64M.jpg'),
(4579, 4123, '5367491138608Extreme N6200TC256 TD 64M.jpg'),
(4580, 4124, '7964683898208EN7100GS256 TD 64M.jpg'),
(4582, 4126, '518524037026A9550 TD 128M.jpg'),
(4583, 4127, '7764993566655N6200 TD 128M.jpg'),
(4584, 4128, '2900478140598EAX550HM512 TD 128M.jpg'),
(4585, 4129, '5835772349412EAX1300HM512 TD 128M.jpg'),
(4586, 4130, '101393881446EN7100GS512 TD 128M.jpg'),
(4587, 4131, '3679727447001A9550GE TD Series.jpg'),
(4588, 4132, '4516292371961N7600GS HTD 256M.jpg'),
(4589, 4133, '5512304641885EAX550HM512 TD 256M.jpg'),
(4590, 4134, '7559205910010EAX1050 TD256M A.jpg'),
(4591, 4135, '6547950076133Extreme N6200TC512 TD 256M.jpg'),
(4593, 4137, '7912855882478EN7300GS HTD Series.jpg'),
(4594, 4138, '560468047167EN7300GT SILENT HTD 256M.jpg'),
(4595, 4139, '7787858861974EN7600GT 2DHT 256M.jpg'),
(4596, 4140, '2410551079006EN7900GS 2DHT 256M.jpg'),
(4597, 4141, '6364417991320EN8500GT SILENT HTD 256M.jpg'),
(4598, 4142, '7776578694576EN8600GT 2DHT 256M.jpg'),
(4599, 4143, '6444294044674EN8600GTS HTDP 256M.jpg'),
(4600, 4144, '326601793951EAX1550 TD 256M A.jpg'),
(4601, 4145, '5494012465386EAX1300PRO TD 256M.jpg'),
(4602, 4146, '8786310122179EAX1600PRO TD Series.jpg'),
(4603, 4147, '637295437915EAX1600PRO Silent Series.jpg'),
(4604, 4148, '9182032150473EAX1650 SILENT Series.jpg'),
(4606, 4150, '1729165240713EAX1650PRO Gamer Edition HTD 256M.jpg'),
(4608, 4152, '918209461874EAX1650XT Series.jpg'),
(4609, 4153, '8367722797346EAX1650XT Series.jpg'),
(461, 1975, '9983536929930st546v6.jpg'),
(4610, 4154, '7798834267629EAX1950PRO HTDP 256M.jpg'),
(4611, 4155, '9999695176669EAX1600PRO TD Series.jpg'),
(4612, 4156, '8999414649669EAX1650 SILENT Series.jpg'),
(4613, 4157, '4538547945014EN8800GTS HTDP 320M.jpg'),
(4614, 4158, '5599497664862EN8800GTS HTDP 640M.jpg'),
(4615, 4159, '3551376852207EN8800GTX HTDP 768M.jpg'),
(4617, 4161, '8877161579967GV-N52128DS-RH.jpg'),
(4618, 4162, '65022816109GV-NX71G512P8-RH.jpg'),
(4619, 4163, '5445233162203GV-NX73G128D-RH.jpg'),
(4620, 4164, '471878862381GV-NX76T128D-RH.jpg'),
(4621, 4165, '1060584074870GV-RX105512P8-RH.jpg'),
(4622, 4166, '677050564225GV-NX71G256P4-RH.jpg'),
(4623, 4167, '3742835630129GV-NX73G256D-RH.jpg'),
(4625, 4169, '7069583710161GV-NX76G256D-RH.jpg'),
(4627, 4171, '4432452923274GV-NX76T256D-RH.jpg'),
(4628, 4172, '2437074810357GV-NX85T256H.jpg'),
(463, 1969, '7613472816021router_2600i.jpg'),
(4630, 4174, '3147728230804GV-NX86S256H-B.jpg'),
(4634, 4178, '2108119498781GV-RX165256D-RH.jpg'),
(4635, 4179, '3971183721570GV-RX16P256DE-RH.jpg'),
(4638, 4182, '35304124012GV-NX76G512P-RH.jpg'),
(4639, 4183, '615100853309GV-RX29T512VH-B.jpg'),
(464, 1974, '3815089950895st530v6.jpg'),
(4640, 4184, '6066559431135GV-NX88S320H-B-RH.jpg'),
(4641, 4185, '42035578394GV-NX88S640H-RH.jpg'),
(4642, 4186, '578278745864GV-NX88X768H-RH.jpg'),
(4643, 4187, '16707085770GV-NX88U768H-B.jpg'),
(4644, 4188, '2381588358595NX73S-256T.jpg'),
(4645, 4189, '8791797725007CA2HE9MZ.jpg'),
(4646, 4190, '9022279944987WLG-54RIA.jpg'),
(4647, 4191, '8396075795492WLG-54RPC.jpg'),
(4648, 4192, '7753408438735Scanjet G4010.jpg'),
(4649, 4193, '6730262716416Scanjet G4050.jpg'),
(4650, 2889, '771590942950Scanjet G3010.jpg'),
(4651, 4194, '8626862777215HP Scanjet 5590 Digital Flatbed.jpg'),
(4654, 4195, '7555852335721SH-9324E_med.jpg'),
(4655, 4196, '3626679985520SH-9324E_med.jpg'),
(4657, 4198, '364619167770SH-7332B.jpg'),
(4658, 4199, '3205043849361SH-4804MHM.jpg'),
(4659, 4200, '1629777466330DES-1008D.jpg'),
(4660, 4201, '1490451565881DES-1010G.gif'),
(4662, 4202, '6511975346621DGS-1024D.jpg'),
(4663, 4203, '249926849476PS2216.jpg'),
(4664, 4204, '3712653463966ps2208.jpg'),
(4665, 4205, '7790602713998PS2216.jpg'),
(4666, 4206, '1169727610378DS1216.jpg'),
(4667, 4207, '4874515364470SDS1224.jpg'),
(4668, 4208, '717903226191SXP2224WM.jpg'),
(4669, 4209, '5354076742672SAS2224A.jpg'),
(467, 1978, '7296712355851ST585.jpg'),
(4670, 4210, '3446806236739SXP1224B.jpg'),
(4672, 4211, '3224860432133INS500N.jpg'),
(4673, 4212, '7761335131844INS800N.jpg'),
(4674, 4213, '8871673877140INGS800.jpg'),
(4675, 4214, '3516926528968INS1600N.gif'),
(4676, 4215, '4129106659041INS2400.jpg'),
(4677, 4216, '7666825238024CSH-800.jpg'),
(4678, 4217, '8297907366860CGS-800.jpg'),
(4679, 4218, '9728970068880CSH-1600.jpg'),
(4680, 4219, '540163661325CGS-1600.jpg'),
(4681, 4220, '343528367587CSH-2400.jpg'),
(4682, 4221, '5378161582521CSH-2400W.jpg'),
(4683, 4222, '5005609611288CSH-2402G.jpg'),
(4684, 4223, '2629753032809CGS-2400.jpg'),
(4685, 4224, '6852515884896Vigor2500.jpg'),
(4686, 4225, '7122631170420SD208.jpg'),
(4687, 4226, '3694666049210SD216.jpg'),
(4688, 4227, '922806762853SR224.jpg'),
(4689, 3520, '5536389481734usb_fusion_drive.jpg'),
(4690, 4228, '4753176878777N7600GS SILENT HTD 256M.jpg'),
(4691, 4229, '3963257028462EN7600GS SILENT HTD Series.jpg'),
(4692, 4230, '3960513276437EN7600GS SILENT HTD Series.jpg'),
(4694, 4232, '1526731157135INTEL CELERON D.jpg'),
(4695, 4233, '8439672257591INTEL CELERON D.jpg'),
(4696, 4234, '2351711054175INTEL CELERON D.jpg'),
(4698, 4236, '112094837194INTEL P4 640 - 3.2FGHz.jpg'),
(4699, 4237, '165386227399INTEL P4 640 - 3.2FGHz.jpg'),
(470, 1986, '6123265327428DI-524_main.jpg'),
(4706, 4243, '6217775221248INTEL Core2 Duo E6300.jpg'),
(4707, 4244, '8553084050175INTEL Core2 Duo E6300.jpg'),
(4708, 4245, '931465083565INTEL Core2 Duo E6300.jpg'),
(4709, 4246, '2927916454736INTEL Core2 Duo E6300.jpg'),
(471, 1995, '6369600733625DWL-2100AP_main.jpg'),
(4710, 4247, '870039880956INTEL Core2 Duo E6300.jpg'),
(4711, 4248, '2039828474568INTEL Core2 Duo E6300.jpg'),
(3543, 3498, '8596070888788JXD639.jpg'),
(3542, 3497, '7070803154691JXD638.jpg'),
(3541, 3496, '3876978688272JXD633.jpg'),
(2647, 1919, '6986049121996s-7000.jpg'),
(1472, 1570, '605717060002WESTERN.jpg'),
(2931, 3307, '4903782946624CAU785IN.jpg'),
(2948, 1667, '546877035172512MB  PALIT 6600.jpg'),
(2724, 1463, '9059169358507Zen Neeon 2.,,.jpg'),
(1453, 2829, '4420867894132512MB Sony MP3NW-E002F.jpg'),
(1448, 1482, '4904697530632USB MP3 JVJ 256MB - X6.jpg'),
(2806, 2665, '76829833847631552S...jpg'),
(2749, 2835, '191093032944DDR400_ANGLE_thumbnail.jpg'),
(2801, 1962, '3663569299040DrayTek V2510V.jpg'),
(1467, 1557, '517694694469531523122-2-120-0.gif'),
(1479, 1575, '6131191920536HD300LD.jpg'),
(1478, 1574, '2705665888387WESTERN.jpg'),
(1734, 2106, '2827614096345SCX-4521F.jpg'),
(1486, 1563, '8455525443808WESTERN.jpg'),
(3368, 1392, '5750713454974DDRAM II....gif'),
(3371, 1882, '35913946277A-2900.jpg'),
(1489, 2842, '5852845180160CROSSHAIR.jpg'),
(1494, 2845, '7220799599052M2R32-MVP.jpg'),
(1728, 1981, '7667739822032Hurricane 9300G.jpg'),
(1631, 2876, '5205299942841K9VGM.jpg'),
(1591, 2659, '8767408123415vft595.jpg'),
(2838, 3269, '7134826021827M2N-E SLI.jpg'),
(1530, 2859, '7780541991130GeForce 6600LE.jpg'),
(1529, 1669, '161453393598GeForce 7300.jpg'),
(1526, 1590, '3091022234512GeForce FX5200.jpg'),
(1525, 1391, '6487280883286small_twister_ddr2.gif'),
(1532, 1666, '6398258692294GeForce 6600LE.jpg'),
(1724, 1931, '403429194698untitled.bmp'),
(3333, 1457, '3120899538931Toshiba.jpg'),
(2829, 1951, '8750945114933CAR2-701U(A).jpg'),
(2738, 1516, '338095422808JXD852...jpg'),
(2616, 3162, '2185556561853G-Shot P713....jpg'),
(1588, 2778, '2823041077526GA-M61PM-S2.jpg'),
(1587, 2795, '1905075692939DDR2.gif'),
(2997, 3314, '1567583867210X3...jpg'),
(1718, 2910, '809675549852M800 4.1.jpg'),
(1715, 1903, '874393305832a-6301.jpg'),
(1714, 1899, '1175520273727m520.jpg'),
(1701, 1890, '9274407915756A-8800.jpg'),
(1700, 1889, '8425953099911A-7000.jpg'),
(2691, 2887, '7137569872630K8MM3-V.gif'),
(1667, 2888, '8927160328902K8NGM-V.gif'),
(3518, 1509, '2979134748201JVJ M8.gif'),
(1699, 1888, '5196763527467A-5000.jpg'),
(1698, 1886, '5258957126587A-3000.jpg'),
(1696, 1884, '4725738464639A-2700.jpg'),
(2915, 1564, '91277651444630.jpg'),
(2689, 3199, '8253091460231CA2HE9MZ.jpg'),
(2688, 3198, '225842066106CA2HE9MZ.jpg'),
(1710, 2906, '1530999315433intelligent.jpg'),
(1711, 2907, '3898319677318hero1.jpg'),
(1712, 2908, '3703507326327A-920.jpg'),
(1713, 2909, '9569522725137A-930.jpg'),
(1719, 1918, '390594149904S-80.jpg'),
(1733, 2105, '8972281196053SCX-4200.jpg'),
(1735, 2914, '8563144871822Tamio 600.jpg'),
(1736, 2915, '5774188472558Vigor  2800G.jpg'),
(1737, 2916, '4839455218966vigor3300b.jpg'),
(1739, 1988, '8493939163602WRT-414.jpg'),
(183, 2104, '102985425960samsung ml_2250.jpg'),
(182, 2102, '509615628554samsung ml1610.jpg'),
(2826, 1468, '5077864032055AF-650.jpg'),
(181, 2103, '322425079868samsung_ML-2010.jpg'),
(3280, 3401, '3964476572992UMAX DDR2.jpg'),
(1755, 2924, '5042803985330Vigor2800.jpg'),
(1756, 2925, '4104107335184M--930.jpg'),
(178, 2107, '451842641720samsung CLP-510N_b.jpg'),
(1760, 2917, '7315614254615WRT-410.jpg'),
(1761, 2927, '7464391154447INWR48GA.jpg'),
(3402, 3442, '2170922721387PT-LB50SEA.gif'),
(1765, 1999, '3830333414848CNET PCI.jpg'),
(1770, 2000, '3500463420485COMPEX.jpg'),
(1771, 2001, '9404282816823D-LINK.jpg'),
(1773, 2002, '8926550566373 COM 905B TX.jpg'),
(1774, 2004, '4569949555707LINKPRO.jpg'),
(1775, 2005, '787017395609CNET G-2000S.jpg'),
(1776, 2006, '3321199592749D-LINK DGE-530T.jpg'),
(1777, 2007, '4972073970836Linksys.jpg'),
(1778, 2003, '185934503523Linksys.jpg'),
(1782, 2009, '2596522154100PCMCIA LINKPRO.jpg'),
(1783, 2010, '6436367451565PCMCIA CNET.jpg'),
(1781, 2011, '538822235389PCMCIA Linksys.jpg'),
(1784, 2036, '5673033402098 PORT LINKPRO.jpg'),
(1787, 2037, '79415136423678 PORT D-LINK.jpg'),
(1786, 2035, '9113131339968 PORT D-LINK.jpg'),
(1788, 2034, '82308358871788 PORT CNET.jpg'),
(2024, 2038, '55421819463045 PORT LINKPRO.jpg'),
(1790, 2039, '68128826205738 PORT COMPEX.jpg'),
(1791, 2041, '41940441101858 PORT D-LINK Có 2 Port 1GB.jpg'),
(1792, 2042, '97911636680008 PORT CNET 1000.jpg'),
(1793, 2043, '7164093539818 PORT LINKPRO 1000.gif'),
(1794, 2045, '34035146363848 PORT COMPEX  1000.jpg'),
(1795, 2046, '77613971062216 PORT CNET 100.jpg'),
(1796, 2047, '713543574409216 PORT CNET 1000.jpg'),
(1797, 2048, '549096365284016 PORT LINKPRO 100.jpg'),
(1798, 2049, '902471893526816 PORT LINKPRO        100.jpg'),
(1799, 2050, '631228511506816 PORT LINKPRO        100.jpg'),
(1800, 2051, '295535486887416 PORT D-LINK.jpg'),
(2053, 2052, '1479171398482(DGS 1016D).jpg'),
(2432, 2053, '4599217137861SRW224P_med.jpg'),
(1803, 2054, '240658778245116 PORT COMPEX SDS 1216.jpg'),
(1804, 2056, '834760135405216 PORT PLANET.jpg'),
(1805, 2057, '335839376801216 PORT PROLINK.jpg'),
(1806, 2058, '12831395296216 PORT LINKSYS.jpg'),
(1807, 2059, '820095858275924 PORT CNET 100.jpg'),
(1808, 2055, '136758877391416 PORT INFOSMART 100.jpg'),
(1809, 2060, '953537716242024 PORT CNET 100.jpg'),
(1810, 2062, '72357381248324 PORT LINKPRO 100.gif'),
(1811, 2063, '972927483062324 PORT LINKPRO   100.jpg'),
(1812, 2064, '590924611593024 PORT LINKPRO 100.gif'),
(1813, 2065, '532023614169824 PORT LINKPRO 1000.jpg'),
(1814, 2066, '103284079898924 PORT D-LINK 100.jpg'),
(1815, 2067, '734000395620724 PORT D-LINK    100.jpg'),
(1816, 2068, '849668301562624 PORT D-LINK     1000.jpg'),
(1817, 2069, '820126344450224 PORT COMPEX.jpg'),
(1818, 2071, '410410733518424 PORT COMPEX SAS2224B.jpg'),
(1819, 2072, '907593712873324 PORT COMPEX SXP1224B.jpg'),
(1820, 2073, '86302787185524 PORT INFOSMART 100.jpg'),
(1821, 2074, '40059389655224 PORT PLANET.jpg'),
(1822, 2075, '293370901930724 PORT PLANET.jpg'),
(1823, 2078, '356082785158932 PORT LINKPRO 100.gif'),
(1824, 2081, '6636972367126USB LAN.jpg'),
(1825, 2082, '6964098410685AMP RJ 45 CABLE.gif'),
(1826, 2084, '1684044472341KRONE RJ 45 CABLE CAT-6.jpg'),
(1827, 2086, '1015158245976Đầu RJ45.jpg'),
(1832, 2087, '5894917235986CALMN5D9.jpg'),
(1829, 2090, '5245847791172kiem.jpg'),
(1830, 2091, '2103241419439kiem   ...jpg'),
(1831, 2089, '8112850975774patch-panels.jpg'),
(3539, 1520, '4689153912862JXD 865.jpg'),
(3537, 3495, '1165764313823i61.jpg'),
(3535, 3494, '5466878912991Crown 980B.jpg'),
(3534, 3493, '3302602455728Nizin R-9A.jpg'),
(3533, 2012, '7746396429634WLG-54RUB.jpg'),
(3530, 3491, '3618753292411yp-k5.gif'),
(3529, 3490, '9817077675865Twinmos.jpg'),
(3528, 3489, '6243994189635Twinmos.jpg'),
(3527, 3488, '2509634091645JXD-862.jpg'),
(3526, 1491, '2178849414495JXD-861.jpg'),
(3523, 3487, '368222830921JVJ GAMES G9.jpg'),
(3522, 3486, '967988585175JVJ GAMES G9.jpg'),
(3521, 2834, '7710421798901JVJ GAMES G9.jpg'),
(2690, 3200, '7298846484390CA2HE9MZ.jpg'),
(2743, 1484, '537730996312JVJ X7.jpg'),
(3307, 2807, '1024304483615Twinmos.jpg'),
(1884, 2938, '874612999776WRT-415.jpg'),
(2558, 2017, '9864027712253LINKPRO G108APC.gif'),
(1886, 2032, '5222372673589D-LINK DWL - G650M.jpg'),
(1887, 2030, '1906599999212D-LINK DWL - G520M.jpg'),
(1888, 2029, '1466366726032LINKSYS - WUSB54G.jpg'),
(1889, 2028, '6461061914899LINKSYS - WPC54G.jpg'),
(2343, 2027, '4993109998139WMP54G.jpg'),
(1891, 2026, '7631155369034D-LINK DWL - G122.jpg'),
(1892, 2025, '3257786449099D-LINK DWL - G520.jpg'),
(1893, 2024, '9434160121242D-LINK DWL - G650.jpg'),
(1894, 2023, '488951693129D-LINK DWL - G630.jpg'),
(1895, 2022, '711507121221D-LINK DWL - G510.jpg'),
(1896, 2021, '9715250812421CNET CWD - 854.jpg'),
(1897, 2020, '9617082582569CNET CWC - 854.jpg'),
(1898, 2019, '3167849674098CNET CWP - 854.jpg'),
(1899, 2014, '8898807330756WLG-54MPC.gif'),
(1900, 2016, '3615094857600WLT-108AUB-1.gif'),
(1901, 2015, '5977537140143WLG-108AIA.gif'),
(1902, 2013, '6452220737782WL-G54MIA.jpg'),
(3306, 2806, '661508372286Twinmos.jpg'),
(2356, 1692, '8153093863583POWER 400W.jpg'),
(3520, 3485, '7052815839935JVJ M8.gif'),
(3519, 3484, '2636155319644JVJ M8.gif'),
(3335, 1451, '5674495837653Do.jpg'),
(2993, 1970, '7982671114185Vigor2700Ge.jpg'),
(2996, 3313, '3584302969172IN24.jpg'),
(1916, 2334, '1001439188296Miếng dán PDA các loại.jpg'),
(1917, 2335, '2273969030581Miếng dán PDA các loại.jpg'),
(3517, 3483, '541084570601JVJ M7 512MB.jpg'),
(3514, 3480, '105326715247JVJ X8.jpg'),
(3515, 3481, '7043364840553JVJ M1.jpg'),
(3513, 3479, '9519219015680JVJ X8.jpg'),
(3512, 3478, '312431518637JVJ X7.jpg'),
(3511, 3477, '4103802473441JVJ X7.jpg'),
(3505, 1487, '2320919165748JVJ X3.gif'),
(3501, 3473, '71967147592031GB ok.jpg'),
(1927, 2344, '9591778296969FinePix S3500.jpg'),
(1928, 2083, '3519975241514Cable AMP.jpg'),
(1929, 2070, '184897942013324 PORT COMPEX SXP2224WM.jpg'),
(2672, 1977, '4896466075780Vigor2600VG.jpg'),
(1931, 2008, '6172654352876Net PCMCIA REALTEK.jpg'),
(3481, 3231, '9293005052777JXD632.jpg'),
(1933, 2458, '2483110261516DKU5.jpg'),
(1935, 2459, '8098826857573DKU2.jpg'),
(3480, 3471, '9945428170659Maxell.jpg'),
(1938, 2462, '2548657434925Cable PALM.jpg'),
(1939, 1777, '5290358837279Filter 17 Glass.jpg'),
(1940, 1778, '5234872385517Filter 21 Glass.jpg'),
(1941, 1776, '39877242832Dustcover.jpg'),
(3478, 3470, '94869027209807016536248680dvd-rmini_150x100_small.jpg'),
(3477, 3469, '80817541268257016536248680dvd-rmini_150x100_small.jpg'),
(3474, 1360, '7768042279202CDRW.jpg'),
(3473, 1361, '5029389589394CDRW.jpg'),
(3472, 3468, '5943696539169JVJ Flash USB.jpg'),
(3471, 3369, '6072047033963FAN COOLER COOL VIVA PRO.jpg'),
(3469, 1358, '8927770051167NPK-B4.jpg'),
(3468, 3467, '4185812655333FAN  775.jpg'),
(3467, 1357, '1068510667979Fan Notebook.jpg'),
(3466, 3381, '65348406419398GB RAMDISK CORSAIR.jpg'),
(3465, 3262, '5026036016325OK.jpg'),
(3460, 3322, '614704526754Acer TravelMate 2484WXMi.jpg'),
(3431, 2815, '16285579218004GB USB 2.0.jpg'),
(3430, 3461, '507853691893Toshiba.jpg'),
(3231, 3386, '624186006109715 VENR 150MB.gif'),
(3269, 3394, '3218458145298twinmos.gif'),
(3274, 3395, '9114960670791twinmos.gif'),
(3275, 3396, '8975634770342untitled.bmp'),
(3277, 3398, '5377551860255PC4200 NCP.jpg'),
(2958, 2331, '515834987674C330.jpg'),
(2971, 3289, '4645862312506dv2000.jpg'),
(3101, 2901, '8649728072534320.jpg'),
(3105, 1963, '1045340412138D-LINK  2540T.jpg'),
(310, 1905, '2957488997412TMN.jpg'),
(3100, 2900, '5307736429770Flash JVJ 128.gif'),
(3429, 3460, '1633740762884AH220.jpg'),
(3428, 2862, '6369600733625DEN.jpg'),
(3426, 3459, '6241250238831AH320.jpg'),
(1990, 2802, '90128289456051GB DDR2 TWIN XMS2.jpg'),
(3422, 3457, '9617082582569usb_fusion_drive.jpg'),
(3417, 3454, '5722970279093resizeimg..............jpg'),
(2004, 2395, '3790395487561KVM Switch Cable Aten 62.jpg'),
(2622, 1379, '744128376443DD256 - PC3200.jpg'),
(2734, 3224, '6120826337146C700.jpg'),
(276, 2669, '4300748854190VW690.jpg'),
(2643, 3173, '341089377305YP-Z5FQS.jpg'),
(2006, 2397, '2891941725224KVM Switch Cable Aten 62U.jpg'),
(2007, 2398, '8608265640194KVM Switch Cable Aten 64A.jpg'),
(2008, 2399, '2773651952077KVM Switch Cable Aten 74E.jpg'),
(2009, 2401, '87841760924208 port Video Splitters-VS98A.jpg'),
(2010, 2402, '4484585899525Data Switch USB.jpg'),
(2012, 2403, '9067400813359Multi VGA 4.jpg'),
(2013, 2404, '485134518629Hub USB 2.0 1 in 4.jpg'),
(2014, 2405, '5094936762803Auto Switch VGA-Key-Mouse.jpg'),
(2015, 2406, '4354406037936Data Switch VGA-Key-Mouse.jpg'),
(2017, 2407, '3897405093309CACOO2LB.jpg'),
(2018, 2408, '9687202774797cable VGA.jpg'),
(2021, 2400, '620960523955Data Switch LPT.jpg'),
(2022, 2409, '7772615398021LPT Cable.jpg'),
(2023, 2410, '7942123364633USB Cable.jpg'),
(3416, 3452, '1185276034852.........resizeimg.jpg'),
(2031, 2946, '8152179279575ddr2_module.gif'),
(3169, 2411, '1222470310115CAQR45EP.jpg'),
(3415, 3451, '2001414754775.........resizeimg.jpg'),
(2044, 2954, '686653984319Vigor2700e.jpg'),
(2043, 1968, '951135478840Vigor2500V.jpg'),
(2045, 2955, '878271335808Vigor2910G.jpg'),
(2047, 2957, '4300748854190INWR48G.jpg'),
(2921, 1576, '37943587841150.jpg'),
(2638, 1713, '888325896281AOC 550S...jpg'),
(2051, 2413, '912258233378iPod USB Cable....jpg'),
(3414, 3453, '7796090316826resizeimg..............jpg'),
(2054, 2044, '819790987021216 PORT D-LINK DES 1018DG.jpg'),
(2267, 1727, '3803809783497997MB.jpg'),
(2268, 1879, '3798017220148A-970.jpg'),
(2058, 2415, '2667861890859USB to PS 2.jpg'),
(3411, 3450, '27950551672resizeimg.........jpg'),
(3410, 3449, '3030353041665resizeimg...jpg'),
(2063, 2419, '1528865285674Card Test Mainboard.jpg'),
(3409, 3448, '9730799236896resizeimg...jpg'),
(2065, 2427, '186519914125GAME Pad.jpg'),
(2066, 2428, '4394344164003Joytick lái xe Các loại.jpg'),
(2067, 2429, '4238555255071Thiết bị hút khói.jpg'),
(2068, 2430, '351082903875Thiết bị chuyển MP3 xe hơi.jpg'),
(2069, 2431, '48108796463Cáp nguồn HDD 1-2.jpg'),
(2070, 2432, '1070644796517Cáp HDD ATA 133.jpg'),
(2071, 2433, '2749872072751BOP CD.jpg'),
(3408, 3447, '1563010748390resizeimg.jpg'),
(3407, 3446, '1169422848635resizeimg.jpg'),
(2084, 1356, '3031267625673FAN cpu socket 478.jpg'),
(2075, 2437, '4855003643441Đầu chuyển Line Out từ 1 ra 2.jpg'),
(2076, 2438, '4213860791736Pin CMOS.jpg'),
(2082, 1976, '9960366872868ADW-4401.jpg'),
(3343, 1455, '2599937794228GB RAMDISK CORSAIR.jpg'),
(2733, 3223, '4144655083515NETAC A100.jpg'),
(2477, 3103, '2772127645804CGS-2400.jpg'),
(2094, 1954, '5298895252653AM300.jpg'),
(2092, 2440, '1707519489924YT USB.jpg'),
(2093, 2439, '9600009751821yaphone.....jpg'),
(2730, 3221, '8764359410869C635.gif'),
(2745, 1332, '44763543458943.jpg'),
(2750, 2811, '188654042663DDR400_ANGLE_thumbnail.jpg'),
(2101, 2972, '7227201885888JXD639.jpg'),
(3405, 3445, '6342467380009PT-LB55NT.gif'),
(3404, 3444, '285298065021PT-LB55NT.gif'),
(2104, 2441, '8785090676428Phone 250.jpg'),
(2105, 2443, '7159825445683howin 1.jpg'),
(2106, 2442, '8665581358751phone 870.jpg'),
(2107, 2421, '8449123256973Card Test Mainboard notebook.jpg'),
(2114, 2420, '5125118928965Card Test Mainboard usb.jpg'),
(2913, 1560, '3420282566100.jpg'),
(2110, 2436, '4592205128760tool kits B.jpg'),
(2111, 2974, '1707214529402IP 3200.jpg'),
(3403, 3443, '7090924697985PT-LB55NT.gif'),
(2113, 2425, '4586717425932antistat.jpg'),
(2910, 3051, '20123900604300.jpg'),
(2911, 1581, '46513500153330.jpg'),
(2912, 1552, '2772432475470.jpg'),
(2123, 2976, '3776981191624Bo sac xe hoi.jpg'),
(3396, 2473, '5438525914845HP DV2204TU.jpg'),
(2796, 2984, '7872308034147MP-Car.jpg'),
(3395, 2477, '4112338888815HP DV2204TU.jpg'),
(3163, 3364, '193532023225ETM-5.jpg'),
(2128, 2989, '8125655449446G-Pen 560.jpg'),
(2129, 2990, '3758384054603G-Pen 4500.jpg'),
(2130, 2988, '133588212700G-Note-7000.jpg'),
(2131, 1359, '7503719458248301 Notebook.jpg'),
(2654, 2964, '145362442307FAN COOLER CM-HYPER TX.jpg'),
(2133, 1584, '6550389066414card hdd.jpg'),
(2135, 1585, '5075120180031hddboxint.jpg'),
(2136, 1586, '7434818611770hddbox3.5.jpg'),
(2137, 2848, '3958379147899usb2ide.jpg'),
(2138, 1587, '860284021052hddbox3.5sata.jpg'),
(2139, 1588, '5966561834488hddbox3.5lan.jpg'),
(2140, 2851, '1478561676217pci2sata.jpg'),
(2141, 1589, '8694544079162hddbox5.25.jpg'),
(2142, 2849, '5294322133833usb2sata.jpg'),
(3382, 1925, '3865393660352Inspire 350.jpg'),
(3381, 3218, '9567998318863Inspire M5300.jpg'),
(3380, 2999, '612119346838Inspire T6060.jpg'),
(2148, 2959, '7402807277592INFOSMART28gc.jpg'),
(2149, 3000, '7106777984203INWA18GA.jpg'),
(2154, 1399, '15182779497256MB DDRAM PQI.jpg'),
(2153, 1390, '81518743190531057.jpg'),
(2155, 2040, '7919930956198 PORT PROLINK.jpg'),
(3003, 3315, '7566827641376I427-1116-main.jpg'),
(3379, 1928, '4830613941849Inspire         245.jpg'),
(3308, 2810, '3556559693291Twinmos.jpg'),
(2164, 2725, '499317276519HDDbox2.5.jpg'),
(3366, 1386, '581632220154DDRAM II....gif'),
(3365, 1382, '3431867634530DDRAM II....gif'),
(3364, 1375, '4859881524003DDRAM II....gif'),
(3363, 2803, '6966537499745DDRAM II....gif'),
(2174, 2726, '1493805140170hddboxbackup.gif'),
(2175, 2724, '8330528523304HDD box 1394 5.25.jpg'),
(3362, 2800, '121582562981DDRAM II....gif'),
(3359, 1412, '6383015129562DDRAM II....gif'),
(2184, 2061, '401752403447316 PORT COMPEX 100.jpg'),
(2729, 1519, '2235860271310JXD921.jpg'),
(2213, 2143, '8114375282047OKI C3200.jpg'),
(2212, 2721, '865771623880oki_c5700n.jpg'),
(2190, 2890, '319041008895Hitachi.jpg'),
(2191, 2891, '80425091163Hitachi.jpg'),
(2192, 2892, '2528231129887Hitachi.jpg'),
(2193, 2893, '7867430053584Hitachi.jpg'),
(2194, 2894, '5851625635630Hitachi.jpg'),
(2211, 2720, '1352040349439oki_c5600n.jpg'),
(270, 2661, '4377271333255PHILIPS LCD S6FB.jpg'),
(2726, 1465, '6206495053850Zen Neeon 2.,,.jpg');
INSERT INTO `n_productpic_host` (`productpicid`, `productid`, `productpicname`) VALUES
(2201, 1998, '1611485289831images.jpg'),
(2200, 2928, '7038182098247WAP252.jpg'),
(2210, 2719, '8622289758396oki_c3300n.jpg'),
(2205, 3017, '2205068282882K40-82...jpg'),
(2206, 1989, '791993095619WGH 950.jpg'),
(2207, 2018, '7694263552162INFOSMART USB.jpg'),
(3291, 3410, '2468781381571TEAM.jpg'),
(3293, 3411, '3622716688966PC4200 NCP.jpg'),
(3297, 1394, '96750079246121057.jpg'),
(3299, 3412, '3769359360259untitled.bmp'),
(3300, 3393, '1147777097846DDR.jpg'),
(2914, 1561, '2154826345360.jpg'),
(2221, 1910, '3600461017133MICROLAB - M960.jpg'),
(2644, 3020, '1288017482304yp-z5fzb.gif'),
(3358, 3407, '8211933888414DDRAM II....gif'),
(2228, 2275, '6029670017615Black Ink Cartridge Refill.jpg'),
(2229, 2276, '1443196668970CACT0KZ5.jpg'),
(3357, 3404, '1930074918016DDRAM II....gif'),
(3356, 3402, '6072961617971DDRAM II....gif'),
(3346, 3420, '7397014714242AH221.jpg'),
(2235, 3026, '341699199571Call internet Skype Phone DB 110- USB.jpg'),
(3345, 1456, '355015747677320.jpg'),
(3344, 3419, '8900026875286AH220.jpg'),
(2712, 3183, '1095949082117VIA MINI PCI-2500.jpg'),
(2732, 3222, '5439135637110NETAC C670.jpg'),
(2254, 1536, '616198398964sacpinsony.jpg'),
(2253, 1533, '88478939978132pinAA.jpg'),
(2248, 2881, '252372048056JVJ X8.jpg'),
(2252, 1535, '35022927872804pinAA.jpg'),
(3028, 3180, '4328187168328K40-80...jpg'),
(2257, 1705, '338095422808Acbel500W.jpg'),
(3342, 3418, '9148191549500U310 1GB.jpg'),
(3341, 1454, '7459513273884U320 1GB.jpg'),
(3340, 1453, '6592156360497OK 1GB.jpg'),
(3339, 3417, '5100424465630U350.jpg'),
(227, 1887, '5433648034283A-4000_med.jpg'),
(2264, 3031, '532999202823JXD632.jpg'),
(2265, 3032, '2436769948614JXD633.jpg'),
(3312, 3414, '3622106866700U350.jpg'),
(2972, 3290, '1896539277565dv2000.jpg'),
(2824, 1510, '7843345313736275M2_150x148.jpg'),
(2919, 1572, '13090535108270.jpg'),
(2916, 1565, '17474574172120.jpg'),
(2917, 1568, '63232604207230.jpg'),
(2918, 1569, '66333138323140.jpg'),
(3311, 1420, '7762859438117U310 512MB.jpg'),
(3310, 2813, '6008633989092Twinmos.jpg'),
(3034, 3328, '2827309135823AX-2.jpg'),
(3035, 3079, '9987195464741D-LINK 520T.jpg'),
(3036, 2922, '8140289289912K9VGM-V.jpg'),
(304, 1916, '3107485242994x23.jpg'),
(3040, 1668, '2581888313633GeForce 7100GS.jpg'),
(3042, 3343, '5336394388438ADSL JNet JN-DS5100.jpg'),
(3043, 3344, '7856149886186ADSL JNet JN-DS5400.jpg'),
(3045, 2777, '2308724215563GA-M59SLI-S4.jpg'),
(3053, 1894, '1231006625489A-2100.jpg'),
(3054, 1895, '7822309285212A-2300.jpg'),
(3062, 3350, '4565681497409TravelSound 250.jpg'),
(3063, 3351, '625253046230CAU785IN.jpg'),
(3065, 2662, '2629448171065VIEWSONIC VA503B.jpg'),
(3066, 3352, '2712068175222Acer 5052 ANWXMi.jpg'),
(3085, 1415, '8410099714914usb.jpg'),
(3093, 1450, '5364137564319SEITEC 2GB USB Flash 2.0.jpg'),
(3302, 3392, '1765444831967PQI.jpg'),
(2332, 3076, '338650487024SP-E200.jpg'),
(3301, 3413, '9999938412untitled.bmp'),
(3289, 3409, '5578461537559TEAM.jpg'),
(2357, 1693, '6154057215855POWER 450W.jpg'),
(2341, 3080, '2993463628145wag54g.jpg'),
(2342, 3081, '382246949123WRT54GS.jpg'),
(2346, 3082, '629887081913216 PORT LINKSYS.jpg'),
(2349, 2085, '37743114293AMP Netconnect Cat6.jpg'),
(2350, 2088, '7441830720871matna.jpg'),
(2351, 3084, '6536060186470JVJ M7 512MB.jpg'),
(2358, 1694, '6807090156002POWER 500W......jpg'),
(2359, 1695, '4983963860500POWER 700W.jpg'),
(2360, 1697, '6104973150929POWER 620W......jpg'),
(3288, 3408, '6432404155010PC4200 NCP.jpg'),
(2367, 3085, '4469342236794OKI 3300.jpg'),
(3283, 3403, '1407831661724TEAM-PC4200.jpg'),
(3285, 3405, '52376954760PC4200 NCP.jpg'),
(3026, 3325, '7681154117968FUNTWIST D-Chord 115.jpg'),
(2368, 3086, '9892380610399OKI 3300.....jpg'),
(2373, 3087, '1208141330171JXD638.jpg'),
(3279, 3400, '8745762372627PC4200 DYNET.jpg'),
(2382, 3090, '1572766695151100MB...jpg'),
(2381, 3089, '803236501376JXD 650.jpg'),
(3278, 3399, '8505219431000PC4200 DYNET.jpg'),
(2686, 3197, '9986585642476CA2HE9MZ.jpg'),
(2687, 3196, '8469549562010CA2HE9MZ.jpg'),
(2851, 3280, '4344040454546DELL Dimension 9200.jpg'),
(2401, 1556, '6365942397593CA2HE9MZ.jpg'),
(3216, 3189, '1320028916482XEROX C525A.jpg'),
(322, 1926, '431635974571Creative_370.jpg'),
(2766, 1449, '4081851762131512MB USB 2.0.jpg'),
(3197, 3366, '1356613368259Loa USB.jpg'),
(3024, 3324, '4468732514529TCL E-102.jpg'),
(319, 1929, '1501122011014inspire_T7900.jpg'),
(3186, 2781, '8549425615364GA-M61SME-S2.jpg'),
(3184, 3373, '6650996385327HD300LD.jpg'),
(3183, 2426, '9211909454893CAYJYZQX.jpg'),
(3182, 2424, '2278542049400CA4PYX7J.jpg'),
(3181, 2422, '1689227214646CAU1AH0R.jpg'),
(3180, 2423, '935891916108CAYJW9C9.jpg'),
(3175, 2417, '393831977043CAINOVZC.jpg'),
(3177, 2418, '2390734496233CAM1KP61.jpg'),
(2567, 2527, '5520841057259MA600.jpg'),
(3173, 2416, '6452220737782Link USB1.1 USB2.0.jpg'),
(3172, 2414, '8004926786017CALKBMBF.jpg'),
(2440, 1514, '7228116469896SAFA 828.jpg'),
(3170, 2412, '265481482249SpeedWheel.jpg'),
(3168, 2979, '1620326466948images.jpg'),
(3167, 2978, '3231872441234Sprayway 31.jpg'),
(2458, 3097, '73650033800644GB CREATIVE ZEN V PLUS.jpg'),
(3162, 3363, '7461342441900ED720.jpg'),
(3161, 2930, '2164520434551K9AGM2-L.jpg'),
(2480, 3102, '628582355321CSH-2402G(F).jpg'),
(2566, 3105, '49848784445085 PORT LINKPRO.gif'),
(2488, 3107, '5844613626529B60.gif'),
(3160, 2878, '3105960936721K9N6SGM -  V.jpg'),
(3142, 2488, '2992244182394HP DV2204TU.jpg'),
(2818, 3261, '5143716065986M2N-MX.jpg'),
(3152, 3365, '1510877970918S200.jpg'),
(2924, 1579, '88667959965770.jpg'),
(2923, 1578, '48601864845250.jpg'),
(2922, 1577, '40327675972040.jpg'),
(2839, 2823, '3113887529830512MB 1GB MP4 MIMO.jpg'),
(3141, 3299, '5187617488607Compaq nx6320.jpg'),
(3136, 3370, '1874588566254CAR-854.jpg'),
(3129, 2332, '2303236612735V530.jpg'),
(2551, 1883, '1123692257998a6000.gif'),
(3119, 3333, '2878222567545Mp4 MiMo.jpg'),
(2853, 3281, '778883561425Cartridge 309.jpg'),
(3115, 1708, '8125655449446PRO556D.gif'),
(3106, 2774, '5972354397837GA-M61P-S3.jpg'),
(3099, 2899, '6589107647950512MB USB 2.0.jpg'),
(3098, 2843, '434074964853Flash JVJ 128.gif'),
(2556, 3138, '4843113653777HD300LD.jpg'),
(2559, 3140, '8324736058733G-SHOT P611.jpg'),
(3031, 3331, '8728384680136XEROX DocuPrint PE220.jpg'),
(3030, 3330, '3073115193XEROX Workcentre 3119.jpg'),
(2577, 3151, '5426636025182DLP TDP-S35.jpg'),
(2575, 3152, '811504717869DLP TDP-T95.jpg'),
(2578, 3153, '7437562562574DLP TDP-T100.jpg'),
(2579, 3146, '9448184139443DS_3088_copy.jpg'),
(2580, 3147, '7796700139091DS_5341.jpg'),
(2581, 3148, '1639533327455DS_6370.jpg'),
(303, 1917, '1404173126912x25.jpg'),
(3020, 3321, '8683873535250FY800.jpg'),
(2623, 1972, '6495207476395D-LINK 520T.jpg'),
(26, 2, '239872336127100009386205.jpg'),
(2619, 3163, '3855332838705G-SHOT D612   .....jpg'),
(2618, 3164, '2941940572937G-Shot DV611.jpg'),
(2620, 3165, '217732508222dv1110_160.jpg'),
(3027, 3327, '3034316338220MICROLAB - FC361.jpg'),
(2632, 1717, '4378795739528AOC 995F ........,,,.jpg'),
(2986, 3312, '804187847025Cooler Master R9.gif'),
(2979, 2494, '877966574065dv2000.jpg'),
(2827, 1388, '9214348445174ddr.jpg'),
(2646, 3175, '631631067867yp-t9.gif'),
(2648, 3176, '7225067757350Nansin S89.jpg'),
(2656, 3177, '2533109010450cooling-CM-RR-CCB-WLU1-GP.jpg'),
(2669, 1711, '6077229875048VIEWSONIC E50CSB.jpg'),
(271, 2663, '9894819699459BENQ FP 51G.jpg'),
(2703, 3209, '7272017792517PREMIER DM 5331.jpg'),
(2705, 3210, '7168361761057DS 8650.jpg'),
(2725, 1464, '844735695356Zen Neeon 2.,,.jpg'),
(2741, 1404, '6823858026228TEAM-PC4200.jpg'),
(2805, 3254, '6694897791698GB RAMDISK CORSAIR.jpg'),
(2909, 1580, '53653570100700.jpg'),
(2908, 3305, '23940880705230.jpg'),
(2905, 3303, '7507073032537X-Fi Xtreme Audio.jpg'),
(2870, 1971, '4615680146344TP-LINK (8810) 1PROT...jpg'),
(2895, 2877, '5918697115312K9MM-V.jpg'),
(2904, 3302, '695312315030Sound Blaster X-Fi XtremeGamer.jpg'),
(2869, 1973, '2535852861253TP-LINK (8840).jpg'),
(2888, 3296, '656935353467HP Pavilion dv2211tu Notebook PC.jpg'),
(4714, 4251, '2315736324663INTEL Core2 Duo E6300.jpg'),
(4716, 4238, '1929465294530Intel Pentium   D.jpg'),
(4717, 4239, '6996109843643Intel Pentium   D.jpg'),
(473, 1982, '8114680143790A2WR-S511A.gif'),
(4733, 3124, '9978659049367KINGMAX 512MB.jpg'),
(4734, 3421, '8833260157346KINGMAX 512MB.jpg'),
(4735, 1447, '62742538150KINGMAX 512MB.jpg'),
(474, 1956, '605649869488A2R-411A.gif'),
(4741, 2147, '8935086922011Vivid-1200TA.jpg'),
(4742, 4270, '513396026082HR-Slim2400TA.jpg'),
(4743, 4271, '1565144876929SpeedWheel.jpg'),
(4744, 4272, '7391831971937TwinWheel.jpg'),
(4745, 4273, '2547133128652NOTEBOOK.jpg'),
(4746, 4274, '5770530037746NOTEBOOK.jpg'),
(4747, 4275, '1849589142398NOTEBOOK.jpg'),
(4748, 4276, '9825309130716NOTEBOOK.jpg'),
(4749, 4277, '9826223714725NOTEBOOK.jpg'),
(475, 1997, '964208197647BR-202W-1.gif'),
(4751, 4279, '1332833488932256MB PALIT 5500.jpg'),
(4752, 3610, '2967244858537T-11.jpg'),
(4753, 4280, '5255603552297WRT-415.jpg'),
(4754, 4281, '7510731467349WRT-410.jpg'),
(4756, 4282, '8544547734801WAP-4000.jpg'),
(4757, 4283, '8461622968901JXD-685.jpg'),
(4758, 4284, '1529779869682FSD-1603.jpg'),
(4759, 4285, '585345483646FNSW2401.jpg'),
(476, 1991, '6736055279765WL-G54MAR.jpg'),
(4760, 4286, '9769212956689FGSW-2620VM.jpg'),
(4761, 1875, '5391271017935usb2audiob.jpg'),
(4767, 4241, '8663447230213Dual Core.jpg'),
(4768, 4242, '7976573787871Dual Core.jpg'),
(477, 1993, '7491219746319g54aap_108.jpg'),
(4770, 4235, '3123338529212Celeron processor.jpg'),
(4775, 4289, '8107973095212DSL-522T.jpg'),
(4779, 4292, '4600741544134dv6000.jpg'),
(4784, 4294, '9251542620437nc2400.jpg'),
(4788, 4295, '4000451237251056.jpg'),
(4789, 4296, '8528694448583JVJ M2 TOUCH.jpg'),
(4791, 4298, '7583900472124CENIX W600.jpg'),
(4792, 4299, '1566059460937CENIX W240.jpg'),
(4795, 4301, '9198190297213MA582.jpg'),
(4796, 4302, '977043242440KX-562K.jpg'),
(4799, 4254, '3670886169884AMD SEMPRON.jpg'),
(480, 1486, '3365710638856JVJX11.jpg'),
(4800, 4255, '7045803830834AMD SEMPRON.jpg'),
(4802, 4256, '4006243867074ATHLON 64.jpg'),
(4803, 4257, '7410429010179ATHLON 64.jpg'),
(4807, 4262, '7094887994539ATHLON 64x2.jpg'),
(4808, 4263, '4114777779096ATHLON 64x2.jpg'),
(4809, 4264, '932410182947ATHLON 64x2.jpg'),
(4810, 4265, '4130631065314ATHLON 64x2.jpg'),
(4811, 4266, '9232335859930ATHLON 64x2.jpg'),
(4814, 4304, '1331613944402LTV678.GIF'),
(4816, 3466, '41803249525052GB ok.jpg'),
(4819, 4308, '56949973580PROLINK H6300G.gif'),
(482, 1964, '5061096161829ag241.jpg'),
(4823, 1932, '9508548570547SP-I200.jpg'),
(4824, 4313, '3860210819267SP-F200.jpg'),
(4825, 1934, '285749131985SW-HF 3000.jpg'),
(4826, 1933, '592302764066SW-i2.1 1100.jpg'),
(483, 1967, '8642106341168megazoom.jpg'),
(4831, 4315, '3631557866083ASUS 1814BL.jpg'),
(4832, 4316, '2506890140842ASUS   1814BL.jpg'),
(4833, 4317, '4121484927675ASUS 1814BL.jpg'),
(4834, 4318, '345412317583ASUS   1814BLT.jpg'),
(4835, 4319, '6207409637858LG H42N.jpg'),
(4838, 4322, '5432428588531LITE ON 20A1P487C.gif'),
(4841, 4323, '1737396794343LITE ON 20A1H487C.jpg'),
(4842, 4324, '485408895943320A1S11C.jpg'),
(4844, 4325, '8556742584986LH20A1PX499C.bmp'),
(4845, 4326, '976250579332Plextor PX-740A.jpg'),
(4846, 4327, '843516150826Plextor 751A.jpg'),
(4847, 4328, '2634630913371Plextor 740U.jpg'),
(4848, 4329, '2227933578201Plextor 740U.jpg'),
(4849, 4330, '3284615140972DVD 16X Samsung.jpg'),
(485, 1992, '1052657381761wrt54g.jpg'),
(4850, 4331, '1592583291067dvd -rw den.jpg'),
(4851, 4332, '3591314978273HP-940i.jpg'),
(4853, 4334, '653886640921R105256DP2-RH.jpg'),
(4854, 4335, '6143996592987SP-i201U.jpg'),
(4855, 4336, '7804626732200Traveler 315 Laser.bmp'),
(4856, 4337, '9136606421580OPTICAL 311.bmp'),
(4859, 4339, '1190154015415Logitech   Quickcam.jpg'),
(4868, 4344, '6253140228495gz- x2.jpg'),
(4869, 4340, '1124606842006GZ-PPC1A.jpg'),
(4870, 4341, '6612887527277GZ-PPC1B.jpg'),
(4871, 4342, '9368003225568GZ-PPC1C.jpg'),
(4874, 4343, '4555315815240gz-x3.jpg'),
(4875, 4345, '6578132242295GZ-XA1CA-STB.jpg'),
(4877, 4347, '9743908671090MG470.jpg'),
(4878, 4346, '837473477668SF478 ok.jpg'),
(4880, 4349, '4489463780088MF436.jpg'),
(4881, 4348, '5857418198980MF  468.jpg'),
(4882, 4350, '4920245955107MG432.jpg'),
(4885, 4351, '5635167433852MG466.jpg'),
(4886, 4352, '7834199174876SH 496.jpg'),
(4887, 4353, '3660887238317.jpg'),
(4889, 4355, '523090908896320.jpg'),
(4892, 4358, '9231498082625.jpg'),
(4893, 4359, '825278659848830.jpg'),
(4894, 4360, '790492918936923.jpg'),
(4895, 4361, '494981839778323...jpg'),
(4896, 4362, '842107512057024.jpg'),
(4899, 4365, '17648351970225...jpg'),
(4900, 4366, '668087368974625.....jpg'),
(4901, 4367, '632112639096427.jpg'),
(4905, 4371, '348125665997827.jpg'),
(4906, 4372, '429221243881628.jpg'),
(4907, 4373, '745006227450230.jpg'),
(4908, 4374, '819699528620430.jpg'),
(4909, 4375, '9740555196800cfsacds.jpg'),
(4910, 4376, '784243072972835.jpg'),
(4911, 4377, '721165346141337.jpg'),
(4912, 4378, '88436886090138.jpg'),
(4914, 4380, '5294017272090Cooler master 330.jpg'),
(4915, 4381, '613948514854Elite 331 - RC-331.jpg'),
(4917, 4383, '63412478354798GB RAMDISK CORSAIR.jpg'),
(4918, 4384, '92963586270668GB RAMDISK CORSAIR.jpg'),
(4919, 4385, '50071340175618GB RAMDISK CORSAIR.jpg'),
(4920, 4386, '37974074966628GB RAMDISK CORSAIR.jpg'),
(4922, 4388, '6204056063568speedtouch_608.jpg'),
(4923, 4389, '3951671999320CoolerMaster Centurion 531.jpg'),
(4927, 4393, '4677873745463Praetorian 730.jpg'),
(4928, 4382, '902258486730Centurion 5.jpg'),
(4929, 4394, '4173008081661Case Duplicator.jpg'),
(4930, 4395, '2659935297750500.jpg'),
(4935, 4398, '4056242616009M300F.jpg'),
(4936, 4399, '6611972943269SR-M800F_dop1.jpg'),
(4937, 4400, '2384637071141SR-M800F_dop1.jpg'),
(4938, 4401, '169562941482DVD ASUS COMBO.jpg'),
(4939, 4402, '3694666049210DVD combo den.jpg'),
(4940, 4403, '7502804874240DVD LITE ON COMBO.jpg'),
(4942, 4405, '336211496743DVD-16X SAMSUNG COMBO den.jpg'),
(4944, 4406, '7488780756038crt-793mg.gif'),
(4945, 4407, '5810772925556m_796mb.jpg'),
(4946, 4408, '3445281930466E71.jpg'),
(4948, 4409, '783456680245e70fplussb_us_eng_med.jpg'),
(4949, 4410, '8661618062197LG T713SH.jpg'),
(4950, 4411, '374320256014LG T730SH.jpg'),
(4951, 4412, '1476122685936PRO775CA Pure Flat CRT Monitor.gif'),
(4952, 4413, '5534865075461PRO775B.gif'),
(4953, 4414, '9191788011599170FT.gif'),
(4954, 4415, '5854064525911171 FV.gif'),
(4955, 4416, '5817480172913AOC 771S.jpg'),
(4956, 4417, '2275493336854AOC 785F.jpg'),
(4957, 4418, '85479012909017 HAIER HV - 708CB.jpg'),
(4958, 4419, '225445739552777K.jpg'),
(4959, 4420, '5069937338946G 90fB.jpg'),
(4960, 4421, '1421245957660G90fB.jpg'),
(4961, 4422, '6474781171358MM17DE.jpg'),
(4962, 4423, '7991817351824VB171D.jpg'),
(4963, 4424, '2209336441180MM17T.jpg'),
(4964, 4425, '3366625222864Acer AL1716Fbd.jpg'),
(4965, 4426, '8097607413042Acer AL1716Fb.jpg'),
(4966, 4427, '3022121586813m_740n.jpg'),
(4967, 4428, '235445486200l_732n.jpg'),
(4968, 4429, '840644137888217 732NPLUS.jpg'),
(4969, 4430, '2811151087862m_731ba.jpg'),
(4971, 4432, '2027633524383VA703b.jpg'),
(4972, 4433, '9792078252008VA730m.jpg'),
(4973, 4434, '8628692045231VA712b.jpg'),
(4977, 4438, '407856095245730a.jpg'),
(4978, 4439, '7566522879633MA782.jpg'),
(4979, 4440, '2367564340393PRO177.gif'),
(4980, 4441, '1310273055357VFT795.jpg'),
(4983, 4443, '116704682418Philips 170 S7FB.jpg'),
(4984, 4444, '8864661868039DAEWOO LM 1702.jpg'),
(4985, 4445, '2475793390672AL 1916.jpg'),
(4986, 4446, '2377929923783AL 1916.jpg'),
(4987, 4447, '6048876976902VW192T.jpg'),
(4988, 4448, '579193329872VW192G.jpg'),
(4989, 4449, '3503817093554PW191.jpg'),
(4990, 4450, '7416221573528PG191.jpg'),
(4992, 4452, '3284005318707l_732n.jpg'),
(4993, 4453, '8404002388601932B Plus.gif'),
(4994, 4454, '7947611067460931BW.jpg'),
(4995, 4455, '650533066631943A.jpg'),
(4996, 4456, '1496853852716CMV 938D.jpg'),
(4997, 4457, '6404965740872946................jpg'),
(4998, 4458, '4365381443591VA1912wb.jpg'),
(4999, 4459, '6067474015144VA903b.jpg'),
(5000, 4460, '2784932119475VA903b.jpg'),
(5002, 4462, '7478110312126VX1945wm.jpg'),
(5004, 4464, '2482500539250Philips 190CW7CS.jpg'),
(5005, 4465, '7507073032537PRO198.gif'),
(5006, 4466, '81790704704AOC 193FW.jpg'),
(5007, 4467, '4504402482297HP W1907 RK283AA.jpg'),
(5008, 4468, '8410709537180Haier HV-934TBW.jpg'),
(5010, 4469, '634307703496GV-NX72G128D.jpg'),
(5011, 4470, '2320309343483HP  -435i.jpg'),
(5015, 4472, '8438147851318N09.jpg'),
(5017, 4474, '8232665055194S55.jpg'),
(5018, 4475, '7046108691356269-09976.jpg'),
(5019, 4476, '276603022071166G-00576.jpg'),
(5020, 4477, '352088982552266I-00715.jpg'),
(5021, 4478, '80229141199466J-02289.jpg'),
(5023, 4479, '130783406507666R-00765.jpg'),
(5024, 4473, '553584182530E85 - 04793.jpg'),
(5026, 4481, '3040718625055Bit Defender 10.jpg'),
(5027, 4482, '4386417470894Bit Defender 10.jpg'),
(5028, 4483, '6302224392200BitDefender Mobile.jpg'),
(5029, 4484, '7313480126077T051190.jpg'),
(5030, 4485, '6415026562519T052090.jpg'),
(5031, 4486, '7447623284221T050190.jpg'),
(5032, 4487, '3295285584884T053090.jpg'),
(5033, 4488, '3792529517320T013091.jpg'),
(5034, 4489, '303614556236T014091.jpg'),
(5035, 4490, '836528378286T038190.jpg'),
(5036, 4491, '2567559433689T039090 Colour.jpg'),
(5037, 4492, '2016048595242T028091.jpg'),
(5038, 4493, '735287099326T029091.jpg'),
(5039, 4494, '6062291272838T026091.jpg'),
(5040, 4495, '6954647411303T027091.jpg'),
(5041, 4496, '1640447911463T017091.jpg'),
(5042, 4497, '9511597283093T018091.jpg'),
(5043, 4498, '6367161843344T019091.jpg'),
(5044, 4499, '432245696836T020091.jpg'),
(5045, 4500, '3106875520729T007091.jpg'),
(5046, 4501, '4685495576829T008091.jpg'),
(5047, 4502, '487732148598T009091.jpg'),
(5048, 4503, '9041181943751T032190.jpg'),
(5049, 4504, '4201665841551T032290.jpg'),
(505, 1396, '317943473239UMAX DDRAM 2 1GB - 533.jpg'),
(5050, 4505, '5725409169374T032390.jpg'),
(5051, 4506, '1443806391235T032490.jpg'),
(5052, 4507, '3724543353630T042290.jpg'),
(5053, 4508, '4980000563945T042390.jpg'),
(5054, 4509, '5051035440182T042490.jpg'),
(5055, 4510, '9643606213920T046190.jpg'),
(5059, 4513, '1712702232230T047290 Cyan.jpg'),
(506, 1395, '3240103994865small_ddr2_ddr667.gif'),
(5060, 4514, '6222958062332T047390 Magenta.jpg'),
(5061, 4515, '70974091781T047490.jpg'),
(5062, 4516, '4820248358459T056190.jpg'),
(5063, 4517, '1409355967997T056290.jpg'),
(5064, 4518, '8550645159894T056390.jpg'),
(5065, 4519, '4861405830276T056490.jpg'),
(5066, 4520, '765371573830T063190.jpg'),
(5067, 4521, '8370466549370T063290.jpg'),
(5068, 4522, '3068766761458T063390.jpg'),
(5069, 4523, '4481841948722T063490.jpg'),
(5070, 4524, '2025804356367T049190.jpg'),
(5071, 4525, '8189068593095T049290.jpg'),
(5072, 4526, '8367113075081T049390.jpg'),
(5073, 4527, '6539718522502T049490.jpg'),
(5074, 4528, '4202580525559T049590.jpg'),
(5075, 4529, '7865295925046T049690.jpg'),
(5076, 4530, '1505390268090T073190.jpg'),
(5077, 4531, '8668020349033T073290.jpg'),
(5078, 4532, '8275042071542T073390.jpg'),
(5079, 4533, '1417282661106T073490.jpg'),
(508, 1393, '5560474122803UMAX DDRAM 512-667.jpg'),
(5080, 4534, '4233677374508T076190.jpg'),
(5081, 4535, '3715702176513T076290.jpg'),
(5082, 4536, '583455284882T076390.jpg'),
(5083, 4537, '334077368205T076490.jpg'),
(5084, 4538, '4943720972690T082190.jpg'),
(5085, 4539, '809065727587T082290.jpg'),
(5086, 4540, '2273664168838T082390.jpg'),
(5087, 4541, '7169276345065T082490.jpg'),
(5088, 4542, '2629143210543T082590.jpg'),
(5089, 4543, '6806785294259T082690.jpg'),
(5090, 4544, '764249720959S050010.jpg'),
(5091, 4545, '1425819076480S050095.jpg'),
(5092, 4546, '858021753791S050087.jpg'),
(5093, 4547, '8003097519222S051077.jpg'),
(5094, 4548, '9082949237834S050167.jpg'),
(5095, 4549, '1966964331536S051091.jpg'),
(5096, 4550, '6112899744038S051055.jpg'),
(5097, 4551, '396813509024S051099.jpg'),
(5100, 4552, '5208043793644S050100.jpg'),
(5101, 4553, '8345162363770S050097.jpg'),
(5102, 4554, '7037572275982S050098.jpg'),
(5103, 4555, '661624111566S050099.jpg'),
(5104, 4556, '9056120545961S050190.jpg'),
(5105, 4557, '1537706562791S050187.jpg'),
(5106, 4558, '8970147067514S050188.jpg'),
(5107, 4559, '4435196774077S050189.jpg'),
(5108, 4560, '49748809723S015264.jpg'),
(5109, 4561, '5288529669263S015141.jpg'),
(5110, 4562, '5516877760705S015142.jpg'),
(5111, 4563, '5815041182632S015140.jpg'),
(5112, 4564, '466720331551ML-1710D3.jpg'),
(5113, 4565, '3370588619418ML-2250D5.jpg'),
(5114, 4566, '2116960675898ML-1610D2.jpg'),
(5115, 4567, '3466927780034SCX - D4200A.gif'),
(5116, 4568, '602668347456CLP-500D7K.jpg'),
(5117, 4569, '489866277137CLP-500D5C.jpg'),
(5118, 4570, '3351991581176CLP-500D5M.jpg'),
(5119, 4571, '4350137879639CLP-500D5Y.jpg'),
(5120, 4572, '4266298430952CLP-510D7K.jpg'),
(5121, 4573, '3855637799227CLP-510D2C.jpg'),
(5122, 4574, '1104180536969CLP-510D2M.jpg'),
(5123, 4575, '2039218652303CLP-510D2Y.jpg'),
(5137, 4578, '2450793966815LG L1753TR.jpg'),
(5138, 4579, '5204080497090ADE-3400.jpg'),
(514, 1389, '8778383429071UMAX DDRAM 2 1GB - 533.jpg'),
(5140, 3743, '7407685258154DI-524_main.jpg'),
(5141, 4581, '3202909720823DWL-G132.jpg'),
(5143, 4583, '4283066399956DP-301U.jpg'),
(5144, 4582, '8154618269857DP-301P.jpg'),
(5145, 4584, '8208275453602DP-300U.jpg'),
(5150, 4588, '9557632735473GE-M550A-D1.jpg'),
(5151, 4589, '665953271922GE-S550A-D1.jpg'),
(5152, 4590, '7887246636357GE-M800A-D1.jpg'),
(5153, 4591, '224348193896GE-S800A-D1.jpg'),
(5154, 4592, '2440123522903GZ-AX1CA -SDB.jpg'),
(5155, 4593, '1631606634346GZ-M2 BPD  -710.jpg'),
(5156, 4594, '31334612645C4092A.jpg'),
(5157, 4595, '597936648159Q2612A.jpg'),
(5159, 4596, '1052047659496Q5949A.jpg'),
(5160, 4597, '6007109682819Q2624A.jpg'),
(5161, 4598, '55180971645692298A.jpg'),
(5162, 4599, '4214165553479C4096A.jpg'),
(5163, 4600, '4487024789807C7115A.jpg'),
(5164, 4601, '2784627357732Q2613A.jpg'),
(5165, 4602, '3320589870484C4129X.jpg'),
(5166, 4603, '2694385622210C4127A.jpg'),
(5168, 4605, '1926111621462C4837A.jpg'),
(5169, 4606, '9740250236278C4837A.jpg'),
(5170, 4604, '7754932845008C4837A.jpg'),
(5171, 4607, '9628057888224C4844A.jpg'),
(5172, 4608, '81949397436C6615DA.jpg'),
(5173, 4609, '8769542251954C1823D.jpg'),
(5174, 4610, '9306114486970C6625A.jpg'),
(5175, 4611, '4638240679919Plextor 751U.jpg'),
(5179, 4612, '2811151087862BR-202W.jpg'),
(5182, 4615, '7332991947106C8727AA.jpg'),
(5183, 4616, '6136984583886C8728AA.jpg'),
(5184, 4617, '2957793859155HP 94 Black C8765WN.jpg'),
(5185, 4618, '9008865649051HP 95 C8766WN.jpg'),
(5186, 4619, '4745555047411C9351AN.jpg'),
(5187, 4620, '8227177452367HP 22 Tri-color Ink C9352AN.jpg'),
(5188, 4621, '7519572744466HP 92 Black C9362WN.jpg'),
(5189, 4622, '2477927420431HP 93 color C9361WN.jpg'),
(519, 1384, '4971159386828TEAM-PC4200.jpg'),
(5190, 4623, '9473183563300HP 98 Black C9364WN.jpg'),
(5191, 4624, '1591973468802CB314A.jpg'),
(5192, 4625, '5452245171304CB315A.jpg'),
(5193, 4626, '4013255876175C6656AA.jpg'),
(5194, 4627, '2387685783687C6657AA.jpg'),
(5195, 4628, '725707919030751645A.jpg'),
(5197, 4629, '48102491241HP 78 C6578 DA.jpg'),
(5198, 4630, '975701816504hp 29 black inkjet.jpg'),
(5200, 4631, '334315025280MF439.jpg'),
(5201, 4632, '3720275295332VG921M.jpg'),
(5202, 4633, '9976829881351wre54g.jpg'),
(5203, 4634, '1916660622080WRV200.jpg'),
(5204, 4635, '1139240682472WRT150N.jpg'),
(5205, 4636, '4414160746775WRT350N.jpg'),
(5206, 4637, '4036730893759C6658AN.gif'),
(5207, 4638, '1863003438334Q6000A.gif'),
(5208, 4639, '4583059089900Q6001A Cyan.gif'),
(5209, 4640, '4046791616627Q6002A Yellow.gif'),
(5210, 4641, '7837857610908Q6003A Magenta.gif'),
(5211, 4642, '20145861633410N0217.jpg'),
(5212, 4643, '187611287252810N0227.jpg'),
(5213, 4644, '908264437609118C0032.jpg'),
(5214, 4645, '541383145151018C0033.jpg'),
(5215, 4646, '609704645782018L0032.jpg'),
(5216, 4647, '569034902387118L0042.jpg'),
(5217, 4648, '494920867551815M2971.jpg'),
(5218, 4649, '422910425568915M0119.jpg'),
(5219, 4650, '49812200969618C0781.jpg'),
(5221, 4651, '933148164084Acer TravelMate 2484WXMi.jpg'),
(5222, 4652, '49894515633275570.gif'),
(5225, 3699, '6905258484634Vigor2700.jpg'),
(5226, 3700, '9044535518040Vigor2800V.jpg'),
(5227, 3701, '4098009810091Vigor2800VG.jpg'),
(5228, 3702, '4204104831832Vigor2910.jpg'),
(5229, 4655, '7672922663116Vigor2910G.jpg'),
(5230, 3706, '163349857063vigor3300bplus.jpg'),
(5239, 1922, '1724897082415SD268.jpg'),
(5240, 1923, '7077815263791SD339.jpg'),
(5241, 4312, '7720482421769SD528.jpg'),
(5242, 1924, '8050352416132SD308.jpg'),
(5243, 4657, '8144557448210SD202.jpg'),
(5244, 4658, '6517463049449SD208.jpg'),
(5245, 4659, '5216275248496SD880.jpg'),
(5246, 4660, '5412002283494U320 512MB.jpg'),
(525, 1377, '51674959453131056.jpg'),
(5251, 4665, '5970525131042GA-M52S-S3P.jpg'),
(5254, 4668, '2405368237921732n.jpg'),
(5255, 4669, '6801297591431732n.jpg'),
(5257, 4671, '716013027426932B.jpg'),
(5258, 4672, '4167520378834932B.jpg'),
(5262, 4674, '57858357607crt-793mg.gif'),
(5263, 4675, '4781834638666m_796mb.jpg'),
(5265, 4676, '4969330020033GV-NX85T512HP.jpg'),
(5267, 4678, '3134082745812A8300.jpg'),
(5268, 4679, '960366828663212037SR.jpg'),
(5269, 4680, '977774937206318S0090.jpg'),
(5270, 4681, '5176946944695A-55GA.jpg'),
(5271, 3220, '5158044945931A-45GA.jpg'),
(5272, 4682, '3071815474005TA-88.jpg'),
(5273, 4683, '1311492599887TA-883.jpg'),
(5274, 4684, '712232639898TA-885.jpg'),
(5275, 4685, '3299248881438TA-861.jpg'),
(5276, 4686, '5971439715050VENTO 7700.jpg'),
(5278, 4688, '8435404099293AS-TA361.jpg'),
(5279, 4687, '2942245434681AS-TA362.jpg'),
(5283, 4691, '8360100965980JVJ R2.jpg'),
(5284, 4692, '5222982495854JVJ R2.jpg'),
(5285, 4693, '3983378571756JVJ R2.jpg'),
(5286, 4694, '980098199251X340A21G.jpg'),
(5287, 4695, '756018266107mp160.jpg'),
(5288, 4696, '7475061698359ip1880.jpg'),
(5289, 4697, '5759249870348ip4200.jpg'),
(5290, 4698, '5954671844824lbp2900.jpg'),
(5291, 4699, '7200678055758lbp1210.jpg'),
(5292, 4700, '914855887585lbp3200i.jpg'),
(5293, 4701, '3464488789752lbp3300.jpg'),
(5294, 4702, '9542389271521lbp3500.jpg'),
(5295, 4703, '1736177249813ic-mf4122.jpg'),
(5296, 4704, '8845150147010A-2600.jpg'),
(5298, 4706, '6711360717652B-81.jpg'),
(5301, 4709, '3837955246214AOC 172V...jpg'),
(5304, 4712, '19748909246453940.jpg'),
(5305, 4713, '5727848159656K5300 and K5400.jpg'),
(5306, 4714, '29511659442Photosmart C3180.gif'),
(5307, 4715, '6458623024618HP LaserJet 1020 Printer.jpg'),
(5308, 4716, '5079083576585HP LaserJet 1022.jpg'),
(5309, 4717, '43541012761931160.jpg'),
(5310, 4718, '1292285640601P2015.jpg'),
(5311, 4719, '306639054067M1005 MFP.jpg'),
(5314, 4722, '881557764334HP 900.jpg'),
(5315, 4723, '9421965369836HP Deskjet F380 All-in-One.jpg'),
(5316, 4724, '1029182364177HP Color LaserJet 2600n.jpg'),
(5318, 4726, '95143411351182GB ok.jpg'),
(5319, 4727, '3184312682581CAMJ3H1J.jpg'),
(5320, 4728, '925831293240HAIER HV-732TBG.jpg'),
(5321, 4175, '8426257961654GV-NX84G256H.jpg'),
(5324, 4729, '579803052137EPSON Stylus C58.jpg'),
(5325, 4730, '1208141330171EPSON Stylus C79.jpg'),
(5326, 4731, '3262969290183EPSON Stylus C87plus.jpg'),
(5327, 4732, '6990012418550R230_image.jpg'),
(5328, 4733, '8523206745756R350_image.jpg'),
(5329, 4734, '6908002236658R390_image.jpg'),
(5330, 4735, '6310151085309CX6900F_image.jpg'),
(5331, 4736, '563699671868cx2800_image.jpg'),
(5332, 4737, '28404186700161390_image.jpg'),
(5333, 4738, '662721647221EPSON EPL-6200L.jpg'),
(5334, 4739, '5484561466004l5_printers_2500.jpg'),
(5335, 4740, '8581132186578l5_printers_3000.jpg'),
(5336, 4741, '5598583080854EPSON Aculaser C2600N.jpg'),
(5337, 4742, '2896209982300c1100_c1100N_image.jpg'),
(5338, 4743, '757810788774c1100_c1100N_image.jpg'),
(5339, 4744, '6786358989222LQ-300.jpg'),
(534, 1369, '3527292112358DD256 - PC3200.jpg'),
(5341, 4745, '6588497825685LQ2180.gif'),
(5342, 4746, '3484305372524M520F.jpg'),
(5343, 4747, '1352345111183M520F.jpg'),
(5344, 4112, '1145947731051M2N-MX SE.jpg'),
(5349, 4752, '8760700974837N7200GS-128DYs.jpg'),
(535, 1368, '3516621667225TEAM.jpg'),
(5350, 4753, '561510875638N7300LE-128DYs.jpg'),
(5351, 4754, '1896234317043n6600LE-128DV-s.jpg'),
(5352, 4755, '4438550348366N7300GT-128MWs.jpg'),
(5353, 4756, '1915441276329N6600LE-256DY.jpg'),
(5354, 4757, '5741872277857N7200GS-256DZs.jpg'),
(5355, 4758, '172001913074N7300GT-256DYs.jpg'),
(5356, 4759, '6761359565365n7600GS-256DY-s.jpg'),
(5357, 4760, '9375320195190N8500GT-256DYs.jpg'),
(5358, 4761, '9055510823696N8600GT-256MXs.jpg'),
(5361, 4720, '9330199228040HP LaserJet 3050z.jpg'),
(5362, 4763, '942599063466CX5500.jpg'),
(5363, 4764, '6127533584504V100_image.jpg'),
(5365, 4766, '29446843249623050.jpg'),
(5366, 4767, '4613546017805Toshiba U-205.jpg'),
(5368, 4769, '7473842153829Toshiba U-205.jpg'),
(5369, 4770, '9867076424799TECRA A8.jpg'),
(5370, 4771, '5286395540725TECRA A8.jpg'),
(5371, 4772, '8434489416506R270.jpg'),
(5372, 4773, '5366576454600CX5900_.jpg'),
(5373, 4774, '3349247630373RX590_.jpg'),
(5374, 4775, '8551254882159Stylus Photo RX650.jpg'),
(5375, 4776, '815431339335Lexmark Z645.jpg'),
(5376, 4777, '1122167851724Lexmark X1270.jpg'),
(5377, 4778, '7090314975720Lexmark X3470.jpg'),
(5378, 4779, '7850357322837X4270.jpg'),
(5379, 4780, '4828174951568X5470.jpg'),
(5380, 4781, '5650106136061Lexmark Laser E120n.jpg'),
(5381, 4782, '8735396789237Lexmark X342n.jpg'),
(5383, 4784, '9499402432908WPC54GS.jpg'),
(5384, 4785, '9234469988468WMP54GS.jpg'),
(5385, 4786, '7738469836525WPC300N.jpg'),
(5386, 4787, '9326845653750WMP300N.jpg'),
(5387, 4788, '6638801535142PM11 8000.jpg'),
(5388, 4789, '324626368823PM185 6000.jpg'),
(5389, 4790, '3357784045747NBMate 118.jpg'),
(5392, 4791, '1758432822867GZ-FW1CA  AJB.jpg'),
(5393, 4792, '313651063167Gigabyte GZ-FA1CA-ASB.jpg'),
(5394, 4793, '9065571545343GZ-FSCA1-ATB.jpg'),
(5395, 4794, '5223592119340GV-NX86S256H-B.jpg'),
(5396, 4795, '5378466444264TravelDock   900.jpg'),
(5397, 4796, '5599802526605Inspire M2600.jpg'),
(5398, 4797, '6924160483398GigaWorks ProGamer G500.jpg'),
(5399, 4798, '6453135321791Inspire T3030.....jpg'),
(5400, 4799, '3638874736926Inspire M4500.jpg'),
(5401, 4800, '8209799759876Xmod.jpg'),
(5402, 4801, '396264736197HS-390.jpg'),
(5404, 4802, '4779395648384HE-100.jpg'),
(5405, 4803, '527877379359HS-350.jpg'),
(5406, 4804, '9150020717516HS-400.jpg'),
(5407, 4805, '739549037969EP-230.jpg'),
(5408, 4806, '550315854246HQ-140.jpg'),
(5416, 2740, '8773505548508W251U.jpg'),
(5417, 2742, '6709226687892W251U.jpg'),
(5419, 4808, '579674897354PM85-22.jpg'),
(5421, 4809, '2224884865654PM85-22.jpg'),
(5423, 3334, '82320553329299423WSMi.jpg'),
(5424, 2514, '1167898442361Aspire 4920G series.jpg'),
(5425, 4269, '8147606160756Aspire 5920G series.jpg'),
(5426, 4586, '1684959056349TravelMate 6292 series.jpg'),
(5429, 2934, '3798626942413TravelMate 6292 series.jpg'),
(5430, 4810, '1730689646986AH302.jpg'),
(5431, 4811, '5784249294205AH304.jpg'),
(5432, 4812, '9879271274984C340.jpg'),
(5433, 4813, '292310074122JVJ X5.jpg'),
(5434, 4814, '7307382799763JVJ X5.jpg'),
(5436, 4816, '5552852490217JVJ X5.jpg'),
(5437, 4817, '2044706355131JXD 652.jpg'),
(5438, 4818, '511505827318JXD 652.jpg'),
(5439, 4819, '1978854221200JXD 652.jpg'),
(5440, 4820, '4605924385219jxd 661.jpg'),
(5441, 4821, '5910160798717jxd 661.jpg'),
(5442, 4822, '1789834533559Pin PM11-8000.jpg'),
(5443, 4823, '400045123725Pin PM185-6000.jpg'),
(5444, 4824, '4576047080799Pin NBMate-118.jpg'),
(5445, 4825, '3027609189641HP Officejet Pro Color L7380.jpg'),
(5448, 4826, '2968769164810dv.jpg'),
(5449, 4827, '3849540374134dv.jpg'),
(5450, 4828, '3219982551571dv.jpg'),
(5453, 4831, '6215336230967dv.jpg'),
(5454, 4832, '7281773653642dv.jpg'),
(5455, 4833, '7946086761187HP Compaq 6510b.jpg'),
(5457, 4835, '5529682234376HP Compaq 6510b.jpg'),
(5458, 4836, '7163178919973HP Compaq 6710b.jpg'),
(5459, 3049, '3139191815430m_u3.jpg'),
(5460, 1477, '9311602189798m_u3.jpg'),
(5461, 4837, '784578424017AOC 716Sw.jpg'),
(5464, 1902, '4303187844472M339.jpg'),
(5465, 1907, '5106826752466M339 4.1.jpg'),
(5466, 4838, '7397624436507M-500-5 1.jpg'),
(5468, 4840, '5963513121941SD520.jpg'),
(5470, 4841, '2525182417341SD560.jpg'),
(5471, 4461, '4133984639603vg1930wm.jpg'),
(5474, 4843, '8818321555137FX 865G7MF SH.jpg'),
(5477, 4844, '9957318160322FX 945GZ7MC-RS2HV.jpg'),
(5478, 4845, '5015060610670FX 945GZ7MC-RS2HV.jpg'),
(5479, 4846, '2402929347640Core2 Quad.jpg'),
(5480, 4252, '3327601879584INTEL Core2 Duo E6300.jpg'),
(5482, 3922, '3671191031627TravelMate 6292 series.jpg'),
(5483, 4848, '2818467958706TG - 500.jpg'),
(5484, 4849, '714251072024TG - 1000.jpg'),
(5486, 4850, '1338321191760BLAZER 600.jpg'),
(5488, 4851, '881929870619BLAZER 600.jpg'),
(5489, 4852, '4341906326008BLAZER 600.jpg'),
(5490, 4853, '4930611538497C1K.jpg'),
(5491, 4854, '901313387348C1K.jpg'),
(5492, 4855, '3062669336366C1K.jpg'),
(5493, 4856, '3750457361494DDRAM II....gif'),
(5494, 4857, '721836059992corsair.gif'),
(5495, 4858, '3281261566682MFC-665CW.jpg'),
(5498, 4861, '129259052344MFC-240C.jpg'),
(5499, 4862, '5375722692239HL-2040.jpg'),
(5500, 4863, '493524613169HL-2070N.jpg'),
(5501, 4864, '8816492287121MFC-7220.jpg'),
(5502, 4865, '1166374136088LC57BK.bmp'),
(5503, 4866, '1595936865356LC57C.bmp'),
(5504, 4867, '8596375750531LC57M.bmp'),
(5505, 4868, '106271814629LC57y.bmp'),
(5508, 4870, '2638289448182dr-2025 .jpg'),
(5509, 4869, '8350650066598TN- 2025.jpg'),
(5513, 4874, '2677007929719ARES 500CE.jpg'),
(5514, 4875, '5948879380254CC1000LCD.jpg'),
(5515, 4876, '2106595092508CC1500LCD.jpg'),
(5516, 4877, '5736994297295CC2000LCD.jpg'),
(5517, 4871, '6005280416024POWER COM 500.jpg'),
(5518, 4872, '4261115688646POWER COM 600.jpg'),
(5519, 4873, '2537682129269POWER COM IPM 1000AP.jpg'),
(5520, 4878, '4890063788944Riello 550VA.jpg'),
(5521, 4879, '2410855940749Riello 650VA.jpg'),
(5522, 4880, '7186654037556RIELLO 1000VA.jpg'),
(5524, 4881, '2314516878912Hp 1035i.jpg'),
(5528, 4884, '157124223242Dell      XPS M1210.jpg'),
(5537, 4887, '3553510980745C4937A Cy.jpg'),
(5538, 4888, '9887807690358C4937A Cy.jpg'),
(5539, 4885, '131643284628C4937A Cy.jpg'),
(5540, 4886, '7012877713868C4937A Cy.jpg'),
(5541, 4889, '3370893479940HP Officejet 4355.jpg'),
(5542, 4890, '2744994192188ip1300.jpg'),
(5543, 4891, '9061913110531lbp5000.jpg'),
(5544, 2475, '5172983648140TX1012AU.jpg'),
(5548, 3703, '2910843723988Vigor2700e.jpg'),
(5549, 4893, '298248832249024.jpg'),
(5550, 4894, '4599522098383C90.jpg'),
(5552, 4895, '1679471353521GV-RX24P256H.jpg'),
(5553, 4666, '71278853524720.jpg'),
(5554, 4896, '6350698834861Vigor2700Ge.jpg'),
(5555, 4897, '6029365155872EN7200GS HTD 256M.jpg'),
(5556, 4898, '6026926265591EAX1050 TD128 M A.jpg'),
(5558, 4900, '8426257961654Offline_MP650_MP1000.jpg'),
(5560, 4902, '5456513329601va1921wm.jpg'),
(5561, 4901, '7849442738828Digital EHR series. Long backup time.jpg'),
(5565, 4904, '6541242928775PLC-XW 50.jpg'),
(5566, 4905, '3110229193798PLC-XW 50.jpg'),
(5568, 4906, '3502597549023PLC- XU74.jpg'),
(5569, 4907, '1343808894588Sanyo PLC-XU84.jpg'),
(5570, 4908, '6283627255179Sanyo PLC-XU84.jpg'),
(5572, 4909, '5460781586678Sanyo PLC-XU100.jpg'),
(5573, 4910, '4362027869302GeForce 7300GT.jpg'),
(5575, 4912, '9748786651652GeForce 8500GT.jpg'),
(5576, 4913, '9268310589442VX1932wm.jpg'),
(5577, 4914, '7724445718324AL 1916.jpg'),
(5578, 4915, '2077022649831AL 1916.jpg'),
(5581, 4917, '4889758828422M200_1.jpg'),
(5582, 4918, '6525389642557M200_1.jpg'),
(5592, 3266, '2188605274400B1919TU.jpg'),
(5593, 4926, '5599802526605IM- 751.jpg'),
(5594, 4927, '7186958898078IM- 751.jpg'),
(5595, 4928, '6404965740872IMAX 770.jpg'),
(5596, 4929, '9331418772570IMAX 770.jpg'),
(5597, 4930, '4158069379452IMAX 770.jpg'),
(5598, 4931, '298712360958IM-753.jpg'),
(5599, 4932, '6335150410387IM-753.jpg'),
(5600, 4933, '7746091567891IMAX 136.jpg'),
(5601, 4934, '8193031989650IMAX 136.jpg'),
(5602, 4935, '205421912889IMAX 136.jpg'),
(5603, 4936, '211214576238IMAX X610.jpg'),
(5604, 4937, '5897051364524IMAX X610.jpg'),
(5605, 4938, '1098083111876X350.jpg'),
(5606, 4939, '1875503150262X350.jpg'),
(5607, 4940, '3875759243742EN8500GT SILENT HTD 512M.jpg'),
(5609, 4942, '3953196368152.jpg'),
(561, 2713, '3451379355559EMP-765.jpg'),
(5611, 4943, '4633362699357199P.jpg'),
(5613, 4945, '1768188682771GV-NX72G512P2.jpg'),
(5615, 4946, '2621216617435GH-ED821-MF.jpg'),
(5616, 4947, '1496244130451GH-PCU23-VE.jpg'),
(5617, 4948, '7872612894669GH-WIU02.jpg'),
(5618, 4949, '2130984794099FAN COOLER CM-HYPER TX.jpg'),
(5619, 4950, '7007085249298FAN COOLER COOL VIVA PRO.jpg'),
(5620, 4951, '9796346410305cooling-CM-RR-CCB-WLU1-GP.jpg'),
(5621, 4952, '7485427281749FAN CASE.jpg'),
(5622, 4953, '912416997304fanhdd.jpg'),
(5623, 4954, '3238579688592Fan Case  1.jpg'),
(5624, 4955, '103040189928FAN cpu socket 478.jpg'),
(5626, 4957, '154508579946G-Pen 560.jpg'),
(5627, 4958, '1134057841388G-Pen 4500.jpg'),
(5628, 4959, '7713775373191G-Note 7000.jpg'),
(5635, 4965, '4520865490780EAH2600PRO HTDP 256M.jpg'),
(5637, 4967, '2432196829794Ricoh Aficio GX3000.jpg'),
(5638, 4966, '9898173273748Aficio   SP1000SF.jpg'),
(5639, 4968, '374320256014Fan Notebook.jpg'),
(5640, 4969, '5297065984637NPK-B4.jpg'),
(5641, 4970, '7298236662124301 Notebook.jpg'),
(5642, 4971, '8964659464687Cooler Master R9.gif'),
(5643, 4972, '4139167480688EN8600GT HTDP 512M.jpg'),
(5646, 4975, '5836991893942EAH2600XT HTDP 256M.jpg'),
(5647, 4976, '6966232539223GV-NX72G512P1.jpg'),
(5648, 4977, '5686690687838HP Deskjet D1360.jpg'),
(565, 2157, '1833126133915LiDE 25.gif'),
(5656, 3670, '7327199382536white.jpg'),
(5659, 3385, '4396173332019white.jpg'),
(5661, 4842, '3547718417395black.jpg'),
(5662, 4883, '7387258853117black.jpg'),
(5664, 3108, '856625585020HP Compaq dx2300.jpg'),
(5668, 4983, '100448782064ThinkCentre E50.jpg'),
(5671, 4985, '3532779715186MP  650..jpg'),
(6614, 4987, '77_1197879913_3361269_sp2.jpg'),
(5678, 4987, '2679446920000KX-FP   206.jpg'),
(5680, 4990, '7313785086599KX-FLB802.jpg'),
(5681, 4991, '6082412617353KX-FP342.gif'),
(5682, 4992, '1886783317661KX-FL402.jpg'),
(5683, 4993, '29151119810651020e.jpg'),
(5684, 4994, '81460818544832820.jpg'),
(5685, 4996, '8873198283413235s.jpg'),
(5686, 4997, '967988585175817.jpg'),
(5687, 4998, '7618350895362MFC7420.jpg'),
(5689, 5000, '1419111829122FAN  775.jpg'),
(569, 2154, '9289956340230Scaner 2400.jpg'),
(5690, 5001, '6761359565365AOC 550S...jpg'),
(5691, 5002, '2546828266908GOLLA G332.jpg'),
(5692, 5003, '6220519072051GOLLA G333.jpg'),
(5693, 5004, '8745762372627GOLLA G335.jpg'),
(5694, 5005, '557480312748GOLLA G336.jpg'),
(5695, 5006, '2613594884848Samsung C170.jpg'),
(5696, 5007, '7329028550552Samsung C250.jpg'),
(5697, 5008, '2005682913073Samsung C300.jpg'),
(5698, 5009, '5333345575892Samsung X510.jpg'),
(5699, 5010, '2690422225655Samsung X520.jpg'),
(570, 2153, '4347394028835EPSON Perfection V700 Photo.jpg'),
(5700, 5011, '1113631536351Samsung X680.jpg'),
(5701, 5012, '7233299212201Samsung E250.jpg'),
(5702, 5013, '4696775744227Samsung E250Black.jpg'),
(5703, 5014, '20975244068Samsung E570.jpg'),
(5704, 5015, '9773786075509Samsung E690 white.jpg'),
(5705, 5016, '4010207163629Samsung E690 black.jpg'),
(5706, 5017, '8094253838753Samsung E900 Silver.jpg'),
(5707, 5018, '5210482783925Samsung D840.jpg'),
(5709, 5020, '5389441749919Samsung F300.jpg'),
(5710, 5021, '9201848733246Samsung U600.jpg'),
(5711, 5022, '6997329388173Samsung E840.jpg'),
(5712, 5019, '5127862879768Samsung Ultra Edition D900 black.jpg'),
(5713, 5023, '6810748590813Samsung D900 Metalic.jpg'),
(5714, 5024, '4465988762504Samsung E830 Gold.jpg'),
(5715, 5025, '4701348863047Samsung X650.jpg'),
(5716, 5026, '2509938853388Nokia 1110i.jpg'),
(5718, 5027, '3714177770239Nokia 1600   Black.jpg'),
(5719, 5028, '9065266783600Nokia 2310 Blue.jpg'),
(5720, 5029, '8962220474406Nokia 2626.jpg'),
(5721, 5030, '527877379359Nokia 2610 Black.jpg'),
(5722, 5031, '9908843618882Nokia 6030 Black.jpg'),
(5723, 5032, '4515072827431Nokia 3110 classic.jpg'),
(5724, 5033, '94449010586Nokia  6131.jpg'),
(5725, 5034, '1731604230994Nokia 6070.jpg'),
(5726, 5035, '9817992259873Nokia 6080.jpg'),
(5727, 5036, '652173127746Nokia 6085.jpg'),
(5728, 5037, '4963842417205NOKIA 5300 black.jpg'),
(5729, 5038, '169752043899Nokia 5200.jpg'),
(573, 2149, '6547340353868EPSON Perfection 3490 Photo.jpg'),
(5730, 5039, '3728506750184Nokia 6233.jpg'),
(5731, 5040, '2106899954251Nokia 6020.jpg'),
(5732, 5041, '858454853036Nokia 6288.jpg'),
(5733, 5042, '4044657586867Nokia 6300.jpg'),
(5734, 5043, '8289066189743Nokia 7610.jpg'),
(5735, 5044, '413953421558Nokia N70 Music Edition.jpg'),
(5736, 5045, '8074742117724Nokia N72 Black.jpg'),
(5737, 5046, '4322699565501Nokia N73 Music Edition.jpg'),
(5738, 5047, '4999207424452Nokia N72 Pink.jpg'),
(574, 2148, '4396478292541EPSON Perfection 660.jpg'),
(5740, 5049, '1583132291685945gccr.bmp'),
(5742, 5051, '6137289345629LG KE 770.jpg'),
(5743, 5052, '313955824911KE970.jpg'),
(5744, 5053, '7034523563436LG KG320.jpg'),
(5745, 5054, '961501062230KG110.jpg'),
(5746, 5055, '8479915145400KG200.jpg'),
(5747, 5056, '420050846651Motorola C168 blue.jpg'),
(5748, 5057, '817169091826Motorola L6 black.jpg'),
(5749, 5058, '941684479458Motorola L6 pink.jpg'),
(5750, 5059, '9245445294123Motorola L6i.jpg'),
(5751, 5060, '1793492968371Motorola SLVR L7.jpg'),
(5752, 5061, '5110790049020Motorola V3 black.jpg'),
(5753, 5062, '4631838393083Motorola RAZR V3 Miami black.jpg'),
(5754, 5063, '9471964118770Motorola RAZR-V3i Silver.jpg'),
(5755, 5064, '451446315166Motorola RAZR-V3i black.jpg'),
(6617, 5130, '65_1198053025_5941570_sp2.jpg'),
(5757, 5067, '401758670152Motorola KRZR K1 Silver.jpg'),
(5759, 5069, '198714864310Motorola ROKR E6.jpg'),
(5760, 5070, '8030535833360TravelMate6292101G16N 6292 series.jpg'),
(5761, 5071, '2050194057958TravelMate  4310.jpg'),
(5765, 5075, '6383015129562Sony Ericsson J100.jpg'),
(5766, 5076, '289133202959Sony Ericsson K510.jpg'),
(5767, 5074, '625801819057Sony Ericsson K3101.jpg'),
(5769, 5078, '6202836519038Sony Ericsson K550i.jpg'),
(5770, 5079, '5841564813983Sony K750i.jpg'),
(5771, 5080, '8899112291278Sony Ericsson K800i.jpg'),
(5772, 5081, '6580266370833Sony Ericsson W700i.jpg'),
(5773, 5082, '9317394754368Sony Ericsson W810i White.jpg'),
(5774, 5083, '5117497296378Sony Ericsson W810i Black.jpg'),
(5775, 5084, '4862930236549Sony Ericsson W200i.jpg'),
(5776, 5085, '7396100130234Sony Ericsson W610i.jpg'),
(5777, 5086, '4983049276492Sony Ericsson W880i.jpg'),
(5778, 5087, '8280834636112Sony Ericsson P990i.jpg'),
(5779, 5088, '7758896141563Sony Ericsson J110i black.jpg'),
(5780, 5089, '7434513850027Sony Ericsson J120i black.jpg'),
(5781, 5090, '9307638893243Sony Ericsson S500i.jpg'),
(5782, 5091, '6831174895851Sony Ericsson Z610i.jpg'),
(5783, 5092, '937111460638Sony Ericsson K810i.jpg'),
(5784, 5093, '787566158436Samsung E740.jpg'),
(5785, 5094, '706324378915Samsung C260.jpg'),
(5792, 5100, '3850759819885vista IM.jpg'),
(5798, 5106, '318095909512VT-446.jpg'),
(5803, 5111, '1838308974999PML095G.jpg'),
(5804, 5112, '1295029591404PKL5195G.jpg'),
(5805, 5113, '8540584338247PKL4794G.jpg'),
(5806, 5114, '4153191498889pkl4693g.jpg'),
(5810, 5118, '6673251958380KSTS500.jpg'),
(5813, 5121, '4764152184432TA-800.gif'),
(5814, 5122, '7072327560964QR6560.gif'),
(5815, 5123, '7375978685719QR6550.gif'),
(5816, 5124, '6103143882912SC070.jpg'),
(5821, 5127, '6038206432989161.jpg'),
(6616, 5065, '71_1197880540_8828237_sp.jpg'),
(6618, 5131, '66_1198053143_3723781_sp2.jpg'),
(5824, 5131, '2415733821311R8.jpg'),
(5825, 5132, '6268383791226S8.jpg'),
(5826, 5133, '1275822632118R8.jpg'),
(5827, 5134, '2584632164437S8.jpg'),
(5828, 5135, '9005512074761R8.jpg'),
(5829, 5136, '5777542046847M8.jpg'),
(5830, 5137, '5678763994729S8.jpg'),
(5831, 5138, '5228470198681M8.jpg'),
(5832, 5139, '6014121691920Q9.jpg'),
(5833, 5140, '678635898922223.jpg'),
(5835, 5142, '7197324481468DYNAMIC VIII.jpg'),
(5839, 5146, '1637399297696RX24T256HP.jpg'),
(5840, 5147, '3541925852825RX26T256H.jpg'),
(5841, 5148, '3763261935166RX26P512H.jpg'),
(5842, 5149, '2909319317715RX24T256HP.jpg'),
(5843, 5150, '9374710372925RX26T256H.jpg'),
(5844, 5151, '4366600888121RX26P512H.jpg'),
(5845, 5152, '4037645577767DDR.jpg'),
(5846, 5153, '4020572747019USB 2.0 KINGMAX 1GB.jpg'),
(5847, 5154, '2634935873893USB 2.0 KINGMAX 2GB.jpg'),
(5848, 5155, '4655313311888M200_1.jpg'),
(5851, 5158, '355960837059Z1420.jpg'),
(5853, 5160, '6364417991320GeForce 7600GS.jpg'),
(5854, 5161, '61461306227468600GT.jpg'),
(5855, 5162, '4634277283365128M 72000GS.jpg'),
(5856, 5163, '5896441642259256M 7200GS.jpg'),
(5857, 5164, '5376332315725256M HD2400PRO.jpg'),
(5858, 5165, '2239213745599256M HD2400XT.jpg'),
(5859, 5166, '9772871391501256M HD2600PRO.jpg'),
(5860, 5167, '397758598406256M HD2600XT.jpg'),
(5862, 5168, '1139545544215MFC-240C.jpg'),
(5863, 5169, '8419855674819MFC 7220.jpg'),
(5864, 5170, '5639740552671MFC7820.jpg'),
(5865, 5171, '8968317899498GE-9252.jpg'),
(5866, 5172, '4578790832824GE 9350.bmp'),
(5867, 5173, '826443320078GE9351.jpg'),
(5869, 5175, '3630643282074GE 9353.jpg'),
(5872, 5174, '7852491451375GE_9375.jpg'),
(5880, 5183, '6112290021772SAMSUNG J600 NEW.jpg'),
(5881, 5184, '6759530397349KX TS600.jpg'),
(5882, 5185, '1434355391853KX T2375.jpg'),
(5883, 5186, '4785493173477kx-tcd815rut.jpg'),
(5884, 5187, '9715860534687kx tcd826.jpg'),
(5885, 5188, '3935818714324KX TCD530.jpg'),
(5886, 5189, '6723860429580KX TG8100.jpg'),
(5887, 5190, '6666544711023KX TG7100.jpg'),
(5888, 5191, '2497134379717KX TG1100.jpg'),
(5889, 5192, '3998926996230KX TC1221.gif'),
(5890, 5193, '6475390893623KX-TC2100.jpg'),
(5891, 5194, '29285262770011828 DUO.jpg'),
(5893, 5196, '32730300130511121S.jpg'),
(5894, 5197, '1155093968690C22.jpg'),
(5896, 5198, '806626837306SC070.jpg'),
(5897, 5199, '7776273734053AH320.jpg'),
(5908, 5195, '4746469631419Gf.jpg'),
(5909, 5195, '802840174822Gf.jpg'),
(5910, 5206, '5889734493680GE 9650.jpg'),
(5911, 5207, '9200324326972GE 1838.jpg'),
(5912, 5208, '2830053086626Alcatel_9261.jpg'),
(5913, 5209, '55336455309309166.jpg'),
(5917, 5213, '5132740760331KTEL 928.jpg'),
(5918, 5214, '9587205178150KTEL 929.jpg'),
(5919, 5215, '8449428018716SEIKO TP20.jpg'),
(5920, 5216, '7305553532968timetech KL 6600A.jpg'),
(5924, 5220, '5723275140836LCD ASUS VW193T.jpg'),
(5944, 5226, '75998156266180GB SATA.jpg'),
(5954, 5232, '33952831815327300GT256.jpg'),
(5955, 5233, '2426099447017600GS.jpg'),
(5956, 5234, '42483110161968600GT WIND.jpg'),
(5958, 5235, '71547041777519JVJ.jpg'),
(5959, 5236, '792017275332217JVJ.jpg'),
(5962, 4176, '4610802265781GV-RX26T256HP-B.jpg'),
(5963, 5238, '9413428954462HP LaserJet 5200.jpg'),
(5964, 5239, '8840881988712BLAZER 600.jpg'),
(5965, 5240, '1689836936911BLAZER 600.jpg'),
(5966, 1448, '7429026147200PNY SLIM.jpg'),
(5969, 5241, '7129643279521JVJ MINI.jpg'),
(5970, 5242, '1022475116820JVJ MINI.jpg'),
(5971, 5243, '9828052981520JVJ MINI.jpg'),
(5973, 5244, '180422587811500.jpg'),
(5975, 3136, '9620436056858WESTERN.jpg'),
(5976, 5246, '8621070213865TSB03601AP.jpg'),
(5977, 5247, '9860369276220TCM007AP.jpg'),
(5978, 5248, '6810138868548TBT01301AP.jpg'),
(5979, 5249, '1496853852716TBT01302AP.jpg'),
(5981, 5251, '4914453390536VX2835wm.jpg'),
(5982, 5048, '8660398517667D945GNT.jpg'),
(5985, 4290, '526755590657D945GCNL.jpg'),
(5986, 5253, '1412709542286Samsung D900i.jpg'),
(5987, 4577, '2644081912753LG L1760TR.jpg'),
(5988, 5254, '2549267157190L192  WS.jpg'),
(5989, 4662, '9698178080453L  1900R.jpg'),
(5992, 3348, '508158453636Aspire   L320.jpg'),
(5993, 3945, '9189349021317NetScroll 200 Laser.jpg'),
(5994, 5255, '3128826232040SlimStar 600 Laser.jpg'),
(5998, 5257, '8693629495154Lenovo 3000.jpg'),
(5999, 5258, '3426379931702Lenovo 3000.jpg'),
(6000, 5259, '7129643279521Lenovo 3000.jpg'),
(6002, 5261, '7705238957817Lenovo 3000.jpg'),
(6003, 5262, '1458745093445Lenovo 3000.jpg'),
(6004, 5263, '5197373349732LENOVO    Y400.jpg'),
(6006, 5095, '728884713712CARIRYNX.jpg'),
(6008, 1262, '6758310852819GA-945GZM-S2.jpg'),
(6009, 1263, '6569595926921GA-945GCMX-S2.jpg'),
(6010, 1265, '7929623652704GA-945GM-S2.jpg'),
(6011, 1266, '6575693352014GA-945PLM-S2.jpg'),
(6012, 1268, '9394831817441GA-945PL-S3.jpg'),
(6014, 1270, '6449476885758GA-945P-S3.jpg'),
(6016, 1273, '5713519279711GA-946GMX-S2.jpg'),
(6018, 1275, '2571522730243GA-P35-S3L.jpg'),
(6019, 2987, '720738524337GA-P35-DS3L.jpg'),
(6020, 3044, '5922050788381GA-P35-S3.jpg'),
(6021, 3046, '8103399976392GA-P35-DS3.jpg'),
(6022, 3047, '7604326777161GA-P35-DS3R.jpg'),
(6023, 3054, '3028218913127GA-P35-DS3P.jpg'),
(6024, 3095, '7926574940158GA-G31MX-S2.jpg'),
(6026, 3141, '2666032624063GA-P31-DS3L.jpg'),
(6027, 3178, '8972890919539GA-G33M-S2.jpg'),
(6028, 3181, '2980659154474GA-G33M-DS2R.jpg'),
(6029, 3205, '3249859855990GA-G33-DS3R.jpg'),
(6030, 3282, '2492866122641GA-P35C-DS3R.jpg'),
(6031, 3308, '335601774478GA-P35-DS4.jpg'),
(6032, 3847, '3202604959080GA-P35-DQ6.jpg'),
(6033, 3949, '2329760342865GA-N650SLI-DS4.jpg'),
(6034, 3951, '5647362384037GA-N680SLI-DQ6.jpg'),
(6035, 5264, '6159544918683GV-NX86T512H.jpg'),
(6037, 3015, '3419977644866HP Pavilion A5037L.jpg'),
(6039, 1238, '9245750155866P5GC-MX.jpg'),
(6040, 1240, '7849137877085P5L-MX.jpg'),
(6041, 1241, '280420184459P5LD2-X.jpg'),
(6043, 1244, '8415892378264P5PL2.jpg'),
(6044, 1245, '6211677894934P5B-MX.jpg'),
(6045, 1246, '3934599268572P5L-VM 1394.jpg'),
(6046, 1248, '744128376443P5LD2 SE.jpg'),
(6047, 1250, '8331138245569P5L 1394.jpg'),
(6048, 1253, '4547998944396P5B-MX WiFi-AP.jpg'),
(6051, 1255, '4590985683009P5B-VM.jpg'),
(6053, 1258, '7330857818568P5B-VM.jpg'),
(6054, 5265, '9749701235660U339S   1GB.jpg'),
(6058, 5157, '407856095245Acer Aspire 4710.jpg'),
(6059, 5072, '9471659257027Acer Aspire 4710.jpg'),
(6060, 5073, '5030304273402Acer Aspire 4710.jpg'),
(6061, 4982, '806931697828Acer Aspire 4710.jpg'),
(6062, 3329, '5749493910444Acer Aspire 4710.jpg'),
(6065, 5266, '8210714343884ZEN   Stone.jpg'),
(6067, 5268, '4076364059303HQ-1400.jpg'),
(6070, 5267, '5854064525911ZEN    Stone Plus.jpg'),
(6071, 2769, '7747006251899P5B.jpg'),
(6072, 2882, '9889941720117P5B-VM DO.jpg'),
(6073, 2883, '7360125499501P5K SE.jpg'),
(6074, 2921, '1156618274963P5K.jpg'),
(6075, 2932, '6320821430442P5K-VM.jpg'),
(6076, 2933, '1590449162528P5K WS.jpg'),
(6077, 3010, '5885161374861P5K Premium WiFi-AP.jpg'),
(6078, 3232, '498122009696P5K-E WIFI-AP.jpg'),
(6079, 3323, '4026670172112P5B-Plus.jpg'),
(6080, 3332, '9031730944369P5K-V.jpg'),
(6081, 3349, '6572034817202P5B Deluxe.jpg'),
(6082, 4079, '8421684842835Commando.jpg'),
(6084, 4664, '421270391181Striker.jpg'),
(6085, 4892, '5272676383045Striker Extreme.jpg'),
(6087, 4962, '3266322864473P5B-Plus Vista Edition.jpg'),
(6088, 4963, '5287310124733P5W DH Deluxe.jpg'),
(6089, 4964, '2241652735880P5WDG2 WS Professional.jpg'),
(6090, 5269, '2024280050094LCD L1753S.jpg'),
(6091, 3986, '3156874368443PCTV 110i.jpg'),
(6102, 5205, '9450318267982HP Pavilion dv2211tu Notebook PC.jpg'),
(6104, 5271, '9199409742964HP Pavilion A5037L.jpg'),
(6105, 5272, '2509634091645HP Pavilion A5037L.jpg'),
(6106, 5273, '7555852335721Aspire M1610.jpg'),
(6107, 5274, '1130094544833Aspire M1610.jpg'),
(6108, 5219, '1369113080187Aspire M5600.gif'),
(6111, 5275, '5712604695703SD  528 .jpg'),
(6112, 5278, '618606864881237LC7R.jpg'),
(6113, 5279, '2310937260637LC4R.jpg'),
(6114, 5280, '223372614277142LC4R.jpg'),
(6115, 5281, '32565670456942PC5R.jpg'),
(6116, 4117, '2162691266535Msi K9A Platinum.jpg'),
(6117, 5282, '9542389271521ATHLON 64x2.jpg'),
(6118, 5283, '4406843875931KU206.jpg'),
(6119, 5284, '67620418713A-150.jpg'),
(6120, 1891, '4025450627581A-140.jpg'),
(6121, 5285, '9305504764705A8He.jpg'),
(6122, 5286, '9661898489198A8E.jpg'),
(6123, 5287, '1160886433261A8Sc.jpg'),
(6124, 5288, '1209665736444U1F.jpg'),
(6125, 5289, '9449403683974ASUS-LAMBORGHINI VX2S.jpg'),
(6126, 5290, '6193080757913CF 512MB.jpg'),
(6127, 5291, '49595742589081GB DUO M2 Sony.jpg'),
(6128, 5292, '81473013990131.jpg'),
(6130, 5294, '7085132134635F9S.jpg'),
(6131, 5295, '6523560474541W5Fe.jpg'),
(6132, 5296, '120363018450W7S.jpg'),
(6133, 5297, '3864479076344S6Fm.jpg'),
(6135, 5299, '437117398162G2S.jpg'),
(6136, 5300, '3288273575783VW193D.jpg'),
(6137, 5301, '1249603762510EN8500GT HTD 256M.jpg'),
(6138, 5302, '1047169778933Dual Core.jpg'),
(6140, 1283, '9389039352870945GCT M2.jpg'),
(6141, 1284, '7040621088528RC410L 800-M.jpg'),
(6142, 1285, '1773981247341945GZT-M.jpg'),
(6143, 1287, '3266932686738945PL-A.jpg'),
(6144, 2945, '5371454435163945P-A.jpg'),
(6145, 3265, '8299736634876945G-M3.jpg');
INSERT INTO `n_productpic_host` (`productpicid`, `productid`, `productpicname`) VALUES
(6146, 3668, '23109372606965PLT-A.jpg'),
(6147, 4656, '5154386511119G31T-M.jpg'),
(6148, 5203, '864552278128P35T-A.jpg'),
(6149, 5303, '3262664429661G33T-M2.jpg'),
(6150, 1237, '8648203766260P5LD2-X 1333.jpg'),
(6151, 5304, '9569217863394IWC-606.jpg'),
(6152, 5305, '7500670745702IWC-606W.jpg'),
(6153, 5306, '7416526435271IWC-818.jpg'),
(6154, 5307, '510560727936IWC-818W.jpg'),
(6155, 5308, '3919660566363IWC-260R.jpg'),
(6156, 5309, '2875173854998M200_1.jpg'),
(6157, 5310, '3069071523201M200_1.jpg'),
(6158, 5311, '8034194368172VW222U.jpg'),
(6159, 5312, '4720250861811MW221U.jpg'),
(6160, 5313, '3792834477842VX2235wm.jpg'),
(6161, 5314, '172800856445VX2245wm.jpg'),
(6162, 5315, '841077160545VX2255wm.jpg'),
(6163, 5316, '743878208325CMV 221D.jpg'),
(6164, 5317, '1212714448990PRO221TW.gif'),
(6166, 5318, '364466721497210V Wide.jpg'),
(6167, 5319, '4460805921420EAX1300HM512 TD 256M.jpg'),
(6169, 4168, '5953757260816GV-NX86T256H-ZL.jpg'),
(6170, 3836, '6974159232332Compaq.jpg'),
(6171, 3298, '9240262453039Compaq.jpg'),
(6172, 3837, '1722458192134Compaq.jpg'),
(6173, 3838, '1381917653859Compaq.jpg'),
(6174, 3839, '2708409640411Compaq.jpg'),
(6175, 4396, '7080559015816Compaq.jpg'),
(6176, 4397, '3010536458893Compaq.jpg'),
(6178, 5116, '6077229875048Compaq.jpg'),
(6179, 5117, '6787578334973Compaq.jpg'),
(6180, 4305, '8438452713061AH421.jpg'),
(6183, 5321, '8818321555137Dazzle Video Creator Platinum.jpg'),
(6184, 5322, '2280676177939Dazzle DVD Recorder.jpg'),
(6185, 5323, '5412307045237Podcast Factory.jpg'),
(6187, 5324, '176879846257Blitz Formula.jpg'),
(6198, 5328, '4737323592559aau-preview-small.jpg'),
(6202, 5331, '9409770519650black.jpg'),
(6205, 5329, '5829674924320VGN SZ440.jpg'),
(6206, 5330, '3412660774023VGN SZ440.jpg'),
(6207, 5332, '140752671202VGN-FZ190.jpg'),
(6210, 2483, '4105326779714Nx6320.jpg'),
(6211, 4807, '6394295395739HP Pavilion dv9000.jpg'),
(6213, 5218, '4570254417450HP Pavilion dv6000.jpg'),
(6214, 5217, '474317852662HP Pavilion dv6000.jpg'),
(6216, 5245, '9459159545099v6000.jpg'),
(6217, 5159, '690983154674X1290.jpg'),
(6218, 5325, '821650698454Studio 500 PCI version 10.jpg'),
(6220, 4173, '9868295869329GV-NX86T256H.jpg'),
(6223, 2833, '50693899106JVJ M25.jpg'),
(6224, 5336, '896258750564JVJ M25.jpg'),
(6225, 5337, '1811175422604JVJ M4 TOUCH 512M.jpg'),
(6226, 5338, '3006877924082JVJ M4 TOUCH 512M.jpg'),
(6227, 5339, '225445739552JVJ M4 TOUCH 512M.jpg'),
(6228, 5340, '6967756945497EN8400GS HTP 256M.jpg'),
(6229, 5341, '110600974985EAH2400XT HTP 256M.jpg'),
(6230, 5342, '5015060610670PC4200 NCP.jpg'),
(6231, 5343, '9860674137963black.jpg'),
(6232, 3589, '7555242513455Traveler 915BT Laser.jpg'),
(6234, 2770, '2903831714887EMP-S5.jpg'),
(6235, 5344, '2792553950841EMP-1715.jpg'),
(6238, 5276, '3650764726590DELUXE SD680.jpg'),
(6239, 5277, '8657654765642DELUXE SD780.jpg'),
(6240, 5345, '570467793815Motorola RAZR2 V8.jpg'),
(6241, 5346, '6994585537369Motorola W218.jpg'),
(6242, 5347, '5042194163065Nokia N76.jpg'),
(6243, 5348, '9928050578168Nokia E65.jpg'),
(6244, 5349, '3688263762375Sony Ericsson W580i.jpg'),
(6245, 5350, '7351589084127GK-6PB.jpg'),
(6246, 5351, '6552523194952GK-7PB.jpg'),
(6247, 5352, '4502268353759GK-KM5000.jpg'),
(6248, 5353, '100241673935GK-RM02.jpg'),
(6249, 5354, '2751701240767PW201.jpg'),
(6250, 5355, '1240762585393MW201U.jpg'),
(6251, 5356, '2889807695465LS201.jpg'),
(6252, 5357, '7370795844634VW202T.jpg'),
(6253, 5358, '8322297068452VG2021m.jpg'),
(6254, 5359, '1814529095673VA2026w.jpg'),
(6255, 5360, '4079107911327CMV T38D.jpg'),
(6256, 5361, '1573986154046ACER Ferrari.jpg'),
(6257, 5362, '4372698314435Kingmax DDR3.jpg'),
(6258, 5363, '3516011844960DDR3.jpg'),
(6260, 5365, '9073803098974GA-P35T-DS4.jpg'),
(6261, 5366, '6647947672781GA-P35T-DQ6.jpg'),
(6262, 5367, '8479000561392ISOLO 210.jpg'),
(6263, 5368, '2110863250805ATHLON 64x2.jpg'),
(6265, 5364, '690166232175DVD.jpg'),
(6266, 5335, '852198721226DVD.jpg'),
(6267, 5369, '3467232641777P5KPL-VM.jpg'),
(6269, 5371, '8722897077308M2N-VM DVI.jpg'),
(6270, 4151, '978537104650EAH2400PRO HTP 256M.jpg'),
(6273, 2353, '2975476313389T20.bmp'),
(6276, 5372, '493792849341IXUS 75.jpg'),
(6277, 2358, '8295468476579A560.jpg'),
(6278, 5373, '813333984664Nikon Coolpix L10.bmp'),
(6279, 5374, '7567742225384Nikon Coolpix L11.bmp'),
(6280, 5375, '2187690690391Nikon Coolpix L12.jpg'),
(6281, 5376, '8819845861410Nikon Coolpix S50.bmp'),
(6283, 5377, '4345869622562HP vp17.jpg'),
(6284, 4435, '310779014738HP w17e.jpg'),
(6288, 3214, '3389490518182HP Pavilion a6037l.jpg'),
(6289, 5378, '9479890711879Lenovo    3000.jpg'),
(6290, 5379, '9434769843507Lenovo    3000.jpg'),
(6291, 3258, '393429438050dv6000.jpg'),
(6292, 4830, '7182080918737dv6000.jpg'),
(6294, 5237, '7217750886506NOTEBOOK Sata.jpg'),
(6295, 5380, '3157484090708NOTEBOOK Sata.jpg'),
(6302, 5381, '443428219006940.bmp'),
(6304, 5382, '58345528488240.bmp'),
(6305, 5383, '328674926951040.bmp'),
(6308, 5387, '5163532648758Elite 332.bmp'),
(6309, 5388, '1846235568108Elite 333.bmp'),
(6310, 4390, '5405904858402nturion 534  Plus.bmp'),
(6311, 4391, '6879954199034Ammo 533.bmp'),
(6312, 5389, '9960976595133Centurion 532.bmp'),
(6313, 5390, '662172874394COSMOS 1000.bmp'),
(6314, 5391, '3777286053367CM Stacker 831.bmp'),
(6315, 5392, '973811617740CM Stacker 830 Evo.bmp'),
(6316, 5393, '681928497408CM Stacker 832.jpg'),
(6317, 5394, '3219067967563Mystique 631.bmp'),
(6318, 5395, '5167495945313Mystique 632.bmp'),
(6319, 5396, '6561669233812761BF.bmp'),
(6320, 4984, '762139959130720N.bmp'),
(6321, 4941, '7090619737463920NW.bmp'),
(6322, 5386, '8068644691410Samsung 920WM.jpg'),
(6323, 3212, '3106265897243eXtreme Power 550W.bmp'),
(6324, 3213, '3943440445689eXtreme Power 600W.bmp'),
(6325, 4576, '8489975867047eXtreme Power 650W.bmp'),
(6326, 2998, '5563522935350Real Power Pro 550W.bmp'),
(6327, 2995, '9101546374855eXtreme Power 650W.bmp'),
(6328, 2996, '2234945687302eXtreme Power 650W.bmp'),
(6329, 5397, '21468379803173308.jpg'),
(6330, 5398, '94027584105496203.jpg'),
(6332, 5399, '47522622947686099.jpg'),
(6335, 5402, '574010587567G-Shot D613.jpg'),
(6336, 5403, '5835467487669Real Power Pro 550W.bmp'),
(6337, 5404, '2205982866890Real Power Pro 1000W.jpg'),
(6338, 3464, '7985719826731Acer Aspire M1100.jpg'),
(6340, 5405, '1999890348502DG33BU.jpg'),
(6341, 5406, '8550949921637DG33FB.jpg'),
(6342, 5407, '4831223764114VA1703wb.jpg'),
(6343, 4333, '3384002915355GSA-H55N.jpg'),
(6344, 5408, '7950964641749500.jpg'),
(6345, 5409, '2761152240149500.jpg'),
(6347, 2865, '1735872488070Compaq.jpg'),
(6348, 3034, '6458927885140Compaq.jpg'),
(6350, 5204, '1098692834141COMPAQ V3344TU.jpg'),
(6351, 4783, '1925197037454white.jpg'),
(6353, 5410, '3591314978273INMPS100U.jpg'),
(6354, 3858, '5600717110613INPS320U.jpg'),
(6355, 3857, '9335382069124INPS100UC.jpg'),
(6356, 3856, '1197166024516INPS100C.jpg'),
(6357, 5411, '9151545023789KB 380.jpg'),
(6358, 3944, '9166788686521Navigator 365 Laser.jpg'),
(6361, 2872, '751445247287TravelMate 7720.jpg'),
(6363, 2935, '2914807020543Aspire 5920G series.jpg'),
(6364, 5412, '2073059353277Aspire  SA90.gif'),
(6365, 3406, '4771469055276ram800.gif'),
(6366, 4725, '534072461500ram800.gif'),
(6367, 5413, '8508877865811ram800.gif'),
(6368, 1254, '1310882777622P5ND2 SE.jpg'),
(6369, 4080, '6032718730162P5KPL.jpg'),
(6370, 4288, '1128570138560i261 1GB.jpg'),
(6371, 1269, '7427501840927GA-X38-DQ6.jpg'),
(6372, 5414, '3397112349548m5000.gif'),
(6373, 5415, '4926038419677m5100.gif'),
(6374, 5270, '8883868728546R51-A21.jpg'),
(6379, 5416, '8844845285267SD280.jpg'),
(6380, 5417, '157862154236SD580.jpg'),
(6381, 5418, '1316370480450SD980.jpg'),
(6384, 5419, '7993951380362SD280 41.jpg'),
(6385, 1460, '6750384159710ZEN Wav.jpg'),
(6386, 5420, '3476378779416CREATIVE SBS A30.jpg'),
(6387, 5421, '445623282600Inspire T3100.jpg'),
(6388, 5422, '2805968246778Inspire A500.jpg'),
(6389, 5423, '6569595926921Inspire A300.jpg'),
(6390, 5424, '398551261515Inspire T6100.jpg'),
(6391, 5425, '7754323022743X-Fi XtremeGamer Fatal1ty Pro Series.jpg'),
(6394, 5426, '4265383846943blaster live.jpg'),
(6395, 5101, '1275517770375WebCam Vista.jpg'),
(6396, 5427, '5251030533478Live Cam Video IM.jpg'),
(6397, 2977, '8921672626074Aspire 6292 TravelMate.jpg'),
(6398, 4765, '2460549827940SD 8005.jpg'),
(6399, 4369, '5238225959806SD 5001.jpg'),
(6400, 4364, '2663898594304SD 162.jpg'),
(6401, 4363, '97802683654SD 1039.jpg'),
(6402, 1407, '435294310604twinmos.gif'),
(6403, 4278, '28901837177NOTEBOOK Sata.jpg'),
(6404, 3608, '3117850826385Aspire 5920G series.jpg'),
(6405, 3675, '3191629553425Acer 5052 ANWXMi.jpg'),
(6406, 2819, '4486719929285AH221.jpg'),
(6407, 3422, '1219421696348AH421.jpg'),
(6411, 5428, '7730238381673R2H.jpg'),
(6412, 1261, '4416904597578GA-945GCM-S2C.jpg'),
(6415, 5181, '277090811274Pavilion G3000.jpg'),
(6416, 5223, '3409307199733Pavilion G3000.jpg'),
(6417, 3279, '7564083889351Pavilion G3000.jpg'),
(6418, 5222, '6945806234186Pavilion G3000.jpg'),
(6419, 1526, '9764030115605Ipod Shuffle.jpg'),
(6422, 2836, '1856906013241iPod nano.jpg'),
(6427, 4287, '6493073347857D946GZIS.jpg'),
(6428, 1553, '9011304639332WESTERN.jpg'),
(6429, 5430, '809980311595TRANSCEND V35.jpg'),
(6430, 3458, '529499442681TS512MJFV30.jpg'),
(6431, 5115, '6102229298904Presario B1900.jpg'),
(6432, 3649, '6134545593605SBV01K.jpg'),
(6433, 3650, '299017222701SBV02K.jpg'),
(6434, 3651, '3063583920374Dynamic I SVO01K.jpg'),
(6435, 3652, '909026618677Dynamic II SVO02K.jpg'),
(6436, 5431, '1864527844607Dynamic XIII KVO13K.jpg'),
(6437, 5144, '8756432717760Balo Knight.jpg'),
(6438, 5432, '9839028387175Spy Gear SBV04W  I G B O R.jpg'),
(6439, 5433, '490256342094Classic KCO02KB.jpg'),
(6440, 5434, '1493500278427Leo KCO04K.jpg'),
(6441, 3653, '4584583396173Dynamic IV KVO04K.jpg'),
(6442, 3654, '548096579702Dynamic VI KVO06K.jpg'),
(6443, 5435, '3748323332956SD 1100.jpg'),
(6444, 5436, '2591034451272NOTEBOOK Sata.jpg'),
(6445, 3751, '7311346196318Vigor2910VG.jpg'),
(6447, 3441, '12127762459PT-LB50SEA.gif'),
(6448, 5221, '929026121973Compaq.jpg'),
(6449, 3462, '6514109475159Pavilion G3000.jpg'),
(6450, 5437, '8477781016862sa.jpg'),
(6451, 5438, '4088254048966OK.jpg'),
(6452, 2839, '96119611708iPod nano.jpg'),
(6453, 3145, '3977281146663iPod nanovideo.jpg'),
(6454, 3211, '472147027562iPod nanovideo.jpg'),
(6458, 5293, '8798809834108F9E.jpg'),
(6460, 5441, '4563547368871Lexmark X4550.jpg'),
(6461, 1279, '69144724986945GCT M21333 v 10As.jpg'),
(6462, 5442, '730714080507Toshiba U-305.jpg'),
(6463, 5443, '8080839542817Toshiba Tecra M8.jpg'),
(6464, 5444, '9212214316636M200.jpg'),
(6465, 2489, '8459488840363Presario B1900.jpg'),
(6467, 5445, '3913258379527M2A-VM HDMI.jpg'),
(6468, 5429, '9202763317254GA-945GCM-S2L.jpg'),
(6470, 4980, '78900684890black.jpg'),
(6471, 5099, '2365430211855VGN-SZ640 CTO Series.jpg'),
(6476, 5446, '9562205854293DCS-3220.jpg'),
(6477, 5447, '1757518238859DCS-5300G.jpg'),
(6478, 5448, '6220823933794DCS-6620.jpg'),
(6479, 5449, '8483878441954DCS-6620G.jpg'),
(6480, 5450, '1633740762884Power 380W TRANG.jpg'),
(6481, 5451, '9362210660997Power 430W.jpg'),
(6482, 5256, '529499442681G400.jpg'),
(6484, 5452, '3839784414230LENOVO    Y400.jpg'),
(6485, 5453, '5181520063514FAX-2820.jpg'),
(6486, 5454, '4580010377354MFC-7420.jpg'),
(6487, 5455, '2121838656460MFC-7820N.jpg'),
(6488, 5456, '936343016748MFC-8460N.jpg'),
(6491, 5400, '1329175054121DVD - 16X HP 535i.jpg'),
(6492, 5457, '7480244440664Samsung-E210.jpg'),
(6493, 5458, '6409233997949Samsung Z560.jpg'),
(6494, 5459, '3881246846570LG KG270.jpg'),
(6495, 5068, '990975822890Motorola-W2200.jpg'),
(6496, 5460, '8310711940532LG L1953S.jpg'),
(6497, 5461, '4390380867448L1953TR.jpg'),
(6498, 5462, '7146411149747LG L1960TR.jpg'),
(6499, 5463, '658788813420HL-4040CN.jpg'),
(6500, 5464, '1891051574737JVJ  MEIZU.jpg'),
(6501, 5465, '684678529348JVJ  MEIZU.jpg'),
(6502, 5466, '6326309133270JVJ  MEIZU.jpg'),
(6503, 5467, '5228165238159Nokia-1200.jpg'),
(6504, 5468, '2843467382563AH223.jpg'),
(6505, 5469, '9821650694684AH223.jpg'),
(6506, 2478, '3251384262263Compaq.jpg'),
(6507, 5333, '3483085827994VGNCR mau do.jpg'),
(6508, 5334, '871558017686black.jpg'),
(6509, 4721, '1662398522773C4180.jpg'),
(6510, 5470, '28477355408604GB USB 2.0.jpg'),
(6511, 5471, '7995475786635LG L204WT.jpg'),
(6512, 5472, '4769639887259HP DESKJET D4160.jpg'),
(6514, 4293, '2678837296514Compaq.jpg'),
(6515, 4392, '508158453636RC-690.jpg'),
(6516, 1703, '832046781657I-power 470.jpg'),
(6517, 5474, '8592717215719R8-607.jpg'),
(6518, 5475, '764554681481Real Power Pro 750W.jpg'),
(6519, 5476, '5701324429526Real Power Pro 850W.jpg'),
(6520, 5477, '335296813956R8-700.jpg'),
(6521, 5478, '3319675286476R8-700.jpg'),
(6522, 3362, '3510524242132iPod classic.jpg'),
(6523, 5439, '3860515679789iPod nanovideo.jpg'),
(6524, 5440, '2500183092263iPod nanovideo.jpg'),
(6525, 1527, '1580998163146iPod classic.jpg'),
(6526, 5479, '6602521943887SonyEricsson-T250i.jpg'),
(6527, 5480, '2569083739962Sony-Ericsson-W660i.jpg'),
(6528, 5481, '1569413035226Panasonic KX-TCD230.jpg'),
(6529, 5482, '1069425251987Panasonic KX-TCD240.jpg'),
(6530, 5483, '755408543842GV-NX73T256P-RH.jpg'),
(6531, 4081, '295053926146E2-340.jpg'),
(6532, 3244, '6828431045047M8-750.jpg'),
(6533, 2152, '212129160246EPSON Perfection V200 Photo.jpg'),
(6534, 5484, '1683434650076Intel Xeon X3210.jpg'),
(6535, 5485, '917532503116Intel Xeon 3050.jpg'),
(6536, 1272, '2705056066122GA-X38T-DQ6.jpg'),
(6537, 5401, '2260249872901SAMSUNG CDRW.gif'),
(6538, 5486, '2266042437472dv.jpg'),
(6540, 4160, '8572595871204GV-RX155128D-RH.jpg'),
(6541, 5180, '4431538339266DELL Vostro 1400.jpg'),
(6542, 5487, '8279615190361EN7300TC512 TD 128M.jpg'),
(6543, 5488, '2539511396065EN7200GS HTD 128M.jpg'),
(6544, 4136, '2480366410712EN8600GT HTDP 256M.jpg'),
(6546, 5490, '3844357533050EN8500GT SILENT MAGIC HTP 512M.jpg'),
(6547, 5491, '5679983440480dv.jpg'),
(6548, 5492, '9277456628302dv.jpg'),
(6549, 5493, '9031730944369HP Pavilion   dv6000t.jpg'),
(6550, 5298, '9882624849274ASUS Z99H.jpg'),
(6551, 5182, '6290944126023VT407.gif'),
(6552, 5102, '9566169150847VT 127.gif'),
(6553, 5103, '1131313989363VT 417.jpg'),
(6554, 5104, '5241274672353vt 416.gif'),
(6555, 5105, '504500018824VT 426.jpg'),
(6556, 5107, '9880795581257VT 525.gif'),
(6557, 5108, '4915672836287VT 526.gif'),
(6558, 5109, '5271761799037VT 587.gif'),
(6560, 5126, '4870552067915KTeL 117.jpg'),
(6561, 5125, '6091863616735KTeL 113.jpg'),
(6562, 5128, '513951018206KTeL 240.jpg'),
(6563, 5211, '9774090837252KTeL 623.jpg'),
(6564, 5212, '1800809839214KTeL 645.jpg'),
(6565, 5494, '2577620155336M2A-VM.jpg'),
(6566, 5495, '8065595978864LG L177WSB.jpg'),
(6567, 5496, '657843714038HP Compaq 6510b.jpg'),
(6568, 5497, '9685983230267HP Compaq 6510b.jpg'),
(6569, 5498, '7724445718324HP Compaq 6510b.jpg'),
(6570, 4961, '1241982031145P5E.jpg'),
(6571, 4149, '5742786861865EAX1550 SILENT TD 256M.jpg'),
(6572, 5499, '3580644434361a550.jpg'),
(6573, 5500, '3768139815728PowerShot SD1000.jpg'),
(6574, 2356, '1876112872528DSC-W80.jpg'),
(6575, 5501, '5025121432317VGN SZ440.jpg'),
(6576, 5502, '3404734180914VGN SZ440.jpg'),
(6577, 5503, '8635094232067untitled.bmp'),
(6578, 4096, '9474707969573WEBCAM PHILIPS SPC500NC.jpg'),
(6579, 4981, '6716543558736black.jpg'),
(6580, 5504, '7076290857518SD209_2.0.jpg'),
(6582, 5505, '1081924963915SD380 41.jpg'),
(6584, 5507, '2098668499399SD820 Gold.jpg'),
(6585, 5506, '394136838786SD510 21.jpg'),
(6586, 2479, '2359332885541500.jpg'),
(6587, 5508, '6371734862164Compaq.jpg'),
(6588, 5509, '7536035752948Compaq.jpg'),
(6589, 5510, '422794797454Compaq.jpg'),
(6590, 5511, '557632749021Compaq.jpg'),
(6591, 5512, '1241677169401Compaq.jpg'),
(6592, 5513, '363521632115Ipod Shuffle.jpg'),
(6593, 4911, '8512841162366GeForce 7600GS 8X.jpg'),
(6594, 4859, '9512511867101DCP 135C.jpg'),
(6595, 4860, '5158044945931DCP 350C.jpg'),
(6596, 2512, '5682422430762Acer Aspire 4710.jpg'),
(6597, 5514, '6476915299896PS 360A.jpg'),
(6598, 5515, '5651325680591PS 300UP.jpg'),
(6599, 4431, '3076693354567va1716w.jpg'),
(6600, 5516, '4947074546980Samsung SyncMaster 2232BW.jpg'),
(6601, 1401, '190812436706TEAM-PC4200.jpg'),
(6602, 5517, '783761541988TN-3145.jpg'),
(6604, 2871, '26617644657666231.jpg'),
(6605, 5518, '2935233325580DELL Vostro 1400.jpg'),
(6606, 5260, '558766924835G400.jpg'),
(6607, 5519, '8264371627630G400.jpg'),
(6608, 3104, '5797663590141GA-P31-S3G.jpg'),
(6609, 1274, '3966000979265GA-73UM-S2H.jpg'),
(6610, 5520, '5560169361060DQ35MPE.jpg'),
(6611, 5521, '446879438524HS-03U.jpg'),
(67, 1, '629713641374dell150.jpg'),
(693, 1567, '3711129057693HDD, SATA-150, 160GB, 7200rpm,.jpg'),
(74, 6, '4694993648476P780.jpg'),
(75, 7, '5705063615307175Semi-Flat.jpg'),
(76, 8, '4331402142609GX1550.jpg'),
(77, 4, '4671703711711344594.jpg'),
(78, 4, '2655602470734Dell17CRT.jpg'),
(79, 3, '5640662418981340601Seaget.jpg'),
(80, 9, '499369564616521P1110.jpg'),
(81, 10, '7915838743434GP3550.jpg'),
(811, 2528, '6217470359505iMac_g5 ma063sa a.gif'),
(82, 11, '4711392892561GX1550.jpg'),
(822, 2660, '7266530189689AOC 152v.jpg'),
(83, 12, '757407289733DELLPIII933.jpg'),
(85, 15, '9824847158927E-4200.bmp'),
(86, 16, '2633430944075E-4200.bmp'),
(866, 1525, '3468147225785jxd901.jpg'),
(87, 16, '8393670926061GX1550.jpg'),
(874, 1515, '7047023275364M70.jpg'),
(875, 1507, '4508060818330JVJM1.jpg'),
(88, 17, '320357763038GX1550.jpg'),
(89, 17, '3434303572636E-4200.bmp'),
(890, 1497, '3952586683328TS6203.jpg'),
(892, 1504, '7936025939540speaker.jpg'),
(894, 1496, '672721403869T-sonic610.jpg'),
(897, 1500, '7370186122369nw-e507.jpg'),
(90, 18, '8673647954968E-4200.bmp'),
(905, 1480, '474037226326JVJX3.jpg'),
(911, 1469, '9693300199890RCA.jpg'),
(93, 19, '9636504896589GP3550.jpg'),
(94, 20, '5568120539239E-4200.bmp'),
(95, 21, '3307224531484GX1550.jpg'),
(96, 22, '2379586468223GX1550.jpg'),
(97, 23, '1925314075852GX1550.jpg'),
(98, 24, '2689031081456GX1550.jpg'),
(99, 25, '2085424214820GX1550.jpg'),
(995, 1871, '8987829521748XWAVE 5.100.jpg'),
(996, 1872, '799456113848CREATIVE LIVE 5.1.jpg'),
(997, 1873, '7644874526713CREATIVE AUDYGY VALUE.jpg'),
(998, 1874, '4022706875557CREATIVE X-FI.jpg'),
(6612, 3852, '51_1197875660_585370_sp.jpg'),
(6615, 5129, '68_1197880359_5998327_sp1.jpg'),
(6619, 3853, '71_1198053295_9194105_sp1.jpg'),
(6620, 5522, '63_1199415073_9641752_chi.gif'),
(6621, 3711, '59_1199432925_916757_chi.gif'),
(6622, 3712, '72_1199432958_2023211_chi.gif'),
(6623, 5524, '74_1199437201_2955732_bando.jpg'),
(6624, 5524, '78_1199438482_8862108_chi.gif'),
(6625, 4380, '70_1199688674_9425405_chi.gif'),
(6626, 5523, '50_1206678275_263138_motherboard_productimage_ga-8i915me-c_bigtest.jpg'),
(6627, 5523, '88_1206678769_5914107_motherboard_productimage_ga-8i915me-c_bigtest.jpg'),
(6628, 5523, '64_1206678770_4258394_motherboard_productimage_ga-8i915me-c_bigtest.jpg'),
(6629, 5523, '86_1206678770_8827627_motherboard_productimage_ga-8i915me-c_bigtest.jpg'),
(6675, 5662, '60_1210404511_7312279_she2550.jpg'),
(6638, 5625, '50_1209457185_4188821_CS5.jpg'),
(6674, 5661, '74_1210404444_9645109_SBC HS820.jpg'),
(6678, 5665, '76_1210404718_7724835_she3600.jpg'),
(6677, 5664, '92_1210404662_758082_she2850.jpg'),
(6676, 5663, '61_1210404572_4487862_she2650.jpg'),
(6679, 5666, '95_1210405195_206381_she7750.jpg'),
(7496, 6452, '92_1364357232_2206297_SCR013.jpg'),
(7495, 6451, '59_1364357110_6756916_SCRS056.jpg'),
(7494, 6450, '84_1364356562_5273609_SCRS052.jpg'),
(7493, 6449, '88_1364356501_6012669_SCRM 010.jpg'),
(7491, 6447, '75_1364356347_4485421_SCRM060.jpg'),
(7492, 6448, '88_1364356393_502371_SCRM063.jpg'),
(7488, 6444, '65_1364356004_7211582_054 all in one.jpg'),
(7489, 6445, '80_1364356224_2335679_SCRM016.jpg'),
(7490, 6446, '94_1364356281_661351_SCRM053.jpg'),
(6657, 5645, '89_1210393905_7578365_HY-113mv.jpg'),
(6658, 5646, '67_1210394178_6838085_HY-503mv.jpg'),
(6659, 5647, '58_1210394223_6550334_HY-558mv.jpg'),
(6660, 5648, '74_1210394261_3223039_HY-669mv.jpg'),
(7497, 6453, '71_1364357274_116363_SHU012.jpg'),
(6662, 5650, '87_1210394362_1673820_HY-938mv.jpg'),
(6663, 5651, '66_1210394407_4645012_HY-1088mv.jpg'),
(6664, 5652, '63_1210394469_2173342_HY-6068mv.jpg'),
(6665, 5653, '73_1210394576_6138389_HY-6288mv.jpg'),
(6666, 5654, '50_1210394634_7560972_HY-9688.jpg'),
(7502, 6458, '93_1364443804_3764365_Tenda_W150D.jpg'),
(7498, 6454, '96_1364357318_4268463_shu024.jpg'),
(7499, 6455, '81_1364357353_4143965_SHU 017.jpg'),
(7500, 6456, '62_1364357630_5848807_SHU 020.jpg'),
(7501, 6457, '92_1364443692_8789484_W309R.jpg'),
(6680, 5667, '69_1210405256_6724266_shl4100.jpg'),
(6681, 5668, '51_1210405338_2302723_shm3100.JPG'),
(6682, 5669, '91_1210405406_6122521_shm3300.jpg'),
(6683, 5670, '77_1210405453_5328840_shm6100.jpg'),
(6684, 5671, '66_1210405495_7158486_shp1800.jpg'),
(6685, 5672, '92_1210405533_8368689_shs5300.jpg'),
(7514, 6470, '62_1364551006_9738483_DYT-1000.jpg'),
(6689, 5676, '69_1210406736_2332322_1176950852_8.jpg'),
(6691, 5678, '93_1210406964_7538391_1175155189_48.jpg'),
(6692, 5679, '84_1210407695_7385209_1176950979_75.jpg'),
(6693, 5680, '68_1210411262_1704945_1175152634_78.gif'),
(6694, 5681, '50_1210411344_8499291_1175155081_43.jpg'),
(6695, 5682, '62_1210411430_9291141_1175567049_35.jpg'),
(7510, 6466, '52_1364547501_4637993_Y 2202.jpg'),
(6698, 5685, '81_1210411678_9385125_thumb_1176865585.jpg'),
(7512, 6468, '65_1364548561_7363238_Y-155.png'),
(7513, 6469, '61_1364548717_3191304_Y-260.jpg'),
(6701, 5688, '73_1210412006_5029494_1175147815_46.jpg'),
(6702, 5689, '71_1210412056_1646052_1175156465_0.jpg'),
(6703, 5690, '92_1210412305_6526227_1175146901_99.jpg'),
(6704, 5691, '85_1210412367_3781758_1175153210_86.jpg'),
(6705, 5692, '96_1210412440_5064585_1175148576_84.jpg'),
(6707, 5694, '90_1210557833_3984374_00000422.jpg'),
(6708, 5695, '94_1210557921_1940822_00000588.jpg'),
(6709, 5696, '71_1210557972_7745890_00000589.jpg'),
(6710, 5697, '71_1210562421_4722518_00000522.jpg'),
(6711, 5698, '57_1210562632_5886950_00000124.gif'),
(6712, 5699, '59_1210562887_22073_00000520.jpg'),
(6713, 5700, '92_1210563034_3646884_00000519.jpg'),
(6714, 5701, '90_1210563165_4843050_00000515.jpg'),
(6715, 5702, '93_1210563292_3988036_00000526.jpg'),
(6716, 5703, '65_1210564140_6227796_HKSCS2001.jpg'),
(6717, 5704, '55_1210564260_9524576_Nho.jpg'),
(6718, 5705, '88_1210573447_9580113_VGA-TV3820(附面).jpg'),
(6719, 5706, '51_1210573548_3546187_XGA-TV5821(侧面).jpg'),
(6720, 5707, '87_1210573615_3122036_GAME BOX-TV5821G(侧面).jpg'),
(6721, 5708, '74_1210573743_1827918_USB-UTV330+(侧面).jpg'),
(6722, 5709, '95_1210574350_3587991_PCI-PT208(正面).jpg'),
(6723, 5710, '71_1210577778_6180193_SANY06981.jpg'),
(6725, 5712, '59_1210585577_5450898_Fan AT.jpg'),
(6726, 5713, '50_1210585825_8821524_Fan P4 - 478.jpg'),
(7143, 6127, '87_1257504009_3211138_C-PAD+HUB 1.jpg'),
(6728, 5715, '58_1210587745_4520208_Fan HDD  .jpg'),
(7144, 6128, '96_1257504142_7604608_C-PAD+HUP 2.jpg'),
(6730, 5717, '81_1210588190_6809096_Fan Case Mau .jpg'),
(6731, 5718, '75_1210588523_2625871_Hup + Card.JPG'),
(6732, 5719, '74_1210589195_5871082_Muose Sunflow.JPG'),
(6733, 5720, '80_1210589591_5895494_Sony Mini.JPG'),
(6734, 5721, '92_1210589845_7295801_Sony Mini T.JPG'),
(6735, 5722, '88_1210648249_9089135_TV-5830E.jpg'),
(6736, 5723, '84_1210648638_9692101_PT308.jpg'),
(6737, 5709, '77_1210649155_857254_PT208.jpg'),
(6738, 5724, '57_1210650918_1773603_TV-5600.jpg'),
(6739, 5725, '77_1210652132_3200153_PF760.jpg'),
(6740, 5726, '79_1210653053_2889211_vc100.jpg'),
(6741, 5727, '55_1210666893_3657869_cao su.gif'),
(6742, 5728, '72_1210667084_6629366_Mitsumi T.jpg'),
(6743, 5729, '79_1210667325_7521914_NB 02.jpg'),
(6744, 5730, '79_1210667480_4866241_775.jpg'),
(6745, 5731, '96_1210667676_7703169_O Cung 1 quat.jpg'),
(6746, 5732, '58_1210668675_897838_cvc317.jpg'),
(6747, 5733, '75_1210668762_8545673_clv818.jpg'),
(6748, 5734, '84_1210668859_9119650_clv306.jpg'),
(6749, 5735, '56_1210668948_8989963_2005.jpg'),
(6750, 5736, '86_1210669343_240862_1010.jpg'),
(6751, 5737, '62_1210669453_3289865_1001.jpg'),
(7412, 6381, '72_1304820213_1137987_335.jpg'),
(7099, 6084, '89_1221709990_7041921_ux_a07111300ux0012_ux_c.jpg'),
(6757, 5743, '56_1210670985_1932888_K 209.JPG'),
(6759, 5745, '79_1210671249_9061062_K-V10.JPG'),
(6760, 5746, '60_1210672336_346137_All in Trancen.JPG'),
(6761, 5747, '72_1210672615_6718468_King all.JPG'),
(6762, 5748, '65_1210732042_2595967_GO-ON730.jpg'),
(6763, 5749, '87_1210732114_5349285_Go-On737.jpg'),
(6764, 5750, '73_1210732158_9063198_Go-On739.jpg'),
(6765, 5751, '91_1210732222_6740439_Go-On740.jpg'),
(6766, 5752, '80_1210732271_3114712_Go-On757.jpg'),
(6767, 5753, '73_1210732309_1657343_GO-ON760.jpg'),
(6768, 5754, '63_1210732347_6117944_Go-On767.jpg'),
(6769, 5755, '56_1210732408_7450815_Go-On770.jpg'),
(6770, 5756, '72_1210734432_645178_690.jpg'),
(6771, 5757, '71_1210734512_3479055_680.jpg'),
(7503, 6459, '65_1364444124_8570695_N60.PNG'),
(7504, 6460, '70_1364456866_7592402_EFi-82.jpg'),
(6776, 5762, '89_1210735662_8982945_410.jpg'),
(6777, 5763, '59_1210735802_4950461_201.jpg'),
(7505, 6461, '64_1364456894_9311891_IS-R19.jpg'),
(6780, 5766, '93_1210749357_750453_510.jpg'),
(6781, 5767, '93_1210749449_3030798_T350.jpg'),
(6782, 5768, '72_1210749520_2273429_360T.jpg'),
(6783, 5769, '52_1210749603_2044876_320.jpg'),
(6784, 5770, '95_1210749670_4660879_740.jpg'),
(6785, 5771, '83_1210749725_2276786_330.jpg'),
(7506, 6462, '68_1364456924_5765197_ST-80.jpg'),
(6787, 5773, '94_1210751500_5563191_Sunrose den.jpg'),
(6788, 5774, '94_1210751542_9864202_sunrose trang.jpg'),
(6789, 5775, '65_1210752164_6629671_Sunrose ps2.jpg'),
(6790, 5776, '91_1210752727_7911888_Muose nuoc.JPG'),
(6791, 5777, '88_1210753070_2291738_Z-Tek muose.JPG'),
(7390, 6361, '92_1304069547_3423213_S83.jpg'),
(6793, 5779, '58_1210823760_7668688_Loa + Hup 168.JPG'),
(6965, 5951, '50_1213418511_7578060_Untitled-1.jpg'),
(6797, 5783, '91_1210824949_6882636_S108.JPG'),
(6798, 5784, '55_1210825171_3559308_mp3-YD118.JPG'),
(6799, 5785, '64_1210825302_4159832_Al 160.JPG'),
(6800, 5786, '58_1210825460_8142577_Nokia MD-8.JPG'),
(6801, 5787, '88_1210991468_6960448_ipod nano.JPG'),
(6802, 5788, '57_1210991550_1675041_lua.JPG'),
(6803, 5789, '79_1210992134_7656482_sili.JPG'),
(6804, 5790, '62_1210992205_6760578_soi.JPG'),
(6805, 5791, '53_1210992493_4228490_Vo Nhua Nano 3.JPG'),
(6806, 5792, '96_1210992602_8641488_ipod for classic.JPG'),
(6807, 5793, '79_1210992744_5975136_nano new 3.JPG'),
(6808, 5794, '95_1210993000_189293_bluetooth.JPG'),
(6809, 5795, '80_1210993716_6030062_Card rs4.JPG'),
(6810, 5796, '89_1210993968_109955_IDE.jpg'),
(6811, 5797, '69_1210994060_3164451_Vong TinhDien.jpg'),
(6812, 5798, '73_1210994205_5279712_sang bp.jpg'),
(6813, 5799, '71_1210994360_7558226_cap hdd.jpg'),
(6814, 5800, '59_1210994583_4539127_sata.jpg'),
(6815, 5801, '83_1210994674_3162010_cmos.jpg'),
(6816, 5802, '87_1210994809_6109400_xe.jpg'),
(6817, 5803, '93_1210995174_9568517_ng sata.jpg'),
(6818, 5804, '59_1210995507_2097666_dku5.jpg'),
(6819, 5805, '61_1210995651_6777666_u2.jpg'),
(6820, 5806, '70_1210995934_3854382_k7.jpg'),
(6821, 5807, '96_1210996816_2515104_usb lan.jpg'),
(6822, 5808, '55_1210997047_6359008_rj45.jpg'),
(6823, 5809, '77_1210997281_6759968_noi.jpg'),
(7411, 6380, '84_1304818605_4924829_162.jpg'),
(6826, 5812, '94_1211166742_9551429_1001(2.0).JPG'),
(6827, 5813, '85_1211166790_534716_1009(2.0).JPG'),
(6828, 5814, '65_1211166840_9143146_1009+Mic.JPG'),
(7413, 6382, '81_1304820260_3249281_336.jpg'),
(7410, 6379, '93_1304818472_6107264_161.jpg'),
(6953, 5940, '69_1213081301_776085_Untitled-1.jpg'),
(7409, 6378, '53_1304818348_3297799_121.jpg'),
(6834, 5820, '89_1211167154_3715237_v317.JPG'),
(6835, 5821, '92_1211168875_301281_8110.JPG'),
(6836, 5822, '58_1211170984_674167_W54M.jpg'),
(7219, 6203, '90_1258162987_3813798_8139.jpg'),
(7220, 6204, '90_1258163268_674777_D820R ADSL2+Router.jpg'),
(6839, 5825, '67_1211173215_1596924_R502.jpg'),
(6840, 5826, '91_1211173406_9261542_D820B_ok.jpg'),
(6841, 5827, '61_1211181035_4461315_s108_ok.jpg'),
(6842, 5828, '85_1211181179_4041436_s105_ok.jpg'),
(7221, 6205, '53_1258163559_2609698_W268R Wireless-N.jpg'),
(6845, 5831, '74_1211183724_254594_TL-WR641G.jpg'),
(6846, 5832, '69_1211183925_865188_TL-WN620G.jpg'),
(6847, 5833, '65_1211184118_7685471_TL-WN610G.jpg'),
(6848, 5834, '62_1211184415_1180097_TL-WN322G.jpg'),
(6849, 5835, '51_1211184590_9136128_TL-WN510G.jpg'),
(6850, 5836, '55_1211185436_2361311_TL-WN550G.jpg'),
(6851, 5837, '66_1211185544_3983459_TL-WN650G.jpg'),
(7222, 6206, '52_1258164052_399537_W301 Wireless-N.jpg'),
(7223, 6207, '91_1258164402_8662543_W302R Wireless-N.jpg'),
(6855, 5841, '56_1211188161_1038204_TD-8800.jpg'),
(6856, 5842, '73_1211189413_6138389_TD-8820.jpg'),
(6858, 5844, '93_1211251567_9845283_006.jpg'),
(6859, 5845, '50_1211251858_6541179_0707.jpg'),
(6860, 5846, '62_1211253002_8817252_0712.jpg'),
(6861, 5847, '78_1211253419_2968853_2007951585_1.jpg'),
(6862, 5848, '75_1211254608_8295455_disk.jpg'),
(6863, 5849, '68_1211271780_8762021_HDD Player.JPG'),
(6864, 5850, '58_1211272084_4967549_Cap VGA 3  in 1.jpg'),
(6865, 5851, '60_1211272291_4396929_VGA-Key-Mousel auto.jpg'),
(6866, 5852, '82_1211272375_1471204_VGA-Key-Mouse.jpg'),
(6867, 5853, '58_1211272683_2355513_Data USB 2 Cong.jpg'),
(6868, 5854, '62_1211273647_2163882_DI-4804.JPG'),
(6869, 5855, '86_1211274994_1681449_IP-106.JPG'),
(6870, 5856, '54_1211275240_8360756_ip-06-3.JPG'),
(6871, 5857, '70_1211275465_8576188_WN-15.JPG'),
(6872, 5858, '57_1211275637_8489527_Adapter 12v.JPG'),
(6873, 5859, '71_1211341266_2191956_jp008.jpg'),
(6874, 5860, '78_1211341835_303722_clv2003 usb.JPG'),
(6875, 5861, '54_1211342568_4507086_SM 320.JPG'),
(6876, 5862, '56_1211342772_412658_Mitsumi ps2.JPG'),
(6877, 5863, '84_1211510310_6553080_dd.JPG'),
(6878, 5864, '84_1211511551_7349202_1394 Cac Loai.jpg'),
(6879, 5865, '89_1211511612_7927145_Ipod.jpg'),
(6880, 5866, '95_1211511719_1745529_LPT 2m.jpg'),
(6881, 5867, '53_1211512040_8163632_USB Noi Dai 1,2m-3m-5m.jpg'),
(6882, 5868, '78_1211512279_8862108_VGA 3m.jpg'),
(6883, 5869, '78_1211944328_4722213_Cubit.jpg'),
(7349, 6323, '70_1302401223_7592402_UTV-382E.jpg'),
(6885, 5871, '75_1212033342_2053420_4-12mm.jpg'),
(6886, 5872, '87_1212034031_6869515_All in one.JPG'),
(7342, 6316, '61_1302343821_2448277_TV-2830E.jpg'),
(7339, 6313, '67_1302343177_3913275_TV-2830E.jpg'),
(6889, 5875, '67_1212036148_5568074_8332 kingmaster.jpg'),
(6890, 5876, '67_1212037873_5585162_king-m 358.jpg'),
(6892, 5878, '85_1212047218_6535992_K-master 837.jpg'),
(7348, 6322, '61_1302400485_4487862_UTV 332.jpg'),
(6913, 5900, '51_1212810026_6944885_Untitled-1.jpg'),
(7112, 6096, '53_1257495734_9755876_Box 2.5 sata SHE026.jpg'),
(6898, 5884, '70_1212401292_9434864_muose.jpg'),
(6899, 5885, '65_1212401834_503286_m SM 230.jpg'),
(6900, 5886, '59_1212402593_2545008_CLV -K610.jpg'),
(6901, 5887, '63_1212403199_8559405_MINI LOGITECH.jpg'),
(6902, 5888, '83_1212403582_9208752_CLV-K630.jpg'),
(6903, 5889, '89_1212404808_540209_cAMERA WN-15.jpg'),
(6904, 5890, '50_1212461935_8275620_clv-k609.jpg'),
(6905, 5891, '93_1212462621_5722477_sm-S520.jpg'),
(6906, 5892, '96_1212465250_797751_SUNROSE PS2.jpg'),
(6907, 5893, '62_1212473970_258866_toshiba usb.jpg'),
(6908, 5894, '64_1212474114_3757957_sony trong usb.jpg'),
(6909, 5895, '60_1212474607_2939254_dell trong.jpg'),
(6910, 5896, '89_1212475140_1836767_IBM trong.jpg'),
(6911, 5897, '55_1212476758_7530458_IBM Trông.jpg'),
(6912, 5898, '93_1212478013_6465503_ibm DEN.jpg'),
(6914, 5901, '84_1212899550_1893829_Untitled-1.jpg'),
(6915, 5902, '95_1212899722_6539348_Untitled-1.jpg'),
(6916, 5903, '84_1212899818_1946925_Untitled-1.jpg'),
(6917, 5904, '93_1212899999_750453_Untitled-1.jpg'),
(6918, 5905, '83_1212900089_9038176_Untitled-1.jpg'),
(6919, 5906, '88_1212900265_4009091_Untitled-1.jpg'),
(6920, 5907, '65_1212900425_6843883_Untitled-1.jpg'),
(6921, 5908, '79_1212900505_895092_Untitled-1.jpg'),
(6922, 5909, '58_1212900580_8768123_Untitled-1.jpg'),
(6923, 5910, '81_1212900725_3821732_Untitled-1.jpg'),
(6924, 5911, '92_1212900877_1222512_Untitled-1.jpg'),
(6925, 5912, '52_1212901017_3716762_Untitled-1.jpg'),
(6926, 5913, '58_1212901127_8142577_Untitled-1.jpg'),
(6927, 5914, '85_1212901432_856949_Untitled-1.jpg'),
(6928, 5915, '81_1212982123_9474228_Untitled-1.jpg'),
(6929, 5916, '63_1212982201_4821385_Untitled-1.jpg'),
(6930, 5917, '73_1212982379_9563635_Untitled-1.jpg'),
(6931, 5918, '80_1212982474_1423907_Untitled-1.jpg'),
(6932, 5919, '87_1212982596_394350_418.jpg'),
(6933, 5920, '96_1212982804_1146531_Untitled-1.jpg'),
(6934, 5921, '51_1212982878_3760398_Untitled-1.jpg'),
(6935, 5922, '56_1212983002_4088123_Untitled-1.jpg'),
(6936, 5923, '75_1212983226_8555133_Untitled-1.jpg'),
(6937, 5924, '80_1212983324_2246576_Untitled-1.jpg'),
(6938, 5925, '75_1212983408_3162315_Untitled-1.jpg'),
(6939, 5926, '70_1212985463_7190527_HITACHI SATA.jpg'),
(6940, 5927, '87_1213004168_5688606_Untitled-1.jpg'),
(6941, 5928, '51_1213006755_1203288_Untitled-1.jpg'),
(6942, 5929, '76_1213007072_8064155_Untitled-1.jpg'),
(7347, 6321, '78_1302400163_2468416_khung hinh 802.bmp'),
(7346, 6320, '81_1302344843_3150719_UTV 332.jpg'),
(6945, 5932, '59_1213007643_3054904_Untitled-1.jpg'),
(6946, 5933, '91_1213008482_344916_Untitled-1.jpg'),
(7345, 6319, '55_1302344462_795615_TV 3820E.JPEG'),
(6948, 5935, '93_1213009230_3952029_Untitled-1.jpg'),
(6949, 5936, '53_1213073460_4531803_Untitled-1.jpg'),
(7344, 6318, '70_1302344160_2933151_TV-2830E.jpg'),
(7341, 6315, '93_1302343619_3478139_pt228f.jpg'),
(6955, 5942, '71_1213082472_2603290_Untitled-1.jpg'),
(6956, 5943, '94_1213084236_4471385_Untitled-1.jpg'),
(6957, 5944, '52_1213085721_541734_Untitled-1.jpg'),
(6958, 5945, '81_1213086474_6227186_Untitled-1.jpg'),
(6959, 5946, '96_1213087703_1728441_Untitled-1.jpg'),
(6960, 5947, '66_1213151081_9698509_KB so.jpg'),
(6961, 5948, '77_1213151984_5651073_Untitled-1.jpg'),
(6962, 5949, '68_1213154671_5676095_11-21.jpg'),
(6972, 5958, '51_1214292452_2588948_Untitled-1.jpg'),
(6966, 5952, '55_1213419254_7431896_Untitled-1.jpg'),
(6967, 5953, '87_1213419464_4687732_Untitled-1.jpg'),
(6968, 5954, '52_1213419582_4907131_Untitled-1.jpg'),
(6969, 5955, '51_1213838586_3411618_pc to tivi 7001 Dtech.jpg'),
(7392, 6363, '91_1304069789_4924524_S200.jpg'),
(6971, 5957, '76_1214292322_8985386_Untitled-11.jpg'),
(7389, 6360, '50_1304069452_6469165_Cpu_8800.jpg'),
(6974, 5960, '66_1214292609_4717026_Untitled-1.jpg'),
(6975, 5961, '50_1214292694_6004735_Untitled-1.jpg'),
(6976, 5962, '95_1214292782_3381409_Untitled-1.jpg'),
(6977, 5963, '91_1214292839_8922221_Untitled-1.jpg'),
(6978, 5964, '84_1214292952_6901860_Untitled-1.jpg'),
(7398, 6362, '75_1304072066_622293_S 90 --.jpg'),
(6980, 5966, '72_1214293087_2684764_Untitled-1.jpg'),
(7388, 6359, '66_1304069224_3098235_CPU 400_Plus.jpg'),
(6982, 5968, '53_1214293649_5936383_Untitled-1.jpg'),
(6984, 5970, '52_1214715309_9754045_Untitled-1.jpg'),
(6985, 5971, '94_1214715373_4605953_Untitled-1.jpg'),
(6986, 5972, '91_1214715461_5756653_Untitled-1.jpg'),
(6987, 5973, '59_1214715556_9234384_Untitled-1.jpg'),
(6988, 5974, '64_1214715660_9651211_Untitled-1.jpg'),
(6989, 5975, '52_1214715765_3413449_Untitled-1.jpg'),
(6990, 5976, '70_1214877450_5785947_Untitled-1.jpg'),
(6991, 5977, '73_1214877526_9616730_Untitled-1.jpg'),
(6992, 5978, '86_1214877594_3228226_Untitled-1.jpg'),
(6993, 5979, '82_1214877700_7775794_Untitled-1.jpg'),
(6994, 5980, '67_1214882240_9941099_Untitled-2.jpg'),
(6995, 5981, '70_1214882758_5857961_Untitled-1.jpg'),
(6996, 5982, '52_1214882852_5782895_Untitled-1.jpg'),
(6997, 5983, '62_1214883121_6688564_Untitled-1.jpg'),
(6998, 5984, '65_1214883365_9205701_Untitled-1.jpg'),
(6999, 5985, '52_1214883782_998536_Untitled-1.jpg'),
(7000, 5986, '86_1214884051_9193495_Untitled-1.jpg'),
(7001, 5987, '95_1214884284_143826_Untitled-1.jpg'),
(7002, 5988, '67_1214884382_7509097_Untitled-1.jpg'),
(7003, 5989, '60_1214884537_5354167_Untitled-1.jpg'),
(7004, 5990, '90_1214884766_2812925_Untitled-1.jpg'),
(7005, 5991, '91_1214884942_3135157_Untitled-1.jpg'),
(7010, 5996, '73_1214902767_1808999_Untitled-1.jpg'),
(7009, 5995, '74_1214886306_4538516_Untitled-1.jpg'),
(7008, 5994, '50_1214885014_6594274_Untitled-1.jpg'),
(7011, 5997, '54_1214902904_4139387_Untitled-1.jpg'),
(7012, 5998, '52_1214903047_3502551_Untitled-1.jpg'),
(7013, 5999, '89_1214903263_3446099_Untitled-1.jpg'),
(7014, 6000, '91_1214903537_631142_Untitled-1.jpg'),
(7015, 6001, '56_1214903719_3292001_Untitled-1.jpg'),
(7016, 6002, '85_1214903924_2386638_Untitled-1.jpg'),
(7017, 6003, '89_1214904580_7077928_Untitled-1.jpg'),
(7018, 6004, '64_1214904795_135587_small.jpg'),
(7019, 6005, '74_1215417307_1050715_Untitled-1.jpg'),
(7020, 6006, '58_1215417810_6102992_931014035546Link%20USB1_1%20USB2_0.jpg'),
(7021, 6007, '69_1215418303_1035763_7452501164783CS64A.jpg'),
(7022, 6008, '50_1215418983_6979062_1811785144870Power%20EX%20500W.jpg'),
(7023, 6009, '75_1215424451_881970_4095875780332Extreme%20350W.jpg'),
(7024, 6010, '71_1215424573_8246326_8153093863583POWER%20400W.jpg'),
(7025, 6011, '54_1215424655_1796488_6154057215855POWER%20450W.jpg'),
(7026, 6012, '81_1215424772_1370812_6807090156002POWER%20500W_____.jpg'),
(7027, 6013, '53_1215424967_5748719_8153093863583POWER%20350W.jpg'),
(7028, 6014, '77_1215425108_508474_6104973150929POWER%20650W_____.jpg'),
(7029, 5899, '77_1215426032_8638437_2.JPG'),
(7030, 6015, '84_1215426755_2904163_Mouse%1220optical.jpg'),
(7031, 6016, '95_1215427114_5250418_48_port_patch_panel_1.bmp'),
(7032, 6017, '95_1215427222_2272514_24_port_patch_panel_1.bmp'),
(7033, 6018, '58_1215489166_7014763_Untitled-1.jpg'),
(7034, 6019, '85_1215490988_2896534_Untitled-1.jpg'),
(7299, 6283, '80_1279792079_3874827_DSC02630.jpg'),
(7036, 6021, '85_1215491180_570723_Untitled-1.jpg'),
(7300, 6284, '52_1279792427_4558351_DSC02634.jpg'),
(7085, 6070, '96_1215568609_2336899_Untitled-1.jpg'),
(7039, 6024, '90_1215503085_9090966_Untitled-1.jpg'),
(7040, 6025, '61_1215503308_7367205_Untitled-1.jpg'),
(7041, 6026, '63_1215503423_8944192_Untitled-1.jpg'),
(7042, 6027, '62_1215503487_499625_Untitled-1.jpg'),
(7043, 6028, '74_1215503551_3179403_Untitled-1.jpg'),
(7044, 6029, '72_1215503622_3283762_Untitled-1.jpg'),
(7045, 6030, '64_1215503691_3462272_Untitled-1.jpg'),
(7046, 6031, '75_1215503816_7544799_Untitled-1.jpg'),
(7047, 6032, '52_1215503962_4128097_Untitled-2.jpg'),
(7048, 6033, '72_1215504080_940863_Untitled-1.jpg'),
(7049, 6034, '85_1215504184_5847891_Untitled-1.jpg'),
(7050, 6035, '68_1215504285_891735_Untitled-1.jpg'),
(7051, 6036, '58_1215504421_5701117_Untitled-1.jpg'),
(7052, 6037, '82_1215504509_2695749_Untitled-1.jpg'),
(7053, 6038, '96_1215504796_7828279_Untitled-1.jpg'),
(7054, 6039, '56_1215504881_4929711_Untitled-1.jpg'),
(7055, 6040, '56_1215505099_2130011_Untitled-1.jpg'),
(7056, 6041, '58_1215505661_9412588_Untitled-1.jpg'),
(7057, 6042, '66_1215505821_8455045_Untitled-1.jpg'),
(7058, 6043, '84_1215505886_9701560_Untitled-1.jpg'),
(7059, 6044, '57_1215505978_3856824_Untitled-1.jpg'),
(7060, 6045, '71_1215507608_9749468_Untitled-1.jpg'),
(7061, 6046, '50_1215508466_2480927_Untitled-1.jpg'),
(7062, 6047, '57_1215508563_9617340_Untitled-1.jpg'),
(7063, 6048, '84_1215508662_9441882_Untitled-1.jpg'),
(7064, 6049, '55_1215508776_6609226_Untitled-1.jpg'),
(7065, 6050, '77_1215509010_4854951_Untitled-1.jpg'),
(7066, 6051, '71_1215509210_9480331_Untitled-1.jpg'),
(7067, 6052, '79_1215509329_6413019_Untitled-1.jpg'),
(7068, 6053, '77_1215509395_1008911_Untitled-1.jpg'),
(7069, 6054, '93_1215509471_8038828_Untitled-1.jpg'),
(7070, 6055, '82_1215509547_8374792_Untitled-1.jpg'),
(7071, 6056, '82_1215509731_5245231_Untitled-11.jpg'),
(7072, 6057, '53_1215509919_3896798_Untitled-1.jpg'),
(7073, 6058, '78_1215510717_3281626_Untitled-1.jpg'),
(7074, 6059, '66_1215510812_3187337_Untitled-1.jpg'),
(7075, 6060, '87_1215510899_6306523_Untitled-1.jpg'),
(7076, 6061, '81_1215510956_6773089_Untitled-1.jpg'),
(7077, 6062, '91_1215511039_9521220_Untitled-2.jpg'),
(7414, 6282, '95_1304820350_4552858_032.jpg'),
(7079, 6064, '58_1215567713_2552636_Untitled-1.jpg'),
(7080, 6065, '73_1215567790_1881013_Untitled-1.jpg'),
(7081, 6066, '59_1215568041_9734821_Untitled-1.jpg'),
(7082, 6067, '81_1215568152_3562054_Untitled-1.jpg'),
(7083, 6068, '94_1215568275_2977703_Untitled-1.jpg'),
(7084, 6069, '55_1215568325_8863023_Untitled-2.jpg'),
(7086, 6071, '86_1215568655_6824048_Untitled-1.jpg'),
(7087, 6072, '69_1215568741_2332322_Untitled-1.jpg'),
(7088, 6073, '72_1215568943_1388205_Untitled-1.jpg'),
(7089, 6074, '72_1215569035_7057789_Untitled-1.jpg'),
(7090, 6075, '51_1215569172_3161399_Untitled-1.jpg'),
(7091, 6076, '66_1215569312_8214286_Untitled-1.jpg'),
(7092, 6077, '67_1215569453_9368648_Untitled-1.jpg'),
(7093, 6078, '94_1215569623_3210833_Untitled-1.jpg'),
(7094, 6079, '65_1215569762_8919475_Untitled-1.jpg'),
(7095, 6080, '52_1215569879_7750467_Untitled-1.jpg'),
(7142, 6126, '90_1257503849_39772_C-PAD+HUB.jpg'),
(7097, 6082, '96_1215572002_636634_Untitled-1.jpg'),
(7098, 6083, '50_1215572725_9429982_So Mang.jpg'),
(7100, 6085, '63_1221710329_7405043_PCI-to-USB 4 port.jpg'),
(7101, 6086, '68_1221711340_1625302_Cable_AMP_CAT5E.gif'),
(7102, 6087, '94_1221711578_4596494_Card-Convert-PCMCIA-to-LAN.gif'),
(7103, 6088, '80_1221711844_2559349_Printer-Cable-Parellel.jpg'),
(7357, 6330, '62_1302750235_7672350_oa-1007-1.jpg'),
(7358, 6331, '82_1302750368_2955427_oa-1031-3.jpg'),
(7106, 6091, '69_1247916070_5346234_clip_image002.jpg'),
(7110, 6094, '64_1257151938_1540167_den usb.jpg'),
(7145, 6129, '66_1257568981_5799373_152.jpg'),
(7113, 6097, '85_1257496521_1116627_adapter 70W.jpg'),
(7114, 6098, '74_1257496786_2561485_adapter 90W.jpg'),
(7115, 6099, '87_1257497123_5099067_sac xe hoi to laptop.jpg'),
(7116, 6100, '79_1257497725_3872996_DC12v to  AC220v 300W.jpg'),
(7386, 6358, '64_1304068396_9400993_A91 SOCKET 775.jpg'),
(7381, 6354, '77_1303201894_1357691_SU 10.jpg'),
(7382, 6355, '54_1303201958_9130330_su11.jpg'),
(7383, 6356, '58_1303201999_1371727_SU-O5.jpg'),
(7123, 6107, '88_1257500543_8095890_AS-L2.jpg'),
(7384, 6357, '63_1303202049_1090994_USB-X-103.jpg'),
(7380, 6353, '52_1303201810_8322918_SD 908.jpg'),
(7354, 6326, '56_1302594505_4624567_W311U.jpg'),
(7351, 6325, '95_1302593053_3229752_D548R.jpg'),
(7350, 6324, '66_1302592893_8928935_D840R.jpg'),
(7385, 6352, '71_1303202465_2916063_SA-200.png'),
(7132, 6116, '89_1257501778_5521692_YS-188.jpg'),
(7378, 6351, '91_1303201731_1614927_SA_800.jpg'),
(7375, 6348, '90_1303201521_6613499_Loa-SU-02.jpg'),
(7333, 6307, '76_1294038892_8037608_HP 8620 (600 x 450).jpg'),
(7454, 6349, '88_1305528082_6137778_MF-V10.JPG'),
(7373, 6346, '50_1303197551_4833286_CMK-818.png'),
(7374, 6347, '76_1303197980_9245064_D-60.jpg'),
(7146, 6130, '90_1257569153_5343487_156.jpg'),
(7147, 6131, '71_1257569293_322946_HY-159.jpg'),
(7148, 6132, '86_1257569389_8531942_250.jpg'),
(7149, 6133, '93_1257569509_8459622_256.jpg'),
(7150, 6134, '81_1257569640_5252859_HY-257.jpg'),
(7151, 6135, '96_1257569804_7631155_258C.jpg'),
(7162, 6146, '71_1257761486_7387650_256.jpg'),
(7153, 6137, '63_1257570037_8013501_278.jpg'),
(7154, 6138, '62_1257570156_5177794_HY 255.jpg'),
(7508, 6464, '73_1364546577_3571819_Y-115.jpg'),
(7509, 6465, '67_1364547198_6855173_Y-C440.jpg'),
(7157, 6141, '68_1257760554_355291_HY m262.jpg'),
(7158, 6142, '90_1257760970_1211221_HY MS150.jpg'),
(7159, 6143, '65_1257761144_4546450_kg day 257.jpg'),
(7160, 6144, '86_1257761243_9166947_MS258C.jpg'),
(7161, 6145, '87_1257761333_4875396_S156.jpg'),
(7163, 6147, '66_1257762414_6898809_HY-230.jpg'),
(7164, 6148, '73_1257762891_8221610_HY-260.jpg'),
(7165, 6149, '94_1257763059_6037081_HY-310P.jpg'),
(7166, 6150, '89_1257763174_2587423_HY-230.jpg'),
(7167, 6151, '82_1257763269_218281_HY-2008.jpg'),
(7168, 6152, '86_1257816743_5955912_HY-760.jpg'),
(7169, 6153, '88_1257818161_708954_HY-9200.jpg'),
(7170, 6154, '90_1257824108_4494270_HY-9500.jpg'),
(7171, 6155, '83_1257824267_5031019_HY-2009.jpg'),
(7172, 6156, '67_1257824380_9914551_HY-620T.jpg'),
(7173, 6157, '67_1257824657_7660754_HY-9300F.jpg'),
(7174, 6158, '64_1257824848_2389384_HY-202.jpg'),
(7175, 6159, '62_1257825468_1581972_HY-660F.jpg'),
(7176, 6160, '65_1257825597_3553205_HY-203 II.jpg'),
(7177, 6161, '86_1257825678_1681449_HY-9500 II.jpg'),
(7178, 6162, '64_1257826798_9124227_HY-310BT.jpg'),
(7179, 6163, '59_1257827076_675998_HY-220.jpg'),
(7180, 6164, '51_1257827333_9251777_HY-206.jpg'),
(7181, 6165, '73_1257827420_4197365_HY-207.jpg'),
(7182, 6166, '74_1257827536_6354431_HY-610F.jpg'),
(7183, 6167, '69_1257827892_865188_HY-280.jpg'),
(7184, 6168, '78_1257827992_5232110_HY-430.jpg'),
(7185, 6169, '70_1257828095_9283207_HY-210.jpg'),
(7186, 6170, '75_1257828291_5004777_HY-201.jpg'),
(7465, 6171, '59_1305607249_2624650_HY-SP50.JPG'),
(7188, 6172, '87_1257828726_2352462_G5.jpg'),
(7189, 6173, '87_1257828883_9758317_010 day rut.jpg'),
(7190, 6174, '82_1257829006_9967036_301 PS2.jpg'),
(7191, 6175, '59_1257829129_8921611_MOUSE CLV K616.jpg'),
(7192, 6176, '71_1257829339_8085210_mouse CLV K610.jpg'),
(7193, 6177, '92_1257829505_1857517_308 USB.jpg'),
(7417, 6178, '90_1304910991_7955524_630.jpg'),
(7195, 6179, '94_1257932563_1171247_dell DM6000 .jpg'),
(7196, 6180, '85_1257932695_570723_Mouse Dell day rut.jpg'),
(7197, 6181, '60_1257932942_1257908_I 902.jpg'),
(7198, 6182, '54_1257933214_4488167_I 903.jpg'),
(7199, 6183, '75_1257933400_3770773_IBM Mini.jpg'),
(7511, 6467, '71_1364548027_9239572_Y-2141.jpg'),
(7201, 6185, '94_1257934593_2664929_520.jpg'),
(7202, 6186, '65_1257934669_9107139_523.jpg'),
(7203, 6187, '61_1257934779_9729023_M30.jpg'),
(7204, 6188, '52_1257934873_2331101_MM602.jpg'),
(7205, 6189, '94_1257934996_1565494_MM603.jpg'),
(7206, 6190, '78_1257935073_4561097_S210.jpg'),
(7209, 6193, '95_1257935470_7066333_427.jpg'),
(7208, 6192, '95_1257935217_9481246_S260.jpg'),
(7210, 6194, '90_1257935674_2231014_DSC02284.jpg'),
(7211, 6195, '86_1257935853_4158917_DSC02353.jpg'),
(7212, 6196, '90_1257936042_5254385_8200.jpg'),
(7213, 6197, '80_1257936135_3418026_ME-3059 .gif'),
(7214, 6198, '82_1257936241_263748_ME-5016 .gif'),
(7215, 6199, '96_1257936314_306773_ME-5025.gif'),
(7216, 6200, '51_1258077940_8474574_HY-303MV.jpg'),
(7217, 6201, '63_1258078461_9990532_key+mouse kg day HY9100.jpg'),
(7218, 6202, '60_1258082766_4173258_logitech_k300.jpg'),
(7224, 6208, '91_1258165114_3046055_W311R Wireless-N.jpg'),
(7225, 6209, '76_1258165463_1884675_W322U 11N USB.jpg'),
(7226, 6210, '73_1258165767_5378274_W368R Router Wireless-N.jpg'),
(7227, 6211, '68_1258165950_1115406_W541U USB .jpg'),
(7228, 6212, '71_1258184175_1422381_SPC014.jpg'),
(7229, 6213, '65_1258184461_2578879_SPC027.gif'),
(7230, 6214, '86_1258184705_464533_Webcam 006.jpg'),
(7231, 6215, '92_1258258122_9138264_SM220.jpg'),
(7232, 6216, '68_1258338238_6847544_HY-300MV.jpg'),
(7233, 6217, '66_1258338456_3947452_HY-336.jpg'),
(7234, 6218, '67_1266896903_9842537_Box UNITEK 3.5.jpg'),
(7415, 6219, '64_1304820485_8068427_023.jpg'),
(7250, 6234, '76_1269056817_3109220_ND5.jpg'),
(7237, 6221, '51_1268710620_6461537_SSK 024.jpg'),
(7238, 6222, '89_1268711378_6298895_108.jpg'),
(7239, 6223, '82_1268711505_9108359_402.jpg'),
(7240, 6224, '52_1268711583_2814450_418.jpg'),
(7241, 6225, '55_1268711701_9721700_419.jpg'),
(7242, 6226, '50_1268711812_7739176_601.jpg'),
(7243, 6227, '87_1268711874_8425751_605.jpg'),
(7244, 6228, '87_1268711926_6181414_606.jpg'),
(7245, 6229, '74_1268711979_9394890_608.jpg'),
(7246, 6230, '71_1268712026_7226534_609.jpg'),
(7247, 6231, '75_1268712089_8483118_610.jpg'),
(7248, 6232, '90_1268712167_4816503_612.jpg'),
(7249, 6233, '69_1268712274_2592000_SN Mini.jpg'),
(7251, 6235, '90_1269227531_2991129_SSK 026.jpg'),
(7312, 6236, '72_1282702379_6146017_DSC02560.jpg'),
(7313, 6237, '51_1282702485_5602860_DSC02561.jpg'),
(7315, 6238, '59_1282702911_2499541_5318.JPG'),
(7255, 6239, '66_1274190180_6335817_DSC02564.jpg'),
(7318, 6240, '83_1282703521_2813230_108.JPG'),
(7319, 6241, '54_1282703730_9649686_198.JPG'),
(7320, 6242, '60_1282704096_3708829_883.JPG'),
(7321, 6243, '94_1282704268_8764767_TMX-1.JPG'),
(7260, 6244, '91_1274191497_2848932_DSC02581.jpg'),
(7261, 6245, '58_1274191603_5754212_DSC02582.jpg'),
(7262, 6246, '83_1274191752_8475185_DSC02584.jpg'),
(7263, 6247, '79_1274191859_4553468_DSC02585.jpg'),
(7264, 6248, '83_1274191973_1480664_DSC02587.jpg'),
(7265, 6249, '61_1274192069_3092742_DSC02594.jpg'),
(7266, 6250, '80_1274192145_6316288_DSC02597.jpg'),
(7267, 6251, '83_1274192261_6524701_DSC02598.jpg'),
(7268, 6252, '57_1274192406_4053947_DSC02600.jpg'),
(7269, 6253, '95_1274192945_3167197_DSC02602.jpg'),
(7270, 6254, '51_1274193038_7606439_DSC02603.jpg'),
(7271, 6255, '86_1274193173_491080_DSC02605.jpg'),
(7272, 6256, '89_1274193258_3679230_DSC02606.jpg'),
(7273, 6257, '65_1274193355_5511317_DSC02607.jpg'),
(7274, 6258, '59_1274193531_3018897_DSC02609.jpg'),
(7275, 6259, '65_1274193702_5941570_DSC02610.jpg'),
(7276, 6260, '72_1274193829_1888642_DSC02611.jpg'),
(7277, 6261, '71_1274193972_9954220_DSC02613.jpg'),
(7280, 6264, '73_1274194390_4608700_DSC02614.jpg'),
(7279, 6263, '59_1274194217_4887907_DSC02618.jpg'),
(7317, 6265, '69_1282703182_1993001_2318t.JPG'),
(7283, 6267, '88_1274194759_5457306_DSC02621.jpg'),
(7284, 6268, '75_1274194848_7992141_DSC02622.jpg'),
(7285, 6269, '89_1274194951_852982_DSC02624.jpg'),
(7286, 6270, '72_1274195049_8560930_DSC02625.jpg'),
(7287, 6271, '90_1279789639_612223_DSC02635.jpg'),
(7288, 6272, '93_1279789822_2386333_DSC02638.jpg'),
(7289, 6273, '90_1279790060_523121_DSC02644.jpg'),
(7290, 6274, '89_1279790114_780968_DSC02677.jpg'),
(7291, 6275, '76_1279790165_5550680_DSC02678.jpg'),
(7292, 6276, '92_1279790264_3673432_DSC02639.jpg'),
(7293, 6277, '88_1279790436_1298493_DSC02640.jpg'),
(7294, 6278, '87_1279790893_1163924_DSC02643.jpg'),
(7421, 6279, '90_1304911468_7149942_060.jpg'),
(7296, 6280, '94_1279791428_8353432_20.JPG'),
(7297, 6281, '64_1279791626_4544619_DSC02546.jpg'),
(7301, 6285, '70_1279792523_643348_550.JPG'),
(7302, 6286, '88_1279792780_9007662_DSC02393.jpg'),
(7303, 6287, '57_1279793032_6120080_DSC02397.jpg'),
(7304, 6288, '59_1279793284_6694362_DSC02662.jpg'),
(7305, 6289, '76_1279793388_8126710_DSC02663.jpg'),
(7306, 6290, '54_1279793942_3951724_DSC02662.jpg'),
(7307, 6291, '56_1279793999_5430148_DSC02663.jpg'),
(7308, 6292, '76_1279794082_1875216_DSC02670.jpg'),
(7309, 6293, '61_1279794144_9952694_DSC02671.jpg'),
(7310, 6294, '64_1279794198_4222387_DSC02672.jpg'),
(7311, 6295, '66_1279794549_7033377_DSC02685.JPG'),
(7353, 6327, '51_1302594442_9475448_w311U+.jpg'),
(7323, 6297, '91_1288253373_7741312_gutar_YS 05.jpg'),
(7324, 6298, '57_1288253583_7774878_LOA MAU K5.jpg'),
(7325, 6299, '60_1288253751_3959047_MAU-K2.jpg'),
(7326, 6300, '60_1288253864_2501372_MDY6.jpg'),
(7327, 6301, '84_1288253984_4737165_loa Nogo_925.jpg'),
(7355, 6328, '88_1302595108_2604511_W307R.jpg'),
(7329, 6303, '95_1288327180_4302640_xe hoi.jpg'),
(7330, 6304, '79_1290741325_8120912_loa BOAI X18.JPG'),
(7331, 6305, '89_1290743720_2873648_mouse Dell 5601.JPG'),
(7332, 6306, '70_1290743891_3120815_mouse Dell 3300.JPG'),
(7377, 6350, '94_1303201649_7547851_MK 500X.jpg'),
(7441, 6309, '82_1305002607_3965760_i30.png'),
(7336, 6310, '67_1294544877_9914551_Bluetooth-Keyboard-iPad.jpg'),
(7356, 6329, '96_1302748452_4071340_oa-3005m-0.jpg'),
(7359, 6332, '83_1302750490_4826268_OA-3001.jpg'),
(7360, 6333, '87_1302750604_7244842_oa-3005m-4.jpg'),
(7361, 6334, '55_1302750711_9810802_OA-5001.jpg'),
(7362, 6335, '59_1302750857_9359493_OA-5002MV.jpg'),
(7363, 6336, '57_1302750953_6173175_OA-5003.jpg'),
(7364, 6337, '50_1302751058_3786946_OA-6001.jpg'),
(7365, 6338, '90_1302751115_3859265_OA-6002.jpg'),
(7366, 6339, '79_1302751193_2388774_OA-6003.jpg'),
(7367, 6340, '85_1302751293_7028800_OA-6004.jpg'),
(7368, 6341, '62_1302751355_6974790_OA-6005.jpg'),
(7369, 6342, '57_1302751429_1925259_OA-6006.jpg'),
(7370, 6343, '70_1302751761_6134727_OA 9003.png'),
(7507, 6463, '50_1364457016_3356692_ST-80.jpg'),
(7372, 6345, '72_1302752561_8837696_web 331.jpg'),
(7394, 6364, '64_1304071076_2997842_ANPHA 200 Plus.jpg');
INSERT INTO `n_productpic_host` (`productpicid`, `productid`, `productpicname`) VALUES
(7395, 6365, '57_1304071436_2909045_120L.jpg'),
(7396, 6366, '51_1304071737_8053780_deepcool 120L.jpg'),
(7397, 6367, '73_1304071840_1397665_DeepCool_XFan120L_ (2).gif'),
(7399, 6368, '62_1304073839_4220556_X 5.jpg'),
(7400, 6369, '64_1304073903_5376748_X4.jpg'),
(7401, 6370, '86_1304565366_5544578_w322p.jpg'),
(7402, 6371, '57_1304741440_6844188_198.jpg'),
(7403, 6372, '60_1304741822_9789747_120.jpg'),
(7404, 6373, '60_1304742006_3449151_161.jpg'),
(7405, 6374, '75_1304742376_2455295_HY V350.jpg'),
(7406, 6375, '76_1304743589_8412935_HY-D6.JPG'),
(7407, 6376, '69_1304751565_9514507_HY A8.JPG'),
(7408, 6377, '54_1304756475_338813_HY A7.JPG'),
(7416, 6383, '69_1304820782_5418248_031.jpg'),
(7418, 6384, '63_1304911133_7691269_030.jpg'),
(7419, 6385, '68_1304911206_9656704_050.jpg'),
(7420, 6386, '89_1304911279_7157571_680.jpg'),
(7422, 6387, '75_1304912165_5281543_U30 (Tu nhân dr).jpg'),
(7423, 6388, '63_1304913539_8585952_M-A4.jpg'),
(7424, 6389, '89_1304913681_9671046_M-A5.jpg'),
(7425, 6390, '57_1304913782_7604303_M-F20.jpg'),
(7426, 6391, '80_1304914955_8060188_MK-800 PS2.jpg'),
(7427, 6392, '52_1304915015_5272999_KM-900 PS2.jpg'),
(7453, 6393, '63_1305527694_9418081_M10.jpg'),
(7429, 6394, '63_1304993553_9819956_43-in-1_USB_20_Memory_Card.jpg'),
(7430, 6395, '91_1304993736_4414628_539.jpg'),
(7431, 6396, '94_1304994874_3550153_loa_con_heo.jpg'),
(7432, 6397, '94_1305000558_6948852_S301.jpg'),
(7433, 6398, '60_1305000634_5577838_Semic S309.jpg'),
(7434, 6399, '95_1305000851_886853_SN405.jpg'),
(7435, 6400, '69_1305000968_3289560_SN-409.jpg'),
(7436, 6401, '67_1305001372_7946980_SN-110.jpg'),
(7437, 6402, '74_1305001955_7141093_Q-6.JPG'),
(7438, 6403, '87_1305002104_3641392_H-5.jpg'),
(7439, 6404, '52_1305002279_1498973_SN-103.jpg'),
(7442, 6405, '52_1305015971_1248754_CB-28.gif'),
(7443, 6406, '91_1305016107_6185076_CB-38.gif'),
(7444, 6407, '85_1305017196_9549903_KM-HY9300.jpg'),
(7445, 6408, '60_1305517998_4396929_Y-1040CN.jpg'),
(7446, 6409, '68_1305518464_5676095_Y-1062.jpg'),
(7447, 6410, '68_1305518621_4889432_Y-2041.jpg'),
(7448, 6411, '78_1305518882_7825227_Y-120.jpg'),
(7449, 6412, '86_1305519016_4856477_Y-121.jpg'),
(7450, 6413, '58_1305519327_3750633_Y-105.jpg'),
(7451, 6414, '50_1305520064_4734724_Y-108.jpg'),
(7452, 6415, '76_1305527626_3566021_M20.jpg'),
(7455, 6416, '50_1305603117_4833286_HP L.jpg'),
(7456, 6417, '55_1305603307_6072783_DELL.jpg'),
(7457, 6418, '63_1305603790_4248934_ACER.jpg'),
(7458, 6419, '69_1305603929_552415_IBM.jpg'),
(7459, 6420, '74_1305604499_1462050_LITEON.jpg'),
(7460, 6421, '67_1305605568_7114851_HUB USB 2.0.jpg'),
(7464, 6422, '72_1305606015_3158653_HUB USB 10P.jpeg (225 x 225).jpg'),
(7466, 6423, '83_1305689181_4987384_SU-83.jpg'),
(7467, 6424, '57_1305690060_7989090_KM-155S.jpg'),
(7468, 6425, '81_1305690276_9697899_K521.jpg'),
(7469, 6426, '85_1305857739_2073865_K03.jpg'),
(7470, 6427, '95_1305859516_7665331_SU-105 (468 x 600).jpg'),
(7471, 6428, '51_1305860688_5138430_SU-81 (400 x 300).jpg'),
(7472, 6429, '62_1305860791_1930752_SU-82 (500 x 400).jpg'),
(7475, 6430, '52_1305862309_6042573_SU-109 (500 x 360).jpg'),
(7474, 6431, '69_1305861646_7850249_UTS-971.jpg'),
(7476, 6432, '60_1332301554_7062061_tv 2810E.jpg'),
(7477, 6433, '81_1332303848_5315414_042.jpg'),
(7478, 6434, '57_1332303942_9259101_166.jpg'),
(7479, 6435, '60_1332304013_3234939_200 4G.jpg'),
(7480, 6436, '72_1332323430_4356650_android Robot 02.jpg'),
(7481, 6437, '84_1332323569_8494104_I5.jpg'),
(7482, 6438, '70_1332323650_9434864_I8.jpg'),
(7483, 6439, '82_1332323800_2642654_Somic H3.jpg'),
(7484, 6440, '64_1351673744_5725528_tenda_3g186r.jpg'),
(7485, 6441, '83_1351674224_5889696_image001.png'),
(7486, 6442, '56_1351675096_4884245_tenda P200.jpg'),
(7487, 6443, '85_1351675506_4604428_A6-600-02.png');

-- --------------------------------------------------------

--
-- Table structure for table `n_products`
--

CREATE TABLE IF NOT EXISTS `n_products` (
`id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT 'slug',
  `vn_name` varchar(255) DEFAULT '',
  `en_name` text,
  `vn_details` text,
  `en_details` text,
  `vn_nsx` text,
  `en_nsx` text,
  `vn_nhanhieu` longtext,
  `en_nhanhieu` longtext,
  `price` int(11) DEFAULT '0',
  `s_price` int(11) DEFAULT '0',
  `avatar` text,
  `file1` text,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `file4` varchar(255) DEFAULT NULL,
  `file5` varchar(255) DEFAULT NULL,
  `position` tinyint(4) DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `num_product` varchar(255) DEFAULT '',
  `category` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `payment` tinyint(4) DEFAULT NULL,
  `viewed` tinyint(4) DEFAULT NULL,
  `properties` varchar(255) DEFAULT 'N;',
  `home` tinyint(4) DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7971 ;

--
-- Dumping data for table `n_products`
--

INSERT INTO `n_products` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `properties`, `home`) VALUES
(7969, 'dell-alienware-m17x-r5-card-card-roi-4g', 'DELL ALIENWARE M17X R5 CARD CARD RỜI 4G', '', '<ul>\r\n<li class="view">\r\n<p>Intel Core i5-4210U 1.7GHz - 3M</p>\r\n<p>DDRAM 4GB/1600 (2 slot)</p>\r\n<p>HDD 500GB</p>\r\n<p>AMD Radeon R5 M230 2GB GDDR3</p>\r\n<p>15.6" LED - HDMI - Webcam</p>\r\n<p>Bảo h&agrave;nh 1 năm</p>\r\n<p>TẶNG G&Oacute;I SẢN PHẨM KHI MUA LAPTOP</p>\r\n<p>+01 T&uacute;i x&aacute;ch</p>\r\n<p>+01 Chuột quang</p>\r\n</li>\r\n</ul>', '', '', '', '', '', 7000000, 0, '8381_pd-11.jpg', 'a:2:{i:0;s:16:"13827_pic-22.jpg";i:1;s:15:"6528_pic-11.jpg";}', 's:0:"";', '', '', '', 1, '2015-03-08 20:11:02', '-16', 1668, 1, 0, 2, 's:0:"";', 1),
(7970, 'laptop-dell-alienware-m17x-r3-', 'Laptop Dell AlienWare M17x R3 ', '', '<ul class="bbCodeList">\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;">CPU Core <span class="bbCodeBold" style="font-weight: bold;"><span class="bbCodeColor" style="color: #ff0000;"><span style="font-size: large;">i7 Sandy</span> Brigde <span style="font-size: x-large; color: #008000;">2720Qm</span> 8cpu tốc độ 2.2G - Turbo 3.06G</span></span> - cpu i7 thế hệ 2 chạy rất nhanh v&agrave; m&aacute;t</span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;">RAM ddr3 <span class="bbCodeColor" style="color: #ff0000;"><span class="bbCodeBold" style="font-weight: bold;"><span style="font-size: xx-large;">8G</span> bus 1600<br /></span></span></span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;">2 ổ cứng: HDD Sata2 <span class="bbCodeColor" style="color: #ff0000;"><span class="bbCodeBold" style="font-weight: bold;"><span style="font-size: x-large;">750G</span> 7200 v&ograve;ng + c&ograve;n trống 1 khe ổ cứng nh&eacute; <br /></span></span></span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;">m&aacute;y c&oacute; 2 chế độ card m&agrave;n h&igrave;nh:</span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;">Card on: <span class="bbCodeColor" style="color: #0000ff;"><span class="bbCodeBold" style="font-weight: bold;">Intel HD 4000</span></span> - chạy m&aacute;t, ổn định</span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;"><span class="bbCodeBold" style="font-weight: bold;"><span class="bbCodeColor" style="color: #0000ff;">Card rời <span style="font-size: xx-large;">GTX 460M</span> dung lượng gốc 1.5G + share ram<br /></span></span></span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;"><span class="bbCodeBold" style="font-weight: bold;">&nbsp;</span>Chuy&ecirc;n Game, đồ họa đ&uacute;ng good lu&ocirc;n - card rất mạnh<br /></span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;"><span class="bbCodeUnderline" style="text-decoration: underline;"><span class="bbCodeBold" style="font-weight: bold;"><span class="bbCodeUnderline" style="text-decoration: underline;"><span class="bbCodeColor" style="color: #008000;">LCD 17.3 inch LED HD</span></span></span></span> s&aacute;ng đẹp<strong>&nbsp;</strong></span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;"><strong><span style="font-size: xx-large;">Full HD 1920 x 1080</span></strong><br /></span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;">Display port, WC camera, HDMi, 1394, loa nghe nhạc hay</span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;">hệ thống đ&egrave;n LED thay đổi 20 m&agrave;u t&ugrave;y th&iacute;ch rất Pro</span></li>\r\n<li class="bbCodeListItem"><span class="bbCodeSize" style="font-size: medium;">pin s&agrave;i 3h + sạc zin</span></li>\r\n</ul>', '', '', '', '', '', 21500000, 0, '9295_img_12844.JPG', 'a:2:{i:0;s:17:"229_img_12855.JPG";i:1;s:19:"22458_img_12866.JPG";}', 's:0:"";', '', '', '', 2, '2015-03-16 10:59:29', '-14', 1668, 1, 0, 0, 's:0:"";', 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_products_bk`
--

CREATE TABLE IF NOT EXISTS `n_products_bk` (
`id` int(11) NOT NULL,
  `vn_name` varchar(255) DEFAULT NULL,
  `en_name` varchar(255) DEFAULT NULL,
  `vn_nsx` longtext,
  `en_nsx` longtext,
  `vn_details` longtext,
  `en_details` longtext,
  `slug` varchar(255) DEFAULT 'slug',
  `avatar` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `date_published` datetime DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `vn_nhanhieu` longtext,
  `s_price` int(255) DEFAULT NULL,
  `num_product` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `properties` text,
  `home` tinyint(4) DEFAULT NULL,
  `viewed` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `file5` varchar(255) DEFAULT NULL,
  `file4` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file1` text,
  `en_nhanhieu` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_products_copy`
--

CREATE TABLE IF NOT EXISTS `n_products_copy` (
`id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT 'slug',
  `vn_name` varchar(255) DEFAULT '',
  `en_name` text,
  `vn_details` text,
  `en_details` text,
  `vn_nsx` text,
  `en_nsx` text,
  `vn_nhanhieu` longtext,
  `en_nhanhieu` longtext,
  `price` int(11) DEFAULT '0',
  `s_price` int(11) DEFAULT '0',
  `avatar` text,
  `file1` text,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `file4` varchar(255) DEFAULT NULL,
  `file5` varchar(255) DEFAULT NULL,
  `position` tinyint(4) DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `num_product` varchar(255) DEFAULT '',
  `category` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `payment` tinyint(4) DEFAULT NULL,
  `viewed` int(11) DEFAULT '0',
  `home` tinyint(4) DEFAULT '0',
  `properties` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6472 ;

--
-- Dumping data for table `n_products_copy`
--

INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(5625, 'cs5', 'CS5', 'CS5', '', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 44, 1, NULL, 392, 0, '0'),
(6456, 'shu-020', 'SHU 020', 'SHU 020', '&#160;', NULL, '&#160;HUB USB 2.0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1348, 1, NULL, 39, 0, '11'),
(6454, 'shu024', 'shu024', 'shu024', '&#160;', NULL, '&#160;HUB USB 2.0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1348, 1, NULL, 42, 0, '11'),
(6452, 'scr013', 'SCR013', 'SCR013', '&#160;', NULL, '&#160;HUB USB 2.0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1348, 1, NULL, 84, 1, '11'),
(6449, 'scrm-010', 'SCRM 010', 'SCRM 010', '&#160;', NULL, '&#160;card đọc all in one', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 49, 0, '11'),
(6450, 'scrs052', 'SCRS052', 'SCRS052', '&#160;', NULL, '&#160;card đọc thẻ micro', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 54, 0, '11'),
(5645, 'hy113mv', 'HY-113MV', 'HY-113MV', '<p>HY-113MV</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 387, 0, '0'),
(5646, 'hy503mv', 'HY-503MV', 'HY-503MV', '<p>HY-503MV</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 390, 0, '0'),
(5647, 'hy558mv', 'HY-558MV', 'HY-558MV', '<p>HY-558MV</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 387, 0, '0'),
(5648, 'hy669mv', 'HY-669MV', 'HY-669MV', '<p><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">喇叭直径：</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">&nbsp; ф40mm<br />\r\n</span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">灵敏度</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">&nbsp;&nbsp; </span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">：</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">&nbsp; 108dB&plusmn;3dB at 1KHz<br />\r\n</span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">阴抗　</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">&nbsp;&nbsp; </span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">：　</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">32&Omega;&plusmn;15</span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">％</span><span style="font-size: 10pt; color: #000033; font-family: Verdana"><br />\r\n</span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">频率响应：　</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">20Hz-20,000Hz<br />\r\n</span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">额定功率：　</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">20mW<br />\r\n</span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">线材　　：　</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">2.5m&plusmn;0.15m<br />\r\n</span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">咪头</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">&nbsp;&nbsp;&nbsp;&nbsp; </span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">：　</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">6</span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">＊</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">5mm-58dB&plusmn;2dB<br />\r\n</span><span lang="ZH-CN" style="font-size: 10pt; color: #000033; font-family: SimSun; mso-ascii-font-family: Verdana; mso-hansi-font-family: Verdana">插针　　：　立体声</span><span style="font-size: 10pt; color: #000033; font-family: Verdana">ф3.5mm</span><span style="color: #000033"><o:p></o:p></span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 351, 0, '0'),
(5650, 'hy938mv', 'HY-938MV', 'HY-938MV', '<p>HY-938MV</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 401, 0, '0'),
(5651, 'hy1088mv', 'HY-1088MV', 'HY-1088MV', '<p>HY-1088MV</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 397, 0, '0'),
(5652, 'hy6068mv', 'HY-6068MV', 'HY-6068MV', '<p>HY-6068MV</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 398, 0, '0'),
(5653, 'hy6288mv', 'HY-6288MV', 'HY-6288MV', '<p>HY-6288MV</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 343, 0, '0'),
(5654, 'hy9688', 'HY-9688', 'HY-9688', '<p>HY-9688</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 261, 0, '0'),
(5676, 'sm301', 'SM-301', 'SM-301', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product characteristic:</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><o:p><font size="3">Microphone: 9*7/58+2dB</font></o:p></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Impedance: 32ohm(1kHz)</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Sensitivity: 105dB/mW</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Frequency response: 8~22,000Hz</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Cord Length: Approx 2~3M</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><span style="mso-spacerun: yes"><font size="3">&nbsp;</font></span></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product spec :</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">IMPEDANCE:32<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;（</span>1kHz<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">）</span></font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">SENSITIVITY:105dB(at 1kHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">FREQUENCY RESPONSE:20Hz-20KHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">MICROPHONE:9*7/-58&plusmn;2dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">CORD LENGTH:2.5m </font></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 321, 0, '0'),
(5678, 'sm340', 'SM-340', 'SM-340', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product spec :</font><o:p><font size="3">&nbsp;</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Mic Dimensions:&Phi;6.0X5.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity:-42dB&plusmn;3dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Directivity:Omnidirectional</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&le;</span>2.2k<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Driver Diameter:&Phi;40.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :32&Omega;</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency Response:20~20kHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity(S.P.L) :100. 0dB&plusmn;3dB(at 1KHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Input Plug Diameter:&Phi;3.5mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length:2.5meters</font></p>\r\n<p><span style="font-size: 12pt; font-family: Arial; mso-fareast-font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">Net Weight:Appr.182.0g</span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 328, 0, '0'),
(5679, 'sm350', 'SM-350', 'SM-350', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product spec :</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Mic Dimensions<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>&Oslash;6.0X5.0mm</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>-39dB<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&plusmn;</span>3dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Directivity<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>Omnidirectional</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance <span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：&le;</span>2.2k<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Driver Diameter<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>&Oslash;40.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance <span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>32<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency Response <span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>20~20kHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity(S.P.L) <span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>105. 0dB<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&plusmn;</span>3dB(at 1KHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Input Plug Diameter<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>&Oslash;3.5mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>2.5meters</font></p>\r\n<p><span style="font-size: 12pt; font-family: Arial; mso-fareast-font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">Net Weight</span><span lang="ZH-CN" style="font-size: 12pt; font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">：</span><span style="font-size: 12pt; font-family: Arial; mso-fareast-font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">Appr. 180.0g</span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 314, 0, '0'),
(5680, 'sm360', 'SM-360', 'SM-360', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product characteristic:</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Microphone: 6*5/58+2dB</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Impedance: 32ohm(1kHz)</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Sensitivity: 105dB/mW</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Frequency response: 8~22,000Hz</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Cord Length: Approx 2~3M </font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="mso-spacerun: yes"><font size="3">&nbsp;</font></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product spec :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Mic Dimensions:&Phi;6.0X5.0mm</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity:-40dB&plusmn;3dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Directivity:Omnidirectional</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&le;</span>2.2k<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Driver Diameter:&Phi;40.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance:32&Omega;</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency Response :20~20kHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity(S.P.L) :100. 0dB&plusmn;3dB(at 1KHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Input Plug Diameter:&Phi;3.5mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length:2.5meters</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Net Weight:Appr.190.0g </font></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 317, 0, '0'),
(5681, 'sm440', 'SM-440', 'SM-440', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product characteristic:</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Microphone: 6*5/58+2dB</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Impedance: 32ohm(1kHz)</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Sensitivity: 105dB/mW</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Frequency response: 8~22,000Hz</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Cord Length: Approx 2~3M </font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">Product spec :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span></font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">&nbsp;</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length: Approx 2~3M </font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Mic Dimensions:&Phi;6X5mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity:-35dB&plusmn;3dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Directivity:Omnidirectional</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&le;</span>2.2k<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Driver Diameter:&Phi;40.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :32&Omega;</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency Response:20~20kHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity(S.P.L):110.0dB&plusmn;3dB(at 1KHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Input Plug Diameter:&Phi;3.5mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length:2.5meters</font></p>\r\n<p><span style="font-size: 12pt; font-family: Arial; mso-fareast-font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">Net Weight:Appr.130g</span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 312, 0, '0'),
(5682, 'sm750', 'SM-750', 'SM-750', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto"><span style="font-size: 9pt; font-family: SimSun">Product spec :<o:p></o:p></span></p>\r\n<p><span style="font-size: 9pt; font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">Mic Dimensions:<span lang="ZH-CN">&Phi;</span>9.7X6.7mm<br />\r\nSensitivity:-40dB<span lang="ZH-CN">&plusmn;</span>3dB<br />\r\nDirectivity:Omnidirectional<br />\r\nlmpedance :<span lang="ZH-CN">&le;</span>2.2k<span lang="ZH-CN">&Omega;</span><br />\r\nDriver Diameter:<span lang="ZH-CN">&Phi;</span>40.0mm<br />\r\nlmpedance :32<span lang="ZH-CN">&Omega;</span><br />\r\nFrequency Response :20~20kHz<br />\r\nSensitivity(S.P.L):105.0dB<span lang="ZH-CN">&plusmn;</span>3dB(at 1KHz)<br />\r\nInput Plug Diameter:<span lang="ZH-CN">&Phi;</span>3.5mm<br />\r\nCord Length:2.5meters<br />\r\nNet Weight:Appr.235g </span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 323, 0, '0'),
(5685, 'sm908', 'SM-908', 'SM-908', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Mic Dimensions:&Phi;9.7X6.7mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity:-40dB&plusmn;3dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Directivity:Omnidirectional</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&le;</span>2.2k<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Driver Diameter:&Phi;40.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :32&Omega;</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency Response :20~20kHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity(S.P.L) :105.0dB&plusmn;3dB(at 1KHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Input Plug Diameter:&Phi;3.5mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length:2.5meters</font></p>\r\n<p><span style="font-size: 12pt; font-family: Arial; mso-fareast-font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">Net Weight:Appr.295g</span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 307, 0, '0'),
(6458, 'w150d', 'W150D', 'W150D', '&#160;\r\n<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="644" style="width:483.0pt;mso-cellspacing:0cm;mso-padding-alt:0cm 0cm 0cm 0cm">\r\n    <tbody>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;padding:4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">Hãng sản xuất<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;"><a href="http://www.vatgia.com/s/tenda"><span style="color:#0E76BC;text-decoration:none;text-underline:none">TENDA</span></a><o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;padding:4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">Model<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;">W150D Wireless-N Access Point<o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" valign="top" style="border-style: none none solid; border-bottom-color: rgb(204, 204, 204); border-bottom-width: 1pt; padding: 4.5pt 0cm;">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size: 10.5pt; font-family: Arial;">Thông số kỹ thuật<o:p></o:p></span></b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;padding:4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">Số cổng kết nối<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;">• 4 x RJ45 LAN<br />\r\n            • 1 RJ45 WAN<o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;padding:4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">Tốc độ truyền dữ liệu<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;">• 10/100/1000Mbps<o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;padding:4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">Chuẩn giao tiếp<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;">• IEEE 802.11g<br />\r\n            • IEEE 802.11b<br />\r\n            • IEEE 802.11n<o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;padding:4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">MAC Address Table<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;">• -<o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;padding:4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">Giao thức bảo mật<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;">• WPA<br />\r\n            • WEP<br />\r\n            • NAT<br />\r\n            • SSID Broadcast<br />\r\n            • MAC Filtering<br />\r\n            • WPA2<br />\r\n            • PSK<br />\r\n            • 802.1x<br />\r\n            • AES<br />\r\n            • TKIP<o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;background:#F6F6F6;padding:\r\n            4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">Giao thức Routing / Firewall<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="background:#F6F6F6;padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;">• TCP/IP<br />\r\n            • AppleTalk<br />\r\n            • IPX<br />\r\n            • LPR<br />\r\n            • RAW TCP9100<br />\r\n            • SMB over IP<br />\r\n            • CSMA/CA<br />\r\n            • ACK<br />\r\n            • NAT<br />\r\n            • DHCP<br />\r\n            • PPPoE<br />\r\n            • ICMP<br />\r\n            • CSMA/CD<br />\r\n            • PPTP<br />\r\n            • DNS Proxy<br />\r\n            • IPv6<br />\r\n            • L2TP<br />\r\n            • SNMP<br />\r\n            • UPnP<br />\r\n            • PPPoA<br />\r\n            • Syslog<br />\r\n            • SSID<o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;padding:4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">Manegement<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;">• Web - based<br />\r\n            • LAN<br />\r\n            • Web Interface<br />\r\n            • Windows-based Setup Program<br />\r\n            • DDNS<br />\r\n            • UPnP<br />\r\n            • SNMP V2<br />\r\n            • Telnet &amp; CLI<br />\r\n            • HTTP<br />\r\n            • SSH<br />\r\n            • TFTP<br />\r\n            • QoS<o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="280" valign="top" style="width:210.0pt;padding:4.5pt 9.0pt 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><b><span style="font-size:9.0pt;\r\n            font-family:Arial;color:#666666">Nguồn<o:p></o:p></span></b></p>\r\n            </td>\r\n            <td valign="top" style="padding:4.5pt 0cm 4.5pt 0cm">\r\n            <p class="MsoNormal" style="line-height:13.5pt"><span style="font-size: 9pt; font-family: Arial;">• 100-240VAC/50-60Hz<br />\r\n            • 9V DC, 1A<o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', NULL, '&#160;<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-family: Tahoma, Arial;">Router ADSL Wireless</strong>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1324, 1, NULL, 72, 1, '15'),
(5688, 'sm998', 'SM-998', 'SM-998', '<p><span style="font-size: 9pt; font-family: SimSun">Product spec :<span lang="ZH-CN">：</span><o:p></o:p></span></p>\r\n<p><span style="font-size: 9pt; font-family: SimSun">Mic Dimensions:<span lang="ZH-CN">&Phi;</span>6.0X5.0mm<br />\r\nSensitivity:-39dB<span lang="ZH-CN">&plusmn;</span>3dB<br />\r\nDirectivity:Omnidirectional<br />\r\nlmpedance :<span lang="ZH-CN">&le;</span>2.2k<span lang="ZH-CN">&Omega;</span><br />\r\nDriver Diameter:<span lang="ZH-CN">&Phi;</span>30.0mm<br />\r\nlmpedance :32<span lang="ZH-CN">&Omega;</span><br />\r\nFrequency Response :20~20kHz<br />\r\nSensitivity(S.P.L):105. 0dB<span lang="ZH-CN">&plusmn;</span>3dB(at 1KHz)<br />\r\nInput Plug Diameter:<span lang="ZH-CN">&Phi;</span>3.5mm<br />\r\nCord Length:2.5meters<br />\r\nNet Weight:Appr. 89.0g<o:p></o:p></span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 310, 0, '0'),
(5689, 'sm2688', 'SM-2688', 'SM-2688', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product characteristic:</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Microphone: 9*7/58+2dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Impedance: 32ohm(1kHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity: 105dB/mW</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency response: 20~22,000Hz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length: Approx 2~3M </font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="mso-spacerun: yes"><font size="3">&nbsp;</font></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product spec :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Mic Dimensions:&Phi;9.7X6.7mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity:-40dB&plusmn;3dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Directivity:Omnidirectional</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance:<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&le;</span>2.2k<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Driver Diameter:&Phi;40.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :32&Omega;</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency Response :20~20kHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity(S.P.L) :106.0dB&plusmn;3dB(at 1KHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Input Plug Diameter:&Phi;3.5mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length:2.5meters</font></p>\r\n<p><span style="font-size: 12pt; font-family: Arial; mso-fareast-font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">Net Weight:Appr. 215g</span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 297, 0, '0'),
(5690, 'sm9088', 'SM-9088', 'SM-9088', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product spec :</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><o:p><font size="3">&nbsp;</font></o:p></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Mic Dimensions<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：&Phi;</span>6.0X5.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>-40dB<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&plusmn;</span>3dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Directivity<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>Omnidirectional</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：&le;</span>2.2k<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Driver Diameter<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：&Phi;</span>40.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance <span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>32<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency Response <span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>20~20kHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity(S.P.L) <span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>105. 0dB<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&plusmn;</span>3dB(at 1KHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Input Plug Diameter<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：&Phi;</span>3.5mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span>2.5meters</font></p>\r\n<p><span style="font-size: 12pt; font-family: Arial; mso-fareast-font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">Net Weight</span><span lang="ZH-CN" style="font-size: 12pt; font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">：</span><span style="font-size: 12pt; font-family: Arial; mso-fareast-font-family: SimSun; mso-bidi-font-family: ''Times New Roman''; mso-fareast-language: ZH-CN; mso-ansi-language: EN-US; mso-bidi-language: AR-SA">Appr.180.0g</span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 309, 0, '0'),
(5691, 'sm9999', 'SM-9999', 'SM-9999', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product characteristic:</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Microphone: 6*5/58+2dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Impedance: 32ohm(1kHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity: 102dB/mW</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency response: 20~22,000Hz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length: Approx 2~3M </font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="mso-spacerun: yes"><font size="3">&nbsp;</font></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product spec :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Mic Dimensions:&Phi;6.0X5.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity:-40dB&plusmn;3dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Directivity:Omnidirectional</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&le;</span>2.2k<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Driver Diameter:&Phi;30.0mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">lmpedance :32&Omega;</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency Response :20~20kHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity(S.P.L) :110.0dB&plusmn;3dB(at 1KHz)</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Input Plug Diameter:&Phi;3.5mm</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length:2.5meters</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Net Weight:Appr.140g</font></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 318, 0, '0'),
(5692, 'sm-001', 'SM 001', 'SM 001', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product characteristic:</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Sensitivity: 102dB/mW</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Power handling capacty: 500mW</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Frequency response: 5~28,000Hz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Cord Length: Approx 2.5 long</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Plug: Stereo mini-plug(3.5mm diameter),straigh-type,gold plated</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Power requirement: DC 3V</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3"><st1:place w:st="on">Battery</st1:place> life: Approx 30hours</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Weight: Approx 250g(with cord and battery) </font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="mso-spacerun: yes"><font size="3">&nbsp;</font></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">Product spec :<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">：</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">TYPE:DYNAMIC SEALED</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">MICROPHONE:6*5MM</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">IMPEDANCE:<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&le;</span>22k<span lang="ZH-CN" style="font-family: SimSun; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial">&Omega;</span></font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">SENSITIVITY:-58dB&plusmn;2dB</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">FREQUENCY RESPONSE:120Hz-16KHz</font></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><font size="3">SIGNAL CORD LENGTH:2.5m </font></p>', NULL, '<p>Microphone</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 350, 0, '0'),
(6406, 'cb38', 'CB-38', 'CB-38', 'Bàn phím PC cổng USB 2.0<br />', NULL, 'Bàn phím USB', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 12, 1, NULL, 305, 0, '8'),
(6445, 'scrm016', 'SCRM016', 'SCRM016', '&#160;', NULL, '&#160;card đọc thẻ all in one', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 49, 0, '11'),
(6446, 'scrm053', 'SCRM053', 'SCRM053', '&#160;', NULL, '&#160;card đọc thẻ all in one', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 51, 0, '11'),
(6320, 'utv-332', 'UTV 332', 'UTV 332', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 0pt"><span style="color: #ff0000"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; padding-top: 0in; border-bottom: windowtext 1pt">xem TV, VCD, DVD và máy ảnh</span></span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="color: #ff0000"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; padding-top: 0in; border-bottom: windowtext 1pt">Capture có chất lượng cao hình ảnh động và tĩnh, thu thập hình ảnh mượt mà</span></span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="color: #ff0000"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; padding-top: 0in; border-bottom: windowtext 1pt">K</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; padding-top: 0in; border-bottom: windowtext 1pt">ết nối với máy tính bằng cổng USB 2.0</span></span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="color: #ff0000"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; padding-top: 0in; border-bottom: windowtext 1pt">độ phân giải tối đa lên đến 720 * 576.</span></span></div>', NULL, '<p><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-ansi-language: EN-US; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-font-kerning: 1.0pt">xem TV, VCD, DVD và máy ảnh</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 211, 0, '14'),
(6447, 'scrm060', 'SCRM060', 'SCRM060', '&#160;', NULL, '&#160;card đọc thẻ all in one', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 50, 0, '11'),
(6448, 'scrm063', 'SCRM063', 'SCRM063', '&#160;', NULL, '&#160;card đọc thẻ', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 51, 0, '11'),
(6116, 'ys188', 'YS-188', 'YS-188', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">hát được USB+SD+PC+LAPTOP</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial"><o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Loa đa năng</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 231, 0, '0'),
(6403, 'h5', 'H-5', 'H-5', '<div style="overflow: auto">Loa hát thẻ nhớ SD và USB PC Laptop<br />\r\n&#160;</div>', NULL, 'LOA ĐA NĂNG', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1342, 1, NULL, 252, 0, '0'),
(6404, 'sn103', 'SN-103', 'SN-103', '<div style="overflow: auto">Loa hát thẻ nhớ SD và USB PC Laptop<br />\r\npin sạc có thể tháo rời thay thế được</div>', NULL, 'loa đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1342, 1, NULL, 271, 1, '0'),
(6405, 'cb28', 'CB-28', 'CB-28', 'Bàn phím PC USB 2.0', NULL, '<p>bàn phím USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 12, 1, NULL, 292, 0, '8'),
(6402, 'q6', 'Q-6', 'Q-6', '<div style="overflow: auto">Loa hát thẻ nhớ SD và USB PC Laptop<br />\r\npin sạc có thể tháo rời thay thế được</div>', NULL, 'Loa đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 280, 0, '0'),
(6129, 'hy152', 'HY-152', 'HY-152', '<p>thích hợp với&#160;tất cả các&#160;loại windows</p>', NULL, '<p>mouse&#160;quang USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 273, 0, '0');
INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(6130, 'hy156', 'HY-156', 'HY-156', '<p><span lang="EN-US" style="font-family: Arial; font-size: 6pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">thích h</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ợ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">p v</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ớ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i&#160;t</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ấ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">t c</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ả</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">&#160;caùc&#160;lo</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ạ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i windows</span></span></p>', NULL, '<p>chuột quang USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 278, 0, '0'),
(6131, 'hy159', 'HY-159', 'HY-159', '<p><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">thích h</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ợ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">p v</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ớ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">i&#160;t</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ấ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">t c</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ả</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial"> ca</span><span lang="VI" style="font-family: &quot;Times New Roman&quot;; font-size: 10pt; mso-ansi-language: VI">́c</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">&#160;lo</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ạ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">i windows<o:p></o:p></span></p>', NULL, '<p>chuột quang USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 271, 0, '0'),
(6132, 'hy250', 'HY-250', 'HY-250', '<p>&#160;</p>\r\n<p><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">thích h</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ợ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">p v</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ớ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">i&#160;t</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ấ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">t c</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ả</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial"> ca</span><span lang="VI" style="font-family: ''Times New Roman''; font-size: 10pt; mso-ansi-language: VI">́c</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">&#160;lo</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ạ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">i windows<o:p></o:p></span></p>', NULL, '<p>Chuột quang USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 306, 0, '0'),
(6133, 'hy256', 'HY-256', 'HY-256', '<p><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">thích h</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ợ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">p v</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ớ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i&#160;t</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ấ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">t c</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ả</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial"> ca</span><span lang="VI" style="font-family: &quot;Times New Roman&quot;; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: VI; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">́c</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">&#160;lo</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ạ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i windows</span></p>', NULL, '<p>chuột quang USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 281, 0, '0'),
(6134, 'hy257', 'HY-257', 'HY-257', '<p><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">thích h</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ợ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">p v</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ớ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i&#160;t</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ấ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">t c</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ả</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial"> ca</span><span lang="VI" style="font-family: &quot;Times New Roman&quot;; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: VI; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">́c</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">&#160;lo</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ạ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i windows</span></p>', NULL, '<p>chuột quang không dây USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 501, 0, '0'),
(5710, 'kingmaster-809', 'King-Master 809', 'King-Master 809', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 32, 1, NULL, 868, 0, '0'),
(5712, 'fan-at', 'Fan AT', 'Fan AT', '<p>Quạt Case Desktop</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 327, 0, '0'),
(5713, 'fan-p4-478', 'Fan P4 - 478', 'Fan P4 - 478', '<p>Fan CPU P4 Socket 478</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 365, 0, '0'),
(6127, 'cpadhub', 'C-PAD+HUB', 'C-PAD+HUB', '<p>quạt dành cho notebok có thêm 2 cổng USB</p>', NULL, '<p>Quạt làm mát notebok</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 289, 0, '0'),
(5715, 'fan-o-cung', 'Fan Ổ Cứng', 'Fan Ổ Cứng', '<p>L&agrave;m m&aacute;t Ổ cứng</p>', NULL, '<p>2 Quạt</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 336, 0, '0'),
(6128, 'cpadhup', 'C-PAD+HUP', 'C-PAD+HUP', '<p>quạt dành cho notebok có 2 cổng USB&#160;</p>', NULL, '<p>quạt làm mát notebok</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 303, 0, '0'),
(5717, 'fan-case-mau', 'FAN CASE MÀU', 'FAN CASE MÀU', '<p>L&agrave;m M&aacute;t Th&ugrave;ng Case</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 324, 0, '0'),
(6369, 'x4', 'X4', 'X4', '<div style="margin: 0in 0in 0pt"><span style="font-size: 9pt; color: dimgray">1.Output Watt:300W,Max Output Capacity:400W<br />\r\n2.Complies with Intel ATX12V 2.31<br />\r\n3.Adopting 20+4Pin port to support&#160; motherboard<br />\r\n4.High efficiency, enhanced 12V Output<br />\r\n5.Supply PCIE 6Pin *1 graphic card interface and SATA *4 interface<br />\r\n6.&#160;Low ripple and noise with 120mm Hydraulic bearing fans and 5 colors for your choices<br />\r\n7.High-efficiency PFC and EMI circuit to avoid electromagnetic conduction and radiation intervention<br />\r\n8. High intelligent IC support OVP, UVP, OCP, OLP, SCP, anti-lightning protection<br />\r\n9. 100% Hi-pot and burn-in test</span></div>', NULL, 'NGUỒN PC 24P 120CM', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1335, 1, NULL, 235, 0, '22'),
(6372, '120', '120', '120', 'phù hợp cho latop dưới 15inch', NULL, 'Quạt tỏa nhiệt laptop', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1336, 1, NULL, 257, 0, '22'),
(6373, '161', '161', '161', '<font style="background-color: #e6ecf9">Kích thước 331 x 264 x 43 mm<br />\r\nChất liệu nhựa ABS và nhôm<br />\r\nFan Kích thước 160 mm<br />\r\nUSB Power<br />\r\n</font>', NULL, '<p>Quạt tỏa nhiệt laptop</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 207, 0, '22'),
(6374, 'v-350', 'V 350', 'V 350', '<p align="left">2000k pixel 640x480 xoay 360 độ</p>', NULL, 'Webcam pc-laptop', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1312, 1, NULL, 267, 0, '10'),
(6375, 'd6', 'D6', 'D6', '<font face="Verdana" color="#0000ff">không cần driver,hình ảnh rỏ đẹp,tương thích với mọi HĐH</font>', NULL, 'Webcam PC-Laptop', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1312, 1, NULL, 270, 0, '10'),
(6376, 'a8', 'A8', 'A8', '<font face="Verdana" color="#0000ff">không cần driver,hình ảnh rỏ đẹp,tương thích với mọi HĐH <br />\r\nĐộ phân giải cao 640x480</font>', NULL, 'WEBCAM PC-LAPTOP', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1312, 1, NULL, 259, 0, '10'),
(6377, 'd2', 'D2', 'D2', '<font face="Verdana" color="#0000ff">không cần driver,hình ảnh rỏ đẹp,tương thích với mọi HĐH <br />\r\nĐộ phân giải cao 640x480</font>', NULL, 'webcam PC-LAPTOP', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1312, 1, NULL, 268, 0, '10'),
(6382, '336', '336', '336', '<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">thích với Windows XP/Vista/7</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">độ phân giải 640x480 PC LAPTOP</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Không cần driver</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">USB 2.0</span></div>', NULL, 'Webcam PC-LAPTOP', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 260, 0, '11'),
(6384, '030', '030', '030', '<span lang="EN-US" style="font-size: 10pt; font-family: Arial">chuột USB dây phù hợp với tất cả các loại windows</span>', NULL, 'chuột quang USB', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 275, 0, '8'),
(6385, '050', '050', '050', '<span lang="EN-US" style="font-size: 10pt; font-family: Arial">chuột USB dây phù hợp với tất cả các loại windows</span>', NULL, '<p>chuột quang USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 263, 0, '8'),
(6386, '680', '680', '680', '<span lang="EN-US" style="font-size: 10pt; font-family: Arial">chuột USB dây phù hợp với tất cả các loại windows</span>', NULL, 'Mouse quang USB', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 261, 0, '8'),
(6387, 'u30', 'U30', 'U30', '<p>USB, độ phân giải 640x480. PC &amp; NOTEBOOK<br />\r\nTự nhận USB không cần Driver</p>', NULL, 'webcam USB 2.0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 258, 0, '8'),
(6388, 'ma4', 'M-A4', 'M-A4', 'sử dụng cho PC-LAPTOP MP3 MP4', NULL, 'Tai nghe nói', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 44, 1, NULL, 258, 0, '8'),
(6389, 'ma5', 'M-A5', 'M-A5', 'sử dụng cho CP LAPTOP MP3 MP4 Voice chat', NULL, 'Tai nghe nói', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 44, 1, NULL, 259, 0, '8'),
(6390, 'mf20', 'M-F20', 'M-F20', 'sử dụng cho PC LAPTOP MP3 MP4 Voice chat', NULL, 'Tai nghe nói chùm sau đầu', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 44, 1, NULL, 265, 0, '8'),
(6391, 'mk800', 'MK-800', 'MK-800', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #474747; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in">Bộ key+mouse có dây kỹ thuật thiết kế bàn phím lớn</span><span style="font-size: 9pt; color: #474747"><o:p></o:p></span></font></p>\r\n<span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: &quot;Times New Roman&quot;; mso-border-alt: none windowtext 0in; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Ít tiếng ồn, chống thấm cho quá trình sử dụng</span>', NULL, 'Bộ bàn phím chuột có dây PS/2', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1337, 1, NULL, 267, 0, '8'),
(6392, 'km900', 'KM-900', 'KM-900', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #474747; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in">Bộ key+mouse có dây kỹ thuật thiết kế bàn phím lớn</span><span style="font-size: 9pt; color: #474747"><o:p></o:p></span></font></p>\r\n<span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: &quot;Times New Roman&quot;; mso-border-alt: none windowtext 0in; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Ít tiếng ồn, chống thấm cho quá trình sử dụng</span>', NULL, 'Bộ bàn phím chuột có dây PS/2', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1337, 1, NULL, 242, 0, '8'),
(6394, '680681', '680-681', '680-681', 'Card đọc thẻ 43-in-1_USB_Memory_Card', NULL, '<p>Card đọc thẻ</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1247, 1, NULL, 266, 0, '0'),
(6395, '539', '539', '539', 'card đọc thẻ all in one', NULL, 'card mini', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1247, 1, NULL, 264, 0, '0'),
(6396, 'loa-con-heo', 'loa con heo', 'loa con heo', '<font color="#696969" size="2">hầu hết mọi người&#160;bất ngờ với âm trầm - âm trung - âm cao đều được phát ra khá đầy đủ và hài hoà dù rằng chỉ ở mức công suất 50%, công suất âm thanh của bộ loa này hoàn toàn không giống hình dáng nhỏ gọn và dễ thương bề ngoài chút nào. Với không gian yên tĩnh trong phòng và buổi tối thì mức công suất 30% có lẽ là đã đủ đáp ứng cho mọi người rồi.<br />\r\nVới nút điều chỉnh cảm ứng dễ dàng cho người sử dụng</font><span style="color: dimgray"><br />\r\n</span><span style="font-size: small"><span style="color: darkred"><span style="color: #008000"><strong><span style="color: dimgray"><font size="2">Có </font><span style="font-size: large"><font size="4">04</font></span><font size="2"> màu cho bạn lựa chọn như </font><span style="font-size: large"><span style="color: magenta"><font size="4">hồng</font></span></span><font size="2">, </font><span style="font-size: large"><span style="color: silver"><font size="4">trắng</font></span></span><font size="2">, </font><span style="font-size: large"><span style="color: darkslategray"><font size="4">đen</font></span></span><font size="2">, </font><span style="font-size: large"><span style="color: yellow"><font size="4">vàng<br />\r\n</font></span></span></span>hát được USB SD PC LAPTOP MP3 MP4<br />\r\n</strong></span></span></span><br />\r\n<br />', NULL, 'loa đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 309, 0, '0'),
(6397, 's301', 'S301', 'S301', '<em>Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em><span><br />\r\n<em>*Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span>', NULL, 'Loa đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1342, 1, NULL, 251, 0, '0'),
(6398, 's309', 'S309', 'S309', '<em>Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span>', NULL, 'loa đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1342, 1, NULL, 243, 0, '0'),
(6399, 'sn405', 'SN-405', 'SN-405', 'nghe nhạc PC-LAPTOP MP3 MP4<br />\r\nNguồn USB', NULL, 'Loa mini', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1342, 1, NULL, 233, 0, '0'),
(6400, 'sn409', 'SN-409', 'SN-409', 'nghe nhạc PC LAPTOP MP3 MP4<br />\r\nNguồn USB', NULL, 'Loa mini', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1342, 1, NULL, 242, 0, '0'),
(6401, 'sn110', 'SN-110', 'SN-110', '<span><em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:<br />\r\nMàn hình LCD nhỏ gọn dễ dàng điều chỉnh theo ý muốn</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span>', NULL, 'LOA ĐA NĂNG', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1342, 1, NULL, 239, 0, '0'),
(6363, 's200', 'S200', 'S200', '<span style="font-size: 13.5pt; color: red"><em>-Lá tản nhiệt bằng đồng cho hiệu năng tản nhiệt tốt</em><br />\r\n<br />\r\n</span>', NULL, 'FAN CPU SOCKET 775', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1333, 1, NULL, 228, 0, '22'),
(6364, 'anpha-200-plus', 'ANPHA 200 Plus', 'ANPHA 200 Plus', '<ul class="prod_feat_list1">\r\n    <p class="application_title"><strong><span id="UcPABound1_prod_abound_ctl00_lblABoundNameParent"><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="53" style="border-top-width: 0px; padding-right: 0px; background-position: 0% 0%; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background-attachment: scroll; background-image: none; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; background-repeat: repeat; border-right-width: 0px; outline: 0">Intel Socket 130W</font></font></span></strong> <br />\r\n    <span class="italic" id="UcPABound1_prod_abound_ctl00_ltAboundServies"><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="54" style="border-top-width: 0px; padding-right: 0px; background-position: 0% 0%; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background-attachment: scroll; background-image: none; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; background-repeat: repeat; border-right-width: 0px; outline: 0">LGA775</font></font></span> <br />\r\n    tản nhiệt DeepCool Alpha&#160;200 plus - chỉ gắn cho Intel Socket 775.&#160;2 ống đồng dẫn nhiệt (heatpipe) &amp; đế đồng lá nhôm cho hiệu quả cao</p>\r\n</ul>\r\n<ul id="UcPABound1_prod_abound_ctl00_bulPars">\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="55" style="border-top-width: 0px; padding-right: 0px; background-position: 0% 0%; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background-attachment: scroll; background-image: none; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; background-repeat: repeat; border-right-width: 0px; outline: 0">Core 2 Extreme</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="56" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0">Core 2 Quad</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="57" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: #e6ecf9; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; color: #000; padding-top: 0px; border-right-width: 0px; outline: 0">Core 2 Duo</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="58" style="border-top-width: 0px; padding-right: 0px; background-position: 0% 0%; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background-attachment: scroll; background-image: none; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; background-repeat: repeat; border-right-width: 0px; outline: 0">Pentium Dual-Core</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="59" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0">Pentium D / Pentium 4</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="60" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0">Celeron Dual-Core</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="61" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0">Celeron / Celeron D</font></font></li>\r\n</ul>', NULL, 'FAN CPU SOCKET 775', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1333, 1, NULL, 230, 0, '22'),
(6365, '120l', '120L', '120L', 'quạt tỏa nhiệt có đèn màu', NULL, '<p>FAN 122cm</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1334, 1, NULL, 216, 0, '22'),
(6366, 'deepcool-120l', 'deepcool 120L', 'deepcool 120L', 'quạt tỏa nhiệt có đèn nhiều màu', NULL, 'FAN 120cm', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1334, 1, NULL, 200, 0, '22'),
(6367, 'deepcool120l', 'DeepCool_120L', 'DeepCool_120L', 'quạt tỏa nhiệt có đèn nhiều màu', NULL, '<p>FAN 120cm</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1334, 1, NULL, 198, 0, '22');
INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(6368, 'x5', 'X5', 'X5', '<table cellspacing="1" cellpadding="0" width="536" align="left" border="1" style="width: 402pt">\r\n    <tbody>\r\n        <tr>\r\n            <td colspan="2" style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><b><span style="font-size: 9pt; color: dimgray">Technology specifications list:</span></b></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">For type</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Desktop</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Application platform</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Intel dual-core, quad-core and AMD dual-core, triple-core, quad-core processors, etc.</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Rated Power</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">350 watts</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Stable power</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">380 watts (for 24 hours to run power)</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">PFC Type&#160;</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Passive</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Voltage</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt"> Range</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">180V - 264V</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Power Specifications</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">ATX12V 2.31</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">12V output</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Dual +12 V</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Conversion efficiency</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">76%</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Standby power consumption</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Less than 1 watt</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Heat pipe cooling</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Single copper heat pipe cooling fins wear</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Fan Type</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">12 cm silent fan hydraulic bullet</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Motherboard Power Supply</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">20 +4 Pin length: 430mm</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">CPU power</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">4 +4 Pin length: 480mm</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Graphics power</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">6 +2 Pin 1 </span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">个</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt"> line length: 530mm&#160;&#160;&#160;&#160;&#160;&#160; </span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">SATA Interface</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">4 wire length: 430 +150 +150 +150 mm</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Big 4Pin Interface</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">2 length: 430 +150 +150 mm</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Technical Features</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Copper heat pipe cooling fins to wear, less than 1 watt standby, the hydraulic bullet quiet fan</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Function protection</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Overvoltage, undervoltage, overload, over current, over temperature and short circuit protection</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Safety Certification</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">3C, CE, ROSH lead-free process</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">MTBF</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">50,000 hours</span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Service</span></div>\r\n            </td>\r\n            <td style="border-right: #ece9d8; padding-right: 0.75pt; border-top: #ece9d8; padding-left: 0.75pt; padding-bottom: 0.75pt; border-left: #ece9d8; padding-top: 0.75pt; border-bottom: #ece9d8; background-color: transparent">\r\n            <div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Year of renewal, three-year warranty</span></div>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', NULL, 'NGUỒN PC 24P FAN 12CM', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1335, 1, NULL, 236, 0, '22'),
(6360, 'cpu8800', 'Cpu_8800', 'Cpu_8800', '<strong>Quạt tản nhiệt CPU Socket 775</strong>', NULL, 'FAN CPU SOCKET 775', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1333, 1, NULL, 225, 0, '22'),
(6361, 's83', 'S83', 'S83', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><font size="3"><span style="font-family: VNI-Times">Kích th</span><font face="Times New Roman">ư<span style="mso-ascii-font-family: VNI-Times">ớ</span></font><span style="font-family: VNI-Times">c s</span><span style="mso-ascii-font-family: VNI-Times"><font face="Times New Roman">ả</font></span><span style="font-family: VNI-Times">n ph</span><span style="mso-ascii-font-family: VNI-Times"><font face="Times New Roman">ẩ</font></span><span style="font-family: VNI-Times">m 113 (L) x80 (W) x113 (H) mm<o:p></o:p></span></font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">+CPU</font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Intel LGA775 Core 2 Duo Core 2 Duo </font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Celeron Celeron</font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Pentium 4, Pentium 4 </font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Pentium D Pentium D </font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Core i7 Core i7</font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Core i5 Core i5</font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Core Core i3 i3 </font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">+AMD</font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">754/939</font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">AM2/AM2 + / AM3 </font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font size="3"><font face="Times New Roman"><span style="mso-spacerun: yes">&#160;</span>Sempron Sempron </font></font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Athlon 64 Athlon 64 </font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Athlon X2 Athlon X2 </font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font face="Times New Roman" size="3">Phenom Phenom 64 64</font></p>', NULL, '<p>FAN CPU SOCKET 775</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1333, 1, NULL, 233, 0, '22'),
(6362, 's-90', 'S 90', 'S 90', '<div style="margin: 0in 0in 0pt"><span style="color: blue">Product Dimensions : 97(L)x82(W)x125(H)mm<br />\r\nWeight :428g<br />\r\nFan Dimensions : 90(L)x90(W)x25(H)mm<br />\r\nBearing Type : Hydraumatic<br />\r\nRated Voltage : 12 VDC<br />\r\nRated Current : 0.15 Amp±0.02<br />\r\nAir Flow : 45 CFM<br />\r\nNoise : 18 dBA±10%<br />\r\nFan Speed : 2,000 RPM ±10%<br />\r\nLife : 30,000 Hours</span><span style="font-size: 10pt; color: #2c6dc4"><br />\r\n<br />\r\n</span><i><span style="font-size: 13.5pt; color: red">-Lá tản nhiệt bằng đồng.Thiết kế lượn sóng với 2 Hp đôi tiếp xúc trực tiếp cho hiệu năng tản nhiệt tốt<br />\r\n-Đặc biệt : Quạt làm mát kích thước 90mm siêu êm cho lưu lượng gió lên đến 45CFM <br />\r\n-Giải nhiệt cho các CPU Intel Socket LGA (1366,1156,1155,775)<br />\r\nAMD Athlon 64 Socket (754,939,940,AM2)</span></i></div>', NULL, 'FAN CPU SOCKET 775', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1333, 1, NULL, 248, 0, '22'),
(6352, 'sa200', 'SA-200', 'SA-200', '<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>LOA MINI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 264, 0, '0'),
(6353, 'sd908', 'SD-908', 'SD-908', '<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>LOA MINI</p>\r\n<p>&#160;</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 294, 0, '0'),
(6354, 'su10', 'SU-10', 'SU-10', '<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>LOA MINI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 250, 0, '0'),
(6355, 'su11', 'SU-11', 'SU-11', '<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>LOA MINI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 249, 0, '0'),
(6356, 'su05', 'SU-05', 'SU-05', '<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>LOA MINI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 273, 0, '0'),
(6357, 'x103', 'X-103', 'X-103', '<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>LOA MINI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 257, 0, '0'),
(6349, 'mfv10', 'MF-V10', 'MF-V10', '<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>Loa mini</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1343, 1, NULL, 236, 0, '0'),
(6350, 'mk500x', 'MK-500X', 'MK-500X', '<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>Loa mini</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 269, 0, '0'),
(6351, 'sa800', 'SA-800', 'SA-800', '<p>&#160;</p>\r\n<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>Loa MINI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 259, 0, '0'),
(5730, 'quat-cpu-socket-775', 'QUẠT CPU SOCKET 775', 'QUẠT CPU SOCKET 775', '<p><span class="style20">D&ugrave;ng&nbsp;giải nhiệt CPU socket 775</span></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 332, 0, '0'),
(5731, 'quat-o-cung', 'QUẠT Ổ CỨNG', 'QUẠT Ổ CỨNG', '<p><span class="style20">D&ugrave;ng giải nhiệt ổ cứng</span></p>', NULL, '<p>Một Quạt</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 312, 0, '0'),
(5732, 'colovis-317', 'Colovis 317', 'Colovis 317', '<p>USB, độ ph&acirc;n giải 640x480 PC &amp; NOTENOOK</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 347, 0, '0'),
(5733, 'colorvis-818', 'Colorvis 818', 'Colorvis 818', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>USB 2.0</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 329, 0, '0'),
(5734, 'colorvis-306', 'Colorvis 306', 'Colorvis 306', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 337, 0, '0'),
(5735, 'colorvis-2005', 'Colorvis 2005', 'Colorvis 2005', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 407, 0, '0'),
(5736, 'colorvis-1001b', 'Colorvis 1001B', 'Colorvis 1001B', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 442, 0, '0');
INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(5737, 'colorvis-1001-a', 'Colorvis 1001 A', 'Colorvis 1001 A', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 565, 0, '0'),
(6381, '335', '335', '335', '<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">thích với Windows XP/Vista/7</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">độ phân giải 640x480 PC LAPTOP</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Không cần driver</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">USB 2.0</span></div>', NULL, '<p>Webcam PC-LAPTOP</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 252, 0, '11'),
(5743, 'kingmaster-209', 'King-Master  209', 'King-Master  209', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 32, 1, NULL, 1024, 0, '0'),
(5745, 'kingmaster-v10', 'King-Master  V10', 'King-Master  V10', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 32, 1, NULL, 436, 0, '0'),
(5747, 'all-in-one', 'All In One', 'All In One', '<p>USB, đọc tất cả c&aacute;c loại thẻ.</p>', NULL, '<p>King-Master</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1280, 1, NULL, 345, 0, '0'),
(5748, 'goon730', 'GO-ON730', 'GO-ON730', '<p>Tai Nghe Kh&ocirc;ng D&acirc;y</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 48, 1, NULL, 260, 0, '0'),
(5749, 'goon737', 'Go-On737', 'Go-On737', '<p>Tai Nghe Kh&ocirc;ng D&acirc;y</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 48, 1, NULL, 275, 0, '0'),
(5750, 'goon739', 'Go-On739', 'Go-On739', '<p>Tai Nghe Kh&ocirc;ng D&acirc;y</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 48, 1, NULL, 277, 0, '0'),
(5751, 'goon740', 'Go-On740', 'Go-On740', '<p>Tai Nghe Kh&ocirc;ng D&acirc;y</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 48, 1, NULL, 270, 0, '0'),
(5752, 'goon757', 'Go-On757', 'Go-On757', '<p>Tai Nghe Kh&ocirc;ng D&acirc;y</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 48, 1, NULL, 273, 0, '0'),
(5753, 'goon760', 'GO-ON760', 'GO-ON760', '<p>Tai Nghe Kh&ocirc;ng D&acirc;y</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 48, 1, NULL, 278, 0, '0'),
(5754, 'goon767', 'Go-On767', 'Go-On767', '<p>Tai Nghe Kh&ocirc;ng D&acirc;y</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 48, 1, NULL, 271, 0, '0'),
(5755, 'goon770', 'Go-On770', 'Go-On770', '<p>Tai Nghe Kh&ocirc;ng D&acirc;y</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 48, 1, NULL, 273, 0, '0'),
(5756, 'ov690mv', 'OV.690MV', 'OV.690MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;40mm <br />\r\nSensitivity ： 108dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 15mW <br />\r\nPower Capability ： 150mW <br />\r\nCable Lengty ： Approx.2.3m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 6X5mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;2dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 330, 0, '0'),
(5757, 'ov680mv', 'OV.680MV', 'OV.680MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;40mm <br />\r\nSensitivity ： 108dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 15mW <br />\r\nPower Capability ： 150mW <br />\r\nCable Lengty ： Approx.2.3m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 6X5mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;2dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 312, 0, '0'),
(5762, 'ov410mv', 'OV.410MV', 'OV.410MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;40mm <br />\r\nSensitivity ： 103dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 15mW <br />\r\nPower Capability ： 150mW <br />\r\nCable Lengty ： Approx.2.3m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 6X5mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;2dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 292, 0, '0'),
(5763, 'ovt201mv', 'OV.T201MV', 'OV.T201MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;27mm <br />\r\nSensitivity ： 108dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 15mW <br />\r\nPower Capability ： 150mW <br />\r\nCable Lengty ： Approx.1.8m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 9X7mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;3dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 310, 0, '0'),
(6459, 'n60', 'N60', 'N60', '<table class="technical" cellpadding="0" cellspacing="0" style="font-family: Arial, sans-serif; line-height: 18px; width: 644px; color: rgb(0, 0, 0); font-size: 12px;">\r\n    <tbody>\r\n        <tr class="data">\r\n            <td class="name" style="padding: 6px 12px 6px 0px; vertical-align: top; color: rgb(102, 102, 102); font-weight: bold; width: 280px;">Model</td>\r\n            <td class="value" style="padding: 6px 0px; vertical-align: top;">N60</td>\r\n        </tr>\r\n        <tr>\r\n            <td class="title" colspan="2" style="padding: 6px 0px; vertical-align: top; border-bottom-color: rgb(204, 204, 204); border-bottom-style: solid; font-size: 14px;">Thông số kỹ thuật</td>\r\n        </tr>\r\n        <tr class="data">\r\n            <td class="name" style="padding: 6px 12px 6px 0px; vertical-align: top; color: rgb(102, 102, 102); font-weight: bold; width: 280px;">Số cổng kết nối</td>\r\n            <td class="value" style="padding: 6px 0px; vertical-align: top;">• 1 x USB<br />\r\n            • 3 x RJ45<br />\r\n            • 1 RJ45 WAN</td>\r\n        </tr>\r\n        <tr class="data">\r\n            <td class="name" style="padding: 6px 12px 6px 0px; vertical-align: top; color: rgb(102, 102, 102); font-weight: bold; width: 280px;">Tốc độ truyền dữ liệu</td>\r\n            <td class="value" style="padding: 6px 0px; vertical-align: top;">• 10/100/1000Mbps</td>\r\n        </tr>\r\n        <tr class="data" style="background-color: rgb(246, 246, 246);">\r\n            <td class="name" style="padding: 6px 12px 6px 0px; vertical-align: top; color: rgb(102, 102, 102); font-weight: bold; width: 280px;">Giao thức bảo mật</td>\r\n            <td class="value" style="padding: 6px 0px; vertical-align: top;">• WPA<br />\r\n            • WEP<br />\r\n            • SSID Broadcast<br />\r\n            • MAC Filtering<br />\r\n            • WPA2<br />\r\n            • PSK<br />\r\n            • AES<br />\r\n            • TKIP</td>\r\n        </tr>\r\n        <tr class="data">\r\n            <td class="name" style="padding: 6px 12px 6px 0px; vertical-align: top; color: rgb(102, 102, 102); font-weight: bold; width: 280px;">Giao thức Routing / Firewall</td>\r\n            <td class="value" style="padding: 6px 0px; vertical-align: top;">• -</td>\r\n        </tr>\r\n        <tr class="data">\r\n            <td class="name" style="padding: 6px 12px 6px 0px; vertical-align: top; color: rgb(102, 102, 102); font-weight: bold; width: 280px;">Manegement</td>\r\n            <td class="value" style="padding: 6px 0px; vertical-align: top;">• -</td>\r\n        </tr>\r\n        <tr class="data">\r\n            <td class="name" style="padding: 6px 12px 6px 0px; vertical-align: top; color: rgb(102, 102, 102); font-weight: bold; width: 280px;">Nguồn</td>\r\n            <td class="value" style="padding: 6px 0px; vertical-align: top;">• 9V DC, 1A</td>\r\n        </tr>\r\n        <tr class="data">\r\n            <td class="name" style="padding: 6px 12px 6px 0px; vertical-align: top; color: rgb(102, 102, 102); font-weight: bold; width: 280px;">Kích thước(cm)</td>\r\n            <td class="value" style="padding: 6px 0px; vertical-align: top;">171x111x25</td>\r\n        </tr>\r\n    </tbody>\r\n</table>', NULL, '&#160;\r\n<h1 style="font-family: Arial, sans-serif; margin: 0px; color: rgb(14, 118, 188); font-size: 18px;"><span style="color: rgb(0, 0, 0);">Tenda Dual band Wireless 300Mbps N60</span></h1>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 71, 1, NULL, 70, 1, '15'),
(5766, 'ov510mv', 'OV.510MV', 'OV.510MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;40mm <br />\r\nSensitivity ： 108dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 15mW <br />\r\nPower Capability ： 150mW <br />\r\nCable Lengty ： Approx.2.3m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 6X5mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;3dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 284, 0, '0'),
(5767, 'ovt350mv', 'OV.T350MV', 'OV.T350MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;40mm <br />\r\nSensitivity ： 103dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 100mW <br />\r\nPower Capability ： 1000mW <br />\r\nCable Lengty ： Approx.2.3m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 6X5mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;3dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 338, 0, '0'),
(5768, 'ovt360mv', 'OV.T360MV', 'OV.T360MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;40mm <br />\r\nSensitivity ： 103dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 100mW <br />\r\nPower Capability ： 1000mW <br />\r\nCable Lengty ： Approx.2.3m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 6X5mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;2dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 312, 0, '0'),
(5769, 'ov320mv', 'OV.320MV', 'OV.320MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;40mm <br />\r\nSensitivity ： 103dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 15mW <br />\r\nPower Capability ： 150mW <br />\r\nCable Lengty ： Approx.2.3m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 8X5mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;2dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 295, 0, '0'),
(5770, 'ov740mv', 'OV.740MV', 'OV.740MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;40mm <br />\r\nSensitivity ： 103dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 15mW <br />\r\nPower Capability ： 150mW <br />\r\nCable Lengty ： Approx.2.3m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 6X5mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;3dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 305, 0, '0'),
(5771, 'ov330mv', 'OV.330MV', 'OV.330MV', '<p>HEADPHONE SECTION <br />\r\nSpeaker ： &Phi;40mm <br />\r\nSensitivity ： 103dB S.P.L at 1KHz <br />\r\nImpedance ： 32&Omega; <br />\r\nFrequency Response ： 20Hz-20,000Hz <br />\r\nRated Power ： 15mW <br />\r\nPower Capability ： 150mW <br />\r\nCable Lengty ： Approx.2.3m&plusmn;0.15m <br />\r\nPlug Type ： &Phi;3.5mm Stereo <br />\r\nMICROPHONE SECTION <br />\r\nMicrophone Unit ： 9X7mm Dia.Electret condenser <br />\r\nMicrophone Directivity ： Omni Direction <br />\r\nSensitivity ： -58dB&plusmn;2dB <br />\r\nImpedance ： Low <br />\r\nFrequency Response ： 30Hz to 16,000Hz <br />\r\nStandard Operating Voltage ： 3V</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 293, 0, '0'),
(5787, 'bao-silicon', 'Bao Silicon', 'Bao Silicon', '<p>Ipod Nano 2</p>', NULL, '<p>Ipod Nano 2</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 252, 0, '0'),
(5788, 'bao-da-len', 'Bao Da Len', 'Bao Da Len', '<p>Bao da ipod len</p>', NULL, '<p>Bao da ipod len</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 252, 0, '0'),
(5789, 'vo-ipod-nano', 'Võ Ipod Nano', 'Võ Ipod Nano', '<p>V&otilde; Ipod Nano</p>', NULL, '<p>Silicon</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 261, 0, '0'),
(5790, 'vo-ipod-nano-len', 'Võ Ipod Nano Len', 'Võ Ipod Nano Len', '<p>V&otilde; Ipod Nano Len</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 244, 0, '0'),
(5791, 'vo-ipod-nhua-nano3', 'Võ Ipod Nhựa Nano3', 'Võ Ipod Nhựa Nano3', '<p>V&otilde; Ipod Nhựa Nano3</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 251, 0, '0'),
(5792, 'vo-ipod-for-classic', 'Võ Ipod For Classic', 'Võ Ipod For Classic', '<p>V&otilde; Ipod For Classic</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 256, 0, '0'),
(5793, 'vo-da-ipod-new-3', 'Võ Da Ipod New 3', 'Võ Da Ipod New 3', '<p>V&otilde; Da Ipod New 3</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 243, 0, '0'),
(5796, 'cap-ata-100', 'Cáp ATA 100', 'Cáp ATA 100', '<p><strong>C&aacute;p ATA 100</strong></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 249, 0, '0'),
(5797, 'vong-tinh-dien', 'Vòng tĩnh điện', 'Vòng tĩnh điện', '<p>Chống nhiễm điện</p>', NULL, '<p>Đeo Tay</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 253, 0, '0'),
(5798, 'den-keyboard', 'Đèn Keyboard', 'Đèn Keyboard', '<p>L&agrave;m S&aacute;ng B&agrave;n Ph&iacute;m, cổng USB</p>', NULL, '<p>L&agrave;m S&aacute;ng B&agrave;n Ph&iacute;m</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 267, 0, '0'),
(5799, 'cap-nguon-12', 'Cáp nguồn 1->2', 'Cáp nguồn 1->2', '<p>D&ugrave;ng th&ecirc;m đầu nguồn</p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 255, 0, '0'),
(5800, 'cap-sata150', 'Cáp SATA150', 'Cáp SATA150', '<p>C&aacute;p SATA150, C&aacute;p T&iacute;nh Hiệu</p>', NULL, '<p>C&aacute;p T&iacute;nh Hiệu</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 254, 0, '0'),
(5801, 'pin-cmos', 'Pin CMOS', 'Pin CMOS', '<p><strong>Pin CMOS</strong></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 265, 0, '0'),
(5802, 'sac-notebook-xe-hoi', 'Sạc Notebook xe hơi', 'Sạc Notebook xe hơi', '<p><strong>Sạc Notebook xe hơi</strong></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 252, 0, '0'),
(5803, 'cable-nguon-sata', 'Cable nguồn Sata', 'Cable nguồn Sata', '<p><strong>Cable nguồn Sata, d&ugrave;ng đổi đầu nguồn thường sang nguồn SATA</strong></p>', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 254, 0, '0'),
(6455, 'shu-017', 'SHU 017', 'SHU 017', '&#160;', NULL, '&#160;HUB USB 2.0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1348, 1, NULL, 24, 0, '11'),
(6453, 'shu012', 'SHU012', 'SHU012', '&#160;', NULL, '&#160;HUB USB 2.0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1348, 1, NULL, 25, 0, '11'),
(6451, 'scrs056', 'SCRS056', 'SCRS056', '&#160;', NULL, '&#160;card đọc thẻ micro', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 75, 1, '11'),
(6444, '054', '054', '054', '&#160;', NULL, '&#160;card đọc thẻ all in one', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 53, 0, '11'),
(6173, '010-day-rut', '010 day rut', '010 day rut', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">chuột phù hợp với tất cả các loại windows</span></p>', NULL, '<p>chuột vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 288, 0, '8'),
(6172, 'clv-g5', 'CLV G5', 'CLV G5', '<p>chuột không dây phù hợp với tất cả các loại windows</p>', NULL, '<p>chuột không dây vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 307, 0, '8'),
(6171, 'hysp50', 'HY-SP50', 'HY-SP50', '<p>sử dụng nguồn USB từ máy tính</p>', NULL, '<p><span lang="EN-US" style="font-size: 10pt; font-family: Arial; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 284, 0, '10'),
(6091, 'ssk029', 'SSK-029', 'SSK-029', '', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 309, 0, '11'),
(5812, '100120', '1001(2.0)', '1001(2.0)', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>KING-MASTER</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 32, 1, NULL, 548, 0, '0'),
(5813, '100920', '1009(2.0)', '1009(2.0)', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>KING-MASTER</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 32, 1, NULL, 390, 0, '0'),
(5814, '1009micro', '1009+Micro', '1009+Micro', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>KING-MASTER</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 32, 1, NULL, 531, 0, '0'),
(5940, 'ssk0708', 'SSK-0708', 'SSK-0708', '<p>Box đựng Ổ cứng Laptop, IDE, kết nối cổng USB để truyền dữ liệu</p>', NULL, '<p>HDD 2.5, IDE, USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1289, 1, NULL, 342, 0, '0'),
(6378, '121', '121', '121', 'phù hợp dưới 15inch', NULL, 'quạt tỏa nhiệt laptop', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1336, 1, NULL, 246, 0, '22'),
(5820, 'v317', 'v317', 'v317', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>KING-MASTER</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 32, 1, NULL, 333, 0, '0'),
(6204, 'tend-d820r', 'Tend D820R', 'Tend D820R', '<p><span style="font-size: small"><span lang="EN-US" style="color: #006ba7; font-family: Arial; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Một 10/100M Auto-Negotiation Ethernet LAN port <br />\r\nRJ11 splitter với lọc bao gồm <br />\r\nTuân theo ADSL, ADSL2, và tiêu chuẩn ADSL2</span></span></p>', NULL, '<p>ADSL2+Router</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1324, 1, NULL, 263, 0, '15'),
(6205, 'tenda-w268r', 'Tenda W268R', 'Tenda W268R', '<p><span style="font-size: x-small"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">AP không dây, Router, 4-Port Switch, và Firewall</span></span></p>\r\n<p><span style="font-size: x-small"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Tương thích với chuẩn 802.11n, IEEE 802.11g, và IEEE 802.11b</span></span></span></p>\r\n<p><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Đáp ứng 64/128-bit WEP, WPA, WPA2 và các tiêu chuẩn an ninh</span></span></span></p>\r\n<p><span style="font-size: x-small"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Cung cấp một 10/100Mbps Auto-Negotiation Ethernet WAN port <br />\r\nCung cấp bốn 10/100Mbps Auto-Negotiation Ethernet LAN ports</span></span></span></span></span></p>', NULL, '<p>Router Wireless-N-B-G</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 71, 1, NULL, 310, 0, '15'),
(6158, 'hy202', 'HY-202', 'HY-202', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span><span lang="EN-US" style="font-family: Arial; font-size: 6pt"><o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 290, 0, '10'),
(6159, 'hy660f', 'HY-660F', 'HY-660F', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 285, 0, '10'),
(6160, 'hy203-ii', 'HY-203 II', 'HY-203 II', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 296, 0, '10'),
(6156, 'hy620t', 'HY-620T', 'HY-620T', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span><span lang="EN-US" style="font-family: Arial; font-size: 6pt"><o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 266, 0, '10'),
(6157, 'hy9300f', 'HY-9300F', 'HY-9300F', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 287, 0, '10'),
(5827, 's108', 'S108', 'S108', '<p id="introp">S108, MINI Fast Ethernet Switch, MINI and exquisite, is specially designed for SOHO and small enterprise users.With easy installation, high forwarding rate and connection mode of auto-negotiation port, it supports Auto MDI/MDIX, MAC address auto learning/aging and integrates 1K MAC table.</p>\r\n<div id="pdcontent1">\r\n<ul id="introul">\r\n    <li>Complies with IEEE802.3 10Base-T and IEEE802.3u 100Base-TX Fast Ethernet standards</li>\r\n    <li>Supports Auto MDI/MDIX</li>\r\n    <li>Supports NMAY auto-negotiation function</li>\r\n    <li>Integrates 1K MAC address table</li>\r\n    <li>Supports MAC address auto learning/aging</li>\r\n</ul>\r\n</div>', NULL, '<p>TENDA</p>\r\n<p>8-Port Fast Ethernet Switch</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1325, 1, NULL, 287, 0, '0'),
(5828, 's105', 'S105', 'S105', '<p id="introp">S105 Fast Ethernet Switch, MINI and exquisite, is specially designed for SOHO and SMB users. With easy installation, stable performance and high forwarding rate, it supports Auto MDI/MDIX and auto negotiates the port connection mode. In addition, MAC address auto learning/aging and 2K MAC address table are also provided.</p>\r\n<div id="pdcontent1">\r\n<ul id="introul">\r\n    <li>Complies with IEEE802.3 10Base-T and IEEE802.3u 100Base-TX Fast Ethernet standards</li>\r\n    <li>Supports Auto MDI/MDIX</li>\r\n    <li>Supports NMAY auto-negotiation function</li>\r\n    <li>Integrates 2K MAC address table</li>\r\n    <li>Supports MAC address auto learning/aging</li>\r\n</ul>\r\n</div>', NULL, '<p>TENDA</p>\r\n<p>5-Port Fast Ethernet Switch</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1325, 1, NULL, 293, 0, '0'),
(6206, 'tenda-w301r', 'Tenda W301R', 'Tenda W301R', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="font-size: x-small"><span lang="EN-US" style="font-family: Verdana; color: #666666; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体">Giao thức bảo mật: WPA, WEP, WPA2-PSK, 802.1x</span></span></p>\r\n<p class="MsoNormal" align="left" style="text-align: left; margin: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="font-size: x-small"><span lang="EN-US" style="font-family: Verdana; color: #666666; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体">Số cổng kết nối: 4 x RJ45 LAN, 1 RJ45 WAN</span></span><span lang="EN-US" style="font-family: Verdana; color: #666666; font-size: 5.5pt; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体"><o:p></o:p></span></p>\r\n<p class="MsoNormal" align="left" style="text-align: left; margin: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="font-size: x-small"><span lang="EN-US" style="font-family: Verdana; color: #666666; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体">Tốc độ truyền dữ liệu: 10/100Mbps</span></span><span lang="EN-US" style="font-family: Verdana; color: #666666; font-size: 5.5pt; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体"><o:p></o:p></span></p>\r\n<p>&#160;</p>', NULL, '<p><span style="font-size: x-small"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Router</span></span>&#160;Wireless 300Mbps</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 71, 1, NULL, 529, 0, '15'),
(6141, 'hy-m262', 'HY m262', 'HY m262', '<p>thích hợp với tất cả các loại windows</p>', NULL, '<p>chuột quang USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 273, 0, '0'),
(6142, 'hy-ms150', 'HY MS150', 'HY MS150', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">thích hợp với tất cả các loại windows<o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột quang USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 308, 0, '0'),
(6143, 'hy257', 'HY-257', 'HY-257', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">thích hợp với tất cả các loại windows</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột quang không dây&#160;USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 236, 0, '0'),
(6464, 'y115', 'Y-115', 'Y-115', '&#160;<span style="text-indent: 7pt; font-size: 9pt; font-family: Arial;">Hỗ trợ 4096 x 2160 màn hình 24Hz </span><span lang="ZH-CN" style="text-indent: 7pt; font-size: 9pt; font-family: 宋体;">◆</span><span style="text-indent: 7pt; font-size: 9pt; font-family: Arial;"> hỗ trợ màn hình hiển thị 3D, hỗ trợ toàn diện 720,1080 i, 1080P<span class="apple-converted-space">&#160;</span>cắm mạ vàng 24K bụi che phủ bảo vệ HDMI/M/19P-HDMI/M/19P, plug and play, các tín hiệu<span class="apple-converted-space">&#160;</span>và 4Kx2K định dạng tín hiệu kỹ thuật số<span class="apple-converted-space">&#160;</span></span>', NULL, '<span style="color: rgb(0, 0, 0);">&#160;<span style="font-family: Arial, Helvetica, sans-serif; font-size: 18px;">5M HDMI 1.4 Male to Male</span></span>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1349, 1, NULL, 74, 0, '23'),
(6465, 'yc440', 'Y-C440', 'Y-C440', '&#160;<span style="color: rgb(68, 68, 68); font-family: arial, sans-serif; font-size: small; line-height: 16px;">USB to Micro</span>', NULL, '&#160;<span style="color: rgb(68, 68, 68); font-family: arial, sans-serif; font-size: small; line-height: 16px;">USB to Micro</span>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1341, 1, NULL, 73, 1, '23'),
(6466, 'y-2202', 'Y 2202', 'Y 2202', '&#160;', NULL, '&#160;Card đọc thẻ', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1350, 1, NULL, 25, 0, '23'),
(6467, 'y2141', 'Y-2141', 'Y-2141', '&#160;<span style="color: rgb(117, 117, 117); font-family: Arial, Helvetica, sans-serif; line-height: 19px;">1 x USB 2.0 4 Port Hub</span>', NULL, '<span style="color: rgb(0, 0, 0);">&#160;<span style="font-family: Arial, Helvetica, sans-serif; font-size: 18px;">USB2.0 4 Port Hub</span></span>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1352, 1, NULL, 24, 0, '23'),
(6468, 'y155', 'Y-155', 'Y-155', '&#160;USB to PS/2', NULL, '&#160;USB to PS/2', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1341, 1, NULL, 31, 0, '23'),
(6469, 'y260', 'Y-260', 'Y-260', '&#160;<span style="color: rgb(0, 0, 0);"><span style="font-family: Arial, Helvetica, sans-serif; font-size: 18px;">USB2.0 10M Active Extension cable</span></span>', NULL, '<span style="color: rgb(0, 0, 0);">&#160;<span style="font-family: Arial, Helvetica, sans-serif; font-size: 18px;">USB2.0 10M Active Extension cable</span></span>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1341, 1, NULL, 36, 0, '23'),
(6470, 'dyt1000', 'DYT-1000', 'DYT-1000', '&#160;hát thẻ,iphone,usb.FM', NULL, '&#160;loa hát thẻ usb và iphone', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 29, 0, '0'),
(6207, 'tenda-w302r', 'Tenda W302R', 'Tenda W302R', '<p class="MsoNormal" align="left" style="text-align: left; margin: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="font-size: x-small"><span lang="EN-US" style="font-family: Verdana; color: #666666; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体">Số cổng kết nối: 4 x RJ45 LAN, 1 RJ45 WAN</span></span><span lang="EN-US" style="font-family: Verdana; color: #666666; font-size: 5.5pt; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体"><o:p></o:p></span></p>\r\n<p class="MsoNormal" align="left" style="text-align: left; margin: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="font-size: x-small"><span lang="EN-US" style="font-family: Verdana; color: #666666; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体">Tốc độ truyền dữ liệu: 10/100Mbps,</span></span><span lang="EN-US" style="font-family: Verdana; color: #666666; font-size: 5.5pt; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体"><o:p></o:p></span></p>\r\n<p class="MsoNormal" align="left" style="text-align: left; margin: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="font-size: x-small"><span lang="EN-US" style="font-family: Arial; color: #006ba7">Cung cấp truyền 300Mbps </span></span></p>\r\n<p class="MsoNormal" align="left" style="text-align: left; margin: 0cm 0cm 0pt; mso-pagination: widow-orphan"><span style="font-size: x-small"><span lang="EN-US" style="font-family: Verdana; color: #666666; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体">Chuẩn giao tiếp: IEEE 802.11b, IEEE 802.11g, IEEE 802.11n</span></span><span lang="EN-US" style="font-family: Verdana; color: #666666; font-size: 5.5pt; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体"><o:p></o:p></span></p>\r\n<p><span style="font-size: x-small"><span lang="EN-US" style="font-family: Verdana; color: #666666; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: 宋体">Giao thức bảo mật: WPA, WEP, WPA2-PSK, 802.1x,</span></span></p>', NULL, '<p>Router Wireless 300Mbps</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 71, 1, NULL, 518, 0, '15'),
(6208, 'tenda-w311r', 'Tenda W311R', 'Tenda W311R', '<p><span style="font-size: x-small"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Tuân theo chuẩn IEEE 802.11n (draft 2,0), IEEE 802.11g, và IEEE 802.11b</span></span></p>\r\n<p><span style="font-size: x-small"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Đáp ứng 64/128-bit WEP, WPA, WPA2 và các tiêu chuẩn an ninh<br />\r\nCung cấp một 10/100Mbps Auto-Negotiation Ethernet WAN port <br />\r\nCung cấp bốn 10/100Mbps Auto-Negotiation Ethernet LAN ports</span></span></p>', NULL, '<p>Router Wireless 150Mbps</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 71, 1, NULL, 327, 0, '15'),
(6144, 'hyms258c', 'HY-MS258C', 'HY-MS258C', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">thích hợp với tất cả các loại windows</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột quang USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 419, 0, '0'),
(6145, 'hys156', 'HY-S156', 'HY-S156', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">thích hợp với tất cả các loại windows<o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột quang USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 263, 0, '0'),
(6155, 'hy2009', 'HY-2009', 'HY-2009', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span><span lang="EN-US" style="font-family: Arial; font-size: 6pt"><o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 306, 0, '10'),
(6380, '162', '162', '162', '<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: dimgray; padding-top: 0in; border-bottom: windowtext 1pt">Vật liệu nhôm và vật liệu nhựa ABS</span><span style="font-size: 9pt; color: dimgray"><br />\r\n<span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; padding-bottom: 0in; border-left: windowtext 1pt; padding-top: 0in; border-bottom: windowtext 1pt">Kích thước Kích thước 339 x 294 x 49 mm</span><br />\r\n</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Trọng lượng 867g</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Kích thước Fan 160 mm</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Power USB</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">tốc độ quạt 900 vòng / phút ± 15%</span></div>\r\n<span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">phù hợp laptop dưới 15inch</span>', NULL, 'quạt tỏa nhiệt laptop', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1336, 1, NULL, 251, 0, '22'),
(6379, '161', '161', '161', 'phù hợp với laptop dưới 15inch', NULL, 'quạt tỏa nhiệt laptop', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1336, 1, NULL, 236, 0, '22'),
(6203, '8139', '8139', '8139', '<p>card mạng 10/100Mbps dùng cho PC</p>', NULL, '<p>Tenda card mạng PC</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1326, 1, NULL, 291, 0, '15'),
(5844, 'crs006k', 'CRS006-K', 'CRS006-K', '<table cellspacing="0" cellpadding="0" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><strong>Description</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Support USB 2.0</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Support: MS/MS Duo/MS Pro/MS Pro Duo</td>\r\n        </tr>\r\n        <tr>\r\n            <td>*&nbsp;Adopt GL827 solution</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* The single disk sign displays</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Support LED for bus activities indication</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Support power saving mode for NoteBook solution</td>\r\n        </tr>\r\n        <tr>\r\n            <td>*&nbsp;Need use adapter to support: M2</td>\r\n        </tr>\r\n        <tr>\r\n            <td><strong>Specifications</strong><br />\r\n            * Product size: 70(L)&times;33(W)&times;13.5(H)mm</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Product weight: 0.021kg</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Colour: Green(362c)</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Material: ABS</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Working temperature: -20℃ to +65 ℃</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Humidity: 20% RH to 85% RH</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* System requirements: Windows 98/ME/2000/XP/Vista</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Macintosh OS 9.0 or Higher</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Linux Kerndl 2.4.1 or Higher</td>\r\n        </tr>\r\n        <tr>\r\n            <td><strong>Package</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Package size: 85(L)&times;60(W)mm</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Weight with package: 0.0205kg</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Carton size: 380(L)&times;290(W)&times;220(H)mm</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* N.W.: 4.1kg</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* G.W.: 4.6kg</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Q''TY: 200pcs</td>\r\n        </tr>\r\n    </tbody>\r\n</table>', NULL, '<p>SSK</p>\r\n<p>MS/MS Duo/MS Pro/MS Pro Duo</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 292, 0, '0');
INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(5845, 'ssk-0707', 'SSK 0707', 'SSK 0707', '<table cellspacing="0" cellpadding="0" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><strong>Description</strong></td>\r\n        </tr>\r\n        <tr>\r\n        </tr>\r\n        <tr>\r\n            <td>* Support USB 2.0</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* No driver needed (except windows 98)</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* No external power supply required</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* x1/x4/x8 data transmission</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* LED will flash to indicate the operation status</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Working power supply: 5V DC (supplied by computer through <br />\r\n            &nbsp; USB port)</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Support SD v1.0/v1.1/v2.0</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Support MMC v3.X/v4.0/v4.1/v4.2</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Need use adapter to support Mini SD/Micro SD/T-FLASH/MMC</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; Micro</td>\r\n        </tr>\r\n        <tr>\r\n            <td><strong>Specification</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Dimensions: 63.8(L)&times;22(W)&times;12.3(H)mm</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Weight: 0.014kg</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Interface: Blue</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Material: Aluminum alloy+PC</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Operation Temperature: -20℃ to +60℃</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Storage Humidity: 20% RH to 80% RH</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* System Requirements:Windows 98/ME/2000/XP/Vista<br />\r\n            &nbsp; Macintosh OS 9.0 or later Linux Kernel 2.4.1 or later</td>\r\n        </tr>\r\n        <tr>\r\n            <td><strong>Package </strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td>* MEAS: 500(L)&times;410(W)&times;335(H)mm</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* N.W.: 3.95kg</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* G.W.: 4.95kg</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Q''TY: 100pc</td>\r\n        </tr>\r\n    </tbody>\r\n</table>', NULL, '<p>Support SD /MMC</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 337, 0, '0'),
(5846, 'ssk-0712', 'SSK 0712', 'SSK 0712', '<table cellspacing="0" cellpadding="0" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td>* Support USB 2.0</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* High speed transmission port,transfers rate is up to 480Mbps</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Compatible USB1.1 standard port downwards</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* 4 insertion ports,4 disk signs display,exchange data directly</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; between all kinds of memory cards</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Adopt new high speed CMOS chip</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Support the latest CF 3.0 (16-bit IDE mode),SD 2.0 (HS-SD),MMC</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; 4.0 (8-bit),MS Pro parallel mode (4-bit),XD 1.2,etc. large capacity</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; high speed memory card</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Support memory card''s types:</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;SmartMedia(SM) Card</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; XD/XD H Type /XD M TYPE</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;CFI/CF II/Ultra II CF/Extreme CF/Extreme IIICF/MD</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;SD/Extreme SD/ExtremeIII SD/Ultra II SD/MMCI/MMCII/MMC 4.0/</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;Ultra MMC</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; MS/MS-Pro/MS-Duo/MS Pro Duo/Extreme MS Pro/ExtremeIII</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; MS Pro/HS MS-MG Pro Duo/MS-MagicGate/MS-MG-Pro/</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; MS-MG-Duo/MS-MG-Pro-Duo/MS-ROM/HS MS/MG Pro/Ultra II MS</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;Use the relevant adapter to support:</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;Mini SD/Micro SD/T-FLASH/MMC Micro/RS-MMC/HS RS MMC/M 2</td>\r\n        </tr>\r\n        <tr>\r\n            <td><strong>Specification</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Product size: 72(L)&times;48.4(W)&times;15.2(H)mm</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Product weight: 0.0441kg</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Colour: Black</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Material: Aluminum alloy</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Working temperature: -20℃ to +65 ℃</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Humidity: 20% RH to 85% RH</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* System requirements:</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; Windows 98/ME/2000/XP/Vista</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; Macintosh OS 9.0 or Higher</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; Linux Kerndl 2.4.1 or Higher</td>\r\n        </tr>\r\n    </tbody>\r\n</table>', NULL, '<p>All in One</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 350, 0, '0'),
(5847, 'slai2', 'SLAI-2', 'SLAI-2', '<table cellspacing="0" cellpadding="0" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><strong>Features</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td>* NO support SM and XD card</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* No driver needed (except windows 98)</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* No adapter required for mini SD</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* With Logo place</td>\r\n        </tr>\r\n        <tr>\r\n            <td><strong>Specifications</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Memory Slots:</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; MS Slot: MS, MS-DUO, MS Pro, MS PRO-Duo, MS MagicGate,</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MS Pro MagicGate, MS-Duo MagicGate, MS Pro-DUO</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MagicGate etc.</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; CF Slot: CF I/II,CF Ultra II,CF Extreme III,Micro Drive, Magicstor</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; SD Slot: SD, miniSD, MMC-I, MMC-II, MMC4.0, MMC Dual Voltage,</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RS-MMC,RS-MMC Dual Voltage,RS-MMC 4.0,T-Flash,</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Micro SD,etc.</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Indicator: Power &amp; Data accessing indicators</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Material: ABS</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Operatin Temperature: -20℃ to +60℃</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Storage Humidity: 20% RH to 80% RH</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Weight: 22g</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Dimensions: 90(L)&times;27(W)&times;12.6(H)mm</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* OS Supported:</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; Windows 98/ME/2000/XP/Vista</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; Macintosh OS 9.0 or Higher</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp; Linux Kerndl 2.4.1 or Higher</td>\r\n        </tr>\r\n        <tr>\r\n            <td><strong>Package</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Package method:Neutral Gift Box; Neutral Blister; Bubble Bag</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Weight with Package/g: 94; 88; 24</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* QTY/ctn.: 100; 100; 200</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* Carton Size/cm: 72*44*22; 48.5*42.5*24; 38*29*22</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* G.W./kg: 10.4; 9.6; 5.3</td>\r\n        </tr>\r\n        <tr>\r\n            <td>* N.W./kg: 9.4; 8.8; 4.8</td>\r\n        </tr>\r\n    </tbody>\r\n</table>', NULL, '<p>SSK</p>\r\n<p>No adapter required for mini SD</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1248, 1, NULL, 305, 0, '0'),
(6358, 'a-91', 'A 91', 'A 91', 'Fan CPU socket 775', NULL, '<p>Fan CPU</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1333, 1, NULL, 220, 0, '22'),
(6359, 'anpha-400-plus', 'ANPHA 400 Plus', 'ANPHA 400 Plus', '<ul class="prod_feat_list1">\r\n    <p class="application_title"><strong><span id="UcPABound1_prod_abound_ctl00_lblABoundNameParent"><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="53" style="border-top-width: 0px; padding-right: 0px; background-position: 0% 0%; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background-attachment: scroll; background-image: none; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; background-repeat: repeat; border-right-width: 0px; outline: 0">Intel Socket 130W</font></font></span></strong> <br />\r\n    <span class="italic" id="UcPABound1_prod_abound_ctl00_ltAboundServies"><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="54" style="border-top-width: 0px; padding-right: 0px; background-position: 0% 0%; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background-attachment: scroll; background-image: none; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; background-repeat: repeat; border-right-width: 0px; outline: 0">LGA775</font></font></span> <br />\r\n    tản nhiệt DeepCool Alpha 400 plus - chỉ gắn cho Intel Socket 775. 4 ống đồng dẫn nhiệt (heatpipe) &amp; đế đồng lá nhôm cho hiệu quả cao</p>\r\n</ul>\r\n<ul id="UcPABound1_prod_abound_ctl00_bulPars">\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="55" style="border-top-width: 0px; padding-right: 0px; background-position: 0% 0%; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background-attachment: scroll; background-image: none; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; background-repeat: repeat; border-right-width: 0px; outline: 0">Core 2 Extreme</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="56" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0">Core 2 Quad</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="57" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: #e6ecf9; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; color: #000; padding-top: 0px; border-right-width: 0px; outline: 0">Core 2 Duo</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="58" style="border-top-width: 0px; padding-right: 0px; background-position: 0% 0%; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background-attachment: scroll; background-image: none; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; background-repeat: repeat; border-right-width: 0px; outline: 0">Pentium Dual-Core</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="59" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0">Pentium D / Pentium 4</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="60" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0">Celeron Dual-Core</font></font></li>\r\n    <li><font style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0"><font closure_uid_olng8h="61" style="border-top-width: 0px; padding-right: 0px; display: inline; padding-left: 0px; border-left-width: 0px; font-size: 100%; background: none transparent scroll repeat 0% 0%; border-bottom-width: 0px; padding-bottom: 0px; margin: 0px; vertical-align: baseline; padding-top: 0px; border-right-width: 0px; outline: 0">Celeron / Celeron D </font></font></li>\r\n</ul>', NULL, 'FAN CPU', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1333, 1, NULL, 214, 0, '22'),
(6135, 'hy258c', 'HY-258C', 'HY-258C', '<p><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">thích h</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ợ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">p v</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ớ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i&#160;t</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ấ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">t c</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ả</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial"> ca</span><span lang="VI" style="font-family: &quot;Times New Roman&quot;; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: VI; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">́c</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">&#160;lo</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ạ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i windows</span></p>', NULL, '<p>CHUỘT QUANG USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 299, 0, '0'),
(5850, 'cap-vga-3-in-1', 'Cáp VGA 3 in 1', 'Cáp VGA 3 in 1', '<p>D&ugrave;ng cho Data &amp; KWM Switch</p>', NULL, '<p>D&ugrave;ng cho Data &amp; KWM Switch</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 267, 0, '0'),
(5851, 'kwm-switch', 'KWM Switch', 'KWM Switch', '<p>D&ugrave;ng 2 CPU -&gt; 1 m&agrave;n h&igrave;nh hay 4 CPU-&gt; 1 m&agrave;n h&igrave;nh, c&oacute; n&uacute;t nhấn chuyển m&aacute;y.</p>', NULL, '<p>2-&gt;1, 4-&gt;1</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 266, 0, '0'),
(5852, 'data-switch', 'Data Switch', 'Data Switch', '<p>D&ugrave;ng 2 CPU -&gt; 1 m&agrave;n h&igrave;nh hay 4 CPU-&gt; 1 m&agrave;n h&igrave;nh, c&oacute; n&uacute;t&nbsp;xoay chuyển m&aacute;y</p>', NULL, '<p>2-&gt;1; 4-&gt;1</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 253, 0, '0'),
(5853, 'data-usb', 'Data USB', 'Data USB', '<div style="overflow: auto">\r\n<p>D&ugrave;ng 2 CPU -&gt; 1 m&aacute;y in hay 4 CPU-&gt; 1 m&aacute;y in, cổng USB ,&nbsp;c&oacute; n&uacute;t &nbsp;xoay chuyển m&aacute;y.</p>\r\n</div>', NULL, '<p>2-&gt;1; 4-&gt;1</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 259, 0, '0'),
(6170, 'hy201', 'HY-201', 'HY-201', '<p>sử dụng nguồn USB từ máy tính</p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 305, 0, '10'),
(5860, 'clv-2001', 'CLV 2001', 'CLV 2001', '<p>Bàn phím cổng USB, 105 keys</p>', NULL, '<p>Colorvis</p>\r\n<p>USB, 105 keys</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 12, 1, NULL, 331, 0, '0'),
(5861, 'sm320', 'SM-320', 'SM-320', '<p>ps2/ quang</p>', NULL, '<p>Somic</p>\r\n<p>ps2/ quang</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 304, 0, '0'),
(5864, 'cap-1394', 'Cáp 1394', 'Cáp 1394', '', NULL, '<p>2 đầu 1394 lớn</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 257, 0, '0'),
(5865, 'cap-usb-ipod', 'Cáp USB Ipod', 'Cáp USB Ipod', '<p>D&ugrave;ng cho nhiều loại ipod.</p>', NULL, '<p>D&ugrave;ng cho nhiều loại ipod.</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 175, 0, '0'),
(5866, 'cap-lpt', 'Cáp LPT', 'Cáp LPT', '<p>1.2m, 3m, 5m...2 đầu 25pin kim.</p>', NULL, '<p>1.2m, 3m, 5m...2 đầu 25pin</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 166, 0, '0'),
(5867, 'usb-noi-dai', 'USB Nối Dài', 'USB Nối Dài', '<p>1.2m, 3m, 5m,...</p>', NULL, '<p>1.2m, 3m, 5m,...</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 158, 0, '0'),
(5868, 'cap-vga', 'Cáp VGA', 'Cáp VGA', '<p>1m2, 3m, 5m, ...2 đầu 15 pin kim</p>', NULL, '<p>1m2, 3m, 5m</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 171, 0, '0'),
(6169, 'hy210', 'HY-210', 'HY-210', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span><span lang="EN-US" style="font-family: Arial; font-size: 6pt"><o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 262, 0, '10'),
(5900, 'smg1000', 'SM-G1000', 'SM-G1000', '<p>SOMIC, USB, Quang, D&acirc;y</p>', NULL, '<p>SOMIC</p>\r\n<p>USB, Quang, D&acirc;y</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 315, 0, '0'),
(6096, 'box-25-sata-she-026', 'Box 2.5 sata SHE 026', 'Box 2.5 sata SHE 026', '<p>&#160;</p>', NULL, '<p>Box 2.5 sata&#160; usb</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1289, 1, NULL, 317, 0, '0'),
(5884, 's528', 'S528', 'S528', '<p>USB, Quang, d&acirc;y, 800 DPI</p>', NULL, '<p>USB, Quang, d&acirc;y, 800 DPI</p>\r\n<p>SOMIC</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 307, 0, '0'),
(5885, 's230', 'S230', 'S230', '<p>USB, QUANG, D&Acirc;Y R&Uacute;T, 800DPI</p>', NULL, '<p>SOMIC</p>\r\n<p>USB, QUANG, D&Acirc;Y R&Uacute;T, 800DPI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 316, 0, '0'),
(5886, 'k610', 'K610', 'K610', '<p>USB, QUANG, D&Acirc;Y, 800DPI</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, QUANG, D&Acirc;Y, 800DPI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 309, 0, '0'),
(5887, 'mini-logitech', 'Mini Logitech', 'Mini Logitech', '<p>USB, QUANG, D&Acirc;Y</p>', NULL, '<p>USB, QUANG, D&Acirc;Y</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 317, 0, '0'),
(5888, 'k630', 'K630', 'K630', '<p>USB, QUANG, D&Acirc;Y R&Uacute;T, 800DPI</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, QUANG, D&Acirc;Y R&Uacute;T, 800DPI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 304, 0, '0'),
(5890, 'k609', 'K609', 'K609', '<p>USB, QUANG, D&Acirc;Y</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, QUANG, D&Acirc;Y</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 299, 0, '0'),
(5891, 's520', 'S520', 'S520', '<p>USB, QUANG, D&Acirc;Y, 800DPI</p>', NULL, '<p>SOMIC</p>\r\n<p>USB, QUANG, D&Acirc;Y, 800DPI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 310, 0, '0'),
(6174, '301-ps2', '301 PS2', '301 PS2', '<p>chuột sử dụng cổng PS/2</p>', NULL, '<p>chuột vi tinh</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 272, 0, '8'),
(6175, 'k616', 'K616', 'K616', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">chuột USB  hợp với tất cả các loại windows</span></p>', NULL, '<p>CHUỘT VI TÍNH</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 287, 0, '8'),
(6176, 'k610', 'K610', 'K610', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">chuột USB phù hợp với tất cả các loại windows</span></span></span></span></p>', NULL, '<p>Chuột vi tinh USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 283, 0, '8'),
(6177, '308', '308', '308', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột USB dây phù hợp với tất cả các loại windows<o:p></o:p></span></p>', NULL, '<p>chuột vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 269, 0, '8'),
(6168, 'hy430', 'HY-430', 'HY-430', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 283, 0, '10'),
(6167, 'hy280', 'HY-280', 'HY-280', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span><span lang="EN-US" style="font-family: Arial; font-size: 6pt"><o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 269, 0, '10'),
(6166, 'hy610f', 'HY-610F', 'HY-610F', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 263, 0, '10'),
(6165, 'hy207', 'HY-207', 'HY-207', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 265, 0, '10'),
(6163, 'hy220', 'HY-220', 'HY-220', '<p>&#160;</p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 285, 0, '10'),
(6164, 'hy206', 'HY-206', 'HY-206', '<p>sử dụng nguồn USB từ máy tính</p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 283, 0, '10'),
(6162, 'hy310bt', 'HY-310BT', 'HY-310BT', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 275, 0, '10'),
(6161, 'hy9500-ii', 'HY-9500 II', 'HY-9500 II', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span><span lang="EN-US" style="font-family: Arial; font-size: 6pt"><o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 298, 0, '10'),
(5917, 'c031', 'C031', 'C031', '<p>Cổng USB, Rung</p>', NULL, '<p>Cổng USB, Rung</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1272, 1, NULL, 400, 0, '0'),
(5918, 'c033', 'C033', 'C033', '<p>Cổng USB, Rung</p>', NULL, '<p>Cổng USB, Rung</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1272, 1, NULL, 414, 0, '0'),
(5919, 'v37', 'V37', 'V37', '<p>Cổng USB, Rung</p>', NULL, '<p>Cổng USB, Rung</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1272, 1, NULL, 395, 0, '0'),
(5920, 'game-doi-thuong', 'GAME ĐÔI (Thường)', 'GAME ĐÔI (Thường)', '<p>Cổng USB, Không Rung</p>', NULL, '<p>COLORVIS</p>\r\n<p>Cổng USB, Không Rung</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1345, 1, NULL, 341, 0, '0'),
(5921, 'km06', 'KM-06', 'KM-06', '<p>Cổng USB, Kh&ocirc;ng Rung</p>', NULL, '<p>KING-MASTER</p>\r\n<p>Cổng USB, Kh&ocirc;ng Rung</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1272, 1, NULL, 418, 0, '0'),
(5922, 'v36', 'v36', 'v36', '<p>Cổng USB,&nbsp;Rung</p>', NULL, '<p>NAZAR</p>\r\n<p>Cổng USB, Rung</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1272, 1, NULL, 394, 0, '0'),
(5923, 'km66', 'KM-66', 'KM-66', '<p>Cổng USB,&nbsp;Rung</p>', NULL, '<p>KING-MASTER</p>\r\n<p>Cổng USB, Rung</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1272, 1, NULL, 903, 0, '0'),
(5924, 'cvp70', 'CVP-70', 'CVP-70', '<p>Cổng USB,&#160;Rung</p>', NULL, '<p>COLORVIS</p>\r\n<p>Cổng USB,&#160;Rung</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1345, 1, NULL, 346, 0, '0'),
(5925, 'km88', 'KM-88', 'KM-88', '<p>Cổng USB, Rung</p>', NULL, '<p>KING-MASTER</p>\r\n<p>Cổng USB,&nbsp;Rung</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1272, 1, NULL, 995, 0, '0'),
(5926, 'hitach-sata', 'HITACH  SATA', 'HITACH  SATA', '<p>Box đựng Ổ cứng SATA của m&aacute;y Laptop cắm cổng USB hoặc SATA</p>', NULL, '<p>HDD 2.5 SATA&nbsp; Cổng USB&nbsp;Hoặc&nbsp;Sata</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1289, 1, NULL, 292, 0, '0'),
(5929, 'ssk0618', 'SSK-0618', 'SSK-0618', '<p>Box đựng Ổ cứng Laptop, IDE, kết nối cổng USB để truyền dữ liệu</p>', NULL, '<p>HDD2.5, IDE, USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1289, 1, NULL, 287, 0, '0'),
(6315, 'card-tv-pt228f', 'Card TV PT228F', 'Card TV PT228F', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt; line-height: 115%"><span style="font-size: 11pt; line-height: 115%">khe cắm PCI để xem truyền hình trên máy tính </span></div>\r\n<div style="margin: 0in 0in 10pt; line-height: 115%"><span style="font-size: 11pt; line-height: 115%">Nhận </span><span style="font-size: 11pt; line-height: 115%">t</span><span style="font-size: 11pt; line-height: 115%">ín hiệu TV/VCD/DVD/</span><span style="font-size: 11pt; line-height: 115%"> radio FM</span></div>\r\n<div style="margin: 0in 0in 10pt; line-height: 115%"><span style="font-size: 11pt; line-height: 115%">Tương thích với WINDOWS98/98SE/ME/2000/XP/VISTA.</span></div>\r\n<div style="margin: 0in 0in 10pt; line-height: 115%"><span style="font-size: 11pt; line-height: 115%">Capture có chất lượng cao hình ảnh động và tĩnh, thu thập hình ảnh mượt mà và rõ ràng</span></div>', NULL, '<p>Card TV dùng cho PC</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1319, 1, NULL, 270, 0, '14'),
(5932, 'ssk0607', 'SSK-0607', 'SSK-0607', '<p>Box đựng Ổ cứng Laptop, IDE, kết nối cổng USB để truyền dữ liệu, c&oacute; đặt kh&oacute;a v&acirc;n tay.</p>', NULL, '<p>HDD 2.5, IDE, USB, Kh&oacute;a V&acirc;n Tay</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1289, 1, NULL, 305, 0, '0'),
(5933, 'ssk0510', 'SSK-0510', 'SSK-0510', '<p>Box đựng Ổ cứng Laptop, IDE, kết nối cổng USB để truyền dữ liệu</p>', NULL, '<p>HDD 2.5, IDE, USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1289, 1, NULL, 299, 0, '0'),
(5935, 's260', 'S260', 'S260', '<p>USB, Quang, D&acirc;y</p>', NULL, '<p>SOMIC</p>\r\n<p>USB, Quang, D&acirc;y</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 327, 0, '0'),
(6094, 'den-usb', 'đèn USB', 'đèn USB', '<p>&#160;xài nguồn USB</p>', NULL, '<p>&#160;nhiều màu</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 236, 0, '0'),
(5943, '413', '413', '413', '<p>Quang, Kh&ocirc;ng D&acirc;y</p>', NULL, '<p>COLORVIS</p>\r\n<p>Quang, Kh&ocirc;ng D&acirc;y</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 299, 0, '0'),
(5944, 'g3', 'G3', 'G3', '<p>Chuột Quang, Kh&ocirc;ng D&acirc;y</p>', NULL, '<p>COLORVIS</p>\r\n<p>Quang, Kh&ocirc;ng D&acirc;y</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 300, 0, '0'),
(6178, 'k630', 'K630', 'K630', '<p><span lang="EN-US" style="font-size: 10pt; font-family: Arial">chuột USB dây phù hợp với tất cả các loại windows<o:p></o:p></span></p>', NULL, '<p>CHUỘT VI TÍNH</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 285, 0, '8'),
(5949, '2405', '2405', '2405', '<p>B&agrave;n Ph&iacute;m COLORVIS, Cổng PS2, Nhỏ Gọn</p>', NULL, '<p>COLORVIS</p>\r\n<p>Cổng PS2, Nhỏ Gọn</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 12, 1, NULL, 320, 0, '0'),
(6319, 'tv-3820e', 'TV 3820E', 'TV 3820E', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in"><font size="3"><font face="Times New Roman">Xem TV trên màn hình CRT <o:p></o:p></font></font></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">không cần phần mềm không chiếm dụng CPU hoặc bộ nhớ</span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in"><o:p></o:p></span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-ansi-language: EN-US; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-font-kerning: 1.0pt">Tích hợp loa ngoài dễ dàng chuyển đổi giữa PC--&gt;TV và ngược lại</span></p>', NULL, '<p><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 10.5pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-size: 12.0pt; mso-font-kerning: 1.0pt">Xem TV trên màn hình CRT </span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1320, 1, NULL, 268, 0, '14'),
(6424, 'km155s', 'KM-155S', 'KM-155S', 'keyboar số USB 2.0', NULL, 'Key board', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1338, 1, NULL, 221, 0, '10'),
(5951, 's302', 'S302', 'S302', '', NULL, '<p>Apple</p>\r\n<p>Nguồn USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 325, 0, '0'),
(5954, 'ban-notebook', 'BÀN NOTEBOOK', 'BÀN NOTEBOOK', '', NULL, '<p>TPOP</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 232, 0, '0'),
(6098, 'adapter-90w', 'adapter 90W', 'adapter 90W', '<p>sạc notebok đa năng từ 15v đến 24v</p>', NULL, '<p>sạc notebok</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 275, 0, '0'),
(6099, 'sac-notebok-car', 'sạc notebok car', 'sạc notebok car', '<p>sạc notebok lấy từ nguồn xe hơi đa năng từ 15v đến 24v</p>', NULL, '<p>sạc notebok từ nguồn xe hơi</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 268, 0, '0'),
(6100, 'dc-to-ac', 'DC to AC', 'DC to AC', '<p>DC12v to&#160; AC220v 150W-200W-300W chuyên dùng cho xe hơi</p>', NULL, '<p>DC12v to&#160; AC220v</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 140, 0, '0'),
(6309, 'nogo-i30', 'NOGO i30', 'NOGO i30', '<p>support USB/SD/PC/MOBILE/MP3/FM</p>', NULL, '<p>loa đa năng</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 349, 0, '0'),
(6407, 'hy9300', 'HY-9300', 'HY-9300', 'thích hợp mọi windows<br />\r\ncổng giao tiếp usb 2.0', NULL, 'Bàn phím chuột không dây', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1338, 1, NULL, 260, 0, '10'),
(6107, 'asl2', 'AS-L2', 'AS-L2', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">hát được USB+SD+PC+LAPTOP</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial"><o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">Loa đa năng<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 229, 0, '0'),
(5983, '870', '870', '870', '<p>USB, gọi điện thoại skype qua mạng internet.</p>', NULL, '<p>Skype Phone, LCD</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 169, 0, '0'),
(6409, 'y1062', 'Y-1062', 'Y-1062', '<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span style="font-size: 9pt; font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore">-<span style="font: 7pt &quot;Times New Roman&quot;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span lang="VI" style="font-size: 9pt; font-family: Arial; mso-ansi-language: VI">Đế gắn 2.5" &amp; 3.5" SATA<br />\r\n- Giao tiếp USB 2.0 + eSATA <br />\r\n- Tích hợp USB Hub<br />\r\n- Reader SD/MS/CF/T-Flash</span><span style="font-size: 9pt; font-family: Arial"><o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span class="apple-style-span"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font size="3">-</font><span style="font: 7pt &quot;Times New Roman&quot;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span></span><span class="apple-style-span"><span style="font-size: 10pt; color: #333333; font-family: Arial">One Touch Backup function<br />\r\n<span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 12pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: &quot;Times New Roman&quot;; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Tương thích với Win 98/ME/2000/XP/Vista / MAC OS 9.X/10.X / Linux</span></span></span></p>', NULL, '<p>Box HDD 2.5-3.5 SATA</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1340, 1, NULL, 243, 0, '23'),
(5987, 'choi-quet-vi-tinh', 'Chổi Quét Vi Tính', 'Chổi Quét Vi Tính', '', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 165, 0, '0'),
(5988, 'hop-cdr-maxell', 'Hộp CD-R MAXELL', 'Hộp CD-R MAXELL', '', NULL, '<p>Hộp 50 CD-R</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 179, 0, '0'),
(5989, '388', '388', '388', '<p>Massager&nbsp; mini sử dụng điện USB</p>', NULL, '<p>Massager USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 158, 0, '0'),
(5990, '203', '203', '203', '<p>H&uacute;t bụi m&aacute;y t&iacute;nh lấy điện bằng USB</p>', NULL, '<p>H&uacute;t Bụi USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 162, 0, '0'),
(5995, 'chui-kk-64m', 'Chùi KK 64M', 'Chùi KK 64M', '', NULL, '<p>D&ugrave;ng Cho C&aacute;c Loại M&agrave;n H&igrave;nh</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 179, 0, '0'),
(5994, 'hut-bui-usb-moi', 'Hút Bụi USB Mới', 'Hút Bụi USB Mới', '', NULL, '<p>Sử Dụng Điện USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 163, 0, '0'),
(6154, 'hy9500', 'HY-9500', 'HY-9500', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">loa 2.1 nguồn 220V thích hợp với các loai PC+LAPTOP+DVD+CD+VCD+MP3</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 534, 1, '10'),
(6393, 'm10', 'M-10', 'M-10', 'Loa hát thẻ nhớ SD và USB PC Laptop<br />\r\npin sạc có thể tháo rời thay thế được', NULL, 'Loa mini', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1343, 1, NULL, 240, 0, '14');
INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(6006, 'cap-link-usb-20', 'Cáp Link USB 2.0', 'Cáp Link USB 2.0', '<p>D&ugrave;ng Nối 2 M&aacute;y T&iacute;nh Bằng Cổng USB</p>', NULL, '<p>D&ugrave;ng Nối 2 M&aacute;y T&iacute;nh Bằng Cổng USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 159, 0, '0'),
(6007, 'kvm-switch-cable-aten-cs64a', 'KVM Switch Cable Aten CS64A', 'KVM Switch Cable Aten CS64A', '<p>1 bộ Keyboard/ Vga/ Mouse -&gt; 4CPU</p>\r\n<p><strong>Th&ocirc;ng tin chi tiết của sản phẩm<br />\r\n</strong>\r\n<table cellspacing="0" cellpadding="0" width="386" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td background="../images/p_titlebg.gif">\r\n            <table cellspacing="0" cellpadding="0" width="386" border="0">\r\n                <tbody>\r\n                    <tr>\r\n                        <td class="productitle" valign="middle" align="left"><font size="2">Features </font></td>\r\n                        <td valign="middle" align="center" width="40"><font size="2"><img height="7" src="http://www.aten.com/images/p_menu_darrow.gif" width="19" alt="" /></font></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign="top" align="center">\r\n            <table cellspacing="0" cellpadding="0" width="95%" border="0">\r\n                <tbody>\r\n                    <tr>\r\n                        <td height="8"><font size="2"><img height="1" src="http://www.aten.com/images/blank.gif" width="1" alt="" /></font></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td valign="top" align="center">\r\n                        <table cellspacing="4" cellpadding="0" width="95%" border="0">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">One PS/2 console controls 4 computers </font></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">Compact design, built in 1.8m cables </font></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">All-in-one design </font></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">With speaker support </font></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">Superior video quality- up to 2048 x 1536; DDC2B </font></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">Auto Scan function to monitor computer operation </font></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">Non-powered </font></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">OS Support:Windows 2000, Windows XP, </font><a href="http://www.aten.com/data/quick_finder/vista/vista.htm" target="_blank"><font size="2">Windows Vista</font></a><font size="2">, LINUX and FreeBSD</font></td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td height="10"><font size="2"><img height="1" src="http://www.aten.com/images/blank.gif" width="1" alt="" /></font></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="386" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td background="../images/p_titlebg.gif">\r\n            <table cellspacing="0" cellpadding="0" width="386" border="0">\r\n                <tbody>\r\n                    <tr>\r\n                        <td valign="middle" width="24" height="40"><font size="2"><img height="13" src="http://www.aten.com/images/p_titlebullet.gif" width="24" alt="" /> </font></td>\r\n                        <td class="productitle" valign="middle" align="left"><font size="2">Package Content </font></td>\r\n                        <td valign="middle" align="center" width="40"><font size="2"><img height="7" src="http://www.aten.com/images/p_menu_darrow.gif" width="19" alt="" /></font></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign="top" align="center">\r\n            <table cellspacing="0" cellpadding="0" width="95%" border="0">\r\n                <tbody>\r\n                    <tr>\r\n                        <td height="8"><font size="2"><img height="1" src="http://www.aten.com/images/blank.gif" width="1" alt="" /></font></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td valign="top" align="center">\r\n                        <table cellspacing="4" cellpadding="0" width="95%" border="0">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">1x KVM Switch </font></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">1x User Manual </font></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td valign="top" align="left" width="15"><font size="2"><img height="12" src="http://www.aten.com/images/p_bullet1.gif" width="15" vspace="3" alt="" /></font></td>\r\n                                    <td class="maintextg" valign="top" align="left"><font size="2">1x Quick Start Guide</font></td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td height="10"><font size="2"><img height="1" src="http://www.aten.com/images/blank.gif" width="1" alt="" /></font></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="386" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td background="../images/p_titlebg.gif">\r\n            <table cellspacing="0" cellpadding="0" width="386" border="0">\r\n                <tbody>\r\n                    <tr>\r\n                        <td valign="middle" width="24" height="40"><font size="2"><img height="13" src="http://www.aten.com/images/p_titlebullet.gif" width="24" alt="" /></font></td>\r\n                        <td class="productitle" valign="middle" align="left"><font size="2">Diagram </font></td>\r\n                        <td valign="middle" align="center" width="40"><font size="2"><img height="7" src="http://www.aten.com/images/p_menu_darrow.gif" width="19" alt="" /></font></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign="top" align="center">\r\n            <table cellspacing="0" cellpadding="0" width="95%" border="0">\r\n                <tbody>\r\n                    <tr>\r\n                        <td height="8"><font size="2"><img height="1" src="http://www.aten.com/images/blank.gif" width="1" alt="" /></font></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td valign="top" align="center"><a href="javascript:showDiagram(''20050427181510002.gif'',''CS64A'',''450'',''450'')"><font size="2"><img height="347" src="http://www.aten.com/doc_data/prdImages/20050427181510001.gif" width="352" border="0" alt="" /></font></a></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td class="maintextb2" valign="middle" align="left"><font size="2">+ </font><a href="javascript:showDiagram(''20050427181510002.gif'',''CS64A'',''450'',''450'')"><font size="2">View enlargement</font></a></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td height="20"><font size="2"><img height="1" src="http://www.aten.com/images/blank.gif" width="1" alt="" /></font></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="386" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td background="../images/p_titlebg.gif">\r\n            <table cellspacing="0" cellpadding="0" width="386" border="0">\r\n                <tbody>\r\n                    <tr>\r\n                        <td valign="middle" width="24" height="40"><font size="2"><img height="13" src="http://www.aten.com/images/p_titlebullet.gif" width="24" alt="" /></font></td>\r\n                        <td class="productitle" valign="middle" align="left"><font size="2">Specification </font></td>\r\n                        <td valign="middle" align="center" width="40"><font size="2"><img height="7" src="http://www.aten.com/images/p_menu_darrow.gif" width="19" alt="" /></font></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign="top" align="center">\r\n            <table cellspacing="0" cellpadding="0" width="95%" border="0">\r\n                <tbody>\r\n                    <tr>\r\n                        <td height="8"><font size="2"><img height="1" src="http://www.aten.com/images/blank.gif" width="1" alt="" /></font></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td valign="top" align="center">\r\n                        <table cellspacing="0" cellpadding="0" width="95%" border="0">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td>\r\n                                    <table cellspacing="0" cellpadding="5" width="100%" border="0">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td class="spect2" valign="top" align="left" colspan="3"><font size="2">Computer Connections</font></td>\r\n                                                <td class="spec2" valign="top" align="left" width="43%"><font size="2">4</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spect" valign="top" align="left" colspan="3"><font size="2">Port Selection</font></td>\r\n                                                <td class="spec" valign="top" align="left" width="43%"><font size="2">Hotkey</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spect" valign="top" align="left" width="21%" rowspan="8"><font size="2">Connectors</font></td>\r\n                                                <td class="spec" valign="top" align="left" width="17%" rowspan="4"><font size="2">Console Ports </font></td>\r\n                                                <td class="spec" valign="top" align="left" width="19%"><font size="2">Keyboard</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">1 x 6-pin Mini-DIN Female (Purple) </font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">Video</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">1 x HDB-15 Female (Blue)</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">Mouse</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">1 x 6-pin Mini-DIN Female (Green) </font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">Speaker </font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">1 x Mini Stereo Jack Female (Green)</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left" rowspan="4"><font size="2">KVM Ports</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">Keyboard</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">4 x 6-pin Mini-DIN Male (Purple)</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">Video </font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">4 x HDB-15 Male (Blue)</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">Mouse </font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">4 x 6-pin Mini-DIN Male (Green)</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">Speaker </font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">4 x Mini Stereo Plug Male(Green)</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spect" valign="top" align="left"><font size="2">LEDs</font></td>\r\n                                                <td class="spec" valign="top" align="left" colspan="2"><font size="2">Selected</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">4 x Green</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spect" valign="top" align="left"><font size="2">Cable Length</font></td>\r\n                                                <td class="spec" valign="top" align="left" colspan="2"><font size="2">Computers</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">1.8m</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spect" valign="top" align="left"><font size="2">Emulation</font></td>\r\n                                                <td class="spec" valign="top" align="left" colspan="2"><font size="2">Keyboard/Mouse</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">PS/2</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spect" valign="top" align="left" colspan="3"><font size="2">Video</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">2048 x1536; DDC2B </font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spect" valign="top" align="left" colspan="3"><font size="2">Scan Interval</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">5 Seconds</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spect" valign="top" align="left" rowspan="3"><font size="2">Environment</font></td>\r\n                                                <td class="spec" valign="top" align="left" colspan="2"><font size="2">Operating Temp.</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">0&deg;~50&deg;C</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left" colspan="2"><font size="2">Storage Temp.</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">-20&deg;~60&deg;C</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left" colspan="2"><font size="2">Humidity</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">0~80% RH, Non-condensing</font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spect" valign="top" align="left" rowspan="3"><font size="2">Physical Properties</font></td>\r\n                                                <td class="spec" valign="top" align="left" colspan="2"><font size="2">Housing</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">Plastic </font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left" colspan="2"><font size="2">Weight</font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">0.83 kg </font></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class="spec" valign="top" align="left" colspan="2"><font size="2">Dimensions ( L x W x H ) </font></td>\r\n                                                <td class="spec" valign="top" align="left"><font size="2">8.95 x 7.19 x 2.60cm </font></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>', NULL, '<p>4 M&aacute;y T&iacute;nh 1 M&agrave;n H&igrave;nh</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 169, 0, '0'),
(6012, 'power-500w-20p24p', 'POWER 500W (20P-24P)', 'POWER 500W (20P-24P)', '<p>&#160;</p>', NULL, '<p>D-Tetch</p>\r\n<p>Có<strong> 5 Đầu</strong> cắm nguồn, 1 SATA <strong>Fan</strong> 12cm</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1268, 1, NULL, 254, 0, '0'),
(6014, 'power-650w-20p4p-sp', 'POWER 650W (20P-4P) SP', 'POWER 650W (20P-4P) SP', '<p>&#160;</p>', NULL, '<p>D-Tetch</p>\r\n<p>Có&#160;<strong>4&#160;đầu</strong> cắm nguồn, <strong>Fan 12cm</strong> ,1 SATA,..</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1268, 1, NULL, 249, 0, '0'),
(6018, '2005-mic', '2005 +Mic', '2005 +Mic', '<div style="overflow: auto">\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>\r\n</div>', NULL, '<p>COLORVIS</p>\r\n<div style="overflow: auto">\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>\r\n</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 340, 0, '0'),
(6019, 'web-logitetch', 'Web LOGITETCH', 'Web LOGITETCH', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>\r\n</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 308, 0, '0'),
(6021, 'web-ban-chan', 'Web Bàn Chân', 'Web Bàn Chân', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 304, 0, '0'),
(6070, 'clv-1010a', 'CLV 1010A', 'CLV 1010A', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 375, 0, '0'),
(6024, 'cap-ipod-shuffle', 'Cáp Ipod Shuffle', 'Cáp Ipod Shuffle', '', NULL, '<p>Sạc &amp; Truyền Dữ Liệu Giữa M&aacute;y T&iacute;nh &amp; ipod</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 164, 0, '0'),
(6025, 'dau-doi-35mm25mm', 'Đầu Đổi 3.5mm->2.5mm', 'Đầu Đổi 3.5mm->2.5mm', '', NULL, '<p>D&ugrave;ng Đổi Đầu Jack Lớn Qua Nhỏ 2.5mm</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 157, 0, '0'),
(6026, 'dau-doi-25mm35mm', 'Đầu Đổi 2.5mm->3.5mm', 'Đầu Đổi 2.5mm->3.5mm', '', NULL, '<p>D&ugrave;ng Đổi Đầu Jack&nbsp;Nhỏ Qua&nbsp;Lớn 2.5mm</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 160, 0, '0'),
(6027, 'keo-tan-nhiet-ong', 'Keo Tản Nhiệt Ống', 'Keo Tản Nhiệt Ống', '', NULL, '<p>L&agrave;m M&aacute;t CPU</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 155, 0, '0'),
(6028, 'keo-tan-nhiet-hu', 'Keo Tản Nhiệt Hủ', 'Keo Tản Nhiệt Hủ', '', NULL, '<p>L&agrave;m M&aacute;t CPU</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 168, 0, '0'),
(6029, 'dau-doi-nokia-35mm', 'Đầu Đổi NOKIA ->3.5mm', 'Đầu Đổi NOKIA ->3.5mm', '', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 168, 0, '0'),
(6030, 'dong-ho-do-dien', 'Đồng Hồ Đo Điện', 'Đồng Hồ Đo Điện', '', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 169, 0, '0'),
(6031, 'o-mem-hop', 'Ổ Mềm Hộp', 'Ổ Mềm Hộp', '', NULL, '<p>1 Hộp 10 Đĩa</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 164, 0, '0'),
(6032, 'cap-audio', 'Cáp Audio', 'Cáp Audio', '', NULL, '<p>1 Đầu 2.5mm &amp; 1 Đầu 3.5mm</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 160, 0, '0'),
(6033, 'cap-usb-mini--jack-35mm', 'Cáp USB mini -> Jack 3.5mm', 'Cáp USB mini -> Jack 3.5mm', '', NULL, '<p>D&ugrave;ng Cho ĐT C&oacute; Cổng USB mini</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 158, 0, '0'),
(6034, 'pin-3a', 'Pin 3A', 'Pin 3A', '', NULL, '<p>1 Vĩ 2 Cục</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 160, 0, '0'),
(6137, 'hy278', 'HY-278', 'HY-278', '<p><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">thích h</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ợ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">p v</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ớ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">i&#160;t</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ấ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">t c</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ả</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial"> ca</span><span lang="VI" style="font-family: &quot;Times New Roman&quot;; font-size: 10pt; mso-ansi-language: VI">́c</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">&#160;lo</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-ascii-font-family: VNI-Times">ạ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-bidi-font-family: Arial">i windows<o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột&#160;quang USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 277, 0, '0'),
(6147, 'hy230', 'HY-230', 'HY-230', '<p>loa 2.1 nguồn AC220V</p>', NULL, '<p>Loa vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 283, 0, '10'),
(6148, 'hy260', 'HY-260', 'HY-260', '<p>loa 2.1 nguồn AC220V</p>', NULL, '<p>Loa vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 275, 0, '10'),
(6149, 'hy310p', 'HY-310P', 'HY-310P', '<p>loa 2.1 nguồn AC220V</p>', NULL, '<p>LOA VI TÍNH</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 182, 0, '10'),
(6051, 'sac-notebook-lcd-019', 'Sạc NoteBook LCD 019', 'Sạc NoteBook LCD 019', '', NULL, '<p>Adapter D&ugrave;ng Cho Nhiều D&ograve;ng Notebooks</p>\r\n<p>C&oacute; N&uacute;t Chuyển D&ograve;ng Điện</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 164, 0, '0'),
(6052, 'cap-video-for-ipod', 'Cáp Video For Ipod', 'Cáp Video For Ipod', '', NULL, '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 162, 0, '0'),
(6053, 'khoa-so-notebooks', 'Khóa Số NoteBooks', 'Khóa Số NoteBooks', '', NULL, '<p>2 Loại Thường &amp; Xịn</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 174, 0, '0'),
(6054, 'khoa-chia-notebooks', 'Khóa Chìa NoteBooks', 'Khóa Chìa NoteBooks', '', NULL, '<p>2 Loại Thường &amp; XỊn</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 159, 0, '0'),
(6057, 'cuc-chuyen-mp3-hop-2gb3-in-1', 'Cục Chuyển mp3 Hộp 2Gb(3 in 1)', 'Cục Chuyển mp3 Hộp 2Gb(3 in 1)', '', NULL, '<p>D&ugrave;ng Cho Xe Hơi C&oacute; Bộ Nhớ 2Gb, Khe Đọc Thẻ Nhớ</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 170, 0, '0'),
(6058, 'cuc-chuyen-mp3-iso9002', 'Cục Chuyển mp3 ISO9002', 'Cục Chuyển mp3 ISO9002', '', NULL, '<p>D&ugrave;ng Cho Xe Hơi, Kh&ocirc;ng C&oacute; Bộ Nhớ Trong</p>\r\n<p>Chỉ C&oacute; D&ugrave;ng USB Hoặc Thẻ Nhớ</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 164, 0, '0'),
(6152, 'hy760', 'HY-760', 'HY-760', '<p>loa 2.1 nguồn 220V</p>', NULL, '<p>loa vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 179, 0, '10'),
(6064, 'clv-2006', 'CLV 2006', 'CLV 2006', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 308, 0, '0'),
(6065, 'jvc-310', 'JVC 310', 'JVC 310', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 301, 0, '0'),
(6066, 'clv-3003', 'CLV 3003', 'CLV 3003', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 305, 0, '0'),
(6067, 'clv-1001a', 'CLV 1001A', 'CLV 1001A', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>COLORVIS (Kh&ocirc;ng Cần Driver)</p>\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 306, 0, '0'),
(6068, 'clv-1011a', 'CLV 1011A', 'CLV 1011A', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 335, 0, '0'),
(6069, 'clv-1011b', 'CLV 1011B', 'CLV 1011B', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 317, 0, '0'),
(6071, 'clv-1010b', 'CLV 1010B', 'CLV 1010B', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 309, 0, '0'),
(6072, 'clv-306', 'CLV 306', 'CLV 306', '<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>COLORVIS</p>\r\n<p>USB, độ ph&acirc;n giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 320, 0, '0'),
(6074, 'pc-lock', 'PC LOCK', 'PC LOCK', '', NULL, '<p>Kh&oacute;a M&aacute;y T&iacute;nh</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 160, 0, '0'),
(6075, 'usb-noi-dai-xin', 'USB Nối Dài (Xịn)', 'USB Nối Dài (Xịn)', '', NULL, '<p>Z-Tek</p>\r\n<p>D&agrave;i 5 m</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 167, 0, '0'),
(6126, 'cpadhub', 'C-PAD+HUB', 'C-PAD+HUB', '<p>quạt dành cho notebok co 2 cổng USB</p>', NULL, '<p>quạt làm mát notebok</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 275, 0, '0'),
(6283, 'clv1009', 'clv-1009', 'clv-1009', '<p><span style="font-family: &quot;.VnTime&quot;; font-size: 14pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">độ ph©n giải 640x480. PC &amp; NOTEBOOK</span></p>', NULL, '<p><span style="font-family: &quot;.VnTime&quot;; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">C</span><span style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">ổng giao tiếp USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 308, 0, '8'),
(6371, '198', '198', '198', 'màu sắc.............đen có đèn xanh<br />\r\nnhựa....................ABS<br />\r\nkích thước Fan...200mm<br />\r\nnguồn...................USB', NULL, 'quạt tỏa nhiệt laptop', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1336, 1, NULL, 248, 0, '22'),
(6151, 'hy2008', 'HY-2008', 'HY-2008', '<p>loa 2.1 nguồn AC22V</p>', NULL, '<p>Loa vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 534, 1, '10'),
(6146, 'hy268', 'HY-268', 'HY-268', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">thích hợp với tất cả các loại windows</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột quang USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 224, 0, '0'),
(6097, 'adapter-70w', 'adapter 70w', 'adapter 70w', '<p>sạc notebok 70w đa năng</p>', NULL, '<p>sạc notebok</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 248, 0, '0'),
(6457, 'w309r', 'W309R', 'W309R', '&#160;<strong style="text-align: justify;"><span style="font-size: 24pt; font-family: Tahoma;">Đặc điểm nổi bật:</span></strong>\r\n<h2 style="margin:0cm;margin-bottom:.0001pt;text-align:justify;text-justify:\r\ninter-ideograph;mso-line-height-alt:17.25pt"><strong><span style="font-family: Tahoma;">Bộ phát không dây Tenda chuẩn N 300Mbps W309R- 2 anten 7 Dpi</span></strong><span style="font-family: Tahoma;"><o:p></o:p></span></h2>\r\n<p style="margin:0cm;margin-bottom:.0001pt;text-align:justify;text-justify:\r\ninter-ideograph;line-height:17.25pt"><span style="font-size: 9pt; font-family: Tahoma;">- Tốc độ không dây lên đến 300Mbps, rất thuận lợi để sử dụng cho các ứng dụng Như xem video HD trực tuyến<o:p></o:p></span></p>\r\n<p style="margin:0cm;margin-bottom:.0001pt;text-align:justify;text-justify:\r\ninter-ideograph;line-height:17.25pt"><span style="font-size: 9pt; font-family: Tahoma;">- 2 Anten 7 Dpi công suất cao gắn rời làm tăng sự ổng định và vững mạnh với kết nối không dây, công suất cao làm tăng vùng phủ sóng rộng hơn gấp 6 lần bình thường<o:p></o:p></span></p>\r\n<p style="margin:0cm;margin-bottom:.0001pt;text-align:justify;text-justify:\r\ninter-ideograph;line-height:17.25pt"><span style="font-size: 9pt; font-family: Tahoma;">- Có 4 cổng Lan RJ45 tốc độ 10/100 dùng chia sẻ mạng cho các máy tính không có thiết bị thu không dây.<o:p></o:p></span></p>\r\n<p style="margin:0cm;margin-bottom:.0001pt;text-align:justify;text-justify:\r\ninter-ideograph;line-height:17.25pt"><span style="font-size: 9pt; font-family: Tahoma;">- Cài đặt dễ dàng<o:p></o:p></span></p>', NULL, '&#160;', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 71, 1, NULL, 48, 0, '15'),
(6138, 'hy-255', 'HY 255', 'HY 255', '<p><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">thích h</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ợ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">p v</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ớ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i&#160;t</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ấ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">t c</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ả</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial"> ca</span><span lang="VI" style="font-family: &quot;Times New Roman&quot;; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: VI; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">́c</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">&#160;lo</span><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: VNI-Times">ạ</span><span lang="EN-US" style="font-family: VNI-Times; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: Arial">i windows</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột&#160;quang USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1288, 1, NULL, 284, 0, '0'),
(6153, 'hy9200', 'HY-9200', 'HY-9200', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">loa 2.1 nguồn 220V<o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">loa vi tính</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 176, 0, '0'),
(6150, 'hy320', 'HY-320', 'HY-320', '<p>LOA 2.1 nguồn AC220V</p>', NULL, '<p>LOA VI TÍNH</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1300, 1, NULL, 180, 0, '10'),
(6282, 'ssk032', 'SSK-032', 'SSK-032', '<p><span style="font-size: 14pt; font-family: ''.VnTime''; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">độ ph©n giải 640x480. PC &amp; NOTEBOOK</span></p>', NULL, '<p><span style="font-size: 10pt; font-family: ''.VnTime''; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">C</span><span style="font-size: 10pt; font-family: Arial; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">ổng giao tiếp USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 452, 0, '11'),
(6331, 'oa1031', 'oa-1031', 'oa-1031', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Tai nghe Loại: Cáp</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Không có micro</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Dùng cho PC-LAPTOP-MP3-MP4</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Công suất: 30 MW </span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">giắc cắm 3,5mm</span></div>', NULL, '<p>tai nghe có dây</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 247, 0, '13'),
(6332, 'oa3001', 'OA-3001', 'OA-3001', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP-mp3-mp4</span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Công suất: 150mW</span></p>', NULL, '<p>tai nghe có dây</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 248, 0, '13');
INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(6333, 'oa3005m', 'oa-3005m', 'oa-3005m', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Công suất: 150mW</span></p>', NULL, '<p><span style="font-size: 9pt; font-family: Arial">tai nghe có dây<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 250, 0, '13'),
(6334, 'oa5001', 'OA-5001', 'OA-5001', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Công suất: 150mW</span></p>', NULL, '<p>tai nghe chùm sau đầu</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 188, 0, '13'),
(6335, 'oa5002mv', 'OA-5002MV', 'OA-5002MV', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Công suất: 150mW</span></p>\r\n<p>&#160;</p>', NULL, '<p>tai nghe chùm sau đầu</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 191, 0, '13'),
(6336, 'oa5003', 'OA-5003', 'OA-5003', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Công suất: 150mW</span></p>\r\n<p>&#160;</p>', NULL, '<p>tai nghe có micro</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 183, 0, '13'),
(6337, 'oa6001', 'OA-6001', 'OA-6001', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Tai nghe Loại: Cáp treo tai</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Có micro</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Dải tần số: 20Hz-20kHz</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Dùng cho PC – LAPTOP</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Công suất: 150mW</span></div>', NULL, '<p>tai nghe có micro</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 203, 0, '13'),
(6330, 'oa1007', 'OA-1007', 'OA-1007', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Không có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC-LAPTOP-MP3-MP4<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Công suất: 30 MW <o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">giắc cắm 3,5mm</span></p>', NULL, '<p>Tai nghe có dây</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 187, 0, '13'),
(6185, '520', '520', '520', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">Thích hợp với tất cả các loại windows<o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">chuột quang USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 273, 0, '16'),
(6186, '523', '523', '523', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Thích hợp với tất cả các loại windows</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột quang USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 281, 0, '16'),
(6187, 'm30', 'M30', 'M30', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Thích hợp với tất cả các loại windows</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột quang không dây USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 294, 0, '16'),
(6188, 'mm602', 'MM602', 'MM602', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Thích hợp với tất cả các loại windows</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">chuột quang USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 296, 0, '16'),
(6189, 'mm603', 'MM603', 'MM603', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">Thích hợp với tất cả các loại windows<o:p></o:p></span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt">chuột quang USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 292, 0, '16'),
(6190, 's210', 'S210', 'S210', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Thích hợp với tất cả các loại windows</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">chuột quang USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 317, 0, '16'),
(6192, 's260', 'S260', 'S260', '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Thích hợp với tất cả các loại windows</span></p>', NULL, '<p><span lang="EN-US" style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">chuột quang USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 298, 0, '16'),
(6316, 'tv2830e', 'TV-2830E', 'TV-2830E', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in"><font size="3"><font face="Times New Roman">Xem TV trên màn hình LCD hoặc CRT PC<o:p></o:p></font></font></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">không cần phần mềm, không chiếm dụng CPU hoặc bộ nhớ<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">Tích hợp loa ngoài<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">độ phân giải cao </span><span style="font-size: 10pt; color: #333333; font-family: Arial">Hỗ trợ xem Full HD max resolution 1920 x 1080 &amp; 1920 x 1200</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in"> </span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">tỉ lệ là 4:3 và 16:9</span></p>\r\n<p>&#160;</p>', NULL, '<p><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 10.5pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-size: 12.0pt; mso-font-kerning: 1.0pt">Xem TV trên màn hình LCD hoặc CRT PC</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 209, 0, '14'),
(6313, 'tv2830e', 'TV-2830E', 'TV-2830E', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Xem TV trên màn hình LCD hoặc CRT </span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt">không cần phần mềm cần thiết, không chiếm dụng CPU hoặc bộ nhớ</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Tích hợp loa ngoài</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt">độ phân giải cao </span><span style="font-size: 10pt; color: #333333">Hỗ trợ xem Full HD max resolution 1920 x 1080 &amp; 1920 x 1200</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">tỉ lệ là 4:3 và 16:9</span></div>', NULL, '<p><font style="background-color: #e6ecf9">Box TV xem TV trên máy tính</font><br />\r\n&#160;</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 207, 0, '14'),
(6200, 'hy303mv', 'HY-303MV', 'HY-303MV', '<p>tai nghe nói dùng cho máy vi tính chùm sau đầu</p>', NULL, '<p>tai nghe vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 177, 0, '10'),
(6318, 'tv2830e', 'TV-2830E', 'TV-2830E', '<p>&#160;</p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in">Xem TV trên màn hình LCD hoặc CRT <o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">không cần phần mềm, không chiếm dụng CPU hoặc bộ nhớ,dễ dàng chuyển đổi giữa </span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">PC--&gt;TV và ngược lại.</span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">Tích hợp loa ngoài<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">độ phân giải cao </span><span style="font-size: 10pt; color: #333333; font-family: Arial">Hỗ trợ xem Full HD max resolution 1920 x 1080 &amp; 1920 x 1200</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in"> </span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">tỉ lệ là 4:3 và 16:9</span></p>', NULL, '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in"><font size="3"><font face="Times New Roman">Xem TV trên màn hình LCD hoặc CRT <o:p></o:p></font></font></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1320, 1, NULL, 321, 1, '14'),
(6209, 'tenda-w322u', 'Tenda W322U', 'Tenda W322U', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span lang="EN-US" style="font-size: 6pt; color: #006ba7; font-family: Arial"><br />\r\n</span><span style="font-size: x-small"><span lang="EN-US" style="color: #006ba7; font-family: Arial">Loại USB không dây cho máy tính xách tay / máy tính để bàn <br />\r\nTốc độ truyền </span><span lang="EN-US" style="color: #006ba7; font-family: VNI-Times; mso-bidi-font-family: Arial">d</span><span lang="VI" style="color: #006ba7; mso-ansi-language: VI"><font face="Times New Roman">ữ liệu</font></span><span lang="EN-US" style="color: #006ba7; font-family: Arial"> 300Mbps&#160; <br />\r\nMạng lưới kỹ thuật mạng chuẩn IEEE 802.11g, IEEE 802.11b, IEEE 802.11n</span></span><span lang="EN-US" style="font-size: 6pt; color: #006ba7; font-family: Arial"><o:p></o:p></span></p>', NULL, '<p>Wireless USB Adapter</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1327, 1, NULL, 522, 0, '15'),
(6210, 'tenda-w368r', 'Tenda W368R', 'Tenda W368R', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="font-size: x-small"><span lang="EN-US" style="font-family: Arial; color: #006ba7">AP không dây, Router, 4-Port Switch, và Firewall <br />\r\nCung cấp lên đến mức truyền 300Mbps <br />\r\nTuân theo chuẩn IEEE 802.11n, IEEE 802.11g, IEEE 802.11b, <br />\r\nCông nghệ MIMO sử dụng tín hiệu phản ánh rất nhiều để tăng sức mạnh truyền tải và nhiều <br />\r\nĐáp ứng 64/128-bit WEP, WPA, WPA2 và các tiêu chuẩn an ninh <br />\r\nCung cấp một 10/100Mbps Auto-Negotiation Ethernet WAN port <br />\r\nCung cấp bốn 10/100Mbps Auto-Negotiation Ethernet LAN ports</span></span></p>', NULL, '<p>Router Wireless <span style="font-size: x-small"><span lang="EN-US" style="font-family: Arial; color: #006ba7; mso-fareast-font-family: 宋体; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">300Mbps</span></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 71, 1, NULL, 292, 0, '15'),
(6211, 'tenda-w541u', 'Tenda W541U', 'Tenda W541U', '<p><span style="font-size: x-small"><span lang="EN-US" style="color: #006ba7; font-family: Arial; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-font-kerning: 1.0pt">Tuân theo chuẩn IEEE 802.11g và IEEE 802.11b tiêu chuẩn <br />\r\nCung cấp tốc độ truyền tải 54Mbps <br />\r\nĐáp ứng 64/128-bit WEP, WPA, WPA2 và các tiêu chuẩn an ninh <br />\r\nPhát hiện mạng không dây và truyền thay đổi tốc độ tự động</span></span></p>', NULL, '<p>Wireless USB Adapter</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1327, 1, NULL, 272, 0, '15'),
(6212, 'spc014', 'SPC014', 'SPC014', '<p>* Cảm biến: CMOS K12 300.000 pixel<br />\r\n* 2 nhựa một thấu kính thủy tinh, tốc độ 30 khung hình / giây có thể đạt được</p>\r\n<p>USB, độ phân giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>webcam 2.0</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 316, 0, '11'),
(6213, 'spc027', 'SPC027', 'SPC027', '<p>USB, độ phân giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>webcam 2.0</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 354, 0, '11'),
(6214, 'ssk-006', 'SSK 006', 'SSK 006', '<p>độ phân giải 1280 *<br />\r\n960 pixel pixel</p>\r\n<p>USB, độ phân giải 640x480. PC &amp; NOTEBOOK</p>', NULL, '<p>WEBCAM 2.0</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 326, 0, '11'),
(6215, 'sm220', 'SM220', 'SM220', '<p>Chuột USB thích hợp với tất cả các loại windows</p>', NULL, '<p>MOUSE USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1285, 1, NULL, 285, 0, '16'),
(6216, 'hy300mv', 'HY-300MV', 'HY-300MV', '<p>tai nghe nói dùng cho PC-LAPTOP</p>', NULL, '<p>tai nghe vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 158, 0, '10'),
(6217, 'hy336', 'HY-336', 'HY-336', '<p>tai nghe nói dùng PC-LAPTOP</p>', NULL, '<p>Tai nghe vi tính</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1276, 1, NULL, 170, 0, '10'),
(6218, 'hdd-box-35', 'HDD Box 3.5', 'HDD Box 3.5', '<p>Sử dụng được cho&#160;HDD sata 3.5 và HDD sata 2.5</p>', NULL, '<p>box UNITEK 3.5 SATA</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 153, 0, '0'),
(6219, 'ssk-023', 'SSK 023', 'SSK 023', '<p>hỗ trợ mọi windows</p>', NULL, '<p>USB, độ phân giải 640x480. PC &amp; NOTEBOOK</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 326, 0, '11'),
(6234, 'nd5', 'ND5', 'ND5', '<p>Hổ trợ mọi windows không cần driver tự nhận thiết bị</p>', NULL, '<p>Webcam CLV USB 2.0</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 297, 0, '8'),
(6221, 'ssk-024', 'SSK 024', 'SSK 024', '<p>Thích hợp với Vista và XP</p>', NULL, '<p>webcam SSK USB 2.0</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 321, 0, '11'),
(6235, 'ssk-026', 'SSK 026', 'SSK 026', '<p>Độ phân giải 600 x 450</p>', NULL, '<p>Webcam 2.0 USB</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 336, 0, '11'),
(6236, 'coolor-master-5228', 'coolor master 5228', 'coolor master 5228', '<p>&#160;</p>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 320, 0, '0'),
(6237, '5218', '5218', '5218', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 288, 0, '19'),
(6238, '5318', '5318', '5318', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 279, 0, '19'),
(6239, '2318', '2318', '2318', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 288, 0, '19'),
(6240, '108', '108', '108', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 295, 0, '19'),
(6241, '198', '198', '198', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 281, 0, '19'),
(6242, '883', '883', '883', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 294, 0, '0'),
(6243, 'tmx1', 'TMX1', 'TMX1', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>\r\n<div style="margin: 0in 0in 10pt">&#160;</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 280, 0, '0'),
(6244, '128', '128', '128', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>\r\n<div style="margin: 0in 0in 10pt">&#160;</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 274, 0, '0'),
(6245, 'bb08', 'BB-08', 'BB-08', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 290, 0, '0'),
(6246, 'b4', 'B4', 'B4', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 195, 0, '19'),
(6247, 'b006', 'B006', 'B006', '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>\r\n<p>&#160;</p>\r\n<p>&#160;</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 185, 0, '19'),
(6248, 'nb902', 'NB-902', 'NB-902', '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 192, 0, '0'),
(6249, '668', '668', '668', '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 192, 0, '0'),
(6250, 'c310', 'C310', 'C310', '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 194, 0, '19'),
(6251, 'a510', 'A510', 'A510', '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 569, 0, '19'),
(6252, 'x800', 'X-800', 'X-800', '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 192, 0, '0'),
(6253, 'tmc1', 'TMC1', 'TMC1', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 189, 0, '0'),
(6254, '828', '828', '828', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 214, 0, '0'),
(6255, 'nc58', 'NC58', 'NC58', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 192, 0, '0'),
(6256, 'x600', 'X-600', 'X-600', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 209, 0, '0'),
(6257, 'nc10', 'NC10', 'NC10', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 217, 0, '0'),
(6258, '764hub', '764+Hub', '764+Hub', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop có hub 2.0</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 188, 0, '0'),
(6259, 'k63fan', 'K6-3fan', 'K6-3fan', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 180, 0, '0'),
(6260, 'k62-fan', 'k6-2 fan', 'k6-2 fan', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 185, 0, '0'),
(6261, 'u2', 'U2', 'U2', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 200, 0, '19'),
(6264, '2718', '2718', '2718', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 193, 0, '0'),
(6265, '2318', '2318', '2318', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 187, 0, '19'),
(6263, 'x500', 'X-500', 'X-500', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 193, 0, '0'),
(6267, 'n15', 'N15', 'N15', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 196, 0, '19'),
(6268, 'is630', 'IS630', 'IS630', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 117, 0, '0'),
(6269, 'rx838', 'RX-838', 'RX-838', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 128, 0, '0'),
(6270, '808hub', '808+HUB', '808+HUB', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, '<p>&#160;</p>\r\n<div style="margin: 0in 0in 10pt">Quạt tỏa nhiệt dùng cho laptop</div>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 123, 0, '0'),
(6370, 'w322p', 'W322P', 'W322P', '<div style="text-align: left; line-height: 15pt; background: white" align="left"><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">W322P V2.0 là một Wireless PCI Adapter với lên đến 300Mbps tốc độ truyền</span></div>\r\n<div><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">Tươ</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">ng th</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">ích v</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">ới Windows Vista/XP/2000, Linux, MAC OS</span></div>\r\n<div><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; color: #666666; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">W322P V2.0 phù hợp cho máy tính để bàn. </span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">Tỉ suất truyền tải có thể lên tới 300Mbps khi kết nối với Tenda W306R 11n Wireless Router</span></div>\r\n<div><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">Huong</span></div>', NULL, 'Card PCI Wifi', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1326, 1, NULL, 270, 0, '15'),
(6346, 'cmk818', 'CMK-818', 'CMK-818', '<p>loa dùng cho PC-LAPTOP-MP4-MP4</p>', NULL, '<p>loa mini</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 250, 0, '0'),
(6347, 'd60', 'D-60', 'D-60', '<p>Loa đa năng hát USB-SD-FM-PC-LAPTOP</p>', NULL, '<p>LOA MINI</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 266, 0, '0'),
(6348, 'loasu02', 'Loa-SU-02', 'Loa-SU-02', '<p><span><em>* Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h </em></span><span><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n* </em></span><em><strong><span style="color: dimgray">Đọ</span></strong><strong><span style="color: dimgray">c file MP3, WMA t</span></strong><strong><span style="color: dimgray">ừ</span></strong><strong><span style="color: dimgray"> th</span></strong><strong><span style="color: dimgray">ẻ</span></strong><strong><span style="color: dimgray"> nh</span></strong><strong><span style="color: dimgray">ớ</span></strong><strong><span style="color: dimgray"> SD/MMC v</span></strong><strong><span style="color: dimgray">à</span></strong><strong><span style="color: dimgray"> USB, nút </span></strong><strong><span style="color: dimgray">đ</span></strong><strong><span style="color: dimgray">i</span></strong><strong><span style="color: dimgray">ề</span></strong><strong><span style="color: dimgray">u khi</span></strong><strong><span style="color: dimgray">ể</span></strong><strong><span style="color: dimgray">n ch</span></strong><strong><span style="color: dimgray">ơ</span></strong><strong><span style="color: dimgray">i nh</span></strong><strong><span style="color: dimgray">ạ</span></strong><strong><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="color: dimgray"><br />\r\n<span><strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></span></p>', NULL, '<p>loa mini</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 254, 0, '0');
INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(6279, 'clv060', 'clv-060', 'clv-060', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="font-size: 10pt"><font face=".VnTime">C</font></span><span style="font-size: 10pt; font-family: Arial">ổng giao tiếp USB<o:p></o:p></span></p>', NULL, '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="font-size: 10pt"><font face=".VnTime">C</font></span><span style="font-size: 10pt; font-family: Arial">ổng giao tiếp USB<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 21, 1, NULL, 269, 0, '8'),
(6280, 'nd20', 'ND-20', 'ND-20', '<p><font size="3" face="Times New Roman">Hổ trợ mọi windows không cần driver tự nhận thiết bị </font></p>\r\n<p><span style="font-family: &quot;.VnTime&quot;; font-size: 14pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''"><span style="mso-spacerun: yes">&#160;&#160;&#160; </span>độ ph©n giải 640x480. PC &amp; NOTEBOOK</span></p>', NULL, '<p><span style="font-family: &quot;.VnTime&quot;; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">C</span><span style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">ổng giao tiếp USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 286, 0, '8'),
(6281, 'nd2', 'ND-2', 'ND-2', '<p><span style="font-family: &quot;.VnTime&quot;; font-size: 14pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">độ&#160;ph©n giải 640x480. PC &amp; NOTEBOOK</span></p>', NULL, '<p><span style="font-family: &quot;.VnTime&quot;; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">C</span><span style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">ổng giao tiếp USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 31, 1, NULL, 284, 0, '8'),
(6284, 'hyx1', 'HY-X1', 'HY-X1', '<p><span style="font-family: &quot;.VnTime&quot;; font-size: 14pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">độ ph©n giải 640x480. PC &amp; NOTEBOOK</span></p>', NULL, '<p><span style="font-family: &quot;.VnTime&quot;; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">C</span><span style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">ổng giao tiếp USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1312, 1, NULL, 279, 0, '10'),
(6285, 'hy550', 'HY-550', 'HY-550', '<p><span style="font-family: &quot;.VnTime&quot;; font-size: 14pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">độ ph©n giải 640x480. PC &amp; NOTEBOOK</span></p>', NULL, '<p><span style="font-family: &quot;.VnTime&quot;; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-bidi-font-family: ''Times New Roman''">C</span><span style="font-family: Arial; font-size: 10pt; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">ổng giao tiếp USB</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1312, 1, NULL, 266, 0, '10'),
(6286, 'sac-notebok-car', 'sạc notebok car', 'sạc notebok car', '<p><span style="font-size: 9pt; font-family: Arial; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">sạc notebok lấy từ nguồn xe hơi đa năng từ 15v đến 24v</span></p>', NULL, '<p><span style="font-size: 9pt; font-family: Arial">sạc notebok từ nguồn xe hơi 150W &amp; 200W</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 245, 0, '0'),
(6287, 'sac-notebok-car', 'sạc notebok car', 'sạc notebok car', '<p><span style="font-size: 9pt; font-family: Arial">sạc notebok lấy từ nguồn xe hơi đa năng từ 15v đến 24v<o:p></o:p></span></p>', NULL, '<p><span style="font-size: 9pt; font-family: Arial">sạc notebok từ nguồn xe hơi 200W &amp; 300W<o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 254, 0, '0'),
(6290, '400', '400', '400', '<p style="text-indent: 12pt"><b><span style="font-family: Tahoma; color: #666666; font-size: 9pt">QUẠT CPU SOCKET 775</span></b><span style="font-family: Arial; font-size: 9pt"><o:p></o:p></span></p>', NULL, '<p style="text-indent: 12pt"><b><span style="font-family: Tahoma; color: #666666; font-size: 9pt">QUẠT CPU SOCKET 775</span></b><span style="font-family: Arial; font-size: 9pt"><o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 116, 0, '0'),
(6291, '200', '200', '200', '<p style="text-indent: 12pt"><b><span style="font-family: Tahoma; color: #666666; font-size: 9pt">QUẠT CPU SOCKET 775</span></b><span style="font-family: Arial; font-size: 9pt"><o:p></o:p></span></p>', NULL, '<p style="text-indent: 12pt"><b><span style="font-family: Tahoma; color: #666666; font-size: 9pt">QUẠT CPU SOCKET 775</span></b><span style="font-family: Arial; font-size: 9pt"><o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 569, 0, '0'),
(6292, 's200', 'S-200', 'S-200', '<p style="text-indent: 12pt"><b><span style="font-family: Tahoma; color: #666666; font-size: 9pt">QUẠT CPU SOCKET 775</span></b><span style="font-family: Arial; font-size: 9pt"><o:p></o:p></span></p>', NULL, '<p>&#160;</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 5, 1, NULL, 120, 0, '0'),
(6293, 'ep8800', 'EP-8800', 'EP-8800', '<p style="text-indent: 12pt"><b><span style="font-family: Tahoma; color: #666666; font-size: 9pt">QUẠT CPU SOCKET 775</span></b><span style="font-family: Arial; font-size: 9pt"><o:p></o:p></span></p>', NULL, '<p style="text-indent: 12pt"><b><span style="font-family: Tahoma; color: #666666; font-size: 9pt">QUẠT CPU SOCKET 775</span></b><span style="font-family: Arial; font-size: 9pt"><o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 232, 0, '0'),
(6294, '285', '285', '285', '<p style="text-indent: 12pt"><b><span style="font-family: Tahoma; color: #666666; font-size: 9pt">QUẠT CPU SOCKET 775</span></b><span style="font-family: Arial; font-size: 9pt"><o:p></o:p></span></p>', NULL, '<p style="text-indent: 12pt"><b><span style="font-family: Tahoma; color: #666666; font-size: 9pt">QUẠT CPU SOCKET 775</span></b><span style="font-family: Arial; font-size: 9pt"><o:p></o:p></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 207, 0, '0'),
(6295, 'hdmi', 'HDMI', 'HDMI', '<p>&#160;</p>', NULL, '<p>&#160;</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1275, 1, NULL, 153, 0, '0'),
(6383, '031', '031', '031', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">thích với Windows XP/Vista</span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">độ phân giải 640x480 PC LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">Không cần driver<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">USB 2.0</span></p>', NULL, 'Webcam PC-LAPTOP', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 298, 1, '11'),
(6408, 'y1040cn', 'Y-1040CN', 'Y-1040CN', '<div style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in"><span style="font-size: 9pt">-<span style="font: 7pt ''Times New Roman''">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span><span style="font-size: 9pt">Đế gắn 2.5" &amp; 3.5" SATA<br />\r\n- Giao tiếp USB 2.0 + eSATA <br />\r\n- Tích hợp USB Hub<br />\r\n- Reader SD/MS/CF/T-Flash</span></div>\r\n<div style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in"><span><span>-<span style="font: 7pt ''Times New Roman''">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span style="font-size: 10pt; color: #333333">One Touch Backup function</span></div>', NULL, 'box HDD 2.5-3.5 SATA', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1340, 1, NULL, 235, 0, '23'),
(6297, 'gutarys-05', 'gutar_YS 05', 'gutar_YS 05', '<p><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:UseFELayout/>\r\n  </w:Compatibility>\r\n  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n </w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" LatentStyleCount="156">\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Table Normal";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:"Times New Roman";\r\n	mso-fareast-font-family:"Times New Roman";\r\n	mso-ansi-language:#0400;\r\n	mso-fareast-language:#0400;\r\n	mso-bidi-language:#0400;}\r\n</style>\r\n<![endif]--></p>\r\n<p class="MsoNormal"><span style="font-size: small"><span style="font-family: Arial"><span style="color: dimgray">M</span><span style="color: dimgray">à</span><span style="color: dimgray">u s</span><span style="color: dimgray">ắ</span><span style="color: dimgray">c : g</span><span style="color: dimgray">ỗ</span><strong><span style="color: darkorange">(kèm mi</span></strong><strong><span style="color: darkorange">ế</span></strong><strong><span style="color: darkorange">ng dán </span></strong><strong><span style="color: darkorange">đổ</span></strong><strong><span style="color: darkorange">i m</span></strong><strong><span style="color: darkorange">à</span></strong><strong><span style="color: darkorange">u)</span></strong><strong><span style="color: darkorange"> </span></strong><br />\r\n<em><span style="color: dimgray">* Tích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p pin s</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">c, th</span></em><em><span style="color: dimgray">ờ</span></em><em><span style="color: dimgray">i gian s</span></em><em><span style="color: dimgray">ử</span></em><em><span style="color: dimgray"> d</span></em><em><span style="color: dimgray">ụ</span></em><em><span style="color: dimgray">ng pin lâu </span></em><em><span style="color: dimgray">đế</span></em><em><span style="color: dimgray">n 4 - 8h</span></em><span style="color: dimgray"><br />\r\n<em>* Thi</em></span><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray">t k</span></em><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray"> thích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p </span></em><em><span style="color: dimgray">Đ</span></em><em><span style="color: dimgray">i</span></em><em><span style="color: dimgray">ệ</span></em><em><span style="color: dimgray">n tho</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">i di </span></em><em><span style="color: dimgray">độ</span></em><em><span style="color: dimgray">ng, MP3,MP4, Laptop, PSP, PDA ...</span></em><i><span style="color: dimgray"><br />\r\n<em>* </em></span></i><strong><i><span style="color: dimgray">Đọ</span></i></strong><strong><i><span style="color: dimgray">c file MP3, WMA t</span></i></strong><strong><i><span style="color: dimgray">ừ</span></i></strong><strong><i><span style="color: dimgray"> th</span></i></strong><strong><i><span style="color: dimgray">ẻ</span></i></strong><strong><i><span style="color: dimgray"> nh</span></i></strong><strong><i><span style="color: dimgray">ớ</span></i></strong><strong><i><span style="color: dimgray"> SD/MMC v</span></i></strong><strong><i><span style="color: dimgray">à</span></i></strong><strong><i><span style="color: dimgray"> USB, nút </span></i></strong><strong><i><span style="color: dimgray">đ</span></i></strong><strong><i><span style="color: dimgray">i</span></i></strong><strong><i><span style="color: dimgray">ề</span></i></strong><strong><i><span style="color: dimgray">u khi</span></i></strong><strong><i><span style="color: dimgray">ể</span></i></strong><strong><i><span style="color: dimgray">n ch</span></i></strong><strong><i><span style="color: dimgray">ơ</span></i></strong><strong><i><span style="color: dimgray">i nh</span></i></strong><strong><i><span style="color: dimgray">ạ</span></i></strong><strong><i><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></i></strong><br />\r\n<em><span style="color: dimgray">* </span></em><strong><i><span style="color: dimgray">Có </span></i></strong><strong><i><span style="color: dimgray">đ</span></i></strong><strong><i><span style="color: dimgray">i</span></i></strong><strong><i><span style="color: dimgray">ề</span></i></strong><strong><i><span style="color: dimgray">u khi</span></i></strong><strong><i><span style="color: dimgray">ể</span></i></strong><strong><i><span style="color: dimgray">n t</span></i></strong><strong><i><span style="color: dimgray">ừ</span></i></strong><strong><i><span style="color: dimgray"> xa</span></i></strong><br />\r\n<strong><span style="color: dimgray">Ph</span></strong><strong><span style="color: dimgray">ụ</span></strong><strong><span style="color: dimgray"> ki</span></strong><strong><span style="color: dimgray">ệ</span></strong><strong><span style="color: dimgray">n:</span></strong><i><span style="color: dimgray"><br />\r\n<em>Loa, USB cable, 3.5 audio cable, </em></span></i><em><span style="color: dimgray">đế</span></em><em><span style="color: dimgray"> ch</span></em><em><span style="color: dimgray">ố</span></em><em><span style="color: dimgray">ng loa, mi</span></em><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray">ng dán, remote</span></em></span></span></p>\r\n<p>&#160;</p>', NULL, '<p>Loa đa năng</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 556, 0, '0'),
(6298, 'loa-mau-k5', 'LOA MAU K5', 'LOA MAU K5', '<p><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:UseFELayout/>\r\n  </w:Compatibility>\r\n  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n </w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" LatentStyleCount="156">\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Table Normal";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:"Times New Roman";\r\n	mso-fareast-font-family:"Times New Roman";\r\n	mso-ansi-language:#0400;\r\n	mso-fareast-language:#0400;\r\n	mso-bidi-language:#0400;}\r\n</style>\r\n<![endif]-->\r\n<p>&#160;</p>\r\n</p>\r\n<p class="MsoNormal"><span style="font-family: Arial"><span style="color: dimgray">M</span><span style="color: dimgray">à</span><span style="color: dimgray">u s</span><span style="color: dimgray">ắ</span><span style="color: dimgray">c : </span><span style="color: dimgray">đ</span><span style="color: dimgray">en, b</span><span style="color: dimgray">ạ</span><span style="color: dimgray">c, h</span><span style="color: dimgray">ồ</span><span style="color: dimgray">ng, xanh d</span><span style="color: dimgray">ươ</span><span style="color: dimgray">ng, xanh lá</span><br />\r\n<em><span style="color: dimgray">* Tích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p pin s</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">c, th</span></em><em><span style="color: dimgray">ờ</span></em><em><span style="color: dimgray">i gian s</span></em><em><span style="color: dimgray">ử</span></em><em><span style="color: dimgray"> d</span></em><em><span style="color: dimgray">ụ</span></em><em><span style="color: dimgray">ng pin lâu </span></em><em><span style="color: dimgray">đế</span></em><em><span style="color: dimgray">n 4 </span></em><span style="color: dimgray"><br />\r\n<em>* Thi</em></span><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray">t k</span></em><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray"> thích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p </span></em><em><span style="color: dimgray">Đ</span></em><em><span style="color: dimgray">i</span></em><em><span style="color: dimgray">ệ</span></em><em><span style="color: dimgray">n tho</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">i di </span></em><em><span style="color: dimgray">độ</span></em><em><span style="color: dimgray">ng, MP3,MP4, Laptop, PSP, PDA ...</span></em><i><span style="color: dimgray"><br />\r\n<em>* </em></span></i><strong><i><span style="color: dimgray">Đọ</span></i></strong><strong><i><span style="color: dimgray">c file MP3, WMA t</span></i></strong><strong><i><span style="color: dimgray">ừ</span></i></strong><strong><i><span style="color: dimgray"> th</span></i></strong><strong><i><span style="color: dimgray">ẻ</span></i></strong><strong><i><span style="color: dimgray"> nh</span></i></strong><strong><i><span style="color: dimgray">ớ</span></i></strong><strong><i><span style="color: dimgray"> SD/MMC v</span></i></strong><strong><i><span style="color: dimgray">à</span></i></strong><strong><i><span style="color: dimgray"> USB, nút </span></i></strong><strong><i><span style="color: dimgray">đ</span></i></strong><strong><i><span style="color: dimgray">i</span></i></strong><strong><i><span style="color: dimgray">ề</span></i></strong><strong><i><span style="color: dimgray">u khi</span></i></strong><strong><i><span style="color: dimgray">ể</span></i></strong><strong><i><span style="color: dimgray">n ch</span></i></strong><strong><i><span style="color: dimgray">ơ</span></i></strong><strong><i><span style="color: dimgray">i nh</span></i></strong><strong><i><span style="color: dimgray">ạ</span></i></strong><strong><i><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></i></strong><i><span style="color: dimgray"><br />\r\n<em>* </em><strong>V</strong></span></i><strong><i><span style="color: dimgray">ỏ</span></i></strong><strong><i><span style="color: dimgray"> loa </span></i></strong><strong><i><span style="color: dimgray">đượ</span></i></strong><strong><i><span style="color: dimgray">c </span></i></strong><strong><i><span style="color: dimgray">đ</span></i></strong><strong><i><span style="color: dimgray">úc nguyên kh</span></i></strong><strong><i><span style="color: dimgray">ố</span></i></strong><strong><i><span style="color: dimgray">i b</span></i></strong><strong><i><span style="color: dimgray">ằ</span></i></strong><strong><i><span style="color: dimgray">ng h</span></i></strong><strong><i><span style="color: dimgray">ợ</span></i></strong><strong><i><span style="color: dimgray">p kim nhôm theo công ngh</span></i></strong><strong><i><span style="color: dimgray">ệ</span></i></strong><strong><i><span style="color: dimgray"> c</span></i></strong><strong><i><span style="color: dimgray">ủ</span></i></strong><strong><i><span style="color: dimgray">a Apple</span></i></strong><em><b><span style="color: dimgray">, tinh x</span></b></em><em><b><span style="color: dimgray">ả</span></b></em><em><b><span style="color: dimgray">o v</span></b></em><em><b><span style="color: dimgray">à</span></b></em><em><b><span style="color: dimgray"> sang tr</span></b></em><em><b><span style="color: dimgray">ọ</span></b></em><em><b><span style="color: dimgray">ng</span></b></em><br />\r\n* <em><b><span style="color: dimgray">Âm thanh tuy</span></b></em><em><b><span style="color: dimgray">ệ</span></b></em><em><b><span style="color: dimgray">t v</span></b></em><em><b><span style="color: dimgray">ờ</span></b></em><em><b><span style="color: dimgray">i v</span></b></em><em><b><span style="color: dimgray">à</span></b></em><em><b><span style="color: dimgray"> siêu tr</span></b></em><em><b><span style="color: dimgray">ầ</span></b></em><em><b><span style="color: dimgray">m</span></b></em><br />\r\n<strong><span style="color: dimgray">Ph</span></strong><strong><span style="color: dimgray">ụ</span></strong><strong><span style="color: dimgray"> ki</span></strong><strong><span style="color: dimgray">ệ</span></strong><strong><span style="color: dimgray">n:</span></strong><i><span style="color: dimgray"><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></i></span></p>', NULL, '<p>loa đa năng</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 269, 0, '0'),
(6299, 'loa-mauk2', 'loa MAU-K2', 'loa MAU-K2', '<p><span style="font-size: small"><span style="font-family: Arial"><!--[if gte mso 9]><xml>\r\n<w:WordDocument>\r\n<w:View>Normal</w:View>\r\n<w:Zoom>0</w:Zoom>\r\n<w:PunctuationKerning />\r\n<w:ValidateAgainstSchemas />\r\n<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n<w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n<w:Compatibility>\r\n<w:BreakWrappedTables />\r\n<w:SnapToGridInCell />\r\n<w:WrapTextWithPunct />\r\n<w:UseAsianBreakRules />\r\n<w:DontGrowAutofit />\r\n<w:UseFELayout />\r\n</w:Compatibility>\r\n<w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n</w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n<w:LatentStyles DefLockedState="false" LatentStyleCount="156">\r\n</w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n/* Style Definitions */\r\ntable.MsoNormalTable\r\n{mso-style-name:"Table Normal";\r\nmso-tstyle-rowband-size:0;\r\nmso-tstyle-colband-size:0;\r\nmso-style-noshow:yes;\r\nmso-style-parent:"";\r\nmso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\nmso-para-margin:0cm;\r\nmso-para-margin-bottom:.0001pt;\r\nmso-pagination:widow-orphan;\r\nfont-size:10.0pt;\r\nfont-family:"Times New Roman";\r\nmso-fareast-font-family:"Times New Roman";\r\nmso-ansi-language:#0400;\r\nmso-fareast-language:#0400;\r\nmso-bidi-language:#0400;}\r\n</style>\r\n<![endif]--></span></span></p>\r\n<p class="MsoNormal">&#160;</p>\r\n<p>\r\n<p>&#160;</p>\r\n</p>\r\n<p class="MsoNormal"><span style="color: dimgray">M</span><span style="color: dimgray">à</span><span style="color: dimgray">u s</span><span style="color: dimgray">ắ</span><span style="color: dimgray">c : </span><span style="color: dimgray">đ</span><span style="color: dimgray">en, b</span><span style="color: dimgray">ạ</span><span style="color: dimgray">c, h</span><span style="color: dimgray">ồ</span><span style="color: dimgray">ng, xanh d</span><span style="color: dimgray">ươ</span><span style="color: dimgray">ng, xanh lá</span><br />\r\n<em><span style="color: dimgray">* Tích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p pin s</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">c, th</span></em><em><span style="color: dimgray">ờ</span></em><em><span style="color: dimgray">i gian s</span></em><em><span style="color: dimgray">ử</span></em><em><span style="color: dimgray"> d</span></em><em><span style="color: dimgray">ụ</span></em><em><span style="color: dimgray">ng pin lâu </span></em><em><span style="color: dimgray">đế</span></em><em><span style="color: dimgray">n 4 </span></em><span style="color: dimgray"><br />\r\n<em>* Thi</em></span><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray">t k</span></em><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray"> thích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p </span></em><em><span style="color: dimgray">Đ</span></em><em><span style="color: dimgray">i</span></em><em><span style="color: dimgray">ệ</span></em><em><span style="color: dimgray">n tho</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">i di </span></em><em><span style="color: dimgray">độ</span></em><em><span style="color: dimgray">ng, MP3,MP4, Laptop, PSP, PDA ...</span></em><i><span style="color: dimgray"><br />\r\n<em>* </em></span></i><strong><i><span style="color: dimgray">Đọ</span></i></strong><strong><i><span style="color: dimgray">c file MP3, WMA t</span></i></strong><strong><i><span style="color: dimgray">ừ</span></i></strong><strong><i><span style="color: dimgray"> th</span></i></strong><strong><i><span style="color: dimgray">ẻ</span></i></strong><strong><i><span style="color: dimgray"> nh</span></i></strong><strong><i><span style="color: dimgray">ớ</span></i></strong><strong><i><span style="color: dimgray"> SD/MMC v</span></i></strong><strong><i><span style="color: dimgray">à</span></i></strong><strong><i><span style="color: dimgray"> USB, nút </span></i></strong><strong><i><span style="color: dimgray">đ</span></i></strong><strong><i><span style="color: dimgray">i</span></i></strong><strong><i><span style="color: dimgray">ề</span></i></strong><strong><i><span style="color: dimgray">u khi</span></i></strong><strong><i><span style="color: dimgray">ể</span></i></strong><strong><i><span style="color: dimgray">n ch</span></i></strong><strong><i><span style="color: dimgray">ơ</span></i></strong><strong><i><span style="color: dimgray">i nh</span></i></strong><strong><i><span style="color: dimgray">ạ</span></i></strong><strong><i><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></i></strong><i><span style="color: dimgray"><br />\r\n<em>* </em><strong>V</strong></span></i><strong><i><span style="color: dimgray">ỏ</span></i></strong><strong><i><span style="color: dimgray"> loa </span></i></strong><strong><i><span style="color: dimgray">đượ</span></i></strong><strong><i><span style="color: dimgray">c </span></i></strong><strong><i><span style="color: dimgray">đ</span></i></strong><strong><i><span style="color: dimgray">úc nguyên kh</span></i></strong><strong><i><span style="color: dimgray">ố</span></i></strong><strong><i><span style="color: dimgray">i b</span></i></strong><strong><i><span style="color: dimgray">ằ</span></i></strong><strong><i><span style="color: dimgray">ng h</span></i></strong><strong><i><span style="color: dimgray">ợ</span></i></strong><strong><i><span style="color: dimgray">p kim nhôm theo công ngh</span></i></strong><strong><i><span style="color: dimgray">ệ</span></i></strong><strong><i><span style="color: dimgray"> c</span></i></strong><strong><i><span style="color: dimgray">ủ</span></i></strong><strong><i><span style="color: dimgray">a Apple</span></i></strong><em><b><span style="color: dimgray">, tinh x</span></b></em><em><b><span style="color: dimgray">ả</span></b></em><em><b><span style="color: dimgray">o v</span></b></em><em><b><span style="color: dimgray">à</span></b></em><em><b><span style="color: dimgray"> sang tr</span></b></em><em><b><span style="color: dimgray">ọ</span></b></em><em><b><span style="color: dimgray">ng</span></b></em><br />\r\n* <em><b><span style="color: dimgray">Âm thanh tuy</span></b></em><em><b><span style="color: dimgray">ệ</span></b></em><em><b><span style="color: dimgray">t v</span></b></em><em><b><span style="color: dimgray">ờ</span></b></em><em><b><span style="color: dimgray">i v</span></b></em><em><b><span style="color: dimgray">à</span></b></em><em><b><span style="color: dimgray"> siêu tr</span></b></em><em><b><span style="color: dimgray">ầ</span></b></em><em><b><span style="color: dimgray">m</span></b></em><br />\r\n<strong><span style="color: dimgray">Ph</span></strong><strong><span style="color: dimgray">ụ</span></strong><strong><span style="color: dimgray"> ki</span></strong><strong><span style="color: dimgray">ệ</span></strong><strong><span style="color: dimgray">n:</span></strong><i><span style="color: dimgray"><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span></i></p>', NULL, '<p>loa đa năng</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 276, 0, '0'),
(6300, 'loa-mdy6', 'loa MDY6', 'loa MDY6', '<p><span style="font-size: small"><span style="font-family: Arial"><!--[if gte mso 9]><xml>\r\n<w:WordDocument>\r\n<w:View>Normal</w:View>\r\n<w:Zoom>0</w:Zoom>\r\n<w:PunctuationKerning />\r\n<w:ValidateAgainstSchemas />\r\n<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n<w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n<w:Compatibility>\r\n<w:BreakWrappedTables />\r\n<w:SnapToGridInCell />\r\n<w:WrapTextWithPunct />\r\n<w:UseAsianBreakRules />\r\n<w:DontGrowAutofit />\r\n<w:UseFELayout />\r\n</w:Compatibility>\r\n<w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n</w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n<w:LatentStyles DefLockedState="false" LatentStyleCount="156">\r\n</w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n/* Style Definitions */\r\ntable.MsoNormalTable\r\n{mso-style-name:"Table Normal";\r\nmso-tstyle-rowband-size:0;\r\nmso-tstyle-colband-size:0;\r\nmso-style-noshow:yes;\r\nmso-style-parent:"";\r\nmso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\nmso-para-margin:0cm;\r\nmso-para-margin-bottom:.0001pt;\r\nmso-pagination:widow-orphan;\r\nfont-size:10.0pt;\r\nfont-family:"Times New Roman";\r\nmso-fareast-font-family:"Times New Roman";\r\nmso-ansi-language:#0400;\r\nmso-fareast-language:#0400;\r\nmso-bidi-language:#0400;}\r\n</style>\r\n<![endif]--></span></span></p>\r\n<p class="MsoNormal">&#160;</p>\r\n<p>\r\n<p>&#160;</p>\r\n<p class="MsoNormal"><span style="font-size: small"><span style="font-family: Arial">&#160;</span></span></p>\r\n</p>\r\n<p class="MsoNormal">Màu sắc : gỗ tự nhiên<br />\r\n<em><span style="color: dimgray">* Tích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p pin s</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">c, th</span></em><em><span style="color: dimgray">ờ</span></em><em><span style="color: dimgray">i gian s</span></em><em><span style="color: dimgray">ử</span></em><em><span style="color: dimgray"> d</span></em><em><span style="color: dimgray">ụ</span></em><em><span style="color: dimgray">ng pin lâu </span></em><em><span style="color: dimgray">đ</span></em><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray">n 4 </span></em><br />\r\n<em><span style="color: dimgray">* Thi</span></em><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray">t k</span></em><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray"> thích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p </span></em><em><span style="color: dimgray">Đ</span></em><em><span style="color: dimgray">i</span></em><em><span style="color: dimgray">ệ</span></em><em><span style="color: dimgray">n tho</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">i di </span></em><em><span style="color: dimgray">đ</span></em><em><span style="color: dimgray">ộ</span></em><em><span style="color: dimgray">ng, MP3,MP4, Laptop, PSP, PDA ...</span></em><br />\r\n<em><span style="color: dimgray">* </span></em><strong><i><span style="color: dimgray">Đ</span></i></strong><strong><i><span style="color: dimgray">ọ</span></i></strong><strong><i><span style="color: dimgray">c file MP3, WMA t</span></i></strong><strong><i><span style="color: dimgray">ừ</span></i></strong><strong><i><span style="color: dimgray"> th</span></i></strong><strong><i><span style="color: dimgray">ẻ</span></i></strong><strong><i><span style="color: dimgray"> nh</span></i></strong><strong><i><span style="color: dimgray">ớ</span></i></strong><strong><i><span style="color: dimgray"> SD/MMC v</span></i></strong><strong><i><span style="color: dimgray">à</span></i></strong><strong><i><span style="color: dimgray"> USB, nút </span></i></strong><strong><i><span style="color: dimgray">đ</span></i></strong><strong><i><span style="color: dimgray">i</span></i></strong><strong><i><span style="color: dimgray">ề</span></i></strong><strong><i><span style="color: dimgray">u khi</span></i></strong><strong><i><span style="color: dimgray">ể</span></i></strong><strong><i><span style="color: dimgray">n ch</span></i></strong><strong><i><span style="color: dimgray">ơ</span></i></strong><strong><i><span style="color: dimgray">i nh</span></i></strong><strong><i><span style="color: dimgray">ạ</span></i></strong><strong><i><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></i></strong><br />\r\n<strong><span style="color: dimgray">Ph</span></strong><strong><span style="color: dimgray">ụ</span></strong><strong><span style="color: dimgray"> ki</span></strong><strong><span style="color: dimgray">ệ</span></strong><strong><span style="color: dimgray">n:</span></strong><br />\r\n<em><span style="color: dimgray">Loa, USB cable, 3.5 audio cable</span></em></p>', NULL, '<p>loa đa năng</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 481, 0, '0'),
(6301, 'loa-nogo925', 'loa Nogo_925', 'loa Nogo_925', '<p><span style="font-size: small"><span style="font-family: Arial"><!--[if gte mso 9]><xml>\r\n<w:WordDocument>\r\n<w:View>Normal</w:View>\r\n<w:Zoom>0</w:Zoom>\r\n<w:PunctuationKerning />\r\n<w:ValidateAgainstSchemas />\r\n<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n<w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n<w:Compatibility>\r\n<w:BreakWrappedTables />\r\n<w:SnapToGridInCell />\r\n<w:WrapTextWithPunct />\r\n<w:UseAsianBreakRules />\r\n<w:DontGrowAutofit />\r\n<w:UseFELayout />\r\n</w:Compatibility>\r\n<w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n</w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n<w:LatentStyles DefLockedState="false" LatentStyleCount="156">\r\n</w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n/* Style Definitions */\r\ntable.MsoNormalTable\r\n{mso-style-name:"Table Normal";\r\nmso-tstyle-rowband-size:0;\r\nmso-tstyle-colband-size:0;\r\nmso-style-noshow:yes;\r\nmso-style-parent:"";\r\nmso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\nmso-para-margin:0cm;\r\nmso-para-margin-bottom:.0001pt;\r\nmso-pagination:widow-orphan;\r\nfont-size:10.0pt;\r\nfont-family:"Times New Roman";\r\nmso-fareast-font-family:"Times New Roman";\r\nmso-ansi-language:#0400;\r\nmso-fareast-language:#0400;\r\nmso-bidi-language:#0400;}\r\n</style>\r\n<![endif]--></span></span></p>\r\n<p class="MsoNormal">&#160;</p>\r\n<p>\r\n<p>&#160;</p>\r\n</p>\r\n<p class="MsoNormal"><span style="color: dimgray">M</span><span style="color: dimgray">à</span><span style="color: dimgray">u s</span><span style="color: dimgray">ắ</span><span style="color: dimgray">c : v</span><span style="color: dimgray">à</span><span style="color: dimgray">ng </span><span style="color: dimgray">đồ</span><span style="color: dimgray">ng, </span><span style="color: dimgray">đỏ</span><span style="color: dimgray">, </span><span style="color: dimgray">đ</span><span style="color: dimgray">en</span><br />\r\n<em><span style="color: dimgray">* Tích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p pin s</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">c NOKIA BL-5C có th</span></em><em><span style="color: dimgray">ể</span></em><em><span style="color: dimgray"> tháo r</span></em><em><span style="color: dimgray">ờ</span></em><em><span style="color: dimgray">i v</span></em><em><span style="color: dimgray">à</span></em><em><span style="color: dimgray"> thay th</span></em><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray">, th</span></em><em><span style="color: dimgray">ờ</span></em><em><span style="color: dimgray">i gian s</span></em><em><span style="color: dimgray">ử</span></em><em><span style="color: dimgray"> d</span></em><em><span style="color: dimgray">ụ</span></em><em><span style="color: dimgray">ng pin lâu </span></em><em><span style="color: dimgray">đế</span></em><em><span style="color: dimgray">n 4 </span></em><span style="color: dimgray"><br />\r\n<em>* Thi</em></span><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray">t k</span></em><em><span style="color: dimgray">ế</span></em><em><span style="color: dimgray"> thích h</span></em><em><span style="color: dimgray">ợ</span></em><em><span style="color: dimgray">p </span></em><em><span style="color: dimgray">Đ</span></em><em><span style="color: dimgray">i</span></em><em><span style="color: dimgray">ệ</span></em><em><span style="color: dimgray">n tho</span></em><em><span style="color: dimgray">ạ</span></em><em><span style="color: dimgray">i di </span></em><em><span style="color: dimgray">độ</span></em><em><span style="color: dimgray">ng, MP3,MP4, Laptop, PSP, PDA ...</span></em><i><span style="color: dimgray"><br />\r\n<em>* </em></span></i><strong><i><span style="color: dimgray">Đọ</span></i></strong><strong><i><span style="color: dimgray">c file MP3, WMA t</span></i></strong><strong><i><span style="color: dimgray">ừ</span></i></strong><strong><i><span style="color: dimgray"> th</span></i></strong><strong><i><span style="color: dimgray">ẻ</span></i></strong><strong><i><span style="color: dimgray"> nh</span></i></strong><strong><i><span style="color: dimgray">ớ</span></i></strong><strong><i><span style="color: dimgray"> SD/MMC v</span></i></strong><strong><i><span style="color: dimgray">à</span></i></strong><strong><i><span style="color: dimgray"> USB, nút </span></i></strong><strong><i><span style="color: dimgray">đ</span></i></strong><strong><i><span style="color: dimgray">i</span></i></strong><strong><i><span style="color: dimgray">ề</span></i></strong><strong><i><span style="color: dimgray">u khi</span></i></strong><strong><i><span style="color: dimgray">ể</span></i></strong><strong><i><span style="color: dimgray">n ch</span></i></strong><strong><i><span style="color: dimgray">ơ</span></i></strong><strong><i><span style="color: dimgray">i nh</span></i></strong><strong><i><span style="color: dimgray">ạ</span></i></strong><strong><i><span style="color: dimgray">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></i></strong><br />\r\n<strong><span style="color: dimgray">Ph</span></strong><strong><span style="color: dimgray">ụ</span></strong><strong><span style="color: dimgray"> ki</span></strong><strong><span style="color: dimgray">ệ</span></strong><strong><span style="color: dimgray">n:</span></strong><i><span style="color: dimgray"><br />\r\n<em>Loa, USB cable, 3.5 audio cable, </em></span></i><em><span style="color: dimgray">đế</span></em><em><span style="color: dimgray"> gi</span></em><em><span style="color: dimgray">ữ</span></em><em><span style="color: dimgray"> loa, dây </span></em><em><span style="color: dimgray">đ</span></em><em><span style="color: dimgray">e</span></em><em><span style="color: dimgray">o</span></em></p>', NULL, '<p>loa đa năng</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 659, 0, '0'),
(6303, 'mouse-car', 'mouse car', 'mouse car', '<p><!--[if gte mso 9]><xml>\r\n<w:WordDocument>\r\n<w:View>Normal</w:View>\r\n<w:Zoom>0</w:Zoom>\r\n<w:PunctuationKerning />\r\n<w:ValidateAgainstSchemas />\r\n<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n<w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n<w:Compatibility>\r\n<w:BreakWrappedTables />\r\n<w:SnapToGridInCell />\r\n<w:WrapTextWithPunct />\r\n<w:UseAsianBreakRules />\r\n<w:DontGrowAutofit />\r\n<w:UseFELayout />\r\n</w:Compatibility>\r\n<w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n</w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n<w:LatentStyles DefLockedState="false" LatentStyleCount="156">\r\n</w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n/* Style Definitions */\r\ntable.MsoNormalTable\r\n{mso-style-name:"Table Normal";\r\nmso-tstyle-rowband-size:0;\r\nmso-tstyle-colband-size:0;\r\nmso-style-noshow:yes;\r\nmso-style-parent:"";\r\nmso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\nmso-para-margin:0cm;\r\nmso-para-margin-bottom:.0001pt;\r\nmso-pagination:widow-orphan;\r\nfont-size:10.0pt;\r\nfont-family:"Times New Roman";\r\nmso-fareast-font-family:"Times New Roman";\r\nmso-ansi-language:#0400;\r\nmso-fareast-language:#0400;\r\nmso-bidi-language:#0400;}\r\n</style>\r\n<![endif]--></p>\r\n<p class="MsoNormal">L<span style="font-family: Arial;">à</span><span style=""> 1 con chu</span><span style="font-family: Arial;">ộ</span>t quang nh<span style="font-family: Arial;">ư</span><span style="">ng l</span><span style="font-family: Arial;">ạ</span>i mang hình dáng c<span style="font-family: Arial;">ủ</span>a 1 chi<span style="font-family: Arial;">ế</span>c xe h<span style="font-family: Arial;">ơ</span><span style="">i sang</span> tr<span style="font-family: Arial;">ọ</span>ng. bánh xe c<span style="font-family: Arial;">ủ</span>a nó có th<span style="font-family: Arial;">ể</span> chuy<span style="font-family: Arial;">ể</span>n <span style="font-family: Arial;">độ</span>ng, khi<span style="font-family: Arial;">ế</span>n cho vi<span style="font-family: Arial;">ệ</span>c l<span style="font-family: Arial;">ướ</span>t chu<span style="font-family: Arial;">ộ</span>t <span style="font-family: Arial;">đượ</span>c d<span style="font-family: Arial;">ễ</span> d<span style="font-family: Arial;">à</span><span style="">ng h</span><span style="font-family: Arial;">ơ</span><span style="">n, không nh</span><span style="font-family: Arial;">ữ</span>ng v<span style="font-family: Arial;">ậ</span>y, trong quá trình di chuy<span style="font-family: Arial;">ể</span>n thì c<span style="font-family: Arial;">ả</span> <span style="font-family: Arial;">đầ</span>u xe v<span style="font-family: Arial;">à</span><span style=""> </span><span style="font-family: Arial;">đ</span><span style="">uôi xe </span><span style="font-family: Arial;">đề</span>u s<span style="font-family: Arial;">ẽ</span> phát sáng.</p>', NULL, '<p>chuột xe hơi sieu sang</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 2, 1, NULL, 284, 0, '0'),
(6304, 'loa-boai-x18', 'Loa BOAI X18', 'Loa BOAI X18', '<p>Loa hát thẻ nhớ SD và USB PC Laptop FM</p>', NULL, '<p>Loa hát thẻ nhớ USB PC</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 546, 0, '0'),
(6310, 'bluetooth-keyboard', 'Bluetooth Keyboard', 'Bluetooth Keyboard', '<p>Vừa là bao da, giá đỡ kèm với bàn phím kết nối Bluetooth cho Ipad/PC/LAPTOP sản phẩm này sẽ mang lại sự dễ dàng và tiện lợi cho cục cưng Ipad của bạn.</p>\r\n<p jquery1294544650859="1135"><strong>Công dụng: </strong></p>\r\n<p>+ Là bao da sang trọng</p>\r\n<p>+ Là giá đỡ cho bạn tiện làm việc, giải trí</p>\r\n<p>+ Tích hợp bàn phím bluetooth cho iPad cực nhạy, phím bấm mềm dễ dàng tiện dụng.</p>\r\n<p><strong>+ Sạc nhanh chóng và tiện lợi qua cổng USB</strong></p>', NULL, '<p>Bluetooth keyboard for iPad</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 508, 0, '0');
INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(6321, 'khung-hinh-802', 'khung hinh 802', 'khung hinh 802', '<p>&#160;</p>\r\n<div><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">Khung h</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">ình </span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">ả</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">nh k</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">ỹ</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm"> thu</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">ậ</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">t s</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">ố</span></div>\r\n<div><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; color: #666666; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">chất lượng kỹ thuật số 8 "LCD: 800x600 độ phân giải cao.</span></div>\r\n<div style="text-justify: inter-ideograph; text-align: justify; line-height: 15pt; text-indent: -21pt; margin: 0cm 0cm 0pt 21pt"><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">khe cắm USB 2.0-</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; color: #666666; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">3-trong-1 Card reader (MMC / SD / SDHC).</span></div>\r\n<div style="text-justify: inter-ideograph; text-align: justify; line-height: 15pt; text-indent: -21pt; margin: 0cm 0cm 0pt 21pt"><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; color: #666666; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">512M/1G/2Gtùy chọn bộ nhớ trong</span></div>\r\n<div><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; color: black; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">tích hợp loa stereo </span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; color: #666666; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">đầy đủ chức năng điều khiển từ xa bao gồm Máy nghe nhạc &amp; Video</span></div>\r\n<p><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; color: #666666; font-size: 12pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">Xem ảnh kỹ thuật số slidshow </span><span style="color: #666666; font-size: 12pt">&#160;<span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">với âm nhạc</span></span></p>', NULL, '<p>Màn hình kỷ̃ thuật số</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1322, 1, NULL, 275, 0, '14'),
(6322, 'utv-332', 'UTV 332', 'UTV 332', '<p>&#160;</p>\r\n<div><span style="color: #ff0000"><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">xem TV, VCD, DVD và máy ảnh</span></span></div>\r\n<div><span style="color: #ff0000"><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">Capture có chất lượng cao, thu thập hình ảnh mượt mà</span></span></div>\r\n<div><span style="color: #ff0000"><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">K</span><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; background: #e6ecf9; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">ết nối với máy tính bằng cổng USB 2.0</span></span></div>\r\n<div><span style="color: #ff0000"><span style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm">độ phân giải tối đa lên đến 720 * 576</span></span></div>', NULL, '<p><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; background: #e6ecf9; color: black; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-font-kerning: 1.0pt">xem TV, VCD, DVD và máy ảnh</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1321, 1, NULL, 269, 0, '14'),
(6323, 'utv-382e', 'UTV 382E', 'UTV 382E', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="color: #333333"><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; background: #e6ecf9; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm">USB thiết kế độc đáo, nhỏ và dễ dàng mang theo</span></span><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; background: #e6ecf9; color: black; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm"><o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="color: #333333"><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm">đầy đủ hệ thống jack cắm AV đầu vào, kết nối với đầu DVD, STB, Game</span></span><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; color: #666666; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm"><o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="color: #333333"><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm">Khe cắm Card reader </span></span><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; color: #666666; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm"><st1:place w:st="on"><st1:city w:st="on"><span style="color: #333333">Micro</span></st1:city><st1:state w:st="on"><span style="color: #333333">SD</span></st1:state></st1:place><o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="color: #333333"><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm">Record video trong MPEG, VCD hoặc DVD</span></span><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; color: #666666; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm"><o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="color: #333333"><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; background: #e6ecf9; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm">Hệ điều hành: Windows XP (SP2, SP3) / Vista32</span></span></p>\r\n<p>&#160;</p>', NULL, '<p><span lang="EN-US" style="border-bottom: windowtext 1pt; border-left: windowtext 1pt; padding-bottom: 0cm; padding-left: 0cm; padding-right: 0cm; font-family: Arial; background: #e6ecf9; color: black; font-size: 9pt; border-top: windowtext 1pt; border-right: windowtext 1pt; padding-top: 0cm; mso-border-alt: none windowtext 0cm; mso-fareast-font-family: 宋体; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-font-kerning: 1.0pt">xem TV, VCD, DVD và&#160;hình ảnh</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1321, 1, NULL, 279, 1, '14'),
(6324, 'd840r', 'D840R', 'D840R', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">D840R là một ADSL2 + modem cùng với router<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><font size="3"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">4 c</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in"><font face="Times New Roman">ồng LAN<o:p></o:p></font></span></font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in"><font face="Times New Roman" size="3">1 cổng RJ11</font></span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in"> <o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in"><font size="3"><font face="Times New Roman">một cổng USB<o:p></o:p></font></font></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 12pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: &quot;Times New Roman&quot;; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Hỗ trợ IP động và tĩnh PPPoE, PPPoA, IPoA</span></p>', NULL, '<p><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 12pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #444444; padding-top: 0in; border-bottom: windowtext 1pt; font-family: &quot;Times New Roman&quot;; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">ADSL2 + Modem, Router </span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1324, 1, NULL, 242, 0, '15'),
(6325, 'd548r', 'D548R', 'D548R', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt">W548D là một ADSL2 + Modem, router không dây, bốn cổng LAN Switch và tường lửa tất cả trong một</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; padding-bottom: 0in; border-left: windowtext 1pt; color: #444444; padding-top: 0in; border-bottom: windowtext 1pt">ADSL2 + Modem, Router không dây</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Bốn cổng LAN.một cổng WAN</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Một </span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">c</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">ổ</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">ng</span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; padding-bottom: 0in; border-left: windowtext 1pt; color: #444444; padding-top: 0in; border-bottom: windowtext 1pt">RJ11</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Wireless chuẩn IEEE 802.11g / b, 802,3 IEEE, IEEE 802.3u, ADSL</span></div>', NULL, '<p><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 12pt; padding-bottom: 0in; border-left: windowtext 1pt; color: #444444; padding-top: 0in; border-bottom: windowtext 1pt; font-family: &quot;Times New Roman&quot;; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">ADSL2 + Modem, Router Wireless</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1324, 1, NULL, 256, 0, '15'),
(6326, 'w311u', 'W311U', 'W311U', '<p>W311U là Wireless-N USB Adapter cung cấp tốc độ truyền tải 150Mbps. theo chuẩn IEEE 802.11n (Draft 2.0), IEEE 802.11g, IEEE 802.11b chuẩn IEEE 802.11n, IEEE 802.11g, IEEE 802.11b USB 2.0 Tương thích mọi Windows</p>', NULL, '<p><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">USB Adapter&#160; <span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Wireless-N </span></span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1327, 1, NULL, 243, 0, '15'),
(6327, 'w311u', 'w311U+', 'w311U+', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="font-size: larger"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">W311U + là một Wireless USB Adapter với nâng cao tốc độ truyền lên đến 150Mbps</span></span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in"><o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="font-size: larger"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; padding-bottom: 0in; border-left: windowtext 1pt; color: #666666; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">được thiết kế đặc biệt cho người dùng yêu cầu khả năng tiếp nhận không dây tốt hơn. Nó qua công nghệ IEEE802.11n tiên tiến nhất, và là hoàn toàn tương thích với IEEE802.11n/g/b thiết bị không dây. Bên cạnh đó, bộ nối tiếp thông qua công nghệ khuếch đại tín hiệu tiên tiến và được trang bị một ăng-ten có thể tháo rời 4.2dBi. </span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">Vì vậy không dây phạm vi tiếp nhận của nó trở nên rộng lớn hơn 6 lần so với USB Adapter 54Mbps</span></span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in"><o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="font-size: larger"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">Với khả năng tương thích hoàn hảo, sản phẩm này hỗ trợ Windows 7, Vista, Windows XP, Windows2000, MAC OS, Linux</span></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="font-size: larger"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-border-alt: none windowtext 0in">W311U + cung cấp giao diện USB 2.0 và phù hợp cho cả hai máy tính để bàn và máy tính xách tay</span></span></p>\r\n<p>&#160;</p>', NULL, '<p><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Wireless USB Adapter </span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1327, 1, NULL, 247, 0, '15'),
(6328, 'w307r', 'W307R', 'W307R', '<p>&#160;</p>\r\n<div style="margin: 0in -1.25in 0pt 0in"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">W307R là 300Mbps Wireless-N router, điểm truy cập không dây, switch bốn cổng, và tường lửa tất cả-trong-một.</span></div>\r\n<div style="margin: 0in -1.25in 0pt 0in"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Cung cấp tốc độ truyền lên đến 300Mbps</span></div>\r\n<div style="margin: 0in -1.25in 0pt 0in"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">theo chuẩn IEEE 802.11n, IEEE 802.11g, IEEE 802.11b, IEEE 802.3, IEEE 802.3u</span></div>\r\n<div style="margin: 0in -1.25in 0pt 0in"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Đáp ứng 64/128-bit WEP, WPA, và các tiêu chuẩn bảo mật WPA2</span></div>\r\n<div style="margin: 0in -1.25in 0pt 0in"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">W307R là một lựa chọn tốt cho các văn phòng nhỏ hoặc gia đình</span></div>', NULL, '<p><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Arial; mso-fareast-font-family: 宋体; mso-border-alt: none windowtext 0in; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">Wireless-N router</span></p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 71, 1, NULL, 494, 0, '15'),
(6329, 'oa3005mv', 'OA-3005MV', 'OA-3005MV', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Tai nghe Loại: Cáp treo tai</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Có micro</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Dải tần số: 20Hz-20kHz</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Dùng cho PC – LAPTOP</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Công suất: 150mW</span></div>', NULL, '<p>Tai nghe có micro</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 191, 0, '13'),
(6338, 'oa6002', 'OA-6002', 'OA-6002', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Công suất: 150mW</span></p>\r\n<p>&#160;</p>', NULL, '<p>tai nghe có micro</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 188, 0, '13'),
(6339, 'oa6003', 'OA-6003', 'OA-6003', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Công suất: 150mW</span></p>\r\n<p>&#160;</p>', NULL, '<p>tai nghe có micro</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 186, 0, '13'),
(6340, 'oa6004', 'OA-6004', 'OA-6004', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Công suất: 150mW</span></p>\r\n<p>&#160;</p>', NULL, '<p>tai nghe có micro</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 194, 0, '13'),
(6341, 'oa6005', 'OA-6005', 'OA-6005', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Công suất: 150mW</span></p>\r\n<p>&#160;</p>', NULL, '<p>tai nghe có micro</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 198, 0, '13'),
(6342, 'oa6006', 'OA-6006', 'OA-6006', '<p>&#160;</p>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Tai nghe Loại: Cáp treo tai</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Có micro</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Dải tần số: 20Hz-20kHz</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Dùng cho PC – LAPTOP</span></div>\r\n<div style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt">Công suất: 150mW</span></div>', NULL, '<p>tai nghe có dây</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 189, 0, '13'),
(6343, 'oa9003', 'oa-9003', 'oa-9003', '<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Tai nghe Loại: Cáp treo tai<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Có micro<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dải tần số: 20Hz-20kHz<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Dùng cho PC – LAPTOP<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt"><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; font-size: 9pt; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-bidi-font-family: Arial; mso-border-alt: none windowtext 0in">Công suất: 150mW</span></p>\r\n<p>&#160;</p>', NULL, '<p>tai nghe có micro</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 45, 1, NULL, 184, 0, '13'),
(6461, 'isr19', 'IS-R19', 'IS-R19', '&#160;', NULL, '&#160;', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 63, 1, '16'),
(6462, 'st80', 'ST-80', 'ST-80', '&#160;', NULL, '&#160;', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1, 1, NULL, 32, 0, '16'),
(6463, 'st80', 'ST-80', 'ST-80', '&#160;', NULL, '&#160;', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 64, 1, '16'),
(6345, 'ssk-331', 'ssk 331', 'ssk 331', '<p>webcam usb 2.0 dùng cho pc-laptop</p>\r\n<p>&#160;</p>', NULL, '<p>webcam</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1293, 1, NULL, 292, 0, '11'),
(6410, 'y2041', 'Y-2041', 'Y-2041', '<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span style="font-size: 9pt; font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore">-<span style="font: 7pt &quot;Times New Roman&quot;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span lang="VI" style="font-size: 9pt; font-family: Arial; mso-ansi-language: VI">Đế gắn 2.5" &amp; 3.5" SATA<br />\r\n- Giao tiếp USB 2.0 + eSATA <br />\r\n- Tích hợp USB Hub<br />\r\n- Reader SD/MS/CF/T-Flash</span><span style="font-size: 9pt; font-family: Arial"><o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span class="apple-style-span"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font size="3">-</font><span style="font: 7pt &quot;Times New Roman&quot;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span></span><span class="apple-style-span"><span style="font-size: 10pt; color: #333333; font-family: Arial">One Touch Backup function</span></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span class="apple-style-span"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font color="#000000"><font size="3">-</font><span style="font: 7pt &quot;Times New Roman&quot;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></font></span></span></span><span class="apple-style-span"><span style="font-size: 10pt; color: #333333; font-family: Arial">Hổ trợ HDD tới 2TB</span><o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font color="#000000"><font size="3">-</font><span style="font: 7pt &quot;Times New Roman&quot;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></font></span></span><span style="font-size: 8.5pt; color: #333333; font-family: Verdana">Đây là một thiết bị chép phim HD - Từ ổ này qua ổ khác nhanh chóng chỉ qua 1 nút nhấn ( không cần thông qua máy tính )</span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><font color="#000000"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font size="3">-</font><span style="font: 7pt &quot;Times New Roman&quot;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; mso-border-alt: none windowtext 0in"><font face="Times New Roman" size="3">Tương thích với Win 98/ME/2000/XP/Vista / MAC OS 9.X/10.X / Linux</font></span></font></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in">&#160;</p>', NULL, 'BOX HDD 2.5-3.5 SATA', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1340, 1, NULL, 380, 1, '23'),
(6411, 'y120', 'Y-120', 'Y-120', '<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font size="3">-</font><span style="font: 7pt &quot;Times New Roman&quot;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span lang="EN" style="font-size: 10pt; color: #3e3e3e; font-family: Tahoma; mso-ansi-language: EN">Usb to Parallel Unitek CN 36M</span></p>', NULL, '<p>USB TO Parallel CN36M</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1341, 1, NULL, 239, 0, '23'),
(6412, 'y121', 'Y-121', 'Y-121', '<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font size="3">-</font><span style="font: 7pt ''Times New Roman''">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span lang="EN" style="font-size: 10pt; color: #3e3e3e; font-family: Tahoma; mso-ansi-language: EN">Usb to Parallel Unitek com25</span></p>', NULL, 'USB TO Parallel', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1341, 1, NULL, 226, 0, '23');
INSERT INTO `n_products_copy` (`id`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `vn_nsx`, `en_nsx`, `vn_nhanhieu`, `en_nhanhieu`, `price`, `s_price`, `avatar`, `file1`, `file2`, `file3`, `file4`, `file5`, `position`, `date_published`, `num_product`, `category`, `status`, `payment`, `viewed`, `home`, `properties`) VALUES
(6413, 'y105', 'Y-105', 'Y-105', '<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font size="3">-</font><span style="font: 7pt ''Times New Roman''">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span style="font-size: 15pt; color: #1e5b7e; font-family: Arial"><a href="http://ebaymark.vn/p/4993/cong-chuyen-usb-to-com-y-105.html"><font color="#800080">Cổng chuyển USB to Com </font></a>(usb 1.1)</span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font size="3">-</font><span style="font: 7pt ''Times New Roman''">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-border-alt: none windowtext 0in"><font size="3">Kỹ thuật tiêu chuẩn USB-RS232</font></span></p>', NULL, 'USB to RS232', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1341, 1, NULL, 289, 0, '23'),
(6414, 'y108', 'Y-108', 'Y-108', '<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font size="3">-</font><span style="font: 7pt ''Times New Roman''">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span style="font-size: 15pt; color: #1e5b7e; font-family: Arial"><a href="http://ebaymark.vn/p/4993/cong-chuyen-usb-to-com-y-105.html"><font color="#800080">Cổng chuyển USB to Com </font></a>(usb 2.0)</span></p>\r\n<p class="MsoNormal" style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in"><span style="font-family: Arial; mso-fareast-font-family: Arial"><span style="mso-list: Ignore"><font size="3">-</font><span style="font: 7pt ''Times New Roman''">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </span></span></span><span style="border-right: windowtext 1pt; padding-right: 0in; border-top: windowtext 1pt; padding-left: 0in; background: #e6ecf9; padding-bottom: 0in; border-left: windowtext 1pt; color: black; padding-top: 0in; border-bottom: windowtext 1pt; font-family: Verdana; mso-border-alt: none windowtext 0in"><font size="3">Kỹ thuật tiêu chuẩn USB-RS232</font></span></p>', NULL, 'USB TO RS232 USB2.0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1341, 1, NULL, 262, 0, '23'),
(6415, 'm20', 'M20', 'M20', '<p>Loa đa năng hát USB-SD-FM-PC-LAPTOP</p>', NULL, 'Loa hát đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1343, 1, NULL, 254, 0, '14'),
(6416, 'adapter-hp', 'Adapter HP', 'Adapter HP', '<p>input.........100-240<br />\r\noutput.......18.5v=3.5A<br />\r\n<br />\r\ninput..........100-240v<br />\r\noutput........19v=4.74A</p>', NULL, 'tốt và thường đầu sạc lớn và nhỏ', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 249, 0, '0'),
(6417, 'dell', 'DELL', 'DELL', 'Input....100-240v<br />\r\noutput..19.5v=3.34A', NULL, 'TỐT VÀ THƯỜNG', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 263, 0, '0'),
(6418, 'acer', 'ACER', 'ACER', 'Input........100-240v<br />\r\noutput.......19v=4.74A<br />\r\n<br />\r\nInpput.....100-240v<br />\r\noutput......19v=3.42A', NULL, 'TỐT VÀ THƯỜNG', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 234, 0, '0'),
(6419, 'ibm', 'IBM', 'IBM', 'input......100-240v<br />\r\noutput....16v=4.5A<br />\r\n<br />\r\nInput......100-240v<br />\r\noutput....20v=4.5A', NULL, 'tốt và thường', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 241, 0, '0'),
(6420, 'liteon', 'LITEON', 'LITEON', 'input......100-240V<br />\r\noutput....19v=4.74A', NULL, '<p>tốt và thường</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1331, 1, NULL, 246, 0, '0'),
(6421, 'hub-usb-20', 'HUB USB 2.0', 'HUB USB 2.0', 'Hub USB 2.0 4 port', NULL, 'HUB 2.0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1344, 1, NULL, 248, 0, '0'),
(6422, 'hub-usb', 'hub USB', 'hub USB', 'Hub USB 2.0 10 port có adapter&#160;kèm theo', NULL, 'Hub usb 2.0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1344, 1, NULL, 299, 0, '0'),
(6423, 'su83', 'SU-83', 'SU-83', 'hát được USB SD MP3 MP4 PC LAPTOP FM <br />\r\n<span style="color: rgb(0,0,0)"><span style="font-size: 14px"><span style="font-family: comic sans ms,cursive">Nút điều khiển dễ dàng cho người sử dụng<br />\r\nmàn hình LCD hiển thị thời gian bài hát.</span></span></span>', NULL, 'Loa mini', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 138, 0, '0'),
(6425, 'k-521', 'K 521', 'K 521', 'keyboard mini USB 2.0<br />\r\nPhím nhỏ gọn dễ dàng sử dụng', NULL, 'Keyboard mini', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1338, 1, NULL, 232, 0, '10'),
(6426, 'k03', 'K03', 'K03', '<p>Loa đa năng hát USB-SD-FM-PC-LAPTOP<br />\r\nmp3</p>', NULL, 'Loa mini', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 129, 0, '0'),
(6427, 'su105', 'SU-105', 'SU-105', '<p>Loa đa năng hát USB-SD-FM-PC-LAPTOP</p>', NULL, 'LOA MINI', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 130, 0, '0'),
(6428, 'su81', 'SU-81', 'SU-81', '<p>Loa đa năng hát USB-SD-FM-PC-LAPTOP<br />\r\nmp3</p>', NULL, 'loa mini', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 129, 0, '0'),
(6429, 'su82', 'SU-82', 'SU-82', '<p>Loa đa năng hát USB-SD-FM-PC-LAPTOP<br />\r\nmp3</p>', NULL, 'LOA MINI', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 140, 0, '0'),
(6430, 'su109', 'SU-109', 'SU-109', '<p>Loa đa năng hát USB-SD-FM-PC-LAPTOP<br />\r\nmp3</p>', NULL, 'Loa mini<br />', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 142, 0, '0'),
(6431, 'uts971', 'UTS-971', 'UTS-971', '<p>Loa đa năng hát USB-SD-FM-PC-LAPTOP<br />\r\nmp3</p>', NULL, 'LOA MINI', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 134, 0, '0'),
(6460, 'efi82', 'EFi-82', 'EFi-82', '&#160;', NULL, '&#160;', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 43, 1, NULL, 50, 0, '16'),
(6432, 'tv-2810e', 'TV 2810E', 'TV 2810E', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><strong><span style="font-family: Arial; color: #333333; font-size: 10pt">TV&#160;Box Gadmei TV-2810E, biến màn hình máy tính của bạn thành chiếc TV đa hệ đa kênh, dùng được cho LCD/CRT, hỗ trợ màn hình tỷ lệ 4:3 - 16:9- 16<o:p></o:p></span></strong></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="color: #666666; font-size: 9pt; mso-bidi-font-family: Arial"><font face=".VnTime">Ph</font></span><span style="font-family: Arial; color: #666666; font-size: 9pt">ụ kiện kèm theo<o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span style="font-family: Arial; color: #666666; font-size: 9pt">Điều khiển từ xa <o:p></o:p></span></p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt"><span lang="ZH-CN" style="font-family: 宋体; color: #666666; font-size: 9pt; mso-bidi-font-family: 宋体">◆</span><span style="font-family: Arial; color: #666666; font-size: 9pt"> Hướng dẫn sử dụng <br />\r\n</span><span lang="ZH-CN" style="font-family: 宋体; color: #666666; font-size: 9pt; mso-bidi-font-family: 宋体">◆</span><span style="font-family: Arial; color: #666666; font-size: 9pt"> Stereo cáp âm thanh <br />\r\n</span><span lang="ZH-CN" style="font-family: 宋体; color: #666666; font-size: 9pt; mso-bidi-font-family: 宋体">◆</span><span style="font-family: Arial; color: #666666; font-size: 9pt">cáp<span style="mso-spacerun: yes">&#160; </span>VGA chuyển đổi giữa pc và tv box<br />\r\n</span><span lang="ZH-CN" style="font-family: 宋体; color: #666666; font-size: 9pt; mso-bidi-font-family: 宋体">◆</span><span style="font-family: Arial; color: #666666; font-size: 9pt"> Power adapter <br />\r\n</span><span lang="ZH-CN" style="font-family: 宋体; color: #666666; font-size: 9pt; mso-bidi-font-family: 宋体">◆</span><span style="font-family: Arial; color: #666666; font-size: 9pt"> FM ăng-ten</span><span style="font-family: Arial; mso-bidi-font-family: ''Times New Roman''"><o:p></o:p></span></p>', NULL, 'TV box LCD', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1320, 1, NULL, 256, 0, '14'),
(6433, 'usb-042', 'USB 042', 'USB 042', '<div><span style="font-size: 12pt">USB 2.0 </span></div>\r\n<div><span style="font-size: 12pt">Dung l</span><span style="font-size: 12pt">ượng</span><span style="font-size: 12pt">: 2G, 4G, 8G, 16GB, 32GB</span></div>\r\n<div><span style="color: #666666; font-size: 12pt">Chi tiết kỹ thuật sản phẩm <br />\r\nKích thước: 29,1 (L) × 12,1 (W) x 6,2 (H) mm <br />\r\nthân kim loại trọng lượng: 9g <br />\r\nmàu: màu đỏ + đen \\ màu xanh + bạc</span></div>', NULL, '<p>ổ đĩa di động</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1287, 1, NULL, 208, 0, '11'),
(6434, 'usb-166', 'USB 166', 'USB 166', '<div><span style="color: #666666; font-size: 9pt">USB 2.0 giao diện</span></div>\r\n<div><span style="color: #666666; font-size: 9pt">Dung lượng 2G, 4G, 8G, 16GB <br />\r\nKích thước : 39 (L) x 12.5 (W) x 4.5 (H) mm&#160;&#160; </span></div>\r\n<div><span style="color: #666666; font-size: 9pt">Trọng lượng: 4.25g thần kim loại&#160;&#160; </span></div>\r\n<div><span style="color: #666666; font-size: 9pt">màu: vàng&#160;&#160; </span></div>\r\n<div><span style="color: #666666; font-size: 9pt">Chất liệu: acrylic, kim loại</span></div>', NULL, '<p>ổ đĩa di động</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1287, 1, NULL, 321, 0, '11'),
(6435, 'usb-200', 'USB 200', 'USB 200', '<div><span style="color: #666666; font-size: 9pt">Giao diện USB 2.0</span></div>\r\n<div><span style="color: #666666; font-size: 9pt">Công suất: 2G, 4G, 8G</span></div>\r\n<div><span style="color: #666666; font-size: 9pt">chi tiết kỹ thuật sản phẩm&#160;&#160; </span></div>\r\n<div><span style="color: #666666; font-size: 9pt">thần kim loại </span></div>\r\n<div><span style="color: #666666; font-size: 9pt">Kích thước: 45 (L) x 18 (W) x 8,5 (H) mm&#160;&#160; </span></div>\r\n<div><span style="color: #666666; font-size: 9pt">Trọng lượng: 5.2g&#160;&#160; </span></div>\r\n<div><span style="color: #666666; font-size: 9pt">Màu sắc: Đen / Trắng&#160;&#160; </span></div>\r\n<div><span style="color: #666666; font-size: 9pt">Chất liệu: ABS&#160;&#160;</span></div>', NULL, '<p>ổ đĩa di động</p>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1287, 1, NULL, 206, 0, '11'),
(6436, 'android-robot-02', 'android Robot 02', 'android Robot 02', '&#160;<em style="font-family: Tahoma, Arial, Helvetica, sans-serif; ">Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h&#160;</em><span style="font-family: Tahoma, Arial, Helvetica, sans-serif; "><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n*&#160;</em></span><em style="font-family: Tahoma, Arial, Helvetica, sans-serif; "><strong><span style="color: rgb(105, 105, 105); ">Đọ</span></strong><strong><span style="color: rgb(105, 105, 105); ">c file MP3, WMA t</span></strong><strong><span style="color: rgb(105, 105, 105); ">ừ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;th</span></strong><strong><span style="color: rgb(105, 105, 105); ">ẻ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;nh</span></strong><strong><span style="color: rgb(105, 105, 105); ">ớ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;SD/MMC v</span></strong><strong><span style="color: rgb(105, 105, 105); ">à</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;USB, nút&#160;</span></strong><strong><span style="color: rgb(105, 105, 105); ">đ</span></strong><strong><span style="color: rgb(105, 105, 105); ">i</span></strong><strong><span style="color: rgb(105, 105, 105); ">ề</span></strong><strong><span style="color: rgb(105, 105, 105); ">u khi</span></strong><strong><span style="color: rgb(105, 105, 105); ">ể</span></strong><strong><span style="color: rgb(105, 105, 105); ">n ch</span></strong><strong><span style="color: rgb(105, 105, 105); ">ơ</span></strong><strong><span style="color: rgb(105, 105, 105); ">i nh</span></strong><strong><span style="color: rgb(105, 105, 105); ">ạ</span></strong><strong><span style="color: rgb(105, 105, 105); ">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="font-family: Tahoma, Arial, Helvetica, sans-serif; color: rgb(105, 105, 105); "><br />\r\n<strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span>', NULL, '&#160;loa đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 136, 0, '0'),
(6437, 'i-5', 'I 5', 'I 5', '&#160;<em style="font-family: Tahoma, Arial, Helvetica, sans-serif; ">Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h&#160;</em><span style="font-family: Tahoma, Arial, Helvetica, sans-serif; "><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n*&#160;</em></span><em style="font-family: Tahoma, Arial, Helvetica, sans-serif; "><strong><span style="color: rgb(105, 105, 105); ">Đọ</span></strong><strong><span style="color: rgb(105, 105, 105); ">c file MP3, WMA t</span></strong><strong><span style="color: rgb(105, 105, 105); ">ừ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;th</span></strong><strong><span style="color: rgb(105, 105, 105); ">ẻ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;nh</span></strong><strong><span style="color: rgb(105, 105, 105); ">ớ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;microSD</span></strong><strong><span style="color: rgb(105, 105, 105); ">, nút&#160;</span></strong><strong><span style="color: rgb(105, 105, 105); ">đ</span></strong><strong><span style="color: rgb(105, 105, 105); ">i</span></strong><strong><span style="color: rgb(105, 105, 105); ">ề</span></strong><strong><span style="color: rgb(105, 105, 105); ">u khi</span></strong><strong><span style="color: rgb(105, 105, 105); ">ể</span></strong><strong><span style="color: rgb(105, 105, 105); ">n ch</span></strong><strong><span style="color: rgb(105, 105, 105); ">ơ</span></strong><strong><span style="color: rgb(105, 105, 105); ">i nh</span></strong><strong><span style="color: rgb(105, 105, 105); ">ạ</span></strong><strong><span style="color: rgb(105, 105, 105); ">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="font-family: Tahoma, Arial, Helvetica, sans-serif; color: rgb(105, 105, 105); "><br />\r\n<strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span>', NULL, '&#160;Loa đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 136, 0, '0'),
(6438, 'i-8', 'I 8', 'I 8', '&#160;<em style="font-family: Tahoma, Arial, Helvetica, sans-serif; ">Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h&#160;</em><span style="font-family: Tahoma, Arial, Helvetica, sans-serif; "><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n*&#160;</em></span><em style="font-family: Tahoma, Arial, Helvetica, sans-serif; "><strong><span style="color: rgb(105, 105, 105); ">Đọ</span></strong><strong><span style="color: rgb(105, 105, 105); ">c file MP3, WMA t</span></strong><strong><span style="color: rgb(105, 105, 105); ">ừ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;th</span></strong><strong><span style="color: rgb(105, 105, 105); ">ẻ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;nh</span></strong><strong><span style="color: rgb(105, 105, 105); ">ớ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160; microSD&#160;</span></strong><strong><span style="color: rgb(105, 105, 105); ">nút&#160;</span></strong><strong><span style="color: rgb(105, 105, 105); ">đ</span></strong><strong><span style="color: rgb(105, 105, 105); ">i</span></strong><strong><span style="color: rgb(105, 105, 105); ">ề</span></strong><strong><span style="color: rgb(105, 105, 105); ">u khi</span></strong><strong><span style="color: rgb(105, 105, 105); ">ể</span></strong><strong><span style="color: rgb(105, 105, 105); ">n ch</span></strong><strong><span style="color: rgb(105, 105, 105); ">ơ</span></strong><strong><span style="color: rgb(105, 105, 105); ">i nh</span></strong><strong><span style="color: rgb(105, 105, 105); ">ạ</span></strong><strong><span style="color: rgb(105, 105, 105); ">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="font-family: Tahoma, Arial, Helvetica, sans-serif; color: rgb(105, 105, 105); "><br />\r\n<strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span>', NULL, '&#160;Loa đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1330, 1, NULL, 135, 0, '0'),
(6439, 'h-3', 'H 3', 'H 3', '&#160;<em style="font-family: Tahoma, Arial, Helvetica, sans-serif; ">Tích hợp pin sạc, thời gian sử dụng pin lâu đến 4h&#160;</em><span style="font-family: Tahoma, Arial, Helvetica, sans-serif; "><br />\r\n<em>* Thiết kế thích hợp Điện thoại di động, MP3,MP4, Laptop, PSP, PDA ...<br />\r\n*&#160;</em></span><em style="font-family: Tahoma, Arial, Helvetica, sans-serif; "><strong><span style="color: rgb(105, 105, 105); ">Đọ</span></strong><strong><span style="color: rgb(105, 105, 105); ">c file MP3, WMA t</span></strong><strong><span style="color: rgb(105, 105, 105); ">ừ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;th</span></strong><strong><span style="color: rgb(105, 105, 105); ">ẻ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;nh</span></strong><strong><span style="color: rgb(105, 105, 105); ">ớ</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;microSD v</span></strong><strong><span style="color: rgb(105, 105, 105); ">à</span></strong><strong><span style="color: rgb(105, 105, 105); ">&#160;USB, nút&#160;</span></strong><strong><span style="color: rgb(105, 105, 105); ">đ</span></strong><strong><span style="color: rgb(105, 105, 105); ">i</span></strong><strong><span style="color: rgb(105, 105, 105); ">ề</span></strong><strong><span style="color: rgb(105, 105, 105); ">u khi</span></strong><strong><span style="color: rgb(105, 105, 105); ">ể</span></strong><strong><span style="color: rgb(105, 105, 105); ">n ch</span></strong><strong><span style="color: rgb(105, 105, 105); ">ơ</span></strong><strong><span style="color: rgb(105, 105, 105); ">i nh</span></strong><strong><span style="color: rgb(105, 105, 105); ">ạ</span></strong><strong><span style="color: rgb(105, 105, 105); ">c trên loa NEXT/FOWARD/PLAY/PAUSE/VOLUME+/VOLUME-</span></strong></em><span style="font-family: Tahoma, Arial, Helvetica, sans-serif; color: rgb(105, 105, 105); "><br />\r\n<strong>Phụ kiện:</strong><br />\r\n<em>Loa, USB cable, 3.5 audio cable</em></span>', NULL, '&#160;Loa đa năng', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1342, 1, NULL, 206, 0, '0'),
(6440, '3g186r', '3G186R', '3G186R', '&#160;<span class="keyhigh"><b><span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;">3G186R</span></b></span><span class="apple-converted-space"><span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;">&#160;</span></span><span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;">là một router modem di động không dây được thiết kế cho các chuyên gia kinh doanh và những người đi du lịch thường xuyên.<span class="apple-converted-space">&#160;</span>Nó được phát triển dựa trên công nghệ WCDMA và IEEE802.11n.<span class="apple-converted-space">&#160;</span>Chỉ cần một thẻ sim 3G nó trở thành một modem 3G cung cấp lên đến tốc độ 7,2 Mbps downlink và uplink 5.76Mbps.<span class="apple-converted-space">&#160;</span>Nó cũng hoạt động như một bộ định tuyến không dây, cho phép bạn chia sẻ kết nối 3G cho 5 người.vậy bạn có thể truy cập internet bất cứ nơi nào bất cứ lúc nào.</span><span class="keyhigh"><b><span style="font-size: 4.5pt; line-height: 115%; font-family: Verdana, sans-serif;"> </span><span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;">3G186R</span></b></span><span class="apple-converted-space"><span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;">&#160;</span></span><span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;">cung cấp các tính năng bảo mật tiên tiến bao gồm WPA-PSK và WPA2-PSK</span><span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;"><br />\r\n<span class="keyhigh"><b><span style="background-position: initial initial; background-repeat: initial initial;">3G186R</span></b></span><span class="apple-converted-space"><span style="background-position: initial initial; background-repeat: initial initial;">&#160;</span></span><span style="background-position: initial initial; background-repeat: initial initial;">được hỗ trợ bởi một pin lithium ion, cho phép bạn làm những việc như duyệt web , gửi email và trò chuyện 3-4 giờ.có thể sạc trực tiếp bằng cổng usb&#160;</span></span>', NULL, '&#160;<span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;">router modem </span><span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;">3G Wireless di&#160;</span><span style="font-size: 10pt; line-height: 115%; font-family: Verdana, sans-serif;">động</span>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1346, 1, NULL, 141, 0, '15'),
(6441, '3g-150b', '3G 150B', '3G 150B', '&#160;<span style="font-size: 10pt; line-height: 115%; font-family: Arial, sans-serif; border: 1pt none windowtext; padding: 0in;">3G150B là một router 3G xách tay và chạy bằng pin được thiết kế để đi du lịch người kinh doanh.<span class="apple-converted-space">&#160;</span>Bởi chỉ cần gắn một USB modem UMTS / HSPA / EVDO, router này phù hợp 802.11n sẽ mang lại cho bạn sự tự do đi lang thang và vẫn còn kết nối với Internet, bạn có thể chia sẻ kết nối băng thông rộng không dây 3G của bạn với những người khác,nó cho phép truy cập Internet thông qua DSL / cáp hoặc WiFi.3G router có kích thước nhỏ.<span class="apple-converted-space">&#160;</span>10/100 Ethernet cổng WAN / LAN cho phép bạn truy cập vào một modem DSL / Cable.<span class="apple-converted-space">&#160;</span>Ngoài pin &#160;trong, nó chạy điện chính và USB, vì vậy bạn có thể tạo ra một điểm truy cập ngay lập tức để chia sẻ hầu như bất cứ nơi nào.<span class="apple-converted-space">&#160;</span>Ngoài ra, nó có chức năng WISP, cho phép bạn truy cập vào internet bằng cách kết nối với một WiFi signal, 3G150B hỗ trợ chế độ bảo mật tiên tiến bao gồm cả WPA và WPA2.<span class="apple-converted-space">&#160;</span>Tính năng Wi-Fi Protected Setup (WPS) cho phép các thiết bị để nhanh chóng thiết lập một kết nối an toàn đến điểm truy cập hoặc router không dây,</span><span style="font-size: 10pt; line-height: 115%; border: 1pt none windowtext; padding: 0in;"> </span><span style="font-size: 10pt; line-height: 115%; font-family: Arial, sans-serif; border: 1pt none windowtext; padding: 0in;">có thể sử dụng nó trên iPad và máy tính bảng.<span class="apple-converted-space">&#160;</span>pin kéo dài 5 đến 6 giờ</span>\r\n<p class="MsoNormal"><span style="font-size:10.0pt;line-height:115%;\r\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></p>', NULL, '&#160;<span style="font-size: 10pt; line-height: 115%; font-family: Arial, sans-serif; border: 1pt none windowtext; padding: 0in;">router 3G wrieless di động sử dụng sim mạng 3G&#160;</span>', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1346, 1, NULL, 156, 0, '15'),
(6442, 'p200', 'P200', 'P200', '&#160;<span style="color: rgb(68, 68, 68); font-family: Arial, sans-serif; font-size: 10pt; line-height: 115%;">Để xây dựng một mạng ở nhà hay văn phòng, Tenda Powerline Mini Adapter P200 là sự lựa chọn của bạn.</span><span class="apple-converted-space" style="color: rgb(68, 68, 68); font-family: Arial, sans-serif; font-size: 10pt; line-height: 115%;">&#160;</span><span style="color: rgb(68, 68, 68); font-family: Arial, sans-serif; font-size: 10pt; line-height: 115%;">Trong nhiều trường hợp, Ethernet không có sẵn trong những nơi kết nối mạng bạn cần.</span><span class="apple-converted-space" style="color: rgb(68, 68, 68); font-family: Arial, sans-serif; font-size: 10pt; line-height: 115%;">&#160;</span><span style="color: rgb(68, 68, 68); font-family: Arial, sans-serif; font-size: 10pt; line-height: 115%;">Tuy nhiên, hầu hết các phòng ở nhà hoặc văn phòng có mạch điện, có thể được sử dụng để mở rộng kết nối mạng từ router băng thông rộng của bạn Chỉ cần đơn giản cắm một P200 liên kết đến một modem / router băng thông rộng vào ổ cắm điện trong một phòng, và cắm khác P200 liên kết với một máy PC hoặc bất kỳ thiết bị Ethernet khác, bạn có thể sau đó dễ dàng và ngay lập tức kết nối với mạng lên 200Mbps tốc độ truyền</span>\r\n<p class="MsoNormal"><span style="font-size: 10pt; line-height: 115%; font-family: Arial, sans-serif; color: rgb(68, 68, 68); background-position: initial initial; background-repeat: initial initial;"><o:p></o:p></span></p>', NULL, '&#160;P200 chỉ cần cắm điện là có thể kết nối mạng trong nhà', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 1347, 1, NULL, 156, 0, '15'),
(6443, 'mini-a6', 'Mini A6', 'Mini A6', '&#160;', NULL, '&#160;wrieless mini 150Mbps', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1970-01-01 07:32:50', '', 71, 1, NULL, 152, 0, '15');

-- --------------------------------------------------------

--
-- Table structure for table `n_product_categories`
--

CREATE TABLE IF NOT EXISTS `n_product_categories` (
`id` int(14) NOT NULL,
  `pid` int(10) NOT NULL DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  `vn_name` varchar(255) DEFAULT '',
  `en_name` varchar(255) DEFAULT NULL,
  `vn_details` longtext,
  `en_details` longtext,
  `avatar` text,
  `position` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1670 ;

--
-- Dumping data for table `n_product_categories`
--

INSERT INTO `n_product_categories` (`id`, `pid`, `slug`, `vn_name`, `en_name`, `vn_details`, `en_details`, `avatar`, `position`, `status`) VALUES
(1669, 1659, 'macbook-cu-2nd', 'Macbook Cũ 2nd', '', '', '', '', 2, 1),
(1667, 0, 'thiet-bi-khac', 'Thiết bị khác', '', '', '', '30840_sanphamkhac-11.png', 5, 1),
(1668, 1659, 'laptop-cu-dell', 'Laptop cũ Dell', '', '', '', '', 1, 1),
(1666, 0, 'camera', 'Camera', '4', '', '', '21979_camera-11.png', 6, 1),
(1661, 0, 'may-tinh-bo', 'Máy tính bộ', '', '', '', '23784_maybo-11.png', 4, 1),
(1660, 0, 'linh-kien', 'Linh kiện', '', '', '', '109_linhkien-11.png', 2, 1),
(1659, 0, 'laptop-cu', 'Laptop cũ', '', '', '', '24708_laptop-11.png', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_questions`
--

CREATE TABLE IF NOT EXISTS `n_questions` (
`id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `people` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` char(5) CHARACTER SET latin1 NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(20) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `questions` text COLLATE utf8_unicode_ci NOT NULL,
  `answers` text COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `file_upload` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=76 ;

--
-- Dumping data for table `n_questions`
--

INSERT INTO `n_questions` (`id`, `sid`, `slug`, `people`, `lang`, `address`, `tel`, `email`, `questions`, `answers`, `date_created`, `file_upload`, `status`, `position`) VALUES
(66, 0, 'Laptop bị mất dữ liệu', '', 'vn', '', 0, '', '<p class="Lead">Laptop của m&igrave;nh tự nhi&ecirc;n mất folder trong ổ C, mất lu&ocirc;n  t&agrave;i liệu trong folder kh&aacute;c. M&igrave;nh kh&ocirc;ng c&agrave;i lại windows hay format g&igrave;  m&aacute;y hết. Tự nhi&ecirc;n 1 buổi s&aacute;ng kh&ocirc;ng thấy t&agrave;i liệu đ&acirc;u.</p>', '<p>Bạn kiểm tra dung lượng trước, nếu phần bị ẩn th&igrave; ổ cứng mất dung lượng(  v&iacute; dụ: ổ 100GB giờ chỉ c&ograve;n 60GB th&igrave; c&oacute; thể do virut, folder bị ẩn-  chỉnh lại. c&ograve;n nếu v&ocirc; t&igrave;nh xo&aacute; mất th&igrave; d&ugrave;ng phần mềm lấy lại dữ liệu  mất.</p>\r\n<p>Theo nhu m&ocirc; tả của bạn th&igrave; m&igrave;nh nghĩ ph&acirc;n v&ugrave;ng C của m&aacute;y ban đ&atilde; bị mất  khả năng quản l&yacute; bản FAT (mất định dạng). Về vấn đề n&agrave;y theo m&igrave;nh th&igrave;  nếu bạn c&oacute; kinh nghiệm c&oacute; thể d&ugrave;ng đĩa Hirent Boot chọn NTFS repair tool  để kh&ocirc;i phục lại bản FAT của m&igrave;nh. Nếu bạn kh&ocirc;ng r&agrave;nh về m&aacute;y t&iacute;nh lắm  th&igrave; c&oacute; thể bạn phải Format v&agrave; c&agrave;i mới lại Windows th&ocirc;i. Ch&uacute;c bạn th&agrave;nh  c&ocirc;ng. Lỗi n&agrave;y m&igrave;nh đ&atilde; gặp v&agrave; khắc phục được v&agrave; tất nhi&ecirc;n l&agrave; kh&ocirc;ng mất dữ  liệu.</p>\r\n<p>C&oacute; thể folder của bạn bị ẩn đi do ai đ&oacute; chọc ph&aacute; bạn.... bạn v&agrave;o bất cứ  folder n&agrave;o cũng được, ấn Alt (win n&agrave;o cũng ấn được, đặc biệt phải ấn nếu  d&ugrave;ng win 7 chưa chỉnh lại) sẽ th&acirc;y 1 mục g&oacute;c tr&ecirc;n, ben chọn  Tools--&gt;folder opti&oacute;n---&gt;view, nh&igrave;n xuống dưới, t&iacute;ch chọn Show  hiden..., bỏ chọn 3 c&aacute;i t&iacute;ch ở dưới c&aacute;i ở dưới c&oacute; dạng (hide....), nếu  n&oacute; bỏ rồi đi th&ocirc;i, xong ấn ok (trong l&uacute;c ấn n&oacute; cảnh b&aacute;o g&igrave; cứ yes cho  t&ocirc;i), xong ok bạn ra xem c&oacute; thấy folder đ&oacute; c&oacute; ko, ko th&igrave; bạn n&ecirc;n dow  những phần mềm kh&ocirc;i phục dữ liệu ổ cứng, trong b&agrave;i n&agrave;y  http://vnexpress.net/gl/vi-tinh/hoi-dap/2011/06/khoi-phuc-du-lieu-o-cung/</p>\r\n<p>M&aacute;y của bạn bị nhiễm Virus l&agrave;m ẩn c&aacute;c thư mục th&ocirc;i. Con virus n&agrave;y th&igrave; n&oacute;  kh&ocirc;ng g&acirc;y hại nhưng g&acirc;y hoang mang v&agrave; kh&oacute; chịu. Dữ liệu của bạn kh&ocirc;ng  bị mất đi nhưng sẽ bị ẩn. Đồng thời virus sẽ kho&aacute; chức năng hiện thư mục  ẩn trong Folder Option. Giải quyết con n&agrave;y bằng c&aacute;ch d&ugrave;ng chương tr&igrave;nh  FixAtribb của BKAV hoặc chương tr&igrave;nh Fix Autorun chọn chức năng bỏ ẩn  cho tất cả c&aacute;c thư mục. Nhưng đ&oacute; chỉ l&agrave; phương ph&aacute;p tạm thời v&igrave; nhiều  khi Fix xong n&oacute; lại bị ẩn lu&ocirc;n. L&uacute;c đ&oacute; th&igrave; ngon bổ rẻ nhất l&agrave; c&agrave;i lại  Win rồi mới Fix</p>\r\n<p>Bạn tải file c&agrave;i đặt WinXP SP2 về c&agrave;i l&agrave; xong. C&ograve;n muốn kh&ocirc;ng mất dữ liệu th&igrave; tải bản ghost về ghost lại m&aacute;y.</p>', '2011-06-17 15:34:08', '', 1, 5),
(72, 0, 'Hướng dẫn về boot', '', 'vn', '', 0, '', '<p>M&igrave;nh muốn hỏi chi tiết về đĩa hiren boot. C&aacute;c bước sử dụng từ đầu (l&uacute;c khởi động m&aacute;y cho đĩa v&agrave;o) đến l&uacute;c save được file boot, v&agrave; c&aacute;c bước để sử dụng n&oacute;.</p>', '<p class="Normal">Liệu khi d&ugrave;ng ch&iacute;nh file boot v&agrave; đĩa boot đ&oacute; v&agrave;o 1 m&aacute;y  kh&aacute;c, th&igrave; c&aacute;c th&agrave;nh phần của m&aacute;y gốc c&oacute; y hệt th&agrave;nh phần m&aacute;y được boot  kh&ocirc;ng?</p>\r\n<p class="Normal">Khi boot to&agrave;n bộ file trong ổ được ghost mất đi đ&uacute;ng kh&ocirc;ng (bung file ghost ấy)?</p>\r\n<p class="Normal">Đĩa n&agrave;y cho v&agrave;o c&oacute; thể x&oacute;a file, thay đổi t&agrave;i khoản  admin... l&agrave;m mọi việc với quyền cao nhất đ&uacute;ng kh&ocirc;ng, nếu vậy thay đổi  t&agrave;i khoản thế n&agrave;o?</p>\r\n<p class="Normal">Đĩa boot n&ecirc;n d&ugrave;ng loại norton ghost đ&uacute;ng kh&ocirc;ng, liệu  n&eacute;n mức độ high file sẽ bảo to&agrave;n trong v&ograve;ng bao nhiểu thời gian, để b&igrave;nh  thường được bao l&acirc;u?</p>', '2011-06-17 15:29:50', '', 1, 1),
(73, 0, 'Section 1.10.32 of ', '', 'vn', '', 0, '', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem  accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab  illo inventore veritatis et quasi architecto beatae vitae dicta sunt  explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut  odit aut fugit, sed quia consequuntur magni dolores eos qui ratione  voluptatem sequi nesciunt. Neque porro quisquam est, amet.</p>\r\n<p>consectetur, adipisci velit, sed quia non  numquam eius modi tempora incidunt ut labore et dolore magnam aliquam  quaerat voluptatem. Ut enim ad minima veniam, quis nostrum  exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea  commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea  voluptate velit esse quam nihil molestiae consequatur.</p>', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem  accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab  illo inventore veritatis et quasi architecto beatae vitae dicta sunt  explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut  odit aut fugit, sed quia consequuntur magni dolores eos qui ratione  voluptatem sequi nesciunt. Neque porro quisquam est, amet.</p>\r\n<p>consectetur, adipisci velit, sed quia non  numquam eius modi tempora incidunt ut labore et dolore magnam aliquam  quaerat voluptatem. Ut enim ad minima veniam, quis nostrum  exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea  commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea  voluptate velit esse quam nihil molestiae consequatur.</p>\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem  accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab  illo inventore veritatis et quasi architecto beatae vitae dicta sunt  explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut  odit aut fugit, sed quia consequuntur magni dolores eos qui ratione  voluptatem sequi nesciunt. Neque porro quisquam est, amet.</p>\r\n<p>consectetur, adipisci velit, sed quia non  numquam eius modi tempora incidunt ut labore et dolore magnam aliquam  quaerat voluptatem. Ut enim ad minima veniam, quis nostrum  exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea  commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea  voluptate velit esse quam nihil molestiae consequatur.</p>', '2011-08-17 15:44:06', '', 1, 2),
(71, 0, 'Tư vấn mua thiết bị dùng khi mất điện?', '', 'vn', '', 0, '', '<p><span style="color: black;">Bộ k&iacute;ch điện - lưu điện m&igrave;nh đ&atilde; d&ugrave;ng thử 4  loại  (v&igrave; định kinh doanh m&ugrave;a n&oacute;ng kiếm ch&uacute;t lời n&ecirc;n thử để biết), tr&ecirc;n  thị  trường c&oacute; nhiều, nhưng t&oacute;m lại l&agrave; c&oacute; 6 loại như sau, ph&acirc;n theo  Chủng như  sau:</span></p>', '<p><span style="color: black;">I - Chủng thứ nhất: từ điện 12V/24V k&iacute;ch l&ecirc;n 220V  xoay chiều s&oacute;ng dạng m&ocirc; phỏng h&igrave;nh sin (thực chất l&agrave; h&igrave;nh răng cưa), c&oacute;:</span><br /><span style="color: black;">1,  Loại điện tử của Trung Quốc nhỏ, gọn nhưng kh&ocirc;ng  k&egrave;m bộ sạc, nhiều nơi  rao ban đầu nghe th&igrave; rẻ (chỉ khoảng 500K đến 700K)  nhưng phải mua bộ  sạc ri&ecirc;ng cũng phải 400k.</span><br /><span style="color: black;">2, Loại điện tử của TQ c&oacute; t&iacute;ch hợp bộ sạc, gi&aacute;  khoảng hơn 1T.</span><br /><span style="color: black;">2  loại điện tử n&agrave;y c&ocirc;ng suất kh&ocirc;ng thật, ghi l&agrave;  1000W th&igrave; chỉ chạy được  tới 300W l&agrave; c&ugrave;ng (m&igrave;nh chạy 1TV, 1 loa 5.1 v&agrave; 1  đầu đĩa l&agrave; hết) v&agrave; điện  kh&ocirc;ng giống "điệnt hật", tức l&agrave; d&ugrave;ng quạt th&igrave;  n&oacute;ng v&agrave; &ugrave;, kh&ocirc;ng cẩn  thận ch&aacute;y quạt (nếu quạt đểu), chạy TV th&igrave; bị sọc  ngang như khi bị  nhiễu xe m&aacute;y chạy qua.</span><br /><span style="color: black;">3, Loại  điện - từ (c&oacute; biến &aacute;p từ b&ecirc;n trong) của  Trung Quốc, m&aacute;y nặng v&agrave; to như  một c&aacute;i ổn &aacute;p, c&oacute; t&iacute;ch hợp bộ sạc, c&ocirc;ng  suất tạm được, m&igrave;nh chạy thử bộ  1000W nối v&agrave;o mạng điện trong nh&agrave; (nhớ  ngắt cầu dao điện lưới ph&ograve;ng  khi c&oacute; điện sẽ bị x&ocirc;ng pha g&acirc;y ch&aacute;y) th&igrave;  d&ugrave;ng được 2 đ&egrave;n tu&yacute;p 1,2m +  1TV 21" + 1 m&aacute;y bơm nước 100W + 2 quạt.</span><br /><span style="color: black;">4,  Loại điện - từ do Việt Nam sản xuất c&oacute; t&iacute;ch hợp  bộ sạc: c&ocirc;ng suất cũng  đảm bảo, tương tự loại số 3 ở tr&ecirc;n, khi th&aacute;o ra  th&igrave; thấy linh kiện  cũng kh&aacute; hơn ch&uacute;t, chạy &ecirc;m v&agrave; &iacute;t n&oacute;ng hơn. Gi&aacute; bộ  500W khoảng 1,3T, bộ  1000W khoảng 1,6T. (n&oacute;i khoảng v&igrave; c&oacute; nơi b&aacute;n cao  hơn, nơi thấp hơn).  H&atilde;ng Robot c&oacute; nh&agrave; ph&acirc;n phối tại H&agrave; Nội, h&igrave;nh như ở  gần cầu Chương  Dương.</span><br /><span style="color: black;">Tất cả c&aacute;c loại thuộc d&ograve;ng  m&ocirc; phỏng s&oacute;ng sin th&igrave; đều  d&ugrave;ng tốt cho m&aacute;y t&iacute;nh, đ&egrave;n, TV, m&aacute;y xay sinh  tố, nhưng d&ugrave;ng quạt th&igrave;  kh&ocirc;ng cho hiệu quả cao: quạt chạy chậm v&agrave; n&oacute;ng.  C&aacute;c bạn n&ecirc;n nhớ tuyệt  đối kh&ocirc;ng cắm l&ograve; vi s&oacute;ng v&agrave;o bộ n&agrave;y, kể cả kh&ocirc;ng  chạy th&igrave; vẫn g&acirc;y ch&aacute;y  mạch điều khiển (m&igrave;nh bị ch&aacute;y rồi mới biết).</span><br /><strong><em><span style="color: black;">Để d&ugrave;ng c&aacute;c quạt v&agrave; c&aacute;c thiết bị điện kh&aacute;c một  c&aacute;ch an to&agrave;n v&agrave; "như thật" th&igrave; phải mua bộ s&oacute;ng sin chuẩn.</span></em></strong><br /><strong><span style="color: black;">II - Chủng thứ hai: k&iacute;ch l&ecirc;n d&ograve;ng xoay chiều s&oacute;ng  sin chuẩn</span></strong><span style="color: black;"> (true sine hay c&oacute; nơi ghi l&agrave;  pure sine)</span><br /><span style="color: black;">1, Của Việt Nam: gi&aacute; khoảng gấp đ&ocirc;i gi&aacute; bộ điện -  từ, tức 500W khoảng 2T, 1000W khoảng 2,8T, c&oacute; t&iacute;ch hợp bộ sạc.</span><br /><span style="color: black;">2, Bộ của Đ&agrave;i Loan hoặc Mỹ: gi&aacute; khoảng 8T - 10T bộ  1000W.</span><br /><span style="color: black;">Để  d&ugrave;ng được phải mua bộ k&iacute;ch (như c&aacute;c loại đ&atilde; n&oacute;i ở  tr&ecirc;n) v&agrave; 1 ắc quy.  T&iacute;nh c&ocirc;ng suất sử dụng c&aacute;c loại thiết bị cần d&ugrave;ng x 2  lần sẽ ra c&ocirc;ng  suất bộ k&iacute;ch cần mua, ri&ecirc;ng bộ điện tử phải x 3. Thời  gian d&ugrave;ng điện  phụ thuộc v&agrave;o c&ocirc;ng suất sử dụng v&agrave; dung lượng ắc quy,  t&iacute;nh bằng Ah (ăm  pe giờ), m&igrave;nh d&ugrave;ng khoảng 200W với ắc quy 100Ah th&igrave;  được khoảng 10giờ  li&ecirc;n tục. C&oacute; 2 loại ắc quy hiện nay: ắc quy ch&igrave; - ax&iacute;t  (gọi l&agrave; ắc quy  nước) v&agrave; ắc quy kh&ocirc; (cadimium), ắc quy kh&ocirc; đắt hơn 1  ch&uacute;t nhưng bền hơn  v&agrave; m&ugrave;a đ&ocirc;ng khi kh&ocirc;ng d&ugrave;ng th&igrave; kh&ocirc;ng sợ hỏng, ắc quy  nước phải d&ugrave;ng  li&ecirc;n tục.</span><br /><br /><span style="color: black;">Theo m&igrave;nh: nếu chỉ d&ugrave;ng 1TV, 2 quạt, 1 đ&egrave;n th&igrave; chỉ  cần mua loại 500W - 800W (TV c&agrave;ng to th&igrave; c&agrave;ng tốn điện).</span><br /><br /><span style="color: black;">C&aacute;c  loại tr&ecirc;n đều sử dụng theo c&aacute;ch: khi c&oacute; điện  lưới th&igrave; bật chế độ sạc,  khi mất điện phải r&uacute;t ph&iacute;ch cắm của sạc ra v&agrave;  bật c&ocirc;ng tắc k&iacute;ch l&ecirc;n mới  d&ugrave;ng được. H&ocirc;m vừa rồi mới nghe thấy c&oacute; loại  tự động ho&agrave;n to&agrave;n, d&ugrave;ng  giống hệt bộ UPS (bộ lưu điện hay d&ugrave;ng cho m&aacute;y  t&iacute;nh ở Văn ph&ograve;ng). Bộ  n&agrave;y th&iacute;ch hợp cho văn ph&ograve;ng nhỏ: cắm m&aacute;y t&iacute;nh, m&aacute;y  tin v&agrave;o bộ k&iacute;ch, khi  mất điện lưới n&oacute; sẽ tự động chuyển sang điện ắc  quy, thời gian chuyển  cực nhanh, m&aacute;y t&iacute;nh sẽ chạy li&ecirc;n tục kh&ocirc;ng bị tắt  đột ngột, m&igrave;nh chưa  thử bộ n&agrave;y.</span><br /><br /><span style="color: black;">M&igrave;nh chưa d&ugrave;ng thử loại của Mỹ v&agrave; Đ&agrave;i Loan s&oacute;ng sin  chuẩn (v&igrave; đắt qu&aacute; kh&ocirc;ng d&aacute;m mua thử nữa), chỉ đọc t&agrave;i liệu th&ocirc;i.</span><br /><br /><span style="color: black;">Ch&uacute;c c&aacute;c bạn c&oacute; một m&ugrave;a h&egrave; dễ chịu.</span></p>', '2011-06-17 15:24:22', '', 1, 6),
(70, 0, 'Cài Windows XP SP2 cho Dell Vostro 3500', '', 'vn', '', 0, '', '<p class="Lead">Em mới mua laptop Dell Vostro 3500 m&atilde; tag: 1kv8cl1. Em  muốn c&agrave;i Windows XP SP2 để phục vụ tốt hơn cho việc học tập của m&igrave;nh. Em  muốn nhờ anh chị hướng dẫn em c&aacute;ch c&agrave;i cụ thể.</p>', '<p>Bạn tải phần mềm m&ocirc; phỏng quy tr&igrave;nh c&agrave;i đặt windows XP tại đ&acirc;y : "http://files3.download3000.com/download/<br />b72b1b99d3877f112916e8aa4edfba2c/56/29048/winxp_simulator.exe"  rồi l&agrave;m theo hướng dẫn tr&ecirc;n m&agrave;n h&igrave;nh. Sau khi l&agrave;m quen rồi bạn c&oacute; thể  l&agrave;m thật. Với c&aacute;c m&aacute;y t&iacute;nh mới, việc c&agrave;i đặt windows xp c&oacute; thể tương đối  kh&oacute; khăn do thiếu tr&igrave;nh điều khiển ở text-mode cho ổ cứng SATA v&agrave; tr&igrave;nh  điều khiển c&aacute;c thiết bị hiện đại. Lời khuy&ecirc;n của m&igrave;nh l&agrave; bạn n&ecirc;n d&ugrave;ng  Windows 7 với chức năng XP-Mode. Hướng dẫn cụ thể về XP-Mode bạn c&oacute; thể  t&igrave;m rất dễ d&agrave;ng tr&ecirc;n mạng. C&ograve;n hướng dẫn cụ thể quy tr&igrave;nh c&agrave;i đặt về XP  th&igrave; m&igrave;nh, cũng như nhiều người kh&aacute;c, kh&ocirc;ng thể viết ra được v&igrave; qu&aacute; d&agrave;i,  kh&oacute; viết tổng qu&aacute;t. Viết ngắn gọn th&igrave; rất dễ nhưng với những người thiếu  kiến thức cơ bản th&igrave; lại kh&oacute; giải quyết những kh&oacute; khăn gặp phải trong  qu&aacute; tr&igrave;nh c&agrave;i đặt tr&ecirc;n m&aacute;y t&iacute;nh mới m&agrave; bọn m&igrave;nh cũng kh&ocirc;ng lường hết  được.</p>', '2011-06-17 15:31:54', '', 1, 3),
(75, 0, 'Laptop HP dv5t bị lỗi không vào mạng được', '', 'vn', '', 0, '', '<p>T&ocirc;i c&oacute; laptop HP dv5t tự dưng bị lỗi mất S/N, P/N v&agrave; LAN MAC  physical number. T&ocirc;i thấy tr&ecirc;n mạng đ&atilde; c&oacute; nhiều người hỏi về vấn đề n&agrave;y,  xin hỏi c&oacute; giải ph&aacute;p g&igrave; để chữa chưa? Nếu c&oacute; xin vui l&ograve;ng gi&uacute;p t&ocirc;i.</p>', '<p>C&aacute;ch khắc phục như sau: V&agrave;o đường dẫn: Control Panel  Network and  Internet  Network Connections Click chuột phải biểu tượng: "Wireless  Network Connection" chọn " Properties" =&gt; "Configure" =&gt; "Driver"  =&gt; "Uninstall" =&gt; " OK" chờ đến ho&agrave;n tất qu&aacute; tr&igrave;nh. Bạn h&atilde;y khởi  động lại m&aacute;y t&iacute;nh nh&eacute; v&agrave; l&uacute;c n&agrave;y Driver Wifi se nhận lại sẽ v&agrave;o Internet  b&igrave;nh thường th&ocirc;i. Bạn c&oacute; thể l&agrave;m như thế cho mạng Lan.</p>', '2011-06-17 15:30:08', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_resource`
--

CREATE TABLE IF NOT EXISTS `n_resource` (
`id` bigint(20) NOT NULL,
  `aid` int(11) DEFAULT NULL,
  `file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `resource_type` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vn_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vn_description` text COLLATE utf8_unicode_ci,
  `en_description` text COLLATE utf8_unicode_ci,
  `cn_description` text COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) DEFAULT NULL,
  `position` tinyint(4) DEFAULT NULL,
  `thumbnail_format` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=92 ;

--
-- Dumping data for table `n_resource`
--

INSERT INTO `n_resource` (`id`, `aid`, `file_name`, `file_size`, `resource_type`, `vn_name`, `en_name`, `cn_name`, `vn_description`, `en_description`, `cn_description`, `date_created`, `url`, `properties`, `status`, `position`, `thumbnail_format`) VALUES
(90, 1, '1983008676_bao-gia-pc_elead-fpt-_qui-iii-20144.xls', 519154171904, '.xls', 'Bảng giá mới nhất', '0', '', '0', '0', '', '2014-11-05 08:59:55', '0', 'bang-gia-moi-nhat', 1, 1, '.xls'),
(91, 1, '654477452_bang-gia-pc-lcd-lenovo-t10-2014 .pdf', 194080, '.pdf', 'BANG GIA PC & LCD  LENOVO  T10  2014 ', '0', '', '0', '0', '', '2014-11-05 09:00:02', '0', 'bang-gia-pc-lcd-lenovo-t10-2014-', 1, 1, '.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `n_sale`
--

CREATE TABLE IF NOT EXISTS `n_sale` (
`id` bigint(20) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sapo` text COLLATE utf8_unicode_ci,
  `details` text COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `home` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_static`
--

CREATE TABLE IF NOT EXISTS `n_static` (
`id` bigint(20) NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vn_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vn_sapo` longtext COLLATE utf8_unicode_ci,
  `en_sapo` longtext COLLATE utf8_unicode_ci,
  `vn_details` longtext COLLATE utf8_unicode_ci,
  `en_details` longtext COLLATE utf8_unicode_ci,
  `status` tinyint(4) DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` tinyint(4) DEFAULT NULL,
  `home` tinyint(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_subject_question`
--

CREATE TABLE IF NOT EXISTS `n_subject_question` (
`id` int(11) NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vn_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `en_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_support`
--

CREATE TABLE IF NOT EXISTS `n_support` (
`id` int(10) NOT NULL,
  `paid` int(10) DEFAULT NULL,
  `vn_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `en_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `telephone` varchar(50) DEFAULT NULL,
  `cellphone` varchar(10) DEFAULT NULL,
  `nick_yahoo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nick_skype` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `position` tinyint(5) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `n_support`
--

INSERT INTO `n_support` (`id`, `paid`, `vn_name`, `en_name`, `telephone`, `cellphone`, `nick_yahoo`, `nick_skype`, `status`, `position`) VALUES
(52, 5, 'Pham Trưởng media', '', '0907 4007 54', '0', 'phamtruong_media', 'phamtruong_media', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `n_tamgia`
--

CREATE TABLE IF NOT EXISTS `n_tamgia` (
`id` int(11) NOT NULL,
  `vn_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pricefrom` double(20,10) DEFAULT NULL,
  `priceto` double(20,10) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `n_tamgia`
--

INSERT INTO `n_tamgia` (`id`, `vn_name`, `en_name`, `status`, `code`, `pricefrom`, `priceto`) VALUES
(1, 'Từ 0 đến 1.000.000đ', '', 1, NULL, 0.0000000000, 1000000.0000000000),
(2, 'Từ 1.000.000 đến 3.000.000', '', 1, NULL, 1000000.0000000000, 3000000.0000000000),
(3, 'Từ 3.000.000 đến 5.000.000', '', 1, NULL, 3000000.0000000000, 5000000.0000000000),
(4, 'Từ 5.000.000 đến 7.000.000', '', 1, NULL, 5000000.0000000000, 7000000.0000000000),
(5, 'Từ 7.000.000 đến 10.000.000', '', 1, NULL, 7000000.0000000000, 10000000.0000000000),
(6, 'Từ 10.000.000 đến 15.000.000', '', 1, NULL, 10000000.0000000000, 15000000.0000000000),
(7, 'Từ 15.000.000 đến 20.000.000', '', 1, NULL, 15000000.0000000000, 20000000.0000000000),
(8, 'Trên 20.000.000 VNĐ', '', 1, NULL, 20000000.0000000000, 100000000.0000000000);

-- --------------------------------------------------------

--
-- Table structure for table `n_textbanner`
--

CREATE TABLE IF NOT EXISTS `n_textbanner` (
`id` int(11) NOT NULL,
  `vn_name` text COLLATE utf8_unicode_ci,
  `en_name` text COLLATE utf8_unicode_ci,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `n_user`
--

CREATE TABLE IF NOT EXISTS `n_user` (
`id` bigint(20) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `fname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cell` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2223 ;

--
-- Dumping data for table `n_user`
--

INSERT INTO `n_user` (`id`, `username`, `password`, `type`, `fname`, `lname`, `about`, `email`, `company`, `tax`, `address`, `address2`, `tel`, `fax`, `cell`, `date_created`, `last_login`, `status`, `properties`) VALUES
(1152, 'admin', '21232f297a57a5a743894a0e4a801fc3', 9, 'ava', 'ava', 'ava', 'ava@ava.vn', 'ava', '', '', '', '', '', '', '2011-03-08 17:39:53', '2015-06-10 05:50:55', 3, ''),
(1111, 'sale', '21232f297a57a5a743894a0e4a801fc3', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-02 08:24:16', 2, NULL),
(2222, 'test', '21232f297a57a5a743894a0e4a801fc3', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-02 08:05:51', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `n_user_types`
--

CREATE TABLE IF NOT EXISTS `n_user_types` (
  `id` tinyint(4) NOT NULL,
  `vn_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jp_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `n_user_types`
--

INSERT INTO `n_user_types` (`id`, `vn_type`, `en_type`, `jp_type`, `cn_type`, `status`) VALUES
(1, 'Khách hàng', 'Customer', 'Customer', 'Customer', 1),
(6, 'Nhân viên', 'Staff', 'Staff', 'Staff', 1),
(9, 'Quản trị', 'Administrator', 'Administrator', 'Administrator', 1);

-- --------------------------------------------------------

--
-- Table structure for table `n_vote`
--

CREATE TABLE IF NOT EXISTS `n_vote` (
`id` int(11) NOT NULL,
  `idproduct` int(11) DEFAULT NULL,
  `iduser` text COLLATE utf8_unicode_ci,
  `chatluong_vote` int(11) DEFAULT NULL,
  `hinhdang_vote` int(11) DEFAULT NULL,
  `gia_vote` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=125 ;

--
-- Dumping data for table `n_vote`
--

INSERT INTO `n_vote` (`id`, `idproduct`, `iduser`, `chatluong_vote`, `hinhdang_vote`, `gia_vote`, `status`, `name`, `title`, `comment`, `date_created`) VALUES
(111, 231, '86020ed2be69b5eb5fa6989d138d681c', 5, NULL, NULL, 1, 'nhut', 'tieu de', 'binh luan', '2012-08-23 15:57:36'),
(112, 253, '779c289d7d6e395e185f34ab90e1e42a', 5, NULL, NULL, 1, 'Nhut', 'Tieu de', 'Binh luan', '2012-08-29 15:39:08'),
(113, 232, 'ed17237f415ac1531a2cbf18c56b66a0', 4, NULL, NULL, 1, 'ngocvien', 'áo', 'very good', '2012-08-29 16:13:15'),
(114, 245, '74ba4067618679b1e966701a9f36bf3b', 4, NULL, NULL, 1, 'TESTER', 'Tiêu đề', 'Bình luận', '2012-09-13 16:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `n_weblinks`
--

CREATE TABLE IF NOT EXISTS `n_weblinks` (
`id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `vn_name` varchar(255) NOT NULL,
  `en_name` varchar(255) DEFAULT NULL,
  `cn_name` varchar(255) DEFAULT NULL,
  `vn_sapo` varchar(255) DEFAULT NULL,
  `en_sapo` varchar(255) DEFAULT NULL,
  `cn_sapo` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `n_weblinks`
--

INSERT INTO `n_weblinks` (`id`, `pid`, `vn_name`, `en_name`, `cn_name`, `vn_sapo`, `en_sapo`, `cn_sapo`, `avatar`, `url`, `position`, `status`) VALUES
(7, 0, 'Công ty TNHH MTV PTCN Tân Thuận(IPC)', 'Công ty TNHH MTV PTCN Tân Thuận(IPC)-en', '', '', '', '', '', 'http://ttipc.vn/', 0, 0),
(13, 0, 'Ban quản lý khu Nam (MASD)', 'Ban quản lý khu Nam (MASD)-en', '', '', '', '', '', 'http://www.bqlkhunam.hochiminhcity.gov.vn/web/tintuc/default.aspx', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `counter_ips`
--
ALTER TABLE `counter_ips`
 ADD UNIQUE KEY `ip` (`ip`);

--
-- Indexes for table `counter_values`
--
ALTER TABLE `counter_values`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ep_stats`
--
ALTER TABLE `ep_stats`
 ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `n_ads`
--
ALTER TABLE `n_ads`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_ads_home`
--
ALTER TABLE `n_ads_home`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_ad_groups`
--
ALTER TABLE `n_ad_groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_ad_groups_home`
--
ALTER TABLE `n_ad_groups_home`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_album`
--
ALTER TABLE `n_album`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_albumproduct`
--
ALTER TABLE `n_albumproduct`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_cart_items`
--
ALTER TABLE `n_cart_items`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_category`
--
ALTER TABLE `n_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_comments`
--
ALTER TABLE `n_comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_config`
--
ALTER TABLE `n_config`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_customers`
--
ALTER TABLE `n_customers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_email`
--
ALTER TABLE `n_email`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_flashbanner`
--
ALTER TABLE `n_flashbanner`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_gallery`
--
ALTER TABLE `n_gallery`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_gallery_groups`
--
ALTER TABLE `n_gallery_groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_imgbanner`
--
ALTER TABLE `n_imgbanner`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_imgproducts`
--
ALTER TABLE `n_imgproducts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_members`
--
ALTER TABLE `n_members`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_menus`
--
ALTER TABLE `n_menus`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_menu_groups`
--
ALTER TABLE `n_menu_groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_news`
--
ALTER TABLE `n_news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_orders`
--
ALTER TABLE `n_orders`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_order_items`
--
ALTER TABLE `n_order_items`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_parts`
--
ALTER TABLE `n_parts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_poll`
--
ALTER TABLE `n_poll`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_productpic_host`
--
ALTER TABLE `n_productpic_host`
 ADD PRIMARY KEY (`productpicid`), ADD KEY `productpicid` (`productid`);

--
-- Indexes for table `n_products`
--
ALTER TABLE `n_products`
 ADD PRIMARY KEY (`id`), ADD KEY `productcatid` (`category`);

--
-- Indexes for table `n_products_bk`
--
ALTER TABLE `n_products_bk`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_products_copy`
--
ALTER TABLE `n_products_copy`
 ADD PRIMARY KEY (`id`), ADD KEY `productcatid` (`category`);

--
-- Indexes for table `n_product_categories`
--
ALTER TABLE `n_product_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_questions`
--
ALTER TABLE `n_questions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_resource`
--
ALTER TABLE `n_resource`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_sale`
--
ALTER TABLE `n_sale`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_static`
--
ALTER TABLE `n_static`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_subject_question`
--
ALTER TABLE `n_subject_question`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_support`
--
ALTER TABLE `n_support`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_tamgia`
--
ALTER TABLE `n_tamgia`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_textbanner`
--
ALTER TABLE `n_textbanner`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_user`
--
ALTER TABLE `n_user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_user_types`
--
ALTER TABLE `n_user_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_vote`
--
ALTER TABLE `n_vote`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_weblinks`
--
ALTER TABLE `n_weblinks`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `n_ads`
--
ALTER TABLE `n_ads`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `n_ads_home`
--
ALTER TABLE `n_ads_home`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `n_ad_groups`
--
ALTER TABLE `n_ad_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `n_ad_groups_home`
--
ALTER TABLE `n_ad_groups_home`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `n_album`
--
ALTER TABLE `n_album`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `n_albumproduct`
--
ALTER TABLE `n_albumproduct`
MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `n_cart_items`
--
ALTER TABLE `n_cart_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=601;
--
-- AUTO_INCREMENT for table `n_category`
--
ALTER TABLE `n_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `n_comments`
--
ALTER TABLE `n_comments`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=670;
--
-- AUTO_INCREMENT for table `n_config`
--
ALTER TABLE `n_config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `n_customers`
--
ALTER TABLE `n_customers`
MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `n_email`
--
ALTER TABLE `n_email`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `n_flashbanner`
--
ALTER TABLE `n_flashbanner`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `n_gallery`
--
ALTER TABLE `n_gallery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `n_gallery_groups`
--
ALTER TABLE `n_gallery_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `n_imgbanner`
--
ALTER TABLE `n_imgbanner`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `n_imgproducts`
--
ALTER TABLE `n_imgproducts`
MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `n_members`
--
ALTER TABLE `n_members`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `n_menus`
--
ALTER TABLE `n_menus`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `n_menu_groups`
--
ALTER TABLE `n_menu_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `n_news`
--
ALTER TABLE `n_news`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `n_orders`
--
ALTER TABLE `n_orders`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `n_order_items`
--
ALTER TABLE `n_order_items`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=263;
--
-- AUTO_INCREMENT for table `n_parts`
--
ALTER TABLE `n_parts`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `n_poll`
--
ALTER TABLE `n_poll`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `n_productpic_host`
--
ALTER TABLE `n_productpic_host`
MODIFY `productpicid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7515;
--
-- AUTO_INCREMENT for table `n_products`
--
ALTER TABLE `n_products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7971;
--
-- AUTO_INCREMENT for table `n_products_bk`
--
ALTER TABLE `n_products_bk`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `n_products_copy`
--
ALTER TABLE `n_products_copy`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6472;
--
-- AUTO_INCREMENT for table `n_product_categories`
--
ALTER TABLE `n_product_categories`
MODIFY `id` int(14) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1670;
--
-- AUTO_INCREMENT for table `n_questions`
--
ALTER TABLE `n_questions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `n_resource`
--
ALTER TABLE `n_resource`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `n_sale`
--
ALTER TABLE `n_sale`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `n_static`
--
ALTER TABLE `n_static`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `n_subject_question`
--
ALTER TABLE `n_subject_question`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `n_support`
--
ALTER TABLE `n_support`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `n_tamgia`
--
ALTER TABLE `n_tamgia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `n_textbanner`
--
ALTER TABLE `n_textbanner`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `n_user`
--
ALTER TABLE `n_user`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2223;
--
-- AUTO_INCREMENT for table `n_vote`
--
ALTER TABLE `n_vote`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `n_weblinks`
--
ALTER TABLE `n_weblinks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
