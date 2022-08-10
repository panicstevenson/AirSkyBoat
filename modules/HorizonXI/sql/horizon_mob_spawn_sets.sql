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

-- Modify the mob_spawn_points schema to include a spawnset column
LOCK TABLE `mob_spawn_points` WRITE;

ALTER TABLE `mob_spawn_points`
    ADD COLUMN IF NOT EXISTS `zoneid`	INT(10) AS ((`mobid` - 4096 * 4096) / 4096) virtual AFTER `mobid`,
	ADD COLUMN IF NOT EXISTS `spawnset` TINYINT(3) NULL DEFAULT '0' AFTER `zoneid`;

	
-- TODO:  ADD INSERT COMMANDS ONCE READY


-- END

UNLOCK TABLES;
