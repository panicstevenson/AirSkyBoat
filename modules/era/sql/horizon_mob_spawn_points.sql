-- --------------------------------------------------------
-- Horizon Mob Spawn Points
-- --------------------------------------------------------
-- This module is used to move or remove mobs in certain zones.
-- If creating a new EXP camp please zero out the spawn points and create new mobs using the horizon_spawner.lua
-- This is to keep all the group camps in one place and in one lua rather than two.
-- --------------------------------------------------------

REPLACE INTO `mob_spawn_points` (`mobid`, `mobname`, `polutils_name`, `groupid`, `pos_x`, `pos_y`, `pos_z`, `pos_rot`) VALUES
    (17224129,'Marsh_Funguar','Marsh Funguar',36,0,0,0,0),
    (17224130,'Marsh_Funguar','Marsh Funguar',36,0,0,0,0),
    (17224131,'Marsh_Funguar','Marsh Funguar',36,0,0,0,0),
    (17224132,'Marsh_Funguar','Marsh Funguar',36,0,0,0,0);
