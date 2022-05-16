/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : processing

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-04-21 11:54:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buyer`
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `row_id` int(10) NOT NULL,
  `buyer_id` varchar(10) NOT NULL,
  `buyer_name` varchar(100) DEFAULT NULL,
  `buyer_address` varchar(250) DEFAULT NULL,
  `country_of_origin` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  PRIMARY KEY (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('1', 'buyer_1', 'HEMA', '', '', 'iftekhar', 'iftekhar', '2022-02-12 16:44:16');
INSERT INTO `buyer` VALUES ('2', 'buyer_2', 'Terranova', '', '', 'qc', 'qc', '2022-03-08 17:21:23');
INSERT INTO `buyer` VALUES ('3', 'buyer_3', 'Miles', '', '', 'qc', 'qc', '2022-03-08 17:21:37');
INSERT INTO `buyer` VALUES ('4', 'buyer_4', 'Rich Cotton', '', '', 'qc', 'qc', '2022-03-08 17:21:53');

-- ----------------------------
-- Table structure for `color`
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `row_id` int(10) NOT NULL,
  `color_id` varchar(15) NOT NULL,
  `color_name` varchar(50) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES ('1', 'color_1', 'Denim', 'iftekhar', 'iftekhar', '2022-02-12 16:44:36');
INSERT INTO `color` VALUES ('10', 'color_10', 'VAR SALVIA', 'qc', 'qc', '2022-03-08 17:25:06');
INSERT INTO `color` VALUES ('11', 'color_11', 'Model-1', 'qc', 'qc', '2022-03-08 17:28:24');
INSERT INTO `color` VALUES ('12', 'color_12', 'Model-2', 'qc', 'qc', '2022-03-08 17:28:29');
INSERT INTO `color` VALUES ('13', 'color_13', 'BIANCO', 'qc', 'qc', '2022-03-08 17:28:41');
INSERT INTO `color` VALUES ('14', 'color_14', 'CELESTE', 'qc', 'qc', '2022-03-08 17:28:53');
INSERT INTO `color` VALUES ('15', 'color_15', 'LILLA', 'qc', 'qc', '2022-03-08 17:29:03');
INSERT INTO `color` VALUES ('16', 'color_16', 'MARRONE SCURO', 'qc', 'qc', '2022-03-08 17:29:12');
INSERT INTO `color` VALUES ('17', 'color_17', 'BLU DENIM MEDIO', 'qc', 'qc', '2022-03-08 17:29:41');
INSERT INTO `color` VALUES ('18', 'color_18', 'BLU DENIM SCURO', 'qc', 'qc', '2022-03-08 17:48:33');
INSERT INTO `color` VALUES ('2', 'color_2', 'ANTRACITE', 'qc', 'qc', '2022-03-08 17:23:09');
INSERT INTO `color` VALUES ('3', 'color_3', 'SALVIA', 'qc', 'qc', '2022-03-08 17:23:36');
INSERT INTO `color` VALUES ('4', 'color_4', 'NERO', 'qc', 'qc', '2022-03-08 17:23:50');
INSERT INTO `color` VALUES ('5', 'color_5', 'GREY MELANGE', 'qc', 'qc', '2022-03-08 17:24:06');
INSERT INTO `color` VALUES ('6', 'color_6', 'COSMIC SKY', 'qc', 'qc', '2022-03-08 17:24:16');
INSERT INTO `color` VALUES ('7', 'color_7', 'WHITE', 'qc', 'qc', '2022-03-08 17:24:27');
INSERT INTO `color` VALUES ('8', 'color_8', 'VAR CANNA DI FUCILE', 'qc', 'qc', '2022-03-08 17:24:47');
INSERT INTO `color` VALUES ('9', 'color_9', 'VAR NERO', 'qc', 'qc', '2022-03-08 17:24:57');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name_of_country` varchar(80) NOT NULL,
  `short_code` char(3) DEFAULT NULL,
  `number_code` smallint(6) DEFAULT NULL,
  `phone_code` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', 'AF', 'Afghanistan', 'AFG', '4', '93');
