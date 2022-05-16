-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2022 at 07:58 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

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
CREATE DATABASE IF NOT EXISTS `processing` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `processing`;


-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

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
(1, 'buyer_1', 'H&m', '', 'Antarctica', 'iftekhar', 'iftekhar', '2021-05-27 11:09:20'),
(2, 'buyer_2', 'LABLOW', '', '', 'iftekhar', 'iftekhar', '2021-05-30 11:40:52'),
(3, 'buyer_3', 'OSHKOSH', '', '', 'iftekhar', 'iftekhar', '2021-05-30 16:55:33'),
(4, 'buyer_4', 'HEMA', '', '', 'qc', 'qc', '2021-06-01 15:40:10'),
(5, 'buyer_5', 'HEMA', 'Mollar tek,Uttara,Dhaka', 'Argentina', 'qc', 'qc', '2021-11-22 17:26:04');

-- --------------------------------------------------------

--
-- Stand-in structure for view `buyer_input_orderdetails`
-- (See below for the actual view)
--
CREATE TABLE `buyer_input_orderdetails` (
`buyer_name` varchar(100)
,`input_date` date
,`style_details_id` int(11)
,`color` varchar(30)
,`po` varchar(30)
,`ship_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

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
(2, 'color_2', 'S3501 BLUE DENIM', 'user_id', 'iftekhar', '2021-05-27 11:52:58'),
(3, 'color_3', 'BROWN', 'iftekhar', 'iftekhar', '2021-05-30 11:49:33'),
(4, 'color_4', 'MINI8JUNE21', 'iftekhar', 'iftekhar', '2021-05-30 16:56:12'),
(5, 'color_5', 'LAINE BLUE', 'qc', 'qc', '2021-06-01 15:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

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
(1, 1, 1, '1', 'color_3', '2021-01-11', 700, 300, -400, 60, '2022-01-09', 'iftekhar', 'iftekhar', '2022-01-09 17:03:25'),
(2, 1, 1, '1', 'color_3', '2021-01-11', 900, 800, -100, 200, '2022-01-10', 'iftekhar', 'iftekhar', '2022-01-10 12:48:30'),
(3, 3, 1, '1', 'color_3', '2021-12-11', 609, 1400, 791, 100, '2022-01-10', 'iftekhar', 'iftekhar', '2022-01-10 12:48:30'),
(4, 14, 3, '1', 'color_3', '2021-12-11', 4, 50, 46, 120, '2022-01-10', 'iftekhar', 'iftekhar', '2022-01-10 12:48:30'),
(5, 1, 5, '1111111', 'color_5', '2021-12-25', 500, 20, 0, 100, '2022-01-11', 'iftekhar', 'iftekhar', '2022-01-11 12:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `department_info`
--

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

--
-- Dumping data for table `initial_plan_by_ie`
--

INSERT INTO `initial_plan_by_ie` (`id`, `swing_production_info_id`, `line_no`, `allocated_qty`, `start_date`, `end_date`, `total_holidays`, `total_working_hours`, `man_power`, `targeted_hour`, `cumulative_target`) VALUES
(2, 9, 1, 800, '0000-00-00', '0000-00-00', 3, 5, 1, 1, 160),
(3, 10, 0, 800, '0000-00-00', '0000-00-00', 3, 5, 1, 1, 160),
(4, 11, 0, 800, '0000-00-00', '0000-00-00', 3, 5, 1, 1, 160),
(5, 12, 0, 800, '0000-00-00', '0000-00-00', 3, 5, 1, 1, 160),
(6, 13, 0, 800, '2021-03-11', '2021-01-12', 1, 27, 1, 1, 29.62962962962963),
(7, 14, 0, 800, '2021-01-11', '0000-00-00', 3, 19, 100, 12, 42.10526315789474),
(8, 15, 0, 0, '0000-00-00', '0000-00-00', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `line_info`
--

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
(1, '2022-01-10', 1, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(2, '2022-01-10', 2, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(3, '2022-01-10', 3, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(4, '2022-01-10', 4, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(5, '2022-01-10', 5, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(6, '2022-01-10', 6, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(7, '2022-01-10', 7, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(8, '2022-01-10', 8, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(9, '2022-01-10', 9, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(10, '2022-01-10', 10, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(11, '2022-01-10', 11, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(12, '2022-01-10', 12, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(13, '2022-01-10', 13, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(14, '2022-01-10', 14, 50, 4, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(15, '2022-01-10', 15, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(16, '2022-01-10', 16, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(17, '2022-01-10', 17, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(18, '2022-01-10', 18, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(19, '2022-01-10', 19, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(20, '2022-01-10', 20, 50, 5, 5, 0, 'iftekhar', '2022-01-10 10:36:04'),
(21, '2022-01-11', 1, 50, 5, 1, 0, 'iftekhar', '2022-01-11 12:31:28'),
(22, '2022-01-11', 2, 4, 5, 2, 0, 'iftekhar', '2022-01-11 12:31:28'),
(23, '2022-01-11', 3, 2, 3, 3, 0, 'iftekhar', '2022-01-11 12:31:28'),
(24, '2022-01-11', 4, 50, 5, 5, 0, 'iftekhar', '2022-01-11 12:31:28'),
(25, '2022-01-11', 5, 50, 22, 4, 0, 'iftekhar', '2022-01-11 12:31:28'),
(26, '2022-01-11', 6, 1, 4, 2, 0, 'iftekhar', '2022-01-11 12:31:28'),
(27, '2022-01-11', 7, 50, 5, 5, 0, 'iftekhar', '2022-01-11 12:31:28'),
(28, '2022-01-11', 8, 55, 55, 55, 0, 'iftekhar', '2022-01-11 12:31:28'),
(29, '2022-01-11', 9, 55, 55, 55444, 0, 'iftekhar', '2022-01-11 12:31:28'),
(30, '2022-01-11', 10, 777, 77, 7, 0, 'iftekhar', '2022-01-11 12:31:28'),
(31, '2022-01-11', 11, 6, 7, 6, 0, 'iftekhar', '2022-01-11 12:31:28'),
(32, '2022-01-11', 12, 7, 6, 7, 0, 'iftekhar', '2022-01-11 12:31:28'),
(33, '2022-01-11', 13, 7, 7, 7, 0, 'iftekhar', '2022-01-11 12:31:28'),
(34, '2022-01-11', 14, 7, 7, 7, 0, 'iftekhar', '2022-01-11 12:31:28'),
(35, '2022-01-11', 15, 7, 7, 7, 0, 'iftekhar', '2022-01-11 12:31:28'),
(36, '2022-01-11', 16, 7, 7, 7, 0, 'iftekhar', '2022-01-11 12:31:28'),
(37, '2022-01-11', 17, 7, 7, 7, 0, 'iftekhar', '2022-01-11 12:31:28'),
(38, '2022-01-11', 18, 7, 7, 7, 0, 'iftekhar', '2022-01-11 12:31:28'),
(39, '2022-01-11', 19, 7, 7, 7, 0, 'iftekhar', '2022-01-11 12:31:28'),
(40, '2022-01-11', 20, 7, 7, 7, 0, 'iftekhar', '2022-01-11 12:31:28');

-- --------------------------------------------------------

--
-- Table structure for table `line_wise_input_per_hour`
--

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
(1, 1, '2021-01-11', '1', 'color_3', 1, 900, 800, 1, 60, 60, '2022-01-10', 0, 'iftekhar', '2022-01-10 10:53:40'),
(2, 1, '2021-12-11', '1', 'color_3', 3, 609, 1400, 9, 60, 12, '2022-01-10', 0, 'iftekhar', '2022-01-10 10:55:04'),
(3, 3, '2021-12-11', '1', 'color_3', 14, 4, 50, 9, 59, 55, '2022-01-10', 0, 'iftekhar', '2022-01-10 12:25:52'),
(4, 1, '2021-01-11', '1', 'color_3', 1, 900, 800, 2, 55, 44, '2022-01-10', 0, 'iftekhar', '2022-01-10 14:29:16'),
(5, 1, '2021-01-11', '1', 'color_3', 1, 900, 800, 3, 100, 100, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:23:55'),
(6, 1, '2021-01-11', '1', 'color_3', 1, 900, 800, 4, 77, 77, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:24:02'),
(7, 1, '2021-01-11', '1', 'color_3', 1, 900, 800, 5, 50, 34, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:24:10'),
(8, 1, '2021-12-11', '1', 'color_3', 3, 609, 1400, 1, 60, 12, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:24:39'),
(9, 3, '2021-12-11', '1', 'color_3', 14, 4, 50, 2, 59, 55, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:24:39'),
(10, 1, '2021-12-11', '1', 'color_3', 3, 609, 1400, 8, 60, 12, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:38:33'),
(11, 3, '2021-12-11', '1', 'color_3', 14, 4, 50, 7, 59, 55, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:38:33'),
(12, 1, '2021-12-11', '1', 'color_3', 3, 609, 1400, 5, 60, 12, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:38:39'),
(13, 3, '2021-12-11', '1', 'color_3', 14, 4, 50, 4, 59, 55, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:38:39'),
(14, 1, '2021-12-11', '1', 'color_3', 3, 609, 1400, 2, 60, 100, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:52:48'),
(15, 1, '2021-12-11', '1', 'color_3', 3, 609, 1400, 3, 60, 100, '2022-01-10', 0, 'iftekhar', '2022-01-10 15:52:51'),
(16, 1, '2021-10-11', '1', 'color_3', 1, 2154, 2000, 1, 0, 50, '2022-01-11', 0, 'iftekhar', '2022-01-11 12:31:52'),
(17, 1, '2021-10-11', '1', 'color_3', 4, 2154, 2000, 4, 0, 100, '2022-01-11', 0, 'iftekhar', '2022-01-11 12:31:52'),
(18, 5, '2021-12-25', '1111111', 'color_5', 1, 500, 20, 1, 0, 10, '2022-01-11', 0, 'iftekhar', '2022-01-11 12:41:38'),
(19, 5, '2021-12-25', '1111111', 'color_5', 1, 500, 20, 2, 11, 5, '2022-01-11', 0, 'iftekhar', '2022-01-11 12:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

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
(18, 1, '1', 'color_3', '1000', '750', '5.5', '2021-01-11', 0, 'iftekhar', '2021-11-30 14:47:30'),
(19, 1, '1', 'color_3', '1000', '750', '5.5', '2021-10-11', 0, 'iftekhar', '2021-11-30 14:47:45'),
(20, 1, '1', 'color_3', '1000', '750', '5.5', '2021-12-11', 0, 'iftekhar', '2021-11-30 14:49:24'),
(21, 1, '1', 'color_3', '1000', '750', '5.5', '0000-00-00', 0, 'iftekhar', '2021-11-30 14:59:25'),
(22, 1, '1', 'color_3', '1000', '750', '5.5', '0000-00-00', 0, 'iftekhar', '2021-11-30 15:00:03'),
(23, 1, '1', 'color_3', '1000', '750', '5.5', '0000-00-00', 0, 'iftekhar', '2021-11-30 15:00:28'),
(24, 1, '1', 'color_3', '1000', '750', '5.5', '0000-00-00', 0, 'iftekhar', '2021-11-30 15:04:09'),
(25, 1, '1', 'color_3', '1000', '750', '5.5', '2021-11-13', 0, 'iftekhar', '2021-11-30 15:04:28'),
(26, 1, '1', 'color_3', '1000', '750', '5.5', '2021-12-07', 0, 'iftekhar', '2021-12-07 14:15:09'),
(27, 1, '2', 'color_3', '1000', '750', '5.5', '2021-12-07', 0, 'iftekhar', '2021-12-07 14:15:34'),
(28, 3, '1', 'color_3', '1000', '750', '5.5', '2021-12-07', 0, 'iftekhar', '2021-12-07 14:56:55'),
(30, 1, '1', 'color_3', '1000', '750', '5.5', '2021-12-09', 0, 'qc', '2021-12-09 15:34:04'),
(31, 3, '1', 'color_3', '1000', '750', '5.5', '2021-12-11', 0, 'qc', '2021-12-11 12:48:18'),
(32, 4, '1', 'color_3', '1000', '750', '5.5', '2021-12-11', 0, 'qc', '2021-12-11 12:48:21'),
(33, 3, '1', 'color_3', '1000', '750', '5.5', '2021-12-12', 0, 'qc', '2021-12-12 11:34:15'),
(34, 1, '1234', 'color_3', '1000', '800', '5', '2021-12-20', 0, 'qc', '2021-12-20 14:45:24'),
(35, 1, '1', 'color_5', '1000', '750', '5.5', '2021-12-21', 0, 'qc', '2021-12-21 12:58:58'),
(36, 5, '1111111', 'color_5', '500', '400', '12/23/2021', '2021-12-25', 0, 'iftekhar', '2021-12-22 09:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `plan_details`
--

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
(3, 1, '1', '1000', '2021-11-02', '2021-11-16', '2022-01-15', 1, 500, 0, 'iftekhar', '2022-01-13 14:49:15', '2021-12-11', '1', 'color_3'),
(4, 3, '4', '50', '2022-01-13', '2022-01-13', '2022-01-13', 1, 22, 0, 'iftekhar', '2022-01-13 15:07:01', '2021-12-12', '1', 'color_3');

-- --------------------------------------------------------

--
-- Table structure for table `production_details`
--

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
(1, 1, '1', 'color_3', '2022-01-08', 200, '1', 500, 0, 'qc', '2022-01-08 12:35:00', '2021-10-11'),
(2, 1, '1', 'color_3', '2022-01-08', 200, '2', 500, 0, 'qc', '2022-01-08 12:35:04', '2021-10-11'),
(3, 1, '1', 'color_3', '2022-01-08', 200, '6', 500, 0, 'qc', '2022-01-08 12:35:06', '2021-10-11'),
(4, 3, '1', 'color_3', '2022-01-08', 600, '1', 100, 0, 'qc', '2022-01-08 17:45:43', '2021-12-07'),
(5, 1, '1', 'color_3', '2022-01-09', 100, '1', 100, 0, 'qc', '2022-01-09 10:51:39', '2021-01-11'),
(6, 1, '1', 'color_3', '2022-01-09', 600, '2', 200, 0, 'qc', '2022-01-09 10:51:47', '2021-01-11'),
(7, 1, '1234', 'color_3', '2022-01-09', 550, '1', 500, 0, 'qc', '2022-01-09 10:52:32', '2021-12-20'),
(8, 1, '1', 'color_3', '2022-01-09', 177, '17', 100, 0, 'iftekhar', '2022-01-09 16:08:59', '2021-10-11'),
(9, 1, '1', 'color_3', '2022-01-09', 177, '15', 100, 0, 'iftekhar', '2022-01-09 16:09:02', '2021-10-11'),
(10, 1, '1', 'color_3', '2022-01-09', 55, '12', 500, 0, 'iftekhar', '2022-01-09 16:19:10', '2021-12-11'),
(11, 1, '1', 'color_3', '2022-01-09', 0, '20', 500, 0, 'iftekhar', '2022-01-09 16:19:17', '2021-12-11'),
(12, 1, '1', 'color_3', '2022-01-09', 4, '1', 400, 0, 'iftekhar', '2022-01-09 16:21:10', '2021-12-11'),
(13, 4, '1', 'color_3', '2022-01-09', 200, '7', 55, 0, 'iftekhar', '2022-01-09 16:47:13', '2021-12-11'),
(14, 1, '1', 'color_3', '2022-01-10', 200, '1', 500, 0, 'iftekhar', '2022-01-10 10:36:28', '2021-01-11'),
(15, 1, '1', 'color_3', '2022-01-10', 550, '3', 0, 0, 'iftekhar', '2022-01-10 10:54:41', '2021-12-11'),
(16, 3, '1', 'color_3', '2022-01-10', 4, '14', 50, 0, 'iftekhar', '2022-01-10 11:10:11', '2021-12-11'),
(17, 1, '1', 'color_3', '2022-01-11', 600, '1', 150, 0, 'iftekhar', '2022-01-11 12:26:30', '2021-10-11'),
(18, 1, '1', 'color_3', '2022-01-11', 600, '4', 150, 0, 'iftekhar', '2022-01-11 12:26:34', '2021-10-11'),
(19, 5, '1111111', 'color_5', '2022-01-11', 500, '1', 20, 0, 'iftekhar', '2022-01-11 12:41:10', '2021-12-25');

-- --------------------------------------------------------

--
-- Table structure for table `style_details`
--

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
(1, 'buyer_1', 'style_2', 5.8, 'Item1', 0, 'iftekhar', '2021-11-29 12:36:57'),
(2, 'e', 'e', 0, 'e', 0, '', '2021-12-01 13:10:02'),
(3, 'buyer_4', 'style_5', 15, 'Ladies Skirt', 0, 'iftekhar', '2021-12-07 14:24:26'),
(4, 'buyer_1', 'style_5', 5.8, 'Item1', 0, 'qc', '2021-12-11 09:39:52'),
(5, 'buyer_1', 'style_5', 5.8, 'Ladies Skirt', 0, 'qc', '2021-12-20 15:24:26'),
(6, 'buyer_1', 'style_5', 5.8, 'test', 0, 'qc', '2021-12-21 12:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `style_name`
--

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
(1, 'style_1', 'CAKD03153B', 'iftekhar', 'iftekhar', '2021-05-27 11:39:54'),
(2, 'style_2', 'F1GB020509', 'iftekhar', 'iftekhar', '2021-05-30 11:49:04'),
(3, 'style_3', '6M101910', 'iftekhar', 'iftekhar', '2021-05-30 16:55:52'),
(4, 'style_4', '330335', 'qc', 'qc', '2021-06-01 15:40:38'),
(5, 'style_5', '308036', 'iftekhar', 'iftekhar', '2021-12-07 14:23:52'),
(6, 'style_6', 'c AKD03153B', 'qc', 'qc', '2021-12-20 16:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `swing_production_info`
--

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

--
-- Dumping data for table `swing_production_info`
--

INSERT INTO `swing_production_info` (`id`, `buyer_id`, `style_name_id`, `color_id`, `recording_person_id`, `recording_person_name`, `recording_time`, `order_qty`, `smv`, `ship_date`) VALUES
(2, 'buyer_1', 'style_1', 'color_1', 'iftekhar', 'iftekhar', '2021-05-27', 0, 0, '2021-11-22'),
(3, 'buyer_1', 'style_1', 'color_2', 'iftekhar', 'iftekhar', '2021-05-27', 0, 0, '2021-11-22'),
(4, 'buyer_2', 'style_2', 'color_3', 'iftekhar', 'iftekhar', '2021-05-30', 0, 0, '2021-11-22'),
(5, 'buyer_3', 'style_3', 'color_4', 'iftekhar', 'iftekhar', '2021-05-30', 0, 0, '2021-11-22'),
(6, 'buyer_4', 'style_4', 'color_5', 'qc', 'qc', '2021-06-01', 0, 0, '2021-11-22'),
(7, 'buyer_1', 'style_4', 'color_3', 'qc', 'qc', '2021-11-22', 1000, 6, '2021-01-11'),
(8, 'buyer_4', 'style_4', 'color_3', 'qc', 'qc', '2021-11-22', 1000, 6, '2021-01-11'),
(9, 'buyer_1', 'style_4', 'color_3', 'qc', 'qc', '2021-11-22', 1000, 6, '2021-01-11'),
(10, 'buyer_1', 'style_4', 'color_3', 'qc', 'qc', '2021-11-22', 1000, 6, '2021-01-11'),
(11, 'buyer_1', 'style_4', 'color_3', 'qc', 'qc', '2021-11-22', 1000, 6, '2021-01-11'),
(12, 'buyer_1', 'style_4', 'color_3', 'qc', 'qc', '2021-11-22', 1000, 6, '2021-01-11'),
(13, 'buyer_3', 'style_2', 'color_2', 'qc', 'qc', '2021-11-22', 100000, 2, '2021-03-11'),
(14, 'buyer_1', 'style_4', 'color_3', 'qc', 'qc', '2021-11-23', 1000, 2, '2021-01-11'),
(15, '', '', '', 'iftekhar', 'iftekhar', '2021-11-30', 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `swing_production_per_hour`
--

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

--
-- Dumping data for table `swing_production_per_hour`
--

INSERT INTO `swing_production_per_hour` (`id`, `swing_production_info_id`, `production_date`, `line_id`, `hour`, `garments`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(8, 2, '2021-05-29', 5, '01', '65', 'iftekhar', 'iftekhar', '0000-00-00 00:00:00'),
(9, 2, '2021-05-29', 5, '02', '90', 'iftekhar', 'iftekhar', '2021-05-29 00:00:00'),
(10, 2, '2021-05-29', 5, '03', '105', 'iftekhar', 'iftekhar', '2021-05-29 00:00:00'),
(11, 2, '2021-05-29', 5, '04', '100', 'iftekhar', 'iftekhar', '2021-05-29 00:00:00'),
(13, 4, '2021-05-29', 2, '01', '60', 'iftekhar', 'iftekhar', '2021-05-30 11:50:59'),
(15, 4, '2021-05-29', 2, '02', '70', 'iftekhar', 'iftekhar', '2021-05-30 16:01:02'),
(16, 4, '2021-05-29', 2, '03', '80', 'iftekhar', 'iftekhar', '2021-05-30 16:02:37'),
(17, 5, '2021-05-29', 7, '01', '80', 'iftekhar', 'iftekhar', '2021-05-30 16:57:21'),
(18, 5, '2021-05-29', 7, '02', '90', 'iftekhar', 'iftekhar', '2021-05-30 16:57:52'),
(19, 5, '2021-05-29', 7, '03', '75', 'iftekhar', 'iftekhar', '2021-05-31 11:32:51'),
(20, 5, '2021-05-29', 7, '04', '80', 'iftekhar', 'iftekhar', '2021-05-31 11:33:17'),
(21, 6, '2021-06-01', 11, '01', '140', 'qc', 'qc', '2021-06-01 15:47:07'),
(22, 6, '2021-06-01', 11, '02', '145', 'qc', 'qc', '2021-06-01 15:50:33');

-- --------------------------------------------------------

--
-- Table structure for table `swing_production_planning`
--

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
  `recording_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `swing_production_planning`
--

INSERT INTO `swing_production_planning` (`id`, `order_details_id`, `color`, `po`, `ship_date`, `layout_start_time`, `layout_end_time`, `total_time`, `first_output_date`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(2, 1, 'color_3', '1', '2021-10-11', '2021-12-30 15:32:00', '2022-01-02 15:32:00', '1 Day 0 Hour', '2022-01-13', 0, 'iftekhar', '2022-01-13 15:32:16'),
(3, 1, 'color_3', '1', '2021-12-11', '2021-12-30 15:32:00', '2022-02-16 13:28:00', '1 Day 0 Hour', '2022-01-13', 0, 'iftekhar', '2022-01-13 15:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `target_output_set_per_line`
--

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
(36, 'Data Entry OP', 'Mr. Haris', '090', '1234', '1234', 'Sub_User', 'Active', 'jiash09@live.com', '0', 'Marketing', 'Assistant Officer', 'default.png', 'qc', 'qc', '2021-03-10 17:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

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
(90, '090', 'Data Entry OP', 'Mr. Haris', '', '', '', '1234', 'jiash09@live.com', '0', 'Marketing', 'Assistant Officer', 'Sub_User', 'Active', 'default.png', 'qc', 'qc', '2021-03-10 17:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_old`
--

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

CREATE TABLE `version_name` (
  `row_id` int(10) NOT NULL,
  `version_id` varchar(15) NOT NULL,
  `version_name` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `version_name`
--

INSERT INTO `version_name` (`row_id`, `version_id`, `version_name`, `recording_person_id`, `recording_person_name`, `recording_time`) VALUES
(1, 'versionnum_1', 'QC', 'qc', 'qc', '2021-03-08 12:49:59'),
(10, 'versionnum_10', 'Bed Sheet Reverse', 'qc', 'qc', '2021-03-08 20:02:04'),
(11, 'versionnum_11', 'Bed Sheet Solid Piping', 'qc', 'qc', '2021-03-08 20:02:44'),
(12, 'versionnum_12', 'BED SHEET', 'qc', 'qc', '2021-03-08 21:02:43'),
(13, 'versionnum_13', 'A', 'qc', 'qc', '2021-03-08 21:09:02'),
(14, 'versionnum_14', 'B', 'qc', 'qc', '2021-03-08 21:09:12'),
(15, 'versionnum_15', 'C', 'qc', 'qc', '2021-03-08 21:09:39'),
(16, 'versionnum_16', 'Lamb Med Star AOP', 'qc', 'qc', '2021-03-09 20:14:17'),
(17, 'versionnum_17', 'Lamb Melange Stripe', 'qc', 'qc', '2021-03-09 20:13:06'),
(18, 'versionnum_18', 'Grey Melange', 'qc', 'qc', '2021-03-09 20:14:38'),
(19, 'versionnum_19', 'Navy Melange', 'qc', 'qc', '2021-03-09 20:14:48'),
(2, 'versionnum_2', 'QC- Front', 'qc', 'qc', '2021-03-08 12:50:21'),
(20, 'versionnum_20', 'New bunny love floral', 'qc', 'qc', '2021-03-09 20:15:02'),
(21, 'versionnum_21', 'Paisley 2', 'qc', 'qc', '2021-03-09 20:22:34'),
(22, 'versionnum_22', 'Turkish', 'qc', 'qc', '2021-03-09 20:22:44'),
(23, 'versionnum_23', 'JB Wild Floral', 'qc', 'qc', '2021-03-09 20:23:02'),
(24, 'versionnum_24', 'Garden', 'qc', 'qc', '2021-03-09 20:23:16'),
(25, 'versionnum_25', 'LM Islamic Art', 'qc', 'qc', '2021-03-09 20:23:46'),
(26, 'versionnum_26', 'Roxy', 'qc', 'qc', '2021-03-09 20:23:55'),
(27, 'versionnum_27', 'Alpha Friends Star', 'qc', 'qc', '2021-03-09 20:25:22'),
(28, 'versionnum_28', 'Alpha Friends AOP', 'qc', 'qc', '2021-03-09 20:25:31'),
(29, 'versionnum_29', 'Alpha Friends Stripe', 'qc', 'qc', '2021-03-09 20:25:43'),
(3, 'versionnum_3', 'QC- Reverse', 'qc', 'qc', '2021-03-08 12:50:50'),
(30, 'versionnum_30', 'Alpha Teddy AOP ', 'qc', 'qc', '2021-03-09 20:26:13'),
(31, 'versionnum_31', 'Alpha Friends Conctellaction', 'qc', 'qc', '2021-03-09 20:28:00'),
(32, 'versionnum_32', 'Lamb Lt. Sheep AOP', 'qc', 'qc', '2021-03-09 20:29:42'),
(33, 'versionnum_33', 'Lamb Triangle AOP', 'qc', 'qc', '2021-03-09 20:29:56'),
(34, 'versionnum_34', 'Bleached None (Reverse)', 'qc', 'qc', '2021-03-09 21:32:57'),
(35, 'versionnum_35', 'RFD/Non Optical pigment (Front)', 'qc', 'qc', '2021-03-09 21:43:41'),
(36, 'versionnum_36', 'Front & Reverse', 'qc', 'qc', '2021-03-13 14:44:18'),
(37, 'versionnum_37', 'Crib Sheet', 'qc', 'qc', '2021-03-16 12:50:26'),
(38, 'versionnum_38', 'Front', 'qc', 'qc', '2021-03-17 12:00:48'),
(39, 'versionnum_39', 'Reverse', 'qc', 'qc', '2021-03-17 12:00:53'),
(4, 'versionnum_4', 'PWC', 'qc', 'qc', '2021-03-08 12:51:02'),
(40, 'versionnum_40', 'Quilt Cover', 'qc', 'qc', '2021-03-22 12:10:17'),
(41, 'versionnum_41', 'Solid', 'qc', 'qc', '2021-03-29 15:20:19'),
(42, 'versionnum_42', 'Front & Pwc', 'qc', 'qc', '2021-04-06 12:25:27'),
(43, 'versionnum_43', 'PANNEL PILLOW', 'qc', 'qc', '2021-04-06 12:48:56'),
(44, 'versionnum_44', 'TEA TOWEL', 'qc', 'qc', '2021-05-07 11:30:56'),
(45, 'versionnum_45', 'YARN DYED', 'qc', 'qc', '2021-05-10 12:39:20'),
(5, 'versionnum_5', 'Piping', 'qc', 'qc', '2021-03-08 12:51:18'),
(6, 'versionnum_6', 'Curtain', 'qc', 'qc', '2021-03-08 12:51:29'),
(7, 'versionnum_7', 'Cushion Cover', 'qc', 'qc', '2021-03-08 19:23:13'),
(8, 'versionnum_8', 'Blanket', 'qc', 'qc', '2021-03-08 19:23:21'),
(9, 'versionnum_9', 'Bed Sheet Front', 'qc', 'qc', '2021-03-08 20:01:57');

-- --------------------------------------------------------

--
-- Stand-in structure for view `wip_view`
-- (See below for the actual view)
--
CREATE TABLE `wip_view` (
`order_details_id` int(11)
,`ship_date` date
,`color` varchar(50)
,`po` varchar(50)
,`WIP` decimal(33,0)
);

-- --------------------------------------------------------

--
-- Structure for view `buyer_input_orderdetails`
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `line_info`
--
ALTER TABLE `line_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `line_man_power_details`
--
ALTER TABLE `line_man_power_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `line_wise_input_per_hour`
--
ALTER TABLE `line_wise_input_per_hour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `line_wise_output_per_hour`
--
ALTER TABLE `line_wise_output_per_hour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `plan_details`
--
ALTER TABLE `plan_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `production_details`
--
ALTER TABLE `production_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `style_details`
--
ALTER TABLE `style_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `swing_production_per_hour`
--
ALTER TABLE `swing_production_per_hour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `swing_production_planning`
--
ALTER TABLE `swing_production_planning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `initial_plan_by_ie`
--
ALTER TABLE `initial_plan_by_ie`
  ADD CONSTRAINT `initial_plan_id` FOREIGN KEY (`swing_production_info_id`) REFERENCES `swing_production_info` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
