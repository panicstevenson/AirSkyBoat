/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `zone_settings`
--

DROP TABLE IF EXISTS `zone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_settings` (
  `zoneid` smallint(3) unsigned NOT NULL DEFAULT '0',
  `zonetype` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zoneip` tinytext NOT NULL,
  `zoneport` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` tinytext NOT NULL,
  `music_day` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `music_night` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `battlesolo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `battlemulti` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `restriction` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tax` float(5,2) unsigned NOT NULL DEFAULT '0.00',
  `misc` smallint(5) unsigned NOT NULL DEFAULT '0', -- ZONEMISC in zone.h
  PRIMARY KEY (`zoneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=20 PACK_KEYS=1 CHECKSUM=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_settings`
--

LOCK TABLES `zone_settings` WRITE;
/*!40000 ALTER TABLE `zone_settings` DISABLE KEYS */;

-- horizonxi_game_san_d_oria_1
INSERT INTO `zone_settings` VALUES (185,5,'131.153.180.52',54230,'Dynamis-San_dOria',121,121,121,121,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (230,1,'131.153.180.52',54230,'Southern_San_dOria',107,107,107,107,0,0.00,1608);

-- horizonxi_game_san_d_oria_2
INSERT INTO `zone_settings` VALUES (233,1,'131.153.180.52',54231,'Chateau_dOraguille',156,156,156,156,0,0.00,1032);
INSERT INTO `zone_settings` VALUES (231,1,'131.153.180.52',54231,'Northern_San_dOria',107,107,107,107,0,0.00,1096);

-- horizonxi_game_san_d_oria_3
INSERT INTO `zone_settings` VALUES (232,1,'131.153.180.52',54232,'Port_San_dOria',107,107,107,107,0,0.00,1608);
INSERT INTO `zone_settings` VALUES (141,3,'131.153.180.52',54232,'Fort_Ghelsba',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (142,3,'131.153.180.52',54232,'Yughott_Grotto',0,0,115,102,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (139,4,'131.153.180.52',54232,'Horlais_Peak',0,0,125,125,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (219,1,'131.153.180.52',54232,'Residential_Area',0,0,0,0,0,0.00,32);

-- horizonxi_game_ronfaure_1
INSERT INTO `zone_settings` VALUES (101,2,'131.153.180.52',54233,'East_Ronfaure',109,109,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (190,3,'131.153.180.52',54233,'King_Ranperres_Tomb',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (166,3,'131.153.180.52',54233,'Ranguemont_Pass',0,0,115,102,0,0.00,2201);

-- horizonxi_game_ronfaure_2
INSERT INTO `zone_settings` VALUES (100,2,'131.153.180.52',54234,'West_Ronfaure',109,109,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (140,3,'131.153.180.52',54234,'Ghelsba_Outpost',0,0,115,102,0,0.00,2201);

-- horizonxi_game_bastok_1
INSERT INTO `zone_settings` VALUES (234,1,'131.153.180.52',54235,'Bastok_Mines',152,152,152,152,0,0.00,584);
INSERT INTO `zone_settings` VALUES (186,5,'131.153.180.52',54235,'Dynamis-Bastok',121,121,121,121,0,0.00,2200);

-- horizonxi_game_bastok_2
INSERT INTO `zone_settings` VALUES (237,1,'131.153.180.52',54236,'Metalworks',154,154,154,154,0,0.00,1032);
INSERT INTO `zone_settings` VALUES (235,1,'131.153.180.52',54236,'Bastok_Markets',152,152,152,152,0,0.00,584);

-- horizonxi_game_bastok_3
INSERT INTO `zone_settings` VALUES (236,1,'131.153.180.52',54237,'Port_Bastok',152,152,152,152,0,0.00,1608);
INSERT INTO `zone_settings` VALUES (172,3,'131.153.180.52',54237,'Zeruhn_Mines',0,0,115,102,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (143,3,'131.153.180.52',54237,'Palborough_Mines',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (144,4,'131.153.180.52',54237,'Waughroon_Shrine',0,0,125,125,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (189,1,'131.153.180.52',54237,'Residential_Area',0,0,0,0,0,0.00,32);

-- horizonxi_game_gustaberg_1
INSERT INTO `zone_settings` VALUES (191,3,'131.153.180.52',54238,'Dangruf_Wadi',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (107,2,'131.153.180.52',54238,'South_Gustaberg',116,116,101,103,0,0.00,2204);

-- horizonxi_game_gustaberg_2
INSERT INTO `zone_settings` VALUES (106,2,'131.153.180.52',54239,'North_Gustaberg',116,116,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (173,3,'131.153.180.52',54239,'Korroloka_Tunnel',0,0,115,192,0,0.00,2201);

-- horizonxi_game_windurst_1
INSERT INTO `zone_settings` VALUES (241,1,'131.153.180.52',54240,'Windurst_Woods',151,151,151,151,0,0.00,1608);

-- horizonxi_game_windurst_2
INSERT INTO `zone_settings` VALUES (239,1,'131.153.180.52',54241,'Windurst_Walls',151,151,151,151,0,0.00,1608);
INSERT INTO `zone_settings` VALUES (242,1,'131.153.180.52',54241,'Heavens_Tower',162,162,151,151,0,0.00,1032);
INSERT INTO `zone_settings` VALUES (187,5,'131.153.180.52',54241,'Dynamis-Windurst',121,121,121,121,0,0.00,2200);

-- horizonxi_game_windurst_3
INSERT INTO `zone_settings` VALUES (238,1,'131.153.180.52',54242,'Windurst_Waters',151,151,151,151,0,0.00,1096);
INSERT INTO `zone_settings` VALUES (240,1,'131.153.180.52',54242,'Port_Windurst',151,151,151,151,0,0.00,1096);
INSERT INTO `zone_settings` VALUES (214,1,'131.153.180.52',54242,'Residential_Area',0,0,0,0,0,0.00,32);

-- horizonxi_game_sarutabaruta_1
INSERT INTO `zone_settings` VALUES (116,2,'131.153.180.52',54243,'East_Sarutabaruta',113,113,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (194,3,'131.153.180.52',54243,'Outer_Horutoto_Ruins',0,0,115,102,0,0.00,2201);

-- horizonxi_game_sarutabaruta_2
INSERT INTO `zone_settings` VALUES (115,2,'131.153.180.52',54244,'West_Sarutabaruta',113,113,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (192,3,'131.153.180.52',54244,'Inner_Horutoto_Ruins',0,0,115,102,0,0.00,2201);

-- horizonxi_game_sarutabaruta_3
INSERT INTO `zone_settings` VALUES (169,3,'131.153.180.52',54245,'Toraimarai_Canal',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (170,4,'131.153.180.52',54245,'Full_Moon_Fountain',0,0,193,193,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (145,3,'131.153.180.52',54245,'Giddeus',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (146,4,'131.153.180.52',54245,'Balgas_Dais',0,0,125,125,0,0.00,2201);

-- horizonxi_game_central_1
INSERT INTO `zone_settings` VALUES (102,2,'131.153.180.52',54246,'La_Theine_Plateau',0,0,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (193,3,'131.153.180.52',54246,'Ordelles_Caves',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (108,2,'131.153.180.52',54246,'Konschtat_Highlands',0,0,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (196,3,'131.153.180.52',54246,'Gusgen_Mines',0,0,115,102,0,0.00,2201);

-- horizonxi_game_central_2
INSERT INTO `zone_settings` VALUES (103,2,'131.153.180.52',54247,'Valkurm_Dunes',0,0,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (248,1,'131.153.180.52',54247,'Selbina',112,112,112,112,0,0.00,1064);
INSERT INTO `zone_settings` VALUES (39,5,'131.153.180.52',54247,'Dynamis-Valkurm',121,121,121,121,0,0.00,2200);

-- horizonxi_game_central_3
INSERT INTO `zone_settings` VALUES (249,1,'131.153.180.52',54248,'Mhaura',105,105,105,105,0,0.00,1064);
INSERT INTO `zone_settings` VALUES (40,5,'131.153.180.52',54248,'Dynamis-Buburimu',121,121,121,121,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (118,2,'131.153.180.52',54248,'Buburimu_Peninsula',0,0,101,103,0,0.00,2204);

-- horizonxi_game_central_4
INSERT INTO `zone_settings` VALUES (117,2,'131.153.180.52',54249,'Tahrongi_Canyon',0,0,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (198,3,'131.153.180.52',54249,'Maze_of_Shakhrami',0,0,115,102,0,0.00,2201);

-- horizonxi_game_jeuno_1
INSERT INTO `zone_settings` VALUES (2, 2,'131.153.180.52',54250,'Carpenters_Landing',0,0,101,219,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (104,2,'131.153.180.52',54250,'Jugner_Forest',0,0,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (105,2,'131.153.180.52',54250,'Batallia_Downs',114,114,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (195,3,'131.153.180.52',54250,'The_Eldieme_Necropolis',0,0,115,102,0,0.00,2201);

-- horizonxi_game_jeuno_2
INSERT INTO `zone_settings` VALUES (119,2,'131.153.180.52',54251,'Meriphataud_Mountains',0,0,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (120,2,'131.153.180.52',54251,'Sauromugue_Champaign',158,158,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (200,3,'131.153.180.52',54251,'Garlaige_Citadel',0,0,115,102,0,0.00,2201);

-- horizonxi_game_jeuno_3
INSERT INTO `zone_settings` VALUES (197,3,'131.153.180.52',54252,'Crawlers_Nest',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (109,2,'131.153.180.52',54252,'Pashhow_Marshlands',0,0,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (110,2,'131.153.180.52',54252,'Rolanberry_Fields',118,118,101,103,0,0.00,2204);

-- horizonxi_game_jeuno_4
INSERT INTO `zone_settings` VALUES (246,1,'131.153.180.52',54253,'Port_Jeuno',110,110,110,110,0,0.00,1608);
INSERT INTO `zone_settings` VALUES (41,5,'131.153.180.52',54253,'Dynamis-Qufim',121,121,121,121,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (126,2,'131.153.180.52',54253,'Qufim_Island',0,0,101,103,0,0.00,2204);

-- horizonxi_game_jeuno_5
INSERT INTO `zone_settings` VALUES (245,1,'131.153.180.52',54254,'Lower_Jeuno',110,110,110,110,0,0.00,1608);

-- horizonxi_game_jeuno_6
INSERT INTO `zone_settings` VALUES (188,5,'131.153.180.52',54255,'Dynamis-Jeuno',121,121,121,121,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (243,1,'131.153.180.52',54255,'RuLude_Gardens',117,117,117,117,0,0.00,1608);
INSERT INTO `zone_settings` VALUES (244,1,'131.153.180.52',54255,'Upper_Jeuno',110,110,110,110,0,0.00,1608);
INSERT INTO `zone_settings` VALUES (199,1,'131.153.180.52',54255,'Residential_Area',0,0,0,0,0,0.00,32);

-- horizonxi_game_Beastmen
INSERT INTO `zone_settings` VALUES (149,3,'131.153.180.52',54256,'Davoi',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (150,3,'131.153.180.52',54256,'Monastic_Cavern',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (152,3,'131.153.180.52',54256,'Altar_Room',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (151,3,'131.153.180.52',54256,'Castle_Oztroja',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (147,3,'131.153.180.52',54256,'Beadeaux',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (148,3,'131.153.180.52',54256,'Qulun_Dome',0,0,115,102,0,0.00,2201);

-- horizonxi_game_misc_1
INSERT INTO `zone_settings` VALUES (157,3,'131.153.180.52',54257,'Middle_Delkfutts_Tower',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (158,3,'131.153.180.52',54257,'Upper_Delkfutts_Tower',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (184,3,'131.153.180.52',54257,'Lower_Delkfutts_Tower',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (127,2,'131.153.180.52',54257,'Behemoths_Dominion',0,0,101,103,0,0.00,2204);

-- horizonxi_game_misc_2
INSERT INTO `zone_settings` VALUES (4,2,'131.153.180.52',54258,'Bibiki_Bay',0,0,101,219,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (213,3,'131.153.180.52',54258,'Labyrinth_of_Onzozo',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (212,3,'131.153.180.52',54258,'Gustav_Tunnel',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (167,3,'131.153.180.52',54258,'Bostaunieux_Oubliette',0,0,115,102,0,0.00,2201);

-- horizonxi_game_transports
INSERT INTO `zone_settings` VALUES (227,2,'131.153.180.52',54259,'Ship_bound_for_Selbina_Pirates',106,106,101,103,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (228,2,'131.153.180.52',54259,'Ship_bound_for_Mhaura_Pirates',106,106,101,103,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (220,0,'131.153.180.52',54259,'Ship_bound_for_Selbina',106,106,101,103,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (221,0,'131.153.180.52',54259,'Ship_bound_for_Mhaura',106,106,101,103,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (3,2,'131.153.180.52',54259,'Manaclipper',229,229,101,219,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (223,2,'131.153.180.52',54259,'San_dOria-Jeuno_Airship',128,128,128,128,0,0.00,8);
INSERT INTO `zone_settings` VALUES (224,2,'131.153.180.52',54259,'Bastok-Jeuno_Airship',128,128,128,128,0,0.00,8);
INSERT INTO `zone_settings` VALUES (225,2,'131.153.180.52',54259,'Windurst-Jeuno_Airship',128,128,128,128,0,0.00,8);
INSERT INTO `zone_settings` VALUES (226,2,'131.153.180.52',54259,'Kazham-Jeuno_Airship',128,128,128,128,0,0.00,8);
INSERT INTO `zone_settings` VALUES (1,2,'131.153.180.52',54259,'Phanauet_Channel',229,229,101,219,0,0.00,2200);

-- horizonxi_game_misc_3
INSERT INTO `zone_settings` VALUES (7,2,'131.153.180.52',54260,'Attohwa_Chasm',0,0,101,219,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (8,4,'131.153.180.52',54260,'Boneyard_Gully',0,0,220,220,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (5,2,'131.153.180.52',54260,'Uleguerand_Range',0,0,101,219,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (6,4,'131.153.180.52',54260,'Bearclaw_Pinnacle',0,0,220,220,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (9,3,'131.153.180.52',54260,'PsoXja',225,225,115,218,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (10,4,'131.153.180.52',54260,'The_Shrouded_Maw',0,0,220,220,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (111,2,'131.153.180.52',54260,'Beaucedine_Glacier',0,0,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (134,5,'131.153.180.52',54260,'Dynamis-Beaucedine',121,121,121,121,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (204,3,'131.153.180.52',54260,'FeiYin',0,0,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (203,4,'131.153.180.52',54260,'Cloister_of_Frost',0,0,0,0,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (206,4,'131.153.180.52',54260,'QuBia_Arena',0,0,125,125,0,0.00,2201);

-- horizonxi_game_misc_4
INSERT INTO `zone_settings` VALUES (112,2,'131.153.180.52',54261,'Xarcabard',164,164,101,103,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (135,5,'131.153.180.52',54261,'Dynamis-Xarcabard',119,119,119,119,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (161,3,'131.153.180.52',54261,'Castle_Zvahl_Baileys',155,155,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (162,3,'131.153.180.52',54261,'Castle_Zvahl_Keep',155,155,115,102,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (165,4,'131.153.180.52',54261,'Throne_Room',155,155,119,119,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (210,0,'131.153.180.52',54261,'GM_Home',0,0,0,0,0,0.00,4095); -- NPC debug zone, where GMs idle on retail.

-- horizonxi_game_cop_1
INSERT INTO `zone_settings` VALUES (14,3,'131.153.180.52',54262,'Hall_of_Transference',0,0,115,218,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (16,3,'131.153.180.52',54262,'Promyvion-Holla',222,222,115,218,30,0.00,2201);
INSERT INTO `zone_settings` VALUES (17,4,'131.153.180.52',54262,'Spire_of_Holla',0,0,220,220,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (18,3,'131.153.180.52',54262,'Promyvion-Dem',222,222,115,218,30,0.00,2201);
INSERT INTO `zone_settings` VALUES (19,4,'131.153.180.52',54262,'Spire_of_Dem',0,0,220,220,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (20,3,'131.153.180.52',54262,'Promyvion-Mea',222,222,115,218,30,0.00,2201);
INSERT INTO `zone_settings` VALUES (21,4,'131.153.180.52',54262,'Spire_of_Mea',0,0,220,220,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (22,3,'131.153.180.52',54262,'Promyvion-Vahzl',222,222,115,218,50,0.00,2201);
INSERT INTO `zone_settings` VALUES (23,4,'131.153.180.52',54262,'Spire_of_Vahzl',0,0,220,220,0,0.00,2201);

-- horizonxi_game_cop_2
INSERT INTO `zone_settings` VALUES (24,2,'131.153.180.52',54263,'Lufaise_Meadows',230,230,101,219,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (25,2,'131.153.180.52',54263,'Misareaux_Coast',230,230,101,219,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (26,1,'131.153.180.52',54263,'Tavnazian_Safehold',245,245,245,245,0,0.00,1640);
INSERT INTO `zone_settings` VALUES (27,3,'131.153.180.52',54263,'Phomiuna_Aqueducts',0,0,115,218,40,0.00,2201);
INSERT INTO `zone_settings` VALUES (42,5,'131.153.180.52',54263,'Dynamis-Tavnazia',121,121,121,121,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (28,3,'131.153.180.52',54263,'Sacrarium',0,0,115,218,50,0.00,2201);
INSERT INTO `zone_settings` VALUES (29,3,'131.153.180.52',54263,'Riverne-Site_B01',0,0,115,218,50,0.00,2201);
INSERT INTO `zone_settings` VALUES (30,3,'131.153.180.52',54263,'Riverne-Site_A01',0,0,115,218,40,0.00,2201);
INSERT INTO `zone_settings` VALUES (31,4,'131.153.180.52',54263,'Monarch_Linn',0,0,220,220,0,0.00,2201);

-- horizonxi_game_misc_6
INSERT INTO `zone_settings` VALUES (32,1,'131.153.180.52',54264,'Sealions_Den',245,245,220,220,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (33,2,'131.153.180.52',54264,'AlTaieu',233,233,101,219,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (34,3,'131.153.180.52',54264,'Grand_Palace_of_HuXzoi',0,0,115,218,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (36,4,'131.153.180.52',54264,'Empyreal_Paradox',0,0,224,224,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (35,3,'131.153.180.52',54264,'The_Garden_of_RuHmet',228,228,115,218,0,0.00,2201);

-- horizonxi_game_misc_7
INSERT INTO `zone_settings` VALUES (37,7,'131.153.180.52',54265,'Temenos',0,0,218,219,0,0.00,152);
INSERT INTO `zone_settings` VALUES (38,7,'131.153.180.52',54265,'Apollyon',0,0,218,219,0,0.00,152);
INSERT INTO `zone_settings` VALUES (179,4,'131.153.180.52',54265,'Stellar_Fulcrum',0,0,193,193,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (180,4,'131.153.180.52',54265,'LaLoff_Amphitheater',0,0,196,196,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (181,4,'131.153.180.52',54265,'The_Celestial_Nexus',0,0,198,198,0,0.00,2201);

-- horizonxi_game_misc_8
INSERT INTO `zone_settings` VALUES (153,3,'131.153.180.52',54266,'The_Boyahda_Tree',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (154,3,'131.153.180.52',54266,'Dragons_Aery',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (202,4,'131.153.180.52',54266,'Cloister_of_Storms',0,0,0,0,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (121,2,'131.153.180.52',54266,'The_Sanctuary_of_ZiTah',190,190,101,191,0,0.00,2204);

-- horizonxi_game_misc_9
INSERT INTO `zone_settings` VALUES (177,3,'131.153.180.52',54267,'VeLugannon_Palace',207,207,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (178,3,'131.153.180.52',54267,'The_Shrine_of_RuAvitau',207,207,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (130,2,'131.153.180.52',54267,'RuAun_Gardens',210,210,101,191,0,0.00,2200);

-- horizonxi_game_misc_10
INSERT INTO `zone_settings` VALUES (11,3,'131.153.180.52',54268,'Oldton_Movalpolos',221,221,115,218,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (12,3,'131.153.180.52',54268,'Newton_Movalpolos',221,221,115,218,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (13,4,'131.153.180.52',54268,'Mine_Shaft_2716',0,0,220,220,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (122,2,'131.153.180.52',54268,'RoMaeve',211,211,101,191,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (251,1,'131.153.180.52',54268,'Hall_of_the_Gods',213,213,213,213,0,0.00,8);

-- horizonxi_game_misc_11
INSERT INTO `zone_settings` VALUES (159,3,'131.153.180.52',54269,'Temple_of_Uggalepih',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (160,3,'131.153.180.52',54269,'Den_of_Rancor',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (163,4,'131.153.180.52',54269,'Sacrificial_Chamber',0,0,193,193,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (123,2,'131.153.180.52',54269,'Yuhtunga_Jungle',134,134,101,191,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (124,2,'131.153.180.52',54269,'Yhoator_Jungle',134,134,101,191,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (176,3,'131.153.180.52',54269,'Sea_Serpent_Grotto',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (252,1,'131.153.180.52',54269,'Norg',209,209,209,209,0,0.00,1640);

-- horizonxi_game_misc_12
INSERT INTO `zone_settings` VALUES (250,1,'131.153.180.52',54270,'Kazham',135,135,135,135,0,0.00,1576);
INSERT INTO `zone_settings` VALUES (211,4,'131.153.180.52',54270,'Cloister_of_Tides',0,0,0,0,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (207,4,'131.153.180.52',54270,'Cloister_of_Flames',0,0,0,0,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (205,3,'131.153.180.52',54270,'Ifrits_Cauldron',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (168,4,'131.153.180.52',54270,'Chamber_of_Oracles',0,0,193,193,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (113,2,'131.153.180.52',54270,'Cape_Teriggan',0,0,101,191,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (174,3,'131.153.180.52',54270,'Kuftal_Tunnel',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (128,2,'131.153.180.52',54270,'Valley_of_Sorrows',0,0,101,191,0,0.00,2204);

-- horizonxi_game_misc_13
INSERT INTO `zone_settings` VALUES (125,2,'131.153.180.52',54271,'Western_Altepa_Desert',171,171,101,191,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (114,2,'131.153.180.52',54271,'Eastern_Altepa_Desert',171,171,101,191,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (247,1,'131.153.180.52',54271,'Rabao',208,208,208,208,0,0.00,1640);
INSERT INTO `zone_settings` VALUES (209,4,'131.153.180.52',54271,'Cloister_of_Tremors',0,0,0,0,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (208,3,'131.153.180.52',54271,'Quicksand_Caves',0,0,115,192,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (201,4,'131.153.180.52',54271,'Cloister_of_Gales',0,0,0,0,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (131,3,'131.153.180.52',54271,'Mordion_Gaol',0,0,0,0,0,0.00,0);
INSERT INTO `zone_settings` VALUES (43,2,'131.153.180.52',54271,'Diorama_Abdhaljs-Ghelsba',0,0,218,219,0,0.00,152);
INSERT INTO `zone_settings` VALUES (44,2,'131.153.180.52',54271,'Abdhaljs_Isle-Purgonorgo',0,0,226,226,0,0.00,152);

-- TOAU Cluster
INSERT INTO `zone_settings` VALUES (46,2,'131.153.180.52',0,'Open_sea_route_to_Al_Zahbi',147,147,101,138,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (47,2,'131.153.180.52',0,'Open_sea_route_to_Mhaura',147,147,101,138,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (48,1,'131.153.180.52',0,'Al_Zahbi',178,178,178,178,0,0.00,1688);
INSERT INTO `zone_settings` VALUES (49,0,'131.153.180.52',0,'49',0,0,0,0,0,0.00,0); -- Empty grid. Like z210 but with no entity or string dats at all.
INSERT INTO `zone_settings` VALUES (50,1,'131.153.180.52',0,'Aht_Urhgan_Whitegate',178,178,178,178,0,0.00,1544);
INSERT INTO `zone_settings` VALUES (51,2,'131.153.180.52',0,'Wajaom_Woodlands',149,149,101,138,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (52,2,'131.153.180.52',0,'Bhaflau_Thickets',149,149,101,138,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (53,2,'131.153.180.52',0,'Nashmau',175,175,175,175,0,0.00,1576);
INSERT INTO `zone_settings` VALUES (54,2,'131.153.180.52',0,'Arrapago_Reef',150,150,115,139,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (55,6,'131.153.180.52',0,'Ilrusi_Atoll',0,0,144,144,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (56,6,'131.153.180.52',0,'Periqia',0,0,144,144,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (57,4,'131.153.180.52',0,'Talacca_Cove',0,0,143,143,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (58,2,'131.153.180.52',0,'Silver_Sea_route_to_Nashmau',147,147,101,138,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (59,2,'131.153.180.52',0,'Silver_Sea_route_to_Al_Zahbi',147,147,101,138,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (60,6,'131.153.180.52',0,'The_Ashu_Talif',172,172,143,143,0,0.00,2176);
INSERT INTO `zone_settings` VALUES (61,2,'131.153.180.52',0,'Mount_Zhayolm',0,0,101,138,0,0.00,2206);
INSERT INTO `zone_settings` VALUES (62,3,'131.153.180.52',0,'Halvung',0,0,115,139,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (63,6,'131.153.180.52',0,'Lebros_Cavern',0,0,144,144,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (64,4,'131.153.180.52',0,'Navukgo_Execution_Chamber',0,0,143,143,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (65,3,'131.153.180.52',0,'Mamook',0,0,115,139,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (66,6,'131.153.180.52',0,'Mamool_Ja_Training_Grounds',0,0,144,144,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (67,4,'131.153.180.52',0,'Jade_Sepulcher',0,0,143,143,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (68,3,'131.153.180.52',0,'Aydeewa_Subterrane',174,174,115,139,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (69,6,'131.153.180.52',0,'Leujaoam_Sanctum',0,0,144,144,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (70,1,'131.153.180.52',0,'Chocobo_Circuit',176,176,176,176,0,0.00,1036); -- MISC includes chocobo flag, cant call chocobos here on retail
INSERT INTO `zone_settings` VALUES (71,1,'131.153.180.52',0,'The_Colosseum',0,0,139,139,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (72,3,'131.153.180.52',0,'Alzadaal_Undersea_Ruins',0,0,115,139,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (73,6,'131.153.180.52',0,'Zhayolm_Remnants',148,148,115,139,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (74,6,'131.153.180.52',0,'Arrapago_Remnants',148,148,115,139,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (75,6,'131.153.180.52',0,'Bhaflau_Remnants',148,148,115,139,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (76,6,'131.153.180.52',0,'Silver_Sea_Remnants',148,148,115,139,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (77,6,'131.153.180.52',0,'Nyzul_Isle',148,148,144,144,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (78,4,'131.153.180.52',0,'Hazhalm_Testing_Grounds',0,0,0,0,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (79,2,'131.153.180.52',0,'Caedarva_Mire',173,173,101,138,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (0,1,'131.153.180.52',0,'unknown',0,0,0,0,0,0.00,32); -- Demonstration Area from pre-release: Has no client side mesh, use wallhack to get around.


-- WOTG Cluster
INSERT INTO `zone_settings` VALUES (80,1,'131.153.180.52',0,'Southern_San_dOria_[S]',254,254,254,254,0,0.00,72);
INSERT INTO `zone_settings` VALUES (81,2,'131.153.180.52',0,'East_Ronfaure_[S]',251,251,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (82,2,'131.153.180.52',0,'Jugner_Forest_[S]',0,0,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (83,2,'131.153.180.52',0,'Vunkerl_Inlet_[S]',0,0,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (84,2,'131.153.180.52',0,'Batallia_Downs_[S]',252,252,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (85,2,'131.153.180.52',0,'La_Vaule_[S]',44,44,115,216,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (86,6,'131.153.180.52',0,'Everbloom_Hollow',0,0,216,216,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (87,1,'131.153.180.52',0,'Bastok_Markets_[S]',180,180,180,180,0,0.00,72);
INSERT INTO `zone_settings` VALUES (88,2,'131.153.180.52',0,'North_Gustaberg_[S]',253,253,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (89,2,'131.153.180.52',0,'Grauberg_[S]',0,0,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (90,2,'131.153.180.52',0,'Pashhow_Marshlands_[S]',0,0,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (91,2,'131.153.180.52',0,'Rolanberry_Fields_[S]',252,252,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (92,3,'131.153.180.52',0,'Beadeaux_[S]',44,44,115,216,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (93,6,'131.153.180.52',0,'Ruhotz_Silvermines',0,0,216,216,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (94,1,'131.153.180.52',0,'Windurst_Waters_[S]',182,182,182,182,0,0.00,72);
INSERT INTO `zone_settings` VALUES (95,2,'131.153.180.52',0,'West_Sarutabaruta_[S]',141,141,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (96,3,'131.153.180.52',0,'Fort_Karugo-Narugo_[S]',0,0,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (97,2,'131.153.180.52',0,'Meriphataud_Mountains_[S]',0,0,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (98,2,'131.153.180.52',0,'Sauromugue_Champaign_[S]',252,252,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (99,3,'131.153.180.52',0,'Castle_Oztroja_[S]',44,44,115,216,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (129,6,'131.153.180.52',0,'Ghoyus_Reverie',0,0,216,216,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (136,2,'131.153.180.52',0,'Beaucedine_Glacier_[S]',0,0,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (137,2,'131.153.180.52',0,'Xarcabard_[S]',42,42,101,215,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (138,3,'131.153.180.52',0,'Castle_Zvahl_Baileys_[S]',43,43,101,215,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (155,3,'131.153.180.52',0,'Castle_Zvahl_Keep_[S]',43,43,101,215,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (156,4,'131.153.180.52',0,'Throne_Room_[S]',0,0,0,0,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (164,3,'131.153.180.52',0,'Garlaige_Citadel_[S]',0,0,115,216,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (171,3,'131.153.180.52',0,'Crawlers_Nest_[S]',0,0,115,216,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (175,3,'131.153.180.52',0,'The_Eldieme_Necropolis_[S]',0,0,115,216,0,0.00,2201);
INSERT INTO `zone_settings` VALUES (182,4,'131.153.180.52',0,'Walk_of_Echoes',0,0,215,215,0,0.00,0);
INSERT INTO `zone_settings` VALUES (183,6,'131.153.180.52',0,'Maquette_Abdhaljs-Legion_A',0,0,143,143,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (222,4,'131.153.180.52',0,'Provenance',56,56,56,56,0,0.00,0);

-- Abyssea Cluster
INSERT INTO `zone_settings` VALUES (15,2,'131.153.180.52',0,'Abyssea-Konschtat',51,51,52,52,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (45,2,'131.153.180.52',0,'Abyssea-Tahrongi',51,51,52,52,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (132,2,'131.153.180.52',0,'Abyssea-La_Theine',51,51,52,52,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (215,2,'131.153.180.52',0,'Abyssea-Attohwa',51,51,52,52,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (216,2,'131.153.180.52',0,'Abyssea-Misareaux',51,51,52,52,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (217,2,'131.153.180.52',0,'Abyssea-Vunkerl',51,51,52,52,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (218,2,'131.153.180.52',0,'Abyssea-Altepa',51,51,52,52,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (253,2,'131.153.180.52',0,'Abyssea-Uleguerand',51,51,52,52,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (254,2,'131.153.180.52',0,'Abyssea-Grauberg',51,51,52,52,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (255,2,'131.153.180.52',0,'Abyssea-Empyreal_Paradox',51,51,52,52,0,0.00,2202);

-- SoA + RoV
INSERT INTO `zone_settings` VALUES (256,1,'131.153.180.52',0,'Western_Adoulin',59,59,59,59,0,0.00,1608);
INSERT INTO `zone_settings` VALUES (257,1,'131.153.180.52',0,'Eastern_Adoulin',63,63,63,63,0,0.00,1608);
INSERT INTO `zone_settings` VALUES (258,3,'131.153.180.52',0,'Rala_Waterways',61,61,57,57,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (259,6,'131.153.180.52',0,'Rala_Waterways_U',61,61,57,57,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (260,2,'131.153.180.52',0,'Yahse_Hunting_Grounds',60,60,57,57,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (261,2,'131.153.180.52',0,'Ceizak_Battlegrounds',60,60,57,57,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (262,2,'131.153.180.52',0,'Foret_de_Hennetiel',60,60,57,57,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (263,2,'131.153.180.52',0,'Yorcia_Weald',61,61,57,57,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (264,6,'131.153.180.52',0,'Yorcia_Weald_U',62,62,62,62,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (265,2,'131.153.180.52',0,'Morimar_Basalt_Fields',60,60,57,57,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (266,2,'131.153.180.52',0,'Marjami_Ravine',60,60,57,57,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (267,2,'131.153.180.52',0,'Kamihr_Drifts',72,72,57,57,0,0.00,2204);
INSERT INTO `zone_settings` VALUES (268,3,'131.153.180.52',0,'Sih_Gates',0,0,57,57,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (269,3,'131.153.180.52',0,'Moh_Gates',0,0,57,57,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (270,3,'131.153.180.52',0,'Cirdas_Caverns',0,0,57,57,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (271,6,'131.153.180.52',0,'Cirdas_Caverns_U',62,62,62,62,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (272,3,'131.153.180.52',0,'Dho_Gates',0,0,57,57,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (273,3,'131.153.180.52',0,'Woh_Gates',0,0,57,57,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (274,3,'131.153.180.52',0,'Outer_RaKaznar',73,73,57,57,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (275,0,'131.153.180.52',0,'Outer_RaKaznar_U',62,62,62,62,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (276,0,'131.153.180.52',0,'RaKaznar_Inner_Court',73,73,57,57,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (277,0,'131.153.180.52',0,'RaKaznar_Turris',0,0,0,0,0,0.00,0);
INSERT INTO `zone_settings` VALUES (279,0,'131.153.180.52',0,'Walk_of_Echoes_[P2]',0,0,0,0,0,0.00,2048);
INSERT INTO `zone_settings` VALUES (280,1,'131.153.180.52',0,'Mog_Garden',67,67,67,67,0,0.00,32);
INSERT INTO `zone_settings` VALUES (281,0,'131.153.180.52',0,'Leafallia',0,0,0,0,0,0.00,0);
INSERT INTO `zone_settings` VALUES (282,0,'131.153.180.52',0,'Mount_Kamihr',0,0,0,0,0,0.00,0);
INSERT INTO `zone_settings` VALUES (283,0,'131.153.180.52',0,'Silver_Knife',0,0,0,0,0,0.00,0);
INSERT INTO `zone_settings` VALUES (284,1,'131.153.180.52',0,'Celennia_Memorial_Library',63,63,0,0,0,0.00,0);
INSERT INTO `zone_settings` VALUES (285,1,'131.153.180.52',0,'Feretory',0,0,0,0,0,0.00,32);
INSERT INTO `zone_settings` VALUES (287,6,'131.153.180.52',0,'Maquette_Abdhaljs-Legion_B',0,0,143,143,0,0.00,2202);
INSERT INTO `zone_settings` VALUES (288,2,'131.153.180.52',0,'Escha_ZiTah',80,80,80,80,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (289,2,'131.153.180.52',0,'Escha_RuAun',80,80,80,80,0,0.00,2200);
INSERT INTO `zone_settings` VALUES (290,0,'131.153.180.52',0,'Desuetia_Empyreal_Paradox',0,0,0,0,0,0.00,2176);
INSERT INTO `zone_settings` VALUES (291,0,'131.153.180.52',0,'Reisenjima',79,79,79,79,0,0.00,2176);
INSERT INTO `zone_settings` VALUES (292,0,'131.153.180.52',0,'Reisenjima_Henge',0,0,0,0,0,0.00,2048);
INSERT INTO `zone_settings` VALUES (293,0,'131.153.180.52',0,'Reisenjima_Sanctorium',0,0,0,0,0,0.00,2176);
INSERT INTO `zone_settings` VALUES (294,5,'131.153.180.52',0,'Dynamis-San_dOria_[D]',88,88,88,88,0,0.00,2448);
INSERT INTO `zone_settings` VALUES (295,5,'131.153.180.52',0,'Dynamis-Bastok_[D]',88,88,88,88,0,0.00,2448);
INSERT INTO `zone_settings` VALUES (296,5,'131.153.180.52',0,'Dynamis-Windurst_[D]',88,88,88,88,0,0.00,2448);
INSERT INTO `zone_settings` VALUES (297,5,'131.153.180.52',0,'Dynamis-Jeuno_[D]',88,88,88,88,0,0.00,2448);
INSERT INTO `zone_settings` VALUES (298,0,'131.153.180.52',0,'Walk_of_Echoes_[P1]',186,186,186,186,0,0.00,2048);

-- Junk Zones
INSERT INTO `zone_settings` VALUES (133,0,'131.153.180.52',0,'133',0,0,0,0,0,0.00,0); -- Not a real zone, this is the character selection background before you are in game.
INSERT INTO `zone_settings` VALUES (229,0,'131.153.180.52',0,'229',0,0,0,0,0,0.00,0);
INSERT INTO `zone_settings` VALUES (278,0,'131.153.180.52',0,'278',0,0,0,0,0,0.00,0);
INSERT INTO `zone_settings` VALUES (286,0,'131.153.180.52',0,'286',0,0,0,0,0,0.00,0);


/*!40000 ALTER TABLE `zone_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;