INSERT INTO `country` VALUES ('2', 'AL', 'Albania', 'ALB', '8', '355');
INSERT INTO `country` VALUES ('3', 'DZ', 'Algeria', 'DZA', '12', '213');
INSERT INTO `country` VALUES ('4', 'AS', 'American Samoa', 'ASM', '16', '1684');
INSERT INTO `country` VALUES ('5', 'AD', 'Andorra', 'AND', '20', '376');
INSERT INTO `country` VALUES ('6', 'AO', 'Angola', 'AGO', '24', '244');
INSERT INTO `country` VALUES ('7', 'AI', 'Anguilla', 'AIA', '660', '1264');
INSERT INTO `country` VALUES ('8', 'AQ', 'Antarctica', null, null, '0');
INSERT INTO `country` VALUES ('9', 'AG', 'Antigua and Barbuda', 'ATG', '28', '1268');
INSERT INTO `country` VALUES ('10', 'AR', 'Argentina', 'ARG', '32', '54');
INSERT INTO `country` VALUES ('11', 'AM', 'Armenia', 'ARM', '51', '374');
INSERT INTO `country` VALUES ('12', 'AW', 'Aruba', 'ABW', '533', '297');
INSERT INTO `country` VALUES ('13', 'AU', 'Australia', 'AUS', '36', '61');
INSERT INTO `country` VALUES ('14', 'AT', 'Austria', 'AUT', '40', '43');
INSERT INTO `country` VALUES ('15', 'AZ', 'Azerbaijan', 'AZE', '31', '994');
INSERT INTO `country` VALUES ('16', 'BS', 'Bahamas', 'BHS', '44', '1242');
INSERT INTO `country` VALUES ('17', 'BH', 'Bahrain', 'BHR', '48', '973');
INSERT INTO `country` VALUES ('18', 'BD', 'Bangladesh', 'BGD', '50', '880');
INSERT INTO `country` VALUES ('19', 'BB', 'Barbados', 'BRB', '52', '1246');
INSERT INTO `country` VALUES ('20', 'BY', 'Belarus', 'BLR', '112', '375');
INSERT INTO `country` VALUES ('21', 'BE', 'Belgium', 'BEL', '56', '32');
INSERT INTO `country` VALUES ('22', 'BZ', 'Belize', 'BLZ', '84', '501');
INSERT INTO `country` VALUES ('23', 'BJ', 'Benin', 'BEN', '204', '229');
INSERT INTO `country` VALUES ('24', 'BM', 'Bermuda', 'BMU', '60', '1441');
INSERT INTO `country` VALUES ('25', 'BT', 'Bhutan', 'BTN', '64', '975');
INSERT INTO `country` VALUES ('26', 'BO', 'Bolivia', 'BOL', '68', '591');
INSERT INTO `country` VALUES ('27', 'BA', 'Bosnia and Herzegovina', 'BIH', '70', '387');
INSERT INTO `country` VALUES ('28', 'BW', 'Botswana', 'BWA', '72', '267');
INSERT INTO `country` VALUES ('29', 'BV', 'Bouvet Island', null, null, '0');
INSERT INTO `country` VALUES ('30', 'BR', 'Brazil', 'BRA', '76', '55');
INSERT INTO `country` VALUES ('31', 'IO', 'British Indian Ocean Territory', null, null, '246');
INSERT INTO `country` VALUES ('32', 'BN', 'Brunei Darussalam', 'BRN', '96', '673');
INSERT INTO `country` VALUES ('33', 'BG', 'Bulgaria', 'BGR', '100', '359');
INSERT INTO `country` VALUES ('34', 'BF', 'Burkina Faso', 'BFA', '854', '226');
INSERT INTO `country` VALUES ('35', 'BI', 'Burundi', 'BDI', '108', '257');
INSERT INTO `country` VALUES ('36', 'KH', 'Cambodia', 'KHM', '116', '855');
INSERT INTO `country` VALUES ('37', 'CM', 'Cameroon', 'CMR', '120', '237');
INSERT INTO `country` VALUES ('38', 'CA', 'Canada', 'CAN', '124', '1');
INSERT INTO `country` VALUES ('39', 'CV', 'Cape Verde', 'CPV', '132', '238');
INSERT INTO `country` VALUES ('40', 'KY', 'Cayman Islands', 'CYM', '136', '1345');
INSERT INTO `country` VALUES ('41', 'CF', 'Central African Republic', 'CAF', '140', '236');
INSERT INTO `country` VALUES ('42', 'TD', 'Chad', 'TCD', '148', '235');
INSERT INTO `country` VALUES ('43', 'CL', 'Chile', 'CHL', '152', '56');
INSERT INTO `country` VALUES ('44', 'CN', 'China', 'CHN', '156', '86');
INSERT INTO `country` VALUES ('45', 'CX', 'Christmas Island', null, null, '61');
INSERT INTO `country` VALUES ('46', 'CC', 'Cocos (Keeling) Islands', null, null, '672');
INSERT INTO `country` VALUES ('47', 'CO', 'Colombia', 'COL', '170', '57');
INSERT INTO `country` VALUES ('48', 'KM', 'Comoros', 'COM', '174', '269');
INSERT INTO `country` VALUES ('49', 'CG', 'Congo', 'COG', '178', '242');
INSERT INTO `country` VALUES ('50', 'CD', 'Congo, the Democratic Republic of the', 'COD', '180', '242');
INSERT INTO `country` VALUES ('51', 'CK', 'Cook Islands', 'COK', '184', '682');
INSERT INTO `country` VALUES ('52', 'CR', 'Costa Rica', 'CRI', '188', '506');
INSERT INTO `country` VALUES ('53', 'CI', 'Cote D\'Ivoire', 'CIV', '384', '225');
INSERT INTO `country` VALUES ('54', 'HR', 'Croatia', 'HRV', '191', '385');
INSERT INTO `country` VALUES ('55', 'CU', 'Cuba', 'CUB', '192', '53');
INSERT INTO `country` VALUES ('56', 'CY', 'Cyprus', 'CYP', '196', '357');
INSERT INTO `country` VALUES ('57', 'CZ', 'Czech Republic', 'CZE', '203', '420');
INSERT INTO `country` VALUES ('58', 'DK', 'Denmark', 'DNK', '208', '45');
INSERT INTO `country` VALUES ('59', 'DJ', 'Djibouti', 'DJI', '262', '253');
INSERT INTO `country` VALUES ('60', 'DM', 'Dominica', 'DMA', '212', '1767');
INSERT INTO `country` VALUES ('61', 'DO', 'Dominican Republic', 'DOM', '214', '1809');
INSERT INTO `country` VALUES ('62', 'EC', 'Ecuador', 'ECU', '218', '593');
INSERT INTO `country` VALUES ('63', 'EG', 'Egypt', 'EGY', '818', '20');
INSERT INTO `country` VALUES ('64', 'SV', 'El Salvador', 'SLV', '222', '503');
INSERT INTO `country` VALUES ('65', 'GQ', 'Equatorial Guinea', 'GNQ', '226', '240');
INSERT INTO `country` VALUES ('66', 'ER', 'Eritrea', 'ERI', '232', '291');
INSERT INTO `country` VALUES ('67', 'EE', 'Estonia', 'EST', '233', '372');
INSERT INTO `country` VALUES ('68', 'ET', 'Ethiopia', 'ETH', '231', '251');
INSERT INTO `country` VALUES ('69', 'FK', 'Falkland Islands (Malvinas)', 'FLK', '238', '500');
INSERT INTO `country` VALUES ('70', 'FO', 'Faroe Islands', 'FRO', '234', '298');
INSERT INTO `country` VALUES ('71', 'FJ', 'Fiji', 'FJI', '242', '679');
INSERT INTO `country` VALUES ('72', 'FI', 'Finland', 'FIN', '246', '358');
INSERT INTO `country` VALUES ('73', 'FR', 'France', 'FRA', '250', '33');
INSERT INTO `country` VALUES ('74', 'GF', 'French Guiana', 'GUF', '254', '594');
INSERT INTO `country` VALUES ('75', 'PF', 'French Polynesia', 'PYF', '258', '689');
INSERT INTO `country` VALUES ('76', 'TF', 'French Southern Territories', null, null, '0');
INSERT INTO `country` VALUES ('77', 'GA', 'Gabon', 'GAB', '266', '241');
INSERT INTO `country` VALUES ('78', 'GM', 'Gambia', 'GMB', '270', '220');
INSERT INTO `country` VALUES ('79', 'GE', 'Georgia', 'GEO', '268', '995');
INSERT INTO `country` VALUES ('80', 'DE', 'Germany', 'DEU', '276', '49');
INSERT INTO `country` VALUES ('81', 'GH', 'Ghana', 'GHA', '288', '233');
INSERT INTO `country` VALUES ('82', 'GI', 'Gibraltar', 'GIB', '292', '350');
INSERT INTO `country` VALUES ('83', 'GR', 'Greece', 'GRC', '300', '30');
INSERT INTO `country` VALUES ('84', 'GL', 'Greenland', 'GRL', '304', '299');
INSERT INTO `country` VALUES ('85', 'GD', 'Grenada', 'GRD', '308', '1473');
INSERT INTO `country` VALUES ('86', 'GP', 'Guadeloupe', 'GLP', '312', '590');
INSERT INTO `country` VALUES ('87', 'GU', 'Guam', 'GUM', '316', '1671');
INSERT INTO `country` VALUES ('88', 'GT', 'Guatemala', 'GTM', '320', '502');
INSERT INTO `country` VALUES ('89', 'GN', 'Guinea', 'GIN', '324', '224');
INSERT INTO `country` VALUES ('90', 'GW', 'Guinea-Bissau', 'GNB', '624', '245');
INSERT INTO `country` VALUES ('91', 'GY', 'Guyana', 'GUY', '328', '592');
INSERT INTO `country` VALUES ('92', 'HT', 'Haiti', 'HTI', '332', '509');
INSERT INTO `country` VALUES ('93', 'HM', 'Heard Island and Mcdonald Islands', null, null, '0');
INSERT INTO `country` VALUES ('94', 'VA', 'Holy See (Vatican City State)', 'VAT', '336', '39');
INSERT INTO `country` VALUES ('95', 'HN', 'Honduras', 'HND', '340', '504');
INSERT INTO `country` VALUES ('96', 'HK', 'Hong Kong', 'HKG', '344', '852');
INSERT INTO `country` VALUES ('97', 'HU', 'Hungary', 'HUN', '348', '36');
INSERT INTO `country` VALUES ('98', 'IS', 'Iceland', 'ISL', '352', '354');
INSERT INTO `country` VALUES ('99', 'IN', 'India', 'IND', '356', '91');
INSERT INTO `country` VALUES ('100', 'ID', 'Indonesia', 'IDN', '360', '62');
INSERT INTO `country` VALUES ('101', 'IR', 'Iran, Islamic Republic of', 'IRN', '364', '98');
INSERT INTO `country` VALUES ('102', 'IQ', 'Iraq', 'IRQ', '368', '964');
INSERT INTO `country` VALUES ('103', 'IE', 'Ireland', 'IRL', '372', '353');
INSERT INTO `country` VALUES ('104', 'IL', 'Israel', 'ISR', '376', '972');
INSERT INTO `country` VALUES ('105', 'IT', 'Italy', 'ITA', '380', '39');
INSERT INTO `country` VALUES ('106', 'JM', 'Jamaica', 'JAM', '388', '1876');
INSERT INTO `country` VALUES ('107', 'JP', 'Japan', 'JPN', '392', '81');
INSERT INTO `country` VALUES ('108', 'JO', 'Jordan', 'JOR', '400', '962');
INSERT INTO `country` VALUES ('109', 'KZ', 'Kazakhstan', 'KAZ', '398', '7');
INSERT INTO `country` VALUES ('110', 'KE', 'Kenya', 'KEN', '404', '254');
INSERT INTO `country` VALUES ('111', 'KI', 'Kiribati', 'KIR', '296', '686');
INSERT INTO `country` VALUES ('112', 'KP', 'Korea, Democratic People\'s Republic of', 'PRK', '408', '850');
INSERT INTO `country` VALUES ('113', 'KR', 'Korea, Republic of', 'KOR', '410', '82');
INSERT INTO `country` VALUES ('114', 'KW', 'Kuwait', 'KWT', '414', '965');
INSERT INTO `country` VALUES ('115', 'KG', 'Kyrgyzstan', 'KGZ', '417', '996');
INSERT INTO `country` VALUES ('116', 'LA', 'Lao People\'s Democratic Republic', 'LAO', '418', '856');
INSERT INTO `country` VALUES ('117', 'LV', 'Latvia', 'LVA', '428', '371');
INSERT INTO `country` VALUES ('118', 'LB', 'Lebanon', 'LBN', '422', '961');
INSERT INTO `country` VALUES ('119', 'LS', 'Lesotho', 'LSO', '426', '266');
INSERT INTO `country` VALUES ('120', 'LR', 'Liberia', 'LBR', '430', '231');
INSERT INTO `country` VALUES ('121', 'LY', 'Libyan Arab Jamahiriya', 'LBY', '434', '218');
INSERT INTO `country` VALUES ('122', 'LI', 'Liechtenstein', 'LIE', '438', '423');
INSERT INTO `country` VALUES ('123', 'LT', 'Lithuania', 'LTU', '440', '370');
INSERT INTO `country` VALUES ('124', 'LU', 'Luxembourg', 'LUX', '442', '352');
INSERT INTO `country` VALUES ('125', 'MO', 'Macao', 'MAC', '446', '853');
INSERT INTO `country` VALUES ('126', 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', '807', '389');
INSERT INTO `country` VALUES ('127', 'MG', 'Madagascar', 'MDG', '450', '261');
INSERT INTO `country` VALUES ('128', 'MW', 'Malawi', 'MWI', '454', '265');
INSERT INTO `country` VALUES ('129', 'MY', 'Malaysia', 'MYS', '458', '60');
INSERT INTO `country` VALUES ('130', 'MV', 'Maldives', 'MDV', '462', '960');
INSERT INTO `country` VALUES ('131', 'ML', 'Mali', 'MLI', '466', '223');
INSERT INTO `country` VALUES ('132', 'MT', 'Malta', 'MLT', '470', '356');
INSERT INTO `country` VALUES ('133', 'MH', 'Marshall Islands', 'MHL', '584', '692');
INSERT INTO `country` VALUES ('134', 'MQ', 'Martinique', 'MTQ', '474', '596');
INSERT INTO `country` VALUES ('135', 'MR', 'Mauritania', 'MRT', '478', '222');
INSERT INTO `country` VALUES ('136', 'MU', 'Mauritius', 'MUS', '480', '230');
INSERT INTO `country` VALUES ('137', 'YT', 'Mayotte', null, null, '269');
INSERT INTO `country` VALUES ('138', 'MX', 'Mexico', 'MEX', '484', '52');
INSERT INTO `country` VALUES ('139', 'FM', 'Micronesia, Federated States of', 'FSM', '583', '691');
INSERT INTO `country` VALUES ('140', 'MD', 'Moldova, Republic of', 'MDA', '498', '373');
INSERT INTO `country` VALUES ('141', 'MC', 'Monaco', 'MCO', '492', '377');
INSERT INTO `country` VALUES ('142', 'MN', 'Mongolia', 'MNG', '496', '976');
INSERT INTO `country` VALUES ('143', 'MS', 'Montserrat', 'MSR', '500', '1664');
INSERT INTO `country` VALUES ('144', 'MA', 'Morocco', 'MAR', '504', '212');
INSERT INTO `country` VALUES ('145', 'MZ', 'Mozambique', 'MOZ', '508', '258');
INSERT INTO `country` VALUES ('146', 'MM', 'Myanmar', 'MMR', '104', '95');
INSERT INTO `country` VALUES ('147', 'NA', 'Namibia', 'NAM', '516', '264');
INSERT INTO `country` VALUES ('148', 'NR', 'Nauru', 'NRU', '520', '674');
INSERT INTO `country` VALUES ('149', 'NP', 'Nepal', 'NPL', '524', '977');
INSERT INTO `country` VALUES ('150', 'NL', 'Netherlands', 'NLD', '528', '31');
INSERT INTO `country` VALUES ('151', 'AN', 'Netherlands Antilles', 'ANT', '530', '599');
INSERT INTO `country` VALUES ('152', 'NC', 'New Caledonia', 'NCL', '540', '687');
INSERT INTO `country` VALUES ('153', 'NZ', 'New Zealand', 'NZL', '554', '64');
INSERT INTO `country` VALUES ('154', 'NI', 'Nicaragua', 'NIC', '558', '505');
INSERT INTO `country` VALUES ('155', 'NE', 'Niger', 'NER', '562', '227');
INSERT INTO `country` VALUES ('156', 'NG', 'Nigeria', 'NGA', '566', '234');
INSERT INTO `country` VALUES ('157', 'NU', 'Niue', 'NIU', '570', '683');
INSERT INTO `country` VALUES ('158', 'NF', 'Norfolk Island', 'NFK', '574', '672');
INSERT INTO `country` VALUES ('159', 'MP', 'Northern Mariana Islands', 'MNP', '580', '1670');
INSERT INTO `country` VALUES ('160', 'NO', 'Norway', 'NOR', '578', '47');
INSERT INTO `country` VALUES ('161', 'OM', 'Oman', 'OMN', '512', '968');
INSERT INTO `country` VALUES ('162', 'PK', 'Pakistan', 'PAK', '586', '92');
INSERT INTO `country` VALUES ('163', 'PW', 'Palau', 'PLW', '585', '680');
INSERT INTO `country` VALUES ('164', 'PS', 'Palestinian Territory, Occupied', null, null, '970');
INSERT INTO `country` VALUES ('165', 'PA', 'Panama', 'PAN', '591', '507');
INSERT INTO `country` VALUES ('166', 'PG', 'Papua New Guinea', 'PNG', '598', '675');
INSERT INTO `country` VALUES ('167', 'PY', 'Paraguay', 'PRY', '600', '595');
INSERT INTO `country` VALUES ('168', 'PE', 'Peru', 'PER', '604', '51');
INSERT INTO `country` VALUES ('169', 'PH', 'Philippines', 'PHL', '608', '63');
INSERT INTO `country` VALUES ('170', 'PN', 'Pitcairn', 'PCN', '612', '0');
INSERT INTO `country` VALUES ('171', 'PL', 'Poland', 'POL', '616', '48');
INSERT INTO `country` VALUES ('172', 'PT', 'Portugal', 'PRT', '620', '351');
INSERT INTO `country` VALUES ('173', 'PR', 'Puerto Rico', 'PRI', '630', '1787');
INSERT INTO `country` VALUES ('174', 'QA', 'Qatar', 'QAT', '634', '974');
INSERT INTO `country` VALUES ('175', 'RE', 'Reunion', 'REU', '638', '262');
INSERT INTO `country` VALUES ('176', 'RO', 'Romania', 'ROM', '642', '40');
INSERT INTO `country` VALUES ('177', 'RU', 'Russian Federation', 'RUS', '643', '70');
INSERT INTO `country` VALUES ('178', 'RW', 'Rwanda', 'RWA', '646', '250');
INSERT INTO `country` VALUES ('179', 'SH', 'Saint Helena', 'SHN', '654', '290');
INSERT INTO `country` VALUES ('180', 'KN', 'Saint Kitts and Nevis', 'KNA', '659', '1869');
INSERT INTO `country` VALUES ('181', 'LC', 'Saint Lucia', 'LCA', '662', '1758');
INSERT INTO `country` VALUES ('182', 'PM', 'Saint Pierre and Miquelon', 'SPM', '666', '508');
INSERT INTO `country` VALUES ('183', 'VC', 'Saint Vincent and the Grenadines', 'VCT', '670', '1784');
INSERT INTO `country` VALUES ('184', 'WS', 'Samoa', 'WSM', '882', '684');
INSERT INTO `country` VALUES ('185', 'SM', 'San Marino', 'SMR', '674', '378');
INSERT INTO `country` VALUES ('186', 'ST', 'Sao Tome and Principe', 'STP', '678', '239');
INSERT INTO `country` VALUES ('187', 'SA', 'Saudi Arabia', 'SAU', '682', '966');
INSERT INTO `country` VALUES ('188', 'SN', 'Senegal', 'SEN', '686', '221');
INSERT INTO `country` VALUES ('189', 'CS', 'Serbia and Montenegro', null, null, '381');
INSERT INTO `country` VALUES ('190', 'SC', 'Seychelles', 'SYC', '690', '248');
INSERT INTO `country` VALUES ('191', 'SL', 'Sierra Leone', 'SLE', '694', '232');
INSERT INTO `country` VALUES ('192', 'SG', 'Singapore', 'SGP', '702', '65');
INSERT INTO `country` VALUES ('193', 'SK', 'Slovakia', 'SVK', '703', '421');
INSERT INTO `country` VALUES ('194', 'SI', 'Slovenia', 'SVN', '705', '386');
INSERT INTO `country` VALUES ('195', 'SB', 'Solomon Islands', 'SLB', '90', '677');
INSERT INTO `country` VALUES ('196', 'SO', 'Somalia', 'SOM', '706', '252');
INSERT INTO `country` VALUES ('197', 'ZA', 'South Africa', 'ZAF', '710', '27');
INSERT INTO `country` VALUES ('198', 'GS', 'South Georgia and the South Sandwich Islands', null, null, '0');
INSERT INTO `country` VALUES ('199', 'ES', 'Spain', 'ESP', '724', '34');
INSERT INTO `country` VALUES ('200', 'LK', 'Sri Lanka', 'LKA', '144', '94');
INSERT INTO `country` VALUES ('201', 'SD', 'Sudan', 'SDN', '736', '249');
INSERT INTO `country` VALUES ('202', 'SR', 'Suriname', 'SUR', '740', '597');
INSERT INTO `country` VALUES ('203', 'SJ', 'Svalbard and Jan Mayen', 'SJM', '744', '47');
INSERT INTO `country` VALUES ('204', 'SZ', 'Swaziland', 'SWZ', '748', '268');
INSERT INTO `country` VALUES ('205', 'SE', 'Sweden', 'SWE', '752', '46');
INSERT INTO `country` VALUES ('206', 'CH', 'Switzerland', 'CHE', '756', '41');
INSERT INTO `country` VALUES ('207', 'SY', 'Syrian Arab Republic', 'SYR', '760', '963');
INSERT INTO `country` VALUES ('208', 'TW', 'Taiwan, Province of China', 'TWN', '158', '886');
INSERT INTO `country` VALUES ('209', 'TJ', 'Tajikistan', 'TJK', '762', '992');
INSERT INTO `country` VALUES ('210', 'TZ', 'Tanzania, United Republic of', 'TZA', '834', '255');
INSERT INTO `country` VALUES ('211', 'TH', 'Thailand', 'THA', '764', '66');
INSERT INTO `country` VALUES ('212', 'TL', 'Timor-Leste', null, null, '670');
INSERT INTO `country` VALUES ('213', 'TG', 'Togo', 'TGO', '768', '228');
INSERT INTO `country` VALUES ('214', 'TK', 'Tokelau', 'TKL', '772', '690');
INSERT INTO `country` VALUES ('215', 'TO', 'Tonga', 'TON', '776', '676');
INSERT INTO `country` VALUES ('216', 'TT', 'Trinidad and Tobago', 'TTO', '780', '1868');
INSERT INTO `country` VALUES ('217', 'TN', 'Tunisia', 'TUN', '788', '216');
INSERT INTO `country` VALUES ('218', 'TR', 'Turkey', 'TUR', '792', '90');
INSERT INTO `country` VALUES ('219', 'TM', 'Turkmenistan', 'TKM', '795', '7370');
INSERT INTO `country` VALUES ('220', 'TC', 'Turks and Caicos Islands', 'TCA', '796', '1649');
INSERT INTO `country` VALUES ('221', 'TV', 'Tuvalu', 'TUV', '798', '688');
INSERT INTO `country` VALUES ('222', 'UG', 'Uganda', 'UGA', '800', '256');
INSERT INTO `country` VALUES ('223', 'UA', 'Ukraine', 'UKR', '804', '380');
INSERT INTO `country` VALUES ('224', 'AE', 'United Arab Emirates', 'ARE', '784', '971');
INSERT INTO `country` VALUES ('225', 'GB', 'United Kingdom', 'GBR', '826', '44');
INSERT INTO `country` VALUES ('226', 'US', 'United States', 'USA', '840', '1');
INSERT INTO `country` VALUES ('227', 'UM', 'United States Minor Outlying Islands', null, null, '1');
INSERT INTO `country` VALUES ('228', 'UY', 'Uruguay', 'URY', '858', '598');
INSERT INTO `country` VALUES ('229', 'UZ', 'Uzbekistan', 'UZB', '860', '998');
INSERT INTO `country` VALUES ('230', 'VU', 'Vanuatu', 'VUT', '548', '678');
INSERT INTO `country` VALUES ('231', 'VE', 'Venezuela', 'VEN', '862', '58');
INSERT INTO `country` VALUES ('232', 'VN', 'Viet Nam', 'VNM', '704', '84');
INSERT INTO `country` VALUES ('233', 'VG', 'Virgin Islands, British', 'VGB', '92', '1284');
INSERT INTO `country` VALUES ('234', 'VI', 'Virgin Islands, U.s.', 'VIR', '850', '1340');
INSERT INTO `country` VALUES ('235', 'WF', 'Wallis and Futuna', 'WLF', '876', '681');
INSERT INTO `country` VALUES ('236', 'EH', 'Western Sahara', 'ESH', '732', '212');
INSERT INTO `country` VALUES ('237', 'YE', 'Yemen', 'YEM', '887', '967');
INSERT INTO `country` VALUES ('238', 'ZM', 'Zambia', 'ZMB', '894', '260');
INSERT INTO `country` VALUES ('239', 'ZW', 'Zimbabwe', 'ZWE', '716', '263');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
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
  `recording_time` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'cust_1', 'IKEA', 'Sweden AB', 'Sweden', 'keyacmgr_1', 'Rowshon Abedin Sujon', 'qc', 'qc', '2021-03-08 12:48:29');
