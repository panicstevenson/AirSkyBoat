LOCK TABLES
    `mob_resistances` WRITE;

-- Bees
UPDATE `mob_resistances` SET `pierce_sdt` = 1.125 WHERE `name` = 'Bee';
-- Bat Trios
UPDATE `mob_resistances` SET `pierce_sdt` = 1.125 WHERE `name` = 'Bat_Trio';
-- Greater Bird
UPDATE `mob_resistances` SET `h2h_sdt` = 0.875, `impact_sdt` = 0.875, `slash_sdt` = 0.875, `pierce_sdt` = 1.125 WHERE `name` = 'Greater_Bird%';
-- Bird
UPDATE `mob_resistances` SET `pierce_sdt` = 1.125 WHERE `name` = 'Bird';
-- Colibri
UPDATE `mob_resistances` SET `pierce_sdt` = 1.125 WHERE `name` = 'Colibri%';
-- Corse
UPDATE `mob_resistances` SET `h2h_sdt` = 1.125, `impact_sdt` = 1.125, `pierce_sdt` = 0.75 WHERE `name` = 'Corse';
-- Doomed
UPDATE `mob_resistances` SET `h2h_sdt` = 0.875, `impact_sdt` = 0.875, `pierce_sdt` = 1.00 WHERE `name` = 'Doomed';
-- Elementals
UPDATE `mob_resistances` SET `h2h_sdt` = 0.25, `impact_sdt` = 0.25, `slash_sdt` = 0.25, `pierce_sdt` = 0.25 WHERE `name` LIKE 'elemental-%';
-- Flans
UPDATE `mob_resistances` SET `h2h_sdt` = 0.875, `impact_sdt` = 0.875, `slash_sdt` = 0.875, `pierce_sdt` = 1.00 WHERE `name` = 'Flan';
-- Ghosts
UPDATE `mob_resistances` SET `h2h_sdt` = 0.75, `impact_sdt` = 0.75, `slash_sdt` = 0.75, `pierce_sdt` = 0.75 WHERE `name` = 'Ghost';
-- Giant Bat
UPDATE `mob_resistances` SET `pierce_sdt` = 1.125 WHERE `name` = 'Bat';
-- Hecteyes
UPDATE `mob_resistances` SET `h2h_sdt` = 0.875, `impact_sdt` = 0.875 WHERE `name` = 'Hecteyes';
-- Hounds
UPDATE `mob_resistances` SET `slash_sdt` = 1.125 WHERE `name` = 'Hound';
-- Imps
UPDATE `mob_resistances` SET `pierce_sdt` = 1.125 WHERE `name` LIKE 'Imp%';
-- Ladybugs
UPDATE `mob_resistances` SET `pierce_sdt` = 1.25 WHERE `name` LIKE 'Ladybug%';
-- Leeches
UPDATE `mob_resistances` SET `h2h_sdt` = 0.875, `impact_sdt` = 0.875 WHERE `name` = 'Leech';
-- Magic Pots
UPDATE `mob_resistances` SET `h2h_sdt` = 1.25, `impact_sdt` = 1.25 WHERE `name` = 'Magic_Pot';
-- Mandragoras
UPDATE `mob_resistances` SET `pierce_sdt` = 1.125 WHERE `name` LIKE 'Mandragora%';
-- Mimics
UPDATE `mob_resistances` SET `h2h_sdt` = 0.50, `impact_sdt` = 0.50, `slash_sdt` = 0.50, `pierce_sdt` = 0.50 WHERE `name` = 'Mimic';
-- Puks
UPDATE `mob_resistances` SET `pierce_sdt` = 1.125 WHERE `name` LIKE 'Puk%';
-- Rafflesia
UPDATE `mob_resistances` SET `slash_sdt` = 1.125 WHERE `name` LIKE 'Rafflesia%';
-- Skeletons
UPDATE `mob_resistances` SET `h2h_sdt` = 1.125, `impact_sdt` = 1.125, `slash_sdt` = 0.875, `pierce_sdt` = 0.50 WHERE `name` = 'Skeleton';

UNLOCK TABLES;
