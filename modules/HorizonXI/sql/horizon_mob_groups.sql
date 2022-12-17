-- ------------------------------------------------------------
-- Horizon Respawn Time Changes (7 min dungeon, 12 min stronghold)
-- ------------------------------------------------------------

LOCK TABLES
    `mob_groups` WRITE;
-- This will ensure only the non-scripted NMs don't get an respawntime overwritten
UPDATE `mob_groups` SET `respawntime` = '420' WHERE `zoneid` = 2  AND `respawntime` < 961 AND `spawntype` < 32 -- Carpenters_Landing
                                                OR `zoneid` = 9   AND `respawntime` < 961 AND `spawntype` < 32  -- PsoXja
                                                OR `zoneid` = 140 AND `respawntime` < 961 AND `spawntype` < 32  -- Ghelsba_Outpost
                                                OR `zoneid` = 142 AND `respawntime` < 961 AND `spawntype` < 32  -- Yughott_Grotto
                                                OR `zoneid` = 143 AND `respawntime` < 961 AND `spawntype` < 32  -- Palborough_Mines
                                                OR `zoneid` = 145 AND `respawntime` < 961 AND `spawntype` < 32  -- Giddeus
                                                OR `zoneid` = 153 AND `respawntime` < 961 AND `spawntype` < 32  -- The_Boyahda_Tree
                                                OR `zoneid` = 154 AND `respawntime` < 961 AND `spawntype` < 32  -- Dragons_Aery
                                                OR `zoneid` = 166 AND `respawntime` < 961 AND `spawntype` < 32  -- Ranguemont_Pass
                                                OR `zoneid` = 167 AND `respawntime` < 961 AND `spawntype` < 32  -- Bostaunieux_Oubliette
                                                OR `zoneid` = 169 AND `respawntime` < 961 AND `spawntype` < 32  -- Toraimarai_Canal
                                                OR `zoneid` = 172 AND `respawntime` < 961 AND `spawntype` < 32  -- Zeruhn_Mines
                                                OR `zoneid` = 174 AND `respawntime` < 961 AND `spawntype` < 32  -- Kuftal_Tunnel
                                                OR `zoneid` = 177 AND `respawntime` < 961 AND `spawntype` < 32  -- VeLugannon_Palace
                                                OR `zoneid` = 190 AND `respawntime` < 961 AND `spawntype` < 32  -- King_Ranperres_Tomb
                                                OR `zoneid` = 191 AND `respawntime` < 961 AND `spawntype` < 32  -- Dangruf_Wadi
                                                OR `zoneid` = 192 AND `respawntime` < 961 AND `spawntype` < 32  -- Inner_Horutoto_Ruins
                                                OR `zoneid` = 193 AND `respawntime` < 961 AND `spawntype` < 32  -- Ordelles_Caves
                                                OR `zoneid` = 194 AND `respawntime` < 961 AND `spawntype` < 32  -- Outer_Horutoto_Ruins
                                                OR `zoneid` = 195 AND `respawntime` < 961 AND `spawntype` < 32  -- The_Eldieme_Necropolis
                                                OR `zoneid` = 196 AND `respawntime` < 961 AND `spawntype` < 32  -- Gusgen_Mines
                                                OR `zoneid` = 197 AND `respawntime` < 961 AND `spawntype` < 32  -- Crawlers_Nest
                                                OR `zoneid` = 198 AND `respawntime` < 961 AND `spawntype` < 32  -- Maze_of_Shakhrami
                                                OR `zoneid` = 200 AND `respawntime` < 961 AND `spawntype` < 32  -- Garlaige_Citadel
                                                OR `zoneid` = 204 AND `respawntime` < 961 AND `spawntype` < 32  -- FeiYin
                                                OR `zoneid` = 205 AND `respawntime` < 961 AND `spawntype` < 32  -- Ifrit's Cauldron
                                                OR `zoneid` = 208 AND `respawntime` < 961 AND `spawntype` < 32  -- Quicksand_Caves
                                                OR `zoneid` = 212 AND `respawntime` < 961 AND `spawntype` < 32  -- Gustav_Tunnel
                                                OR `zoneid` = 213 AND `respawntime` < 961 AND `spawntype` < 32; -- Labyrinth_of_Onzozo