INSERT INTO `customer` VALUES ('10', 'cust_10', 'BBK Spolka', '15Ð Magnacka St.\r\n80-180 Kowale near GdaÅ„sk, Poland\r\ntel.: + 48 58 762 20 20 \r\nfax: + 48 58 762 20 60\r\nemail: biuro@bbk.com.pl', 'Poland', 'keyacmgr_11', 'Mr. Mehedi Hasan', 'qc', 'qc', '2021-03-17 11:55:01');
INSERT INTO `customer` VALUES ('11', 'cust_11', 'William Sonoam', 'USA', 'United States', 'keyacmgr_8', 'Abu Sayem Rana', 'qc', 'qc', '2021-03-18 12:49:29');
INSERT INTO `customer` VALUES ('2', 'cust_2', 'Sainsbury', 'United Kingdom', 'United Kingdom', 'keyacmgr_2', 'Moklesur Rahman Rony', 'qc', 'qc', '2021-03-08 19:22:03');
INSERT INTO `customer` VALUES ('3', 'cust_3', 'KGS La Redoute', 'France', 'France', 'keyacmgr_3', 'Mr. Sujit Ranjan Debnath', 'qc', 'qc', '2021-03-08 19:54:56');
INSERT INTO `customer` VALUES ('4', 'cust_4', 'Nitori', 'Japan', 'Japan', 'keyacmgr_4', 'Mr. Jahir Uddin Babur', 'qc', 'qc', '2021-03-08 20:45:49');
INSERT INTO `customer` VALUES ('5', 'cust_5', 'H&m', 'VÃ¤sterÃ¥s, Sweden', 'Sweden', 'keyacmgr_5', 'Md. Manzurul Ahsan', 'qc', 'qc', '2021-03-09 12:14:17');
INSERT INTO `customer` VALUES ('6', 'cust_6', 'Max Fashion', 'India', 'India', 'keyacmgr_6', 'Md. Shamim Bhuiyan (Shipon)', 'qc', 'qc', '2021-03-09 20:13:02');
INSERT INTO `customer` VALUES ('7', 'cust_7', 'Walmart', 'Canada', 'Canada', 'keyacmgr_7', 'Omar Faruk', 'qc', 'qc', '2021-03-09 20:21:34');
INSERT INTO `customer` VALUES ('8', 'cust_8', 'Target Australia', ' Australia', 'Australia', 'keyacmgr_8', 'Abu Sayem Rana', 'qc', 'qc', '2021-03-09 20:29:38');
INSERT INTO `customer` VALUES ('9', 'cust_9', 'Jotex', 'Seremban', 'Malaysia', 'keyacmgr_9', 'Md. Mahadi Hassan', 'qc', 'qc', '2021-03-16 16:04:57');

