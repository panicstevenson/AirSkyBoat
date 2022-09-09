-- --------------------------------------------------------
-- Horizon Mob Spawn Sets
-- --------------------------------------------------------
-- This module is used to control spawn sets within a zone
-- Spawnsetid is defined in the mob_spawn_points table, and is unique per zone
-- --------------------------------------------------------

-- Add the spawn set table

CREATE TABLE IF NOT EXISTS `mob_spawn_sets` (
	`zoneid`		SMALLINT(3) NOT NULL DEFAULT '0',
	`spawnsetid`	TINYINT(3)	NOT NULL DEFAULT '0',
	`maxspawns`		TINYINT(4)	NOT NULL DEFAULT '0',
	PRIMARY KEY (`zoneid`, `spawnsetid`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

-- Fort Ghelsba
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 1, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 2, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 3, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 4, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 5, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 6, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 7, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 8, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 9, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 10, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 11, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 12, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 13, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 14, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 15, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 16, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 17, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 18, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 19, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 20, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 21, 5);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 22, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 23, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 24, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 25, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 26, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (141, 27, 7);

-- Cape Terrigan
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 1, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 2, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 3, 5);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 4, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 5, 5);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 6, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 7, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 8, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 9, 5);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 10, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 11, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 12, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 13, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 14, 5);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 15, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 16, 5);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 17, 5);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 18, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 19, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 20, 7);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 21, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 22, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 23, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 24, 7);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 25, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 26, 5);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 27, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 28, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 29, 9);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 30, 6);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 31, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 32, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 33, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 34, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 35, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 36, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 37, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 38, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 39, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 40, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 41, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 42, 1);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 43, 6);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 44, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 45, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 46, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 47, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 48, 5);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 49, 2);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 50, 3);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 51, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 52, 4);
INSERT IGNORE INTO `mob_spawn_sets` VALUES (113, 53, 4);