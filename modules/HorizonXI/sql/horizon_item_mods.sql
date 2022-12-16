-- --------------------------------------------------------
-- AirSkyBoat Database Conversion File
-- --------------------------------------------------------
-- Table Structure Definition
-- --------------------------------------------------------

LOCK TABLE `item_mods` WRITE;

-- Remove all mods from these items due to complete item rework
DELETE FROM `item_mods` WHERE `itemid` = 18295; -- Remove base stats from Bravura lv 80
DELETE FROM `item_mods` WHERE `itemid` = 23045; -- Remove base stats from Pillagers +2 gear
DELETE FROM `item_mods` WHERE `itemid` = 23112; -- Remove base stats from Pillagers +2 gear
DELETE FROM `item_mods` WHERE `itemid` = 23179; -- Remove base stats from Pillagers +2 gear
DELETE FROM `item_mods` WHERE `itemid` = 23246; -- Remove base stats from Pillagers +2 gear
DELETE FROM `item_mods` WHERE `itemid` = 23313; -- Remove base stats from Pillagers +2 gear

-- Remove some stats due to Era+ rework
DELETE FROM `item_mods` WHERE `itemid` = 12421 and `modid` = 14;  -- Koenig Schaller Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 12519 and `modid` = 13;  -- Drachen Armet Remove MND
DELETE FROM `item_mods` WHERE `itemid` = 12549 and `modid` = 14;  -- Koenig Cuirass Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 12645 and `modid` = 10;  -- Chaos Cuirass Remove VIT
DELETE FROM `item_mods` WHERE `itemid` = 12649 and `modid` = 10;  -- Drachen Mail Remove VIT
DELETE FROM `item_mods` WHERE `itemid` = 12649 and `modid` = 16;  -- Drachen Mail Remove Ice Res
DELETE FROM `item_mods` WHERE `itemid` = 12677 and `modid` = 14;  -- Koenig Handschuhs Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 12805 and `modid` = 14;  -- Koenig Diechlings Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 12933 and `modid` = 14;  -- Koenig Schuhs Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 12941 and `modid` = 13;  -- Adaman Sollerets Remove MND
DELETE FROM `item_mods` WHERE `itemid` = 13103 and `modid` = 1;   -- Checkered Scarf Remove DEF
DELETE FROM `item_mods` WHERE `itemid` = 13107 and `modid` = 68;  -- Royal Knight Army Collar Remove Eva
DELETE FROM `item_mods` WHERE `itemid` = 13782 and `modid` = 10;  -- Ninja Chainmail Remove VIT
DELETE FROM `item_mods` WHERE `itemid` = 13911 and `modid` = 14;  -- Kaiser Schaller Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 14175 and `modid` = 13;  -- Armada Sollerets Remove MND
DELETE FROM `item_mods` WHERE `itemid` = 14370 and `modid` = 14;  -- Kaiser Cuirass Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 14742 and `modid` = 68;  -- Beastly Earring Remove EVA
DELETE FROM `item_mods` WHERE `itemid` = 14740 and `modid` = 111; -- Knights Earring Remove Divine
DELETE FROM `item_mods` WHERE `itemid` = 14739 and `modid` = 11;  -- Suppanomimi Remove AGI
DELETE FROM `item_mods` WHERE `itemid` = 14739 and `modid` = 82;  -- Suppanomimi Remove Sword
DELETE FROM `item_mods` WHERE `itemid` = 14739 and `modid` = 259; -- Suppanomimi Remove Dual Wield
DELETE FROM `item_mods` WHERE `itemid` = 16766 and `modid` = 11;  -- Paper Knife AGI: 0 (Removing existing stat)
DELETE FROM `item_mods` WHERE `itemid` = 17771 and `modid` = 8;   -- Anju STR: 0 (Removing existing stat)
DELETE FROM `item_mods` WHERE `itemid` = 17772 and `modid` = 9;   -- Zushio DEX: -1 (Removing existing stat)
DELETE FROM `item_mods` WHERE `itemid` = 14283 and `modid` = 14;  -- Kaiser Diechlings Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 14163 and `modid` = 14;  -- Kaiser Schuhs Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 14097 and `modid` = 11;  -- Beast Gaiters Remove AGI
DELETE FROM `item_mods` WHERE `itemid` = 14093 and `modid` = 11;  -- Warlocks Boots Remove AGI
DELETE FROM `item_mods` WHERE `itemid` = 14092 and `modid` = 11;  -- Wizards Sabots Remove AGI
DELETE FROM `item_mods` WHERE `itemid` = 14091 and `modid` = 11;  -- Healers Duckbills Remove AGI
DELETE FROM `item_mods` WHERE `itemid` = 14089 and `modid` = 11;  -- Fighters Calligae Remove AGI
DELETE FROM `item_mods` WHERE `itemid` = 14061 and `modid` = 14;  -- Kaiser Handschuhs Remove CHR
DELETE FROM `item_mods` WHERE `itemid` = 13971 and `modid` = 9;   -- Hunters Bracers Remove DEX
DELETE FROM `item_mods` WHERE `itemid` = 16480 and `modid` = 303; -- Thief's Knife Remove Treasure Hunter

