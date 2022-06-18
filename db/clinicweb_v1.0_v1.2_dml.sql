--web 20180820
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
