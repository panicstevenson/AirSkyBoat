-- ------------------------------------------------------------
-- Horizon Ability Changes
-- ------------------------------------------------------------
LOCK TABLES
    `abilities` WRITE;

UPDATE `abilities` SET `level` = 15 WHERE `name` = 'focus'; -- ID 37: Focus (Change to `level` 15)
UPDATE `abilities` SET `level` = 25 WHERE `name` = 'dodge'; -- ID 37: Dodge (Change to `level` 25)
UPDATE `abilities` SET `recastTime` = 115 WHERE `name` = 'chakra'; -- ID 38: Chakra (Change to 115s Recast)
UPDATE `abilities` SET `recastTime` = 30 WHERE `name` = 'boost'; -- ID 39: Boost (Change to 30s Recast)
UPDATE `abilities` SET `recastTime` = 300 WHERE `name` = 'souleater'; -- ID 40: Souleater (Change to 300s Recast)
UPDATE `abilities` SET `content_tag` = 'COP' WHERE `name` = 'spirit_link'; -- ID 80: Spirit Link (Change to COP)
UPDATE `abilities` SET `recastTime` = 780 WHERE `name` = 'convert'; -- ID 83: Convert (Change to 780s Recast)
UPDATE `abilities` SET `level` = 45, `content_tag`= 'COP', `addType` = 0, `recastTime` = 600 WHERE `name` = 'devotion'; -- ID 154: Devotion (Change to `level` 45 and COP)
UPDATE `abilities` SET `level` = 45, `content_tag`= 'COP', `addType` = 0, `recastTime` = 900 WHERE `name` = 'chivalry'; -- ID 158: Chivalry (Change to `level` 45 and COP)
UPDATE `abilities` SET `content_tag` = 'COP', `recastTime` = 45 WHERE `name` = 'hasso'; -- ID 173 and 174: Hasso & Seigan (Change to COP)
UPDATE `abilities` SET `content_tag` = 'COP', `recastTime` = 45 WHERE `name` = 'seigan'; -- ID 173 and 174: Hasso & Seigan (Change to COP)
UPDATE `abilities` SET `content_tag` = 'WOTG' WHERE `name` = 'avatars_favor'; -- ID 250: Avatar's Favor (Gate to WotG for now)
UPDATE `abilities` SET `content_tag` = 'COP' WHERE `name` = 'ready'; -- ID 251: Ready (Change to COP)
UPDATE `abilities` SET `recastTime` = 120 WHERE `name` = 'high_jump';
UPDATE `abilities` SET `recastTime` = 1200, `content_tag` = 'COP' WHERE `name` = 'bestial_loyalty';
UPDATE `abilities` SET `recastTime` = 7200, `content_tag` = 'COP', `level` = 0 WHERE `name` = 'mikage'; -- New NIN 2hr
UPDATE `abilities` SET `level` = 39 WHERE `name` = 'crimson_howl';
UPDATE `abilities` SET `level` = 38 WHERE `name` = 'whispering_wind';
UPDATE `abilities` SET `level` = 54 WHERE `name` = 'ecliptic_growl';
UPDATE `abilities` SET `level` = 47 WHERE `name` = 'spring_water';
UPDATE `abilities` SET `level` = 43 WHERE `name` = 'ecliptic_howl';
UPDATE `abilities` SET `content_tag` = 'COP' WHERE `name` = 'velocity_shot';
DELETE FROM `abilities` WHERE `name` = 'mijin_gakure';

UNLOCK TABLES;
