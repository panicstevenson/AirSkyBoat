-- --------------------------------------------------------
-- Horizon Item Equipment Changes
-- --------------------------------------------------------
-- This module is used to apply changes to item_equipment.sql
-- Adds new jobs to several pieces
-- Adjusts model for several items with changed item types
-- --------------------------------------------------------

LOCK TABLE `item_equipment` WRITE;

REPLACE INTO `item_equipment` (`itemId`, `name`, `level`, `ilevel`, `jobs`, `MId`, `shieldSize`, `scriptType`, `slot`, `rslot`, `su_level` ) VALUES
    (12344,'master_shield',52,0,193,647,3,0,2,0,0),
    (13721,'irn.msk._gambison',40,0,3663738,23,0,0,32,0,0),
    (14356,'irn.msk.gmbsn._+1',43,0,3663738,23,0,0,32,0,0),
    (14357,'irn.msk.gmbsn._+2',43,0,3663738,23,0,0,32,0,0),
    (14758,'knightly_earring',59,0,192,0,0,0,6144,0,0),
    (15273,'healers_belt',30,0,4194303,0,0,0,1024,0,0),
    (15274,'wizards_belt',30,0,4194303,0,0,0,1024,0,0),
    (15275,'warlocks_belt',30,0,4194303,0,0,0,1024,0,0),
    (15276,'pilferers_belt',30,0,4194303,0,0,0,1024,0,0),
    (15284,'wyvern_belt',30,0,4194303,0,0,0,1024,0,0),
    (16529,'musketeers_sword',50,0,2097345,64,0,0,3,0,0),
    (16544,'ryl.arc._sword',10,0,2209777,265,0,0,3,0,0),
    (16601,'ryl.swd._blade',40,0,2097344,72,0,0,1,0,0),
    (16798,'raven_scythe',40,0,128,194,0,0,1,0,0),
    (16829,'fencing_degen',40,0,16,188,0,0,3,0,0),
    (16887,'peregrine',40,0,8192,210,0,0,1,0,0),
    (16948,'ryl.swd._blade_+1',43,0,2097344,72,0,0,1,0,0),
    (16949,'ryl.swd._blade_+2',43,0,2097344,72,0,0,1,0,0),
    (17188,'hunters_zamburak',40,0,1024,54,0,0,4,0,0),
    (17422,'blessed_hammer',40,0,4,115,0,0,3,0,0),
    (17423,'casting_wand',40,0,8,226,0,0,3,0,0),
    (17478,'tekko_kagi',42,0,2,140,0,0,1,0,0),
    (17532,'kukulcans_staff',40,0,16384,293,0,0,1,0,0),
    (17617,'mst.cst._knife',71,0,474869,180,0,0,3,0,0),
    (17643,'honor_sword',40,0,64,252,0,0,3,0,0),
    (17812,'magoroku',40,0,2048,146,0,0,1,0,0),
    (18097,'perforater',72,0,8192,210,0,0,1,0,0),
    (18295,'wyrm_tongue',75,0,8192,841,0,0,1,0,0),
    (23045,'shepherds_bonnet',21,0,155904,383,0,0,16,0,0),
    (23112,'shepherds_doublet',39,0,155904,43,0,0,32,0,0),
    (23179,'shepherds_bracers',34,0,155904,24,0,0,64,0,0),
    (23246,'shepherds_hose',29,0,155904,24,0,0,128,0,0),
    (23313,'shepherds_boots',25,0,155904,24,0,0,256,0,0);

UNLOCK TABLES;