UPDATE `mob_groups` SET `respawntime` = '960' WHERE `zoneid` = 11 AND `respawntime` < 961 AND `spawntype` < 32  -- Oldton_Movalpolos
                                                OR `zoneid` = 12  AND `respawntime` < 961 AND `spawntype` < 32  -- Newton_Movalpolos
                                                OR `zoneid` = 27  AND `respawntime` < 961 AND `spawntype` < 32  -- Phomiuna_Aqueducts
                                                OR `zoneid` = 28  AND `respawntime` < 961 AND `spawntype` < 32  -- Sacrarium
                                                OR `zoneid` = 34  AND `respawntime` < 961 AND `spawntype` < 32  -- Grand_Palace_of_HuXzoi
                                                OR `zoneid` = 35  AND `respawntime` < 961 AND `spawntype` < 32  -- The_Garden_of_RuHmet
                                                OR `zoneid` = 141 AND `respawntime` < 961 AND `spawntype` < 32  -- Fort_Ghelsba
                                                OR `zoneid` = 147 AND `respawntime` < 961 AND `spawntype` < 32  -- Beadeaux
                                                OR `zoneid` = 148 AND `respawntime` < 961 AND `spawntype` < 32  -- Qulun_Dome
                                                OR `zoneid` = 149 AND `respawntime` < 961 AND `spawntype` < 32  -- Davoi
                                                OR `zoneid` = 150 AND `respawntime` < 961 AND `spawntype` < 32  -- Monastic_Cavern
                                                OR `zoneid` = 151 AND `respawntime` < 961 AND `spawntype` < 32  -- Castle_Oztroja
                                                OR `zoneid` = 152 AND `respawntime` < 961 AND `spawntype` < 32  -- Altar_Room
                                                OR `zoneid` = 157 AND `respawntime` < 961 AND `spawntype` < 32  -- Middle_Delkfutts_Tower
                                                OR `zoneid` = 158 AND `respawntime` < 961 AND `spawntype` < 32  -- Upper_Delkfutts_Tower
                                                OR `zoneid` = 159 AND `respawntime` < 961 AND `spawntype` < 32  -- Temple_of_Uggalepih
                                                OR `zoneid` = 160 AND `respawntime` < 961 AND `spawntype` < 32  -- Den_of_Rancor
                                                OR `zoneid` = 161 AND `respawntime` < 961 AND `spawntype` < 32  -- Castle_Zvahl_Baileys
                                                OR `zoneid` = 162 AND `respawntime` < 961 AND `spawntype` < 32  -- Castle_Zvahl_Keep
                                                OR `zoneid` = 173 AND `respawntime` < 961 AND `spawntype` < 32  -- Korroloka_Tunnel
                                                OR `zoneid` = 176 AND `respawntime` < 961 AND `spawntype` < 32  -- Sea_Serpent_Grotto
                                                OR `zoneid` = 178 AND `respawntime` < 961 AND `spawntype` < 32  -- The_Shrine_of_RuAvitau
                                                OR `zoneid` = 184 AND `respawntime` < 961 AND `spawntype` < 32; -- Lower_Delkfutts_Tower

-- Adjusting Ghost Levels for Manaburn Camp #1 Latheine
UPDATE `mob_groups` SET `minLevel` = 18, `maxLevel` = 21 WHERE `groupid` = "33" AND `zoneid` = "102";

-- NM Adjustments
UPDATE `mob_groups` SET `spawntype` = 32, `respawntime` = 0 WHERE name = "Bat_Eye" and `zoneid` = 166;
UPDATE `mob_groups` SET `dropid` = 256 WHERE name = "King_Crawler" and `zoneid` = 197; -- Sets King Crawler drop to match Soldier Crawler (KC is OOE) This NEEDS dynaamic renamer
UPDATE `mob_groups` SET `spawntype` = 32, `respawntime` = 0 WHERE name = "Wyvern" and `zoneid` = 213;

