--Security
INSERT INTO "Security" VALUES ('ziv',3);
INSERT INTO "Security" VALUES ('kin',2);

--Filters
INSERT INTO "Filters" ("table", "column", value) VALUES ('Cases', 'selectCustomer', '2a 新增病案');
INSERT INTO "Filters" ("table", "column", value) VALUES ('Cases', 'sickness', '濕');
INSERT INTO "Filters" ("table", "column", value) VALUES ('Customers', 'name', '10');
INSERT INTO "Filters" ("table", "column", value) VALUES ('CaseMedicines', 'name', '王不留行');
INSERT INTO "Filters" ("table", "column", value) VALUES ('Cases', 'customerName', '9');
INSERT INTO "Filters" ("table", "column", value) VALUES ('Cases', 'formName', '2 新增病案');

--Units
INSERT INTO "Units" VALUES('amount',0.0E0);
INSERT INTO "Units" VALUES('amount',0.5E0);
INSERT INTO "Units" VALUES('amount',1.0E0);
INSERT INTO "Units" VALUES('amount',1.5E0);
INSERT INTO "Units" VALUES('amount',2.0E0);
INSERT INTO "Units" VALUES('amount',2.5E0);
INSERT INTO "Units" VALUES('amount',3.0E0);
INSERT INTO "Units" VALUES('amount',3.5E0);
INSERT INTO "Units" VALUES('amount',4.0E0);
INSERT INTO "Units" VALUES('amount',5.0E0);
INSERT INTO "Units" VALUES('amount',6.0E0);
INSERT INTO "Units" VALUES('amount',7.0E0);
INSERT INTO "Units" VALUES('amount',8.0E0);
INSERT INTO "Units" VALUES('amount',9.0E0);
INSERT INTO "Units" VALUES('amount',10.0E0);
INSERT INTO "Units" VALUES('amount',11.0E0);
INSERT INTO "Units" VALUES('amount',12.0E0);