-- ----------------------------
-- Table structure for `daily_input_for_swing`
-- ----------------------------
DROP TABLE IF EXISTS `daily_input_for_swing`;
CREATE TABLE `daily_input_for_swing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_details_id` int(11) NOT NULL,
  `ship_date` date NOT NULL,
  `input_date` date NOT NULL,
  `received_cutting_qty` int(11) NOT NULL,
  `cutting_completed_day` date NOT NULL,
  `line_no` int(11) NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(100) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of daily_input_for_swing
-- ----------------------------

-- ----------------------------
-- Table structure for `daily_target_set_line_details`
-- ----------------------------
DROP TABLE IF EXISTS `daily_target_set_line_details`;
CREATE TABLE `daily_target_set_line_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `recording_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of daily_target_set_line_details
-- ----------------------------
INSERT INTO `daily_target_set_line_details` VALUES ('1', '1', '1', '226', 'color_1', '2022-02-19', '200', '100', '0', '100', '2022-02-27', 'qc', 'qc', '2022-02-27 10:53:32');
INSERT INTO `daily_target_set_line_details` VALUES ('2', '1', '9', 'TBA', 'color_18', '2022-04-15', '2000', '1500', '0', '100', '2022-03-08', 'qc', 'qc', '2022-03-08 17:59:36');

-- ----------------------------
-- Table structure for `department_info`
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `section_name` varchar(100) DEFAULT NULL,
  `contact_person_name` varchar(100) DEFAULT NULL,
  `contact_no` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('1', 'Gate-2', 'Marketing', 'Marketing', 'Roshan Abedin Sujon', '+8801678507571', 'abedin@znzfab.com', 'qc', 'qc', '2021-03-08 11:59:09');