-- ----------------------------------
-- Horizon Camps Changes  https://docs.google.com/spreadsheets/d/1vGcjQN89ssux3Tc_OC3mCWofOTh25DDgo9TBx6FoRDI/edit#gid=0
-- ----------------------------------
-- Carpenters_Landing (Zone 2)
UPDATE `mob_groups` set `minLevel` = 16, `maxLevel` = 19 WHERE name = "Bulldog_Bats" and `zoneid` =2;
UPDATE `mob_groups` set `minLevel` = 16, `maxLevel` = 19 WHERE name = "Specter_Bat" and `zoneid` =2;
UPDATE `mob_groups` set `minLevel` = 20, `maxLevel` = 22 WHERE name = "Flytrap" and `zoneid` =2;

-- Bibiki_Bay (Zone 4)
UPDATE `mob_groups` set `minLevel` = 79, `maxLevel` = 81 WHERE name = "Catoblepas" and `zoneid` = 4;

-- Uleguerand_Range (Zone 5)
UPDATE `mob_groups` set `minLevel` = 60, `maxLevel` = 63 WHERE name = "Cwn_Annwn" and `zoneid` = 5;

-- Attohwa_Chasm (Zone 7)
UPDATE `mob_groups` set `minLevel` = 35, `maxLevel` = 38 WHERE name = "Hecteyes" and `zoneid` = 7;

-- PsoXja (Zone 9)
UPDATE `mob_groups` set `minLevel` = 65, `maxLevel` = 68 WHERE name = "Dire_Bat" and `zoneid` = 9;
UPDATE `mob_groups` set `minLevel` = 65, `maxLevel` = 68 WHERE name = "Diremite_Assaulter" and `zoneid` = 9;

-- Misareaux_Coast (Zone 25)
UPDATE `mob_groups` SET `minLevel` = 47, `maxLevel` = 49 WHERE name = "Mantrap" and `zoneid` = 25;
UPDATE `mob_groups` SET `minLevel` = 49, `maxLevel` = 51 WHERE name = "Diatryma" and `zoneid` = 25;

-- Jugner_Forest (Zone 104)
UPDATE `mob_groups` SET `minLevel` = 22, `maxLevel` = 25 WHERE name = "Jugner_Funguar" and `zoneid` = 104;

-- Batallia_Downs (Zone 105)
UPDATE `mob_groups` SET `minLevel` = 23, `maxLevel` = 26 WHERE name = "May_Fly" and `zoneid` = 105;
UPDATE `mob_groups` SET `minLevel` = 22, `maxLevel` = 24 WHERE name = "Stalking_Sapling" and `zoneid` = 105;

-- Rolanberry_Fields (Zone 110)
UPDATE `mob_groups` SET `minLevel` = 22, `maxLevel` = 25 WHERE name = "Death_Wasp" and `zoneid` = 110;

-- Cape_Teriggan (Zone 113)
UPDATE `mob_groups` SET `minLevel` = 62, `maxLevel` = 65 WHERE name = "Sand_Lizard"  and `zoneid` = 113;
UPDATE `mob_groups` SET `minLevel` = 67, `maxLevel` = 70 WHERE name = "Terror_Pugil"  and `zoneid` = 113;

-- Eastern_Altepa_Desert (Zone 114)
UPDATE `mob_groups` SET `minLevel` = 31, `maxLevel` = 34 WHERE name = "Giant_Spider"  and `zoneid` = 114;
UPDATE `mob_groups` SET `minLevel` = 31, `maxLevel` = 34 WHERE name = "Giant_Spider"  and `zoneid` = 114;
UPDATE `mob_groups` SET `minLevel` = 38, `maxLevel` = 41 WHERE name = "Desert_Dhalmel"  and `zoneid` = 114;

-- Tahrongi Canyon (Zone 117)
INSERT INTO `mob_groups` VALUES (52,1635,117,'Goblin_Ambusher',330,0,1017,0,0,17,20,0,NULL);
INSERT INTO `mob_groups` VALUES (53,1738,117,'Goblin_Tinkerer',330,0,6029,0,0,17,20,0,NULL);
INSERT INTO `mob_groups` VALUES (54,1643,117,'Goblin_Butcher',330,0,6029,0,0,17,20,0,NULL);

