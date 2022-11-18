-- ------------------------------------------------------------
-- Horizon `job` `traits` Changes
-- ------------------------------------------------------------

LOCK TABLES `traits` WRITE;

ALTER TABLE `traits`
    ADD COLUMN IF NOT EXISTS `modifier2` smallint(5) UNSIGNED NOT NULL DEFAULT 0 AFTER `value`,
    ADD COLUMN IF NOT EXISTS `value2` smallint(5) UNSIGNED NOT NULL DEFAULT 0 AFTER `modifier2`;

UPDATE `traits` SET `modifier2` = 427, `value2` = 15 WHERE `traitid` = 4 AND `job` = 7 AND `level` = 30; -- PLD Enmity Loss Reduction
UPDATE `traits` SET `modifier2` = 427, `value2` = 25 WHERE `traitid` = 4 AND `job` = 7 AND `level` = 50; -- PLD Enmity Loss Reduction
UPDATE `traits` SET `modifier2` = 427, `value2` = 35 WHERE `traitid` = 4 AND `job` = 7 AND `level` = 70; -- PLD Enmity Loss Reduction

UPDATE `traits` SET `level` = 15, `content_tag` = NULL WHERE `traitid` = 24 AND `job` = 3 AND `modifier` = 71 AND `rank` = 1; -- WHM Clear Mind Adjustment
UPDATE `traits` SET `level` = 35, `content_tag` = NULL WHERE `traitid` = 24 AND `job` = 3 AND `modifier` = 71 AND `rank` = 2; -- WHM Clear Mind Adjustment
UPDATE `traits` SET `level` = 45, `content_tag` = NULL WHERE `traitid` = 24 AND `job` = 3 AND `modifier` = 71 AND `rank` = 3; -- WHM Clear Mind Adjustment
UPDATE `traits` SET `level` = 55, `content_tag` = NULL WHERE `traitid` = 24 AND `job` = 3 AND `modifier` = 71 AND `rank` = 4; -- WHM Clear Mind Adjustment
UPDATE `traits` SET `level` = 65, `content_tag` = NULL WHERE `traitid` = 24 AND `job` = 3 AND `modifier` = 71 AND `rank` = 5; -- WHM Clear Mind Adjustment
UPDATE `traits` SET `level` = 75, `content_tag` = NULL WHERE `traitid` = 24 AND `job` = 3 AND `modifier` = 71 AND `rank` = 6; -- WHM Clear Mind Adjustment

UPDATE `traits` SET `level` = 40, `content_tag` = NULL WHERE `traitid` = 24 AND `job` = 4 AND `modifier` = 71 AND `rank` = 3; -- BLM Clear Mind Adjustment
UPDATE `traits` SET `level` = 45, `content_tag` = NULL WHERE `traitid` = 24 AND `job` = 4 AND `modifier` = 71 AND `rank` = 4; -- BLM Clear Mind Adjustment
UPDATE `traits` SET `level` = 55, `content_tag` = NULL WHERE `traitid` = 24 AND `job` = 4 AND `modifier` = 71 AND `rank` = 5; -- BLM Clear Mind Adjustment

UPDATE `traits` SET `content_tag` = 'COP', `level` = 25 WHERE name = 'auto refresh' AND `job` = 7; -- PLD Auto Refresh to COP

UPDATE `traits` SET `content_tag` = 'COP', `level` = 50 WHERE name = 'assassin'; -- THF Assassin Trait
UPDATE `traits` SET `content_tag` = 'COP' WHERE name = 'strafe'; -- DRG Strafe (Change to COP)
UPDATE `traits` SET `content_tag` = 'COP' WHERE name = 'desperate blows';
UPDATE `traits` SET `content_tag` = 'COP' WHERE name = 'shield mastery' AND `job` = 7;
UPDATE `traits` SET `level` = 30 WHERE name = "triple attack" AND `rank` = 1;
DELETE FROM `traits` WHERE name = 'nina tool expert';
REPLACE INTO `traits` (`traitid`, `name`, `job`, `level`, `rank`, `modifier`, `value`, `modifier2`, `value2`, `content_tag`, `meritid`) VALUES
    (87,'ninja tool expert.',13,40,1,308,5,0,0,NULL,0),
    (87,'ninja tool expert.',13,60,2,308,10,0,0,NULL,0),
    (87,'ninja tool expert.',13,75,3,308,15,0,0,NULL,0);

UNLOCK TABLES;
