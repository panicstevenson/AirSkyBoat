-- --------------------------------------------------------
-- Horizon Mob Spawn Points
-- --------------------------------------------------------
-- This module is used to move or remove mobs in certain zones.
-- If creating a new EXP camp please zero out the spawn points and create new mobs using the horizon_spawner.lua
-- This is to keep all the group camps in one place and in one lua rather than two.
-- --------------------------------------------------------

REPLACE INTO `mob_spawn_points` (`mobid`, `mobname`, `polutils_name`, `groupid`, `pos_x`, `pos_y`, `pos_z`, `pos_rot`) VALUES
    -- Pashhow Marshlands
   	-- Removed Mobs Pashhow Marshlands (L-7), Flies/Dogs/Funguar
    (17224129,'Marsh_Funguar','Marsh Funguar',36,0,0,0,0),
    (17224130,'Marsh_Funguar','Marsh Funguar',36,0,0,0,0),
    (17224131,'Marsh_Funguar','Marsh Funguar',36,0,0,0,0),
    (17224132,'Marsh_Funguar','Marsh Funguar',36,0,0,0,0),
    -- Buburimu Peninsula
    	-- Removed Mobs Buburimu Peninsula (G-6), Bees/Rabbits
    (17260661,'Sylvestre','Sylvestre',6,0,0,0,0),
    (17260662,'Sylvestre','Sylvestre',6,0,0,0,0),
    (17260663,'Mighty_Rarab','Mighty Rarab',7,0,0,0,0),
    (17260664,'Mighty_Rarab','Mighty Rarab',7,0,0,0,0),
    (17260665,'Mighty_Rarab','Mighty Rarab',7,0,0,0,0),
    (17260666,'Zu','Zu',8,0,0,0,0),
    (17260667,'Goblin_Tinkerer','Goblin Tinkerer',10,0,0,0,0),
    (17260668,'Goblin_Butcher','Goblin Butcher',11,0,0,0,0),
    (17260669,'Zombie','Zombie',12,0,0,0,0),
    (17260672,'Mighty_Rarab','Mighty Rarab',65,0,0,0,0),
    	-- Removed Mobs Buburimu Peninsula (E-9), Mandragora/Birds
    (17260599,'Sylvestre','Sylvestre',6,0,0,0,0),
    (17260600,'Mighty_Rarab','Mighty Rarab',7,0,0,0,0),
    (17260601,'Mighty_Rarab','Mighty Rarab',7,0,0,0,0),
    (17260609,'Zombie','Zombie',12,0,0,0,0),
    (17260612,'Will-o-the-Wisp','Will-o\'-the-Wisp',14,0,0,0,0),
    (17260613,'Backoo','Backoo',55,0,0,0,0),
    (17260606,'Goblin_Ambusher','Goblin Ambusher',9,0,0,0,0),
    -- Removed Mobs Buburimu Peninsula (I-6), Dhalmel/Goblins
    (17260810,'Bull_Dhalmel','Bull Dhalmel',59,0,0,0,0),
    (17260811,'Bull_Dhalmel','Bull Dhalmel',59,0,0,0,0),
    (17260812,'Bull_Dhalmel','Bull Dhalmel',59,0,0,0,0),
    (17260816,'Bull_Dhalmel','Bull Dhalmel',16,0,0,0,0),
	(17260819,'Goblin_Mugger','Goblin Mugger',17,0,0,0,0),
	(17260817,'Bull_Dhalmel','Bull Dhalmel',16,0,0,0,0),
	(17260818,'Bull_Dhalmel','Bull Dhalmel',59,0,0,0,0),
	(17260819,'Bull_Dhalmel','Bull Dhalmel',59,0,0,0,0),
	(17260820,'Goblin_Ambusher','Goblin Ambusher',60,0,0,0,0),
	(17260821,'Goblin_Leecher','Goblin Leecher',62,0,0,0,0),
	(17260822,'Goblin_Tinkerer','Goblin Tinkerer',61,0,0,0,0),
	(17260823,'Goblin_Gambler','Goblin Gambler',63,0,0,0,0),
	(17260824,'Goblin_Butcher','Goblin Butcher',65,0,0,0,0),
	(17260825,'Zombie','Zombie',12,0,0,0,0),
	-- Sauromugue Champaign
    -- Removed Mobs Sauromugue Champaign (G-8), Beetles/Cockatrice
	(17269017,'Diving_Beetle','Diving Beetle',74,0,0,0,0),
	(17269018,'Diving_Beetle','Diving Beetle',74,0,0,0,0),
	(17269019,'Diving_Beetle','Diving Beetle',74,0,0,0,0),
	(17269020,'Diving_Beetle','Diving Beetle',74,0,0,0,0),
	-- Valkurm Dunes
    -- Valkurm Dunes (L-9) Lizards
	(17199244,'Hill_Lizard','Hill Lizard',23,0,0,0,0);
