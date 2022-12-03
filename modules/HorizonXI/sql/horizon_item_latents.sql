-- --------------------------------------------------------
-- Horizon Item Latent Changes
-- --------------------------------------------------------
-- This module is used to apply changes to item_latents.sql
-- --------------------------------------------------------

LOCK TABLE `item_latents` WRITE;

REPLACE INTO `item_latents` (`itemId`, `modId`, `value`, `latentId`, `latentParam`) VALUES
    (17451,287,8,47,0),  -- Morgenstern DMG+8 when broken (500 WS points)
    (18206,384,200,56,0),  -- Rune Chopper +2% haste
    (13435,1,5,8,1),  -- Mercen. Earring Def+5 when WAR Subjob
    (13437,27,-2,8,3),  -- Healer`s Earring Enmity -2 when WHM subjob
    (13557,23,8,53,0),  -- Grand Knight`s Ring Attack +8 in areas inside own nation`s control
    (13558,25,5,53,0),  -- Gold Musketeer`s Ring Acc +5 in areas inside own nation`s control
    (13559,5,6,53,0),  -- Patriarch Protector`s Ring MP +6 in areas inside own nation`s control
    (13559,13,3,53,0),  -- Patriarch Protector`s Ring MND +3 in areas inside own nation`s control
    (13559,30,3,53,0),  -- Patriarch Protector`s Ring MACC +3 in areas inside own nation`s control
    (13574,369,1,5,25),  -- Black Cotehardie "Refresh" effect while MP under 25
    (13665,27,3,8,7),  -- PLD sub back piece: Enmity +3
    (13666,23,5,8,8),  -- DRK sub back piece: Attack +5
    (13667,391,5,8,9),  -- BST sub back piece: Charm +5
    (13668,435,1,8,10),  -- BRD sub back piece: Paeon +1
    (13670,110,5,8,12),  -- SAM sub back piece: Parrying Skill +5
    (13671,11,3,8,13),  -- NIN sub back piece: AGI +3
    (13673,357,2,8,15),  -- SMN sub back piece: BP Delay -2
    (13755,369,1,5,30),  -- Flora Cotehardie "Refresh" effect while MP under 30
    (13775,369,1,5,40),  -- Blue Cotehardie "Refresh" effect while MP under 40
    (13776,369,1,5,50),  -- Blue Cotehardie +1 "Refresh" effect while MP under 40
    (14155,2,5,53,0),  -- Combat Caster`s Shoes +1 HP +5 in areas inside own nation`s control
    (14155,25,2,53,0),  -- Combat Caster`s Shoes +1 ACC +2 in areas inside own nation`s control
    (14156,2,10,53,0),  -- Combat Caster`s Shoes +2 HP +10 in areas inside own nation`s control
    (14156,25,3,53,0),  -- Combat Caster`s Shoes +2 ACC +3 in areas inside own nation`s control
    (14157,12,2,53,0),  -- Tactician Magician`s Pigaches +1 INT +2 in areas inside own nation`s control
    (14158,12,3,53,0),  -- Tactician Magician`s Pigaches +2 INT +3 in areas inside own nation`s control
    (14275,2,5,53,0),  -- Combat Caster`s Slacks +1 HP +5 in areas inside own nation`s control
    (14276,2,10,53,0),  -- Combat Caster`s Slacks +2 HP +10 in areas inside own nation`s control
    (14729,165,3,8,6),  -- THF sub earring: Crit +3%
    (14730,2,20,8,7),  -- PLD sub earring: HP +20
    (14730,5,20,8,7),  -- PLD sub earring: MP +20
    (14732,14,2,8,9),  -- BST sub earring: CHR+2
    (14733,434,1,8,10),  -- BRD sub earring: Minuet effect +1
    (14735,306,5,8,12),  -- SAM sub earring: Enhances Zanshin effect
    (15273,27,-2,8,3),  -- WHM sub belt: Enmity -2
    (15274,12,2,8,4),  -- BLM sub belt: INT +2
    (15275,432,3,8,5),  -- RDM sub belt: Enspell +3
    (15276,25,3,8,6),  -- THF Sub belt: Acc +3
    (15277,485,10,8,7),  -- PLD sub belt: Shield Mastery +10 TP
    (15280,438,1,8,10),  -- BRD sub belt: Madrigal Effect +1
    (15284,384,200,8,14),  -- DRG Sub belt: Haste +2%
    (16601,23,5,53,1),  -- Royal Swordsman`s Blade ATT +5 in areas outside own nation`s control
    (16893,370,1,70,0), -- Reserve Captain's Lance Citizens of San d'Oria: Regen +1
    (16948,23,6,53,1),  -- Royal Swordsman`s Blade +1 ATT +6 in areas outside own nation`s control
    (16949,23,7,53,1),  -- Royal Swordsman`s Blade +2 ATT +7 in areas outside own nation`s control
    (17617,5,25,70,2),    -- Master Caster's Knife Citizens of Windurst: MP +25
    (17617,23,10,70,2);   -- Master Caster's Knife Citizens of Windurst: Attack +10

DELETE FROM `item_latents` WHERE `itemID` = 13559 AND `modID` = 2;  -- Patriarch Protector`s Ring Removing HP boost
DELETE FROM `item_latents` WHERE `itemID` = 13559 AND `modID` = 8;  -- Patriarch Protector`s Ring Removing STR boost
DELETE FROM `item_latents` WHERE `itemID` = 14155 AND `modID` = 11;  -- Combat Caster`s Shoes +1 Removing AGI boost
DELETE FROM `item_latents` WHERE `itemID` = 14156 AND `modID` = 11;  -- Combat Caster`s Shoes +2 Removing AGI boost
DELETE FROM `item_latents` WHERE `itemID` = 14275 AND `modID` = 5;  -- Combat Caster`s Slacks +1 Removing MP boost
DELETE FROM `item_latents` WHERE `itemID` = 13558 AND `modID` = 11;  -- Gold Musketeer`s Ring Removing AGI boost
DELETE FROM `item_latents` WHERE `itemID` = 14276 AND `modID` = 5;  -- Combat Caster`s Slacks +2 Removing MP boost
DELETE FROM `item_latents` WHERE `itemID` = 16948 AND `modID` = 10;  -- Royal Swordsman`s Blade +1 Removing VIT boost
DELETE FROM `item_latents` WHERE `itemID` = 16949 AND `modID` = 10;  -- Royal Swordsman`s Blade +2 Removing VIT boost

UNLOCK TABLES;
