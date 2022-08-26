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
-- Table structure for table `mob_spawn_mods`
--

DROP TABLE IF EXISTS `mob_spawn_mods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mob_spawn_mods` (
  `mobid` int(10) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `is_mob_mod` boolean NOT NULL DEFAULT '0',
  PRIMARY KEY (`mobid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mob_spawn_mods`
--

LOCK TABLES `mob_spawn_mods` WRITE;
/*!40000 ALTER TABLE `mob_spawn_mods` DISABLE KEYS */;
INSERT INTO `mob_spawn_mods` VALUES (16806117,288,40,0); -- Sargas DA guesstimate
INSERT INTO `mob_spawn_mods` VALUES (17240232,23,50,0); -- Tegmine attack bonus guesstimate, he hits hard for a crab on retail
INSERT INTO `mob_spawn_mods` VALUES (17240232,288,40,0); -- Tegmine DA guesstimate
INSERT INTO `mob_spawn_mods` VALUES (17186927,368,33,0);
INSERT INTO `mob_spawn_mods` VALUES (17195221,368,33,0);
INSERT INTO `mob_spawn_mods` VALUES (17363080,368,33,0);
INSERT INTO `mob_spawn_mods` VALUES (17424488,302,25,0); -- Autarch TA guesstimate
INSERT INTO `mob_spawn_mods` VALUES (17424488,288,25,0); -- Autarch DA guesstimate
INSERT INTO `mob_spawn_mods` VALUES (17424488,23,60,0); -- Autarch attack bonus guesstimate
INSERT INTO `mob_spawn_mods` VALUES (17371142,1,20,1);
INSERT INTO `mob_spawn_mods` VALUES (17371142,2,33,1);
INSERT INTO `mob_spawn_mods` VALUES (17371143,1,20,1);
INSERT INTO `mob_spawn_mods` VALUES (17371143,2,25,1);
INSERT INTO `mob_spawn_mods` VALUES (17433009,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17433009,2,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (17433009,302,15,0);
INSERT INTO `mob_spawn_mods` VALUES (17596720,1,19000,1);
INSERT INTO `mob_spawn_mods` VALUES (17596720,2,32767,1);
INSERT INTO `mob_spawn_mods` VALUES (17269106,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17269106,2,30545,1);
INSERT INTO `mob_spawn_mods` VALUES (17485980,1,1200,1);
INSERT INTO `mob_spawn_mods` VALUES (17485980,2,1950,1);
INSERT INTO `mob_spawn_mods` VALUES (17486129,1,3600,1);
INSERT INTO `mob_spawn_mods` VALUES (17486129,2,6079,1);
INSERT INTO `mob_spawn_mods` VALUES (17486031,1,1200,1);
INSERT INTO `mob_spawn_mods` VALUES (17486031,2,1903,1);
INSERT INTO `mob_spawn_mods` VALUES (17228242,1,21000,1);
INSERT INTO `mob_spawn_mods` VALUES (17228242,2,31300,1);
INSERT INTO `mob_spawn_mods` VALUES (17228242,15,4500,1);
INSERT INTO `mob_spawn_mods` VALUES (17309982,1,1500,1);
INSERT INTO `mob_spawn_mods` VALUES (17309982,2,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (17309980,1,1500,1);
INSERT INTO `mob_spawn_mods` VALUES (17309980,2,29036,1);
INSERT INTO `mob_spawn_mods` VALUES (17309981,1,1500,1);
INSERT INTO `mob_spawn_mods` VALUES (17309981,2,28608,1);
INSERT INTO `mob_spawn_mods` VALUES (17309983,1,1500,1);
INSERT INTO `mob_spawn_mods` VALUES (17309983,2,28886,1);
INSERT INTO `mob_spawn_mods` VALUES (17236202,160,50,0);
INSERT INTO `mob_spawn_mods` VALUES (17236202,169,10,0);
INSERT INTO `mob_spawn_mods` VALUES (17236204,169,10,0);
INSERT INTO `mob_spawn_mods` VALUES (17236203,169,10,0);
INSERT INTO `mob_spawn_mods` VALUES (17236203,23,8,1);
INSERT INTO `mob_spawn_mods` VALUES (17367080,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17367082,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17367085,34,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17375263,34,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17375267,34,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17465360,34,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17465360,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17465362,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17465364,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (16806215,26,32,1);
INSERT INTO `mob_spawn_mods` VALUES (16806216,26,32,1);
INSERT INTO `mob_spawn_mods` VALUES (16806217,26,32,1);
INSERT INTO `mob_spawn_mods` VALUES (17207308,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17207308,2,20000,1);
INSERT INTO `mob_spawn_mods` VALUES (17207308,15,7500,1);
INSERT INTO `mob_spawn_mods` VALUES (17235987,1,1076,1);
INSERT INTO `mob_spawn_mods` VALUES (17235987,2,2765,1);
INSERT INTO `mob_spawn_mods` VALUES (17203216,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17203216,2,20000,1);
INSERT INTO `mob_spawn_mods` VALUES (17555863,1,20000,1);
INSERT INTO `mob_spawn_mods` VALUES (17555863,2,30000,1);
INSERT INTO `mob_spawn_mods` VALUES (17555863,15,10000,1);
INSERT INTO `mob_spawn_mods` VALUES (17309954,1,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (17309954,2,29250,1);
INSERT INTO `mob_spawn_mods` VALUES (17309954,15,3250,1);
INSERT INTO `mob_spawn_mods` VALUES (17506370,1,17986,1);
INSERT INTO `mob_spawn_mods` VALUES (17506370,2,27482,1);
INSERT INTO `mob_spawn_mods` VALUES (17502568,1,18227,1);
INSERT INTO `mob_spawn_mods` VALUES (17502568,2,18606,1);
INSERT INTO `mob_spawn_mods` VALUES (17629524,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629524,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629524,15,2500,1); -- mug gil 2500
INSERT INTO `mob_spawn_mods` VALUES (17629641,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629641,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629640,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629640,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629483,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629483,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629421,1,2100,1);
INSERT INTO `mob_spawn_mods` VALUES (17629421,2,4500,1);
INSERT INTO `mob_spawn_mods` VALUES (17629412,1,2100,1);
INSERT INTO `mob_spawn_mods` VALUES (17629412,2,4500,1);
INSERT INTO `mob_spawn_mods` VALUES (17629561,1,650,1);
INSERT INTO `mob_spawn_mods` VALUES (17629561,2,1450,1);
INSERT INTO `mob_spawn_mods` VALUES (17629281,1,2100,1);
INSERT INTO `mob_spawn_mods` VALUES (17629281,2,4500,1);
INSERT INTO `mob_spawn_mods` VALUES (17629643,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629643,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629643,15,4000,1); -- mug gil 4000
INSERT INTO `mob_spawn_mods` VALUES (17629403,1,4800,1);
INSERT INTO `mob_spawn_mods` VALUES (17629403,2,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629238,1,2000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629238,2,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629238,15,630,1);
INSERT INTO `mob_spawn_mods` VALUES (17629301,1,1000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629301,2,3000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629264,1,10000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629264,2,13640,1);
INSERT INTO `mob_spawn_mods` VALUES (17629644,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629644,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629430,1,1200,1);
INSERT INTO `mob_spawn_mods` VALUES (17629430,2,3000,1);
INSERT INTO `mob_spawn_mods` VALUES (16990474,1,5000,1);
INSERT INTO `mob_spawn_mods` VALUES (16990474,2,7000,1);
INSERT INTO `mob_spawn_mods` VALUES (17404331,1,20000,1);
INSERT INTO `mob_spawn_mods` VALUES (17404331,2,24000,1);
INSERT INTO `mob_spawn_mods` VALUES (17404331,15,3000,1);
INSERT INTO `mob_spawn_mods` VALUES (17461478,1,3000,1);
INSERT INTO `mob_spawn_mods` VALUES (17461478,2,9900,1);
INSERT INTO `mob_spawn_mods` VALUES (17285460,1,379,1);
INSERT INTO `mob_spawn_mods` VALUES (17285460,2,900,1);
INSERT INTO `mob_spawn_mods` VALUES (17490231,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17490231,2,9500,1);
INSERT INTO `mob_spawn_mods` VALUES (17490231,15,3000,1);
INSERT INTO `mob_spawn_mods` VALUES (17490016,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17490016,2,9100,1);
INSERT INTO `mob_spawn_mods` VALUES (17617158,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17617158,2,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (17617158,15,3370,1);
INSERT INTO `mob_spawn_mods` VALUES (16814432,1,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (16814432,2,19800,1);
INSERT INTO `mob_spawn_mods` VALUES (16814432,9,80,1);
INSERT INTO `mob_spawn_mods` VALUES (16814432,170,50,0);
INSERT INTO `mob_spawn_mods` VALUES (16814432,168,2,0);
INSERT INTO `mob_spawn_mods` VALUES (16814432,29,33,0);
INSERT INTO `mob_spawn_mods` VALUES (16921015,387,-95,0); -- Jailer of Fortitude -95% phys damage mods
INSERT INTO `mob_spawn_mods` VALUES (16921015,390,-95,0);
INSERT INTO `mob_spawn_mods` VALUES (16912838,407,150,0); -- Jailer of Hope fastcast, -ga chance, 2hr/2hr multi
INSERT INTO `mob_spawn_mods` VALUES (16912838,7,60,1);
INSERT INTO `mob_spawn_mods` VALUES (16916815,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16916816,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16916817,55,300,1);

INSERT INTO `mob_spawn_mods` VALUES (17326081,50,25,1); -- Angra_Mainyu chainspell at 25%

INSERT INTO `mob_spawn_mods` VALUES (17293486,51,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17293486,31,5,1);

INSERT INTO `mob_spawn_mods` VALUES (17428812,17,1,1); -- Habetrot's Rumble Crawler
INSERT INTO `mob_spawn_mods` VALUES (17428811,1,2000,1);
INSERT INTO `mob_spawn_mods` VALUES (17428811,2,5625,1);

-- Timers for mobs that depop when idle+unclaimed
-- Sea
INSERT INTO `mob_spawn_mods` VALUES (16912838,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16912839,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16912846,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16912847,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16912848,55,300,1);
-- ZNM
INSERT INTO `mob_spawn_mods` VALUES (16986428,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16986429,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16986430,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16986431,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16998871,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16998872,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16998873,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16998874,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16990473,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16990474,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17027471,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17027472,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17027473,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17027474,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17027485,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17031598,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17031599,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17031600,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17043887,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17043888,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056157,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056186,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17072171,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17072172,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17072178,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17072179,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17101202,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17101203,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17101204,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17101205,55,180,1);

-- batch converted from lua SpawnMob
INSERT INTO `mob_spawn_mods` VALUES (17420629,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17420630,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17420631,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17629642,55,600,1);
INSERT INTO `mob_spawn_mods` VALUES (17629643,55,900,1);
INSERT INTO `mob_spawn_mods` VALUES (17629185,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17629186,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17404337,55,288,1);
INSERT INTO `mob_spawn_mods` VALUES (17506667,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17506418,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17174889,55,1800,1);
INSERT INTO `mob_spawn_mods` VALUES (17469516,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17272839,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17272838,55,288,1);
INSERT INTO `mob_spawn_mods` VALUES (17273285,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17236201,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17211848,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17502568,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17584134,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17584135,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17584132,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17584425,55,168,1);
INSERT INTO `mob_spawn_mods` VALUES (17584130,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17584129,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17584133,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17584131,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17391804,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17428816,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17428810,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17428809,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17428495,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17428496,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17428807,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17428808,55,180,1);

-- [Crimson Toothed Pawberry]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Crimson-toothed_Pawberry)
INSERT INTO `mob_spawn_mods` VALUES (17428813,1,18000,1); -- Min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17428813,2,32000,1); -- Max gil 32000
INSERT INTO `mob_spawn_mods` VALUES (17428813,15,5400,1); -- Mug gil 5400

INSERT INTO `mob_spawn_mods` VALUES (17428813,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17428815,55,300,1);

-- [Sozu Rogberry]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Crimson-toothed_Pawberry)
INSERT INTO `mob_spawn_mods` VALUES (17428751,1,1500,1); -- Min gil 1500
INSERT INTO `mob_spawn_mods` VALUES (17428751,2,4600,1); -- Max gil 4600
INSERT INTO `mob_spawn_mods` VALUES (17428751,15,1800,1); -- Mug gil 1800

INSERT INTO `mob_spawn_mods` VALUES (17428751,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17428811,55,900,1);
INSERT INTO `mob_spawn_mods` VALUES (17428812,55,900,1);
INSERT INTO `mob_spawn_mods` VALUES (17490232,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16806031,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17285544,55,150,1);
INSERT INTO `mob_spawn_mods` VALUES (17285545,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17285546,55,150,1);
INSERT INTO `mob_spawn_mods` VALUES (17424444,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17424480,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17580337,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17580038,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17678351,55,600,1);
INSERT INTO `mob_spawn_mods` VALUES (17309983,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17309981,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17309980,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17309982,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16921018,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16921019,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16921020,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17289654,55,168,1);
INSERT INTO `mob_spawn_mods` VALUES (17289655,55,168,1);
INSERT INTO `mob_spawn_mods` VALUES (16916813,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17436964,55,180,1);

-- [Geush Urvan]
-- Values taken from wiki (http://ffxiclopedia.wikia.com/wiki/Geush_Urvan)
INSERT INTO `mob_spawn_mods` VALUES (16798078,1,20000,1);
INSERT INTO `mob_spawn_mods` VALUES (16798078,2,27300,1);
INSERT INTO `mob_spawn_mods` VALUES (16798078,55,1800,1);

INSERT INTO `mob_spawn_mods` VALUES (17330309,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330310,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330311,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330319,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330320,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330321,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330420,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330421,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330422,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330432,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330433,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330434,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330383,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330384,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330385,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330395,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330396,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330397,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330355,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330356,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330357,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330362,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330363,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330364,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330365,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330366,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330367,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330372,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330373,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330374,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330337,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330338,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330339,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330347,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330348,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330349,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330445,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330446,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330447,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330457,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330458,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330459,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330513,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330514,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330515,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330516,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330517,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330518,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330334,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330335,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330336,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330344,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330345,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330346,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330442,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330443,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330444,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330454,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330455,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330456,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330306,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330307,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330308,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330316,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330317,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330318,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330423,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330424,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330425,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330435,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330436,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330437,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330380,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330381,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330382,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330392,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330393,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330394,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330495,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330496,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330497,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330503,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330504,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330505,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330290,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330291,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330292,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330299,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330300,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330301,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330522,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330523,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330524,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330525,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330526,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17330527,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17555863,55,600,1);
INSERT INTO `mob_spawn_mods` VALUES (17486187,55,168,1);
INSERT INTO `mob_spawn_mods` VALUES (17486188,55,168,1);
INSERT INTO `mob_spawn_mods` VALUES (17486189,55,168,1);
INSERT INTO `mob_spawn_mods` VALUES (17486190,55,1800,1);
INSERT INTO `mob_spawn_mods` VALUES (17363318,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16822459,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16998869,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16998870,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17244523,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17244524,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17244525,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17146147,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17396140,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17297450,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17297449,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17297446,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17297447,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17297448,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17240414,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17457309,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17113462,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17113464,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17612836,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17613129,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17649860,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17031401,55,900,1);
INSERT INTO `mob_spawn_mods` VALUES (17170645,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17228249,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17215494,55,288,1);
INSERT INTO `mob_spawn_mods` VALUES (16785722,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16785709,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17199566,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17199567,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17199568,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16867544,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16867455,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16867333,55,240,1);
INSERT INTO `mob_spawn_mods` VALUES (16867329,55,240,1);
INSERT INTO `mob_spawn_mods` VALUES (16867330,55,240,1);
INSERT INTO `mob_spawn_mods` VALUES (16867642,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17568137,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17568135,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17568136,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17568134,55,168,1);
INSERT INTO `mob_spawn_mods` VALUES (17207696,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17207710,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17207697,55,600,1);
INSERT INTO `mob_spawn_mods` VALUES (17207698,55,600,1);
INSERT INTO `mob_spawn_mods` VALUES (16892069,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16892073,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16892074,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16892070,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16892068,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056168,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17387970,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17387971,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17387965,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17387966,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17387967,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17387968,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17371579,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17596643,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17596533,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16793858,55,180,1);

-- [Hakutaku]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Hakutaku)
INSERT INTO `mob_spawn_mods` VALUES (17433005,1,11000,1); -- Min gil 11000
INSERT INTO `mob_spawn_mods` VALUES (17433005,2,18000,1); -- Max gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17433005,15,120,1);  -- Mug gil 3500

INSERT INTO `mob_spawn_mods` VALUES (17433005,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17576264,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17576267,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17576266,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17588706,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16875774,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16875778,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16875779,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17617158,55,900,1);

-- [Tarasque]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Tarasque)
INSERT INTO `mob_spawn_mods` VALUES (17617164,1,11000,1); -- Min gil 11000
INSERT INTO `mob_spawn_mods` VALUES (17617164,2,18000,1); -- Max gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17617164,55,900,1);

INSERT INTO `mob_spawn_mods` VALUES (17531121,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17043876,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17043877,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17043878,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17043879,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16826570,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16814088,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814091,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814081,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814086,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814095,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814093,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814092,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814087,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814083,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814432,55,900,1);
INSERT INTO `mob_spawn_mods` VALUES (16814090,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814094,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814089,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814361,55,240,1);
INSERT INTO `mob_spawn_mods` VALUES (16814096,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814084,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814082,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16814085,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16879899,55,900,1);
INSERT INTO `mob_spawn_mods` VALUES (16879897,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16879893,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16879894,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16879895,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17281031,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17281030,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17269107,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17269114,55,180,1);

-- Executioner Antlions
INSERT INTO `mob_spawn_mods` VALUES (16806243,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16806244,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16806245,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16806246,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16806247,55,120,1);

-- Koenigs Tiger
INSERT INTO `mob_spawn_mods` VALUES (17236205,55,240,1);

INSERT INTO `mob_spawn_mods` VALUES (16912829,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16912830,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16912831,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16912832,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16912833,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16912834,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16912835,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16912836,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16912837,55,180,1);

-- Cancer
INSERT INTO `mob_spawn_mods` VALUES (17490231,55,180,1);

INSERT INTO `mob_spawn_mods` VALUES (16806242,55,120,1);

-- Ix'Aern (DRG)
INSERT INTO `mob_spawn_mods` VALUES (16921022,55,300,1);

-- Ix'Aern (DRG)'s Wynavs
INSERT INTO `mob_spawn_mods` VALUES (16921023,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16921024,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (16921025,55,300,1);

-- Cryptonberry Executor + Assasins
INSERT INTO `mob_spawn_mods` VALUES (16785710,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16785711,55,420,1);
INSERT INTO `mob_spawn_mods` VALUES (16785712,55,420,1);
INSERT INTO `mob_spawn_mods` VALUES (16785713,55,420,1);

-- Old Professor
INSERT INTO `mob_spawn_mods` VALUES (16891970,55,300,1);

-- Pandemonium Warden
INSERT INTO `mob_spawn_mods` VALUES (17056170,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056171,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056172,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056173,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056174,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056175,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056176,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17056177,55,180,1);

-- Shen
INSERT INTO `mob_spawn_mods` VALUES (16793859,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16793860,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16793861,55,180,1);

INSERT INTO `mob_spawn_mods` VALUES (17576265,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17576268,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17576269,55,180,1);

--  Chariotbuster Byakzak
INSERT INTO `mob_spawn_mods` VALUES (17354895,55,600,1);
INSERT INTO `mob_spawn_mods` VALUES (17354896,55,600,1);

-- Mimics
INSERT INTO `mob_spawn_mods` VALUES (17379783,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17404338,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17396144,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17436965,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17584426,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17432583,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17576271,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17596728,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17617157,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17490230,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17391805,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (16826564,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17629190,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17309979,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17498564,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17428497,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17469761,55,120,1);
INSERT INTO `mob_spawn_mods` VALUES (17502567,55,120,1);

-- Strange Apperatus
INSERT INTO `mob_spawn_mods` VALUES (17559870,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17568139,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17572203,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17580340,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17584427,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17588704,55,300,1);
INSERT INTO `mob_spawn_mods` VALUES (17596729,55,300,1);

-- Phantom Worm
INSERT INTO `mob_spawn_mods` VALUES (17490233,55,180,1);

-- Olla Media, Olla Grande
INSERT INTO `mob_spawn_mods` VALUES (17506668,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17506669,55,180,1);

-- Jailer of Temperance
INSERT INTO `mob_spawn_mods` VALUES (16916814,55,300,1);

-- Jailer of Fortitude
INSERT INTO `mob_spawn_mods` VALUES (16921015,55,180,1);
-- Jailer of Fortitude Pets
INSERT INTO `mob_spawn_mods` VALUES (16921016,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (16921017,55,180,1);

-- Jailer of Faith
INSERT INTO `mob_spawn_mods` VALUES (16921021,55,900,1);

-- ?
INSERT INTO `mob_spawn_mods` VALUES (17588701,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17588702,55,180,1);
INSERT INTO `mob_spawn_mods` VALUES (17588703,55,180,1);

-- [Tonberry Kinq]
-- Values taken from wiki on 04/23/2018 (http://ffxiclopedia.wikia.com/wiki/Tonberry_Kinq)
INSERT INTO `mob_spawn_mods` VALUES (17428677,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17428677,2,30000,1); -- max gil 30000

-- [Ancient Goobbue]
-- Based on wiki (http://ffxiclopedia.wikia.com/wiki/Ancient_Goobbue)
INSERT INTO `mob_spawn_mods` VALUES (17404290,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17404290,2,30000,1); -- max gil 30000

-- [Aquarius]
-- Based on wiki (http://ffxiclopedia.wikia.com/wiki/Aquarius)
INSERT INTO `mob_spawn_mods` VALUES (17404000,1,20000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17404000,2,29000,1); -- max gil 29000
INSERT INTO `mob_spawn_mods` VALUES (17404000,15,10000,1); -- mug gil 10000

-- [Ellyllon]
-- Based on wiki (http://ffxiclopedia.wikia.com/wiki/Ellyllon)
INSERT INTO `mob_spawn_mods` VALUES (17092853,1,6000,1); -- min gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17092853,2,9300,1); -- max gil 9300
INSERT INTO `mob_spawn_mods` VALUES (17092853,15,4500,1); -- mug gil 4500

-- [Unut]
-- Based on wiki (http://ffxiclopedia.wikia.com/wiki/Unut)
INSERT INTO `mob_spawn_mods` VALUES (17092904,1,1800,1); -- min gil 1800
INSERT INTO `mob_spawn_mods` VALUES (17092904,2,5800,1); -- max gil 5800
INSERT INTO `mob_spawn_mods` VALUES (17092904,15,2500,1); -- mug gil 2500

-- [Sozu Terberry]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Crimson-toothed_Pawberry)
INSERT INTO `mob_spawn_mods` VALUES (17428611,1,3000,1); -- Min gil 3000
INSERT INTO `mob_spawn_mods` VALUES (17428611,2,4700,1); -- Max gil 4700
INSERT INTO `mob_spawn_mods` VALUES (17428611,15,800,1); -- Mug gil 800

-- [Carmine-Tailed Janberry]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Carmine-tailed_Janberry)
INSERT INTO `mob_spawn_mods` VALUES (17432659,1,18000,1); -- Min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17432659,2,28400,1); -- Max gil 28400
INSERT INTO `mob_spawn_mods` VALUES (17432659,15,3500,1); -- Mug gil 3500

-- [Friar Rush]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Friar_Rush)
INSERT INTO `mob_spawn_mods` VALUES (17432640,1,9000,1);  -- Min gil 9000
INSERT INTO `mob_spawn_mods` VALUES (17432640,2,15000,1); -- Max gil 15000

-- [Tonberry Decapitator]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Tonberry_Decapitator)
INSERT INTO `mob_spawn_mods` VALUES (17432989,1,5000,1); -- Min gil 5000
INSERT INTO `mob_spawn_mods` VALUES (17432989,2,9000,1); -- Max gil 9000
INSERT INTO `mob_spawn_mods` VALUES (17433002,1,5000,1); -- Min gil 5000
INSERT INTO `mob_spawn_mods` VALUES (17433002,2,9000,1); -- Max gil 9000

-- [Tonberry Pontifex]
-- Best guess from kill on youtube (https://www.youtube.com/watch?v=AgOq2kGoW0g)
INSERT INTO `mob_spawn_mods` VALUES (17433003,1,8000,1); -- Min gil 8000
INSERT INTO `mob_spawn_mods` VALUES (17433003,2,12000,1); -- Max gil 12000

-- [Tonberry Tracker]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Tonberry_Decapitator)
INSERT INTO `mob_spawn_mods` VALUES (17433001,1,6000,1); -- Min gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17433001,2,9200,1); -- Max gil 9200
INSERT INTO `mob_spawn_mods` VALUES (17433004,1,6000,1); -- Min gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17433004,2,9200,1); -- Max gil 9200

-- [Foreseer Oramix]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Foreseer_Oramix)
INSERT INTO `mob_spawn_mods` VALUES (17617062,1,6000,1); -- Min gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17617062,2,9200,1); -- Max gil 9200