-- Buburimu_Peninsula (Zone 118)
UPDATE `mob_groups` SET `minLevel` = 22, `maxLevel` = 25 WHERE name = "Snipper" and `zoneid` = 118;
UPDATE `mob_groups` SET `minLevel` = 25, `maxLevel` = 28 WHERE name = "Shoal_Pugil" and `zoneid` = 118;
UPDATE `mob_groups` SET `minLevel` = 21, `maxLevel` = 24 WHERE name = "Poison_Leech" and `zoneid` = 118;

-- Sauromugue_Champaign (Zone 120)
UPDATE `mob_groups` SET `minLevel` = 22, `maxLevel` = 25 WHERE name = "Hill_Lizard"  and `zoneid` = 120;
UPDATE `mob_groups` SET `minLevel` = 34, `maxLevel` = 37 WHERE name = "Evil_Weapon"  and `zoneid` = 120;

-- The_Sanctuary_of_ZiTah (Zone 121)
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 46 WHERE name = "Myxomycete" and `zoneid` = 121;
UPDATE `mob_groups` SET `minLevel` = 46, `maxLevel` = 49 WHERE name = "Apsaras" and `zoneid` = 121;

-- RoMaeve (Zone 122)
UPDATE `mob_groups` SET `minLevel` = 61, `maxLevel` = 64 WHERE name = "Killing_Weapon" and `zoneid` = 122;
UPDATE `mob_groups` SET `minLevel` = 62, `maxLevel` = 65 WHERE name = "Ominous_Weapon" and `zoneid` = 122;
UPDATE `mob_groups` SET `minLevel` = 64, `maxLevel` = 67 WHERE name = "Magic_Flagon" and `zoneid` = 122;
UPDATE `mob_groups` SET `minLevel` = 65, `maxLevel` = 68 WHERE name = "Cursed_Puppet" and `zoneid` = 122;

-- Yuhtunga_Jungle (Zone 123)
UPDATE `mob_groups` SET `minLevel` = 34, `maxLevel` = 37 WHERE name = "Goblin_Furrier" and `zoneid` = 123;
UPDATE `mob_groups` SET `minLevel` = 33, `maxLevel` = 36 WHERE name = "Death_Jacket" and `zoneid` = 123;
UPDATE `mob_groups` SET `minLevel` = 37, `maxLevel` = 40 WHERE name = "Soldier_Crawler" and `zoneid` = 123;

-- Yhoator_Jungle (Zone 124)
UPDATE `mob_groups` SET `minLevel` = 52, `maxLevel` = 54 WHERE name = "Goblin_Bouncer" and `zoneid` = 124;
UPDATE `mob_groups` SET `minLevel` = 52, `maxLevel` = 54 WHERE name = "Goblin_Hunter" and `zoneid` = 124;
UPDATE `mob_groups` SET `minLevel` = 41, `maxLevel` = 44 WHERE name = "Young_Opo-opo" and `zoneid` = 124;

-- Western_Altepa_Desert (Zone 125)
UPDATE `mob_groups` SET `minLevel` = 40, `maxLevel` = 43 WHERE name = "Desert_Spider" and `zoneid` = 125;
UPDATE `mob_groups` SET `minLevel` = 43, `maxLevel` = 46 WHERE name = "Desert_Worm" and `zoneid` = 125;
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 47 WHERE name = "Desert_Dhalmel" and `zoneid` = 125;
UPDATE `mob_groups` SET `minLevel` = 49, `maxLevel` = 51 WHERE name = "Desert_Beetle" and `zoneid` = 125;

-- Qufim_Island (Zone 126)
UPDATE `mob_groups` SET `minLevel` = 25, `maxLevel` = 27 WHERE name = "Clipper" and `zoneid` = 126;

-- Behemoths_Dominion (Zone 127)
UPDATE `mob_groups` SET `minLevel` = 46, `maxLevel` = 49 WHERE name = "Master_Coeurl" and `zoneid` = 127;

