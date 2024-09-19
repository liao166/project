-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 
-- 伺服器版本： 8.0.17
-- PHP 版本： 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `chinese_pharmacy`
--

-- --------------------------------------------------------

--
-- 資料表結構 `addbook`
--

CREATE TABLE `addbook` (
  `addressid` int(10) NOT NULL COMMENT '地址ID',
  `setdefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT '預設收件人',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者姓名',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者電話',
  `myzip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '郵遞區號',
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件地址',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `addbook`
--

INSERT INTO `addbook` (`addressid`, `setdefault`, `emailid`, `cname`, `mobile`, `myzip`, `address`, `create_date`) VALUES
(2, 1, 3, '廖良錦', '0966158196', '414', '民權街75號', '2023-12-01 10:28:55');

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cartid` int(10) NOT NULL COMMENT '購物車編號',
  `emailid` int(10) DEFAULT NULL COMMENT '會員編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `qty` int(3) NOT NULL COMMENT '產品數量',
  `orderid` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '訂單編號',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `ip` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂購者的IP',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入購物車時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `city`
--

CREATE TABLE `city` (
  `AutoNo` int(10) NOT NULL COMMENT '城市編號',
  `Name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市名稱',
  `cityOrder` tinyint(2) NOT NULL COMMENT '標記',
  `State` smallint(6) NOT NULL COMMENT '狀態'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `city`
--

INSERT INTO `city` (`AutoNo`, `Name`, `cityOrder`, `State`) VALUES
(1, '臺北市', 0, 0),
(2, '基隆市', 0, 0),
(3, '新北市', 0, 0),
(4, '宜蘭縣', 0, 0),
(5, '新竹市', 0, 0),
(6, '新竹縣', 0, 0),
(7, '桃園市', 0, 0),
(8, '苗栗縣', 0, 0),
(9, '台中市', 0, 0),
(10, '彰化縣', 0, 0),
(11, '南投縣', 0, 0),
(12, '雲林縣', 0, 0),
(13, '嘉義市', 0, 0),
(14, '嘉義縣', 0, 0),
(15, '台南市', 0, 0),
(16, '高雄市', 0, 0),
(17, '南海諸島', 0, 0),
(18, '澎湖縣', 0, 0),
(19, '屏東縣', 0, 0),
(20, '台東縣', 0, 0),
(21, '花蓮縣', 0, 0),
(22, '金門縣', 0, 0),
(23, '連江縣', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL COMMENT '使用者id',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '使用者中文姓名',
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '使用者電話',
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '使用者email',
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '使用者地址',
  `message` text COLLATE utf8_unicode_ci NOT NULL COMMENT '使用者訊息',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '訊息日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `emailid` int(11) NOT NULL COMMENT 'email流水號',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email帳號',
  `pw1` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密碼',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否啟動',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '中文姓名',
  `tssn` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '身份證字號',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `imgname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相片檔名',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `lineid` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Line用戶id',
  `googleid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'google用戶id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`emailid`, `email`, `pw1`, `active`, `cname`, `tssn`, `birthday`, `imgname`, `create_date`, `lineid`, `googleid`) VALUES
(1, 'test@gmail.com', '123456', 1, '林小強', 'A123456789', '2021-04-01', '', '2021-04-21 10:39:50', NULL, NULL),
(2, 'te@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '李小明', 'A223456789', '2021-04-01', '', '2021-04-21 10:41:48', NULL, NULL),
(3, '3111kr35@gmail.com', '', 1, '廖良錦', '', NULL, NULL, '2023-11-27 11:55:33', 'U4a0b57af00cbc1fe88084757950d0f2a', '104023097292349880914');

-- --------------------------------------------------------

--
-- 資料表結構 `multiselect`
--

CREATE TABLE `multiselect` (
  `msid` int(5) NOT NULL COMMENT '多功能選擇ID',
  `mslevel` int(2) NOT NULL COMMENT '多功能選擇層級',
  `msuplink` int(4) NOT NULL COMMENT '上層連結',
  `opcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外掛參數',
  `msname` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '多功能選擇名稱',
  `msort` int(11) DEFAULT NULL COMMENT '各功能列表排序',
  `url1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外掛網址1',
  `url2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外掛網址2',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `multiselect`
--

INSERT INTO `multiselect` (`msid`, `mslevel`, `msuplink`, `opcode`, `msname`, `msort`, `url1`, `url2`, `create_date`) VALUES
(1, 1, 0, NULL, '付款方式', 0, NULL, NULL, '2023-08-11 01:46:53'),
(2, 1, 0, NULL, '訂單處理狀態', 0, NULL, NULL, '2023-08-11 01:52:29'),
(3, 2, 1, '', '貨到付款', 1, NULL, NULL, '2023-08-11 01:55:45'),
(4, 2, 1, NULL, '信用卡付款', 2, NULL, NULL, '2023-08-11 01:55:45'),
(5, 2, 1, NULL, '銀行轉帳', 3, NULL, NULL, '2023-08-11 01:55:45'),
(6, 2, 1, NULL, '電子支付', 4, NULL, NULL, '2023-08-11 01:55:45'),
(7, 2, 2, NULL, '處理中', 1, NULL, NULL, '2023-08-11 02:06:42'),
(8, 2, 2, NULL, '待出貨', 2, NULL, NULL, '2023-08-11 02:06:42'),
(9, 2, 2, NULL, '運送中', 3, NULL, NULL, '2023-08-11 02:06:42'),
(10, 2, 2, NULL, '收貨完成', 4, NULL, NULL, '2023-08-11 02:06:42'),
(11, 2, 2, NULL, '退貨中', 5, NULL, NULL, '2023-08-11 02:06:42'),
(12, 2, 2, NULL, '已關閉訂單', 6, NULL, NULL, '2023-08-11 02:06:42'),
(13, 2, 2, NULL, '無效訂單', 7, '', NULL, '2023-08-11 02:06:42'),
(14, 2, 2, NULL, '等待付款', 8, NULL, NULL, '2023-08-17 22:13:47');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `p_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '產品名稱',
  `p_intro` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '產品簡介',
  `p_price` int(11) DEFAULT NULL COMMENT '產品單價',
  `p_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上架',
  `p_content` text COLLATE utf8_unicode_ci COMMENT '產品詳細規格',
  `p_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '產品輸入日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(1, 1, '人參藥膳湯包(80克/包)', NULL, 120, 1, '<p class=\"t1\">藥香味醇</p>\r\n<p class=\"t1\">清爽無燥</p>\r\n<p class=\"t1\">成分：人參鬚、紅棗、當歸、川芎、玉竹</p>', '2023-08-27 09:03:01'),
(2, 1, '當歸鴨湯包(70克/包)', NULL, 80, 1, '<p class=\"t1\">清淡爽口</p>\r\n<p class=\"t1\">溫補好滋味</p>\r\n<p class=\"t1\">成分：當歸尾、川芎、桂枝、肉桂、枸杞</p>', '2023-08-27 09:03:01'),
(3, 1, '燒雞酒湯包(70克/包)', NULL, 80, 1, '<p class=\"t1\">清淡爽口</p>\r\n<p class=\"t1\">溫補好滋味</p>\r\n<p class=\"t1\">成分：肉桂、當歸、川芎、枸杞、桂枝</p>', '2023-08-27 09:03:01'),
(4, 1, '薑母鴨湯包(70克/包)', NULL, 80, 1, '<p class=\"t1\">清淡爽口</p>\r\n<p class=\"t1\">溫補好滋味</p>\r\n<p class=\"t1\">成分：當歸、川芎、桂枝、枸杞、肉桂、薑</p>', '2023-08-27 09:03:01'),
(5, 1, '杜仲四物藥膳湯包(100克/包)', NULL, 100, 1, '<p class=\"t1\">悅氣養顏</p>\r\n<p class=\"t1\">香氣濃郁</p>\r\n<p class=\"t1\">成分：杜仲、當歸、熟地、芍藥、川芎、肉桂、桂枝、故紙花、黑棗、枸杞</p>', '2023-08-27 09:03:01'),
(6, 1, '四神湯包(150克/包)', NULL, 160, 1, '<p class=\"t1\">清淡爽口</p>\r\n<p class=\"t1\">溫補好滋味</p>\r\n<p class=\"t1\">成分：茯苓、淮山、蓮子、芡實、當歸、川芎</p>', '2023-08-27 09:03:01'),
(7, 2, '中藥藥膏貼布(每張)', NULL, 200, 1, '<p class=\"t1\">功效：專門治療跌傷、撞傷、打傷...等所造成的骨傷或瘀青。</p>', '2023-08-27 09:05:15'),
(8, 3, '四物湯(每帖)', NULL, 100, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>當歸10克，川芎10克，熟地黃10克，白芍10克。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>營血虛滯證或衝任虛損證。頭暈目眩、心悸、耳鳴、唇甲無華、婦人月經不調，量少或經閉不行，臍腹作痛，舌淡紅、脈弦細或細澀。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>本方是補血兼能活血的方劑，也是婦女調經的基礎方。血虛則血不能充盈，胞脈失養，則月經不調，崩漏下血；血虛則運行遲滯，故經行腹痛。方中熟地滋陰補血，當歸補血和血，二藥重在補血，為主藥；白芍柔肝養血，川芎行氣活血，為輔助藥，綜合四藥作用，地、芍是血中之血藥，歸、芎是血中之氣藥，兩相配合，可使補而不滯，營血調和。故本方具有養血、活血、行氣的功用，不僅血虛之證可以補血，即血滯之證亦可加減運用，特別是婦女月經不調，臨床應用尤多。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">注意禁忌：</td>\r\n            <td>凡平素脾胃虛弱，運化無力，食少便溏者，慎用。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>本方補血，調理血液循環。用於貧血、月經不調、閉經、痛經、蕁麻疹、慢性皮膚病、跌打損傷、神經性頭痛、帶下、不妊症、更年期障礙、高血壓、腦溢血、自律神經失調、產前產後諸病、腳氣。</td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(9, 3, '四君子湯(每帖)', NULL, 100, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>人參15克，甘草5克，茯苓10克，白朮10克。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>治脾胃氣虛，心腹脹滿，面色蒼白，語弱聲低，四肢無力，納呆，脈虛無力，舌淡苔白。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>本方為補氣，健脾的基礎方劑，很多健脾、補氣的方劑都是從本方衍化而來的。方中人參甘溫補氣，健脾養胃為君；白朮甘溫補脾益氣，燥濕健脾為輔；茯苓滲淡健脾，能使參，白朮補而不滯為佐；炙甘草益氣補脾，調和諸藥。四藥合用，益氣健脾，既是益氣的代表方，又是健脾的基礎方劑。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>本方增強消化吸收功能，提高機體免疫力。用於慢性胃腸炎、胃下垂、胃弛緩、胃十二指腸潰瘍、胃腸功能減退、手足痿弱、半身不遂、糖尿病、夜尿、遺尿等。</td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(10, 3, '十全大補湯(每帖)', NULL, 350, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>人參5克，白朮5克，茯苓5克，甘草5克，當歸5克，川芎5克，熟地黃5克，白芍5克，黃耆5克，肉桂5克，生薑5克，大棗2枚。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>諸虛百損，頭暈目眩，消瘦納呆，足膝無力等，諸虛弱證。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>方中參、苓、朮、草為四君，俱益氣補中，健脾養胃之功，是治療脾胃氣虛、運化乏力之方；歸、芎、芍、地為四物，俱補血調經之效，有補而不滯，活瘀而不破之功，加黃耆補氣升陽，固表止汗；肉桂溫補命門，填補真元。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>\r\n                本方補血，糾正和減輕貧血，增強免疫功能。用於：\r\n                <ol>\r\n                    <li>貧血、病後或術後衰弱之調理。</li>\r\n                    <li>各種出血、癰疽、痔瘻、骨疽、骨結核、腎結核、瘰癧、白血病、夢精、帶下、視力減退、凍傷、癌症輔助治療、經閉、腳氣、皮膚病、梅尼爾氏症候群、耳疾等。</li>\r\n                </ol>\r\n            </td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(11, 3, '升麻葛根湯(每帖)', NULL, 200, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>葛根5克，升麻5克，白芍5克，甘草5克。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>\r\n                <ol>\r\n                    <li>治陽明傷寒中風，頭疼身痛、發熱惡寒、無汗、口渴、目痛、鼻乾不得臥。</li>\r\n                    <li>麻疹未發或發而未透，症見發熱惡風，頭痛體疼、噴嚏、咳嗽、目赤流淚、口渴、舌紅苔乾、脈浮數。</li>\r\n                </ol>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>方中升麻甘辛微寒，透疹解毒；葛根甘辛平，解肌透疹，生津止渴，二味相配，不但清熱解肌之功倍增，且透疹之力更著；赤芍和營瀉熱，與甘草同用，養陰和中，甘草又能調和諸藥，益氣解毒。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">注意禁忌：</td>\r\n            <td>使用本方，宜早不宜遲，若毒熱旺盛而內陷，非本方所能為力。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>流感、麻疹、猩紅熱、水痘、病毒性肺炎、帶狀疱疹、銀屑病、扁桃腺炎、皮膚病、眼疾。</td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(12, 3, '大柴胡湯(每帖)', NULL, 120, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>柴胡15克(8兩)，黃芩9克(3兩)，半夏9克(半升)，枳實9克(4枚)，大黃6克(2兩)，芍藥9克(3兩)，生薑15克(5兩)，大棗12枚。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>\r\n                少陽，陽明合病，往來寒熱，胸脅苦滿，嘔不止，口苦，鬱鬱微煩，心下滿痛或痞硬，大便不解或協熱下利，舌苔黃厚，脈弦有力。\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>本方是由小柴胡湯去人參、甘草、加大黃、枳實、芍藥而成，可謂小柴胡湯與小承氣湯兩方加減而成；是和解與瀉下並用的方劑。方中重用柴胡為君，與黃芩合用，以祛少陽之邪。輕用大黃並配枳實，以瀉陽明熱結共為臣藥。芍藥緩急止痛與大黃相配可治腹中實痛，與枳實為伍，可治氣血不和之腹痛煩滿不得臥；半夏和胃降逆止嘔，配以生薑，治嘔逆不止俱為佐藥；大棗與生薑同用，能和營衛，調和諸藥為使也。諸藥共用，既可和解少陽，又能內瀉熱結，使少陽，陽明之邪得以雙解。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">注意禁忌：</td>\r\n            <td>非實證者慎用。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>本方退熱、利膽、通便。用於肝臟機能障礙、肝膿瘍、膽石症、膽囊炎、高血壓、胰腺炎、胃炎、胃、十二指腸潰瘍、便秘、喘息、赤痢、糖尿病、肥胖症、感冒、耳鳴。</td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(13, 3, '六味地黃丸(每帖)', NULL, 300, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>熟地黃24克，山茱萸12克，山藥12克，澤瀉9克，茯苓9克，牡丹皮9克。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>\r\n                肝腎陰虛，腰膝痠軟，頭目眩暈，耳鳴耳聾，盜汗遺精，骨蒸潮熱，手足心熱，或消渴，或虛火牙痛，口燥咽乾，舌紅少苔，脈細數。小兒腦囟遲遲不合。\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>本方證以腎陰不足為主，虛火上炎為次，故用滋陰補腎之法，以治其本。方中熟地滋補腎陰，壯水制火；山萸肉養肝補腎，固澀精氣；山藥健脾益腎，養陰固澀；澤瀉瀉腎火，引火下行；丹皮清肝瀉火，涼血，除骨蒸；雲苓健脾滲濕，清利濕熱。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">注意禁忌：</td>\r\n            <td>脾胃虛弱者服之易致胃腸脹氣、消化不良、軟便，須搭配健脾胃方藥一起服用。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>慢性腎炎，高血壓，糖尿病，神經衰弱，食管上皮增生，防止癌變，婦女更年期綜合症，抗心律失常，慢性前列腺炎，遺尿症，中心性視網膜炎及視神經炎，紅斑性狼瘡，肺結核，甲狀腺機能亢進等。</td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(14, 3, '桑菊飲(每帖)', NULL, 120, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>桑葉8克，菊花3克，薄荷2克，杏仁6克，桔梗6克，連翹5克，甘草2克，葦根6克。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>\r\n                外感風熱證。咳嗽、咽微痛、口微渴、身熱不甚、舌尖紅、苔白薄、脈浮數。\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>本方為辛涼輕劑，是風溫初起，邪在肺衛，表熱尚輕的常用方。方中桑葉、菊花甘苦性涼，能疏散上焦風熱，又能清透肺經之熱合為君藥，並以之為方名。臣以辛涼之薄荷，以加強桑、菊疏散風熱之力；桔梗與杏仁相配，一升一降，能宣降肺氣，止咳化痰；連翹清熱解毒，又清中有透，可增強疏風清熱之效；蘆根清熱生津止渴，俱為佐藥；甘草調和諸藥，與桔梗相配，善能清利咽喉，化痰止咳為使。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>本方消炎退熱，止咳嗽。用於感冒、流感、急性支氣管炎、上呼吸道感染、咳嗽、目眩、流行性結膜炎。</td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(15, 3, '黃連解毒湯(每帖)', NULL, 300, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>黃連9克，黃芩6克，黃柏6克，梔子9克。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>\r\n                三焦火熱證。狂躁心煩、口燥咽乾、大熱乾嘔、錯語不眠、吐血衄血、熱甚發斑、或外科癰腫疔毒、小便黃赤，舌紅苔黃、脈數有力。\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>本方適用於三焦熱毒壅盛之常用方劑。方中黃連瀉心火、兼瀉中焦之火，黃芩瀉上焦之火；黃柏瀉下焦之火；梔子通瀉三焦之火，導熱下行，使熱邪從小便出。四藥合用，苦寒直折，使火邪去而熱毒解，諸症自癒。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">注意禁忌：</td>\r\n            <td>本方為大苦大寒之劑，易化燥傷陰，故不宜多服，久服。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>泌尿系感染、肝炎、腎炎、乳腺炎、胃腸炎、膽囊炎、腦膜炎、膿瘻病、肺炎、敗血症、闌尾炎、燒燙傷、癰、瘡、疔、癤、諸出血皮膚炎、濕疹、酒查皮鼻、諸熱性疾病。</td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(16, 3, '龍膽瀉肝湯(每帖)', NULL, 450, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>龍膽草12克，梔子9克，黃芩9克，柴胡6克，生地黃12克，澤瀉9克，當歸5克，車前子10克，木通9克，甘草5克。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>\r\n                <ol>\r\n                    <li>肝膽實火上炎證︰症見脅痛頭痛，目赤口苦，耳聾耳腫。</li>\r\n                    <li>肝經濕熱下注證︰症見小便淋濁，陰癢陰腫，婦女帶下，舌紅，苔黃，脈數。</li>\r\n                </ol>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>本方清肝利濕之力甚強，凡屬肝膽實火上炎或濕熱下注所致之證，津液未傷，體力充足者、均可用此方苦寒直折。方中龍膽草大苦大寒，上瀉肝膽實火，下清下焦濕熱，除濕瀉火兩擅其長；黃芩、梔子苦寒瀉火，助龍膽草瀉肝膽經濕熱，並用澤瀉、木通、車前子清利濕熱，使肝膽濕熱從小便出；生地、當歸滋養肝血，並防苦寒藥耗傷陰血；柴胡疏暢肝膽之氣，並作為引經藥；甘草調和諸藥。諸藥合用、瀉中有補，疏中有養、使邪去而不傷正。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">注意禁忌：</td>\r\n            <td>本方藥偏苦寒恐傷胃氣，凡脾胃虛寒，大便溏瀉者慎用。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>急性肝炎、急性膽囊炎、帶狀疱疹、急性盆腔炎、乳腺炎、急性睪丸炎、急性腎盂炎、泌尿系感染、急性結膜炎、角膜炎、中耳炎、鼻竇炎、陰道炎。</td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(17, 3, '十神湯(每帖)', NULL, 300, 1, '<table class=\"t1\" cellpadding=\"10\">\r\n        <tr>\r\n            <td width=\"120\" valign=\"top\">成分：</td>\r\n            <td>麻黃、葛根、升麻、川芎、白芷、紫蘇、甘草、陳皮、香附、赤芍藥等分，加薑、蔥白煎。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">主治：</td>\r\n            <td>\r\n                治時氣瘟疫、兩感風寒、頭痛發熱、惡寒無汗、咳嗽鼻塞聲重、舌淡紅、苔白薄、脈浮緊。\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">方義：</td>\r\n            <td>本方是感冒或流感常用方劑。方中麻黃、疏風散寒、解太陽經之表證；升麻、葛根解表退熱以散陽明經之表證；紫蘇、白芷、川芎、能疏風散寒；陳皮、香附行氣以解氣滯，赤芍和陰於發汗之中，甘草益氣和中調和諸藥。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">注意禁忌：</td>\r\n            <td>多汗體質忌用。</td>\r\n        </tr>\r\n        <tr>\r\n            <td valign=\"top\">現代應用：</td>\r\n            <td>感冒、流行性感冒、頭痛、咳嗽、胸悶等證。</td>\r\n        </tr>\r\n</table>', '2023-08-27 09:14:40'),
(18, 3, '其它藥材搭配', NULL, NULL, 1, '<p class=\"t1\" style=\"font-size:24px\">如果想搭配其它藥材或者想代煎，歡迎來電詢問。</p>', '2023-08-28 12:34:10');

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int(11) NOT NULL COMMENT '圖檔編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `img_file` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖檔名稱',
  `sort` int(2) NOT NULL COMMENT '圖片順序',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product_img`
--

INSERT INTO `product_img` (`img_id`, `p_id`, `img_file`, `sort`, `create_date`) VALUES
(1, 1, '人參藥膳湯.jpg', 1, '2023-08-27 09:27:38'),
(2, 2, '當歸鴨湯.jpg', 1, '2023-08-27 09:27:38'),
(3, 3, '燒雞酒湯.jpg', 1, '2023-08-27 09:27:38'),
(4, 4, '薑母鴨湯.jpg', 1, '2023-08-27 09:27:38'),
(5, 5, '杜仲四物藥膳湯.jpg', 1, '2023-08-27 09:27:38'),
(6, 6, '四神湯.jpg', 1, '2023-08-27 09:27:38'),
(7, 7, '貼布.jpg', 1, '2023-08-27 09:27:38'),
(8, 8, '四物湯.jpg', 1, '2023-08-27 09:27:38'),
(9, 9, '四君子湯.jpg', 1, '2023-08-27 09:27:38'),
(10, 10, '十全大補湯.jpg', 1, '2023-08-27 09:27:38'),
(11, 11, '升麻葛根湯.jpg', 1, '2023-08-27 09:27:38'),
(12, 12, '大柴胡湯.jpg', 1, '2023-08-27 09:27:38'),
(13, 13, '六味地黃丸.jpg', 1, '2023-08-27 09:27:38'),
(14, 14, '桑菊飲.jpg', 1, '2023-08-27 09:27:38'),
(15, 15, '黃連解毒湯.jpg', 1, '2023-08-27 09:27:38'),
(16, 16, '龍膽瀉肝湯.jpg', 1, '2023-08-27 09:27:38'),
(17, 17, '十神湯.jpg', 1, '2023-08-27 09:27:38'),
(18, 18, '藥材.jpg', 1, '2023-08-28 12:39:02');

-- --------------------------------------------------------

--
-- 資料表結構 `pyclass`
--

CREATE TABLE `pyclass` (
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `fonticon` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '字型圖示',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '類別名稱',
  `sort` int(3) NOT NULL COMMENT '列表排序',
  `ctext` text COLLATE utf8_unicode_ci,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '建立時間與更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `pyclass`
--

INSERT INTO `pyclass` (`classid`, `fonticon`, `cname`, `sort`, `ctext`) VALUES
(1, 'fa-yin-yang', '藥膳包', 1, '有多樣的藥材組合，來燉製美味或養生的湯品，可依個人喜好或需求來增減藥材的分量。'),
(2, 'fa-yin-yang', '中藥藥膏貼布', 2, '我們所自製的祖傳祕方藥膏，裡面搭配許多中藥成分，專門醫治骨頭受傷相關的症狀。'),
(3, 'fa-yin-yang', '中藥材組合', 3, '我們的藥材來源，都是與有衛生署合格標章的廠商所選購的，接著在經過我們炒跟炮製，讓藥材可保存的必較久，使消費者能夠買得安心。');

-- --------------------------------------------------------

--
-- 資料表結構 `town`
--

CREATE TABLE `town` (
  `townNo` bigint(20) NOT NULL COMMENT '鄕鎮市編號',
  `Name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '鄕鎮市名稱',
  `Post` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '郵遞區號',
  `State` smallint(6) NOT NULL COMMENT '狀態',
  `AutoNo` int(10) NOT NULL COMMENT '上層城市編號連結'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `town`
--

INSERT INTO `town` (`townNo`, `Name`, `Post`, `State`, `AutoNo`) VALUES
(1, '中正區', '100', 0, 1),
(2, '大同區', '103', 0, 1),
(3, '中山區', '104', 0, 1),
(4, '松山區', '105', 0, 1),
(5, '大安區', '106', 0, 1),
(6, '萬華區', '108', 0, 1),
(7, '信義區', '110', 0, 1),
(8, '士林區', '111', 0, 1),
(9, '北投區', '112', 0, 1),
(10, '內湖區', '114', 0, 1),
(11, '南港區', '115', 0, 1),
(12, '文山區', '116', 0, 1),
(13, '仁愛區', '200', 0, 2),
(14, '信義區', '201', 0, 2),
(15, '中正區', '202', 0, 2),
(16, '中山區', '203', 0, 2),
(17, '安樂區', '204', 0, 2),
(18, '暖暖區', '205', 0, 2),
(19, '七堵區', '206', 0, 2),
(20, '萬里區', '207', 0, 3),
(21, '金山區', '208', 0, 3),
(22, '板橋區', '220', 0, 3),
(23, '汐止區', '221', 0, 3),
(24, '深坑區', '222', 0, 3),
(25, '石碇區', '223', 0, 3),
(26, '瑞芳區', '224', 0, 3),
(27, '平溪區', '226', 0, 3),
(28, '雙溪區', '227', 0, 3),
(29, '貢寮區', '228', 0, 3),
(30, '新店區', '231', 0, 3),
(31, '坪林區', '232', 0, 3),
(32, '烏來區', '233', 0, 3),
(33, '永和區', '234', 0, 3),
(34, '中和區', '235', 0, 3),
(35, '土城區', '236', 0, 3),
(36, '三峽區', '237', 0, 3),
(37, '樹林區', '238', 0, 3),
(38, '鶯歌區', '239', 0, 3),
(39, '三重區', '241', 0, 3),
(40, '新莊區', '242', 0, 3),
(41, '泰山區', '243', 0, 3),
(42, '林口區', '244', 0, 3),
(43, '蘆洲區', '247', 0, 3),
(44, '五股區', '248', 0, 3),
(45, '八里區', '249', 0, 3),
(46, '淡水區', '251', 0, 3),
(47, '三芝區', '252', 0, 3),
(48, '石門區', '253', 0, 3),
(49, '宜蘭市', '260', 0, 4),
(50, '頭城鎮', '261', 0, 4),
(51, '礁溪鄉', '262', 0, 4),
(52, '壯圍鄉', '263', 0, 4),
(53, '員山鄉', '264', 0, 4),
(54, '羅東鎮', '265', 0, 4),
(55, '三星鄉', '266', 0, 4),
(56, '大同鄉', '267', 0, 4),
(57, '五結鄉', '268', 0, 4),
(58, '冬山鄉', '269', 0, 4),
(59, '蘇澳鎮', '270', 0, 4),
(60, '南澳鄉', '272', 0, 4),
(61, '釣魚台列嶼', '290', 0, 4),
(62, '新竹市(東區)', '300', 0, 5),
(63, '竹北市', '302', 0, 6),
(64, '湖口鄉', '303', 0, 6),
(65, '新豐鄉', '304', 0, 6),
(66, '新埔鎮', '305', 0, 6),
(67, '關西鎮', '306', 0, 6),
(68, '芎林鄉', '307', 0, 6),
(69, '寶山鄉', '308', 0, 6),
(70, '竹東鎮', '310', 0, 6),
(71, '五峰鄉', '311', 0, 6),
(72, '橫山鄉', '312', 0, 6),
(73, '尖石鄉', '313', 0, 6),
(74, '北埔鄉', '314', 0, 6),
(75, '峨眉鄉', '315', 0, 6),
(76, '中壢區', '320', 0, 7),
(77, '平鎮區', '324', 0, 7),
(78, '龍潭區', '325', 0, 7),
(79, '楊梅區', '326', 0, 7),
(80, '新屋區', '327', 0, 7),
(81, '觀音區', '328', 0, 7),
(82, '桃園區', '330', 0, 7),
(83, '龜山區', '333', 0, 7),
(84, '八德區', '334', 0, 7),
(85, '大溪區', '335', 0, 7),
(86, '復興區', '336', 0, 7),
(87, '大園區', '337', 0, 7),
(88, '蘆竹區', '338', 0, 7),
(89, '竹南鎮', '350', 0, 8),
(90, '頭份市', '351', 0, 8),
(91, '三灣鄉', '352', 0, 8),
(92, '南庄鄉', '353', 0, 8),
(93, '獅潭鄉', '354', 0, 8),
(94, '後龍鎮', '356', 0, 8),
(95, '通霄鎮', '357', 0, 8),
(96, '苑裡鎮', '358', 0, 8),
(97, '苗栗市', '360', 0, 8),
(98, '造橋鄉', '361', 0, 8),
(99, '頭屋鄉', '362', 0, 8),
(100, '公館鄉', '363', 0, 8),
(101, '大湖鄉', '364', 0, 8),
(102, '泰安鄉', '365', 0, 8),
(103, '銅鑼鄉', '366', 0, 8),
(104, '三義鄉', '367', 0, 8),
(105, '西湖鄉', '368', 0, 8),
(106, '卓蘭鎮', '369', 0, 8),
(107, '中區', '400', 0, 9),
(108, '東區', '401', 0, 9),
(109, '南區', '402', 0, 9),
(110, '西區', '403', 0, 9),
(111, '北區', '404', 0, 9),
(112, '北屯區', '406', 0, 9),
(113, '西屯區', '407', 0, 9),
(114, '南屯區', '408', 0, 9),
(115, '太平區', '411', 0, 9),
(116, '大里區', '412', 0, 9),
(117, '霧峰區', '413', 0, 9),
(118, '烏日區', '414', 0, 9),
(119, '豐原區', '420', 0, 9),
(120, '后里區', '421', 0, 9),
(121, '石岡區', '422', 0, 9),
(122, '東勢區', '423', 0, 9),
(123, '和平區', '424', 0, 9),
(124, '新社區', '426', 0, 9),
(125, '潭子區', '427', 0, 9),
(126, '大雅區', '428', 0, 9),
(127, '神岡區', '429', 0, 9),
(128, '大肚區', '432', 0, 9),
(129, '沙鹿區', '433', 0, 9),
(130, '龍井區', '434', 0, 9),
(131, '梧棲區', '435', 0, 9),
(132, '清水區', '436', 0, 9),
(133, '大甲區', '437', 0, 9),
(134, '外埔區', '438', 0, 9),
(135, '大安區', '439', 0, 9),
(136, '彰化市', '500', 0, 10),
(137, '芬園鄉', '502', 0, 10),
(138, '花壇鄉', '503', 0, 10),
(139, '秀水鄉', '504', 0, 10),
(140, '鹿港鎮', '505', 0, 10),
(141, '福興鄉', '506', 0, 10),
(142, '線西鄉', '507', 0, 10),
(143, '和美鎮', '508', 0, 10),
(144, '伸港鄉', '509', 0, 10),
(145, '員林市', '510', 0, 10),
(146, '社頭鄉', '511', 0, 10),
(147, '永靖鄉', '512', 0, 10),
(148, '埔心鄉', '513', 0, 10),
(149, '溪湖鎮', '514', 0, 10),
(150, '大村鄉', '515', 0, 10),
(151, '埔鹽鄉', '516', 0, 10),
(152, '田中鎮', '520', 0, 10),
(153, '北斗鎮', '521', 0, 10),
(154, '田尾鄉', '522', 0, 10),
(155, '埤頭鄉', '523', 0, 10),
(156, '溪州鄉', '524', 0, 10),
(157, '竹塘鄉', '525', 0, 10),
(158, '二林鎮', '526', 0, 10),
(159, '大城鄉', '527', 0, 10),
(160, '芳苑鄉', '528', 0, 10),
(161, '二水鄉', '530', 0, 10),
(162, '南投市', '540', 0, 11),
(163, '中寮鄉', '541', 0, 11),
(164, '草屯鎮', '542', 0, 11),
(165, '國姓鄉', '544', 0, 11),
(166, '埔里鎮', '545', 0, 11),
(167, '仁愛鄉', '546', 0, 11),
(168, '名間鄉', '551', 0, 11),
(169, '集集鎮', '552', 0, 11),
(170, '水里鄉', '553', 0, 11),
(171, '魚池鄉', '555', 0, 11),
(172, '信義鄉', '556', 0, 11),
(173, '竹山鎮', '557', 0, 11),
(174, '鹿谷鄉', '558', 0, 11),
(175, '斗南鎮', '630', 0, 12),
(176, '大埤鄉', '631', 0, 12),
(177, '虎尾鎮', '632', 0, 12),
(178, '土庫鎮', '633', 0, 12),
(179, '褒忠鄉', '634', 0, 12),
(180, '東勢鄉', '635', 0, 12),
(181, '臺西鄉', '636', 0, 12),
(182, '崙背鄉', '637', 0, 12),
(183, '麥寮鄉', '638', 0, 12),
(184, '斗六市', '640', 0, 12),
(185, '林內鄉', '643', 0, 12),
(186, '古坑鄉', '646', 0, 12),
(187, '莿桐鄉', '647', 0, 12),
(188, '西螺鎮', '648', 0, 12),
(189, '二崙鄉', '649', 0, 12),
(190, '北港鎮', '651', 0, 12),
(191, '水林鄉', '652', 0, 12),
(192, '口湖鄉', '653', 0, 12),
(193, '四湖鄉', '654', 0, 12),
(194, '元長鄉', '655', 0, 12),
(195, '嘉義市(東區)', '600', 0, 13),
(196, '番路鄉', '602', 0, 14),
(197, '梅山鄉', '603', 0, 14),
(198, '竹崎鄉', '604', 0, 14),
(199, '阿里山鄉', '605', 0, 14),
(200, '中埔鄉', '606', 0, 14),
(201, '大埔鄉', '607', 0, 14),
(202, '水上鄉', '608', 0, 14),
(203, '鹿草鄉', '611', 0, 14),
(204, '太保市', '612', 0, 14),
(205, '朴子市', '613', 0, 14),
(206, '東石鄉', '614', 0, 14),
(207, '六腳鄉', '615', 0, 14),
(208, '新港鄉', '616', 0, 14),
(209, '民雄鄉', '621', 0, 14),
(210, '大林鎮', '622', 0, 14),
(211, '溪口鄉', '623', 0, 14),
(212, '義竹鄉', '624', 0, 14),
(213, '布袋鎮', '625', 0, 14),
(214, '中西區', '700', 0, 15),
(215, '東區', '701', 0, 15),
(216, '南區', '702', 0, 15),
(217, '北區', '704', 0, 15),
(218, '安平區', '708', 0, 15),
(219, '安南區', '709', 0, 15),
(220, '永康區', '710', 0, 15),
(221, '歸仁區', '711', 0, 15),
(222, '新化區', '712', 0, 15),
(223, '左鎮區', '713', 0, 15),
(224, '玉井區', '714', 0, 15),
(225, '楠西區', '715', 0, 15),
(226, '南化區', '716', 0, 15),
(227, '仁德區', '717', 0, 15),
(228, '關廟區', '718', 0, 15),
(229, '龍崎區', '719', 0, 15),
(230, '官田區', '720', 0, 15),
(231, '麻豆區', '721', 0, 15),
(232, '佳里區', '722', 0, 15),
(233, '西港區', '723', 0, 15),
(234, '七股區', '724', 0, 15),
(235, '將軍區', '725', 0, 15),
(236, '學甲區', '726', 0, 15),
(237, '北門區', '727', 0, 15),
(238, '新營區', '730', 0, 15),
(239, '後壁區', '731', 0, 15),
(240, '白河區', '732', 0, 15),
(241, '東山區', '733', 0, 15),
(242, '六甲區', '734', 0, 15),
(243, '下營區', '735', 0, 15),
(244, '柳營區', '736', 0, 15),
(245, '鹽水區', '737', 0, 15),
(246, '善化區', '741', 0, 15),
(247, '大內區', '742', 0, 15),
(248, '山上區', '743', 0, 15),
(249, '新市區', '744', 0, 15),
(250, '安定區', '745', 0, 15),
(251, '新興區', '800', 0, 16),
(252, '前金區', '801', 0, 16),
(253, '苓雅區', '802', 0, 16),
(254, '鹽埕區', '803', 0, 16),
(255, '鼓山區', '804', 0, 16),
(256, '旗津區', '805', 0, 16),
(257, '前鎮區', '806', 0, 16),
(258, '三民區', '807', 0, 16),
(259, '楠梓區', '811', 0, 16),
(260, '小港區', '812', 0, 16),
(261, '左營區', '813', 0, 16),
(262, '仁武區', '814', 0, 16),
(263, '大社區', '815', 0, 16),
(264, '岡山區', '820', 0, 16),
(265, '路竹區', '821', 0, 16),
(266, '阿蓮區', '822', 0, 16),
(267, '田寮區', '823', 0, 16),
(268, '燕巢區', '824', 0, 16),
(269, '橋頭區', '825', 0, 16),
(270, '梓官區', '826', 0, 16),
(271, '彌陀區', '827', 0, 16),
(272, '永安區', '828', 0, 16),
(273, '湖內區', '829', 0, 16),
(274, '鳳山區', '830', 0, 16),
(275, '大寮區', '831', 0, 16),
(276, '林園區', '832', 0, 16),
(277, '鳥松區', '833', 0, 16),
(278, '大樹區', '840', 0, 16),
(279, '旗山區', '842', 0, 16),
(280, '美濃區', '843', 0, 16),
(281, '六龜區', '844', 0, 16),
(282, '內門區', '845', 0, 16),
(283, '杉林區', '846', 0, 16),
(284, '甲仙區', '847', 0, 16),
(285, '桃源區', '848', 0, 16),
(286, '那瑪夏區', '849', 0, 16),
(287, '茂林區', '851', 0, 16),
(288, '茄萣區', '852', 0, 16),
(289, '東沙', '817', 0, 17),
(290, '南沙', '819', 0, 17),
(291, '馬公市', '880', 0, 18),
(292, '西嶼鄉', '881', 0, 18),
(293, '望安鄉', '882', 0, 18),
(294, '七美鄉', '883', 0, 18),
(295, '白沙鄉', '884', 0, 18),
(296, '湖西鄉', '885', 0, 18),
(297, '屏東市', '900', 0, 19),
(298, '三地門鄉', '901', 0, 19),
(299, '霧臺鄉', '902', 0, 19),
(300, '瑪家鄉', '903', 0, 19),
(301, '九如鄉', '904', 0, 19),
(302, '里港鄉', '905', 0, 19),
(303, '高樹鄉', '906', 0, 19),
(304, '鹽埔鄉', '907', 0, 19),
(305, '長治鄉', '908', 0, 19),
(306, '麟洛鄉', '909', 0, 19),
(307, '竹田鄉', '911', 0, 19),
(308, '內埔鄉', '912', 0, 19),
(309, '萬丹鄉', '913', 0, 19),
(310, '潮州鎮', '920', 0, 19),
(311, '泰武鄉', '921', 0, 19),
(312, '來義鄉', '922', 0, 19),
(313, '萬巒鄉', '923', 0, 19),
(314, '崁頂鄉', '924', 0, 19),
(315, '新埤鄉', '925', 0, 19),
(316, '南州鄉', '926', 0, 19),
(317, '林邊鄉', '927', 0, 19),
(318, '東港鄉', '928', 0, 19),
(319, '琉球鄉', '929', 0, 19),
(320, '佳冬鄉', '931', 0, 19),
(321, '新園鄉', '932', 0, 19),
(322, '枋寮鄉', '940', 0, 19),
(323, '枋山鄉', '941', 0, 19),
(324, '春日鄉', '942', 0, 19),
(325, '獅子鄉', '943', 0, 19),
(326, '車城鄉', '944', 0, 19),
(327, '牡丹鄉', '945', 0, 19),
(328, '恆春鎮', '946', 0, 19),
(329, '滿州鄉', '947', 0, 19),
(330, '臺東市', '950', 0, 20),
(331, '綠島鄉', '951', 0, 20),
(332, '蘭嶼鄉', '952', 0, 20),
(333, '延平鄉', '953', 0, 20),
(334, '卑南鄉', '954', 0, 20),
(335, '鹿野鄉', '955', 0, 20),
(336, '關山鎮', '956', 0, 20),
(337, '海端鄉', '957', 0, 20),
(338, '池上鄉', '958', 0, 20),
(339, '東河鄉', '959', 0, 20),
(340, '成功鎮', '961', 0, 20),
(341, '長濱鄉', '962', 0, 20),
(342, '太麻里鄉', '963', 0, 20),
(343, '金峰鄉', '964', 0, 20),
(344, '大武鄉', '965', 0, 20),
(345, '達仁鄉', '966', 0, 20),
(346, '花蓮市', '970', 0, 21),
(347, '新城鄉', '971', 0, 21),
(348, '秀林鄉', '972', 0, 21),
(349, '吉安鄉', '973', 0, 21),
(350, '壽豐鄉', '974', 0, 21),
(351, '鳳林鎮', '975', 0, 21),
(352, '光復鄉', '976', 0, 21),
(353, '豐濱鄉', '977', 0, 21),
(354, '瑞穗鄉', '978', 0, 21),
(355, '萬榮鄉', '979', 0, 21),
(356, '玉里鎮', '981', 0, 21),
(357, '卓溪鄉', '982', 0, 21),
(358, '富里鄉', '983', 0, 21),
(359, '金沙鎮', '890', 0, 22),
(360, '金湖鎮', '891', 0, 22),
(361, '金寧鄉', '892', 0, 22),
(362, '金城鎮', '893', 0, 22),
(363, '烈嶼鄉', '894', 0, 22),
(364, '烏坵鄉', '896', 0, 22),
(365, '南竿鄉', '209', 0, 23),
(366, '北竿鄉', '210', 0, 23),
(367, '莒光鄉', '211', 0, 23),
(368, '東引鄉', '212', 0, 23),
(371, '新竹市(北區)', '300', 0, 5),
(372, '新竹市(香山區)', '300', 0, 5),
(373, '嘉義市(西區)', '600', 0, 13);

-- --------------------------------------------------------

--
-- 資料表結構 `uorder`
--

CREATE TABLE `uorder` (
  `orderid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂單編號',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `addressid` int(10) NOT NULL COMMENT '收件人編號',
  `howpay` tinyint(4) NOT NULL DEFAULT '1' COMMENT '如何付款',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '訂單時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `addbook`
--
ALTER TABLE `addbook`
  ADD PRIMARY KEY (`addressid`);

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- 資料表索引 `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`AutoNo`);

--
-- 資料表索引 `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`emailid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 資料表索引 `multiselect`
--
ALTER TABLE `multiselect`
  ADD PRIMARY KEY (`msid`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`);

--
-- 資料表索引 `pyclass`
--
ALTER TABLE `pyclass`
  ADD PRIMARY KEY (`classid`);

--
-- 資料表索引 `town`
--
ALTER TABLE `town`
  ADD PRIMARY KEY (`townNo`);

--
-- 資料表索引 `uorder`
--
ALTER TABLE `uorder`
  ADD PRIMARY KEY (`orderid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addbook`
--
ALTER TABLE `addbook`
  MODIFY `addressid` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址ID';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(10) NOT NULL AUTO_INCREMENT COMMENT '購物車編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `city`
--
ALTER TABLE `city`
  MODIFY `AutoNo` int(10) NOT NULL AUTO_INCREMENT COMMENT '城市編號', AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '使用者id';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `emailid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'email流水號', AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `multiselect`
--
ALTER TABLE `multiselect`
  MODIFY `msid` int(5) NOT NULL AUTO_INCREMENT COMMENT '多功能選擇ID', AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '產品編號', AUTO_INCREMENT=19;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '圖檔編號', AUTO_INCREMENT=19;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pyclass`
--
ALTER TABLE `pyclass`
  MODIFY `classid` int(3) NOT NULL AUTO_INCREMENT COMMENT '產品類別', AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `town`
--
ALTER TABLE `town`
  MODIFY `townNo` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '鄕鎮市編號', AUTO_INCREMENT=374;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
