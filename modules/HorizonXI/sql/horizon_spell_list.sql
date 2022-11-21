-- ------------------------------------------------------------
-- Horizon Spell List Changes
-- ------------------------------------------------------------
LOCK TABLES
    `spell_list` WRITE;

UPDATE `spell_list` SET `mpCost` = 50 WHERE name = 'refresh';
UPDATE `spell_list` SET `recastTime` = 60000 WHERE name = 'utsusemi_ni';
UPDATE `spell_list` SET `recastTime` = 45000 WHERE name = 'utsusemi_ichi';
UPDATE `spell_list` SET `castTime` = 1000 WHERE name LIKE 'absorb-%';
UPDATE `spell_list` SET `VE` = 350 WHERE name = 'hojo_ni';
UPDATE `spell_list` SET `VE` = 350 WHERE name = 'kurayami_ni';
UPDATE `spell_list` SET `jobs` = 0x00000000000028000000000000000000000000000000, `mpCost` = 24, `recastTime` = 30000, `content_tag` = 'COP' WHERE name = 'enlight';
UPDATE `spell_list` SET `jobs` = 0x0000000000000000000000000C000000000000000000, `castTime` = 2500 WHERE name = 'doton_ichi';
UPDATE `spell_list` SET `jobs` = 0x0000000000000000000000000C000000000000000000, `castTime` = 2500 WHERE name = 'huton_ichi';
UPDATE `spell_list` SET `jobs` = 0x0000000000000000000000000C000000000000000000, `castTime` = 2500 WHERE name = 'hyoton_ichi';
UPDATE `spell_list` SET `jobs` = 0x0000000000000000000000000C000000000000000000, `castTime` = 2500 WHERE name = 'katon_ichi';
UPDATE `spell_list` SET `jobs` = 0x0000000000000000000000000C000000000000000000, `castTime` = 2500 WHERE name = 'raiton_ichi';
UPDATE `spell_list` SET `jobs` = 0x0000000000000000000000000C000000000000000000, `castTime` = 2500 WHERE name = 'suiton_ichi';

UNLOCK TABLES;