-- The_Boyahda_Tree (Zone 153)
UPDATE `mob_groups` SET `minLevel` = 63, `maxLevel` = 66 WHERE name = "Moss_Eater" and `zoneid` = 153;
UPDATE `mob_groups` SET `minLevel` = 62, `maxLevel` = 65, `respawntime` = 960 WHERE name = "Robber_Crab" and `zoneid` = 153;
UPDATE `mob_groups` SET `minLevel` = 64, `maxLevel` = 67 WHERE name = "Knight_Crawler" and `zoneid` = 153;
UPDATE `mob_groups` SET `minLevel` = 65, `maxLevel` = 68 WHERE name = "Mourioche" and `zoneid` = 153;

-- Bostaunieux_Oubliette (Zone 167)
UPDATE `mob_groups` SET `minLevel` = 57, `maxLevel` = 59 WHERE name = "Werebat" and `zoneid` = 167;

-- Toraimarai Canal (Zone 169)
UPDATE `mob_groups` SET `respawntime` = 960 WHERE name = "Girtab" and `zoneid` = 169;

-- Korroloka_Tunnel (Zone 173)
UPDATE `mob_groups` SET `minLevel` = 21, `maxLevel` = 24 WHERE name = "Land_Worm" and `zoneid` = 173;
UPDATE `mob_groups` SET `minLevel` = 23, `maxLevel` = 25 WHERE name = "Seeker_Bats" and `zoneid` = 173;

-- Kuftal Tunnel (Zone 174)
UPDATE `mob_groups` SET `respawntime` = 960 WHERE name = "Sand_Lizard" and `zoneid` = 174; -- Amemet PHs

-- Sea_Serpent_Grotto (Zone 176)
UPDATE `mob_groups` SET `minLevel` = 65, `maxLevel` = 67 WHERE name = "Robber_Crab" and `zoneid` = 176;
UPDATE `mob_groups` SET `minLevel` = 64, `maxLevel` = 66 WHERE name = "Dire_Bat" and `zoneid` = 176;

-- Ve'Lugannon Palace (Zone 177)
UPDATE `mob_groups` SET `respawntime` = 960 WHERE name = "Detector" and `zoneid` = 177; -- All detectors

-- The_Shrine_of_RuAvitau (Zone 178)
UPDATE `mob_groups` SET `minLevel` = 78, `maxLevel` = 80 WHERE name = "Aura_Pot"  and `zoneid` = 178;

-- Ordelle's Cave (Zone 193)
UPDATE `mob_groups` SET `respawntime` = 720 WHERE name = "Stroper_Chyme" and `zoneid` = 193;

-- The_Eldieme_Necropolis (Zone 195)
UPDATE `mob_groups` SET `minLevel` = 41, `maxLevel` = 44 WHERE name = "Lost_Soul_blm"  and `zoneid` = 195;

-- Gusgen_Mines (Zone 196)
UPDATE `mob_groups` SET `minLevel` = 21, `maxLevel` = 24 WHERE name = "Ghoul_blm"  and `zoneid` = 196;
UPDATE `mob_groups` SET `minLevel` = 21, `maxLevel` = 24 WHERE name = "Ghoul_war"  and `zoneid` = 196;
UPDATE `mob_groups` SET `minLevel` = 27, `maxLevel` = 30 WHERE name = "Wendigo_war"  and `zoneid` = 196;

-- Crawlers_Nest (Zone 197)
UPDATE `mob_groups` SET `minLevel` = 40, `maxLevel` = 43 WHERE name = "Worker_Crawler"  and `zoneid` = 197;

-- Ifrits_Cauldron (Zone 205)
UPDATE `mob_groups` SET `minLevel` = 61, `maxLevel` = 64 WHERE name = "Old_Opo-opo"  and `zoneid` = 205;

-- Quicksand_Caves (Zone 208)
UPDATE `mob_groups` SET `minLevel` = 51, `maxLevel` = 53 WHERE name = "Helm_Beetle"  and `zoneid` = 208;
UPDATE `mob_groups` SET `minLevel` = 52, `maxLevel` = 54 WHERE name = "Sand_Spider"  and `zoneid` = 208;
INSERT INTO `mob_groups` VALUES (45,1928,208,'Helm_Beetle',960,0,1299,0,0,51,54,0,NULL);