-- ----------------------------
-- Table structure for `designation_info`
-- ----------------------------
DROP TABLE IF EXISTS `designation_info`;
CREATE TABLE `designation_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `short_form` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of designation_info
-- ----------------------------
INSERT INTO `designation_info` VALUES ('1', 'Officer', 'Officer', null, null, null);
INSERT INTO `designation_info` VALUES ('3', 'Junior Officer', 'Jr. Officer', null, null, null);
INSERT INTO `designation_info` VALUES ('4', 'Senior Officer', 'Sr. Officer', null, null, null);
INSERT INTO `designation_info` VALUES ('22', 'Programmer', 'Programmer', null, null, null);
INSERT INTO `designation_info` VALUES ('23', 'Junior Programmer', 'Jr. Programmer', null, null, null);
INSERT INTO `designation_info` VALUES ('5', 'Executive', 'Executive', null, null, null);
INSERT INTO `designation_info` VALUES ('7', 'Junior Executive', 'Jr. Executive', null, null, null);
INSERT INTO `designation_info` VALUES ('8', 'Senior Executive', 'Sr. Executive', null, null, null);
INSERT INTO `designation_info` VALUES ('9', 'General Manager', 'GM', null, null, null);
INSERT INTO `designation_info` VALUES ('24', 'Assistant Programmer', 'Asst. Programmer', null, null, null);
INSERT INTO `designation_info` VALUES ('25', 'Senior Programmer', 'Sr. Programmer', null, null, null);
INSERT INTO `designation_info` VALUES ('10', 'Assistant General Manager', 'AGM', null, null, null);
INSERT INTO `designation_info` VALUES ('11', 'Deputy General Manager', 'DGM', null, null, null);
INSERT INTO `designation_info` VALUES ('12', 'Manager', 'Manager', null, null, null);
INSERT INTO `designation_info` VALUES ('19', 'Junior Application Developer', 'Jr. App. Developer', null, null, null);
INSERT INTO `designation_info` VALUES ('13', 'Assistant Manager', 'Asst. Manager', null, null, null);
INSERT INTO `designation_info` VALUES ('14', 'Deputy Manager', 'Dept. Manager', null, null, null);
INSERT INTO `designation_info` VALUES ('15', 'Senior Manager', 'Sr. Manager', null, null, null);
INSERT INTO `designation_info` VALUES ('2', 'Assistant Officer', 'Asst. Officer', null, null, null);
INSERT INTO `designation_info` VALUES ('20', 'Assistant Application Developer', 'Asst. App. Developer', null, null, null);
INSERT INTO `designation_info` VALUES ('16', 'Head of Department', 'Head of Dept.', null, null, null);
INSERT INTO `designation_info` VALUES ('17', 'Application Implementer', 'App. Implementer', '', '', '0000-00-00 00:00:00');
INSERT INTO `designation_info` VALUES ('18', 'Application Developer', 'App. Developer', null, null, null);
INSERT INTO `designation_info` VALUES ('21', 'Senior Application Developer', 'Sr. App. Developer', null, null, null);
INSERT INTO `designation_info` VALUES ('6', 'Assistant Executive', 'Asst. Executive', null, null, null);
INSERT INTO `designation_info` VALUES ('27', 'Junior Engineer', 'Jr. Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('26', 'Engineer', 'Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('28', 'Assistant Engineer', 'Asst. Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('29', 'Senior Engineer', 'Sr. Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('30', 'System & Network Engineer', 'System & Network Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('31', 'Junior System & Network Engineer', 'Jr. System Network Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('32', 'Assistant System & Network Engineer', 'Asst. System & Network Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('33', 'Senior System & Network Engineer', 'Sr. System & Network Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('34', 'Functional Co-ordinator', 'Functional Co-ordinator', null, null, null);
INSERT INTO `designation_info` VALUES ('35', 'Senior Functional Co-ordinator', 'Sr. Functional Co-ordinator', null, null, null);
INSERT INTO `designation_info` VALUES ('36', 'Data Co-ordinator', 'Data Co-ordinator', null, null, null);
INSERT INTO `designation_info` VALUES ('37', 'Senior Data Co-ordinator', 'Sr. Data Co-ordinator', null, null, null);
INSERT INTO `designation_info` VALUES ('38', 'NOC Engineer', 'NOC Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('39', 'Chief Information Officer', 'CIO', null, null, null);
INSERT INTO `designation_info` VALUES ('40', 'Chief Technical Officer', 'CTO', null, null, null);
INSERT INTO `designation_info` VALUES ('41', 'Database Administrator', 'DBA', null, null, null);
INSERT INTO `designation_info` VALUES ('42', 'System Administrator', 'System Admin', null, null, null);
INSERT INTO `designation_info` VALUES ('43', 'System Analyst', 'System Analyst', null, null, null);
INSERT INTO `designation_info` VALUES ('44', 'Team Leader', 'Team Leader', null, null, null);
INSERT INTO `designation_info` VALUES ('45', 'Project Manager', 'PM', null, null, null);
INSERT INTO `designation_info` VALUES ('46', 'Junior NOC Engineer', 'Jr. NOC Engineer', null, null, null);
INSERT INTO `designation_info` VALUES ('47', 'Electrical Engineer', 'ELec. Engr.', null, null, null);
INSERT INTO `designation_info` VALUES ('48', 'Assistant Manufacturing Engineer', 'Asst. Manufacturing Engr.', null, null, null);

-- ----------------------------
-- Table structure for `division_info`
-- ----------------------------
DROP TABLE IF EXISTS `division_info`;
CREATE TABLE `division_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(50) DEFAULT NULL,
  `division_full_name` varchar(100) DEFAULT NULL,
  `division_address` varchar(250) DEFAULT NULL,
  `division_location` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of division_info
