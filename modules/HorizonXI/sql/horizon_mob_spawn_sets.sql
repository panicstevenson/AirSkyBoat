-- --------------------------------------------------------
-- Horizon Mob Spawn Sets
-- --------------------------------------------------------
-- This module is used to control spawn sets within a zone
-- Spawnsetid is defined in the mob_spawn_points table, and is unique per zone
-- --------------------------------------------------------

-- Add the spawn set table

DROP TABLE IF EXISTS `mob_spawn_sets`;
CREATE TABLE IF NOT EXISTS `mob_spawn_sets` (
	`zoneid`		SMALLINT(3) NOT NULL DEFAULT '0',
	`spawnsetid`	TINYINT(3)	NOT NULL DEFAULT '0',
	`maxspawns`		TINYINT(4)	NOT NULL DEFAULT '0',
	PRIMARY KEY (`zoneid`, `spawnsetid`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

-- AlTaieu
INSERT INTO `mob_spawn_sets` VALUES (33, 1, 7);
INSERT INTO `mob_spawn_sets` VALUES (33, 2, 1);
INSERT INTO `mob_spawn_sets` VALUES (33, 3, 3);
INSERT INTO `mob_spawn_sets` VALUES (33, 4, 7);
INSERT INTO `mob_spawn_sets` VALUES (33, 5, 3);
INSERT INTO `mob_spawn_sets` VALUES (33, 6, 4);
INSERT INTO `mob_spawn_sets` VALUES (33, 7, 9);
INSERT INTO `mob_spawn_sets` VALUES (33, 8, 3);
INSERT INTO `mob_spawn_sets` VALUES (33, 9, 2);
INSERT INTO `mob_spawn_sets` VALUES (33, 10, 3);
INSERT INTO `mob_spawn_sets` VALUES (33, 11, 2);
INSERT INTO `mob_spawn_sets` VALUES (33, 12, 1);
INSERT INTO `mob_spawn_sets` VALUES (33, 13, 1);

-- Attowha Chasm
INSERT INTO `mob_spawn_sets` VALUES (7, 1, 1);
INSERT INTO `mob_spawn_sets` VALUES (7, 2, 1);
INSERT INTO `mob_spawn_sets` VALUES (7, 3, 1);
INSERT INTO `mob_spawn_sets` VALUES (7, 4, 1);

-- Batallia Downs
INSERT INTO `mob_spawn_sets` VALUES (105, 1, 3);
INSERT INTO `mob_spawn_sets` VALUES (105, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (105, 3, 3);
INSERT INTO `mob_spawn_sets` VALUES (105, 4, 7);
INSERT INTO `mob_spawn_sets` VALUES (105, 5, 3);
INSERT INTO `mob_spawn_sets` VALUES (105, 6, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 7, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 8, 6);
INSERT INTO `mob_spawn_sets` VALUES (105, 9, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 10, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 11, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 12, 6);
INSERT INTO `mob_spawn_sets` VALUES (105, 13, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 14, 3);
INSERT INTO `mob_spawn_sets` VALUES (105, 15, 6);
INSERT INTO `mob_spawn_sets` VALUES (105, 16, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 17, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 18, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 19, 6);
INSERT INTO `mob_spawn_sets` VALUES (105, 20, 3);
INSERT INTO `mob_spawn_sets` VALUES (105, 21, 3);
INSERT INTO `mob_spawn_sets` VALUES (105, 22, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 23, 4);
INSERT INTO `mob_spawn_sets` VALUES (105, 24, 3);
INSERT INTO `mob_spawn_sets` VALUES (105, 25, 3);
INSERT INTO `mob_spawn_sets` VALUES (105, 26, 7);
INSERT INTO `mob_spawn_sets` VALUES (105, 27, 2);
INSERT INTO `mob_spawn_sets` VALUES (105, 28, 4);
INSERT INTO `mob_spawn_sets` VALUES (105, 29, 8);
INSERT INTO `mob_spawn_sets` VALUES (105, 30, 7);
INSERT INTO `mob_spawn_sets` VALUES (105, 31, 9);

-- Beadeaux
INSERT INTO `mob_spawn_sets` VALUES (147, 1, 1);
INSERT INTO `mob_spawn_sets` VALUES (147, 2, 1);
INSERT INTO `mob_spawn_sets` VALUES (147, 3, 1);
INSERT INTO `mob_spawn_sets` VALUES (147, 4, 1);
INSERT INTO `mob_spawn_sets` VALUES (147, 5, 1);
INSERT INTO `mob_spawn_sets` VALUES (147, 6, 1);
INSERT INTO `mob_spawn_sets` VALUES (147, 7, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 8, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 9, 1);
INSERT INTO `mob_spawn_sets` VALUES (147, 10, 1);
INSERT INTO `mob_spawn_sets` VALUES (147, 11, 1);
INSERT INTO `mob_spawn_sets` VALUES (147, 12, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 13, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 14, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 15, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 16, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 17, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 18, 3);
INSERT INTO `mob_spawn_sets` VALUES (147, 19, 3);
INSERT INTO `mob_spawn_sets` VALUES (147, 20, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 21, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 22, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 23, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 24, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 25, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 26, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 27, 2);
INSERT INTO `mob_spawn_sets` VALUES (147, 28, 2);

-- Beaucedine Glacier
INSERT INTO `mob_spawn_sets` VALUES (111, 1, 1);
INSERT INTO `mob_spawn_sets` VALUES (111, 2, 1);
INSERT INTO `mob_spawn_sets` VALUES (111, 3, 1);
INSERT INTO `mob_spawn_sets` VALUES (111, 4, 1);
INSERT INTO `mob_spawn_sets` VALUES (111, 5, 1);
INSERT INTO `mob_spawn_sets` VALUES (111, 6, 1);
INSERT INTO `mob_spawn_sets` VALUES (111, 7, 1);
INSERT INTO `mob_spawn_sets` VALUES (111, 8, 1);

-- Behemoths_Dominion (NONE)

-- Bibiki Bay
INSERT INTO `mob_spawn_sets` VALUES (4, 1, 5);
INSERT INTO `mob_spawn_sets` VALUES (4, 2, 1);
INSERT INTO `mob_spawn_sets` VALUES (4, 3, 2);
INSERT INTO `mob_spawn_sets` VALUES (4, 4, 2);
INSERT INTO `mob_spawn_sets` VALUES (4, 5, 2);
INSERT INTO `mob_spawn_sets` VALUES (4, 6, 1);
INSERT INTO `mob_spawn_sets` VALUES (4, 7, 1);

-- Buburimu_Peninsula
INSERT INTO `mob_spawn_sets` VALUES (118, 1, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 3, 2);
INSERT INTO `mob_spawn_sets` VALUES (118, 4, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 5, 2);
INSERT INTO `mob_spawn_sets` VALUES (118, 6, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 7, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 8, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 9, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 10, 6);
INSERT INTO `mob_spawn_sets` VALUES (118, 11, 6);
INSERT INTO `mob_spawn_sets` VALUES (118, 12, 6);
INSERT INTO `mob_spawn_sets` VALUES (118, 13, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 14, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 15, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 16, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 17, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 18, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 19, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 20, 3);
INSERT INTO `mob_spawn_sets` VALUES (118, 21, 8);

-- Cape Terrigan
INSERT INTO `mob_spawn_sets` VALUES (113, 1, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 2, 4);
INSERT INTO `mob_spawn_sets` VALUES (113, 3, 5);
INSERT INTO `mob_spawn_sets` VALUES (113, 4, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 5, 5);
INSERT INTO `mob_spawn_sets` VALUES (113, 6, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 7, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 8, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 9, 5);
INSERT INTO `mob_spawn_sets` VALUES (113, 10, 2);
INSERT INTO `mob_spawn_sets` VALUES (113, 11, 4);
INSERT INTO `mob_spawn_sets` VALUES (113, 12, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 13, 2);
INSERT INTO `mob_spawn_sets` VALUES (113, 14, 5);
INSERT INTO `mob_spawn_sets` VALUES (113, 15, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 16, 5);
INSERT INTO `mob_spawn_sets` VALUES (113, 17, 5);
INSERT INTO `mob_spawn_sets` VALUES (113, 18, 4);
INSERT INTO `mob_spawn_sets` VALUES (113, 19, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 20, 7);
INSERT INTO `mob_spawn_sets` VALUES (113, 21, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 22, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 23, 4);
INSERT INTO `mob_spawn_sets` VALUES (113, 24, 7);
INSERT INTO `mob_spawn_sets` VALUES (113, 25, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 26, 5);
INSERT INTO `mob_spawn_sets` VALUES (113, 27, 4);
INSERT INTO `mob_spawn_sets` VALUES (113, 28, 2);
INSERT INTO `mob_spawn_sets` VALUES (113, 29, 9);
INSERT INTO `mob_spawn_sets` VALUES (113, 30, 6);
INSERT INTO `mob_spawn_sets` VALUES (113, 31, 2);
INSERT INTO `mob_spawn_sets` VALUES (113, 32, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 33, 4);
INSERT INTO `mob_spawn_sets` VALUES (113, 34, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 35, 2);
INSERT INTO `mob_spawn_sets` VALUES (113, 36, 2);
INSERT INTO `mob_spawn_sets` VALUES (113, 37, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 38, 2);
INSERT INTO `mob_spawn_sets` VALUES (113, 39, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 40, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 41, 4);
INSERT INTO `mob_spawn_sets` VALUES (113, 42, 1);
INSERT INTO `mob_spawn_sets` VALUES (113, 43, 6);
INSERT INTO `mob_spawn_sets` VALUES (113, 44, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 45, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 46, 2);
INSERT INTO `mob_spawn_sets` VALUES (113, 47, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 48, 5);
INSERT INTO `mob_spawn_sets` VALUES (113, 49, 2);
INSERT INTO `mob_spawn_sets` VALUES (113, 50, 3);
INSERT INTO `mob_spawn_sets` VALUES (113, 51, 4);
INSERT INTO `mob_spawn_sets` VALUES (113, 52, 4);
INSERT INTO `mob_spawn_sets` VALUES (113, 53, 4);

-- Carpenters Landing
INSERT INTO `mob_spawn_sets` VALUES (2, 1, 1);
INSERT INTO `mob_spawn_sets` VALUES (2, 2, 2);
INSERT INTO `mob_spawn_sets` VALUES (2, 3, 2);
INSERT INTO `mob_spawn_sets` VALUES (2, 4, 1);
INSERT INTO `mob_spawn_sets` VALUES (2, 5, 2);
INSERT INTO `mob_spawn_sets` VALUES (2, 6, 2);

-- Castle Oztroja
INSERT INTO `mob_spawn_sets` VALUES (151, 1, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 2, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 3, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 4, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 5, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 6, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 7, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 8, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 9, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 10, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 11, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 12, 1);
INSERT INTO `mob_spawn_sets` VALUES (151, 13, 1);

-- Castle Zvahl Baileys
INSERT INTO `mob_spawn_sets` VALUES (161, 1, 2);
INSERT INTO `mob_spawn_sets` VALUES (161, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (161, 3, 2);
INSERT INTO `mob_spawn_sets` VALUES (161, 4, 2);
INSERT INTO `mob_spawn_sets` VALUES (161, 5, 2);
INSERT INTO `mob_spawn_sets` VALUES (161, 6, 2);
INSERT INTO `mob_spawn_sets` VALUES (161, 7, 2);
INSERT INTO `mob_spawn_sets` VALUES (161, 8, 2);
INSERT INTO `mob_spawn_sets` VALUES (161, 9, 4);
INSERT INTO `mob_spawn_sets` VALUES (161, 10, 4);
INSERT INTO `mob_spawn_sets` VALUES (161, 11, 4);
INSERT INTO `mob_spawn_sets` VALUES (161, 12, 4);

-- Castle Zvahl Keep
INSERT INTO `mob_spawn_sets` VALUES (162, 1, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 2, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 3, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 4, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 5, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 6, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 7, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 8, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 9, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 10, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 11, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 12, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 13, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 14, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 15, 2);
INSERT INTO `mob_spawn_sets` VALUES (162, 16, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 17, 4);
INSERT INTO `mob_spawn_sets` VALUES (162, 18, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 19, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 20, 1);
INSERT INTO `mob_spawn_sets` VALUES (162, 21, 1);

-- Davoi
INSERT INTO `mob_spawn_sets` VALUES (149, 1, 1);
INSERT INTO `mob_spawn_sets` VALUES (149, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (149, 3, 4);
INSERT INTO `mob_spawn_sets` VALUES (149, 4, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 5, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 6, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 7, 5);
INSERT INTO `mob_spawn_sets` VALUES (149, 8, 5);
INSERT INTO `mob_spawn_sets` VALUES (149, 9, 4);
INSERT INTO `mob_spawn_sets` VALUES (149, 10, 4);
INSERT INTO `mob_spawn_sets` VALUES (149, 11, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 12, 4);
INSERT INTO `mob_spawn_sets` VALUES (149, 13, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 14, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 15, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 16, 1);
INSERT INTO `mob_spawn_sets` VALUES (149, 17, 4);
INSERT INTO `mob_spawn_sets` VALUES (149, 18, 1);
INSERT INTO `mob_spawn_sets` VALUES (149, 19, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 20, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 21, 6);
INSERT INTO `mob_spawn_sets` VALUES (149, 22, 6);
INSERT INTO `mob_spawn_sets` VALUES (149, 23, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 24, 1);
INSERT INTO `mob_spawn_sets` VALUES (149, 25, 3);
INSERT INTO `mob_spawn_sets` VALUES (149, 26, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 27, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 28, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 29, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 30, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 31, 1);
INSERT INTO `mob_spawn_sets` VALUES (149, 32, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 33, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 34, 4);
INSERT INTO `mob_spawn_sets` VALUES (149, 35, 1);
INSERT INTO `mob_spawn_sets` VALUES (149, 36, 4);
INSERT INTO `mob_spawn_sets` VALUES (149, 37, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 38, 1);
INSERT INTO `mob_spawn_sets` VALUES (149, 39, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 40, 1);
INSERT INTO `mob_spawn_sets` VALUES (149, 41, 2);
INSERT INTO `mob_spawn_sets` VALUES (149, 42, 1);

-- Eastern Altepa Desert
INSERT INTO `mob_spawn_sets` VALUES (114, 1, 4);
INSERT INTO `mob_spawn_sets` VALUES (114, 2, 2);

-- East Ronfaure
INSERT INTO `mob_spawn_sets` VALUES (101, 1, 2);
INSERT INTO `mob_spawn_sets` VALUES (101, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 3, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 4, 5);
INSERT INTO `mob_spawn_sets` VALUES (101, 5, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 6, 5);
INSERT INTO `mob_spawn_sets` VALUES (101, 7, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 8, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 9, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 10, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 11, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 12, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 13, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 14, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 15, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 16, 2);
INSERT INTO `mob_spawn_sets` VALUES (101, 17, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 18, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 19, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 20, 3);
INSERT INTO `mob_spawn_sets` VALUES (101, 21, 12);

-- East Sarutabaruta
INSERT INTO `mob_spawn_sets` VALUES (116, 1, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 3, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 4, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 5, 2);
INSERT INTO `mob_spawn_sets` VALUES (116, 6, 2);
INSERT INTO `mob_spawn_sets` VALUES (116, 7, 6);
INSERT INTO `mob_spawn_sets` VALUES (116, 8, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 9, 4);
INSERT INTO `mob_spawn_sets` VALUES (116, 10, 6);
INSERT INTO `mob_spawn_sets` VALUES (116, 11, 5);
INSERT INTO `mob_spawn_sets` VALUES (116, 12, 2);
INSERT INTO `mob_spawn_sets` VALUES (116, 13, 2);
INSERT INTO `mob_spawn_sets` VALUES (116, 14, 5);
INSERT INTO `mob_spawn_sets` VALUES (116, 15, 5);
INSERT INTO `mob_spawn_sets` VALUES (116, 16, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 17, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 18, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 19, 2);
INSERT INTO `mob_spawn_sets` VALUES (116, 20, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 21, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 22, 3);
INSERT INTO `mob_spawn_sets` VALUES (116, 23, 3);

-- Fort Ghelsba
INSERT INTO `mob_spawn_sets` VALUES (141, 1, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 2, 1);
INSERT INTO `mob_spawn_sets` VALUES (141, 3, 4);
INSERT INTO `mob_spawn_sets` VALUES (141, 4, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 5, 2);
INSERT INTO `mob_spawn_sets` VALUES (141, 6, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 7, 2);
INSERT INTO `mob_spawn_sets` VALUES (141, 8, 2);
INSERT INTO `mob_spawn_sets` VALUES (141, 9, 2);
INSERT INTO `mob_spawn_sets` VALUES (141, 10, 2);
INSERT INTO `mob_spawn_sets` VALUES (141, 11, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 12, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 13, 4);
INSERT INTO `mob_spawn_sets` VALUES (141, 14, 4);
INSERT INTO `mob_spawn_sets` VALUES (141, 15, 2);
INSERT INTO `mob_spawn_sets` VALUES (141, 16, 4);
INSERT INTO `mob_spawn_sets` VALUES (141, 17, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 18, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 19, 4);
INSERT INTO `mob_spawn_sets` VALUES (141, 20, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 21, 5);
INSERT INTO `mob_spawn_sets` VALUES (141, 22, 4);
INSERT INTO `mob_spawn_sets` VALUES (141, 23, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 24, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 25, 3);
INSERT INTO `mob_spawn_sets` VALUES (141, 26, 2);
INSERT INTO `mob_spawn_sets` VALUES (141, 27, 7);

-- Ghelsba Outpost
INSERT INTO `mob_spawn_sets` VALUES (140, 1, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 2, 2);
INSERT INTO `mob_spawn_sets` VALUES (140, 3, 1);
INSERT INTO `mob_spawn_sets` VALUES (140, 4, 5);
INSERT INTO `mob_spawn_sets` VALUES (140, 5, 5);
INSERT INTO `mob_spawn_sets` VALUES (140, 6, 5);
INSERT INTO `mob_spawn_sets` VALUES (140, 7, 1);
INSERT INTO `mob_spawn_sets` VALUES (140, 8, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 9, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 10, 1);
INSERT INTO `mob_spawn_sets` VALUES (140, 11, 2);
INSERT INTO `mob_spawn_sets` VALUES (140, 12, 1);
INSERT INTO `mob_spawn_sets` VALUES (140, 13, 4);
INSERT INTO `mob_spawn_sets` VALUES (140, 14, 1);
INSERT INTO `mob_spawn_sets` VALUES (140, 15, 1);
INSERT INTO `mob_spawn_sets` VALUES (140, 16, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 17, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 18, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 19, 1);
INSERT INTO `mob_spawn_sets` VALUES (140, 20, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 21, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 22, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 23, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 24, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 25, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 26, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 27, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 28, 3);
INSERT INTO `mob_spawn_sets` VALUES (140, 29, 2);
INSERT INTO `mob_spawn_sets` VALUES (140, 30, 2);
INSERT INTO `mob_spawn_sets` VALUES (140, 31, 4);

-- Giddeus
INSERT INTO `mob_spawn_sets` VALUES (145, 1, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 2, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 3, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 4, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 5, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 6, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 7, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 8, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 9, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 10, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 11, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 12, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 13, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 14, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 15, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 16, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 17, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 18, 3);
INSERT INTO `mob_spawn_sets` VALUES (145, 19, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 20, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 21, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 22, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 23, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 24, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 25, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 26, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 27, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 28, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 29, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 30, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 31, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 32, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 33, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 34, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 35, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 36, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 37, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 38, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 39, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 40, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 41, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 42, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 43, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 44, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 45, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 46, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 47, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 48, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 49, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 50, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 51, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 52, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 53, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 54, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 55, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 56, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 57, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 58, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 59, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 60, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 61, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 62, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 63, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 64, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 65, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 66, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 67, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 68, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 69, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 70, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 71, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 72, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 73, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 74, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 75, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 76, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 77, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 78, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 79, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 80, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 81, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 82, 2);
INSERT INTO `mob_spawn_sets` VALUES (145, 83, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 84, 1);
INSERT INTO `mob_spawn_sets` VALUES (145, 85, 2);

-- Grand Palace of HuXzoi
INSERT INTO `mob_spawn_sets` VALUES (34, 1, 2);
INSERT INTO `mob_spawn_sets` VALUES (34, 2, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 3, 3);
INSERT INTO `mob_spawn_sets` VALUES (34, 4, 1);
INSERT INTO `mob_spawn_sets` VALUES (34, 5, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 6, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 7, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 8, 2);
INSERT INTO `mob_spawn_sets` VALUES (34, 9, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 10, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 11, 1);
INSERT INTO `mob_spawn_sets` VALUES (34, 12, 1);
INSERT INTO `mob_spawn_sets` VALUES (34, 13, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 14, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 15, 1);
INSERT INTO `mob_spawn_sets` VALUES (34, 16, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 17, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 18, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 19, 2);
INSERT INTO `mob_spawn_sets` VALUES (34, 20, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 21, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 22, 1);
INSERT INTO `mob_spawn_sets` VALUES (34, 23, 4);
INSERT INTO `mob_spawn_sets` VALUES (34, 24, 1);
INSERT INTO `mob_spawn_sets` VALUES (34, 25, 3);

-- Jugner Forest
INSERT INTO `mob_spawn_sets` VALUES (104, 1, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (104, 3, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 4, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 5, 6);
INSERT INTO `mob_spawn_sets` VALUES (104, 6, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 7, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 8, 6);
INSERT INTO `mob_spawn_sets` VALUES (104, 9, 6);
INSERT INTO `mob_spawn_sets` VALUES (104, 10, 4);
INSERT INTO `mob_spawn_sets` VALUES (104, 11, 1);
INSERT INTO `mob_spawn_sets` VALUES (104, 12, 3);
INSERT INTO `mob_spawn_sets` VALUES (104, 13, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 14, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 15, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 16, 6);
INSERT INTO `mob_spawn_sets` VALUES (104, 17, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 18, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 19, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 20, 6);
INSERT INTO `mob_spawn_sets` VALUES (104, 21, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 22, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 23, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 24, 2);
INSERT INTO `mob_spawn_sets` VALUES (104, 25, 6);

-- Konschtat Highlands
INSERT INTO `mob_spawn_sets` VALUES (108, 1, 4);
INSERT INTO `mob_spawn_sets` VALUES (108, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (108, 3, 3);
INSERT INTO `mob_spawn_sets` VALUES (108, 4, 4);
INSERT INTO `mob_spawn_sets` VALUES (108, 5, 5);
INSERT INTO `mob_spawn_sets` VALUES (108, 6, 2);
INSERT INTO `mob_spawn_sets` VALUES (108, 7, 5);
INSERT INTO `mob_spawn_sets` VALUES (108, 8, 5);
INSERT INTO `mob_spawn_sets` VALUES (108, 9, 5);
INSERT INTO `mob_spawn_sets` VALUES (108, 10, 5);
INSERT INTO `mob_spawn_sets` VALUES (108, 11, 5);
INSERT INTO `mob_spawn_sets` VALUES (108, 12, 9);
INSERT INTO `mob_spawn_sets` VALUES (108, 13, 2);
INSERT INTO `mob_spawn_sets` VALUES (108, 14, 4);
INSERT INTO `mob_spawn_sets` VALUES (108, 15, 6);
INSERT INTO `mob_spawn_sets` VALUES (108, 16, 4);
INSERT INTO `mob_spawn_sets` VALUES (108, 17, 5);
INSERT INTO `mob_spawn_sets` VALUES (108, 18, 4);
INSERT INTO `mob_spawn_sets` VALUES (108, 19, 7);
INSERT INTO `mob_spawn_sets` VALUES (108, 20, 3);
INSERT INTO `mob_spawn_sets` VALUES (108, 21, 2);
INSERT INTO `mob_spawn_sets` VALUES (108, 22, 2);

-- La Theine Plateau
INSERT INTO `mob_spawn_sets` VALUES (102, 1, 6);
INSERT INTO `mob_spawn_sets` VALUES (102, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (102, 3, 2);
INSERT INTO `mob_spawn_sets` VALUES (102, 4, 6);
INSERT INTO `mob_spawn_sets` VALUES (102, 5, 3);
INSERT INTO `mob_spawn_sets` VALUES (102, 6, 3);
INSERT INTO `mob_spawn_sets` VALUES (102, 7, 5);
INSERT INTO `mob_spawn_sets` VALUES (102, 8, 3);
INSERT INTO `mob_spawn_sets` VALUES (102, 9, 4);
INSERT INTO `mob_spawn_sets` VALUES (102, 10, 2);
INSERT INTO `mob_spawn_sets` VALUES (102, 11, 3);
INSERT INTO `mob_spawn_sets` VALUES (102, 12, 2);
INSERT INTO `mob_spawn_sets` VALUES (102, 13, 5);
INSERT INTO `mob_spawn_sets` VALUES (102, 14, 4);
INSERT INTO `mob_spawn_sets` VALUES (102, 15, 4);
INSERT INTO `mob_spawn_sets` VALUES (102, 16, 2);
INSERT INTO `mob_spawn_sets` VALUES (102, 17, 6);
INSERT INTO `mob_spawn_sets` VALUES (102, 18, 6);
INSERT INTO `mob_spawn_sets` VALUES (102, 19, 3);
INSERT INTO `mob_spawn_sets` VALUES (102, 20, 3);
INSERT INTO `mob_spawn_sets` VALUES (102, 21, 5);
INSERT INTO `mob_spawn_sets` VALUES (102, 22, 6);
INSERT INTO `mob_spawn_sets` VALUES (102, 23, 6);
INSERT INTO `mob_spawn_sets` VALUES (102, 24, 5);

-- Lufaise Meadows
INSERT INTO `mob_spawn_sets` VALUES (24, 1, 3);
INSERT INTO `mob_spawn_sets` VALUES (24, 2, 3);
INSERT INTO `mob_spawn_sets` VALUES (24, 3, 2);
INSERT INTO `mob_spawn_sets` VALUES (24, 4, 2);
INSERT INTO `mob_spawn_sets` VALUES (24, 5, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 6, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 7, 2);
INSERT INTO `mob_spawn_sets` VALUES (24, 8, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 9, 2);
INSERT INTO `mob_spawn_sets` VALUES (24, 10, 4);
INSERT INTO `mob_spawn_sets` VALUES (24, 11, 2);
INSERT INTO `mob_spawn_sets` VALUES (24, 12, 2);
INSERT INTO `mob_spawn_sets` VALUES (24, 13, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 14, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 15, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 16, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 17, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 18, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 19, 1);
INSERT INTO `mob_spawn_sets` VALUES (24, 20, 2);

-- Lower Delkfutts Tower
INSERT INTO `mob_spawn_sets` VALUES (184, 1, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 2, 1);
INSERT INTO `mob_spawn_sets` VALUES (184, 3, 1);
INSERT INTO `mob_spawn_sets` VALUES (184, 4, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 5, 3);
INSERT INTO `mob_spawn_sets` VALUES (184, 6, 3);
INSERT INTO `mob_spawn_sets` VALUES (184, 7, 1);
INSERT INTO `mob_spawn_sets` VALUES (184, 8, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 9, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 10, 1);
INSERT INTO `mob_spawn_sets` VALUES (184, 11, 4);
INSERT INTO `mob_spawn_sets` VALUES (184, 12, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 13, 1);
INSERT INTO `mob_spawn_sets` VALUES (184, 14, 3);
INSERT INTO `mob_spawn_sets` VALUES (184, 15, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 16, 3);
INSERT INTO `mob_spawn_sets` VALUES (184, 17, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 18, 3);
INSERT INTO `mob_spawn_sets` VALUES (184, 19, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 20, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 21, 3);
INSERT INTO `mob_spawn_sets` VALUES (184, 22, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 23, 3);
INSERT INTO `mob_spawn_sets` VALUES (184, 24, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 25, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 26, 2);
INSERT INTO `mob_spawn_sets` VALUES (184, 27, 1);
INSERT INTO `mob_spawn_sets` VALUES (184, 28, 2);