-- [Lindwurm]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Lindwurm)
INSERT INTO `mob_spawn_mods` VALUES (17617013,1,18000,1); -- Min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17617013,2,27000,1); -- Max gil 27000
INSERT INTO `mob_spawn_mods` VALUES (17617013,15,3000,1); -- Mug gil 3000

-- [Tyrannic Tunnok]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Tyrannic_Tunnok)
INSERT INTO `mob_spawn_mods` VALUES (17616999,1,3000,1);  -- Min gil 3000
INSERT INTO `mob_spawn_mods` VALUES (17616999,2,9000,1);  -- Max gil 9000
INSERT INTO `mob_spawn_mods` VALUES (17616999,15,2000,1); -- Mug gil 2000

-- [Amikiri]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Amikiri)
INSERT INTO `mob_spawn_mods` VALUES (17645774,1,10000,1); -- min gil 10000
INSERT INTO `mob_spawn_mods` VALUES (17645774,2,15000,1); -- max gil 15000

-- [Baobhan Sith]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Baobhan_Sith)
INSERT INTO `mob_spawn_mods` VALUES (17645719,1,8000,1);  -- min gil 8000
INSERT INTO `mob_spawn_mods` VALUES (17645719,2,12000,1); -- max gil 12000

-- [Goblinsavior Heronox]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Goblinsavior_Heronox)
INSERT INTO `mob_spawn_mods` VALUES (17645609,1,6000,1);  -- min gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17645609,2,10000,1); -- max gil 10000
INSERT INTO `mob_spawn_mods` VALUES (17645609,15,3000,1); -- mug gil 3000

