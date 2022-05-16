-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 10:21 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `processing`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `GetOfficeByCountry`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOfficeByCountry` (IN `po` VARCHAR(255))   BEGIN
	SELECT * 
 	FROM wip_view
	WHERE po = po;
END$$

DROP PROCEDURE IF EXISTS `hourly_output_report`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `hourly_output_report` ()   BEGIN
select style_details_id,ship_date,color,po,input_date,
SUM(if(`hour_no`=1, `quantity`, 0)) as Hour_1,
SUM(if(`hour_no`=2, `quantity`, 0)) as Hour_2,
SUM(if(`hour_no`=3, `quantity`, 0)) as Hour_3,
SUM(if(`hour_no`=4, `quantity`, 0)) as Hour_4,
SUM(if(`hour_no`=5, `quantity`, 0)) as Hour_5,
SUM(if(`hour_no`=6, `quantity`, 0)) as Hour_6,
SUM(if(`hour_no`=7, `quantity`, 0)) as Hour_7,
SUM(if(`hour_no`=8, `quantity`, 0)) as Hour_8,
SUM(if(`hour_no`=9, `quantity`, 0)) as Hour_9,
SUM(if(`hour_no`=10, `quantity`,0)) as Hour_10,
SUM(if(`hour_no`=11, `quantity`, 0)) as Hour_11,
SUM(if(`hour_no`=12, `quantity`, 0)) as Hour_12,
SUM(if(`hour_no`=13, `quantity`, 0)) as Hour_13,
SUM(if(`hour_no`=14, `quantity`, 0)) as Hour_14,
SUM(if(`hour_no`=15, `quantity`, 0)) as Hour_15,
SUM(if(`hour_no`=16, `quantity`, 0)) as Hour_16,
SUM(if(`hour_no`=17, `quantity`, 0)) as Hour_17,
SUM(if(`hour_no`=18, `quantity`, 0)) as Hour_18,
SUM(if(`hour_no`=19, `quantity`, 0)) as Hour_19,
SUM(if(`hour_no`=20, `quantity`, 0)) as Hour_20,
SUM(if(`hour_no`=21, `quantity`, 0)) as Hour_21,
SUM(if(`hour_no`=22, `quantity`, 0)) as Hour_22,
SUM(if(`hour_no`=23, `quantity`, 0)) as Hour_23,
SUM(if(`hour_no`=24, `quantity`, 0)) as Hour_24
FROM 
(SELECT  daily_target_set_line_details.style_details_id as style_details_id,
daily_target_set_line_details.line_no as line_no,
`daily_target_set_line_details`.`ship_date` as ship_date,
`daily_target_set_line_details`.`color` as color,
`daily_target_set_line_details`.`po` as po,
`daily_target_set_line_details`.`new_target` as new_target,
`line_wise_output_per_hour`.`hour_no` as hour_no,
`line_wise_output_per_hour`.`quantity` as quantity,
`line_wise_output_per_hour`.`man_power` as man_power ,
`line_wise_output_per_hour`.`input_date` as input_date
FROM `daily_target_set_line_details` INNER JOIN line_wise_output_per_hour 
ON `daily_target_set_line_details`.`style_details_id`=`line_wise_output_per_hour`.`order_details_id`
and `daily_target_set_line_details`.`line_no`=`line_wise_output_per_hour`.`line_no`
and `daily_target_set_line_details`.`ship_date`=`line_wise_output_per_hour`.`ship_date`
and `daily_target_set_line_details`.`color`=`line_wise_output_per_hour`.`color`
 and `daily_target_set_line_details`.`input_date`=`line_wise_output_per_hour`.`input_date`
 ) as navid GROUP BY style_details_id,ship_date,color,po,input_date;
END$$

DROP PROCEDURE IF EXISTS `Wip_Procudure`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Wip_Procudure` (IN `order_details_id` INT, IN `ship_date` DATE, IN `po` VARCHAR(250), IN `color` VARCHAR(250))   BEGIN 
   Select * from wip_view  WHERE 
   order_details_id=order_details_id
   and ship_date=ship_date
   and po=po and
   color=color; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `row_id` int(10) NOT NULL,
  `buyer_id` varchar(10) NOT NULL,
  `buyer_name` varchar(100) DEFAULT NULL,
  `buyer_address` varchar(250) DEFAULT NULL,
  `country_of_origin` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`row_id`, `buyer_id`, `buyer_name`, `buyer_address`, `country_of_origin`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 'buyer_1', 'HEMA', '', '', 'iftekhar', 'iftekhar', '2022-02-12 16:44:16'),
(2, 'buyer_2', 'Terranova', '', '', 'qc', 'qc', '2022-03-08 17:21:23'),
(3, 'buyer_3', 'Miles', '', '', 'qc', 'qc', '2022-03-08 17:21:37'),
(4, 'buyer_4', 'Rich Cotton', '', '', 'qc', 'qc', '2022-03-08 17:21:53'),
(5, 'buyer_5', 'IKEA', 'American', 'American Samoa', '9212', 'kausar', '2022-04-24 12:05:20'),
(6, 'buyer_6', 'Lotto', 'Venus', 'Italy', 'iftekhar', 'iftekhar', '2022-05-12 15:27:44'),
(7, 'buyer_7', 'hhhh', 'hhhh', 'Afghanistan', 'iftekhar', 'iftekhar', '2022-05-12 20:39:35'),
(8, 'buyer_8', 'Hasan', 'Badda,Link Road', 'American Samoa', 'iftekhar', 'iftekhar', '2022-05-14 17:06:08'),
(9, 'buyer_9', 'BBK Fashion', 'Barbadosre', 'Central African Republic', 'iftekhar', 'iftekhar', '2022-05-15 09:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `row_id` int(10) NOT NULL,
  `color_id` varchar(15) NOT NULL,
  `color_name` varchar(50) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`row_id`, `color_id`, `color_name`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 'color_1', 'Denim', 'iftekhar', 'iftekhar', '2022-02-12 16:44:36'),
(10, 'color_10', 'VAR SALVIA', 'qc', 'qc', '2022-03-08 17:25:06'),
(11, 'color_11', 'Model-1', 'qc', 'qc', '2022-03-08 17:28:24'),
(12, 'color_12', 'Model-2', 'qc', 'qc', '2022-03-08 17:28:29'),
(13, 'color_13', 'BIANCO', 'qc', 'qc', '2022-03-08 17:28:41'),
(14, 'color_14', 'CELESTE', 'qc', 'qc', '2022-03-08 17:28:53'),
(15, 'color_15', 'LILLA', 'qc', 'qc', '2022-03-08 17:29:03'),
(16, 'color_16', 'MARRONE SCURO', 'qc', 'qc', '2022-03-08 17:29:12'),
(17, 'color_17', 'BLU DENIM MEDIO', 'qc', 'qc', '2022-03-08 17:29:41'),
(18, 'color_18', 'BLU DENIM SCURO', 'qc', 'qc', '2022-03-08 17:48:33'),
(19, 'color_19', 'Pink White', '9212', 'kausar', '2022-04-24 12:06:16'),
(2, 'color_2', 'ANTRACITE', 'qc', 'qc', '2022-03-08 17:23:09'),
(20, 'color_20', 'color-venus', 'iftekhar', 'iftekhar', '2022-05-12 15:28:13'),
(21, 'color_21', 'hhhhhhh', 'iftekhar', 'iftekhar', '2022-05-12 20:39:53'),
(22, 'color_22', 'style-color', 'iftekhar', 'iftekhar', '2022-05-14 17:06:37'),
(23, 'color_23', 'color-bbk', 'iftekhar', 'iftekhar', '2022-05-15 09:50:25'),
(3, 'color_3', 'SALVIA', 'qc', 'qc', '2022-03-08 17:23:36'),
(4, 'color_4', 'NERO', 'qc', 'qc', '2022-03-08 17:23:50'),
(5, 'color_5', 'GREY MELANGE', 'qc', 'qc', '2022-03-08 17:24:06'),
(6, 'color_6', 'COSMIC SKY', 'qc', 'qc', '2022-03-08 17:24:16'),
(7, 'color_7', 'WHITE', 'qc', 'qc', '2022-03-08 17:24:27'),
(8, 'color_8', 'VAR CANNA DI FUCILE', 'qc', 'qc', '2022-03-08 17:24:47'),
(9, 'color_9', 'VAR NERO', 'qc', 'qc', '2022-03-08 17:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name_of_country` varchar(80) NOT NULL,
  `short_code` char(3) DEFAULT NULL,
  `number_code` smallint(6) DEFAULT NULL,
  `phone_code` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `iso`, `name_of_country`, `short_code`, `number_code`, `phone_code`) VALUES