-- ----------------------------
INSERT INTO `division_info` VALUES ('1', 'MHO', 'Motijheel Head Office', 'Motijeel, Dhaka', 'Head Office', null, null, null);
INSERT INTO `division_info` VALUES ('2', 'GHO', 'Gulshan Head Office', 'Gulshan, Dhaka', 'Head Office', null, null, null);
INSERT INTO `division_info` VALUES ('3', 'YSML', 'Yesmin Spinning Mills Ltd', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('4', 'ZSML', 'Zaber Spinning Mills Ltd', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('5', 'NSML', 'Noman Spinning Mills Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('6', 'TSML', 'Talha Spinning Mills Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('7', 'ISML', 'Ismail Spinning Mills Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('10', 'SCML', 'Sufia Cotton Mills Ltd.', 'Sreepur, Gazipur', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('11', 'SCMLW', 'Sufia Cotton Mills Ltd. (Weaving)', 'Sreepur, Gazipur', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('12', 'NDML', 'Nice Denim Mills Ltd.', 'Sreepur, Gazipur', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('13', 'NDMLW', 'Nice Denim Mills Ltd (Washing)', 'Sreepur, Gazipur', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('14', 'NWML', 'Noman Weaving Mills Ltd(Shed-1)', 'Sreepur, Gazipur', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('15', 'NWML2', 'Noman Weaving Mills Ltd.(Shed-2)', 'Sreepur, Gazipur', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('16', 'NDSD', 'Nice Denim Solid Dyeing', 'Sreepur, Gazipur', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('17', 'NTTML', 'Noman Terry Towel Mills Ltd', 'Mirzapur, Gazipur', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('18', 'TFL', 'Talha Fabrics Ltd', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('8', 'ZZFL', 'Zaber & Zubair Fabrics Ltd', 'Pagar, Tongi', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('20', 'SSTML', 'Saad Saan Textile Mills Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('21', 'TTPL', 'Talha Texpro Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('9', 'NHTML', 'Noman Home Textile Mills Ltd.', 'Sreepur, Gazipur', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('23', 'NCTL', 'Noman Composite Textile Ltd', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('24', 'ZTML', 'Zarba Textile Mills Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('25', 'ZTML-R', 'Zarba Textile Mills Ltd.(Rotor)', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('26', 'ITML', 'Ismail Textile Mills Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('27', 'NTML', 'Noman Textile Mills Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('28', 'IAAFL', 'Ismail Anzuman Ara Fabrics Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('29', 'NFFL', 'Noman Fashion Fabrics Ltd', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('30', 'NFL1', 'Noman Fabrics Ltd-1', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('31', 'NFL2', 'Noman Fabrics Ltd-2', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('32', 'SFL1', 'Sufia Fabrics Ltd-1', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('33', 'SFL2', 'Sufia Fabrics Ltd-2', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('34', 'SFL3', 'Sufia Fabrics Ltd-3', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('35', 'AFL1', 'Artex Fabrics Ltd-1', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('36', 'AFL2', 'Artex Fabrics Ltd-2', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('37', 'MTML', 'Marium Textile Mills Ltd', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('22', 'ZuSML', 'Zubair Spinning Mills Ltd.', '', 'Factory', null, null, null);
INSERT INTO `division_info` VALUES ('19', 'SSAL', 'Saad Saan Apparels Ltd.', '', 'Factory', null, null, null);

-- ----------------------------
-- Table structure for `initial_plan_by_ie`
-- ----------------------------
DROP TABLE IF EXISTS `initial_plan_by_ie`;
CREATE TABLE `initial_plan_by_ie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `swing_production_info_id` int(11) NOT NULL,
  `line_no` int(11) NOT NULL,
  `allocated_qty` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_holidays` int(11) NOT NULL,
  `total_working_hours` int(11) NOT NULL,
  `man_power` int(11) NOT NULL,
  `targeted_hour` int(11) NOT NULL,
  `cumulative_target` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initial_plan_id` (`swing_production_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of initial_plan_by_ie
-- ----------------------------

-- ----------------------------
-- Table structure for `line_info`
-- ----------------------------
DROP TABLE IF EXISTS `line_info`;
CREATE TABLE `line_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` int(11) NOT NULL,
  `line` varchar(10) NOT NULL,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of line_info
-- ----------------------------
INSERT INTO `line_info` VALUES ('1', '1', 'L-01', '3rd Floor(A)');
INSERT INTO `line_info` VALUES ('2', '1', 'L-02', '3rd Floor(A) ');
INSERT INTO `line_info` VALUES ('3', '1', 'L-03', '3rd Floor(A)');
INSERT INTO `line_info` VALUES ('4', '1', 'L-04', '3rd Floor(A)');
INSERT INTO `line_info` VALUES ('5', '1', 'L-05', '3rd Floor(A)');
INSERT INTO `line_info` VALUES ('6', '1', 'L-06', '5th Floor(B)');
INSERT INTO `line_info` VALUES ('7', '1', 'L-07', '5th Floor(B)');
INSERT INTO `line_info` VALUES ('8', '1', 'L-08', '5th Floor(B)');
INSERT INTO `line_info` VALUES ('9', '1', 'L-09', '5th Floor(B)');
INSERT INTO `line_info` VALUES ('10', '1', 'L-10', '5th Floor(B)');
INSERT INTO `line_info` VALUES ('11', '2', 'L-11', '6th Floor(A)');
INSERT INTO `line_info` VALUES ('12', '2', 'L-12', '6th Floor(A)');
INSERT INTO `line_info` VALUES ('13', '2', 'L-13', '6th Floor(A)');
INSERT INTO `line_info` VALUES ('14', '2', 'L-14', '6th Floor(A)');
INSERT INTO `line_info` VALUES ('15', '2', 'L-15', '6th Floor(A)');
INSERT INTO `line_info` VALUES ('16', '2', 'L-16', '6th Floor(B)');
INSERT INTO `line_info` VALUES ('17', '2', 'L-17', '6th Floor(B)');
INSERT INTO `line_info` VALUES ('18', '2', 'L-18', '6th Floor(B)');
INSERT INTO `line_info` VALUES ('19', '2', 'L-19', '6th Floor(B)');
INSERT INTO `line_info` VALUES ('20', '2', 'L-20', '6th Floor(B)');

-- ----------------------------
-- Table structure for `line_man_power_details`
-- ----------------------------
DROP TABLE IF EXISTS `line_man_power_details`;
CREATE TABLE `line_man_power_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `line_no` int(11) NOT NULL,
  `operator` int(11) NOT NULL,
  `Helper` int(11) NOT NULL,
  `iron_man` int(11) NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(55) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of line_man_power_details
-- ----------------------------
INSERT INTO `line_man_power_details` VALUES ('1', '2022-02-27', '1', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:50');
INSERT INTO `line_man_power_details` VALUES ('2', '2022-02-27', '2', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:50');
INSERT INTO `line_man_power_details` VALUES ('3', '2022-02-27', '3', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('4', '2022-02-27', '4', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('5', '2022-02-27', '5', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('6', '2022-02-27', '6', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('7', '2022-02-27', '7', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('8', '2022-02-27', '8', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('9', '2022-02-27', '9', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('10', '2022-02-27', '10', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('11', '2022-02-27', '11', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('12', '2022-02-27', '12', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('13', '2022-02-27', '13', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('14', '2022-02-27', '14', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('15', '2022-02-27', '15', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:51');
INSERT INTO `line_man_power_details` VALUES ('16', '2022-02-27', '16', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:52');
INSERT INTO `line_man_power_details` VALUES ('17', '2022-02-27', '17', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:52');
INSERT INTO `line_man_power_details` VALUES ('18', '2022-02-27', '18', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:52');
INSERT INTO `line_man_power_details` VALUES ('19', '2022-02-27', '19', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:52');
INSERT INTO `line_man_power_details` VALUES ('20', '2022-02-27', '20', '50', '5', '5', '0', 'qc', '2022-02-27 10:52:52');
INSERT INTO `line_man_power_details` VALUES ('21', '2022-03-08', '1', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('22', '2022-03-08', '2', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('23', '2022-03-08', '3', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('24', '2022-03-08', '4', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('25', '2022-03-08', '5', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('26', '2022-03-08', '6', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('27', '2022-03-08', '7', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('28', '2022-03-08', '8', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('29', '2022-03-08', '9', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('30', '2022-03-08', '10', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('31', '2022-03-08', '11', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('32', '2022-03-08', '12', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('33', '2022-03-08', '13', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('34', '2022-03-08', '14', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('35', '2022-03-08', '15', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('36', '2022-03-08', '16', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('37', '2022-03-08', '17', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('38', '2022-03-08', '18', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('39', '2022-03-08', '19', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');
INSERT INTO `line_man_power_details` VALUES ('40', '2022-03-08', '20', '50', '8', '4', '0', 'qc', '2022-03-08 17:58:53');

-- ----------------------------
-- Table structure for `line_wise_input_per_hour`
-- ----------------------------
DROP TABLE IF EXISTS `line_wise_input_per_hour`;
CREATE TABLE `line_wise_input_per_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_details_id` int(11) NOT NULL,
  `ship_date` date NOT NULL,
  `line_no` int(11) NOT NULL,
  `hour_no` int(11) NOT NULL,
  `man_power` int(11) NOT NULL,
  `hourly_output` int(11) NOT NULL,
  `input_date` date NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(55) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of line_wise_input_per_hour
-- ----------------------------

-- ----------------------------
-- Table structure for `line_wise_output_per_hour`
-- ----------------------------
DROP TABLE IF EXISTS `line_wise_output_per_hour`;
CREATE TABLE `line_wise_output_per_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of line_wise_output_per_hour
-- ----------------------------
INSERT INTO `line_wise_output_per_hour` VALUES ('1', '1', '2022-02-19', '226', 'color_1', '1', '200', '100', '1', '0', '90', '2022-02-27', '0', 'qc', '2022-02-27 10:53:52');
INSERT INTO `line_wise_output_per_hour` VALUES ('2', '1', '2022-02-19', '226', 'color_1', '1', '200', '100', '2', '60', '90', '2022-02-27', '0', 'qc', '2022-02-27 10:55:28');
INSERT INTO `line_wise_output_per_hour` VALUES ('3', '9', '2022-04-15', 'TBA', 'color_18', '1', '2000', '1500', '1', '0', '90', '2022-03-08', '0', 'qc', '2022-03-08 18:00:48');
INSERT INTO `line_wise_output_per_hour` VALUES ('4', '9', '2022-04-15', 'TBA', 'color_18', '1', '2000', '1500', '1', '0', '90', '0000-00-00', '0', 'qc', '2022-03-08 18:01:03');

-- ----------------------------
-- Table structure for `order_details`
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_details_id` int(11) DEFAULT NULL,
  `po` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `order_qty` varchar(255) NOT NULL,
  `plan_cut_qty` varchar(255) NOT NULL,
  `pcd` varchar(255) NOT NULL,
  `ship_date` date NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(100) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES ('1', '1', '226', 'color_1', '876', '920', '01/24/2022', '2022-02-19', '0', 'iftekhar', '2022-02-12 16:50:28');
INSERT INTO `order_details` VALUES ('2', '1', '056', 'color_1', '1499', '1533', '01/24/2022', '2022-02-19', '0', 'iftekhar', '2022-02-12 16:51:54');
INSERT INTO `order_details` VALUES ('3', '2', 'TBA', 'color_2', '9755', '10050', '03/25/2022', '2022-04-07', '0', 'qc', '2022-03-08 17:42:23');
INSERT INTO `order_details` VALUES ('4', '2', 'TBA', 'color_2', '9755', '10050', '03/25/2022', '2022-04-25', '0', 'qc', '2022-03-08 17:42:49');
INSERT INTO `order_details` VALUES ('5', '9', 'TBA', 'color_18', '21040', '21671', '03/27/2022', '2022-04-15', '0', 'qc', '2022-03-08 17:50:29');

-- ----------------------------
-- Table structure for `plan_details`
-- ----------------------------
DROP TABLE IF EXISTS `plan_details`;
CREATE TABLE `plan_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ship_date` date DEFAULT NULL,
  `po` varchar(250) NOT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of plan_details
-- ----------------------------
INSERT INTO `plan_details` VALUES ('1', '1', '1', '320', '2022-02-09', '2022-02-12', '2022-02-12', '0', '920', '0', 'qc', '2022-02-27 10:36:44', '2022-02-19', '226', 'color_1');
INSERT INTO `plan_details` VALUES ('2', '1', '2', '200', '2022-02-27', '2022-02-12', '2022-02-12', '0', '920', '0', 'qc', '2022-02-27 10:49:06', '2022-02-19', '226', 'color_1');
INSERT INTO `plan_details` VALUES ('3', '2', '1', '10050', '2022-03-10', '2022-03-13', '2022-03-22', '2', '1689', '0', 'qc', '2022-03-08 17:46:00', '2022-04-07', 'TBA', 'color_2');
INSERT INTO `plan_details` VALUES ('4', '9', '1', '21671', '2022-02-13', '2022-02-14', '2022-03-13', '5', '1251', '0', 'qc', '2022-03-08 17:53:35', '2022-04-15', 'TBA', 'color_18');
INSERT INTO `plan_details` VALUES ('5', '9', '1', '1000', '2022-04-18', '2022-04-21', '2022-04-18', '1', '100', '0', 'qc', '2022-04-18 11:33:59', '2022-04-15', 'TBA', 'color_18');

-- ----------------------------
-- Table structure for `production_details`
-- ----------------------------
DROP TABLE IF EXISTS `production_details`;
CREATE TABLE `production_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_details_id` int(11) NOT NULL,
  `po` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `input_date` date NOT NULL,
  `daily_cutting_qty` int(11) NOT NULL,
  `line_no` varchar(30) NOT NULL,
  `sewing_completed_quantity` int(11) NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(100) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ship_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of production_details
-- ----------------------------
INSERT INTO `production_details` VALUES ('1', '1', '226', 'color_1', '2022-02-27', '200', '1', '100', '0', 'qc', '2022-02-27 10:50:06', '2022-02-19');
INSERT INTO `production_details` VALUES ('2', '2', 'TBA', 'color_2', '2022-03-08', '200', 'select', '0', '0', 'qc', '2022-03-08 17:46:46', '2022-04-07');
INSERT INTO `production_details` VALUES ('3', '9', 'TBA', 'color_18', '2022-03-08', '2000', '1', '1500', '0', 'qc', '2022-03-08 17:54:57', '2022-04-15');

-- ----------------------------
-- Table structure for `style_details`
-- ----------------------------
DROP TABLE IF EXISTS `style_details`;
CREATE TABLE `style_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_no` varchar(255) NOT NULL,
  `style_no` varchar(250) NOT NULL,
  `smv` double NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(100) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of style_details
-- ----------------------------
INSERT INTO `style_details` VALUES ('1', 'buyer_1', 'style_1', '21.05', 'Ladies Short All', '0', 'iftekhar', '2022-02-12 16:46:26');
INSERT INTO `style_details` VALUES ('2', 'buyer_2', 'style_2', '16.63', 'Ladies Long Pant', '0', 'qc', '2022-03-08 17:31:29');
INSERT INTO `style_details` VALUES ('3', 'buyer_3', 'style_3', '11.78', 'Paijama', '0', 'qc', '2022-03-08 17:32:50');
INSERT INTO `style_details` VALUES ('4', 'buyer_2', 'style_4', '16.3', 'Long Sleeve Shirt', '0', 'qc', '2022-03-08 17:33:31');
INSERT INTO `style_details` VALUES ('5', 'buyer_2', 'style_5', '14.74', 'Ladies Long Pant', '0', 'qc', '2022-03-08 17:34:13');
INSERT INTO `style_details` VALUES ('6', 'buyer_2', 'style_6', '25.5', 'Dress Pant', '0', 'qc', '2022-03-08 17:35:01');
INSERT INTO `style_details` VALUES ('7', 'buyer_3', 'style_7', '18.3', 'Hoody Jacket', '0', 'qc', '2022-03-08 17:35:40');
INSERT INTO `style_details` VALUES ('8', 'buyer_2', 'style_8', '22.28', 'Long Sleeve Shirt', '0', 'qc', '2022-03-08 17:36:38');
INSERT INTO `style_details` VALUES ('9', 'buyer_2', 'style_10', '18.7', 'Ladies Long Pant', '0', 'qc', '2022-03-08 17:49:18');

-- ----------------------------
-- Table structure for `style_name`
-- ----------------------------
DROP TABLE IF EXISTS `style_name`;
CREATE TABLE `style_name` (
  `row_id` int(10) NOT NULL,
  `style_id` varchar(15) NOT NULL,
  `style_name` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of style_name
-- ----------------------------
INSERT INTO `style_name` VALUES ('1', 'style_1', '308633', 'iftekhar', 'iftekhar', '2022-02-12 16:45:25');
INSERT INTO `style_name` VALUES ('10', 'style_10', 'PJTU00775A', 'qc', 'qc', '2022-03-08 17:48:20');
INSERT INTO `style_name` VALUES ('2', 'style_2', 'PMTD01779AAI20', 'qc', 'qc', '2022-03-08 17:22:42');
INSERT INTO `style_name` VALUES ('3', 'style_3', '5410571-M1', 'qc', 'qc', '2022-03-08 17:25:44');
INSERT INTO `style_name` VALUES ('4', 'style_4', 'CATD02348A', 'qc', 'qc', '2022-03-08 17:26:15');
INSERT INTO `style_name` VALUES ('5', 'style_5', 'PJTD01952AMED', 'qc', 'qc', '2022-03-08 17:26:43');
INSERT INTO `style_name` VALUES ('6', 'style_6', 'PMTU00950A', 'qc', 'qc', '2022-03-08 17:26:56');
INSERT INTO `style_name` VALUES ('7', 'style_7', 'Ladies Zip Through', 'qc', 'qc', '2022-03-08 17:27:08');
INSERT INTO `style_name` VALUES ('8', 'style_8', 'CATU01512A', 'qc', 'qc', '2022-03-08 17:27:19');
INSERT INTO `style_name` VALUES ('9', 'style_9', '5410571-M2', 'qc', 'qc', '2022-03-08 17:27:45');

-- ----------------------------
-- Table structure for `swing_production_info`
-- ----------------------------
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
  `ship_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of swing_production_info
-- ----------------------------

-- ----------------------------
-- Table structure for `swing_production_per_hour`
-- ----------------------------
DROP TABLE IF EXISTS `swing_production_per_hour`;
CREATE TABLE `swing_production_per_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `swing_production_info_id` int(11) NOT NULL,
  `production_date` varchar(255) NOT NULL,
  `line_id` int(11) NOT NULL,
  `hour` varchar(255) NOT NULL,
  `garments` varchar(255) NOT NULL,
  `recording_person_id` varchar(40) NOT NULL,
  `recording_person_name` varchar(40) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of swing_production_per_hour
-- ----------------------------

-- ----------------------------
-- Table structure for `swing_production_planning`
-- ----------------------------
DROP TABLE IF EXISTS `swing_production_planning`;
CREATE TABLE `swing_production_planning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of swing_production_planning
-- ----------------------------
INSERT INTO `swing_production_planning` VALUES ('1', '1', 'color_1', '226', '2022-02-19', '2022-02-12 09:00:00', '2022-02-12 20:00:00', '11 Hour', '2022-02-12', '0', 'qc', '2022-02-27 10:51:15');
INSERT INTO `swing_production_planning` VALUES ('2', '9', 'color_18', 'TBA', '2022-04-15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '31 Day 0 Hour', '2022-03-09', '0', 'qc', '2022-03-08 17:56:52');

-- ----------------------------
-- Table structure for `target_output_set_per_line`
-- ----------------------------
DROP TABLE IF EXISTS `target_output_set_per_line`;
CREATE TABLE `target_output_set_per_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_details_id` int(11) NOT NULL,
  `ship_date` date NOT NULL,
  `po` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `line_no` int(11) NOT NULL,
  `hourly_target` int(11) NOT NULL,
  `input_date` date NOT NULL,
  `recording_person_id` int(11) NOT NULL,
  `recording_person_name` varchar(55) NOT NULL,
  `recording_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of target_output_set_per_line
-- ----------------------------

-- ----------------------------
-- Table structure for `user_access_management`
-- ----------------------------
DROP TABLE IF EXISTS `user_access_management`;
CREATE TABLE `user_access_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `modification_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_access_management
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `recording_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('15', 'iftekhar', 'iftekhar', 'iftekhar', '12345', '12345', 'Admin', 'Active', 'abcd@gmail.com', '11111111', 'ICT', 'Application Developer', 'default.png', 'iftekhar', 'iftekhar', '2021-02-23 15:53:17');
INSERT INTO `user_info` VALUES ('26', 'Md. Jiash Hasnat', 'Md.Jiash Hasnat', '004143', 'covid19zz', 'covid19zz', 'Admin', 'Active', 'ftslab@znzfab.com', '01985982850', 'Lab & QC', 'Engineer', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:44:07');
INSERT INTO `user_info` VALUES ('27', 'Md. Saiful Islam', null, 'Saiful Lab', '4321', '4321', 'User', 'Active', 'md.saiful@znzfab.com', '01701212563', 'Marketing', 'Manager', 'default.png', 'qc', 'qc', '2020-12-01 09:55:55');
INSERT INTO `user_info` VALUES ('28', 'Md. Saiful Islam', null, 'Saiful Lab', '4321', '4321', 'User', 'Active', 'md.saiful@znzfab.com', '01701212563', 'ICT', 'Manager', 'default.png', 'qc', 'qc', '2020-12-01 09:58:41');
INSERT INTO `user_info` VALUES ('30', 'qc', 'Mr.qc', 'qc', '12345', '12345', 'Admin', 'Active', 'qc@gmail.com', '100000000', 'Lab & QC', 'Deputy Manager', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:44:16');
INSERT INTO `user_info` VALUES ('32', 'abc', 'Mr.QC', 'abc123', '12345', '12345', 'User', 'Active', 'abc@gmail.com', '11111111', 'ICT', 'Engineer', 'default.png', 'iftekhar', 'iftekhar', '2021-02-23 15:51:47');
INSERT INTO `user_info` VALUES ('34', 'dto', 'data entry operator', 'dto_1', '12345', '12345', 'User', 'Active', 'dto@dto.com', '34543523232', 'ICT', 'Data Co-ordinator', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:43:56');
INSERT INTO `user_info` VALUES ('35', 'dto', 'data entry operator', 'dto_1', '12345', '12345', 'User', 'Active', 'dto@dto.com', '34543523232', 'ICT', 'Data Co-ordinator', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:43:56');
INSERT INTO `user_info` VALUES ('36', 'Data Entry OP', 'Mr. Haris', '090', '1234', '1234', 'Sub_User', 'Active', 'jiash09@live.com', '0', 'Marketing', 'Assistant Officer', 'default.png', 'qc', 'qc', '2021-03-10 17:51:42');

-- ----------------------------
-- Table structure for `user_login`
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `recording_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES ('69', 'iftekhar', 'iftekhar', '', '', '', '', '12345', 'abcd@gmail.com', '11111111', 'ICT', 'Application Developer', 'Admin', 'Active', 'default.png', 'iftekhar', 'iftekhar', '2021-02-23 15:53:17');
INSERT INTO `user_login` VALUES ('84', 'qc', 'qc', 'Mr.qc', '', '', '', '12345', 'qc@gmail.com', '100000000', 'Lab & QC', 'Deputy Manager', 'Admin', 'Active', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:44:16');
INSERT INTO `user_login` VALUES ('80', '004143', 'Md. Jiash Hasnat', 'Md.Jiash Hasnat', '', '', '', 'covid19zz', 'ftslab@znzfab.com', '01985982850', 'Lab & QC', 'Engineer', 'User', 'Active', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:44:07');
INSERT INTO `user_login` VALUES ('89', 'dto_1', 'dto', 'data entry operator', '', '', '', '12345', 'dto@dto.com', '34543523232', 'ICT', 'Data Co-ordinator', 'Sub_User', 'Active', 'default.png', 'iftekhar', 'iftekhar', '2021-03-07 23:43:56');
INSERT INTO `user_login` VALUES ('90', '090', 'Data Entry OP', 'Mr. Haris', '', '', '', '1234', 'jiash09@live.com', '0', 'Marketing', 'Assistant Officer', 'Sub_User', 'Active', 'default.png', 'qc', 'qc', '2021-03-10 17:51:42');

-- ----------------------------
-- Table structure for `user_login_old`
-- ----------------------------
DROP TABLE IF EXISTS `user_login_old`;
CREATE TABLE `user_login_old` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `recording_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_login_old
-- ----------------------------

-- ----------------------------
-- Table structure for `user_type`
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES ('1', 'Super Admin', 'super_admin');
INSERT INTO `user_type` VALUES ('2', 'Admin', 'admin');
INSERT INTO `user_type` VALUES ('3', 'Senior Officer LC & PI', 'senior_officer_lc_pi');
INSERT INTO `user_type` VALUES ('4', 'Senior Officer B2B', 'senior_officer_b2b');
INSERT INTO `user_type` VALUES ('5', 'Assistant Manager ', 'assistant_manager');
INSERT INTO `user_type` VALUES ('6', 'Assistant Manager Banking', 'assistant_manager_banking');
INSERT INTO `user_type` VALUES ('7', 'Officer', 'officer');
INSERT INTO `user_type` VALUES ('8', 'Assistant Officer BTMA', 'assistant_officer_btma');
INSERT INTO `user_type` VALUES ('9', 'Assistant Officer B2B', 'assistant_officer_b2b');
INSERT INTO `user_type` VALUES ('10', 'Manager', 'manager');
INSERT INTO `user_type` VALUES ('11', 'Sub User', 'sub_user');

-- ----------------------------
-- Table structure for `version_name`
-- ----------------------------
DROP TABLE IF EXISTS `version_name`;
CREATE TABLE `version_name` (
  `row_id` int(10) NOT NULL,
  `version_id` varchar(15) NOT NULL,
  `version_name` varchar(100) DEFAULT NULL,
  `recording_person_id` varchar(30) DEFAULT NULL,
  `recording_person_name` varchar(50) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of version_name
-- ----------------------------

-- ----------------------------
-- Table structure for `wip_view`
-- ----------------------------
DROP TABLE IF EXISTS `wip_view`;
CREATE TABLE `wip_view` (
  `order_details_id` int(11) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `po` varchar(50) DEFAULT NULL,
  `WIP` decimal(33,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wip_view
-- ----------------------------

-- ----------------------------
-- View structure for `hourly_output_report_view`
-- ----------------------------
DROP VIEW IF EXISTS `hourly_output_report_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hourly_output_report_view` AS select `style_l_s_c_p_t_h_q_m_input`.`style_details_id` AS `order_details_id`,`style_l_s_c_p_t_h_q_m_input`.`ship_date` AS `ship_date`,`style_l_s_c_p_t_h_q_m_input`.`color` AS `color`,`style_l_s_c_p_t_h_q_m_input`.`po` AS `po`,`style_l_s_c_p_t_h_q_m_input`.`line_no` AS `line_no`,`style_l_s_c_p_t_h_q_m_input`.`new_target` AS `new_target`,`style_l_s_c_p_t_h_q_m_input`.`input_date` AS `input_date`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 1),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_1`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 2),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_2`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 3),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_3`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 4),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_4`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 5),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_5`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 6),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_6`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 7),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_7`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 8),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_8`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 9),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_9`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 10),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_10`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 11),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_11`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 12),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_12`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 13),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_13`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 14),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_14`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 15),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_15`,sum(if((`style_l_s_c_p_t_h_q_m_input`.`hour_no` = 16),`style_l_s_c_p_t_h_q_m_input`.`quantity`,0)) AS `Hour_16` from `style_l_s_c_p_t_h_q_m_input` group by `style_l_s_c_p_t_h_q_m_input`.`style_details_id`,`style_l_s_c_p_t_h_q_m_input`.`ship_date`,`style_l_s_c_p_t_h_q_m_input`.`color`,`style_l_s_c_p_t_h_q_m_input`.`po`,`style_l_s_c_p_t_h_q_m_input`.`input_date`;

-- ----------------------------
-- View structure for `style_l_s_c_p_t_h_q_m_input`
-- ----------------------------
DROP VIEW IF EXISTS `style_l_s_c_p_t_h_q_m_input`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `style_l_s_c_p_t_h_q_m_input` AS select `daily_target_set_line_details`.`style_details_id` AS `style_details_id`,`daily_target_set_line_details`.`line_no` AS `line_no`,`daily_target_set_line_details`.`ship_date` AS `ship_date`,`daily_target_set_line_details`.`color` AS `color`,`daily_target_set_line_details`.`po` AS `po`,`daily_target_set_line_details`.`new_target` AS `new_target`,`line_wise_output_per_hour`.`hour_no` AS `hour_no`,`line_wise_output_per_hour`.`quantity` AS `quantity`,`line_wise_output_per_hour`.`man_power` AS `man_power`,`line_wise_output_per_hour`.`input_date` AS `input_date` from (`daily_target_set_line_details` join `line_wise_output_per_hour` on(((`daily_target_set_line_details`.`style_details_id` = `line_wise_output_per_hour`.`order_details_id`) and (`daily_target_set_line_details`.`line_no` = `line_wise_output_per_hour`.`line_no`) and (`daily_target_set_line_details`.`ship_date` = `line_wise_output_per_hour`.`ship_date`) and (`daily_target_set_line_details`.`color` = `line_wise_output_per_hour`.`color`) and (`daily_target_set_line_details`.`input_date` = `line_wise_output_per_hour`.`input_date`))));

-- ----------------------------
-- Procedure structure for `GetOfficeByCountry`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetOfficeByCountry`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOfficeByCountry`(IN `po` VARCHAR(255))
BEGIN
	SELECT * 
 	FROM wip_view
	WHERE po = po;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `hourly_output_report`
-- ----------------------------
DROP PROCEDURE IF EXISTS `hourly_output_report`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hourly_output_report`()
BEGIN
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
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Wip_Procudure`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Wip_Procudure`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Wip_Procudure`(IN `order_details_id` INT, IN `ship_date` DATE, IN `po` VARCHAR(250), IN `color` VARCHAR(250))
BEGIN 
   Select * from wip_view  WHERE 
   order_details_id=order_details_id
   and ship_date=ship_date
   and po=po and
   color=color; 
END
;;
DELIMITER ;