-- [Taxim]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Taxim)
INSERT INTO `mob_spawn_mods` VALUES (17645742,1,3500,1); -- min gil 3500
INSERT INTO `mob_spawn_mods` VALUES (17645742,2,5600,1); -- max gil 5600

-- [Ungur]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Ungur)
INSERT INTO `mob_spawn_mods` VALUES (17645755,1,12000,1); -- min gil 12000
INSERT INTO `mob_spawn_mods` VALUES (17645755,2,19400,1); -- max gil 19400
INSERT INTO `mob_spawn_mods` VALUES (17645755,15,4700,1); -- mug gil 4700

-- [Wyvernpoacher Drachlox]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Wyvernpoacher_Drachlox)
INSERT INTO `mob_spawn_mods` VALUES (17645640,1,4000,1);  -- min gil 4000
INSERT INTO `mob_spawn_mods` VALUES (17645640,2,8000,1);  -- max gil 8000
INSERT INTO `mob_spawn_mods` VALUES (17645640,15,4300,1); -- mug gil 4300

-- [Arachne]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Arachne)
INSERT INTO `mob_spawn_mods` VALUES (17490217,1,4000,1);  -- min gil 4000
INSERT INTO `mob_spawn_mods` VALUES (17490217,2,8000,1);  -- max gil 8000
INSERT INTO `mob_spawn_mods` VALUES (17490217,15,3500,1); -- mug gil 3500

