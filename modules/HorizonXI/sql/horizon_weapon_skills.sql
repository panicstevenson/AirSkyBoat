LOCK TABLES
    `weapon_skills` WRITE;

SET @NONE = 0;
SET @TRANSFICTION = 1;
SET @COMPRESSION = 2;
SET @LIQUEFACTION = 3;
SET @SCISSION = 4;
SET @REVERBERATION = 5;
SET @DETONATION = 6;
SET @INDURATION = 7;
SET @IMPACTION = 8;
SET @GRAVITATION = 9;
SET @DISTORTION = 10;
SET @FUSION = 11;
SET @FRAGMENTATION = 12;
SET @LIGHT = 13;
SET @DARKNESS = 14;
SET @LIGHT_II = 15;
SET @DARKNESS_II = 16;

SET @MAIN = 1;
SET @SUB = 0;

SET @WARRDMPLDDRKBLU = 0x02000000020002020000000000000002000000000000;
SET @PLD = 0x00000000000002000000000000000000000000000000;
SET @WARRDMPLDDRKBLUCOR = 0x02000000020002020000000000000002020000000000;
SET @WARBST = 0x02000000000000000200000000000000000000000000;
SET @RDMTHFBRDRNGNINBLUDNC = 0x00000000020200000002020002000002000002000000;
SET @THFDNC = 0x00000000000200000000000000000000000002000000;
SET @WARWHMPLDDRKSAMBLU = 0x02020000000002020000000200000002000000000000;
SET @WARMNKWHMBLMPLDSMNBLUSCH = 0x02020202000002000000000000000202000000020000;
SET @MNKPUP = 0x00020000000000000000000000000000000200000000;
SET @WARDRK = 0x02000000000000020000000000000000000000000000;
SET @SAM = 0x00000000000000000000000200000000000000000000;
SET @PLDDRK = 0x00000000000002020000000000000000000000000000;
SET @WARPLDDRK = 0x02000000000002020000000000000000000000000000;
SET @DRK = 0x00000000000000020000000000000000000000000000;
SET @WARDRKBST = 0x02000000000000020200000000000000000000000000;
SET @DRG = 0x00000000000000000000000000020000000000000000;
SET @WARSAMDRG = 0x02000000000000000000000200020000000000000000;
SET @RNG = 0x00000000000000000000020000000000000000000000;
SET @RNGCOR = 0x00000000000000000000020000000000020000000000;

UPDATE `weapon_skills` SET `skilllevel` = '10' WHERE `skilllevel` = '5';

-- Sword
UPDATE `weapon_skills` SET `primary_sc` = @LIQUEFACTION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 30 WHERE `name` = 'burning_blade';
UPDATE `weapon_skills` SET `primary_sc` = @LIQUEFACTION, `secondary_sc` = @DETONATION, `tertiary_sc` = @NONE, `main_only` = @SUB, `jobs` = @WARRDMPLDDRKBLU, `skilllevel` = 50 WHERE `name` = 'red_lotus_blade';
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 100 WHERE `name` = 'shining_blade';
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @TRANSFICTION, `tertiary_sc` = @NONE, `main_only` = @SUB, `jobs` = @WARRDMPLDDRKBLU, `skilllevel` = 125 WHERE `name` = 'seraph_blade';
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @IMPACTION, `tertiary_sc` = @NONE, `main_only` = @SUB, `jobs` = @WARRDMPLDDRKBLU, `skilllevel` = 200 WHERE `name` = 'vorpal_blade';
UPDATE `weapon_skills` SET `primary_sc` = @GRAVITATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @PLD, `skilllevel` = 225 WHERE `name` = 'swift_blade';
UPDATE `weapon_skills` SET `primary_sc` = @FRAGMENTATION, `secondary_sc` = @SCISSION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @WARRDMPLDDRKBLUCOR, `skilllevel` = 240 WHERE `name` = 'savage_blade';

-- Axe
UPDATE `weapon_skills` SET `primary_sc` = @DETONATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 70 WHERE `name` = 'gale_axe';
UPDATE `weapon_skills` SET `primary_sc` = @INDURATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 100 WHERE `name` = 'avalanche_axe';
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @IMPACTION, `tertiary_sc` = @NONE, `skilllevel` = 200 WHERE `name` = 'calamity';
UPDATE `weapon_skills` SET `primary_sc` = @FUSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @WARBST, `range` = 16, `skilllevel` = 225 WHERE `name` = 'mistral_axe';
UPDATE `weapon_skills` SET `primary_sc` = @FUSION, `secondary_sc` = @DETONATION, `tertiary_sc` = @NONE, `skilllevel` = 240 WHERE `name` = 'decimation';