--PriceList
INSERT INTO "PriceList" (category, price, price2) VALUES ('艾', 280.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('拔罐', 200.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('埋線', 0.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('每劑基本', 70.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('手療', 200.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('劑量限額', 30.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('溫針', 340.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('診金', 60.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('針', 300.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('額外劑量收費', 2.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('袪瘀', 340.00, NULL);
INSERT INTO "PriceList" (category, price, price2) VALUES ('小兒推拿', 340.00, NULL);

--Types
INSERT INTO "Types" (type, value, "order") VALUES ('medicine', '艾', 3);
INSERT INTO "Types" (type, value, "order") VALUES ('medicine', '拔罐', 4);
INSERT INTO "Types" (type, value, "order") VALUES ('medicine', '埋線', 6);
INSERT INTO "Types" (type, value, "order") VALUES ('medicine', '手療', 5);
INSERT INTO "Types" (type, value, "order") VALUES ('medicine', '溫針', 7);
INSERT INTO "Types" (type, value, "order") VALUES ('medicine', '藥', 1);
INSERT INTO "Types" (type, value, "order") VALUES ('medicine', '針', 2);
INSERT INTO "Types" (type, value, "order") VALUES ('medicine', '袪瘀', 8);
INSERT INTO "Types" (type, value, "order") VALUES ('medicine', '小兒推拿', 9);

--Medicines

INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (2, 'F1', '方', '七寶美髯丹', 'A', 2001, 8.00, '4897012635001', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (3, 'F2', '方', '九味羌活湯', 'A', 2002, 6.00, '4897012638033', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (4, 'F3', '方', '二至丸', 'A', 2003, 3.00, '4897012635018', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (5, 'F4', '方', '二陳湯', 'A', 2004, 5.00, '4897012638026', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (6, 'F5', '方', '大柴胡湯', 'A', 2005, 8.00, '4897012635063', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (7, 'F6', '方', '小建中湯', 'A', 2006, 6.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (8, 'F7', '方', '小青龍湯', 'A', 2007, 7.00, '4897012638088', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (9, 'F8', '方', '小柴胡湯', 'A', 2008, 7.00, '4897012638095', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (10, 'F9', '方', '川芎茶調散', 'A', 2009, 8.00, '4897012638071', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (11, 'F10', '方', '五苓散', 'A', 2010, 5.00, '4897012638132', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (12, 'F11', '方', '天王補心丹', 'A', 2011, 12.00, '4897012638118', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (13, 'F12', '方', '天麻鈎藤飲', 'A', 2012, 8.00, '4897012636664', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (14, 'F13', '方', '止嗽散', 'A', 2013, 8.00, '4897012638156', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (15, 'F14', '方', '丹梔逍遙散', 'A', 2014, 5.00, '4897012638101', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (16, 'F15', '方', '六味地黃丸', 'A', 2015, 8.00, '4897012638170', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (17, 'F16', '方', '仙方活命飲', 'A', 2016, 8.00, '4897012638262', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (18, 'F17', '方', '半夏白術天麻湯', 'A', 2017, 8.00, '4897012636725', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (27, 'F26', '方', '甘麥大棗湯', 'A', 2026, 6.00, '4897012638224', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (28, 'F27', '方', '生化湯', 'A', 2027, 8.00, '4897012635193', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (29, 'F28', '方', '生脈散', 'A', 2028, 6.00, '4897012638231', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (31, 'F30', '方', '耳聾左慈丸', 'A', 2030, 8.00, '4897012636398', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (32, 'F31', '方', '血府逐瘀湯', 'A', 2031, 7.00, '4897012638293', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (33, 'F32', '方', '防己黃蓍湯', 'A', 2032, 6.00, '4897012635285', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (34, 'F33', '方', '吳茱萸湯', 'A', 2033, 8.00, '4897012636039', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (35, 'F34', '方', '沙參麥冬湯', 'A', 2034, 10.00, '4897012638347', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (36, 'F35', '方', '貝母瓜蔞散', 'A', 2035, 6.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (37, 'F36', '方', '身痛逐瘀湯', 'A', 2036, 12.00, '4897012635261', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (38, 'F37', '方', '定喘湯', 'A', 2037, 8.00, '4897012638361', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (39, 'F38', '方', '苓桂朮甘湯', 'A', 2038, 4.00, '4897012636770', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (40, 'F39', '方', '炙甘草湯', 'A', 2039, 12.00, '4897012638378', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (41, 'F40', '方', '保和丸', 'A', 2040, 6.00, '4897012638422', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (42, 'F41', '方', '荊防敗毒散', 'A', 2041, 10.00, '4897012638477', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (43, 'F42', '方', '香砂六君湯', 'A', 2042, 4.00, '4897012638415', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (44, 'F43', '方', '桂枝茯苓丸', 'A', 2043, 6.00, '4897012638514', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (45, 'F44', '方', '桂枝湯', 'A', 2044, 5.00, '4897012638453', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (46, 'F45', '方', '桃紅四物湯', 'A', 2045, 10.00, '4897012638507', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (47, 'F46', '方', '桑杏湯', 'A', 2046, 4.00, '4897012635421', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (48, 'F47', '方', '桑菊飲', 'A', 2047, 6.00, '4897012638446', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (49, 'F48', '方', '桑螵蛸散', 'A', 2048, 8.00, '4897012636787', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (50, 'F49', '方', '消風散', 'A', 2049, 10.00, '4897012638460', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (51, 'F50', '方', '真武湯', 'A', 2050, 4.00, '4897012636794', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (52, 'F51', '方', '逍遙散', 'A', 2051, 8.00, '4897012638521', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (53, 'F52', '方', '通竅活血湯', 'A', 2052, 6.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (54, 'F53', '方', '旋覆代赭湯', 'B', 2053, 6.00, '4897012636800', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (55, 'F54', '方', '清燥救肺湯', 'A', 2054, 8.00, '4897012636824', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (56, 'F55', '方', '麻子仁丸', 'A', 2055, 6.00, '4897012635612', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (57, 'F56', '方', '麻杏石甘湯', 'A', 2056, 4.00, '4897012638040', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (58, 'F57', '方', '麻黃附子細辛湯', 'A', 2057, 2.00, '4897012636183', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (59, 'F58', '方', '麻黃連翹赤小豆湯', 'A', 2058, 8.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (60, 'F59', '方', '麻黃湯', 'A', 2059, 4.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (61, 'F60', '方', '參苓白朮散', 'A', 2060, 12.00, '4897012638538', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (62, 'F61', '方', '理中丸', 'A', 2061, 6.00, '4897012636817', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (63, 'F62', '方', '普濟消毒飲', 'A', 2062, 10.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (64, 'F63', '方', '腎四味', 'A', 2063, 15.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (65, 'F64', '方', '葛根芩連湯', 'A', 2064, 4.00, '4897012636909', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (66, 'F65', '方', '補中益氣湯', 'A', 2065, 12.00, '4897012638552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (67, 'F66', '方', '補陽還五湯', 'A', 2066, 12.00, '4897012638569', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (68, 'F67', '方', '新加香薷飲', 'A', 2067, 6.00, '4897012636893', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (69, 'F68', '方', '會厭逐瘀湯', 'A', 2068, 12.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (70, 'F69', '方', '溫經湯', 'A', 2069, 10.00, '4897012636848', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (71, 'F70', '方', '當歸拈痛湯', 'A', 2070, 12.00, '4897012635711', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (72, 'F71', '方', '當歸飲子', 'A', 2071, 8.00, '4897012635728', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (73, 'F72', '方', '聖愈湯', 'A', 2072, 10.00, '4897012636237', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (74, 'F73', '方', '蒼耳子散', 'A', 2073, 4.00, '4897012638637', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (75, 'F74', '方', '壽胎丸', 'A', 2074, 6.00, '4897012635254', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (76, 'F75', '方', '酸棗仁湯', 'A', 2075, 6.00, '4897012638620', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (77, 'F76', '方', '銀翹散', 'A', 2076, 8.00, '4897012638613', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (78, 'F77', '方', '豬苓湯', 'A', 2077, 6.00, '4897012636541', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (79, 'F78', '方', '獨活寄生湯', 'A', 2078, 12.00, '4897012638651', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (80, 'F79', '方', '還少丹', 'A', 2079, 10.00, '4897012636602', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (81, 'F80', '方', '濟生腎氣丸', 'A', 2080, 6.00, '4897012638392', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (82, 'F81', '方', '縮泉丸', 'A', 2081, 3.00, '4897012636589', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (83, 'F82', '方', '龜鹿二仙膠', 'B', 2082, 7.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (84, 'F83', '方', '龍膽瀉肝湯', 'A', 2083, 10.00, '4897012638668', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (85, 'F84', '方', '歸脾湯', 'A', 2084, 12.00, '4897012638682', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (86, 'F85', '方', '鎮肝熄風湯', 'A', 2085, 12.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (87, 'F86', '方', '蘇子降氣湯', 'A', 2086, 8.00, '4897012636978', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (88, 'FW1', '外', '口一號方', 'A', 3001, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (89, 'FW2', '外', '拔一號方', 'A', 3002, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (90, 'FW3', '外', '提一號方', 'A', 3003, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (91, 'FW4', '外', '腰一號方', 'A', 3004, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (92, 'D1', '藥', '丁香', 'A', 4001, 0.30, '4897012630051', '辛，溫', '脾、胃、腎', '溫中降逆，散寒止痛，溫腎助陽', '畏鬱金', '煎服，1.5～6g');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (93, 'D2', '藥', '八月札', 'A', 4002, 0.30, '4897012630075', '甘，寒', '肝、胃', '舒肝理氣，活血止痛，除煩利尿', '', '10～15克，水煎服');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (94, 'D3', '藥', '三棱', 'A', 4003, 0.20, '4897012630365', '苦、辛，平', '歸肝、脾經', '破血行氣，消積止痛', '', '煎服，3～10g。醋炙可加強止痛作用');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (95, 'D4', '藥', '千層紙(木蝴蝶)', 'A', 4004, 0.30, '4897012630297', '苦、甘，涼', '歸肺、肝、胃經', '清肺利咽，疏肝和胃，收斂瘡口', '', '1.5～3g。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (96, 'D5', '藥', '土茯苓', 'A', 4005, 0.20, '4897012630310', '甘、淡，平', '歸肝、胃經', '解毒除濕，通利關節', '', '煎服，15～60g');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (97, 'D6', '藥', '大棗', 'A', 4006, 0.60, '4897012630099', '甘，溫', '脾、胃經', '補中益氣，養血安神，緩和藥性', '', '劈破煎服，10～30g；亦可去皮核搗爛為丸服');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (98, 'D7', '藥', '大黃', 'A', 4007, 0.30, '4897012630112', '苦，寒', '脾、胃、大腸、肝、心', '瀉下攻積，清熱瀉火，止血，解毒，活血祛瘀', '', '煎服，5～10g。外用適量，生大黃瀉下力較強，欲攻下者宜生用；入湯劑應後下，或用開水泡服，久煎則瀉下力減弱。酒製大黃瀉下力較弱，活血作用較好，宜用於瘀血證。大黃炭則多用於出血證');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (99, 'D8', '藥', '大腹皮', 'A', 4008, 0.30, '4897012630105', '辛，微温。', '归脾、胃、大肠、小肠经。', '下气宽中，行水消肿。用于湿阻气滞，脘腹胀闷，大便不爽，水肿胀满，脚气浮肿，小便不利。', '', '4.5～9g');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (100, 'D9', '藥', '山茱萸', 'A', 4009, 0.60, '4897012630211', '甘、酸，微溫', '歸肝、腎經。', '補益肝腎，收斂固澀', '', '');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (101, 'D10', '藥', '梔子(山梔子)', 'A', 4010, 0.30, '4897012630242', '苦，寒。', '心、肝、肺、胃、三焦經', '瀉火除煩，清熱利濕，涼血解毒，消腫止痛', '本品苦寒傷胃，脾虛便溏者不宜用', '煎服，3～10g。梔子皮（果皮）偏於達表而去肌膚之熱；梔子仁（種子）偏於走裡而清內熱。生用走氣分而瀉火；炒黑則入血分而止血。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (102, 'D11', '藥', '山藥(淮)', 'A', 4011, 0.15, '4897012630204', '甘，平。', '歸脾、肺、腎經。', '益氣養陰，補脾肺腎，固精止帶', '', '煎服，10～30g，大量60～250g。研末吞服，每次6～10g。補陰生津宜生用；健脾止瀉宜炒用。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (103, 'D12', '藥', '川牛膝', 'A', 4012, 0.30, '4897012630181', '苦、甘、酸，平', '歸肝、腎經。', '活血通經，補肝腎，強筋骨，利水通淋，引火（血）下行。', '孕婦及月經過多者忌用，腎虛滑精，脾虛溏泄者亦不宜用。', '煎服，6～15g。活血通經、利水通淋，引火下行宜生用，補肝腎強筋骨宜酒炙用。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (104, 'D13', '藥', '川芎', 'A', 4013, 0.60, '4897012630143', '辛，溫。', '歸肝、膽、心包經。', '活血行氣，祛風止痛', '凡陰虛火旺，多汗，及月經過多者，應慎用。', '煎服，3～10g');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (105, 'D14', '藥', '花椒(川花椒)', 'A', 4014, 0.30, '4897012630198', '辛，熱。', '歸脾、胃、腎經。', '溫中止痛，殺蟲，止癢。', '', '煎服，3～10g。外用適量');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (106, 'D15', '藥', '川楝子', 'A', 4015, 0.30, '4897012630167', '苦，寒。有小毒。', '歸肝、胃、小腸、膀胱經。', '行氣止痛，殺蟲療癬。', '本品有毒，不宜過量或持續服用。', '煎服，3～10g。外用適量。炒用寒性減低。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (107, 'D16', '藥', '五加皮', 'A', 4016, 0.20, '4897012630440', '辛、苦，溫。', '歸肝、腎經', '祛風濕，強筋骨，利尿', '', '煎服，5～15g');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (108, 'D17', '藥', '五味子', 'A', 4017, 0.60, '4897012630426', '酸，甘，溫。', '歸肺、心、腎經。', '斂肺滋腎，生津斂汗，澀精止瀉、寧心安神', '', '');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (109, 'D18', '藥', '元明粉(芒硝)', 'A', 4018, 0.60, '4897012630648', '鹹、苦，寒。', '歸胃、大腸經。', '瀉下，軟堅，清熱。', '孕婦及哺乳期婦女忌用或慎用。', '內服，10～15g，衝入藥汁內或開水溶化後服。外用適量。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (110, 'D19', '藥', '升麻', 'A', 4019, 0.30, '4897012630617', '辛、甘，微寒。', '歸肺、脾，胃、大腸經', '發表透疹，清熱解毒，升舉陽氣。', '本品麻疹已透，以及陰虛火旺，肝陽上亢、上盛下虛者，均當忌用', '煎服，3～10g。發表透疹解毒宜生用，升陽舉陷固脫宜製用');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (111, 'D20', '藥', '天冬', 'A', 4020, 0.60, '4897012630372', '甘、苦，寒。', '歸肺、腎經', '養陰潤燥，清火，生津', '', '煎服，10～15g。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (112, 'D21', '藥', '天麻', 'B', 4021, 0.30, '4897012630396', '甘，平。', '歸肝經', '息風止痙，平抑肝陽，袪風通絡。', '', '3～10克，煎服。1～1.5克，研末沖服');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (113, 'D22', '藥', '太子參', 'A', 4022, 0.60, '4897012630662', '甘、微苦，平', '脾、肺', '益氣健脾，生津潤肺。用於脾虛體倦，食欲不振，病後虛弱，氣陰不足，自汗口渴，肺燥干咳。', '', '9～30g');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (114, 'D23', '藥', '巴戟天', 'A', 4023, 0.60, '4897012630594', '甘、辛，微溫，', '歸腎、肝經', '補腎陽，強筋骨，祛風濕。', '', '煎服，10～15g。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (115, 'D24', '藥', '木香', 'A', 4024, 0.60, '4897012630518', '辛、苦，溫。', '歸脾、胃、大腸、膽、三焦經。', '行氣止痛', '', '煎服，3～10g。生用行氣力強，煨用行氣力緩而多用於止瀉。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (116, 'D25', '藥', '木賊', 'A', 4025, 0.30, '4897012630532', '甘、苦，平。', '歸肺、肝經', '疏散風熱，明目退翳', '', '3～10克。煎服');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (117, 'D26', '藥', '火麻仁', 'A', 4026, 0.30, '4897012630631', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (118, 'D27', '藥', '牛蒡子', 'A', 4027, 0.30, '4897012630464', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (119, 'D28', '藥', '王不留行', 'A', 4028, 0.20, '4897012630600', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (120, 'D29', '藥', '丹參', 'A', 4029, 0.60, '4897012630570', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (121, 'D30', '藥', '仙鶴草', 'A', 4030, 0.30, '4897012630877', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (122, 'D31', '藥', '冬葵子', 'A', 4031, 0.30, '4897012634189', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (123, 'D32', '藥', '半枝蓮', 'A', 4032, 0.30, '4897012631089', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (124, 'D33', '藥', '半夏(法)', 'B', 4033, 0.30, '4897012631072', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (125, 'D34', '藥', '玄參', 'A', 4034, 0.60, '4897012630914', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (126, 'D35', '藥', '生甘草', 'A', 4035, 0.30, '4897012630952', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (127, 'D36', '藥', '生地黃', 'A', 4036, 0.60, '4897012630938', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (128, 'D37', '藥', '生薑', 'A', 4037, 0.30, '4897012630945', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (129, 'D38', '藥', '田七', 'B', 4038, 0.60, '4897012631119', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (130, 'D39', '藥', '白朮', 'A', 4039, 0.60, '4897012630686', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (131, 'D40', '藥', '白芍', 'A', 4040, 0.30, '4897012630853', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (132, 'D41', '藥', '白芨', 'A', 4041, 0.30, '4897012630761', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (133, 'D42', '藥', '白芥子', 'A', 4042, 0.30, '4897012630808', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (134, 'D43', '藥', '白花蛇', 'B', 4043, 0.60, '4897012630730', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (135, 'D44', '藥', '白花蛇舌草', 'A', 4044, 0.30, '4897012630723', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (136, 'D45', '藥', '白芷', 'A', 4045, 0.30, '4897012630693', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (137, 'D46', '藥', '白附子(製)', 'A', 4046, 0.30, '4897012630792', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (138, 'D47', '藥', '白果', 'A', 4047, 0.30, '4897012630846', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (139, 'D48', '藥', '白茅根', 'A', 4048, 0.30, '4897012630754', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (140, 'D49', '藥', '白扁豆', 'A', 4049, 0.30, '4897012630785', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (141, 'D50', '藥', '白蘚皮', 'A', 4050, 0.30, '4897012630709', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (142, 'D51', '藥', '石菖蒲', 'A', 4051, 0.30, '4897012630983', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (143, 'D52', '藥', '艾葉', 'A', 4052, 0.30, '4897012631287', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (144, 'D53', '藥', '北沙參', 'A', 4053, 0.60, '4897012630921', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (145, 'D54', '藥', '全蠍', 'C', 4054, 0.60, '4897012631270', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (146, 'D55', '藥', '地榆', 'A', 4055, 0.60, '4897012631164', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (147, 'D56', '藥', '地膚子', 'A', 4056, 0.30, '4897012631171', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (148, 'D57', '藥', '延胡索(醋)', 'A', 4057, 0.30, '4897012630907', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (149, 'D58', '藥', '百合', 'A', 4058, 0.30, '4897012631232', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (150, 'D59', '藥', '百部', 'A', 4059, 0.60, '4897012631225', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (151, 'D60', '藥', '竹茹', 'A', 4060, 0.15, '4897012631249', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (152, 'D61', '藥', '淡竹葉', 'A', 4061, 0.20, '4897012632734', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (153, 'D62', '藥', '肉桂', 'A', 4062, 0.60, '4897012631218', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (154, 'D63', '藥', '肉蓯蓉', 'A', 4063, 0.60, '4897012631195', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (155, 'D64', '藥', '防風', 'A', 4064, 0.30, '4897012631485', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (156, 'D65', '藥', '何首烏(製)', 'A', 4065, 0.30, '4897012631515', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (157, 'D66', '藥', '佛手', 'A', 4066, 0.30, '4897012631584', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (158, 'D67', '藥', '枇杷葉', 'A', 4067, 0.20, '4897012631683', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (159, 'D68', '藥', '杏仁(苦)', 'A', 4068, 0.30, '4897012631461', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (160, 'D69', '藥', '杜仲', 'A', 4069, 0.30, '4897012631423', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (161, 'D70', '藥', '決明子', 'A', 4070, 0.20, '4897012631508', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (162, 'D71', '藥', '沒藥(煅)', 'A', 4071, 0.60, '4897012631430', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (163, 'D72', '藥', '牡丹皮', 'A', 4072, 0.30, '4897012631379', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (164, 'D73', '藥', '牡蠣', 'A', 4073, 0.15, '4897012631386', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (165, 'D74', '藥', '皂角刺', 'A', 4074, 0.30, '4897012631348', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (166, 'D75', '藥', '羌活', 'A', 4075, 0.60, '4897012631799', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (167, 'D76', '藥', '赤小豆', 'A', 4076, 0.30, '4897012631416', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (169, 'D78', '藥', '赤芍', 'A', 4078, 0.30, '4897012631393', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (170, 'D79', '藥', '辛荑(辛荑花)', 'A', 4079, 0.30, '4897012631478', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (171, 'D80', '藥', '阿膠', 'B', 4080, 0.60, '4897012631690', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (172, 'D81', '藥', '車前子', 'A', 4081, 0.30, '4897012631355', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (173, 'D82', '藥', '沉香', 'C', 4082, 0.60, '4897012631560', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (174, 'D83', '藥', '乳香(煅)', 'A', 4083, 0.60, '4897012631843', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (175, 'D84', '藥', '佩蘭', 'A', 4084, 0.30, '4897012631751', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (176, 'D85', '藥', '夜交藤', 'A', 4085, 0.20, '4897012631713', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (177, 'D86', '藥', '昆布', 'A', 4086, 0.60, '4897012631706', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (178, 'D87', '藥', '杭菊花', 'A', 4087, 0.60, '4897012631805', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (179, 'D88', '藥', '板藍根', 'A', 4088, 0.30, '4897012631775', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (180, 'D89', '藥', '苦參', 'A', 4089, 0.20, '4897012631966', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (181, 'D90', '藥', '青皮', 'A', 4090, 0.30, '4897012631645', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (182, 'D91', '藥', '青葙子', 'A', 4091, 0.30, '4897012631652', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (183, 'D92', '藥', '金銀花', 'A', 4092, 0.30, '4897012631591', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (184, 'D93', '藥', '炙麻黃', 'A', 4093, 0.30, '4897012631737', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (185, 'D94', '藥', '刺蒺藜', 'A', 4094, 0.20, '4897012631829', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (186, 'D95', '藥', '前胡', 'A', 4095, 0.60, '4897012632031', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (187, 'D96', '藥', '厚樸', 'A', 4096, 0.20, '4897012632048', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (188, 'D97', '藥', '威靈仙', 'A', 4097, 0.30, '4897012632093', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (189, 'D98', '藥', '枳殼', 'A', 4098, 0.30, '4897012631928', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (190, 'D99', '藥', '枳實', 'A', 4099, 0.30, '4897012631911', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (191, 'D100', '藥', '枸杞子', 'A', 4100, 0.60, '4897012631997', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (311, NULL, '針', '八邪', 'A', 5001, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (312, NULL, '針', '三皇', 'A', 5002, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (313, NULL, '針', '三陰交', 'A', 5003, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (314, NULL, '針', '三焦俞', 'A', 5004, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (315, NULL, '針', '大陵', 'A', 5005, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (316, NULL, '針', '大腸俞', 'A', 5006, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (317, NULL, '針', '五虎一', 'A', 5007, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (318, NULL, '針', '內關', 'A', 5008, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (319, NULL, '針', '天井', 'A', 5009, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (320, NULL, '針', '天溪', 'A', 5010, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (321, NULL, '針', '太沖', 'A', 5011, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (322, NULL, '針', '太溪', 'A', 5012, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (323, NULL, '針', '巨骨', 'A', 5013, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (324, NULL, '針', '手三里', 'A', 5014, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (325, NULL, '針', '手足對應點', 'A', 5015, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (326, NULL, '針', '右三陰交', 'A', 5016, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (327, NULL, '針', '右中渚', 'A', 5017, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (328, NULL, '針', '右內關', 'A', 5018, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (329, NULL, '針', '右少海', 'A', 5019, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (330, NULL, '針', '右合谷', 'A', 5020, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (331, NULL, '針', '右完骨', 'A', 5021, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (332, NULL, '針', '右束骨', 'A', 5022, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (333, NULL, '針', '右肩堣', 'A', 5023, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (334, NULL, '針', '右後溪', 'A', 5024, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (335, NULL, '針', '右陽陵泉', 'A', 5025, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (336, NULL, '針', '外勞宮', 'A', 5026, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (337, NULL, '針', '外關', 'A', 5027, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (338, NULL, '針', '左內關', 'A', 5028, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (339, NULL, '針', '左太溪', 'A', 5029, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (340, NULL, '針', '左少海', 'A', 5030, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (341, NULL, '針', '左肩寥', 'A', 5031, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (342, NULL, '針', '左後溪', 'A', 5032, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (343, NULL, '針', '左陰靈泉', 'A', 5033, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (344, NULL, '針', '左魚際', 'A', 5034, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (345, NULL, '針', '左腰痛穴', 'A', 5035, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (346, NULL, '針', '左頸項穴', 'A', 5036, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (347, NULL, '針', '合谷', 'A', 5037, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (348, NULL, '針', '曲池', 'A', 5038, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (349, NULL, '針', '次髎', 'A', 5039, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (350, NULL, '針', '百會', 'A', 5040, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (351, NULL, '針', '血海', 'A', 5041, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (352, NULL, '針', '夾脊', 'A', 5042, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (353, NULL, '針', '足三里', 'A', 5043, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (354, NULL, '針', '足內外側反應點', 'A', 5044, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (355, NULL, '針', '邱墟', 'A', 5045, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (356, NULL, '針', '阿是', 'A', 5046, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (357, NULL, '針', '命門', 'A', 5047, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (358, NULL, '針', '委中', 'A', 5048, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (359, NULL, '針', '居髎', 'A', 5049, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (360, NULL, '針', '承山', 'A', 5050, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (361, NULL, '針', '承扶', 'A', 5051, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (362, NULL, '針', '肩髃', 'A', 5052, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (363, NULL, '針', '後溪', 'A', 5053, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (364, NULL, '針', '指縫', 'A', 5054, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (365, NULL, '針', '風池', 'A', 5055, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (366, NULL, '針', '殷門', 'A', 5056, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (367, NULL, '針', '涌泉', 'A', 5057, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (368, NULL, '針', '秩邊', 'A', 5058, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (369, NULL, '針', '陰棱泉', 'A', 5059, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (370, NULL, '針', '陽陵泉', 'A', 5060, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (371, NULL, '針', '魚際', 'A', 5061, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (372, NULL, '針', '梁丘', 'A', 5062, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (373, NULL, '針', '脾俞', 'A', 5063, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (374, NULL, '針', '腎俞', 'A', 5064, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (375, NULL, '針', '勞宮反應點', 'A', 5065, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (376, NULL, '針', '復溜', 'A', 5066, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (377, NULL, '針', '解溪', 'A', 5067, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (378, NULL, '針', '環跳', 'A', 5068, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (379, NULL, '針', '臂臑', 'A', 5069, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (380, NULL, '針', '豐隆', 'A', 5070, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (381, NULL, '針', '雙三陰交', 'A', 5071, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (382, NULL, '針', '雙太溪', 'A', 5072, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (383, NULL, '針', '雙地機', 'A', 5073, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (384, NULL, '針', '雙曲池', 'A', 5074, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (385, NULL, '針', '雙肩貞', 'A', 5075, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (386, NULL, '針', '雙肺門', 'A', 5076, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (387, NULL, '針', '雙前庭', 'A', 5077, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (388, NULL, '針', '雙風池', 'A', 5078, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (389, NULL, '針', '雙秩邊', 'A', 5079, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (390, NULL, '針', '雙陰陵泉', 'A', 5080, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (391, NULL, '針', '雙陷谷', 'A', 5081, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (392, NULL, '針', '雙陵泉', 'A', 5082, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (393, NULL, '針', '雙脾俞', 'A', 5083, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (394, NULL, '針', '雙腎俞', 'A', 5084, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (395, NULL, '針', '雙鳳池', 'A', 5085, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (396, NULL, '針', '雙衝陽', 'A', 5086, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (397, NULL, '針', '關元俞', 'A', 5087, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (398, NULL, '針', '顳三針', 'A', 5088, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (19, 'F18', '方', '半夏瀉心湯', 'A', 2018, 7.00, '4897012638286', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (1, 'W1', '丸', '冬蟲草(菌粉)', 'D', 1001, NULL, NULL, '甘，平', '肺、腎經', '益腎壯陽，補肺平喘，止血化痰', '', '煎湯或燉服，5～10g。');
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (20, 'F19', '方', '四君子湯', 'A', 2019, 6.00, '4897012638187', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (21, 'F20', '方', '四妙丸', 'A', 2020, 6.00, '4897012635148', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (22, 'F21', '方', '四物湯', 'A', 2021, 6.00, '4897012638194', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (23, 'F22', '方', '四逆散', 'A', 2022, 3.00, '4897012638200', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (24, 'F23', '方', '四逆湯', 'A', 2023, 3.00, '4897012635155', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (25, 'F24', '方', '失笑散', 'A', 2024, 2.00, '4897012636695', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (26, 'F25', '方', '平胃散', 'A', 2025, 6.00, '4897012638590', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (192, 'D101', '藥', '柏子仁', 'A', 4101, 0.30, '4897012632000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (193, 'D102', '藥', '珍珠母', 'A', 4102, 0.15, '4897012632598', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (194, 'D103', '藥', '砂仁', 'A', 4103, 0.30, '4897012632062', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (195, 'D104', '藥', '紅花', 'A', 4104, 0.60, '4897012632116', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (196, 'D105', '藥', '紅景天', 'A', 4105, 0.30, '4897012634011', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (197, 'D106', '藥', '茯苓', 'A', 4106, 0.15, '4897012632345', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (198, 'D107', '藥', '茵陳蒿', 'A', 4107, 0.30, '4897012632475', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (199, 'D108', '藥', '荊芥', 'A', 4108, 0.30, '4897012632529', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (200, 'D109', '藥', '荔枝核', 'A', 4109, 0.20, '4897012632550', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (201, 'D110', '藥', '香附(醋)', 'A', 4110, 0.30, '4897012631980', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (202, 'D111', '藥', '骨碎補', 'A', 4111, 0.30, '4897012632604', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (203, 'D112', '藥', '神曲', 'A', 4112, 0.30, '4897012632499', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (204, 'D113', '藥', '夏枯草', 'A', 4113, 0.30, '4897012632512', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (205, 'D114', '藥', '射干', 'A', 4114, 0.30, '4897012632567', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (206, 'D115', '藥', '徐長卿', 'A', 4115, 0.30, '4897012632307', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (207, 'D116', '藥', '柴胡', 'A', 4116, 0.30, '4897012632543', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (208, 'D117', '藥', '栝蔞仁', 'A', 4117, 0.20, '4897012631881', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (209, 'D118', '藥', '栝蔞根(天花粉)', 'A', 4118, 0.20, '4897012631867', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (210, 'D119', '藥', '桂枝', 'A', 4119, 0.30, '4897012632161', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (211, 'D120', '藥', '桃仁', 'A', 4120, 0.30, '4897012632505', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (212, 'D121', '藥', '桑白皮', 'A', 4121, 0.30, '4897012632185', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (213, 'D122', '藥', '桑枝', 'A', 4122, 0.20, '4897012632208', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (214, 'D123', '藥', '桑寄生', 'A', 4123, 0.30, '4897012632178', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (215, 'D124', '藥', '桑葉', 'A', 4124, 0.30, '4897012632192', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (216, 'D125', '藥', '桑椹子', 'A', 4125, 0.60, '4897012632215', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (217, 'D126', '藥', '桔梗', 'A', 4126, 0.60, '4897012632482', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (218, 'D127', '藥', '浙貝母', 'A', 4127, 0.30, '4897012632932', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (219, 'D128', '藥', '浮萍', 'A', 4128, 0.30, '4897012632420', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (220, 'D129', '藥', '海桐皮', 'A', 4129, 0.30, '4897012632260', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (221, 'D130', '藥', '海蛤殼', 'A', 4130, 0.15, '4897012632246', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (222, 'D131', '藥', '烏梅', 'A', 4131, 0.60, '4897012632376', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (223, 'D132', '藥', '烏藥', 'A', 4132, 0.30, '4897012632369', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (224, 'D133', '藥', '秦艽', 'A', 4133, 0.60, '4897012632451', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (225, 'D134', '藥', '莪朮', 'A', 4134, 0.20, '4897012632857', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (226, 'D135', '藥', '透骨草', 'A', 4135, 0.30, '4897012634097', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (227, 'D136', '藥', '通草', 'A', 4136, 0.15, '4897012632758', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (228, 'D137', '藥', '陳皮', 'A', 4137, 0.30, '4897012632864', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (229, 'D138', '藥', '馬勃', 'A', 4138, 0.30, '4897012632314', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (230, 'D139', '藥', '馬齒莧', 'A', 4139, 0.30, '4897012632291', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (231, 'D140', '藥', '連翹', 'A', 4140, 0.30, '4897012632840', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (232, 'D141', '藥', '益母草', 'A', 4141, 0.20, '4897012632390', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (233, 'D142', '藥', '乾薑', 'A', 4142, 0.30, '4897012632802', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (234, 'D143', '藥', '側柏葉', 'A', 4143, 0.30, '4897012632949', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (235, 'D144', '藥', '敗醬草', 'A', 4144, 0.30, '4897012632925', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (236, 'D145', '藥', '淡豆豉', 'A', 4145, 0.30, '4897012632741', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (237, 'D146', '藥', '淫羊藿', 'A', 4146, 0.30, '4897012632826', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (238, 'D147', '藥', '細辛', 'A', 4147, 0.30, '4897012632727', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (239, 'D148', '藥', '菟絲子', 'A', 4148, 0.60, '4897012633274', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (240, 'D149', '藥', '粉萆薢(川萆薢)', 'A', 4149, 0.30, '4897012633250', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (241, 'D150', '藥', '萊菔子(炒)', 'A', 4150, 0.30, '4897012633137', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (242, 'D151', '藥', '蛇床子', 'A', 4151, 0.30, '4897012632789', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (243, 'D152', '藥', '貫眾', 'A', 4152, 0.30, '4897012632833', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (244, 'D153', '藥', '魚腥草', 'A', 4153, 0.30, '4897012632888', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (245, 'D154', '藥', '麥門冬', 'A', 4154, 0.60, '4897012632765', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (246, 'D155', '藥', '鹿角膠', 'B', 4155, 0.60, '4897012634066', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (30, 'F29', '方', '白虎湯', 'A', 2029, 6.00, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (168, 'D77', '藥', '赤石脂', 'A', 4077, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (248, 'D157', '藥', '楮實子', 'A', 4157, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (247, 'D156', '藥', '寒水石', 'A', 4156, 0.60, '4897012634172', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (249, 'D158', '藥', '款冬花', 'A', 4158, 0.60, '4897012632697', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (250, 'D159', '藥', '番瀉葉', 'A', 4159, 0.60, '4897012633106', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (251, 'D160', '藥', '粟米鬚', 'A', 4160, 0.20, '4897012633151', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (252, 'D161', '藥', '紫河車', 'D', 4161, 0.60, '4897012633090', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (253, 'D162', '藥', '紫草根', 'A', 4162, 0.30, '4897012633083', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (254, 'D163', '藥', '紫菀', 'A', 4163, 0.60, '4897012633076', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (255, 'D164', '藥', '紫蘇子', 'A', 4164, 0.20, '4897012633069', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (256, 'D165', '藥', '紫蘇葉', 'A', 4165, 0.30, '4897012633045', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (257, 'D166', '藥', '絲瓜絡', 'A', 4166, 0.20, '4897012633175', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (258, 'D167', '藥', '葛根', 'A', 4167, 0.20, '4897012633212', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (259, 'D168', '藥', '葶藶子', 'A', 4168, 0.20, '4897012633434', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (260, 'D169', '藥', '補骨脂', 'A', 4169, 0.30, '4897012633243', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (261, 'D170', '藥', '鈎藤', 'A', 4170, 0.20, '4897012633144', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (262, 'D171', '藥', '黃芩', 'A', 4171, 0.30, '4897012632994', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (263, 'D172', '藥', '黃柏', 'A', 4172, 0.30, '4897012633007', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (264, 'D173', '藥', '黃連', 'A', 4173, 0.30, '4897012632987', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (265, 'D174', '藥', '黃蓍', 'A', 4174, 0.60, '4897012633014', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (266, 'D175', '藥', '黃精', 'A', 4175, 0.60, '4897012633021', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (267, 'D176', '藥', '黑荊芥', 'A', 4176, 0.30, '4897012632659', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (268, 'D177', '藥', '槐花', 'A', 4177, 0.30, '4897012633373', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (269, 'D178', '藥', '當歸', 'A', 4178, 0.60, '4897012633199', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (270, 'D179', '藥', '蒲公英', 'A', 4179, 0.30, '4897012633366', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (271, 'D180', '藥', '蒼朮', 'A', 4180, 0.60, '4897012633335', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (272, 'D181', '藥', '蜈蚣', 'B', 4181, NULL, '4897012633328', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (273, 'D182', '藥', '遠志', 'A', 4182, 0.30, '4897012633427', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (274, 'D183', '藥', '滑石', 'A', 4183, 0.15, '4897012633267', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (275, 'D184', '藥', '路路通', 'A', 4184, 0.20, '4897012633311', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (276, 'D185', '藥', '寬筋藤', 'A', 4185, 0.20, '4897012633441', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (277, 'D186', '藥', '磁石(煅)', 'A', 4186, 0.15, '4897012632147', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (278, 'D187', '藥', '蔓荊子', 'A', 4187, 0.30, '4897012633526', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (279, 'D188', '藥', '蘆根', 'A', 4188, 0.20, '4897012633878', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (280, 'D189', '藥', '豨簽草', 'A', 4189, 0.30, '4897012633403', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (281, 'D190', '藥', '蓮子心', 'A', 4190, 0.30, '4897012633519', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (282, 'D191', '藥', '荷葉(蓮葉)', 'A', 4191, 0.20, '4897012633496', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (283, 'D192', '藥', '熟地黃', 'A', 4192, 0.60, '4897012633588', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (284, 'D193', '藥', '熟附子', 'A', 4193, 0.30, '4897012633595', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (285, 'D194', '藥', '澤瀉', 'A', 4194, 0.30, '4897012633557', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (286, 'D195', '藥', '澤蘭', 'A', 4195, 0.30, '4897012633540', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (287, 'D196', '藥', '獨活', 'A', 4196, 0.30, '4897012633625', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (288, 'D197', '藥', '薄荷葉', 'A', 4197, 0.30, '4897012633700', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (289, 'D198', '藥', '薏苡仁', 'A', 4198, 0.20, '4897012633717', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (290, 'D199', '藥', '薑黃', 'A', 4199, 0.20, '4897012633724', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (291, 'D200', '藥', '薤白', 'A', 4200, 0.60, '4897012633755', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (292, 'D201', '藥', '檀香', 'B', 4201, 0.20, '4897012633731', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (293, 'D202', '藥', '殭蠶', 'A', 4202, 0.60, '4897012630716', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (294, 'D203', '藥', '藁本', 'A', 4203, 0.30, '4897012633786', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (295, 'D204', '藥', '龜甲(炙龜板)', 'A', 4204, 0.30, '4897012633618', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (296, 'D205', '藥', '龍骨', 'A', 4205, 0.15, '4897012633649', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (297, 'D206', '藥', '龍齒', 'A', 4206, 0.15, '4897012633656', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (298, 'D207', '藥', '蟬蛻', 'A', 4207, 0.30, '4897012633458', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (299, 'D208', '藥', '覆盆子', 'A', 4208, 0.30, '4897012633793', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (300, 'D209', '藥', '雞血藤', 'A', 4209, 0.30, '4897012633922', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (301, 'D210', '藥', '鵝不食草', 'A', 4210, 0.30, '4897012633779', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (302, 'D211', '藥', '藿香', 'A', 4211, 0.30, '4897012633861', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (303, 'D212', '藥', '蘇木', 'A', 4212, 0.20, '4897012633854', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (304, 'D213', '藥', '黨參', 'A', 4213, 0.60, '4897012633830', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (305, 'D214', '藥', '續斷', 'A', 4214, 0.60, '4897012633908', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (306, 'D215', '藥', '蜂房(露蜂房)', 'A', 4215, 0.60, '4897012633953', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (307, 'D216', '藥', '郁李仁', 'A', 4216, 0.60, '4897012632024', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (308, 'D217', '藥', '鬱金', 'A', 4217, 0.20, '4897012632017', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (309, 'D218', '藥', '海螵蛸', 'A', 4218, 0.15, '4897012632253', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage) VALUES (310, 'D219', '藥', '茜草根', 'A', 4219, 0.30, '4897012632574', NULL, NULL, NULL, NULL, NULL);


INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (293, 'coldhot', 0, '寒熱');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (294, 'sweat', 0, '汗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (295, 'head', 0, '頭');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (296, 'month', 0, '口');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (297, 'body', 0, '身');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (298, 'poo', 0, '大便');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (299, 'vee', 0, '小便');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (300, 'drink', 0, '渴');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (301, 'eat', 0, '飲食');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (302, 'abdomen', 0, '胸腹');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (303, 'hearing', 0, '耳目');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (304, 'menstuation', 0, '經期');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (305, 'sleep', 0, '睡眠');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (306, 'tongue', 0, '舌');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (307, 'pulse', 0, '脈');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (308, '寒熱', 1, '發熱重畏寒輕');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (309, '寒熱', 1, '畏寒重發熱輕');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (310, '寒熱', 1, '但熱不寒');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (311, '寒熱', 1, '但寒不熱,得溫則舒');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (312, '寒熱', 1, '寒熱往來');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (313, '寒熱', 1, '發熱惡風寒,手背熱於手心');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (314, '寒熱', 1, '午後潮熱或五心煩熱');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (315, '寒熱', 1, '夜間發熱,天亮即退');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (316, '寒熱', 1, '怕冷,手足涼');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (317, '汗', 1, '表証有汗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (318, '汗', 1, '表証無汗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (319, '汗', 1, '睡時出汗醒後汗止');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (320, '汗', 1, '醒時出汗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (321, '汗', 1, '頭熱大汗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (322, '汗', 1, '危証冷汗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (323, '汗', 1, '戰汗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (324, '汗', 1, '半身出汗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (325, '汗', 1, '手足心汗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (326, '頭', 1, '頭痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (327, '頭痛', 2, '前頭部連眉棱骨痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (328, '頭痛', 2, '側頭部連太陽穴');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (329, '頭痛', 2, '後頭部連項');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (330, '頭痛', 2, '巔頂痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (331, '頭痛', 2, '連齿');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (332, '頭痛', 2, '連項,遇風加重');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (333, '頭痛', 2, '咽痛,惡熱');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (334, '頭痛', 2, '如裏');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (335, '頭痛', 2, '綿綿,過勞則甚');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (336, '頭', 1, '頭暈');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (337, '頭暈', 2, '目眩,過勞則甚');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (338, '頭暈', 2, '脹痛,口苦');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (339, '頭暈', 2, '耳鳴,腰酸');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (340, '頭暈', 2, '目花,頭身麻木');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (341, '頭暈', 2, '沉重,形胖多痰');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (342, '頭暈', 2, '乏力,氣短');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (343, '耳目', 1, '耳鳴暴起,手按聲劇');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (344, '耳目', 1, '耳鳴如蟬,心悸頭暈');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (345, '耳目', 1, '耳鳴如潮,口苦脇痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (346, '耳目', 1, '漸覺耳鳴,手按聲喊');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (347, '耳目', 1, '一時性耳鳴');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (348, '耳目', 1, '視物昏花');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (349, '耳目', 1, '兩目紅痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (350, '身', 1, '暴然身痛,伴表証');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (351, '身', 1, '周身疼痛,乏力少氣');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (352, '身', 1, '周身疼痛串走');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (353, '身', 1, '產後身痛無表証');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (354, '身', 1, '關節游走性疼痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (355, '身', 1, '關節痛處不移');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (356, '身', 1, '關節劇痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (357, '身', 1, '關節紅腫熱痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (358, '大便', 1, '干結,數日不解,或潮熱,口渴,腹滿');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (359, '大便', 1, '病后產後老年便秘');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (360, '大便', 1, '解時困難,但不乾燥');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (361, '大便', 1, '羊屎便');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (362, '大便', 1, '便瀉如噴射狀,泄時肛熱便臭');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (363, '大便', 1, '大便稀溏');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (364, '大便', 1, '腹痛即瀉');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (365, '大便', 1, '天亮前瀉');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (366, '大便', 1, '大便色黑');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (367, '大便', 1, '大便下血');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (368, '小便', 1, '小便短赤');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (369, '小便', 1, '小便短赤,兼有尿急,尿頻,尿痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (370, '小便', 1, '小便清長');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (371, '小便', 1, '小便短少,清白');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (372, '小便', 1, '小便短少,水腫臌脹');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (373, '小便', 1, '尿頻清,小腹發墜而涼');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (374, '小便', 1, '夜多小便或遺尿');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (375, '胸腹', 1, '胸脇');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (376, '胸腹', 1, '胃脘');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (377, '胸腹', 1, '腹部');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (378, '胸腹', 1, '腰部');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (379, '胸脇', 2, '胸痛憋悶,痛引肩臂');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (380, '胸脇', 2, '胸背彻痛,面青,手足青至節');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (381, '胸脇', 2, '胸痛,發熱,咳吐膿血痰');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (382, '胸脇', 2, '脇痛,脇間飽滿,咳唾引痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (383, '胸脇', 2, '胸脇苦滿,往來寒熱');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (384, '胸脇', 2, '脇脹串痛,易怒善太息');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (385, '胸脇', 2, '胸脇刺痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (386, '胃脘', 2, '胃脘痛劇,得熱則滅');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (387, '胃脘', 2, '胃脘灼痛,口臭便秘');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (388, '胃脘', 2, '胃脘脹痛,暖氣易怒');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (389, '胃脘', 2, '胃脘隐痛,喜喛喜按');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (390, '胃脘', 2, '胃脘嘈雜,喛氣酸腐');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (391, '腹部', 2, '大腹隐痛,喜溫便溏');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (392, '腹部', 2, '小腹脹痛,小便不利');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (393, '腹部', 2, '小腹刺痛,小便自利');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (394, '腹部', 2, '小腹泛痛,痛引陰部');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (395, '腹部', 2, '繞臍痛,痛起包块');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (396, '腹部', 2, '右下腹劇痛,拒按');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (397, '腰部', 2, '腰痛綿綿,得卧則減');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (398, '腰部', 2, '腰部酸痛,便干溲赤');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (399, '腰部', 2, '腰沉冷痛,陰雨天甚');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (400, '腰部', 2, '腰痛如錐刺,痛處不移');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (401, '飲食', 1, '病中飲食如常');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (402, '飲食', 1, '不欲飲食,喛腐吞酸,便乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (403, '飲食', 1, '多食善飢,形體反瘦');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (404, '飲食', 1, '能食,食後脘脹');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (405, '飲食', 1, '納食不香,食後能消化');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (406, '飲食', 1, '嗜好偏食');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (407, '飲食', 1, '高熱後不欲飲食');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (408, '飲食', 1, '病中食欲漸佳');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (409, '飲食', 1, '病中食欲漸減');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (410, '口', 1, '口味');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (411, '口味', 2, '口苦');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (412, '口味', 2, '口甜');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (413, '口味', 2, '口酸');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (414, '口味', 2, '口咸');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (415, '口味', 2, '口淡無味');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (416, '口味', 2, '口淡黏膩');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (417, '口味', 2, '口淡而吐清涎');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (418, '口', 1, '嘔吐');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (419, '嘔吐', 2, '嘔吐酸水');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (420, '嘔吐', 2, '嘔吐苦水');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (421, '嘔吐', 2, '嘔吐酸腐食臭');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (422, '嘔吐', 2, '食入即吐');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (423, '嘔吐', 2, '朝食暮吐,暮食朝吐');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (424, '渴', 1, '口渴引飲消水');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (425, '渴', 1, '口中和,不思飲');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (426, '渴', 1, '渴喜冷飲');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (427, '渴', 1, '渴喜熱飲');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (428, '渴', 1, '乾渴欲飲,但不能多次');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (429, '渴', 1, '渴不欲飲,飲後不舒');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (430, '睡眠', 1, '入睡難,心悸,健忘,乏力');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (431, '睡眠', 1, '失眠多夢,眩暈,頭痛,心煩');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (432, '睡眠', 1, '心煩易醒,面舌紅赤');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (433, '睡眠', 1, '失眠多夢,潮熱神恍腰酸');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (434, '睡眠', 1, '夜寐不安,喘氣,腹脹');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (435, '睡眠', 1, '食後困倦欲睡');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (436, '睡眠', 1, '病後好睡');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (437, '睡眠', 1, '嗜卧身重脉緩');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (438, '胸腹', 1, '呼吸');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (439, '呼吸', 2, '呼吸氣粗,聲音氣急');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (440, '呼吸', 2, '呼吸低微,聲低氣短');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (441, '呼吸', 2, '呼吸困難,張口抬肩');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (442, '呼吸', 2, '喉中有哮鳴音');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (443, '呼吸', 2, '氣息不利,長出一口氣為快');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (444, '口', 1, '咳嗽');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (445, '咳嗽', 2, '咳聲重濁');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (446, '咳嗽', 2, '咳聲無力,聲低氣怯');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (447, '咳嗽', 2, '咳有痰聲,喉頭痰响');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (448, '咳嗽', 2, '咳嗽陣發,作鷺鶯叫');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (449, '舌', 1, '舌色');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (450, '舌', 1, '舌形');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (451, '舌', 1, '舌態');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (452, '舌', 1, '舌苔');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (453, '舌色', 2, '淡白而滑');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (454, '舌色', 2, '淡白而乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (455, '舌色', 2, '淡白無苔');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (456, '舌色', 2, '鮮紅乾燥');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (457, '舌色', 2, '舌紅不甚乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (458, '舌色', 2, '絳舌');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (459, '舌色', 2, '絳紫舌');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (460, '舌色', 2, '青紫舌');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (461, '舌色', 2, '暗紫舌');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (462, '舌形', 2, '蒼老');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (463, '舌形', 2, '嬌嫩');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (464, '舌形', 2, '腫脹淡白');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (465, '舌形', 2, '腫脹紅赤');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (466, '舌形', 2, '腫脹紫赤發暗');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (467, '舌形', 2, '舌紅滿口而痛');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (468, '舌形', 2, '瘦薄淺淡');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (469, '舌形', 2, '瘦薄紅絳');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (470, '舌形', 2, '裂紋紅絳');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (471, '舌形', 2, '裂紋淡白');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (472, '舌形', 2, '芒刺舌边');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (473, '舌形', 2, '芒刺舌中');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (474, '舌態', 2, '痿軟久病舌淡');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (475, '舌態', 2, '痿軟新病舌乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (476, '舌態', 2, '痿軟舌紅絳');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (477, '舌態', 2, '强硬外感');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (478, '舌態', 2, '强硬染病');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (479, '舌態', 2, '震顫久病');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (480, '舌態', 2, '震顫外感');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (481, '舌態', 2, '短縮淡潤或兼青色');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (482, '舌態', 2, '短縮胖');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (483, '舌態', 2, '短縮淡紅而乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (484, '舌態', 2, '吐弄舌');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (485, '舌苔', 2, '薄白潤');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (486, '舌苔', 2, '薄白乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (487, '舌苔', 2, '白滑');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (488, '舌苔', 2, '厚白膩');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (489, '舌苔', 2, '厚白乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (490, '舌苔', 2, '薄黃潤');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (491, '舌苔', 2, '薄黃乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (492, '舌苔', 2, '黃厚乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (493, '舌苔', 2, '黃厚膩');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (494, '舌苔', 2, '灰而燥');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (495, '舌苔', 2, '灰而滑潤');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (496, '舌苔', 2, '灰黑乾燥');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (497, '舌苔', 2, '黑而乾');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (498, '舌苔', 2, '黑而潤');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (499, '口', 1, '語音');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (500, '語音', 2, '語音響亮,多言');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (501, '語音', 2, '語音低沉,斷續無力,少言');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (502, '語音', 2, '語音重濁');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (503, '語音', 2, '神昏,語無倫次,音粗壯');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (504, '語音', 2, '神志不清,呢喃呓語,短細聲');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (505, '語音', 2, '新病音啞');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (506, '語音', 2, '久病音啞');
INSERT INTO "Symptoms" ("symptomID", type, level, description) VALUES (507, '語音', 2, '妊娠音啞');

--web 20161108
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage, content) VALUES (10001, null, '艾', '艾', 'A', 10001, null, null, NULL, NULL, NULL, NULL, NULL, null);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage, content) VALUES (20001, null, '拔罐', '拔罐', 'A', 20001, null, null, NULL, NULL, NULL, NULL, NULL, null);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage, content) VALUES (30001, null, '手療', '手療', 'A', 30001, null, null, NULL, NULL, NULL, NULL, NULL, null);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage, content) VALUES (40001, null, '埋線', '埋線', 'A', 40001, null, null, NULL, NULL, NULL, NULL, NULL, null);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage, content) VALUES (50001, null, '溫針', '溫針', 'A', 50001, null, null, NULL, NULL, NULL, NULL, NULL, null);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage, content) VALUES (60001, null, '袪瘀', '袪瘀', 'A', 60001, null, null, NULL, NULL, NULL, NULL, NULL, null);
INSERT INTO "Medicine" ("ID", code, type, name, "priceCategory", "order", "referenceUnit", barcode, taste, meridian, effect, contraint, usage, content) VALUES (70001, null, '小兒推拿', '小兒推拿', 'A', 70001, null, null, NULL, NULL, NULL, NULL, NULL, null);

--web 20161125
INSERT INTO "PriceCategory" (category, weight) VALUES ('A', 1.00);
INSERT INTO "PriceCategory" (category, weight) VALUES ('B', 3.00);
INSERT INTO "PriceCategory" (category, weight) VALUES ('C', 5.00);
INSERT INTO "PriceCategory" (category, weight) VALUES ('D', 10.00);
INSERT INTO "PriceCategory" (category, weight) VALUES ('E', 15.00);

--web 20180820
INSERT INTO public.users(username, password, enabled) VALUES ('ziv', 'ziv2018', true);
INSERT INTO public.users(username, password, enabled) VALUES ('tilen', 'tilen2018', true);
INSERT INTO public.users(username, password, enabled) VALUES ('opa', 'abcd1234', true);

INSERT INTO public.user_roles(user_role_id, username, role)	VALUES (1, 'tilen', 'ROLE_ADMIN');
INSERT INTO public.user_roles(user_role_id, username, role)	VALUES (2, 'ziv', 'ROLE_DOC');
INSERT INTO public.user_roles(user_role_id, username, role)	VALUES (3, 'opa', 'ROLE_OPA');
	
INSERT INTO "PriceSystem"("system_id","name", "consultation_fee" , "per_dose_price", "extra_dose_fee", "dosage_limit" , "effective_date", enabled)
VALUES (1,'標準收費', 60, 70, 2, 30, '2018-01-01', true);
INSERT INTO "PriceSystem"("system_id","name", "consultation_fee" , "per_dose_price", "extra_dose_fee", "dosage_limit" , "effective_date", enabled)
VALUES (2,'新收費', 80, 90, 2, 30, '2018-08-01', true);

INSERT INTO "PriceList" (category, price, price2, system_id) VALUES ('艾', 300.00, NULL, 2);
INSERT INTO "PriceList" (category, price, price2, system_id) VALUES ('拔罐', 220.00, NULL, 2);
INSERT INTO "PriceList" (category, price, price2, system_id) VALUES ('埋線', 20.00, NULL, 2);
INSERT INTO "PriceList" (category, price, price2, system_id) VALUES ('手療', 220.00, NULL, 2);
INSERT INTO "PriceList" (category, price, price2, system_id) VALUES ('溫針', 360.00, NULL, 2);
INSERT INTO "PriceList" (category, price, price2, system_id) VALUES ('針', 320.00, NULL, 2);
INSERT INTO "PriceList" (category, price, price2, system_id) VALUES ('袪瘀', 360.00, NULL, 2);
INSERT INTO "PriceList" (category, price, price2, system_id) VALUES ('小兒推拿', 360.00, NULL, 2);


--web 20180824
UPDATE "Medicine" SET content = '何首烏30克  茯苓9克  牛膝9克  當歸9克  枸杞子9克  菟絲子9克  破故紙4克 (醫砭) 來源: 醫方集解', detail_en = 'Radix Polygoni Multiflori Preparata, Poria, Radix Achyranthis Bidentatae, Radix Angelicae Sinensis, Fructus Lycii, Semen Cuscutae & Fructus Psoraleae, etc.' , detail_ch='何首烏(八錢)  茯苓(二錢)  淮牛膝(二錢)  當歸(二錢)  枸杞子(二錢)  菟絲子(二錢)  補骨脂(一錢)' where code='F1';


UPDATE "Medicine" SET content = '羌活6克  防風6克  蒼朮6克  細辛2克  川芎3克  白芷3克  生地3克  黃芩3克  甘草3克 (醫砭) 來源: 此事難知', detail_en = 'Radix Saposhnikoviae, Pinelliae Rhizoma Praeparatum, Rhizoma Atractylodis, Herba Asari, Rhizoma Chuanxiong, Angelicae Dahuricae Radix, Radix Scutellariae, Glycyrrhizae Radix Et Rhizoma, Radix Rehmanniae, etc.' , detail_ch='防風(二錢)  羌活(二錢)  蒼朮(二錢)  細辛(一錢)  川芎(一錢)  白芷(一錢)  黃芩(一錢)  甘草(一錢)  地黃(一錢)' where code='F2';


UPDATE "Medicine" SET content = '女貞子15克  旱蓮草15克 (醫砭) 來源: 醫方集解', detail_en = 'Fructus Ligustri Lucidi, Herba Ecliptae, etc.' , detail_ch='女貞子(三錢)  旱蓮草(三錢)' where code='F3';


UPDATE "Medicine" SET content = '法半夏12克  橘紅12克  茯苓6克  炙甘草4克 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Pinelliae Rhizoma Praeparatum, Citri Reticulatae Pericarpium, Poria, Zingiberis Rhizoma Recens, Glycyrrhizae Radix Et Rhizoma Preparata Cum Melle, Mume Fructus, etc.' , detail_ch='法半夏(五錢)  陳皮(五錢)  茯苓(三錢)  生薑(三錢)  炙甘草(一錢半)  烏梅(一錢)' where code='F4';


UPDATE "Medicine" SET content = '柴胡15克  黃芩9克  法半夏9克  枳實9克  大黃6克  芍藥9克  生薑15克  大棗12枚 (醫砭) 來源: 傷寒卒病論', detail_en = 'Radix Bupleuri, Radix Scutellariae, Radix Paeoniae Rubra, Rhizoma Pinelliae Preparata, Fructus Aurantii Immaturus, Radix Et Rhizoma Rhei, Rhizoma Zingiberis Recens, Fructus Jujubae, etc.' , detail_ch='柴胡(三錢)  黃芩(三錢)  赤芍(三錢)  法半夏(三錢)  枳實(三錢)  大黃(三錢)  生薑(三錢)  大棗(三錢)' where code='F5';


UPDATE "Medicine" SET content = '桂枝9克  白芍18克  炙甘草9克  生薑9克  大棗12枚  飴糖30克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Radix Paeoniae Alba, Ramulus Cinnamomi, Rhizoma Zingiberis Recens, Fructus Jujubae, Maltose, Radix Glycyrrhizae Preparata, etc.' , detail_ch='白芍(六錢)  桂枝(三錢)  生薑(三錢)  大棗(三錢)  飴糖(三錢)  炙甘草(二錢)' where code='F6';


UPDATE "Medicine" SET content = '麻黃9克  桂枝9克  白芍9克  炙甘草9克  乾薑9克  細辛9克  法半夏9克  五味子9克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Herba Ephedrae, Ramulus Cinnamomi, Radix Paeoniae Alba, Pinelliae Rhizoma Praeparatum, Zingiberis Rhizoma, Herba Asari, Fructus Schisandrae, Glycyrrhizae Radix Et Rhizoma Preparata Cum Melle, etc.' , detail_ch='麻黃(三錢)  桂枝(三錢)  白芍(三錢)  法半夏(三錢)  乾薑(三錢)  細辛(二錢)  五味子(二錢)  炙甘草(二錢)  ' where code='F7';


UPDATE "Medicine" SET content = '柴胡24克  黃芩9克  人參9克  法半夏9克  甘草9克  生薑9克  大棗12枚 (醫砭) 來源: 傷寒卒病論', detail_en = 'Bupleuri Radix, Scutellariae Radix, Pinelliae Rhizoma Praeparatum, Zingiberis Rhizoma Recens, Codonopsis Radix, Glcyrrhizae Radix Et Rhizoma Praeparata Cim Melle, Jujubae Fructus, etc.' , detail_ch='柴胡15克  黃芩9克  法半夏9克  生薑9克  黨參6克  炙甘草6克  大棗擘6克' where code='F8';


UPDATE "Medicine" SET content = '薄荷240克  防風45克  細辛30克  羌活60克  白芷60克  炙甘草60克  川芎120克  荊芥穗120克 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Rhizoma Chuanxiong, Herba Schizonepetae, Menthae Haplocalycis Herba, Angelicae Dahuricae Radix, Rhizoma Et Radix Notopterygii, Glycyrrhizae Radix Et Rhizoma, Radix Saposhnikoviae, Herba Asar, Folium Gemmae Camelliae Sinensis, etc.' , detail_ch='川芎(四錢)  荊芥(四錢)  薄荷葉(四錢)  白芷(二錢)  羌活(二錢)  甘草(二錢)  防風(一錢半)  細辛(一錢)  茶葉(三錢)' where code='F9';


UPDATE "Medicine" SET content = '豬苓9克  澤瀉15克  白朮9克  茯苓9克  桂枝6克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Alismatis Rhizoma, Polyporus, Atractylodis Macrocephalae Rhizoma, Poria, Cinnamomi Ramulus, etc.' , detail_ch='澤瀉15克  豬苓9克  白朮9克  茯苓9克  桂枝3克' where code='F10';


UPDATE "Medicine" SET content = '天冬30克  人參15克  茯苓15克  玄參15克  丹參15克  遠志15克  桔梗15克  當歸30克  五味子30克  麥冬30克  柏子仁30克  酸棗仁30克  生地120克 (醫砭) 來源: 攝生秘剖', detail_en = 'Radix Rehmanniae, Ziziphi Spinosae Semen, Semen Platycladi, Radix Angelicae Sinensis, Radix Asparagi, Radix Ophiopogonis, Radix Codonopsis, Radix Salviae Miltiorrhizae, Radix Scrophulariae, Poria, Fructus Schisandrae, Radix Polygalae, Radix Platycodi, Longan Arillus, etc.' , detail_ch='地黃(四錢)  酸棗仁(二錢)  柏子仁(二錢)  當歸(二錢)  天冬(二錢)  麥冬(二錢)  黨參(一錢)  丹參(一錢)  玄參(一錢)  茯苓(一錢)  五味子(一錢)  遠志(一錢)  桔梗(一錢)  龍眼肉(一錢)' where code='F11';


UPDATE "Medicine" SET content = '天麻6克  鈎藤9克  牛膝12克  石決明15克  杜仲12克  黃芩6克  梔子6克  益母草9克  桑寄生9克  夜交藤9克  茯神9克 (醫砭) 來源: 雜病證治新義', detail_en = 'Concha Haliotidis, Radix Cyathulae, Ramulus Uncariae Cum Uncis, Rhizoma Gastrodiae, Fructus Gardeniae, Radix Scutellariae, Cortex Eucommiae, Herba Leonuri, Herba Tazilli, Caulis Et Folium Polygoni Multiflori, Sclerotium Poriae Circum Radicem Pini, etc.' , detail_ch='石決明(六錢)  川牛膝(四錢)  鈎藤(四錢)  天麻(三錢)  梔子(三錢)  黃芩(三錢)  杜仲(三錢)  益母草(三錢)  桑寄生(三錢)  夜交藤(三錢)  茯神(三錢)' where code='F12';


UPDATE "Medicine" SET content = '桔梗10克  荊芥10克  紫菀10克  百部10克  白前10克  甘草6克  陳皮3克 (醫砭) 來源: 醫學心悟', detail_en = 'Radix Platycodi, Herba Schizonepetae, Radix Asteris, Radix Stemonae, Rhizoma Cynanchi Stauntonii, Citri Reticulatae Pericarpium, Glycyrrhizae Radix Et Rhizoma, etc.' , detail_ch='桔梗(三錢)  荊芥(三錢)  紫菀(三錢)  百部(三錢)  白前(三錢)  陳皮(二錢)  甘草(一錢)' where code='F13';


UPDATE "Medicine" SET content = '當歸 茯苓 梔子 薄荷 芍藥 柴胡 甘草 白朮 牡丹皮 煨薑 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Radix Angelicae Sinensis, Radix Paeoniae Alba, Poria, Rhizoma Atractylodis Macrocephalae, Radix Bupleuri, Cortex Moutan, Fructus Gardeniae, Radix Glycyrrhizae Preparata, etc.' , detail_ch='當歸(二錢)  白芍(二錢)  茯苓(二錢)  白朮(二錢)  柴胡(二錢)  牡丹皮(一錢)  山梔子(一錢)  炙甘草(一錢)' where code='F14';


UPDATE "Medicine" SET content = '熟地黃24克  山茱萸12克  山藥12克  澤瀉9克  茯苓9克  牡丹皮9克 (醫砭) 來源: 小兒藥證直訣', detail_en = 'Rehmanniae Radix Preparata, Corni Fructus, Dioscoreae  Rhizoma, Alismatis Rhizoma, Moutan Cortex, Poria, etc.' , detail_ch='熟地黃24克  山茱萸12克  山藥12克  澤瀉9克  牡丹皮9克  茯苓9克' where code='F15';


UPDATE "Medicine" SET content = '金銀花9克  陳皮4.5克  當歸(酒)4.5克  防風3克  白芷3克  甘草節3克  貝母3克  天花粉3克  乳香3克  沒藥3克  皂角刺1.5克  穿山甲3克 (醫砭) 來源: 婦人大全良方', detail_en = 'Lonicerae Japonicae Flos, Citri Reticulatae Pericarpium, Angelicae Dahuricae Radix, Bulbus Fritillariae Thunbergii, Radix Saposhnikoviae, Radix Paeoniae Rubra, Radix Angelicae Sinensis, Glycyrrhizae Radix Et Rhizoma, Spina Gleditsiae, Radix Trichosanthis, Olibanum, Myrrha, etc.' , detail_ch='金銀花(八錢)  陳皮(三錢)  白芷(一錢)  浙貝母(一錢)  防風(一錢)  赤芍(一錢)  當歸尾(一錢)  甘草(一錢)  皂角刺(一錢)  天花粉(一錢)  乳香(一錢)  沒藥(一錢)' where code='F16';


UPDATE "Medicine" SET content = '半夏4.5克  天麻3克  白朮3克  橘紅3克  茯苓3克  甘草1.5克  生薑2片  大棗3枚  蔓荊子3克 (醫砭) 來源: 醫學心悟', detail_en = 'Rhizoma Atractylodis Macrocephalae, Rhizoma Pinelliae Preparata, Rhizom Zingiberis Recens, Fructus Jujubae, Pericarpium Citri Reticulatae, Rhizoma Gastrodiae, Poria, Radix Glycyrrhizae Preparata, etc.' , detail_ch='白朮(五錢)  製半夏(三錢)  生薑(三錢)  大棗(三錢)  陳皮(三錢)  天麻(二錢)  茯苓(二錢)  炙甘草(一錢)' where code='F17';


UPDATE "Medicine" SET content = '法半夏12克  黃芩9克  乾薑9克  人參9克  炙甘草9克  黃連3克  大棗6克/12枚 (醫砭) 來源: 傷寒卒病論', detail_en = 'Pinelliae Rhizoma Praeparatum, Citri Reticulatae Pericarpium, Poria, Zingiberis Rhizoma Recens, Glycyrrhizae Radix Et Rhizoma Preparata Cum Melle, Mume Fructus, etc.' , detail_ch='法半夏12克  黃芩9克  乾薑9克  黨參9克  炙甘草9克  大棗6克  黃連3克' where code='F18';


UPDATE "Medicine" SET content = '人參15克  甘草5克  茯苓10克  白朮10克 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Codonopsis Radix, Atractylodis Macrocephalae Rhizoma, Poria, Glycyrrhizae Radix Et Rhizoma Praeparata Cum Melle, etc.' , detail_ch='黨參9克  白朮9克  茯苓9克  炙甘草6克' where code='F19';


UPDATE "Medicine" SET content = '黃柏10克  蒼朮10克  川牛膝9克  薏苡仁20克 (醫砭) 來源: 成方便讀', detail_en = 'Semen Coicis, Cortex Phellodendri, Rhizoma Atractylodis, Radix Achyranthis Bidentatae, etc.' , detail_ch='薏苡仁(六錢)  黃柏(三錢)  蒼朮(三錢)  淮牛膝(三錢)  ' where code='F20';


UPDATE "Medicine" SET content = '當歸10克  川芎10克  熟地黃10克  白芍10克 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Rehmanniae Radix Praeparata, Angelicae Sinensis Radix, Paeoniae Radix Alba, Chuanxiong Rhizoma, etc.' , detail_ch='熟地黃12克  當歸9克  白芍9克  川芎6克' where code='F21';


UPDATE "Medicine" SET content = '柴胡30克  枳實30克  白芍30克  甘草30克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Bupleuri Radix, Paeoniae Radix Alba, Aurantii Fructus Immaturus, Glycyrrhizae Radix Et Rhizoma Praeoarata Cum Melle, etc.' , detail_ch='柴胡6克  白芍6克  枳實6克  炙甘草6克' where code='F22';


UPDATE "Medicine" SET content = '炙甘草6克  乾薑4.5克  生附子10克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Rhizoma Zingiberis, Radix Aconiti Lateralis Preparata, Radix Glycyrrhizae Preparata, etc.' , detail_ch='乾薑(四錢)  製附子(三錢)  炙甘草(三錢)' where code='F23';


UPDATE "Medicine" SET content = '五靈脂3克  蒲黃3克  醋5毫升 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Pollen Typhae, Faeces Trogopterori, etc.' , detail_ch='蒲黃(三錢)  五靈脂(三錢)' where code='F24';


UPDATE "Medicine" SET content = '陳皮10克  厚朴10克  蒼朮12克  甘草5克  生薑10克  大棗5枚 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Atractylodis Rhizoma, Magnoliae Officinalis Cortex, Citri Reticulatae Pericarpium, Zingiberis Rhizoma Recens, Jujubae Fructus, Glycyrrhizae Radix Et Rhizoma, etc.' , detail_ch='蒼朮12克  厚樸9克  陳皮9克  生薑6克  大棗6克  甘草3克' where code='F25';


UPDATE "Medicine" SET content = '甘草20克  小麥100克  大棗10枚 (醫砭) 來源: 傷寒卒病論', detail_en = 'Fructus Tritici Aestivi, Jujubae Fructus, Glycyrrhizae Radix Et Rhizoma Preparata Cum Melle, etc.' , detail_ch='小麥(一両)  大棗(四錢)  炙甘草(三錢)  ' where code='F26';


UPDATE "Medicine" SET content = '當歸24克  川芎9克  桃仁9克  炮薑2克  甘草2克 (醫砭) 來源: 傅青主女科', detail_en = 'Radix Angelicae Sinensis, Chuanxiong Rhizoma, Semen Persicae, Rhizoma Singiberis Preparatum, Radix Glycyrrhizae Preparata, etc.' , detail_ch='當歸(八錢)  川芎(三錢)  桃仁(二錢)  黑乾薑(五分)  炙甘草(五分)' where code='F27';


UPDATE "Medicine" SET content = '人參8克  麥冬10克  五味子3克 (醫砭) 來源: 內外傷辨惑論', detail_en = 'Ginseng Radix Et Rhizoma, Ophiopogonis Radix, Schisandrae Chinensis Fructus, etc.' , detail_ch='人參9克  麥門冬9克  五味子6克' where code='F28';


UPDATE "Medicine" SET content = '知母18克  石膏碎45克  炙甘草6克  粳米18克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Gypsum Fibrosum, Rhizoma Anemarrhenae, Semen Oryzae Sativae, Radix Glycyrrhizae Preparata, etc.' , detail_ch='石膏(両半)  知母(四錢)  粳米(三錢)  生甘草(二錢)' where code='F29';


UPDATE "Medicine" SET content = '熟地黃240克 山萸肉120克 淮山藥120克 丹皮90克 建澤瀉90克 浙茯苓90克 煅磁石60克 石菖蒲45克 北五味15克 (醫砭) 來源:《重訂廣溫熱論》卷二', detail_en = 'Radix Rehmanniae Preparata, Fructus Corni, Rhizoma Dioscoreae, Cortex Moutan, Rhizoma Alismatis, Poria, Radix Bupleuri, Magetitum, etc.' , detail_ch='熟地黃(八錢)  山萸肉(四錢)  山藥(四錢)  牡丹皮(三錢)  澤瀉(三錢)  柴胡(一錢)  煅磁石(一錢)' where code='F30';


UPDATE "Medicine" SET content = '當歸9克  生地黃9克  桃仁12克  紅花6克  枳殼6克  赤芍6克  柴胡3克  甘草3克  桔梗5克  川芎5克  牛膝9克 (醫砭) 來源: 醫林改錯', detail_en = 'Persicae Semen, Carthami Flos, Angelicae Sinensis Radix, Rehmanniae Radix, Cyathulae Radix, Paeoniae Radix Rubra, Auranti Fructus, Platycodonis Radix, Chuanxiong Rhizoma, Bupleuri Radix, Glycyrrhizae Radix Et Rhizoma, etc.' , detail_ch='桃仁12克  紅花9克  當歸9克  地黃9克  川牛膝9克  赤芍6克  枳殼6克  桔梗4.5克  川芎4.5克  柴胡3克  甘草3克' where code='F31';


UPDATE "Medicine" SET content = '防己12克  黃耆15克  白朮9克  炙甘草6克  生薑3片  大棗3枚 (醫砭) 來源: 傷寒卒病論', detail_en = 'Radix Astragali, Radix Stephaniae Tetrandrae, Radix Glycyrrhizae Preparata, Rhizoma Atractylodis Macrocephalae, etc.' , detail_ch='黃芪(四錢)  漢防己(四錢)  炙甘草(二錢)  白朮(三錢)' where code='F32';


UPDATE "Medicine" SET content = '吳茱萸9克  人參9克  生薑20克  大棗4枚 (醫砭) 來源: 傷寒卒病論', detail_en = 'Fructus Evodiae, Radix Codonopsis, Rizoma Zingiberis Recens, Fructus Jujubae, etc.' , detail_ch='吳茱萸(一両)  黨參(二錢)  生薑(六錢)  大棗(三錢)' where code='F33';


UPDATE "Medicine" SET content = '沙參9克  玉竹6克  生甘草3克  冬桑葉4.5克  麥冬9克  生扁豆4.5克  花粉4.5克 (醫砭) 來源: 溫病條辨', detail_en = 'Radix Glehniae, Radix Ophiopogonis, Rhizoma Polygonati Odorati, Folium Mori, Semen Lablab Album, Radix Trichosanthis, Radix Glycyrrhizae, etc.' , detail_ch='北沙參(三錢)  麥門冬(三錢)  玉竹(三錢)  桑葉(一錢半)  白扁豆(一錢半)  瓜蔞根(一錢半)  生甘草(一錢)' where code='F34';


UPDATE "Medicine" SET content = '川貝母10克  瓜蔞10克  天花粉12克  茯苓15克  橘紅6克  桔梗10克 (醫砭) 來源: 醫學心悟', detail_en = 'Bulbus Fritillariae, Fructus Trichosanthis, Radix Trichosanthis, Poria, Exocarpium Citri Reticulatae, Radix Platycodi, etc.' , detail_ch='川貝母(四錢)  瓜蔞仁(三錢)  天花粉(二錢)  茯苓(二錢)  橘紅(二錢)  桔梗(二錢)' where code='F35';


UPDATE "Medicine" SET content = '秦艽3克  川芎6克  桃仁9克  紅花9克  甘草6克  羌活3克  沒藥6克  當歸9克  五靈脂6克  香附3克  牛膝9克  地龍6克 (醫砭) 來源: 醫林改錯', detail_en = 'Semen Persicae, Flos Carthami, Radix Achyranthis Bidentatae, Radix Angelicae Sinensis, Chuanxiong Rhizoma, Glycyrrhizae Radix Et Rhizoma, Myrrha, Faeces Trogopterori, Pheretima, Radix Gentianae Macrophyllae, Rhizoma Et Radix Notopterygii, Rhizoma Cyperi, etc.' , detail_ch='桃仁(三錢)  紅花(三錢)  當歸(三錢)  淮牛膝(三錢)  川芎(二錢)  甘草(二錢)  沒藥(二錢)  五靈脂(二錢)  地龍(二錢)  秦艽(一錢)  羌活(一錢)  香附(一錢)' where code='F36';


UPDATE "Medicine" SET content = '麻黃9克  桑白皮9克  白果21枚  黃芩5克  蘇子6克  杏仁5克  半夏9克  款冬花9克  甘草3克 (醫砭) 來源: 攝生眾妙方', detail_en = 'Ginkgo Semen, Herba Ephedrae, Pinelliae Rhizoma Praeparatum, Cortex Mori, Flos Farfarae, Perillae Fructus, Armeniacae Semen Amarum, Radix Scutellariae, Glycyrrhizae Radix Et Rhizoma, etc.' , detail_ch='白果(六錢)  麻黃(三錢)  法半夏(三錢)  桑白皮(三錢)  款冬花(三錢)  紫蘇子(二錢)  苦杏仁(一錢半)  黃芩(一錢半)  甘草(一錢)' where code='F37';


UPDATE "Medicine" SET content = '茯苓12克  桂枝9克  白朮6克  炙甘草6克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Poria, Ramulus Cinnamomi, Rhizoma Atractylodis Macrocephalae, Radix Glycyrrhizae Preparata, etc.' , detail_ch='茯苓(四錢)  桂枝(三錢)  白朮(三錢)  炙甘草(二錢)' where code='F38';


UPDATE "Medicine" SET content = '炙甘草12克  人參6克  桂枝9克  生薑9克  阿膠6克  生地黃48克  麥冬12克  麻仁12克  大棗30枚 (醫砭) 來源: 傷寒卒病論', detail_en = 'Rehmanniae Radix, Glycyrrhizae Radix Et Rhizoma Praeparata Cum Melle, Zingiberis Rhizoma Recens, Cinnamomoi Ramulus, Ophiopogonis Radix, Lini Semen, Jujubae Fructus, Codonopsis Radix, Asini Corii Colla, etc.' , detail_ch='地黃30克  炙甘草12克  生薑9克  桂枝9克  麥冬9克  亞麻子9克  大棗9克  黨參6克  阿膠6克' where code='F39';


UPDATE "Medicine" SET content = '神曲20克  山楂60克  茯苓30克  半夏30克  陳皮10克  連翹10克  萊菔子10克 (醫砭) 來源: 丹溪心法', detail_en = 'Crataegl Fructus, Massa Medicata Fermentata, Pinelliae Rhizoma Praeparatum, Poria, Citri Reticulatae Pericarpium, Forsythiae Fructus, Raphani Semen, etc.' , detail_ch='山楂18克  神曲9克  法半夏9克  茯苓9克  陳皮9克  連翹6克  萊菔子6克' where code='F40';


UPDATE "Medicine" SET content = '荊芥9克  防風9克  柴胡9克  茯苓9克  桔梗9克  川芎6克  羌活6克  獨活6克  枳殼5克  甘草5克  生薑5克 (醫砭)  來源: 攝生眾妙方', detail_en = 'Bupleuri Radix, Peucedani Radix, Chuanxiong Rhizoma, Aurantii Fructus, Notopterygii Rhizoma Et Radix, Angelicae Pubescentis Radix, Poria, Platycodonis Radix, Schizonepetae Gerba, Saposhnikoviae Radix, Zingiberis Rhizoma Recens, Glycyrrhizae Radix Et Rhizoma, Menthae Haplocalycis Herba, etc.' , detail_ch='柴胡9克  前胡9克  川芎6克  枳殼9克  羌活9克  獨活9克  茯苓9克  桔梗9克  荊芥9克  防風9克  生薑9克  甘草4.5克  薄荷3克' where code='F41';


UPDATE "Medicine" SET content = '木香7克  砂仁3克  陳皮3克  半夏12克  黨參10克  白朮20克  茯苓20克  甘草7克  生薑10克  大棗4枚 (醫砭) 來源: 時方歌括', detail_en = 'Atractylodis Macrocephalae Rhizoma, Poria, Codonopsis Radix, Glycyrrhizae Radix Et Rhizoma, Citri Reticulate Pericarpium, Pinelliae Rhizoma Praeparatum, Amomi Frustus, Aucklandiae Radix, Zingiberis Rhizoma Recens, etc.' , detail_ch='白朮6克  茯苓6克  黨參3克  甘草3克  陳皮3克  法半夏3克  砂仁3克  木香3克  生薑3克' where code='F42';


UPDATE "Medicine" SET content = '桂枝10克  茯苓10克  牡丹皮10克  白芍10克  桃仁10克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Paeoniae Radix Rubra, Moutan Cortex, Cinnamomoi Ramulus, Persicae Semen, Poria, etc.' , detail_ch='赤芍9克  牡丹皮9克  桂枝9克  桃仁9克  茯苓9克' where code='F43';


UPDATE "Medicine" SET content = '桂枝9克  白芍9克  炙甘草6克  生薑9克  大棗12枚 (醫砭) 來源: 傷寒卒病論', detail_en = 'Cinnamomoi Ramulus, Paeoniae Radix Alba, Zingiberis Rhizoma Recens, Jujubae Fructus, Glycyrrhizae Radix Et Rhizoma Praeparata Cum Melle, etc.' , detail_ch='桂枝9克  白芍9克  生薑9克  大棗9克  炙甘草6克' where code='F44';


UPDATE "Medicine" SET content = '當歸12克  川芎6克  白芍12克  熟地黃24克  桃仁9克  紅花6克 (醫砭) 來源: 醫宗金鑒', detail_en = 'Persicae Semen, Carthami Flos, Rehmanniae Radix, Angelicae Sinensis Radix, Paeoniae Radix Rubra,Chuanxiong Rhizoma, etc.' , detail_ch='桃仁12克  紅花9克  地黃9克  當歸9克  赤芍9克  川芎9克' where code='F45';


UPDATE "Medicine" SET content = '桑葉3克  杏仁4.5克  沙參6克  象貝3克  香豉3克  梔皮3克  梨皮3克 (醫砭) 來源: 溫病條辨', detail_en = 'Folium Mori, Semen Armeniacae Amarum, Radix Adenophorae Strictae, Bulbus Fritillariae, Semen Sojae Preparatum, Pericarpium Gardeniae, Exocarpium Pyrus, etc.' , detail_ch='桑葉(二錢)  杏仁(一錢半)  北沙參(二錢)  浙貝母(一錢)  淡豆豉(一錢)  山梔子(一錢)  梨皮(一錢)' where code='F46';


UPDATE "Medicine" SET content = '桑葉8克  菊花3克  薄荷2克  杏仁6克  桔梗6克  連翹5克  甘草2克  葦根6克 (醫砭) 來源: 溫病條辨', detail_en = 'Mori Folium, Chrysanthemi Flos, Armeniacae Semen Amarum, Fructus Forsythiae, Radix Platycodi, Rhizoma Phragmitis, Menthae Haplocalycis Herba, Glycyrrhizae Radix Et Rhizoma, etc.' , detail_ch='桑葉(三錢)  杭菊花(三錢)  苦杏仁(二錢)  連翹(二錢)  桔梗(二錢)  蘆根(二錢)  薄荷葉(一錢)  甘草(一錢)' where code='F47';


UPDATE "Medicine" SET content = '桑螵蛸50克  遠志50克  石菖蒲50克  龍骨50克  人參50克  茯神50克  當歸50克  龜板50克 (醫砭) 來源: 本草衍義', detail_en = 'Os Draconis, Carapax Et Plastrum Testudinis, Sclerotium Poriae Circum Radicem Pini, Radix Codonopsis, Ootheca Mantidis, Radix Angelicae Sinensis, Radix Polygalae, Rhizoma Acori Tatarinowii, etc.' , detail_ch='龍骨(五錢)  龜甲(五錢)  茯神(四錢)  黨參(三錢)  桑螵蛸(三錢)  當歸(三錢)  遠志(二錢)  石菖蒲(二錢)' where code='F48';


UPDATE "Medicine" SET content = '荊芥3克  防風3克  當歸3克  生地3克  苦參3克  蒼朮3克  蟬蛻3克  胡麻仁3克  牛蒡子3克  知母3克  石膏3克  八月瓜1.5克  甘草1.5克 (醫砭) 來源: 外科正宗', detail_en = 'Gypsum Fibrosum, Lini Semen, Schizonepetae Herba, Saposhnikoviae Radix, Arctii Fructus, Cicadae Periostracum, Atractylodis Rhizoma, Sophorae Flavescentis Radix, Anemarrhenae Rhizoma, Angelicae Sinensis Radix, Rehmanniae Radix, Clematidis Armandii Caulis, Glycyrrhizae Radix Et Rhizoma, etc.' , detail_ch='石膏15克  亞麻子6克  荊芥6克  防風6克  牛蒡子6克  蟬蛻6克  蒼朮6克  苦參6克  知母6克  當歸6克  地黃6克   川木通3克  甘草3克' where code='F49';


UPDATE "Medicine" SET content = '茯苓9克  芍藥9克  白朮6克  生薑9克  附子12克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Poria, Radix Paeoniae Alba, Rhizoma Zingiberis Recens, Radix Aconiti Lateralis Preparata, Rhizoma Atractylodis Macrocephalae, etc.' , detail_ch='茯苓(三錢)  白芍(三錢)  生薑(三錢)  製附子(三錢)  白朮(二錢)' where code='F50';


UPDATE "Medicine" SET content = '柴胡10克  當歸10克  白芍10克  白朮10克  茯苓10克  甘草5克  生薑10克  薄荷5克 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Poria, Angelicae Sinensis Radix, Atractylodis Macrocephalae Rhizoma, Bupleuri Radix, Paeoniae Radix Alba, Zingiberis Rhizoma Recens, Glycyrrhizae Radix Et Rhizoma Praeparata Cum Melle, Menthae Haplocalycis Herba, etc.' , detail_ch='茯苓12克  當歸9克  白朮9克  柴胡9克  白芍9克  生薑6克  炙甘草4.5克  薄荷3克' where code='F51';


UPDATE "Medicine" SET content = '赤芍3克  川芎3克  桃仁9克  紅花9克  麝香0.5克  老蔥15克  生薑9克  紅棗7枚 (醫砭) 來源: 醫林改錯', detail_en = 'Rhizoma Zingiberis Recens, Flos Carthami, Semen Persicae, Fructus Ziziphi Jujubae, Radix Paeoniae Rubra, Rhizoma Ligustici Chuanxiong, Allii Fistulosi, etc.' , detail_ch='生薑(三錢)  紅花(三錢)  桃仁(二錢)  大棗(二錢)  赤芍(一錢)  川芎(一錢)  蔥(一錢)' where code='F52';


UPDATE "Medicine" SET content = '旋覆花9克  生薑15克  人參6克  代赭石3克  炙甘草9克  半夏12克  大棗12枚 (醫砭) 來源: 傷寒卒病論', detail_en = 'Haematitum, Flos Inulae, Rhizoma Zingiberis Recens, Rhizoma Pinelliae Preparata, Radix Codonopsis, Radix Glycyrrhizae Preparata, Fructus Jujubae, etc.' , detail_ch='代赭石(八錢)  旋覆花(三錢)  生薑(三錢)  製半夏(三錢)  黨參(二錢)  炙甘草(二錢)  大棗(二錢)' where code='F53';


UPDATE "Medicine" SET content = '霜桑葉9克  石膏8克  甘草3克  人參3克  胡麻仁3克  阿膠3克  麥門冬4克  杏仁2克  枇杷葉3克 (醫砭) 來源: 醫門法律', detail_en = 'Gypsum Fiberosum, Folium Eriobotryae, Radix Ophiopogonis, Folium Mori, Colla Cori Asini, Lini Semen, Radix Codonopsis, Semen Armeniacae Amarum, Radix Glycyrrhizae, etc.' , detail_ch='石膏(五錢)  枇杷葉(三錢)  麥冬(三錢)  桑葉(三錢)  阿膠(三錢)  亞麻子(二錢)  黨參(二錢)  杏仁(二錢)  甘草(一錢)' where code='F54';


UPDATE "Medicine" SET content = '麻子仁100克  白芍25克  炙枳實25克  大黃50克  炙厚朴30克  杏仁50克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Radix Paeoniae Alba, Fructus Cannabis, Fructus Aurantii Immaturus, Radix Rhizoma Rhei, Cortex Magnoliae Officinalis, Semen Armeniacae Amarum, etc.' , detail_ch='白芍(四錢)  火麻仁(四錢)  枳實(四錢)  大黃(四錢)  厚樸(三錢)  苦杏仁(三錢)' where code='F55';


UPDATE "Medicine" SET content = '麻黃9克  杏仁9克  炙甘草6克  石膏18克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Gypsum Fiberosum, Ephedrae Herba, Armeniacae Semen Amarum, Glycyrrhizae Radix Et Rhizoma Praeparata Cum Melle, etc.' , detail_ch='石膏45克  麻黃9克  苦杏仁9克  炙甘草6克' where code='F56';


UPDATE "Medicine" SET content = '麻黃6克  炮附子9克  細辛6克  (醫砭) 來源: 傷寒卒病論', detail_en = 'Herba Ephedrae, Radix Aconiti Lateralis Preparata, Herba Asari, etc.' , detail_ch='麻黃(二錢)  製附子(二錢)  細辛(一錢)' where code='F57';


UPDATE "Medicine" SET content = '麻黃6克  連翹根6克  杏仁6克  赤小豆10克  大棗12枚  生梓白皮10克  生薑6克  炙甘草6克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Herba Ephedrae, Fructus Forsythiae, Semen Armeniacae Amarum, Semen Phaseoli, Fructus Jujubae, Cortex Mori, Rhizoma Zingiberis Recens, Radix Glycyrrhizae Preparata, etc.' , detail_ch='麻黃(二錢)  連翹(二錢)  杏仁(二錢)  赤小豆(三錢)  大棗(二錢)  桑白皮(三錢)  生薑(二錢)  炙甘草(二錢)' where code='F58';


UPDATE "Medicine" SET content = '麻黃9克  桂枝6克  炙甘草3克  杏仁12克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Herba Ephedrae, Ramulus Cinnamomi, Semen Armeniacae Amarum,  Radix Glycyrrhizae Preparata, etc.' , detail_ch='麻黃(四錢)  桂枝(三錢)  杏仁(三錢)  炙甘草(三錢)' where code='F59';


UPDATE "Medicine" SET content = '扁豆9克  人參12克  白朮12克  茯苓12克  甘草12克  山藥12克  蓮子6克  薏苡仁6克  桔梗6克  砂仁6克  大棗3枚 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Poria, Dioscoreae Rhizoma, Atractylodis Macrocephalae Rhizoma, Lablab Semen Album, Nelumbinis Semen, Coicis Semen, Codonopsis Radix, Amomi Frustus, Glycyrrhizae Radix Et Rhizoma, Jujubae Fructus, Platycodonis Radix, Citri Reticulatae Pericarpium, etc.' , detail_ch='茯苓15克  山藥15克  白朮15克  白扁豆12克  蓮子9克  薏苡仁9克  黨參9克  甘草6克  大棗6克  桔梗6克  陳皮6克' where code='F60';


UPDATE "Medicine" SET content = '人參30克  白朮30克  乾薑30克  甘草30克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Radix Codonopsis, Rhizoma Zingiberis, Rhizoma Atractylodis Macrocephalae, Radix Glycyrrhizae Preparata, etc.' , detail_ch='黨參(三錢)  乾薑(三錢)  白朮(三錢)  炙甘草(三錢)' where code='F61';


UPDATE "Medicine" SET content = '黃芩15克  黃連15克  陳皮6克  玄參6克  生甘草6克  連翹3克  牛蒡子3克  板藍根3克  馬勃3克  薄荷3克  炒白殭蠶2.1克  升麻2.1克  柴胡6克  桔梗6克 (醫砭) 來源: 東垣十書', detail_en = 'Radix Scutellariae, Rhizoma Coptidis, Pericarpium Citri Reticulatae, Radix Et Rhizoma Glycyrrhizae, Radix Scrophulariae, Radix Bupleuri, Radix Platycodonis, Fructus Forsythiae, Radix Isatidis, Lasiosphaera Seu Calvatia, Fructus Arctii, Herba Menthae, Bombyx Batryticatus, Rhizoma Cimicifugae, etc.' , detail_ch='黃芩(五錢)  黃連(五錢)  陳皮(二錢)  生甘草(二錢)  玄參(二錢)  柴胡(二錢)  桔梗(二錢)  連翹(一錢)  板藍根(一錢)  馬勃(一錢)  牛蒡子(一錢)  薄荷葉(一錢)  僵蠶(一錢)  升麻(一錢)' where code='F62';


UPDATE "Medicine" SET content = '?枸杞子、菟絲子、補骨脂、仙靈脾 來源: 李可老中醫急危重症疑難病經驗專輯', detail_en = 'Semen Cuscutae, Fructus Psoraleae, Herba Epimedii, Fructus Lycii, Semen Persicae, etc.' , detail_ch='菟絲子30克  補骨脂30克  淫羊藿30克  枸杞子30克  胡桃仁30克' where code='F63';


UPDATE "Medicine" SET content = '葛根15克  黃芩9克  黃連9克  甘草6克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Radix Puerariae, Radix Glycyrrhizae Preparata, Rhizoma Coptidis, Radix Scutellariae, etc.' , detail_ch='葛根(五錢)  炙甘草(四錢)  黃連(三錢)  黃芩(三錢)' where code='F64';


UPDATE "Medicine" SET content = '黃耆1.5克  炙甘草1.5克  人參0.9克  陳皮0.6克  升麻0.6克  柴胡0.6克  白朮0.9克 (醫砭) 來源: 脾胃論', detail_en = 'Astragali Radix, Codonopsis Radix, Atractylodis Macrocephalae Rhizoma, Glycyrrhizae Radix Et Rhizoma Praeparata Cum Melle, Angelicae Sinensis Radix, Citri Reticulatae Pericarpium, Bupleuri Radix, Cimicifugae Rhizoma, etc.' , detail_ch='黃耆18克  黨參12克  白朮9克  炙甘草9克  當歸9克  陳皮6克  柴胡6克  升麻6克' where code='F65';


UPDATE "Medicine" SET content = '黃耆120克  當歸尾6克  赤芍5克  地龍3克  川芎3克  桃仁3克  紅花3克 (醫砭) 來源: 醫林改錯', detail_en = 'Astragali Radix, Angelicae Sinensis Radix, Paeoniae Radix Rubra, Pheretima, Chuanxiong Rhizoma, Persicae Semen, Carthami Flos, etc.' , detail_ch='黃耆30克  當歸9克  赤芍9克  地龍9克  川芎9克  桃仁9克  紅花9克' where code='F66';


UPDATE "Medicine" SET content = '香薷6克  金銀花9克  鮮扁豆花9克  厚朴6克  連翹6克 (醫砭) 來源: 溫病條辨', detail_en = 'Herba Elsholtziae, Flos Dolichoris, Flos Lonicerae, Cortex Magnoliae Officinalis, Fructus Forsythiae, etc.' , detail_ch='香薷(三錢)  扁豆花(三錢)  金銀花(三錢)  厚樸(二錢)  連翹(二錢)' where code='F67';


UPDATE "Medicine" SET content = '吳茱萸6克  人參6克  桂枝6克  川芎6克  生薑6克  半夏6克  甘草6克  當歸9克  芍藥9克  阿膠9克  牡丹皮9克  麥冬9克', detail_en = 'Colla Corii Asini, Radix Pohiopogonis, Fructus Evodiae, Radix Angelicae Sinensis, Radix Paeoniae Rubra, Rhizoma Chuanxiong, Radix Codonopsis, Ramulus Cinnamomi, Cortex Moutan, Rhizoma Zingiberis Recens, Radix Glycyrrhizae, Rhizoma Pinelliae Preparata, etc.' , detail_ch='阿膠(三錢)  麥冬(三錢)  吳茱萸(三錢)  當歸(二錢)  赤芍(二錢)  川芎(二錢)  黨參(二錢)  桂枝(二錢)  牡丹皮(二錢)  生薑(二錢)  甘草(二錢)  製半夏(二錢)' where code='F69';


UPDATE "Medicine" SET content = '茵陳、羌活、防風、升麻、葛根、白朮、甘草、黃芩、苦參、知母、當歸、豬苓、澤瀉 (醫學百科) 來源: 東垣', detail_en = 'Radix Glycyrrhizae Preparata, Herba Artemsiae Scopariae, Rhizoma Et Radix Notopterygii, Rhizoma Anemarrhenae, Radix Scutellariae, Radix Angelicae Sinensis, Rhizoma Alismatis, Polyporus, Radix Codonopsis, Rhizoma Atractylodis, Radix Sophorae Flavescents, Radix Pureariae, Rhizoma Atractylodis Macrocephalae, etc.' , detail_ch='炙甘草(五錢)  茵陳(五錢)  羌活(五錢)  知母(三錢)  黃芩(三錢)  當歸(三錢)  澤瀉(三錢)  豬苓(三錢)  黨參(二錢)  升麻(二錢)  蒼朮(二錢)  苦參(二錢)  葛根(二錢)  白术(一錢半)' where code='F70';


UPDATE "Medicine" SET content = '當歸﹑白芍﹑川芎﹑生地黃﹑白蒺藜﹑防風﹑荊芥﹑何首烏﹑黃耆﹑甘草﹑生薑 (醫砭) 來源: 證治準繩', detail_en = 'Radix Angelicae Sinensis, Radix Paeoniae Alba, Rhizoma Chuanxiong, Radix Rehmanniae, Fructus Tribuli, Radix Saposhnikoviae, Herba Schizonepetae, Radix Polygoni Mutliflori Preparata, Radix Astragali, Radix Glycyrrhizae Preparata, Rhizoma Zingiberis Rec ens, etc.' , detail_ch='當歸(二錢) 白芍(二錢) 川芎(二錢) 地黃(二錢) 蒺藜(二錢) 防風(二錢) 荊芥(二錢) 何首烏(一錢) 黃耆(一錢) 炙甘草(一錢) 生薑(一錢)' where code='F71';


UPDATE "Medicine" SET content = '熟地黃20克  生地黃20克  川芎20克  人參20克  當歸身15克  黃耆15克 (醫砭) 來源: 蘭室秘藏', detail_en = 'Radix Rehmanniae Preparata, Radix Angelicae Sinensis, Radix Paeoniae Alba, Rhizoma Chuanxiong, Radix Astragali, Radix Codonopsis, etc.' , detail_ch='熟地黃(四錢)  當歸(三錢)  白芍(三錢)  川芎(二錢)  黃耆(三錢)  黨參(三錢)' where code='F72';


UPDATE "Medicine" SET content = '蒼耳子15克  辛夷花30克  白芷60克  薄荷葉2克 (醫砭) 來源: 濟生方', detail_en = 'Xanthii Fructus, Magnoliae Flos, Angelicae Dahuricae Radix, Menthae Haplocalycis Herba, Folium Cammelliae Sinensis, Bulbus Allii Fistulosi, etc.' , detail_ch='蒼耳子12克  辛夷12克  白芷6克  薄荷6克  茶葉3克  蔥白3克' where code='F73';


UPDATE "Medicine" SET content = '菟絲子120克  桑寄生60克  續斷60克  阿膠60克', detail_en = 'Semen Cuscutae, Herba Taxilli, Radix Dipsaci, Colla Corii Asini, etc.' , detail_ch='菟絲子(四錢)  桑寄生(二錢)  續斷(二錢)  阿膠(二錢)' where code='F74';


UPDATE "Medicine" SET content = '酸棗仁50克  甘草5克  知母10克  茯苓10克  川芎10克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Ziziphi Spinosae Semen, Poria, Anemarrhenae Rhizoma, Chuanxiong Rhizoma, Glycyrrhizae Radix Et Rhizoma,etc.' , detail_ch='酸棗仁15克  茯苓9克  知母9克  川芎9克  甘草6克' where code='F75';


UPDATE "Medicine" SET content = '金銀花30克  連翹30克  荊芥穗12克  淡豆豉15克  桔梗18克  薄荷18克  牛蒡子18克  甘草15克  竹葉12克  鮮葦根50克 (醫砭) 來源: 疾病專科錄入', detail_en = 'Lonicerae Japonicae Flos, Forsythiae Fructus, Sojae Semen Praeparatum, Platycodonis Radix, Arctii Fructus, Lophatheri Herba, Phragmitis Rhizoma, Glycyrrhizae Radix Et Rhizoma, etc.' , detail_ch='金銀花12克  連翹12克  淡豆豉9克  薄荷9克  桔梗9克  牛蒡子9克  荊芥6克  淡竹葉6克  蘆根6克  甘草3克' where code='F76';


UPDATE "Medicine" SET content = '豬苓5克  茯苓5克  澤瀉5克  阿膠5克  滑石5克 (醫砭) 來源: 傷寒卒病論', detail_en = 'Polyporus, Poria, Colla Corii Asini, Rhizoma Alismatis, Talcum, etc.' , detail_ch='豬苓(四錢)  茯苓(四錢)  阿膠(四錢)  澤瀉(四錢)  滑石(四錢)' where code='F77';


UPDATE "Medicine" SET content = '獨活9克  寄生6克  杜仲6克  牛膝6克  細辛6克  秦艽6克  茯苓6克  肉桂6克  防風6克  川芎6克  人參6克  甘草6克  當歸6克  白芍6克  熟地黃6克 (醫砭)  來源: 備急千金要方', detail_en = 'Radix Angelicae Pubescentis, Herba Taxilli, Cortex Eucommiae, Radix Cyathulae, Radix Gentianae Macrophylliae, Ramulus Cinnamomi, Radix Saposhnikoviae, Rhizoma Codonopsis, Glycyrrhizae Radix Et Rhizoma, Poria, Radix Angelicae Sinensis, Radix Paeoniae Alba, Radix Rehmanniae, Herba Asari, etc.' , detail_ch='獨活(三錢)  桑寄生(二錢)  杜仲(二錢)  川牛膝(二錢)  秦艽(二錢)  桂枝(二錢)  防風(二錢)  川芎(二錢)  黨參(二錢)  生甘草(二錢)  茯苓(二錢)  當歸(二錢)  白芍(二錢)  生地黃(二錢)  細辛(一錢)' where code='F78';


UPDATE "Medicine" SET content = '熟地黃2兩  山藥1.5兩  牛膝1.5兩  枸杞1.5兩  山茱肉1兩  茯苓1兩  杜仲1兩  遠志1兩  五味子1兩  楮實1兩  小茴香1兩  巴戟天1兩  肉蓯蓉1兩  石菖蒲5錢 (醫砭) 來源: 楊氏', detail_en = 'Radix Rehmanniae Preparata, Fructus Jujubae, Rhizoma Dioscoreae, Radix Achyranthis Bidentatae, Fructus Lycii, Fructus Cornii, Poria, Cortex Eucommiae, Radix Polygalae, Fructus Schisandrae, Fructus Foeniculi, Herba Cistanches, Rhizoma Acori Tatarinowii, Fructus Aurantii Immaturus, Radix Morindae Officinalis, etc.' , detail_ch='熟地黃(三錢)  大棗(三錢)  山藥(二錢)  淮牛膝(二錢)  枸杞子(二錢)  山茱萸(一錢)  茯苓(一錢)  杜仲(一錢)  遠志(一錢)  五味子(一錢)  小茴香(一錢)  肉蓯蓉(一錢)  石菖蒲(一錢)  枳實(一錢)  巴戟天(一錢)' where code='F79';


UPDATE "Medicine" SET content = '熟地黃15克  山藥30克  山茱萸30克  澤瀉30克  茯苓30克  牡丹皮30克  肉桂15克  附子12克  牛膝15克  車前子30克 (醫砭) 來源: 濟生方', detail_en = 'Rrehmanniae Radix Preparata, Processed Radix Acconiti Lateralis, Dioscoreae Rhizoma,Rhizoma Alismatis, Poria, Cortex Moutan, Cinnamoni Cortex, Fructus Cyathulae, Semen Plantaginis, etc.' , detail_ch='熟地黃(二錢)  熟附子(二錢)  山藥(一錢)  澤瀉(一錢)  茯苓(一錢)  牡丹皮(一錢)  肉桂(一錢)  山茱萸(一錢荒)  川牛膝(一錢)  車前子(一錢)' where code='F80';


UPDATE "Medicine" SET content = '烏藥60克  益智仁60克  山藥60克 (醫砭) 來源: 婦人大全良方', detail_en = 'Radix Linderae, Fructus Alpiniae Oxyphyllae, Rhizoma Dioscoreae, etc.' , detail_ch='烏藥(三錢)  益智仁(三錢)  山藥(二錢)' where code='F81';


UPDATE "Medicine" SET content = '鹿角5000克  龜板2500克  人參500克  枸杞子1000克 (醫砭) 來源: 醫方考', detail_en = 'Cervi Cornus, Colla Plastrum Testudinis, Fructus Lycii, Radix Codonopsis, etc.' , detail_ch='鹿角(一両)  龜板(五錢)  枸杞子(三錢)  黨參(一錢)' where code='F82';


UPDATE "Medicine" SET content = '龍膽草12克  梔子9克  黃芩9克  柴胡6克  生地黃12克  澤瀉9克  當歸5克  車前子10克  木通9克  甘草5克 (醫砭) 來源: 醫宗金鑒', detail_en = 'Radix Gentianae, Radix Scutellariae, Fructus Gardeniae, Semen Plantaginis, Radix Rehmanniae, Rhizoma Alismatis, Radix Bupleuri, Radix Glycyrrhizae, Caulis Akebiae, Radix Angelicae Sinensis, etc.' , detail_ch='龍膽草(三錢)  黃芩(三錢)  山梔子(二錢)  車前子(二錢)  生地黃(二錢)  澤瀉(二錢)  柴胡(二錢)  生甘草(二錢)  川木通(二錢)  當歸(二錢)' where code='F83';


UPDATE "Medicine" SET content = '人參3克  黃耆15克  白朮9克  茯苓9克  當歸9克  棗仁9克  桂圓肉9克  遠志6克  木香3克  炙甘草4.5克  生薑2片  大棗3枚 (醫砭) 來源: 濟生方', detail_en = 'Astragali Radix, Longan Arillus, Ziziphi Spinosae Semen, Angelicae Sinensis Radix, Atractylodis Macrocephalae Rhizoma, Poria Cum Radix Pini, Codonopsis Radix, Aucklandiae Radix, Glycyrrhizae Radix Et Rhizoma Praeparata Cum Melle, Polygalae Radix, Zingiberis Rhizoma Recens, Jujubae Fructus, etc.' , detail_ch='黃耆12克  龍眼肉12克  酸棗仁12克  當歸9克  白朮9克  茯神9克  黨參9克  木香6克  炙甘草6克  遠志6克  生薑6克  大棗6克' where code='F84';


UPDATE "Medicine" SET content = '牛膝30克  代赭石30克  龍骨15克  牡蠣15克  龜板15克  白芍15克  玄參15克  天冬15克  川楝子6克  麥芽6克  茵陳蒿6克  甘草5克 (醫砭) 來源: 醫學衷中參西錄', detail_en = 'Radix Achyranthis Bidentatae, Haematitum, Os Draconis, Concha Ostreae, Carapax Et Plastrum Testudinis, Radix Paeoniae Alba, Radix Scrophulariae, Radix Asparagi, Fructus Toosendan, Fructus Hordei Germinatus, Herba Artemisiae Scopariae, Radix Glycyrrhizae, etc.' , detail_ch='淮牛膝(一両)  代赭石(一両)  龍骨(五錢)  牡蠣(五錢)  龜甲(五錢)  白芍(五錢)  玄參(五錢)  天冬(五錢)  川楝子(二錢)  麥芽(二錢)  茵陳(二錢)  甘草(一錢半)' where code='F85';


UPDATE "Medicine" SET content = '半夏10克  蘇子10克  前胡4克  厚朴4克  肉桂6克  當歸6克  生薑10克  甘草8克  大棗3枚 (醫砭) 來源: 太平惠民和劑局方', detail_en = 'Fructus Perillae, Rhizoma Pinelliae Preparata, Radix Angelicae Sinensis, Radix Glycyrrhizae Preparata, Radix Peucedani, Cortex Magnoliae Officinalis, Rhizoma Zingiberis Recens, Fructus Jujubae, Cortex Cinnamomi, Folium Perillae, etc.' , detail_ch='紫蘇子(三錢)  製半夏(三錢)  當歸(二錢)  炙甘草(二錢)  前胡(二錢)  厚樸(二錢)  生薑(二錢)  大棗(二錢)  肉桂(一錢)  紫蘇葉(一錢)' where code='F86';