-- [Bloodthirster Madkix]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Bloodthirster_Madkix)
INSERT INTO `mob_spawn_mods` VALUES (17490159,1,4000,1);  -- min gil 4000
INSERT INTO `mob_spawn_mods` VALUES (17490159,2,8000,1);  -- max gil 8000

-- [Guivre]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Guivre)
INSERT INTO `mob_spawn_mods` VALUES (17490234,1,14000,1); -- min gil 14000
INSERT INTO `mob_spawn_mods` VALUES (17490234,2,18300,1); -- max gil 18300
INSERT INTO `mob_spawn_mods` VALUES (17490234,15,3100,1); -- mug gil 3100

-- [Pelican]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Pelican)
INSERT INTO `mob_spawn_mods` VALUES (17490101,1,12000,1); -- min gil 12000
INSERT INTO `mob_spawn_mods` VALUES (17490101,2,18000,1); -- max gil 18000

-- [Sabotender Mariachi]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Sabotender_Mariachi)
INSERT INTO `mob_spawn_mods` VALUES (17489980,1,15000,1); -- min gil 15000
INSERT INTO `mob_spawn_mods` VALUES (17489980,2,20000,1); -- max gil 20000

-- [Yowie]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Yowie)
INSERT INTO `mob_spawn_mods` VALUES (17490204,1,12000,1); -- min gil 12000
INSERT INTO `mob_spawn_mods` VALUES (17490204,2,19000,1); -- max gil 19000
INSERT INTO `mob_spawn_mods` VALUES (17490204,15,4000,1); -- mug gil 4000
-- [Abyss Sahagin]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Abyss_Sahagin)
INSERT INTO `mob_spawn_mods` VALUES (17498545,1,6000,1);  -- min gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17498545,2,9500,1);  -- max gil 9500
INSERT INTO `mob_spawn_mods` VALUES (17498545,15,6000,1); -- mug gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17498558,1,6000,1);  -- min gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17498558,2,9500,1);  -- max gil 9500
INSERT INTO `mob_spawn_mods` VALUES (17498558,15,6000,1); -- mug gil 6000