-- Katana
UPDATE `weapon_skills` SET `primary_sc` = @REVERBERATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 70 WHERE `name` = 'blade_teki';
UPDATE `weapon_skills` SET `primary_sc` = @INDURATION, `secondary_sc` = @DETONATION, `tertiary_sc` = @NONE , `skilllevel` = 100 WHERE `name` = 'blade_to';
UPDATE `weapon_skills` SET `primary_sc` = @IMPACTION, `secondary_sc` = @TRANSFICTION, `tertiary_sc` = @NONE, `skilllevel` = 150 WHERE `name` = 'blade_chi';
UPDATE `weapon_skills` SET `primary_sc` = @COMPRESSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 175 WHERE `name` = 'blade_ei';
UPDATE `weapon_skills` SET `primary_sc` = @GRAVITATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 225 WHERE `name` = 'blade_ten';
UPDATE `weapon_skills` SET `primary_sc` = @GRAVITATION, `secondary_sc` = @TRANSFICTION, `tertiary_sc` = @NONE, `skilllevel` = 250 WHERE `name` = 'blade_ku';

-- Dagger
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 10 WHERE `name` = 'wasp_sting';
UPDATE `weapon_skills` SET `primary_sc` = @DETONATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 40 WHERE `name` = 'gust_slash';
UPDATE `weapon_skills` SET `primary_sc` = @NONE, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @RDMTHFBRDRNGNINBLUDNC, `skilllevel` = 175 WHERE `name` = 'energy_drain';
UPDATE `weapon_skills` SET `primary_sc` = @FRAGMENTATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @THFDNC, `skilllevel` = 225 WHERE `name` = 'shark_bite';
UPDATE `weapon_skills` SET `primary_sc` = @GRAVITATION, `secondary_sc` = @TRANSFICTION, `tertiary_sc` = @NONE, `skilllevel` = 230 WHERE `name` = 'evisceration';

-- Club
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 10 WHERE `name` = 'shining_strike';
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 100 WHERE `name` = 'seraph_strike';
UPDATE `weapon_skills` SET `primary_sc` = @REVERBERATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 70 WHERE `name` = 'brainshaker';
UPDATE `weapon_skills` SET `primary_sc` = @NONE, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 40 WHERE `name` = 'starlight';
UPDATE `weapon_skills` SET `primary_sc` = @NONE, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `main_only` = @SUB, `jobs` = @WARWHMPLDDRKSAMBLU, `skilllevel` = 125 WHERE `name` = 'moonlight';
UPDATE `weapon_skills` SET `primary_sc` = @INDURATION, `secondary_sc` = @REVERBERATION, `tertiary_sc` = @NONE, `skilllevel` = 150 WHERE `name` = 'skullbreaker';
UPDATE `weapon_skills` SET `primary_sc` = @DETONATION, `secondary_sc` = @IMPACTION, `tertiary_sc` = @NONE, `skilllevel` = 175 WHERE `name` = 'true_strike';
UPDATE `weapon_skills` SET `primary_sc` = @IMPACTION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 200 WHERE `name` = 'judgement';
UPDATE `weapon_skills` SET `primary_sc` = @FRAGMENTATION, `secondary_sc` = @COMPRESSION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @WARMNKWHMBLMPLDSMNBLUSCH, `skilllevel` = 230 WHERE `name` = 'black_halo';

-- Hand to Hand
UPDATE `weapon_skills` SET `primary_sc` = @COMPRESSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @MNKPUP, `skilllevel` = 75 WHERE `name` = 'one_inch_punch';
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @IMPACTION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @MNKPUP, `skilllevel` = 200 WHERE `name` = 'howling_fist';
UPDATE `weapon_skills` SET `primary_sc` = @FRAGMENTATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @MNKPUP, `skilllevel` = 225 WHERE `name` = 'dragon_kick';

-- Great Axe
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 40 WHERE `name` = 'iron_tempest';
UPDATE `weapon_skills` SET `primary_sc` = @COMPRESSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 150 WHERE `name` = 'keen_edge';
UPDATE `weapon_skills` SET `primary_sc` = @DETONATION, `secondary_sc` = @DISTORTION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @WARDRK, `skilllevel` = 240 WHERE `name` = 'steel_cyclone';

-- Great Katana
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @IMPACTION, `tertiary_sc` = @NONE, `skilllevel` = 70 WHERE `name` = 'tachi_goten';
UPDATE `weapon_skills` SET `primary_sc` = @LIQUEFACTION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 100 WHERE `name` = 'tachi_kagero';
UPDATE `weapon_skills` SET `primary_sc` = @REVERBERATION, `secondary_sc` = @IMPACTION, `tertiary_sc` = @NONE, `skilllevel` = 175 WHERE `name` = 'tachi_koki';
UPDATE `weapon_skills` SET `primary_sc` = @DETONATION, `secondary_sc` = @INDURATION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @SAM, `skilllevel` = 200 WHERE `name` = 'tachi_yukikaze';
UPDATE `weapon_skills` SET `primary_sc` = @DISTORTION, `secondary_sc` = @REVERBERATION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @SAM, `skilllevel` = 200 WHERE `name` = 'tachi_gekko';
UPDATE `weapon_skills` SET `primary_sc` = @FUSION, `secondary_sc` = @COMPRESSION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @SAM, `skilllevel` = 250 WHERE `name` = 'tachi_kasha';

