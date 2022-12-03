-- --------------------------------------------------------
-- AirSkyBoat Database Conversion File
-- --------------------------------------------------------
-- Table Structure Definition
-- --------------------------------------------------------

LOCK TABLE `item_mods_pet` WRITE;

REPLACE INTO `item_mods_pet` (`itemid`, `modid`, `value`, `petType`) VALUES
    (14742,25,10,0), -- Beastly Earring All Pets - ACC: 10
    (16680,25,3,0); -- Barbaroi Axe All Pets - ACC: 3

UNLOCK TABLES;
