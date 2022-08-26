-- --------------------------------------------------------
-- Horizon Mob Subjob Manager
-- --------------------------------------------------------
-- This adjustment to the table will add data to the tables to control whether
-- a mob's subjob level is:
-- 0: None
-- 1: Halved (eg: 75/35)
-- 2: Two-thirds (eg: 75/50)
-- 3: Equal (eg: 75/75)
-- --------------------------------------------------------

-- Add the column to mob_groups

LOCK TABLE `mob_groups` WRITE;

ALTER TABLE `mob_groups`
	ADD COLUMN IF NOT EXISTS `subratio` TINYINT(2) UNSIGNED NOT NULL DEFAULT '3' AFTER `maxLevel`,
	ADD CONSTRAINT IF NOT EXISTS subjob_type CHECK (subratio <= 3);

-- To Do: Add a series of updates by group ID


-- Remove table locks

UNLOCK TABLES;