-- Gustav_Tunnel (Zone 212)
UPDATE `mob_groups` SET `minLevel` = 45, `maxLevel` = 48 WHERE name = "Hell_Bat"  and `zoneid` = 212;

-- KA Stuff
UPDATE `mob_groups` SET `minLevel` = 55, `maxLevel` = 55, `HP` = 5000, `MP` = 500 WHERE name = "Knight_Crab"  and `zoneid` = 104;
UPDATE `mob_groups` SET `minLevel` = 60, `maxLevel` = 60, `HP` = 45000, `MP` = 500 WHERE name = "King_Arthro"  and `zoneid` = 104;
INSERT INTO `mob_groups` VALUES (89,2271,104,'Queen_Crab',0,128,6037,10000,2000,55,55,0,NULL);
INSERT INTO `mob_groups` VALUES (90,2271,104,'Pawn_Crab',0,128,6037,200,2000,55,55,0,NULL);

-- LoO Stuff (Zone 213)
UPDATE `mob_groups` SET `respawntime` = 960 WHERE name = "Flying_Manta" and `zoneid` = 213; -- LoO PH and all mantas
UPDATE `mob_groups` SET `minLevel` = 80, `maxLevel` = 81, `HP` = 25000, `MP` = 25000 WHERE name = "Lord_of_Onzozo"  and `zoneid` = 213;
-- ----------------------------------
--     AF Weapon NM Adjustments
-- ----------------------------------
-- WAR
UPDATE `mob_groups` SET `minLevel` = 42, `maxLevel` = 42, `HP` = 2500 WHERE name = "Barakbok"  and `zoneid` = 149;
UPDATE `mob_groups` SET `minLevel` = 42, `maxLevel` = 42, `HP` = 3000 WHERE name = "Gavotvut"  and `zoneid` = 149;

-- MNK
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 3400 WHERE name = "Wandering_Ghost"  and `zoneid` = 196;

-- WHM
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 3600 WHERE name = "Marchelute"  and `zoneid` = 103;

-- BLM
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 3000 WHERE name = "Chaos_Elemental"  and `zoneid` = 112;

-- RDM
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 3600 WHERE name = "Purpleflash_Brukdok"  and `zoneid` = 149;

-- PLD
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 3000 WHERE name = "Polevik"  and `zoneid` = 193;

-- DRK
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 3600 WHERE name = "Vaa_Huja_the_Erudite"  and `zoneid` = 145;

-- BRD
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 3400 WHERE name = "Tros"  and `zoneid` = 166;

-- NIN
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 2600 WHERE name = "Tsuchigumo"  and `zoneid` = 114;

-- SAM
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 4100 WHERE name = "Isonade"  and `zoneid` = 121;

-- DRG
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 3800 WHERE name = "Decurio_I-III"  and `zoneid` = 114;

-- SMN
UPDATE `mob_groups` SET `minLevel` = 44, `maxLevel` = 44, `HP` = 3400 WHERE name = "Galgalim"  and `zoneid` = 209;

-- Twinkling_Treant
REPLACE INTO `mob_groups` VALUES (2,21000,210,'Twinkling_Treant',0,128,0,100000,0,18,18,0,NULL);

-- --------------------------------------------------------
-- Horizon Mob Subjob Manager
-- --------------------------------------------------------
-- This adjustment to the table will add data to the tables to control whether
-- a mob's subjob level is:
-- 0: None
-- 1: Halved (eg: 75/35)
-- 2: Two-thirds (eg: 75/50)
-- 3: Equal (eg: 75/75)
-- --------------------------------------------------------

ALTER TABLE `mob_groups`
	ADD COLUMN IF NOT EXISTS `subratio` TINYINT(2) UNSIGNED NOT NULL DEFAULT '3' AFTER `maxLevel`,
	ADD CONSTRAINT IF NOT EXISTS subjob_type CHECK (subratio <= 3);

UNLOCK TABLES;