-- [Charybdis]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Charybdis)
INSERT INTO `mob_spawn_mods` VALUES (17498522,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17498522,2,29000,1); -- max gil 29000

-- [Coral Sahagin]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Coral_Sahagin)
INSERT INTO `mob_spawn_mods` VALUES (17498559,1,6000,1);  -- min gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17498559,2,9500,1);  -- max gil 9500
INSERT INTO `mob_spawn_mods` VALUES (17498559,15,6000,1); -- mug gil 6000

-- [Denn the Orcavoiced]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Denn_the_Orcavoiced)
INSERT INTO `mob_spawn_mods` VALUES (17498464,1,3000,1);  -- min gil 3000
INSERT INTO `mob_spawn_mods` VALUES (17498464,2,5000,1);  -- max gil 5000
INSERT INTO `mob_spawn_mods` VALUES (17498464,15,2000,1); -- mug gil 2000

-- [Fyuu the Seabellow]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Fyuu_the_Seabellow)
INSERT INTO `mob_spawn_mods` VALUES (17498269,1,800,1);   -- min gil 800
INSERT INTO `mob_spawn_mods` VALUES (17498269,2,4000,1);  -- max gil 4000
INSERT INTO `mob_spawn_mods` VALUES (17498269,15,2000,1); -- mug gil 2000