REPLACE INTO `item_mods` (`itemid`, `modid`, `value`) VALUES
    (12304, 23, 5), -- Musketeer Commanders Shield ATT: 5
    (12344, 1, 18),    -- Master Shield DEF: 18
    (12421, 11, 10), -- Koenig Schaller AGI: 10
    (12429, 25, 8),  -- Adaman Celata ACC: 8
    (12478, 5, 15), -- Tactician Magicians Hat MP: 15
    (12512, 23, 5),   -- Temple Crown ATT: 5
    (12514, 9, 2),    -- Rogues Bonnet DEX: 2
    (12517, 13, 3),   -- Beast Helm MND: 3
    (12519, 9, 2),  -- Drachen Armet DEX: 2
    (12549, 11, 20), -- Koenig Cuirass AGI: 20
    (12549, 485, 10), -- Koenig Cuirass SHIELD_MASTERY_TP: 10
    (12638, 25, 3), -- Fighters Lorica ACC: 3
    (12640, 5, 25),   -- Healers Briault MP: 25
    (12643, 18, 0),   -- Rogues Vest EARTH_RES: 10
    (12643, 25, 3),    -- Rogues Vest ACC: 3
    (12644, 25, 3),  -- Gallant Surcoat ACC: 3
    (12645, 8, 3),   -- Chaos Cuirass STR: 3
    (12646, 25, 3),  -- Beast Jackcoat ACC: 3
    (12649, 8, 3),   -- Drachen Mail STR: 3
    (12649, 23, 3),  -- Drachen Mail ATT: 3
    (12650, 357, -1), -- Evokers Doublet BP_DELAY: -1
    (12677, 11, 10), -- Koenig Handschuhs AGI: 10
    (12685, 23, 12),  -- Adaman Mufflers ATT: 12
    (12685, 25, 5),   -- Adaman Mufflers ACC: 5
    (12685, 68, -5),  -- Adaman Mufflers EVA: -5
    (12685, 384, 100), -- Adaman Mufflers HASTE_GEAR: 100
    (12719, 25, 1),  -- Mercenarys Tekko ACC: 1
    (12719, 26, 1),  -- Mercenarys Tekko RACC: 1
    (12805, 11, 10), -- Koenig Diechlings AGI: 10
    (12805, 518, 5), -- Koenig Diechlings SHIELDBLOCKRATE: 5
    (12813, 68, -10),  -- Adaman Breeches EVA: -10
    (12813, 384, 100), -- Adaman Breeches HASTE_GEAR: 100
    (12870, 23, 5), -- Combat Casters Slacks ATT: 5
    (12915, 5, 5),  -- Freeswords Slops MP: 5
    (12933, 2, 30), -- Koenig Schuhs HP: 30
    (12933, 11, 10), -- Koenig Schuhs AGI: 10
    (12941, 2, -20),   -- Adaman Sollerets HP: -20
    (12941, 68, -5),   -- Adaman Sollerets EVA: -5
    (12941, 384, 100), -- Adaman Sollerets HASTE_GEAR: 100
    (12990, 12, 1),  -- Tactician Magicians Pigaches INT: 1
    (12998, 5, 5),  -- Combat Casters Shoes MP: 5
    (12998, 25, 1), -- Combat Casters Shoes ACC: 1
    (13064, 25, 3), -- Iron Musketeers Gorget ACC: 3
    (13098, 5, 5), -- Republican Bronze Medal MP: 5
    (13100, 12, 2), -- Republican Mythril Medal INT: 2
    (13101, 2, 5),  -- Green Scarf HP: 5
    (13101, 72, 2), -- Green Scarf HPHEAL: 2
    (13102, 2, 8),  -- Paisley Scarf HP: 8
    (13102, 72, 3), -- Paisley Scarf HPHEAL: 3
    (13103, 2, -12), -- Checkered Scarf HP: -12
    (13103, 12, 2),  -- Checkered Scarf INT: 2
    (13103, 71, 1),  -- Checkered Scarf MPHEAL: 1
    (13103, 72, 1),  -- Checkered Scarf HPHEAL: 1
    (13104, 25, 2), -- Royal Squires Collar Acc: 2
    (13104, 68, 2), -- Royal Squires Collar EVA: 2
    (13105, 1, 8),  -- Temple Knight Army Collar DEF: 8
    (13105, 25, 3), -- Temple Knight Army Collar ACC: 3
    (13107, 8, 2),  -- Royal Knight Army Collar STR: 2
    (13107, 10, 2), -- Royal Knight Army Collar VIT: 2
    (13107, 23, 2), -- Royal Knight Army Collar ATT: 2
    (13172, 2, 10), -- Pachamac's Collar HP +10
    (13172, 5, 10), -- Pachamac's Collar MP +10
    (13172, 71, 2), -- Pachamac's Collar MPHEAL: 2
    (13172, 72, 2), -- Pachamac's Collar HPHEAL: 2
    (13189, 384, 500), -- Speed Belt HASTE_GEAR: 500
    (13719, 12, 1), -- Royal Squires Robe INT: 1
    (13719, 13, 1), -- Royal Squires Robe MND: 1
    (13720, 5, 25),  -- Royal Knights Cloak MP: 25
    (13720, 12, 1),  -- Royal Knights Cloak INT: 1
    (13781, 25, 3),  -- Myochin Domaru ACC: 3
    (13782, 9, 3),    -- Ninja Chainmail DEX: 3
    (13830, 5, 5),  -- Legionnaires Circlet MP: 5
    (13830, 13, 1), -- Legionnaires Circlet MND: 1
    (13857, 13, 2),  -- Choral Roundlet MND: 2
    (13857, 14, 2),  -- Choral Roundlet CHR: 2
    (13868, 8, 2),   -- Myochin Kabuto STR: 2
    (13869, 11, 3),  -- Ninja Hatsuburi AGI: 3
    (13899, 5, 5),  -- Bastokan CircletMP: 5
    (13899, 13, 1), -- Bastokan Circlet MND: 1
    (13900, 5, 5),  -- Republic Circlet MP: 5
    (13900, 13, 1), -- Republic Circlet MND: 1
    (13905, 5, 15), -- Tactician Magicians Hat +1 MP: 15
    (13906, 5, 15), -- Tactician Magicians Hat +2 MP: 15
    (13911, 11, 11), -- Kaiser Schaller AGI: 11
    (13924, 25, 9),  -- Armada Celata ACC: 8
    (13971, 11, 3),   -- Hunters Bracers AGI: 3
    (14061, 11, 11), -- Kaiser Handschuhs AGI: 11
    (14089, 9, 2),   -- Fighters Calligae DEX: 2
    (14091, 5, 20),   -- Healers Duckbills MP: 20
    (14091, 12, 3),   -- Healers Duckbills INT: 3
    (14092, 5, 20),   -- Wizards Sabots MP: 20
    (14092, 12, 1),   -- Wizards Sabots INT: 1
    (14093, 13, 1),   -- Warlocks Boots MND: 1
    (14093, 12, 1),   -- Warlocks Boots INT: 1
    (14095, 9, 2),    -- Gallant Leggings DEX: 2
    (14096, 25, 3),   -- Chaos Sollerets ACC: 2
    (14097, 14, 3),   -- Beast Gaiters CHR: 3
    (14098, 11, 3),  -- Choral Slippers AGI: 2
    (14098, 9, 2),   -- Choral Slippers DEX: 2
    (14100, 11, 4),  -- Myochin Sune-Ate AGI: 4
    (14103, 5, 20),  -- Evokers Pigaches MP: 20
    (14123, 12, 3), -- Zenith Pumps INT: 3
    (14123, 14, 3), -- Zenith Pumps CHR: 3
    (14124, 12, 4), -- Zenith Pumps +1 INT: 4
    (14124, 14, 4), -- Zenith Pumps +1 CHR: 4
    (14155, 5, 5),  -- Combat Casters Shoes +1 MP: 5
    (14155, 25, 1), -- Combat Casters Shoes +1 ACC: 1
    (14156, 5, 5),  -- Combat Casters Shoes +2 MP: 5
    (14156, 25, 1), -- Combat Casters Shoes +2 ACC: 1
    (14157, 12, 1),  -- Tactician Magicians Pigaches +1 INT: 1
    (14157, 12, 1),  -- Tactician Magicians Pigaches +2 INT: 1
    (14163, 11, 11), -- Kaiser Schuhs AGI: 11
    (14175, 2, -21),   -- Armada Sollerets HP: -21
    (14175, 68, -6),   -- Armada Sollerets EVA: -6
    (14175, 384, 200), -- Armada Sollerets HASTE_GEAR: 200
    (14184, 8, 2),   -- Shura Sune-Ate STR: 2
    (14184, 9, 2),   -- Shura Sune-Ate DEX: 2
    (14185, 8, 3),   -- Shura Sune-Ate +1 STR: 3
    (14185, 9, 3),   -- Shura Sune-Ate +1 DEX: 3
    (14215, 25, 3),   -- Chaos Flanchard ACC: 3
    (14224, 11, 2),   -- Hunters Braccae AGI: 2
    (14227, 25, 3),   -- Drachen Brais ACC: 3
    (14273, 5, 6), -- Windurstian Slops MP: 6
    (14274, 5, 7), -- Federation Slops MP: 7
    (14275, 23, 5), -- Combat Casters Slacks +1 ATT: 5
    (14276, 23, 5), -- Combat Casters Slacks +2 ATT: 5
    (14283, 11, 11), -- Kaiser Diechlings AGI: 11
    (14283, 518, 5), -- Kaiser Diechlings SHIELDBLOCKRATE: 5
    (14296, 68, -10),  -- Armada Breeches EVA: -10
    (14296, 384, 200), -- Armada Breeches HASTE_GEAR: 200
    (14358, 12, 1), -- Royal Squires Robe +1 INT: 1
    (14358, 13, 1), -- Royal Squires Robe +1 MND: 1
    (14359, 12, 1), -- Royal Squires Robe +2 INT: 1
    (14359, 13, 1), -- Royal Squires Robe +2 MND: 1
    (14360, 5, 25),  -- Royal Knights Cloak +1 MP: 25
    (14360, 12, 1),  -- Royal Knights Cloak +1 INT: 1
    (14361, 5, 25),  -- Royal Knights Cloak +2 MP: 25
    (14361, 12, 1),  -- Royal Knights Cloak +2 INT: 1
    (14367, 12, 11),  -- Crimson Scale Mail INT: 11
    (14367, 13, 11),  -- Crimson Scale Mail MND: 11
    (14367, 11, 11),  -- Crimson Scale Mail AGI: 11
    (14368, 12, 12),  -- Blood Scale Mail INT: 12
    (14368, 13, 12),  -- Blood Scale Mail MND: 12
    (14368, 11, 12),  -- Blood Scale Mail AGI: 12
    (14370, 11, 21), -- Kaiser Cuirass AGI: 20
    (14370, 485, 10), -- Kaiser Cuirass SHIELD_MASTERY_TP: 10
    (14739, 9, 2),   -- Suppanomimi DEX: 2
    (14739, 81, 5),  -- Suppanomimi DAGGER: 5
    (14739, 88, 5),  -- Suppanomimi KATANA: 5
    (14739, 108, 5), -- Suppanomimi EVASION: 5
    (14741, 82, 5),  -- Knights Earring SWORD: 5
    (14741, 90, 5),  -- Knights Earring CLUB: 5
    (14741, 83, 5),  -- Abyssal Earring GSWORD: 5
    (14742, 84, 5), -- Beastly Earring AXE: 5
    (14742, 87, 5), -- Beastly Earring POLEARM: 5
    (14743, 85, 5),  -- Bushinomimi GAXE: 5
    (14815, 259, 5), -- Stealth Earring DUAL_WIELD: 5
    (14816, 23, 13),  -- Armada Mufflers ATT: 13
    (14816, 25, 6),   -- Armada Mufflers ACC: 6
    (14816, 68, -6),  -- Armada Mufflers EVA: -6
    (14816, 384, 200), -- Armada Mufflers HASTE_GEAR: 200
    (14821, 25, 5),  -- Shura Kote ACC: 5
    (14821, 23, 10), -- Shura Kote ATT: 10
    (14822, 25, 7),  -- Shura Kote +1 ACC: 7
    (14822, 23, 12), -- Shura Kote +1 ATT: 12
    (15325, 1040, 1), -- Evoker's Boots Summoning Magic Casting Time -1
    (15544, 27, 5), -- Sattva Ring ENMITY: 5
    (15544, 160, -500), -- Sattva Ring DMG: -500
    (15545, 27, -5), -- Tamas Ring ENMITY: -5
    (15545, 30, 5),  -- Tamas Ring MACC: 5
    (15899, 384, 500), -- Velocious Belt HASTE_GEAR: 500
    (16442, 25, 2), -- Freesword`s Baghnakhs ACC: 2
    (16442, 23, 3), -- Freesword`s Baghnakhs ATT: 3
    (16516, 5, 5),  -- Junior Muskteer`s Tuck MP: 5
    (16529, 23, 6), -- Musketeers Sword ATT: 6
    (16571, 12, 2),  -- Temple Knight Army Sword INT: 2
    (16571, 13, 2),  -- Temple Knight Army Sword MND: 2
    (16571, 10, 2),  -- Temple Knight Army Sword VIT: 2
    (16766, 14, 5), -- Paper Knife CHR: 5
    (16829, 12, 3), -- Fencing Degen INT: 3
    (16829, 13, 3), -- Fencing Degen MND: 3
    (16829, 114, 3), -- Fencing Degen ENFEEBLE: 3
    (17094, 71, 4), -- Wise Wizard`s Staff MPHEAL: 4
    (17151, 71, 4), -- Musketeer Commander`s Rod MPHEAL: 4
    (17159, 26, 2), -- Freesword`s Bow RACC: 2
    (17188, 24, 3),  -- Hunter`s Zamburak RATT: 3
    (17188, 26, 3),  -- Hunter`s Zamburak RACC: 3
    (17195, 26, 2), -- Windurstian Bow RACC: 2
    (17196, 26, 2), -- Federation Bow RACC: 2
    (17282, 11, 3), -- Combat Caster`s Boomerang AGI: 3
    (17422, 71, 3), -- Blessed Hammer MPHEAL: 3
    (17423, 12, 5), -- Casting Wand INT: 5
    (17497, 25, 2), -- Windurstian Baghnakhs ACC: 2
    (17497, 23, 4), -- Windurstian Baghnakhs ATT: 4
    (17498, 23, 5), -- Federation Baghnakhs ATT: 5
    (17532, 5, 30), -- Kukulcans Staff MP: 30
    (17532, 71, 3), -- Kukulcans Staff MPHEAL: 3
    (17643, 2, 10), -- Honor Sword HP: 10
    (17643, 5, 10), -- Honor Sword MP: 10
    (17666, 5, 5),  -- Junior Muskteer`s Tuck +1 MP: 5
    (17667, 5, 5),  -- Junior Muskteer`s Tuck +2 MP: 5
    (17670, 12, 2),  -- Temple Knight Army Sword +1 INT: 2
    (17670, 13, 2),  -- Temple Knight Army Sword +1 MND: 2
    (17670, 10, 2),  -- Temple Knight Army Sword +1 VIT: 2
    (17671, 12, 2),  -- Temple Knight Army Sword +2 INT: 2
    (17671, 13, 2),  -- Temple Knight Army Sword +2 MND: 2
    (17671, 10, 2),  -- Temple Knight Army Sword +2 VIT: 2
    (17680, 23, 10), -- Musketeers Sword +1 ATT: 10
    (17681, 23, 10), -- Musketeers Sword +2 ATT: 10
    (18132, 11, 3), -- Combat Caster`s Boomerang +1 AGI: 3
    (18133, 11, 3), -- Combat Caster`s Boomerang +2 AGI: 3
    (18295, 2, 10), -- Wyrm Tongue HP: 10
    (18295, 5, 10), -- Wyrm Tongue MP: 10
    (18295, 16, 7), -- Wyrm Tongue ICE_RES: 7
    (18295, 25, 5), -- Wyrm Tongue Accuracy +5
    (23040, 25, 3), -- Nanaa's Lucky Charm Acc: 3
    (23040, 303, 1), -- Nanaa's Lucky Charm Treasure Hunter: 1
    (23045, 2, 4), -- Shepherd's Bonnet HP +4
    (23112, 25, 3), -- Shepherd's Doublet Acc +3
    (23179, 72, 1), -- Shepherd's Bracers hHP +1
    (23246, 10, 2), -- Shepherd's Hose VIT +2
    (23313, 71, 1); -- Shepherd's Boots hMP +1

UNLOCK TABLES;
