LOCK TABLES `zone_settings` WRITE;

UPDATE `zone_settings` SET `music_day` = 608, `music_night` = 608 WHERE `name` = 'La_Theine_Plateau';
UPDATE `zone_settings` SET `music_day` = 606, `music_night` = 606 WHERE `name` = 'Valkurm_Dunes';
UPDATE `zone_settings` SET `music_day` = 603, `music_night` = 603 WHERE `name` = 'Buburimu_Peninsula';
UPDATE `zone_settings` SET `music_day` = 607, `music_night` = 607 WHERE `name` = 'Konschtat_Highlands';
UPDATE `zone_settings` SET `music_day` = 612, `music_night` = 612 WHERE `name` = 'Tahrongi_Canyon';
UPDATE `zone_settings` SET `music_day` = 610, `music_night` = 610 WHERE `name` = 'Qufim_Island';
UPDATE `zone_settings` SET `music_day` = 605, `music_night` = 605 WHERE `name` = 'Davoi';
UPDATE `zone_settings` SET `music_day` = 609, `music_night` = 609 WHERE `name` = 'Castle_Oztroja';
UPDATE `zone_settings` SET `music_day` = 600, `music_night` = 600 WHERE `name` = 'Beadeaux';
UPDATE `zone_settings` SET `music_day` = 601, `music_night` = 601 WHERE `name` = 'Bibiki_Bay';
UPDATE `zone_settings` SET `music_day` = 602, `music_night` = 602 WHERE `name` = 'The_Boyahda_Tree';
UPDATE `zone_settings` SET `music_day` = 611, `music_night` = 611 WHERE `name` = 'Sea_Serpent_Grotto';
UPDATE `zone_settings` SET `music_day` = 604, `music_night` = 604 WHERE `name` = 'Cape_Teriggan';

UNLOCK TABLES;