-- [Masan]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Masan)
INSERT INTO `mob_spawn_mods` VALUES (17498159,1,800,1);   -- min gil 800
INSERT INTO `mob_spawn_mods` VALUES (17498159,2,1500,1);  -- max gil 1500
INSERT INTO `mob_spawn_mods` VALUES (17498159,15,1200,1); -- mug gil 1200

-- [Mouu the Waverider]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Mouu_the_Waverider)
INSERT INTO `mob_spawn_mods` VALUES (17498356,1,1000,1);  -- min gil 1000
INSERT INTO `mob_spawn_mods` VALUES (17498356,2,3000,1);  -- max gil 3000
INSERT INTO `mob_spawn_mods` VALUES (17498356,15,2400,1); -- mug gil 2400

-- [Namtar]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Namtar)
INSERT INTO `mob_spawn_mods` VALUES (17498184,1,1000,1);  -- min gil 1000
INSERT INTO `mob_spawn_mods` VALUES (17498184,2,2000,1);  -- max gil 2000

-- [Novv the Whitehearted]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Novv_the_Whitehearted)
INSERT INTO `mob_spawn_mods` VALUES (17498445,1,4800,1);  -- min gil 4800
INSERT INTO `mob_spawn_mods` VALUES (17498445,2,8000,1);  -- max gil 8000
INSERT INTO `mob_spawn_mods` VALUES (17498445,15,4700,1); -- max gil 4700