-- Great Sword
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 10 WHERE `name` = 'hard_slash';
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 30 WHERE `name` = 'power_slash';
UPDATE `weapon_skills` SET `primary_sc` = @INDURATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 70 WHERE `name` = 'frostbite';
UPDATE `weapon_skills` SET `primary_sc` = @DETONATION, `secondary_sc` = @INDURATION, `tertiary_sc` = @NONE, `skilllevel` = 100 WHERE `name` = 'freezebite';
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @COMPRESSION, `tertiary_sc` = @NONE, `skilllevel` = 175 WHERE `name` = 'crescent_moon';
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @REVERBERATION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @PLDDRK, `skilllevel` = 200 WHERE `name` = 'sickle_moon';
UPDATE `weapon_skills` SET `primary_sc` = @FRAGMENTATION, `secondary_sc` = @DISTORTION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @WARPLDDRK, `skilllevel` = 250 WHERE `name` = 'ground_strike';

-- Scythe
UPDATE `weapon_skills` SET `primary_sc` = @COMPRESSION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `skilllevel` = 30 WHERE `name` = 'dark_harvest';
UPDATE `weapon_skills` SET `primary_sc` = @INDURATION, `secondary_sc` = @REVERBERATION, `tertiary_sc` = @NONE, `skilllevel` = 70 WHERE `name` = 'shadow_of_death';
UPDATE `weapon_skills` SET `primary_sc` = @COMPRESSION, `secondary_sc` = @SCISSION, `tertiary_sc` = @NONE, `skilllevel` = 100 WHERE `name` = 'nightmare_scythe';
UPDATE `weapon_skills` SET `primary_sc` = @SCISSION, `secondary_sc` = @TRANSFICTION, `tertiary_sc` = @NONE, `skilllevel` = 150 WHERE `name` = 'vorpal_scythe';
UPDATE `weapon_skills` SET `primary_sc` = @INDURATION, `secondary_sc` = @NONE, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @DRK, `skilllevel` = 200 WHERE `name` = 'guillotine';
UPDATE `weapon_skills` SET `primary_sc` = @GRAVITATION, `secondary_sc` = @COMPRESSION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @WARDRKBST, `skilllevel` = 250 WHERE `name` = 'spiral_hell';

-- Polearm
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @IMPACTION, `tertiary_sc` = @NONE, `skilllevel` = 30 WHERE `name` = 'thunder_thrust';
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @IMPACTION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @DRG, `skilllevel` = 70 WHERE `name` = 'raiden_thrust';
UPDATE `weapon_skills` SET `primary_sc` = @REVERBERATION, `secondary_sc` = @TRANSFICTION, `tertiary_sc` = @NONE, `skilllevel` = 175 WHERE `name` = 'vorpal_thrust';
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @INDURATION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @DRG, `skilllevel` = 200 WHERE `name` = 'skewer';
UPDATE `weapon_skills` SET `primary_sc` = @GRAVITATION, `secondary_sc` = @INDURATION, `tertiary_sc` = @NONE, `main_only` = @MAIN, `jobs` = @WARSAMDRG, `skilllevel` = 240 WHERE `name` = 'impulse_drive';

-- Stave
UPDATE `weapon_skills` SET `primary_sc` = @COMPRESSION, `secondary_sc` = @TRANSFICTION, `tertiary_sc` = @NONE, `skilllevel` = 100 WHERE `name` = 'starburst';
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @REVERBERATION, `tertiary_sc` = @NONE, `skilllevel` = 150 WHERE `name` = 'sunburst';
UPDATE `weapon_skills` SET `primary_sc` = @GRAVITATION, `secondary_sc` = @REVERBERATION, `tertiary_sc` = @NONE, `skilllevel` = 230 WHERE `name` = 'retribution';

-- Archery
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @LIQUEFACTION, `tertiary_sc` = @NONE, `main_only` = @SUB, `jobs` = @RNG, `skilllevel` = 80 WHERE `name` = 'dulling_arrow';
UPDATE `weapon_skills` SET `primary_sc` = @REVERBERATION, `secondary_sc` = @TRANSFICTION, `tertiary_sc` = @DETONATION, `main_only` = @SUB, `jobs` = @RNG, `skilllevel` = 175 WHERE `name` = 'sidewinder';
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @INDURATION, `tertiary_sc` = @NONE, `main_only` = @SUB, `jobs` = @RNG, `skilllevel` = 200, `range` = 5 WHERE `name` = 'blast_arrow';

-- Marksmanship
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @LIQUEFACTION, `tertiary_sc` = @NONE, `main_only` = @SUB, `jobs` = @RNGCOR, `skilllevel` = 80 WHERE `name` = 'sniper_shot';
UPDATE `weapon_skills` SET `primary_sc` = @REVERBERATION, `secondary_sc` = @TRANSFICTION, `tertiary_sc` = @DETONATION, `main_only` = @SUB, `jobs` = @RNGCOR, `skilllevel` = 175 WHERE `name` = 'slug_shot';
UPDATE `weapon_skills` SET `primary_sc` = @TRANSFICTION, `secondary_sc` = @INDURATION, `tertiary_sc` = @NONE, `main_only` = @SUB, `jobs` = @RNGCOR, `skilllevel` = 200, `range` = 5 WHERE `name` = 'blast_shot';

UNLOCK TABLES
