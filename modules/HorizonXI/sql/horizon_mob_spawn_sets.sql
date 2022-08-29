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