-- [Ocean Sahagin]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Ocean_Sahagin)
INSERT INTO `mob_spawn_mods` VALUES (17498560,1,8000,1);   -- min gil 8000
INSERT INTO `mob_spawn_mods` VALUES (17498560,2,14000,1);  -- max gil 14000
INSERT INTO `mob_spawn_mods` VALUES (17498560,15,10000,1); -- max gil 10000

-- [Pahh the Gullcaller]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Pahh_the_Gullcaller)
INSERT INTO `mob_spawn_mods` VALUES (17498341,1,3600,1);  -- min gil 3600
INSERT INTO `mob_spawn_mods` VALUES (17498341,2,6000,1);  -- max gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17498341,15,3200,1); -- max gil 3200

-- [Qull the Shellbester]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Qull_the_Shellbuster)
INSERT INTO `mob_spawn_mods` VALUES (17498285,1,3600,1);  -- min gil 3600
INSERT INTO `mob_spawn_mods` VALUES (17498285,2,6000,1);  -- max gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17498285,15,3200,1); -- max gil 3200

-- [Sea Hog]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Sea_Hog)
INSERT INTO `mob_spawn_mods` VALUES (17498420,1,3600,1);  -- min gil 3600
INSERT INTO `mob_spawn_mods` VALUES (17498420,2,6000,1);  -- max gil 6000
INSERT INTO `mob_spawn_mods` VALUES (17498420,15,1500,1); -- max gil 1500