(1, 'AF', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'China', 'CHN', 156, 86),
(45, 'CX', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'Congo', 'COG', 178, 242),
(50, 'CD', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'France', 'FRA', 250, 33),
(74, 'GF', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'India', 'IND', 356, 91),
(100, 'ID', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'Niger', 'NER', 562, 227),
(156, 'NG', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'Peru', 'PER', 604, 51),
(169, 'PH', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'Poland', 'POL', 616, 48),
(172, 'PT', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'United States', 'USA', 840, 1),
(227, 'UM', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `row_id` int(10) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_address` varchar(250) DEFAULT NULL,
  `country_of_origin` varchar(100) DEFAULT NULL,
  `key_account_manager_id` varchar(50) DEFAULT NULL,
  `key_account_manager_name` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`row_id`, `customer_id`, `customer_name`, `customer_address`, `country_of_origin`, `key_account_manager_id`, `key_account_manager_name`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 'cust_1', 'IKEA', 'Sweden AB', 'Sweden', 'keyacmgr_1', 'Rowshon Abedin Sujon', 'qc', 'qc', '2021-03-08 12:48:29'),
(10, 'cust_10', 'BBK Spolka', '15Ð Magnacka St.\r\n80-180 Kowale near GdaÅ„sk, Poland\r\ntel.: + 48 58 762 20 20 \r\nfax: + 48 58 762 20 60\r\nemail: biuro@bbk.com.pl', 'Poland', 'keyacmgr_11', 'Mr. Mehedi Hasan', 'qc', 'qc', '2021-03-17 11:55:01'),
(11, 'cust_11', 'William Sonoam', 'USA', 'United States', 'keyacmgr_8', 'Abu Sayem Rana', 'qc', 'qc', '2021-03-18 12:49:29'),
(2, 'cust_2', 'Sainsbury', 'United Kingdom', 'United Kingdom', 'keyacmgr_2', 'Moklesur Rahman Rony', 'qc', 'qc', '2021-03-08 19:22:03'),
(3, 'cust_3', 'KGS La Redoute', 'France', 'France', 'keyacmgr_3', 'Mr. Sujit Ranjan Debnath', 'qc', 'qc', '2021-03-08 19:54:56'),
(4, 'cust_4', 'Nitori', 'Japan', 'Japan', 'keyacmgr_4', 'Mr. Jahir Uddin Babur', 'qc', 'qc', '2021-03-08 20:45:49'),
(5, 'cust_5', 'H&m', 'VÃ¤sterÃ¥s, Sweden', 'Sweden', 'keyacmgr_5', 'Md. Manzurul Ahsan', 'qc', 'qc', '2021-03-09 12:14:17'),
(6, 'cust_6', 'Max Fashion', 'India', 'India', 'keyacmgr_6', 'Md. Shamim Bhuiyan (Shipon)', 'qc', 'qc', '2021-03-09 20:13:02'),
(7, 'cust_7', 'Walmart', 'Canada', 'Canada', 'keyacmgr_7', 'Omar Faruk', 'qc', 'qc', '2021-03-09 20:21:34'),
(8, 'cust_8', 'Target Australia', ' Australia', 'Australia', 'keyacmgr_8', 'Abu Sayem Rana', 'qc', 'qc', '2021-03-09 20:29:38'),
(9, 'cust_9', 'Jotex', 'Seremban', 'Malaysia', 'keyacmgr_9', 'Md. Mahadi Hassan', 'qc', 'qc', '2021-03-16 16:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `daily_input_for_swing`
--

DROP TABLE IF EXISTS `daily_input_for_swing`;
CREATE TABLE `daily_input_for_swing` (
  `id` int(11) NOT NULL,
  `order_details_id` int(11) NOT NULL,
  `ship_date` date NOT NULL,
  `input_date` date NOT NULL,
  `received_cutting_qty` int(11) NOT NULL,
  `cutting_completed_day` date NOT NULL,
  `line_no` int(11) NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(100) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daily_target_set_line_details`
--

DROP TABLE IF EXISTS `daily_target_set_line_details`;
CREATE TABLE `daily_target_set_line_details` (
  `id` int(11) NOT NULL,
  `line_no` int(11) NOT NULL,
  `style_details_id` int(11) NOT NULL,
  `po` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `ship_date` date NOT NULL,
  `total_daily_cutting_qty` int(11) NOT NULL,
  `total_daily_completed_quantity` int(11) NOT NULL,
  `wip` int(11) DEFAULT NULL,
  `new_target` int(11) NOT NULL,
  `input_date` date NOT NULL,
  `recording_person_id` varchar(30) NOT NULL,
  `recording_person_name` varchar(30) NOT NULL,
  `recording_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daily_target_set_line_details`
--

INSERT INTO `daily_target_set_line_details` (`id`, `line_no`, `style_details_id`, `po`, `color`, `ship_date`, `total_daily_cutting_qty`, `total_daily_completed_quantity`, `wip`, `new_target`, `input_date`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 1, 1, '226', 'color_1', '2022-02-19', 200, 100, 0, 100, '2022-02-27', 'qc', 'qc', '2022-02-27 10:53:32'),
(2, 1, 9, 'TBA', 'color_18', '2022-04-15', 2000, 1500, 0, 100, '2022-03-08', 'qc', 'qc', '2022-03-08 17:59:36');

-- --------------------------------------------------------

--
-- Table structure for table `department_info`
--

DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `section_name` varchar(100) DEFAULT NULL,
  `contact_person_name` varchar(100) DEFAULT NULL,
  `contact_no` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department_info`
--

INSERT INTO `department_info` (`id`, `location`, `department_name`, `section_name`, `contact_person_name`, `contact_no`, `email`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 'Gate-2', 'Marketing', 'Marketing', 'Roshan Abedin Sujon', '+8801678507571', 'abedin@znzfab.com', 'qc', 'qc', '2021-03-08 11:59:09');

-- --------------------------------------------------------

--
-- Table structure for table `designation_info`
--

DROP TABLE IF EXISTS `designation_info`;
CREATE TABLE `designation_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `short_form` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation_info`
--

INSERT INTO `designation_info` (`id`, `designation`, `short_form`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 'Officer', 'Officer', NULL, NULL, NULL),
(3, 'Junior Officer', 'Jr. Officer', NULL, NULL, NULL),
(4, 'Senior Officer', 'Sr. Officer', NULL, NULL, NULL),
(22, 'Programmer', 'Programmer', NULL, NULL, NULL),
(23, 'Junior Programmer', 'Jr. Programmer', NULL, NULL, NULL),
(5, 'Executive', 'Executive', NULL, NULL, NULL),
(7, 'Junior Executive', 'Jr. Executive', NULL, NULL, NULL),
(8, 'Senior Executive', 'Sr. Executive', NULL, NULL, NULL),
(9, 'General Manager', 'GM', NULL, NULL, NULL),
(24, 'Assistant Programmer', 'Asst. Programmer', NULL, NULL, NULL),
(25, 'Senior Programmer', 'Sr. Programmer', NULL, NULL, NULL),
(10, 'Assistant General Manager', 'AGM', NULL, NULL, NULL),
(11, 'Deputy General Manager', 'DGM', NULL, NULL, NULL),
(12, 'Manager', 'Manager', NULL, NULL, NULL),
(19, 'Junior Application Developer', 'Jr. App. Developer', NULL, NULL, NULL),
(13, 'Assistant Manager', 'Asst. Manager', NULL, NULL, NULL),
(14, 'Deputy Manager', 'Dept. Manager', NULL, NULL, NULL),
(15, 'Senior Manager', 'Sr. Manager', NULL, NULL, NULL),
(2, 'Assistant Officer', 'Asst. Officer', NULL, NULL, NULL),
(20, 'Assistant Application Developer', 'Asst. App. Developer', NULL, NULL, NULL),
(16, 'Head of Department', 'Head of Dept.', NULL, NULL, NULL),
(17, 'Application Implementer', 'App. Implementer', '', '', '0000-00-00 00:00:00'),
(18, 'Application Developer', 'App. Developer', NULL, NULL, NULL),
(21, 'Senior Application Developer', 'Sr. App. Developer', NULL, NULL, NULL),
(6, 'Assistant Executive', 'Asst. Executive', NULL, NULL, NULL),
(27, 'Junior Engineer', 'Jr. Engineer', NULL, NULL, NULL),
(26, 'Engineer', 'Engineer', NULL, NULL, NULL),
(28, 'Assistant Engineer', 'Asst. Engineer', NULL, NULL, NULL),
(29, 'Senior Engineer', 'Sr. Engineer', NULL, NULL, NULL),
(30, 'System & Network Engineer', 'System & Network Engineer', NULL, NULL, NULL),
(31, 'Junior System & Network Engineer', 'Jr. System Network Engineer', NULL, NULL, NULL),
(32, 'Assistant System & Network Engineer', 'Asst. System & Network Engineer', NULL, NULL, NULL),
(33, 'Senior System & Network Engineer', 'Sr. System & Network Engineer', NULL, NULL, NULL),
(34, 'Functional Co-ordinator', 'Functional Co-ordinator', NULL, NULL, NULL),
(35, 'Senior Functional Co-ordinator', 'Sr. Functional Co-ordinator', NULL, NULL, NULL),
(36, 'Data Co-ordinator', 'Data Co-ordinator', NULL, NULL, NULL),
(37, 'Senior Data Co-ordinator', 'Sr. Data Co-ordinator', NULL, NULL, NULL),
(38, 'NOC Engineer', 'NOC Engineer', NULL, NULL, NULL),
(39, 'Chief Information Officer', 'CIO', NULL, NULL, NULL),
(40, 'Chief Technical Officer', 'CTO', NULL, NULL, NULL),
(41, 'Database Administrator', 'DBA', NULL, NULL, NULL),
(42, 'System Administrator', 'System Admin', NULL, NULL, NULL),
(43, 'System Analyst', 'System Analyst', NULL, NULL, NULL),
(44, 'Team Leader', 'Team Leader', NULL, NULL, NULL),
(45, 'Project Manager', 'PM', NULL, NULL, NULL),
(46, 'Junior NOC Engineer', 'Jr. NOC Engineer', NULL, NULL, NULL),
(47, 'Electrical Engineer', 'ELec. Engr.', NULL, NULL, NULL),
(48, 'Assistant Manufacturing Engineer', 'Asst. Manufacturing Engr.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `division_info`
--

DROP TABLE IF EXISTS `division_info`;
CREATE TABLE `division_info` (
  `id` int(11) NOT NULL,
  `division_name` varchar(50) DEFAULT NULL,
  `division_full_name` varchar(100) DEFAULT NULL,
  `division_address` varchar(250) DEFAULT NULL,
  `division_location` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `division_info`
--

INSERT INTO `division_info` (`id`, `division_name`, `division_full_name`, `division_address`, `division_location`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 'MHO', 'Motijheel Head Office', 'Motijeel, Dhaka', 'Head Office', NULL, NULL, NULL),
(2, 'GHO', 'Gulshan Head Office', 'Gulshan, Dhaka', 'Head Office', NULL, NULL, NULL),
(3, 'YSML', 'Yesmin Spinning Mills Ltd', '', 'Factory', NULL, NULL, NULL),
(4, 'ZSML', 'Zaber Spinning Mills Ltd', '', 'Factory', NULL, NULL, NULL),
(5, 'NSML', 'Noman Spinning Mills Ltd.', '', 'Factory', NULL, NULL, NULL),
(6, 'TSML', 'Talha Spinning Mills Ltd.', '', 'Factory', NULL, NULL, NULL),
(7, 'ISML', 'Ismail Spinning Mills Ltd.', '', 'Factory', NULL, NULL, NULL),
(10, 'SCML', 'Sufia Cotton Mills Ltd.', 'Sreepur, Gazipur', 'Factory', NULL, NULL, NULL),
(11, 'SCMLW', 'Sufia Cotton Mills Ltd. (Weaving)', 'Sreepur, Gazipur', 'Factory', NULL, NULL, NULL),
(12, 'NDML', 'Nice Denim Mills Ltd.', 'Sreepur, Gazipur', 'Factory', NULL, NULL, NULL),
(13, 'NDMLW', 'Nice Denim Mills Ltd (Washing)', 'Sreepur, Gazipur', 'Factory', NULL, NULL, NULL),
(14, 'NWML', 'Noman Weaving Mills Ltd(Shed-1)', 'Sreepur, Gazipur', 'Factory', NULL, NULL, NULL),
(15, 'NWML2', 'Noman Weaving Mills Ltd.(Shed-2)', 'Sreepur, Gazipur', 'Factory', NULL, NULL, NULL),
(16, 'NDSD', 'Nice Denim Solid Dyeing', 'Sreepur, Gazipur', 'Factory', NULL, NULL, NULL),
(17, 'NTTML', 'Noman Terry Towel Mills Ltd', 'Mirzapur, Gazipur', 'Factory', NULL, NULL, NULL),
(18, 'TFL', 'Talha Fabrics Ltd', '', 'Factory', NULL, NULL, NULL),
(8, 'ZZFL', 'Zaber & Zubair Fabrics Ltd', 'Pagar, Tongi', 'Factory', NULL, NULL, NULL),
(20, 'SSTML', 'Saad Saan Textile Mills Ltd.', '', 'Factory', NULL, NULL, NULL),
(21, 'TTPL', 'Talha Texpro Ltd.', '', 'Factory', NULL, NULL, NULL),
(9, 'NHTML', 'Noman Home Textile Mills Ltd.', 'Sreepur, Gazipur', 'Factory', NULL, NULL, NULL),
(23, 'NCTL', 'Noman Composite Textile Ltd', '', 'Factory', NULL, NULL, NULL),
(24, 'ZTML', 'Zarba Textile Mills Ltd.', '', 'Factory', NULL, NULL, NULL),
(25, 'ZTML-R', 'Zarba Textile Mills Ltd.(Rotor)', '', 'Factory', NULL, NULL, NULL),
(26, 'ITML', 'Ismail Textile Mills Ltd.', '', 'Factory', NULL, NULL, NULL),
(27, 'NTML', 'Noman Textile Mills Ltd.', '', 'Factory', NULL, NULL, NULL),
(28, 'IAAFL', 'Ismail Anzuman Ara Fabrics Ltd.', '', 'Factory', NULL, NULL, NULL),
(29, 'NFFL', 'Noman Fashion Fabrics Ltd', '', 'Factory', NULL, NULL, NULL),
(30, 'NFL1', 'Noman Fabrics Ltd-1', '', 'Factory', NULL, NULL, NULL),
(31, 'NFL2', 'Noman Fabrics Ltd-2', '', 'Factory', NULL, NULL, NULL),
(32, 'SFL1', 'Sufia Fabrics Ltd-1', '', 'Factory', NULL, NULL, NULL),
(33, 'SFL2', 'Sufia Fabrics Ltd-2', '', 'Factory', NULL, NULL, NULL),
(34, 'SFL3', 'Sufia Fabrics Ltd-3', '', 'Factory', NULL, NULL, NULL),
(35, 'AFL1', 'Artex Fabrics Ltd-1', '', 'Factory', NULL, NULL, NULL),
(36, 'AFL2', 'Artex Fabrics Ltd-2', '', 'Factory', NULL, NULL, NULL),
(37, 'MTML', 'Marium Textile Mills Ltd', '', 'Factory', NULL, NULL, NULL),
(22, 'ZuSML', 'Zubair Spinning Mills Ltd.', '', 'Factory', NULL, NULL, NULL),
(19, 'SSAL', 'Saad Saan Apparels Ltd.', '', 'Factory', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `hourly_output_report_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `hourly_output_report_view`;
CREATE TABLE `hourly_output_report_view` (
`order_details_id` int(11)
,`ship_date` date
,`color` varchar(30)
,`po` varchar(30)
,`line_no` int(11)
,`new_target` int(11)
,`input_date` date
,`Hour_1` decimal(32,0)
,`Hour_2` decimal(32,0)
,`Hour_3` decimal(32,0)
,`Hour_4` decimal(32,0)
,`Hour_5` decimal(32,0)
,`Hour_6` decimal(32,0)
,`Hour_7` decimal(32,0)
,`Hour_8` decimal(32,0)
,`Hour_9` decimal(32,0)
,`Hour_10` decimal(32,0)
,`Hour_11` decimal(32,0)
,`Hour_12` decimal(32,0)
,`Hour_13` decimal(32,0)
,`Hour_14` decimal(32,0)
,`Hour_15` decimal(32,0)
,`Hour_16` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `initial_plan_by_ie`
--

DROP TABLE IF EXISTS `initial_plan_by_ie`;
CREATE TABLE `initial_plan_by_ie` (
  `id` int(11) NOT NULL,
  `swing_production_info_id` int(11) NOT NULL,
  `line_no` int(11) NOT NULL,
  `allocated_qty` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_holidays` int(11) NOT NULL,
  `total_working_hours` int(11) NOT NULL,
  `man_power` int(11) NOT NULL,
  `targeted_hour` int(11) NOT NULL,
  `cumulative_target` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `line_info`
--

DROP TABLE IF EXISTS `line_info`;
CREATE TABLE `line_info` (
  `id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `line` varchar(10) NOT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `line_info`
--

INSERT INTO `line_info` (`id`, `unit`, `line`, `description`) VALUES
(1, 1, 'L-01', '3rd Floor(A)'),
(2, 1, 'L-02', '3rd Floor(A) '),
(3, 1, 'L-03', '3rd Floor(A)'),
(4, 1, 'L-04', '3rd Floor(A)'),
(5, 1, 'L-05', '3rd Floor(A)'),
(6, 1, 'L-06', '5th Floor(B)'),
(7, 1, 'L-07', '5th Floor(B)'),
(8, 1, 'L-08', '5th Floor(B)'),
(9, 1, 'L-09', '5th Floor(B)'),
(10, 1, 'L-10', '5th Floor(B)'),
(11, 2, 'L-11', '6th Floor(A)'),
(12, 2, 'L-12', '6th Floor(A)'),
(13, 2, 'L-13', '6th Floor(A)'),
(14, 2, 'L-14', '6th Floor(A)'),
(15, 2, 'L-15', '6th Floor(A)'),
(16, 2, 'L-16', '6th Floor(B)'),
(17, 2, 'L-17', '6th Floor(B)'),
(18, 2, 'L-18', '6th Floor(B)'),
(19, 2, 'L-19', '6th Floor(B)'),
(20, 2, 'L-20', '6th Floor(B)');

-- --------------------------------------------------------

--
-- Table structure for table `line_man_power_details`
--

DROP TABLE IF EXISTS `line_man_power_details`;
CREATE TABLE `line_man_power_details` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `line_no` int(11) NOT NULL,
  `operator` int(11) NOT NULL,
  `Helper` int(11) NOT NULL,
  `iron_man` int(11) NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(55) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `line_man_power_details`
--

INSERT INTO `line_man_power_details` (`id`, `date`, `line_no`, `operator`, `Helper`, `iron_man`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, '2022-02-27', 1, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:50'),
(2, '2022-02-27', 2, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:50'),
(3, '2022-02-27', 3, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(4, '2022-02-27', 4, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(5, '2022-02-27', 5, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(6, '2022-02-27', 6, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(7, '2022-02-27', 7, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(8, '2022-02-27', 8, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(9, '2022-02-27', 9, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(10, '2022-02-27', 10, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(11, '2022-02-27', 11, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(12, '2022-02-27', 12, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(13, '2022-02-27', 13, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(14, '2022-02-27', 14, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(15, '2022-02-27', 15, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:51'),
(16, '2022-02-27', 16, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:52'),
(17, '2022-02-27', 17, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:52'),
(18, '2022-02-27', 18, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:52'),
(19, '2022-02-27', 19, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:52'),
(20, '2022-02-27', 20, 50, 5, 5, 0, 'qc', '2022-02-27 10:52:52'),
(21, '2022-03-08', 1, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(22, '2022-03-08', 2, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(23, '2022-03-08', 3, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(24, '2022-03-08', 4, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(25, '2022-03-08', 5, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(26, '2022-03-08', 6, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(27, '2022-03-08', 7, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(28, '2022-03-08', 8, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(29, '2022-03-08', 9, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(30, '2022-03-08', 10, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(31, '2022-03-08', 11, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(32, '2022-03-08', 12, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(33, '2022-03-08', 13, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(34, '2022-03-08', 14, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(35, '2022-03-08', 15, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(36, '2022-03-08', 16, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(37, '2022-03-08', 17, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(38, '2022-03-08', 18, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(39, '2022-03-08', 19, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(40, '2022-03-08', 20, 50, 8, 4, 0, 'qc', '2022-03-08 17:58:53'),
(41, '2022-04-24', 1, 10, 10, 10, 9212, 'kausar', '2022-04-24 12:23:19'),
(42, '2022-04-24', 2, 10, 10, 10, 9212, 'kausar', '2022-04-24 12:23:19'),
(43, '2022-04-24', 3, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(44, '2022-04-24', 4, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(45, '2022-04-24', 5, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(46, '2022-04-24', 6, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(47, '2022-04-24', 7, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(48, '2022-04-24', 8, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(49, '2022-04-24', 9, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(50, '2022-04-24', 10, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(51, '2022-04-24', 11, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(52, '2022-04-24', 12, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(53, '2022-04-24', 13, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(54, '2022-04-24', 14, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(55, '2022-04-24', 15, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(56, '2022-04-24', 16, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(57, '2022-04-24', 17, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:19'),
(58, '2022-04-24', 18, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:20'),
(59, '2022-04-24', 19, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:20'),
(60, '2022-04-24', 20, 8, 8, 8, 9212, 'kausar', '2022-04-24 12:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `line_wise_input_per_hour`
--

DROP TABLE IF EXISTS `line_wise_input_per_hour`;
CREATE TABLE `line_wise_input_per_hour` (
  `id` int(11) NOT NULL,
  `order_details_id` int(11) NOT NULL,
  `ship_date` date NOT NULL,
  `line_no` int(11) NOT NULL,
  `hour_no` int(11) NOT NULL,
  `man_power` int(11) NOT NULL,
  `hourly_output` int(11) NOT NULL,
  `input_date` date NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(55) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `line_wise_output_per_hour`
--

DROP TABLE IF EXISTS `line_wise_output_per_hour`;
CREATE TABLE `line_wise_output_per_hour` (
  `id` int(11) NOT NULL,
  `order_details_id` int(11) NOT NULL,
  `ship_date` date NOT NULL,
  `po` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `line_no` int(11) NOT NULL,
  `total_daily_cutting_qty` int(11) NOT NULL,
  `total_daily_completed_quantity` int(11) NOT NULL,
  `hour_no` int(11) NOT NULL,
  `man_power` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `input_date` date NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(55) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `line_wise_output_per_hour`
--

INSERT INTO `line_wise_output_per_hour` (`id`, `order_details_id`, `ship_date`, `po`, `color`, `line_no`, `total_daily_cutting_qty`, `total_daily_completed_quantity`, `hour_no`, `man_power`, `quantity`, `input_date`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 1, '2022-02-19', '226', 'color_1', 1, 200, 100, 1, 0, 90, '2022-02-27', 0, 'qc', '2022-02-27 10:53:52'),
(2, 1, '2022-02-19', '226', 'color_1', 1, 200, 100, 2, 60, 90, '2022-02-27', 0, 'qc', '2022-02-27 10:55:28'),
(3, 9, '2022-04-15', 'TBA', 'color_18', 1, 2000, 1500, 1, 0, 90, '2022-03-08', 0, 'qc', '2022-03-08 18:00:48'),
(4, 9, '2022-04-15', 'TBA', 'color_18', 1, 2000, 1500, 1, 0, 90, '0000-00-00', 0, 'qc', '2022-03-08 18:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `style_details_id` int(11) DEFAULT NULL,
  `po` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `order_qty` varchar(255) NOT NULL,
  `plan_cut_qty` varchar(255) NOT NULL,
  `pcd` varchar(255) NOT NULL,
  `ship_date` date NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(100) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `style_details_id`, `po`, `color`, `order_qty`, `plan_cut_qty`, `pcd`, `ship_date`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 1, '226', 'color_1', '876', '920', '01/24/2022', '2022-02-19', 0, 'iftekhar', '2022-02-12 16:50:28'),
(2, 1, '056', 'color_1', '1499', '1533', '01/24/2022', '2022-02-19', 0, 'iftekhar', '2022-02-12 16:51:54'),
(3, 2, 'TBA', 'color_2', '9755', '10050', '03/25/2022', '2022-04-07', 0, 'qc', '2022-03-08 17:42:23'),
(4, 2, 'TBA', 'color_2', '9755', '10050', '03/25/2022', '2022-04-25', 0, 'qc', '2022-03-08 17:42:49'),
(5, 9, 'TBA', 'color_18', '21040', '21671', '03/27/2022', '2022-04-15', 0, 'qc', '2022-03-08 17:50:29'),
(6, 10, '12345/2022', 'color_19', '500', '550', '04/24/2022', '2022-04-28', 9212, 'kausar', '2022-04-24 12:13:25'),
(7, 10, '12345/2022', 'color_19', '600', '650', '04/24/2022', '2022-04-30', 9212, 'kausar', '2022-04-24 12:15:42'),
(8, 11, '111111/2022', 'color_1', '1000', '550', '05/10/2022', '2022-05-15', 1010, 'kausar', '2022-05-10 10:15:41'),
(9, 11, '111111/2022', 'color_1', '1000', '450', '05/10/2022', '2022-05-20', 1010, 'kausar', '2022-05-10 10:16:01'),
(12, 13, '2222/2022', 'color_13', '1000', '650', '05/12/2022', '2022-05-30', 9212, 'kausar', '2022-05-12 12:08:50'),
(13, 13, '2222/2022', 'color_14', '1000', '550', '05/12/2022', '2022-05-31', 9212, 'kausar', '2022-05-12 12:11:10'),
(14, 14, '55555/2022', 'color_13', '1000', '650', '05/12/2022', '2022-05-30', 9212, 'kausar', '2022-05-12 14:28:40'),
(15, 14, '55555/2022', 'color_4', '1000', '550', '05/12/2022', '2022-05-31', 9212, 'kausar', '2022-05-12 14:36:29'),
(16, 15, 'venus-123', 'color_20', '3000', '3050', '05/12/2022', '2022-05-31', 0, 'iftekhar', '2022-05-12 15:29:23'),
(17, 11, 'new-101', 'select', '900', '930', '05/12/2022', '2022-05-31', 0, 'iftekhar', '2022-05-12 20:22:08'),
(18, 17, 'hhh-123', 'color_21', '900', '930', '05/12/2022', '2022-05-31', 0, 'iftekhar', '2022-05-12 20:47:08'),
(19, 18, 'hasan-123', 'color_14', '900', '930', '05/14/2022', '2022-05-31', 0, 'iftekhar', '2022-05-14 17:08:02'),
(20, 19, 'bbk-123', 'color_23', '900', '930', '05/15/2022', '2022-05-31', 0, 'iftekhar', '2022-05-15 09:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `plan_details`
--

DROP TABLE IF EXISTS `plan_details`;
CREATE TABLE `plan_details` (
  `id` int(11) NOT NULL,
  `order_details_id` int(11) DEFAULT NULL,
  `line_no` varchar(50) NOT NULL,
  `allocated_qty` varchar(50) NOT NULL,
  `plan_input_date` date NOT NULL,
  `plan_output_start_date` date NOT NULL,
  `plan_output_end_date` date NOT NULL,
  `total_leave` int(11) NOT NULL,
  `top_target` int(11) DEFAULT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(100) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp(),
  `ship_date` date DEFAULT NULL,
  `po` varchar(250) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plan_details`
--

INSERT INTO `plan_details` (`id`, `order_details_id`, `line_no`, `allocated_qty`, `plan_input_date`, `plan_output_start_date`, `plan_output_end_date`, `total_leave`, `top_target`, `recording_person_id`, `recording_person_name`, `recording_time`, `ship_date`, `po`, `color`) VALUES
(1, 1, '1', '320', '2022-02-09', '2022-02-12', '2022-02-12', 0, 920, 0, 'qc', '2022-02-27 10:36:44', '2022-02-19', '226', 'color_1'),
(2, 1, '2', '200', '2022-02-27', '2022-02-12', '2022-02-12', 0, 920, 0, 'qc', '2022-02-27 10:49:06', '2022-02-19', '226', 'color_1'),
(3, 2, '1', '10050', '2022-03-10', '2022-03-13', '2022-03-22', 2, 1689, 0, 'qc', '2022-03-08 17:46:00', '2022-04-07', 'TBA', 'color_2'),
(4, 9, '1', '21671', '2022-02-13', '2022-02-14', '2022-03-13', 5, 1251, 0, 'qc', '2022-03-08 17:53:35', '2022-04-15', 'TBA', 'color_18'),
(5, 9, '1', '1000', '2022-04-18', '2022-04-21', '2022-04-18', 1, 100, 0, 'qc', '2022-04-18 11:33:59', '2022-04-15', 'TBA', 'color_18'),
(6, 10, '1', '200', '2022-04-24', '2022-04-25', '2022-04-27', 0, 250, 9212, 'kausar', '2022-04-24 12:18:48', '2022-04-28', '12345/2022', 'color_19'),
(7, 11, '2', '200', '2022-05-10', '2022-05-10', '2022-05-15', 10, 100, 1010, 'kausar', '2022-05-10 10:31:33', '2022-05-15', '111111/2022', 'Denim'),
(8, 11, '3', '200', '2022-05-10', '2022-05-10', '2022-05-15', 10, 100, 1010, 'kausar', '2022-05-10 10:32:22', '2022-05-15', '111111/2022', 'Denim'),
(13, 13, '1', '200', '2022-05-12', '2022-05-15', '2022-05-26', 0, 100, 9212, 'kausar', '2022-05-12 12:18:14', '2022-05-30', '2222/2022', 'color_13'),
(14, 13, '2', '200', '2022-05-12', '2022-05-15', '2022-05-26', 0, 100, 9212, 'kausar', '2022-05-12 12:18:42', '2022-05-30', '2222/2022', 'color_13'),
(15, 13, '3', '200', '2022-05-12', '2022-05-15', '2022-05-26', 0, 100, 9212, 'kausar', '2022-05-12 12:18:49', '2022-05-30', '2222/2022', 'color_13'),
(16, 13, '5', '200', '2022-05-12', '2022-05-15', '2022-05-26', 0, 100, 9212, 'kausar', '2022-05-12 12:19:05', '2022-05-31', '2222/2022', 'color_14'),
(17, 13, '6', '200', '2022-05-12', '2022-05-15', '2022-05-26', 0, 100, 9212, 'kausar', '2022-05-12 12:19:13', '2022-05-31', '2222/2022', 'color_14'),
(18, 13, '7', '200', '2022-05-12', '2022-05-15', '2022-05-26', 0, 100, 9212, 'kausar', '2022-05-12 12:19:22', '2022-05-31', '2222/2022', 'color_14'),
(19, 14, '1', '200', '2022-05-12', '2022-05-14', '2022-05-25', 0, 100, 9212, 'kausar', '2022-05-12 14:35:01', '2022-05-30', '55555/2022', 'color_13'),
(20, 14, '4', '200', '2022-05-12', '2022-05-17', '2022-05-27', 0, 100, 9212, 'kausar', '2022-05-12 14:37:04', '2022-05-31', '55555/2022', 'color_4'),
(21, 15, '1', '450', '2022-05-12', '2022-05-12', '2022-05-29', 3, 45, 0, 'iftekhar', '2022-05-12 15:30:08', '2022-05-31', 'venus-123', 'color_20'),
(22, 11, '1', '450', '2022-05-12', '2022-05-12', '2022-05-30', 3, 45, 0, 'iftekhar', '2022-05-12 20:24:04', '2022-05-15', '111111/2022', 'color_1'),
(23, 17, '1', '450', '2022-05-12', '2022-05-12', '2022-05-30', 3, 45, 0, 'iftekhar', '2022-05-12 20:48:12', '2022-05-31', 'hhh-123', 'color_21'),
(24, 18, '1', '450', '2022-05-14', '2022-05-14', '2022-05-30', 3, 44, 0, 'iftekhar', '2022-05-14 17:10:58', '2022-05-31', 'hasan-123', 'color_14'),
(25, 19, '1', '450', '2022-05-15', '2022-05-15', '2022-05-30', 2, 22, 0, 'iftekhar', '2022-05-15 09:53:49', '2022-05-31', 'bbk-123', 'color_23');

-- --------------------------------------------------------

--
-- Table structure for table `production_details`
--

DROP TABLE IF EXISTS `production_details`;
CREATE TABLE `production_details` (
  `id` int(11) NOT NULL,
  `order_details_id` int(11) NOT NULL,
  `po` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `input_date` date NOT NULL,
  `daily_cutting_qty` int(11) NOT NULL,
  `line_no` varchar(30) NOT NULL,
  `sewing_completed_quantity` int(11) NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(100) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp(),
  `ship_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `production_details`
--

INSERT INTO `production_details` (`id`, `order_details_id`, `po`, `color`, `input_date`, `daily_cutting_qty`, `line_no`, `sewing_completed_quantity`, `recording_person_id`, `recording_person_name`, `recording_time`, `ship_date`) VALUES
(1, 1, '226', 'color_1', '2022-02-27', 200, '1', 100, 0, 'qc', '2022-02-27 10:50:06', '2022-02-19'),
(2, 2, 'TBA', 'color_2', '2022-03-08', 200, 'select', 0, 0, 'qc', '2022-03-08 17:46:46', '2022-04-07'),
(3, 9, 'TBA', 'BLU DENIM SCURO', '2022-03-08', 2000, '1', 1500, 0, 'qc', '2022-03-08 17:54:57', '2022-04-15'),
(4, 10, '12345/2022', 'color_19', '2022-04-24', 200, '1', 200, 9212, 'kausar', '2022-04-24 12:20:45', '2022-04-28'),
(5, 11, '111111/2022', 'color_1', '2022-05-10', 200, '2', 200, 1010, 'kausar', '2022-05-10 10:33:49', '2022-05-15'),
(6, 11, '111111/2022', 'color_1', '2022-05-10', 200, '3', 200, 1010, 'kausar', '2022-05-10 10:34:10', '2022-05-15'),
(16, 13, '2222/2022', 'color_13', '2022-05-12', 200, '1', 200, 9212, 'kausar', '2022-05-12 12:22:14', '2022-05-30'),
(17, 13, '2222/2022', 'color_13', '2022-05-12', 200, '2', 200, 9212, 'kausar', '2022-05-12 12:22:25', '2022-05-30'),
(18, 13, '2222/2022', 'color_13', '2022-05-12', 200, '3', 200, 9212, 'kausar', '2022-05-12 12:22:29', '2022-05-30'),
(19, 13, '2222/2022', 'color_14', '2022-05-12', 200, '4', 200, 9212, 'kausar', '2022-05-12 12:22:40', '2022-05-31'),
(20, 13, '2222/2022', 'color_14', '2022-05-12', 200, '5', 200, 9212, 'kausar', '2022-05-12 12:22:44', '2022-05-31'),
(21, 14, '55555/2022', 'color_13', '2022-05-12', 200, '1', 200, 9212, 'kausar', '2022-05-12 14:35:37', '2022-05-30'),
(22, 14, '55555/2022', 'color_13', '2022-05-12', 200, '2', 200, 9212, 'kausar', '2022-05-12 14:35:42', '2022-05-30'),
(23, 14, '55555/2022', 'color_13', '2022-05-12', 200, '3', 200, 9212, 'kausar', '2022-05-12 14:35:46', '2022-05-30'),
(24, 14, '55555/2022', 'color_4', '2022-05-12', 200, '4', 200, 9212, 'kausar', '2022-05-12 14:37:20', '2022-05-31'),
(25, 14, '55555/2022', 'color_4', '2022-05-12', 200, '5', 200, 9212, 'kausar', '2022-05-12 14:37:25', '2022-05-31'),
(26, 1, '226', 'color_1', '2022-05-12', 200, '1', 400, 0, 'iftekhar', '2022-05-12 15:02:12', '2022-02-19'),
(36, 15, 'venus-123', 'color_20', '2022-05-12', 50, '13', 7, 0, 'iftekhar', '2022-05-12 17:48:00', '2022-05-31'),
(37, 15, 'venus-123', 'color_20', '2022-05-12', 50, '18', 7, 0, 'iftekhar', '2022-05-12 17:50:08', '2022-05-31'),
(38, 15, 'venus-123', 'color_20', '2022-05-12', 50, '15', 7, 0, 'iftekhar', '2022-05-12 17:51:32', '2022-05-31'),
(39, 11, '111111/2022', 'color_1', '2022-05-12', 40, 'not_select_yet', 56, 0, 'iftekhar', '2022-05-12 20:25:15', '2022-05-20'),
(40, 11, '111111/2022', 'color_1', '2022-05-12', 40, '1', 56, 0, 'iftekhar', '2022-05-12 20:25:56', '2022-05-20'),
(45, 17, 'hhh-123', 'color_21', '2022-05-12', 40, '1', 50, 0, 'iftekhar', '2022-05-12 22:19:37', '2022-05-31'),
(46, 17, 'hhh-123', 'color_21', '2022-05-12', 40, '2', 0, 0, 'iftekhar', '2022-05-12 22:20:48', '2022-05-31'),
(47, 14, '55555/2022', 'color_13', '2022-05-14', 200, '7', 200, 0, 'iftekhar', '2022-05-14 12:21:54', '2022-05-30'),
(48, 11, '111111/2022', 'color_1', '2022-05-14', 40, '14', 0, 0, 'iftekhar', '2022-05-14 16:55:13', '2022-05-15'),
(49, 1, '226', 'color_1', '2022-05-14', 200, '1', 100, 0, 'iftekhar', '2022-05-14 16:58:43', '2022-02-19'),
(50, 1, '226', 'color_1', '2022-05-14', 40, '2', 50, 0, 'iftekhar', '2022-05-14 16:58:32', '2022-02-19'),
(51, 18, 'hasan-123', 'color_14', '2022-05-14', 40, '10', 0, 0, 'iftekhar', '2022-05-14 17:17:05', '2022-05-31'),
(52, 18, 'hasan-123', 'color_14', '2022-05-14', 50, '2', 30, 0, 'iftekhar', '2022-05-14 17:24:12', '2022-05-31'),
(53, 18, 'hasan-123', 'color_14', '2022-05-14', 50, '1', 0, 0, 'iftekhar', '2022-05-14 17:24:48', '2022-05-31'),
(54, 19, 'bbk-123', 'color_23', '2022-05-15', 40, '1', 30, 0, 'iftekhar', '2022-05-15 09:55:58', '2022-05-31'),
(55, 19, 'bbk-123', 'color_23', '2022-05-15', 45, '2', 30, 0, 'iftekhar', '2022-05-15 10:01:43', '2022-05-31'),
(56, 19, 'bbk-123', 'color_23', '2022-05-15', 48, '4', 0, 0, 'iftekhar', '2022-05-15 10:07:03', '2022-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `style_details`
--

DROP TABLE IF EXISTS `style_details`;
CREATE TABLE `style_details` (
  `id` int(11) NOT NULL,
  `buyer_no` varchar(255) NOT NULL,
  `style_no` varchar(250) NOT NULL,
  `smv` double NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(100) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `style_details`
--

INSERT INTO `style_details` (`id`, `buyer_no`, `style_no`, `smv`, `item_name`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 'buyer_1', 'style_1', 21.05, 'Ladies Short All', 0, 'iftekhar', '2022-02-12 16:46:26'),
(2, 'buyer_2', 'style_2', 16.63, 'Ladies Long Pant', 0, 'qc', '2022-03-08 17:31:29'),
(3, 'buyer_3', 'style_3', 11.78, 'Paijama', 0, 'qc', '2022-03-08 17:32:50'),
(4, 'buyer_2', 'style_4', 16.3, 'Long Sleeve Shirt', 0, 'qc', '2022-03-08 17:33:31'),
(5, 'buyer_2', 'style_5', 14.74, 'Ladies Long Pant', 0, 'qc', '2022-03-08 17:34:13'),
(6, 'buyer_2', 'style_6', 25.5, 'Dress Pant', 0, 'qc', '2022-03-08 17:35:01'),
(7, 'buyer_3', 'style_7', 18.3, 'Hoody Jacket', 0, 'qc', '2022-03-08 17:35:40'),
(8, 'buyer_2', 'style_8', 22.28, 'Long Sleeve Shirt', 0, 'qc', '2022-03-08 17:36:38'),
(9, 'buyer_2', 'style_10', 18.7, 'Ladies Long Pant', 0, 'qc', '2022-03-08 17:49:18'),
(10, 'buyer_5', 'style_11', 50, 'Dress Shirt 2022', 9212, 'kausar', '2022-04-24 12:09:13'),
(11, 'buyer_5', 'style_12', 50, 'Dress Shirt May-2022', 1010, 'kausar', '2022-05-10 10:11:39'),
(12, 'buyer_1', 'style_7', 50, 'Dress Shirt May-2022', 9212, 'kausar', '2022-05-12 12:03:59'),
(13, 'buyer_1', 'style_13', 50, 'Dress Shirt May-2022', 9212, 'kausar', '2022-05-12 12:08:28'),
(14, 'buyer_1', 'style_14', 50, 'Dress Shirt May-2022', 9212, 'kausar', '2022-05-12 14:27:36'),
(15, 'buyer_6', 'style_15', 15.33, 'Shirt', 0, 'iftekhar', '2022-05-12 15:28:31'),
(16, 'buyer_4', 'style_3', 22, 'Panjabi', 0, 'iftekhar', '2022-05-12 20:18:46'),
(17, 'buyer_7', 'style_16', 22, 'Shirt', 0, 'iftekhar', '2022-05-12 20:46:28'),
(18, 'buyer_8', 'style_17', 15.33, 'Shirt', 0, 'iftekhar', '2022-05-14 17:06:57'),
(19, 'buyer_9', 'style_18', 15.33, 'Panjabi', 0, 'iftekhar', '2022-05-15 09:50:55');

-- --------------------------------------------------------

--
-- Stand-in structure for view `style_l_s_c_p_t_h_q_m_input`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `style_l_s_c_p_t_h_q_m_input`;
CREATE TABLE `style_l_s_c_p_t_h_q_m_input` (
`style_details_id` int(11)
,`line_no` int(11)
,`ship_date` date
,`color` varchar(30)
,`po` varchar(30)
,`new_target` int(11)
,`hour_no` int(11)
,`quantity` int(11)
,`man_power` int(11)
,`input_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `style_name`
--

DROP TABLE IF EXISTS `style_name`;
CREATE TABLE `style_name` (
  `row_id` int(10) NOT NULL,
  `style_id` varchar(15) NOT NULL,
  `style_name` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `style_name`
--

INSERT INTO `style_name` (`row_id`, `style_id`, `style_name`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 'style_1', '308633', 'iftekhar', 'iftekhar', '2022-02-12 16:45:25'),
(10, 'style_10', 'PJTU00775A', 'qc', 'qc', '2022-03-08 17:48:20'),
(11, 'style_11', 'LXL NEW 2022', '9212', 'kausar', '2022-04-24 12:05:46'),
(12, 'style_12', 'LLXXLL', '1010', 'kausar', '2022-05-10 10:10:58'),
(13, 'style_13', 'LLXXLL/2022', '9212', 'kausar', '2022-05-12 12:08:15'),
(14, 'style_14', 'NEW STYLE 2022', '9212', 'kausar', '2022-05-12 14:27:19'),
(15, 'style_15', 'style-venus', 'iftekhar', 'iftekhar', '2022-05-12 15:28:01'),
(16, 'style_16', 'hhhhhhhh', 'iftekhar', 'iftekhar', '2022-05-12 20:39:45'),
(17, 'style_17', 'style-hasan', 'iftekhar', 'iftekhar', '2022-05-14 17:06:27'),
(18, 'style_18', 'style-bbk', 'iftekhar', 'iftekhar', '2022-05-15 09:50:15'),
(2, 'style_2', 'PMTD01779AAI20', 'qc', 'qc', '2022-03-08 17:22:42'),
(3, 'style_3', '5410571-M1', 'qc', 'qc', '2022-03-08 17:25:44'),
(4, 'style_4', 'CATD02348A', 'qc', 'qc', '2022-03-08 17:26:15'),
(5, 'style_5', 'PJTD01952AMED', 'qc', 'qc', '2022-03-08 17:26:43'),
(6, 'style_6', 'PMTU00950A', 'qc', 'qc', '2022-03-08 17:26:56'),
(7, 'style_7', 'Ladies Zip Through', 'qc', 'qc', '2022-03-08 17:27:08'),
(8, 'style_8', 'CATU01512A', 'qc', 'qc', '2022-03-08 17:27:19'),
(9, 'style_9', '5410571-M2', 'qc', 'qc', '2022-03-08 17:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `swing_production_info`
--

DROP TABLE IF EXISTS `swing_production_info`;
CREATE TABLE `swing_production_info` (
  `id` int(11) NOT NULL,
  `buyer_id` varchar(20) NOT NULL,
  `style_name_id` varchar(20) NOT NULL,
  `color_id` varchar(20) NOT NULL,
  `recording_person_id` varchar(40) NOT NULL,
  `recording_person_name` varchar(40) NOT NULL,
  `recording_time` date NOT NULL,
  `order_qty` int(11) NOT NULL,
  `smv` int(11) NOT NULL,
  `ship_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `swing_production_per_hour`
--

DROP TABLE IF EXISTS `swing_production_per_hour`;
CREATE TABLE `swing_production_per_hour` (
  `id` int(11) NOT NULL,
  `swing_production_info_id` int(11) NOT NULL,
  `production_date` varchar(255) NOT NULL,
  `line_id` int(11) NOT NULL,
  `hour` varchar(255) NOT NULL,
  `garments` varchar(255) NOT NULL,
  `recording_person_id` varchar(40) NOT NULL,
  `recording_person_name` varchar(40) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `swing_production_planning`
--

DROP TABLE IF EXISTS `swing_production_planning`;
CREATE TABLE `swing_production_planning` (
  `id` int(11) NOT NULL,
  `order_details_id` int(11) NOT NULL,
  `color` varchar(250) NOT NULL,
  `po` varchar(250) NOT NULL,
  `ship_date` date NOT NULL,
  `layout_start_time` datetime NOT NULL,
  `layout_end_time` datetime NOT NULL,
  `total_time` varchar(250) NOT NULL,
  `first_output_date` date NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(50) NOT NULL,
  `recording_time` datetime NOT NULL,
  `line_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `swing_production_planning`
--

INSERT INTO `swing_production_planning` (`id`, `order_details_id`, `color`, `po`, `ship_date`, `layout_start_time`, `layout_end_time`, `total_time`, `first_output_date`, `recording_person_id`, `recording_person_name`, `recording_time`, `line_no`) VALUES
(1, 1, 'color_1', '226', '2022-02-19', '2022-02-12 09:00:00', '2022-02-12 20:00:00', '11 Hour', '2022-02-12', 0, 'qc', '2022-02-27 10:51:15', ''),
(2, 9, 'color_18', 'TBA', '2022-04-15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '31 Day 0 Hour', '2022-03-09', 0, 'qc', '2022-03-08 17:56:52', ''),
(3, 10, 'color_19', '12345/2022', '2022-04-28', '2022-04-24 12:00:00', '2022-04-24 14:00:00', '2 Hour', '2022-04-25', 9212, 'kausar', '2022-04-24 12:22:17', ''),
(26, 11, 'color_1', '111111/2022', '2022-05-15', '2022-05-18 12:00:00', '2022-05-16 14:00:00', '4 Day 2 Hour', '2022-05-16', 0, 'iftekhar', '2022-05-12 15:00:21', '2'),
(27, 13, 'color_13', '2222/2022', '2022-05-30', '2022-05-12 12:22:00', '2022-05-18 12:23:00', '6 Day 0 Hour', '2022-05-18', 9212, 'kausar', '2022-05-12 12:23:23', '1'),
(28, 14, 'color_13', '55555/2022', '2022-05-30', '2022-05-14 16:00:00', '2022-05-25 18:00:00', '11 Day 2 Hour', '2022-05-25', 9212, 'kausar', '2022-05-12 14:41:05', '1'),
(29, 14, 'color_13', '55555/2022', '2022-05-30', '2022-05-12 14:41:00', '2022-05-26 14:41:00', '14 Day 0 Hour', '2022-05-26', 9212, 'kausar', '2022-05-12 14:41:41', '2');

-- --------------------------------------------------------

--
-- Table structure for table `target_output_set_per_line`
--

DROP TABLE IF EXISTS `target_output_set_per_line`;
CREATE TABLE `target_output_set_per_line` (
  `id` int(11) NOT NULL,
  `order_details_id` int(11) NOT NULL,
  `ship_date` date NOT NULL,
  `po` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `line_no` int(11) NOT NULL,
  `hourly_target` int(11) NOT NULL,
  `input_date` date NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(55) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_access_management`
--

DROP TABLE IF EXISTS `user_access_management`;
CREATE TABLE `user_access_management` (
  `id` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `users` int(10) DEFAULT NULL,
  `create_user` int(10) DEFAULT NULL,
  `user_list` int(10) DEFAULT NULL,
  `files` int(10) DEFAULT NULL,
  `file_create` int(10) DEFAULT NULL,
  `file_list` int(10) DEFAULT NULL,
  `lc_and_pi` int(10) DEFAULT NULL,
  `lc_and_pi_doc` int(10) DEFAULT NULL,
  `lc_and_pi_acceptance_doc` int(10) DEFAULT NULL,
  `b2b` int(10) DEFAULT NULL,
  `b2b_lc_and_pi_weave_doc` int(10) DEFAULT NULL,
  `b2b_lc_and_pi_spin_doc` int(10) DEFAULT NULL,
  `b2b_doc_weave_doc` int(10) DEFAULT NULL,
  `b2b_doc_spin_doc` int(10) DEFAULT NULL,
  `btma_and_cash` int(10) DEFAULT NULL,
  `btma_weave_doc` int(10) DEFAULT NULL,
  `btma_spin_doc` int(10) DEFAULT NULL,
  `cash_weave_doc` int(10) DEFAULT NULL,
  `banking` int(10) DEFAULT NULL,
  `banking_bank_acceptance_doc` int(10) DEFAULT NULL,
  `prc` int(10) DEFAULT NULL,
  `prc_duration_doc` int(10) DEFAULT NULL,
  `others` int(10) DEFAULT NULL,
  `backup_doc` int(10) DEFAULT NULL,
  `settings` int(10) DEFAULT NULL,
  `recording_person_id` varchar(30) NOT NULL,
  `recording_time` datetime NOT NULL,
  `modifying_person_id` varchar(30) NOT NULL,
  `modification_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `employee_name` varchar(100) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `confirm_password` varchar(50) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `profile_picture` varchar(130) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `user_name`, `employee_name`, `user_id`, `password`, `confirm_password`, `user_type`, `status`, `email`, `contact_no`, `department`, `designation`, `profile_picture`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(15, 'iftekhar', 'iftekhar', 'iftekhar', '12345', '12345', 'Admin', 'Active', 'abcd@gmail.com', '11111111', 'ICT', 'Application Developer', 'default.png', 'iftekhar', 'iftekhar', '2021-02-23 15:53:17'),
(26, 'Md. Jiash Hasnat', 'Md.Jiash Hasnat', '004143', 'covid19zz', 'covid19zz', 'Admin', 'Active', 'ftslab@znzfab.com', '01985982850', 'Lab & QC', 'Engineer', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:44:07'),
(27, 'Md. Saiful Islam', NULL, 'Saiful Lab', '4321', '4321', 'User', 'Active', 'md.saiful@znzfab.com', '01701212563', 'Marketing', 'Manager', 'default.png', 'qc', 'qc', '2020-12-01 09:55:55'),
(28, 'Md. Saiful Islam', NULL, 'Saiful Lab', '4321', '4321', 'User', 'Active', 'md.saiful@znzfab.com', '01701212563', 'ICT', 'Manager', 'default.png', 'qc', 'qc', '2020-12-01 09:58:41'),
(30, 'qc', 'Mr.qc', 'qc', '12345', '12345', 'Admin', 'Active', 'qc@gmail.com', '100000000', 'Lab & QC', 'Deputy Manager', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:44:16'),
(32, 'abc', 'Mr.QC', 'abc123', '12345', '12345', 'User', 'Active', 'abc@gmail.com', '11111111', 'ICT', 'Engineer', 'default.png', 'iftekhar', 'iftekhar', '2021-02-23 15:51:47'),
(34, 'dto', 'data entry operator', 'dto_1', '12345', '12345', 'User', 'Active', 'dto@dto.com', '34543523232', 'ICT', 'Data Co-ordinator', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:43:56'),
(35, 'dto', 'data entry operator', 'dto_1', '12345', '12345', 'User', 'Active', 'dto@dto.com', '34543523232', 'ICT', 'Data Co-ordinator', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:43:56'),
(36, 'Data Entry OP', 'Mr. Haris', '090', '1234', '1234', 'Sub_User', 'Active', 'jiash09@live.com', '0', 'Marketing', 'Assistant Officer', 'default.png', 'qc', 'qc', '2021-03-10 17:51:42'),
(37, 'kausar', 'Kausar Ahmed', '9212', '12345', '12345', 'Admin', 'Active', 'kausarcse@gmail.com', '01738128576', 'Marketing', 'Application Developer', 'kausarNewPic.jpg', 'iftekhar', 'iftekhar', '2022-04-24 12:04:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `employee_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_no` varchar(25) NOT NULL,
  `department` varchar(30) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `recording_person_id` varchar(30) NOT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `user_id`, `user_name`, `employee_name`, `first_name`, `last_name`, `middle_name`, `password`, `email`, `contact_no`, `department`, `designation`, `user_type`, `status`, `profile_picture`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(69, 'iftekhar', 'iftekhar', '', '', '', '', '12345', 'abcd@gmail.com', '11111111', 'ICT', 'Application Developer', 'Admin', 'Active', 'default.png', 'iftekhar', 'iftekhar', '2021-02-23 15:53:17'),
(84, 'qc', 'qc', 'Mr.qc', '', '', '', '12345', 'qc@gmail.com', '100000000', 'Lab & QC', 'Deputy Manager', 'Admin', 'Active', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:44:16'),
(80, '004143', 'Md. Jiash Hasnat', 'Md.Jiash Hasnat', '', '', '', 'covid19zz', 'ftslab@znzfab.com', '01985982850', 'Lab & QC', 'Engineer', 'User', 'Active', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:44:07'),
(89, 'dto_1', 'dto', 'data entry operator', '', '', '', '12345', 'dto@dto.com', '34543523232', 'ICT', 'Data Co-ordinator', 'Sub_User', 'Active', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:43:56'),
(90, '090', 'Data Entry OP', 'Mr. Haris', '', '', '', '1234', 'jiash09@live.com', '0', 'Marketing', 'Assistant Officer', 'Sub_User', 'Active', 'default.png', 'qc', 'qc', '2021-03-10 17:51:42'),
(91, '9212', 'kausar', 'Kausar Ahmed', '', '', '', '12345', 'kausarcse@gmail.com', '01738128576', 'Marketing', 'Application Developer', 'Admin', 'Active', 'kausarNewPic.jpg', 'iftekhar', 'iftekhar', '2022-04-24 12:04:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_old`
--

DROP TABLE IF EXISTS `user_login_old`;
CREATE TABLE `user_login_old` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact_no` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `recording_person_id` varchar(30) NOT NULL,
  `recording_person_name` varchar(50) NOT NULL,
  `recording_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `name`, `short_name`) VALUES
(1, 'Super Admin', 'super_admin'),
(2, 'Admin', 'admin'),
(3, 'Senior Officer LC & PI', 'senior_officer_lc_pi'),
(4, 'Senior Officer B2B', 'senior_officer_b2b'),
(5, 'Assistant Manager ', 'assistant_manager'),
(6, 'Assistant Manager Banking', 'assistant_manager_banking'),
(7, 'Officer', 'officer'),
(8, 'Assistant Officer BTMA', 'assistant_officer_btma'),
(9, 'Assistant Officer B2B', 'assistant_officer_b2b'),
(10, 'Manager', 'manager'),
(11, 'Sub User', 'sub_user');

-- --------------------------------------------------------

--
-- Table structure for table `version_name`
--

DROP TABLE IF EXISTS `version_name`;
CREATE TABLE `version_name` (
  `row_id` int(10) NOT NULL,
  `version_id` varchar(15) NOT NULL,
  `version_name` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wip_view`
--

DROP TABLE IF EXISTS `wip_view`;
CREATE TABLE `wip_view` (
  `order_details_id` int(11) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `po` varchar(50) DEFAULT NULL,
  `WIP` decimal(33,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `hourly_output_report_view`
--
DROP TABLE IF EXISTS `hourly_output_report_view`;

DROP VIEW IF EXISTS `hourly_output_report_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hourly_output_report_view`  AS SELECT `style_l_s_c_p_t_h_q_m_input`.`style_details_id` AS `order_details_id`, `style_l_s_c_p_t_h_q_m_input`.`ship_date` AS `ship_date`, `style_l_s_c_p_t_h_q_m_input`.`color` AS `color`, `style_l_s_c_p_t_h_q_m_input`.`po` AS `po`, `style_l_s_c_p_t_h_q_m_input`.`line_no` AS `line_no`, `style_l_s_c_p_t_h_q_m_input`.`new_target` AS `new_target`, `style_l_s_c_p_t_h_q_m_input`.`input_date` AS `input_date`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 1,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_1`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 2,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_2`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 3,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_3`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 4,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_4`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 5,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_5`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 6,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_6`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 7,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_7`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 8,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_8`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 9,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_9`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 10,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_10`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 11,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_11`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 12,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_12`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 13,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_13`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 14,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_14`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 15,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_15`, sum(if(`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 16,`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_16` FROM `style_l_s_c_p_t_h_q_m_input` GROUP BY `style_l_s_c_p_t_h_q_m_input`.`style_details_id`, `style_l_s_c_p_t_h_q_m_input`.`ship_date`, `style_l_s_c_p_t_h_q_m_input`.`color`, `style_l_s_c_p_t_h_q_m_input`.`po`, `style_l_s_c_p_t_h_q_m_input`.`input_date``input_date`  ;

-- --------------------------------------------------------

--
-- Structure for view `style_l_s_c_p_t_h_q_m_input`
--
DROP TABLE IF EXISTS `style_l_s_c_p_t_h_q_m_input`;

DROP VIEW IF EXISTS `style_l_s_c_p_t_h_q_m_input`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `style_l_s_c_p_t_h_q_m_input`  AS SELECT `daily_target_set_line_details`.`style_details_id` AS `style_details_id`, `daily_target_set_line_details`.`line_no` AS `line_no`, `daily_target_set_line_details`.`ship_date` AS `ship_date`, `daily_target_set_line_details`.`color` AS `color`, `daily_target_set_line_details`.`po` AS `po`, `daily_target_set_line_details`.`new_target` AS `new_target`, `line_wise_output_per_hour`.`hour_no` AS `hour_no`, `line_wise_output_per_hour`.`quantity` AS `quantity`, `line_wise_output_per_hour`.`man_power` AS `man_power`, `line_wise_output_per_hour`.`input_date` AS `input_date` FROM (`daily_target_set_line_details` join `line_wise_output_per_hour` on(`daily_target_set_line_details`.`style_details_id` = `line_wise_output_per_hour`.`order_details_id` and `daily_target_set_line_details`.`line_no` = `line_wise_output_per_hour`.`line_no` and `daily_target_set_line_details`.`ship_date` = `line_wise_output_per_hour`.`ship_date` and `daily_target_set_line_details`.`color` = `line_wise_output_per_hour`.`color` and `daily_target_set_line_details`.`input_date` = `line_wise_output_per_hour`.`input_date`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `daily_input_for_swing`
--
ALTER TABLE `daily_input_for_swing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_target_set_line_details`
--
ALTER TABLE `daily_target_set_line_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department_info`
--
ALTER TABLE `department_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation_info`
--
ALTER TABLE `designation_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `division_info`
--
ALTER TABLE `division_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `initial_plan_by_ie`
--
ALTER TABLE `initial_plan_by_ie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `initial_plan_id` (`swing_production_info_id`);

--
-- Indexes for table `line_info`
--
ALTER TABLE `line_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_man_power_details`
--
ALTER TABLE `line_man_power_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_wise_input_per_hour`
--
ALTER TABLE `line_wise_input_per_hour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_wise_output_per_hour`
--
ALTER TABLE `line_wise_output_per_hour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_details`
--
ALTER TABLE `plan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `production_details`
--
ALTER TABLE `production_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `style_details`
--
ALTER TABLE `style_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `style_name`
--
ALTER TABLE `style_name`
  ADD PRIMARY KEY (`style_id`);

--
-- Indexes for table `swing_production_info`
--
ALTER TABLE `swing_production_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `swing_production_per_hour`
--
ALTER TABLE `swing_production_per_hour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `swing_production_planning`
--
ALTER TABLE `swing_production_planning`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `target_output_set_per_line`
--
ALTER TABLE `target_output_set_per_line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_management`
--
ALTER TABLE `user_access_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login_old`
--
ALTER TABLE `user_login_old`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `version_name`
--
ALTER TABLE `version_name`
  ADD PRIMARY KEY (`version_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daily_input_for_swing`
--
ALTER TABLE `daily_input_for_swing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_target_set_line_details`
--
ALTER TABLE `daily_target_set_line_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department_info`
--
ALTER TABLE `department_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designation_info`
--
ALTER TABLE `designation_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `division_info`
--
ALTER TABLE `division_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `initial_plan_by_ie`
--
ALTER TABLE `initial_plan_by_ie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `line_info`
--
ALTER TABLE `line_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `line_man_power_details`
--
ALTER TABLE `line_man_power_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `line_wise_input_per_hour`
--
ALTER TABLE `line_wise_input_per_hour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `line_wise_output_per_hour`
--
ALTER TABLE `line_wise_output_per_hour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `plan_details`
--
ALTER TABLE `plan_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `production_details`
--
ALTER TABLE `production_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `style_details`
--
ALTER TABLE `style_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `swing_production_per_hour`
--
ALTER TABLE `swing_production_per_hour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `swing_production_planning`
--
ALTER TABLE `swing_production_planning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `target_output_set_per_line`
--
ALTER TABLE `target_output_set_per_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_access_management`
--
ALTER TABLE `user_access_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `user_login_old`
--
ALTER TABLE `user_login_old`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
