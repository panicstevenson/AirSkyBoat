-- --------------------------------------------------------
-- AirSkyBoat Database Conversion File
-- --------------------------------------------------------
-- Table Structure Definition
-- --------------------------------------------------------

LOCK TABLE `item_mods_pet` WRITE;

REPLACE INTO `item_mods_pet` (`itemid`, `modid`, `value`, `petType`) VALUES
    (14742, 25, 10, 0), -- Beastly Earring All Pets - ACC: 10
    (16680, 25, 3, 0), -- Barbaroi Axe All Pets - ACC: 3
    (23045, 25, 5, 0), -- Shepherd's Bonnet All Pets - ACC: 5
    (23045, 30, 3, 0), -- Shepherd's Bonnet All Pets - MACC: 3
    (23112, 23, 5, 0), -- Shepherd's Doublet All Pets - Attack +5
    (23112, 28, 3, 0), -- Shepherd's Doublet All Pets - MATT +3
    (23179, 370, 1, 0), -- Shepherd's Bracers All Pets - Regen +1
    (23246, 1, 10, 0), -- Shepherd's Hose All Pets - DEF +10
    (23246, 68, 3, 0), -- Shepherd's Hose All Pets - Eva +3
    (23313, 8, 3, 0), -- Shepherd's Boots All Pets - STR +3
    (23313, 12, 3, 0); -- Shepherd's Boots All Pets - INT +3

UNLOCK TABLES;