-- [Voll the Sharkfinned]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Voll_the_Sharkfinned)
INSERT INTO `mob_spawn_mods` VALUES (17498428,1,3000,1);  -- min gil 3000
INSERT INTO `mob_spawn_mods` VALUES (17498428,2,4600,1);  -- max gil 4600

-- [Worr the Clawfisted]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Worr_the_Clawfisted)
INSERT INTO `mob_spawn_mods` VALUES (17498413,1,3700,1);  -- min gil 3700
INSERT INTO `mob_spawn_mods` VALUES (17498413,2,7500,1);  -- max gil 7500
INSERT INTO `mob_spawn_mods` VALUES (17498413,15,2500,1); -- max gil 2500

-- [Wuur the Sandcomber]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Wuur_the_Sandcomber)
INSERT INTO `mob_spawn_mods` VALUES (17498199,1,2400,1);  -- min gil 2400
INSERT INTO `mob_spawn_mods` VALUES (17498199,2,3900,1);  -- max gil 3900
INSERT INTO `mob_spawn_mods` VALUES (17498199,15,1100,1); -- max gil 1100

-- [Yarr the Pearleyed]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Yarr_the_Pearleyed)
INSERT INTO `mob_spawn_mods` VALUES (17498436,1,3000,1);  -- min gil 3000
INSERT INTO `mob_spawn_mods` VALUES (17498436,2,5000,1);  -- max gil 5000
INSERT INTO `mob_spawn_mods` VALUES (17498436,15,3000,1); -- max gil 3000

-- [Zuug the Shoreleaper]
-- Data from wiki (http://ffxiclopedia.wikia.com/wiki/Zuug_the_Shoreleaper)
INSERT INTO `mob_spawn_mods` VALUES (17498516,1,3000,1);  -- min gil 3000
INSERT INTO `mob_spawn_mods` VALUES (17498516,2,9000,1);  -- max gil 9000
INSERT INTO `mob_spawn_mods` VALUES (17498516,15,3000,1); -- max gil 3000

-- [Antican Praetor]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Antican_Praetor)
INSERT INTO `mob_spawn_mods` VALUES (17629621,1,4000,1); -- min gil 4000
INSERT INTO `mob_spawn_mods` VALUES (17629621,2,8000,1); -- max gil 8000
INSERT INTO `mob_spawn_mods` VALUES (17629639,1,4000,1); -- min gil 4000
INSERT INTO `mob_spawn_mods` VALUES (17629639,2,8000,1); -- max gil 8000

-- [Nussknacker]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Nussknacker)
INSERT INTO `mob_spawn_mods` VALUES (17093048,1,4000,1);  -- min gil 4000
INSERT INTO `mob_spawn_mods` VALUES (17093048,2,8000,1);  -- max gil 8000
INSERT INTO `mob_spawn_mods` VALUES (17093048,15,2000,1); -- mug gil 2000

-- [Sabotender Bailarina]
-- Data taken from wiki (http://ffxiclopedia.wikia.com/wiki/Sabotender_Bailarina)
INSERT INTO `mob_spawn_mods` VALUES (17629587,1,12000,1); -- min gil 12000
INSERT INTO `mob_spawn_mods` VALUES (17629587,2,20000,1); -- max gil 20000
INSERT INTO `mob_spawn_mods` VALUES (17629587,15,3000,1); -- mug gil 3000

-- Sewer Syrup
INSERT INTO `mob_spawn_mods` VALUES (17461307,1,4000,1);
INSERT INTO `mob_spawn_mods` VALUES (17461307,2,19000,1);
INSERT INTO `mob_spawn_mods` VALUES (17461307,15,3500,1);

-- [Narasimha]
-- Values taken from wiki on 04/23/2018 (http://ffxiclopedia.wikia.com/wiki/Narasimha)
INSERT INTO `mob_spawn_mods` VALUES (17649784,1,12000,1); -- min gil 12000
INSERT INTO `mob_spawn_mods` VALUES (17649784,2,20000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17649784,15,4800,1); -- mug gil 4800

/*!40000 ALTER TABLE `mob_spawn_mods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
