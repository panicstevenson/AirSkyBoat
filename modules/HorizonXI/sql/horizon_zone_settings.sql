LOCK TABLES `zone_settings` WRITE;

ALTER TABLE `zone_settings`
    ADD COLUMN IF NOT EXISTS `updatedmesh` tinyint(1) unsigned NOT NULL DEFAULT '0' AFTER `misc`,
    ADD COLUMN IF NOT EXISTS `forcecarefulpathing` tinyint(1) unsigned NOT NULL DEFAULT '0' AFTER `updatedmesh`;

UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 146;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 149;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 185;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 188;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 100;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 101;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 106;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 107;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 115;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 116;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 10;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 139;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 128;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 127;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 118;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 151;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 201;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 202;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 203;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 207;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 209;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 211;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 154;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 187;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 186;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 145;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 102;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 126;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 103;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 144;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 7;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 117;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 105;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 108;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 109;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 147;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 119;
UPDATE `zone_settings` SET `updatedmesh` = 1, `forcecarefulpathing` = 1 WHERE `zoneid` = 120;

UNLOCK TABLES;
