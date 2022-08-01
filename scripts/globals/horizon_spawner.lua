-----------------------------------------------------------
--                  Horizon XI Global                    --
--             General Dynamic Mob Spawner               --
-----------------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/zone")

xi.horizon = {}

-----------------------------------------------------------
--                        Usage                          --
-----------------------------------------------------------
-- 1. Add xi.horizon.spawnInitialMobs(zone) to the target zone's onInitialize function. (This can be added to a zone even if it doesn't have additional mobs to spawn.)
-- 2. Follow the structure below to add in as many spawns as you want.
--
-- Note: You can use any of the pieces from the below table example. Each of these are
-- called by object names so they can be used in any order. A list of required objects
-- is anything within the insertDynamicEntity() function in the code. Anything below that
-- can be left out. (AKA drops, skills, spells, respawn, min, max)
--
-- Note: All fields for a function table are required. If they aren't needed just leave them
-- blank like in the example function table.
--
-----------------------------------------------------------
--                   Spawner Tables                      --
-----------------------------------------------------------

local spawnerMobs =
{
    -- [xi.zone.EXAMPLE] =
    -- {
        -- {name = "something", groupId = 1, groupZone = 1, funcLookup = "Default", min = 1, max = 2, xPos = 1.123, yPos = 1.123, zPos = 1.123, rot = 0, respawn = 30, drops = 123, skills = 234, spells = 345, enabled = true, spawnType = xi.spawnType.spawnType},
    -- }
    [xi.zone.PASHHOW_MARSHLANDS] =
    {
        -- Camp 1, Flies/Dogs/Funguar
        {name = "Gadfly",        groupId =   6, groupZone = 109, funcLookup = "Default", min = 18, max = 21, xPos = 592.0, yPos =  25.0, zPos = 183.8, rot =  51, respawn = 330, drops =  923, skills = 113, spells = 0},
        {name = "Gadfly",        groupId =   6, groupZone = 109, funcLookup = "Default", min = 18, max = 21, xPos = 634.8, yPos =  25.0, zPos = 208.1, rot =  51, respawn = 330, drops =  923, skills = 113, spells = 0},
        {name = "Gadfly",        groupId =   6, groupZone = 109, funcLookup = "Default", min = 18, max = 21, xPos = 547.7, yPos =  24.6, zPos = 215.0, rot =  51, respawn = 330, drops =  923, skills = 113, spells = 0},
        {name = "Gadfly",        groupId =   6, groupZone = 109, funcLookup = "Default", min = 18, max = 21, xPos = 621.1, yPos =  25.3, zPos = 230.8, rot =  51, respawn = 330, drops =  923, skills = 113, spells = 0},
        {name = "Bog Dog",       groupId =  10, groupZone = 109, funcLookup = "Default", min = 18, max = 25, xPos = 634.1, yPos =  25.0, zPos = 185.4, rot =   7, respawn = 330, drops =  328, skills = 143, spells = 0, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT},
        {name = "Bog Dog",       groupId =  10, groupZone = 109, funcLookup = "Default", min = 18, max = 25, xPos = 655.3, yPos =  25.0, zPos = 208.4, rot =  22, respawn = 330, drops =  328, skills = 143, spells = 0, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT},
        {name = "Marsh Funguar", groupId =  36, groupZone = 109, funcLookup = "Default", min = 21, max = 25, xPos = 582.0, yPos =  25.0, zPos = 285.0, rot =  65, respawn = 330, drops = 1633, skills = 116, spells = 0},
        {name = "Marsh Funguar", groupId =  36, groupZone = 109, funcLookup = "Default", min = 21, max = 25, xPos = 578.4, yPos =  24.3, zPos = 185.9, rot =  15, respawn = 330, drops = 1633, skills = 116, spells = 0},
        {name = "Marsh Funguar", groupId =  36, groupZone = 109, funcLookup = "Default", min = 21, max = 25, xPos = 613.8, yPos =  24.7, zPos = 249.6, rot = 127, respawn = 330, drops = 1633, skills = 116, spells = 0},
    },
    [xi.zone.BUBURIMU_PENINSULA] =
    {
        -- Camp 1, Birds/Mandragora
        {name = "Zu",        groupId =   8, groupZone = 118, funcLookup = "Default", min = 16, max = 20, xPos = 418.441, yPos =  -7.772, zPos = -237.247, rot =  127, respawn = 330, drops =  2812, skills = 55, spells = 0},
        -- Camp 2, Rabbits/Bees TODO: DROPLIST
        {name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -199.4067, yPos =  -31.9499, zPos = 205.0240, rot =  127, respawn = 330, drops =  2812, skills = 48, spells = 0},
        {name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -169.145, yPos =  -33.046, zPos = 233.089, rot =  32, respawn = 330, drops =  2812, skills = 48, spells = 0},
        {name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -181.8291, yPos =  -33.1041, zPos = 219.6246, rot =  127, respawn = 330, drops =  2812, skills = 48, spells = 0},
        {name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -177.8612, yPos =  -32.2039, zPos = 231.2208, rot =  40, respawn = 330, drops =  2812, skills = 48, spells = 0},
        {name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -189.9689, yPos =  -31.6995, zPos = 239.6820, rot =  127, respawn = 330, drops =  2812, skills = 48, spells = 0},
        {name = "Mighty Rarab",      groupId =    7, groupZone = 118, funcLookup = "Default", min = 20, max = 22, xPos = -201.269, yPos =  -31.898, zPos = 215.811, rot =  111, respawn = 330, drops =  1670, skills = 206, spells = 0},
        {name = "Mighty Rarab",      groupId =    7, groupZone = 118, funcLookup = "Default", min = 20, max = 22, xPos = -197.218, yPos =  -32.584, zPos = 193.997, rot =  24, respawn = 330, drops =  1670, skills = 206, spells = 0},
        {name = "Mighty Rarab",      groupId =    7, groupZone = 118, funcLookup = "Default", min = 20, max = 22, xPos = -190.3863, yPos =  -32.1293, zPos = 231.5365, rot =  127, respawn = 330, drops =  1670, skills = 206, spells = 0},
        {name = "Mighty Rarab",      groupId =    7, groupZone = 118, funcLookup = "Default", min = 20, max = 22, xPos = -210.1475, yPos =  -33.3674, zPos = 239.9679, rot =  127, respawn = 330, drops =  1670, skills = 206, spells = 0},
        -- Camp 3, Dhalmel/Goblins
        {name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 91.7002, yPos =  -17.1401, zPos = 149.2057, rot =  110, respawn = 330, drops =  385, skills = 80, spells = 0},
        {name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 71.5231, yPos =  -21.1037, zPos = 179.0625, rot =  60, respawn = 330, drops =  385, skills = 80, spells = 0},
        {name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 65.1330, yPos =  -17.4409, zPos = 145.7298, rot =  22, respawn = 330, drops =  385, skills = 80, spells = 0},
        {name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 127.215, yPos =  -24.067, zPos = 176.114, rot =  127, respawn = 330, drops =  385, skills = 80, spells = 0},
        {name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 121.431, yPos =  -23.798, zPos = 155.742, rot =  59, respawn = 330, drops =  385, skills = 80, spells = 0},
        {name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 136.7270, yPos = -15.2011, zPos = 119.8664, rot =  127, respawn = 330, drops =  385, skills = 80, spells = 0},
        {name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 131.127, yPos = -13.923, zPos = 104.942, rot =  95, respawn = 330, drops =  385, skills = 80, spells = 0},
        {name = "Goblin Ambusher",   groupId =   9,  groupZone = 118, funcLookup = "Default", min = 22, max = 24, xPos = 155.971, yPos = -24.811, zPos = 164.991, rot =  126, respawn = 330, drops =  1017, skills = 133, spells = 0},
        {name = "Goblin Leecher",    groupId =   18, groupZone = 118, funcLookup = "Default", min = 22, max = 24, xPos = 145.083, yPos = -23.895, zPos = 160.387, rot =  127, respawn = 330, drops =  1103, skills = 133, spells = 1},
        {name = "Goblin Tinkerer",   groupId =   10, groupZone = 118, funcLookup = "Default", min = 22, max = 24, xPos = 81.333, yPos = -16.180, zPos = 138.959, rot =  127, respawn = 330, drops =  1032, skills = 133, spells = 5},
        {name = "Goblin Gambler",    groupId =   19, groupZone = 118, funcLookup = "Default", min = 22, max = 24, xPos = 158.330, yPos = -20.332, zPos = 135.762, rot =  55, respawn = 330, drops =  1078, skills = 133, spells = 2},
    },
    [xi.zone.SAUROMUGUE_CHAMPAIGN] =
    {
        -- Camp 1, Beetles/Cockatrice
        {name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 30, max = 32, xPos = -258.104, yPos =  7.783, zPos = 67.375, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0},
        {name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 30, max = 32, xPos = -270.230, yPos =  7.692, zPos = 79.879, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0},
        {name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 30, max = 32, xPos = -265.657, yPos =  7.717, zPos = 48.222, rot =  72, respawn = 330, drops =  670, skills = 49, spells = 0},
        {name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 30, max = 32, xPos = -252.07, yPos =  7.427, zPos = 67.956, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0},
        {name = "Tabar Beak",           groupId =   20, groupZone = 120, funcLookup = "Default", min = 31, max = 33, xPos = -285.4515, yPos =  7.6353, zPos = 80.8471, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0},
        {name = "Tabar Beak",           groupId =   20, groupZone = 120, funcLookup = "Default", min = 31, max = 33, xPos = -244.0897, yPos =  8.6927, zPos = 95.1469, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0},
        {name = "Tabar Beak",           groupId =   20, groupZone = 120, funcLookup = "Default", min = 31, max = 33, xPos = -238.1371, yPos =  8.0000, zPos = 37.0856, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0},
        -- Camp 2, Coeurl/Beetle/Yagudo/Bats
        {name = "Champaign Coeurl",     groupId =   9, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 553.7828, yPos = -0.0548, zPos = -271.5814, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0},
        {name = "Champaign Coeurl",     groupId =   9, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 550.4348, yPos = 0.0706,  zPos = -218.1270, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0},
        {name = "Champaign Coeurl",     groupId =   9, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 545.0939, yPos = 0.1799,  zPos = -201.4806, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0},
        {name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 35, max = 37, xPos = 568.6832, yPos = -0.3815, zPos = -224.9137, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0},
        {name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 35, max = 37, xPos = 567.2023, yPos = -0.0632, zPos = -190.8926, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0},
        {name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 35, max = 37, xPos = 545.0492, yPos = -0.4096, zPos = -178.6207, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0},
        {name = "Midnight Wings",       groupId =   7, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 548.1401, yPos = -0.0106, zPos = -223.0685, rot =  55,  respawn = 330, drops =  1668, skills = 47, spells = 0, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT},
        {name = "Midnight Wings",       groupId =   7, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 570.9258, yPos = -0.7598, zPos = -236.1827, rot =  55,  respawn = 330, drops =  1668, skills = 47, spells = 0, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT},
        {name = "Yagudo Votary",        groupId =   10, groupZone = 120, funcLookup = "Default", min = 36, max = 38, xPos = 541.4835, yPos = -0.0323, zPos = -221.0322, rot =  43,  respawn = 330, drops =  2775, skills = 270, spells = 0},
        {name = "Yagudo Interrogator",  groupId =   17, groupZone = 120, funcLookup = "Default", min = 36, max = 38, xPos = 547.334,  yPos =  7.5221, zPos = -129.7686, rot =  127, respawn = 330, drops =  2772, skills = 270, spells = 0},
    },
    [xi.zone.VALKURM_DUNES] =
    {
        -- Additional mobs to (D-7) Lizard camp
        {name = "Hill Lizard",          groupId =   23, groupZone = 103, funcLookup = "Default", min = 15, max = 19, xPos = -522.5940, yPos =  -8.1269, zPos = 165.6588, rot =  127, respawn = 330, drops =  1316, skills = 174, spells = 0},
        {name = "Hill Lizard",          groupId =   23, groupZone = 103, funcLookup = "Default", min = 15, max = 19, xPos = -480.8232, yPos =  -7.6422, zPos = 91.3019, rot =  127, respawn = 330, drops =  1316, skills = 174, spells = 0},
        -- Additional mobs to (K-9) Lizard camp
        {name = "Hill Lizard",          groupId =   23, groupZone = 103, funcLookup = "Default", min = 15, max = 19, xPos = 698.8024, yPos =  -4.7393, zPos = -184.5671, rot =  46, respawn = 330, drops =  1316, skills = 174, spells = 0},
        -- Additional mobs to (H-9) Pugil camp
        {name = "Beach Pugil",          groupId =   28, groupZone = 103, funcLookup = "Default", min = 23, max = 26, xPos = -156.5827, yPos =  4.0, zPos = -125.7460, rot =  4, respawn = 330, drops =  248, skills = 197, spells = 0},
        -- Additional mobs to (E-9) Pugil camp
        {name = "Beach Pugil",          groupId =   28, groupZone = 103, funcLookup = "Default", min = 23, max = 26, xPos = -232.1026, yPos =  4.3, zPos = -49.2252, rot =  4, respawn = 330, drops =  248, skills = 197, spells = 0},
    },
    [xi.zone.CRAWLERS_NEST] =
    {
        {name = "Knight Crawler", groupId = 25, groupZone = 197, funcLookup = "Default", min = 60, max = 63, xPos = -300.8635, yPos = -0.3288, zPos = -257.9381, rot = 247, respawn = 300, drops = 1457, skills = 79, spells = 79},
        {name = "Nest Beetle", groupId = 12, groupZone = 197, funcLookup = "Default", min = 45, max = 47, xPos = -84.6409, yPos = -32.1607, zPos = -101.0224, rot = 242, respawn = 420, drops = 1778, skills = 49, spells = 0},
        {name = "Rumble Crawler", groupId = 31, groupZone = 197, funcLookup = "Default", min = 53, max = 55, xPos = -90.0189, yPos = -0.4290, zPos = 229.8546, rot = 164, respawn = 300, drops = 2132, skills = 79, spells = 0},
        {name = "Rumble Crawler", groupId = 31, groupZone = 197, funcLookup = "Default", min = 53, max = 55, xPos = -93.0974, yPos = -0.2868, zPos = 208.6991, rot = 214, respawn = 300, drops = 2132, skills = 79, spells = 0},
        {name = "Rumble Crawler", groupId = 31, groupZone = 197, funcLookup = "Default", min = 53, max = 55, xPos = -50.5517, yPos = -0.1758, zPos = 228.2236, rot = 192, respawn = 300, drops = 2132, skills = 79, spells = 0},
        {name = "Rumble Crawler", groupId = 31, groupZone = 197, funcLookup = "Default", min = 53, max = 55, xPos = -109.4966, yPos = -0.1555, zPos = 251.6373, rot = 147, respawn = 300, drops = 2132, skills = 79, spells = 0},
        {name = "Rumble Crawler", groupId = 31, groupZone = 197, funcLookup = "Default", min = 53, max = 55, xPos = -156.4791, yPos = -0.1161, zPos = -380.0692, rot = 248, respawn = 300, drops = 2132, skills = 79, spells = 0},
        {name = "Wespe", groupId = 32, groupZone = 197, funcLookup = "Default", min = 55, max = 57, xPos = -63.9164, yPos = -4.2926, zPos = 178.6309, rot = 227, respawn = 300, drops = 2644, skills = 48, spells = 0},
        {name = "Wespe", groupId = 32, groupZone = 197, funcLookup = "Default", min = 55, max = 57, xPos = -85.7132, yPos = -8.8872, zPos = 181.5048, rot = 133, respawn = 300, drops = 2644, skills = 48, spells = 0},
        {name = "Wespe", groupId = 32, groupZone = 197, funcLookup = "Default", min = 55, max = 57, xPos = -99.4920, yPos = -15.5355, zPos = 163.3782, rot = 175, respawn = 300, drops = 2644, skills = 48, spells = 0},
        {name = "Worker Crawler", groupId = 6, groupZone = 197, funcLookup = "Default", min = 40, max = 44, xPos = 39.7033, yPos = -24.0119, zPos = 19.9566, rot = 124, respawn = 300, drops = 2671, skills = 79, spells = 0},
        {name = "Worker Crawler", groupId = 6, groupZone = 197, funcLookup = "Default", min = 40, max = 44, xPos = 19.1197, yPos = -18.3334, zPos = 11.4731, rot = 61, respawn = 300, drops = 2671, skills = 79, spells = 0},
        {name = "Worker Crawler", groupId = 6, groupZone = 197, funcLookup = "Default", min = 40, max = 44, xPos = 18.9312, yPos = -12.0766, zPos = -17.1543, rot = 28, respawn = 300, drops = 2671, skills = 79, spells = 0},
        {name = "Worker Crawler", groupId = 6, groupZone = 197, funcLookup = "Default", min = 40, max = 44, xPos = 98.7604, yPos = -29.8945, zPos = -209.5630, rot = 204, respawn = 300, drops = 2671, skills = 79, spells = 0},
        {name = "Worker Crawler", groupId = 6, groupZone = 197, funcLookup = "Default", min = 40, max = 44, xPos = 117.0603, yPos = -24.3735, zPos = -220.1569, rot = 220, respawn = 300, drops = 2671, skills = 79, spells = 0},
        {name = "Worker Crawler", groupId = 6, groupZone = 197, funcLookup = "Default", min = 40, max = 44, xPos = 141.1288, yPos = -18.1724, zPos = -210.8655, rot = 205, respawn = 300, drops = 2671, skills = 79, spells = 0},
        {name = "Worker Crawler", groupId = 6, groupZone = 197, funcLookup = "Default", min = 40, max = 44, xPos = 118.7763, yPos = -8.0078, zPos = -179.3402, rot = 124, respawn = 300, drops = 2671, skills = 79, spells = 0},
    },
    [xi.zone.DANGRUF_WADI] =
    {
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -251.7441, yPos = -0.3418, zPos = 176.5447, rot =  31, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -266.5123, yPos = -0.1533, zPos = 138.8716, rot = 248, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -341.7011, yPos =  0.0000, zPos = 292.3916, rot = 135, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -344.0293, yPos = -0.5039, zPos = 292.6213, rot =  15, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -148.4796, yPos = -1.0388, zPos = 420.8904, rot = 243, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -138.9025, yPos = -0.2151, zPos = 435.7965, rot = 159, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -181.9129, yPos = -0.3060, zPos = 449.5430, rot = 244, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -203.4273, yPos = -0.1383, zPos = 420.8397, rot = 165, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -230.0907, yPos = -0.9247, zPos = 170.4381, rot =  70, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -213.2040, yPos =  0.0000, zPos = 218.5838, rot = 165, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -164.3672, yPos = -0.2316, zPos = 300.5522, rot =   3, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -503.6861, yPos = -0.1394, zPos = -20.4933, rot =  14, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -534.2832, yPos = -0.8649, zPos = -22.6917, rot =  57, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Giant Grub",      groupId = 17, groupZone = 191, funcLookup = "Default", min =  9, max = 12, xPos = -541.4943, yPos =  0.0937, zPos = -49.8198, rot =  21, respawn = 420, drops = 2341, skills = 258, spells = 9},
        {name = "Goblin Ambusher", groupId = 11, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -257.7170, yPos = -0.2107, zPos = 140.1544, rot =  10, respawn = 420, drops = 1020, skills = 133, spells = 0},
        {name = "Goblin Ambusher", groupId = 11, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -283.4118, yPos = -0.1134, zPos = 259.8421, rot =   6, respawn = 420, drops = 1020, skills = 133, spells = 0},
        {name = "Goblin Ambusher", groupId = 11, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -430.5650, yPos =  3.9861, zPos = 188.2420, rot =  39, respawn = 420, drops = 1020, skills = 133, spells = 0},
        {name = "Goblin Ambusher", groupId = 11, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -144.6727, yPos = -2.4227, zPos = 426.7958, rot =  93, respawn = 420, drops = 1020, skills = 133, spells = 0},
        {name = "Goblin Ambusher", groupId = 11, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -140.9331, yPos =  3.9817, zPos = 364.7604, rot = 130, respawn = 420, drops = 1020, skills = 133, spells = 0},
        {name = "Goblin Ambusher", groupId = 11, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -194.0524, yPos =  3.7546, zPos = 368.9318, rot = 237, respawn = 420, drops = 1020, skills = 133, spells = 0},
        {name = "Goblin Ambusher", groupId = 11, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -130.3730, yPos =  4.0000, zPos = 250.5787, rot = 172, respawn = 420, drops = 1020, skills = 133, spells = 0},
        {name = "Goblin Ambusher", groupId = 11, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos =  -79.4941, yPos =  4.0000, zPos = 239.8174, rot = 195, respawn = 420, drops = 1020, skills = 133, spells = 0},
        {name = "Goblin Ambusher", groupId = 11, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -132.3061, yPos =  3.5649, zPos = 183.6937, rot =  89, respawn = 420, drops = 1020, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -257.7781, yPos = -0.0213, zPos = 166.0751, rot =  77, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -328.0327, yPos = -0.1283, zPos = 302.4995, rot = 159, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -379.5341, yPos = -0.1922, zPos = 276.0545, rot = 178, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -443.6812, yPos =  4.0000, zPos = 208.2227, rot = 127, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -481.2302, yPos =  4.0000, zPos = 241.3506, rot =  23, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -180.1244, yPos = -0.3309, zPos = 446.7580, rot =  57, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -140.2033, yPos =  0.0000, zPos = 479.5759, rot = 201, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -221.7126, yPos =  0.0000, zPos = 235.6742, rot =  70, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -220.2346, yPos =  0.0000, zPos = 196.0526, rot =  89, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -180.4138, yPos =  0.0000, zPos = 278.6427, rot =  70, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos =  -77.6738, yPos =  4.0000, zPos = 281.9065, rot =  28, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -109.5567, yPos =  3.9760, zPos = 208.6208, rot =  82, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos =  -98.5023, yPos =  4.7983, zPos = 255.2525, rot = 232, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Butcher",  groupId = 13, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -461.4818, yPos =  4.0566, zPos = -91.8372, rot =  21, respawn = 420, drops = 1034, skills = 133, spells = 0},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -317.5862, yPos =  4.0000, zPos = 440.4957, rot =  14, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -275.0213, yPos =  3.8793, zPos = 390.5550, rot = 185, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -261.2849, yPos =  4.0000, zPos = 443.0829, rot =  24, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -225.9854, yPos =  3.9662, zPos = 456.3951, rot =  74, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -175.9273, yPos =  4.0000, zPos = 516.6912, rot = 100, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -236.4561, yPos =  4.0000, zPos = 520.9781, rot = 165, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -210.4329, yPos =  4.0000, zPos = 557.0667, rot = 124, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -184.9935, yPos =  3.6966, zPos = 536.2740, rot =  37, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -139.4764, yPos = -0.3111, zPos = 564.8074, rot = 195, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Gambler",  groupId = 25, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos =  -88.3465, yPos =  3.7478, zPos = 527.1840, rot = 156, respawn = 420, drops = 1081, skills = 133, spells = 2},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -444.9835, yPos =  4.0268, zPos = 340.8428, rot =   1, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -288.5925, yPos =  4.0000, zPos = 433.1854, rot = 122, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -311.3877, yPos =  4.0000, zPos = 392.5989, rot = 131, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -266.6913, yPos =  3.7308, zPos = 416.8316, rot = 197, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -235.4049, yPos =  3.4459, zPos = 429.9770, rot = 211, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -167.3087, yPos =  3.9660, zPos = 530.9715, rot = 142, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -206.7480, yPos =  4.0000, zPos = 521.5738, rot = 123, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -237.7013, yPos =  4.0000, zPos = 555.6519, rot =  75, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -189.5866, yPos =  4.0952, zPos = 572.3859, rot =  91, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos =  -81.5718, yPos =  4.0000, zPos = 497.2705, rot = 219, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Leecher",  groupId = 24, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos =  -57.8888, yPos =  0.0000, zPos = 559.5607, rot =  69, respawn = 420, drops = 1107, skills = 133, spells = 1},
        {name = "Goblin Mugger",   groupId = 23, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -419.4946, yPos =  4.0215, zPos = 353.6063, rot =  59, respawn = 420, drops = 1119, skills = 133, spells = 0},
        {name = "Goblin Mugger",   groupId = 23, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -380.2688, yPos =  4.0070, zPos = 396.3201, rot = 190, respawn = 420, drops = 1119, skills = 133, spells = 0},
        {name = "Goblin Mugger",   groupId = 23, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -295.4476, yPos =  5.0072, zPos = 414.8206, rot = 200, respawn = 420, drops = 1119, skills = 133, spells = 0},
        {name = "Goblin Mugger",   groupId = 23, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -145.7049, yPos =  3.9916, zPos = 510.6566, rot =  37, respawn = 420, drops = 1119, skills = 133, spells = 0},
        {name = "Goblin Mugger",   groupId = 23, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos = -112.3922, yPos =  1.2870, zPos = 542.4241, rot = 243, respawn = 420, drops = 1119, skills = 133, spells = 0},
        {name = "Goblin Mugger",   groupId = 23, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos =  -91.9311, yPos =  3.8455, zPos = 463.1501, rot = 101, respawn = 420, drops = 1119, skills = 133, spells = 0},
        {name = "Goblin Mugger",   groupId = 23, groupZone = 190, funcLookup = "Default", min = 21, max = 23, xPos =  -27.1674, yPos = -0.3443, zPos = 578.9722, rot = 129, respawn = 420, drops = 1119, skills = 133, spells = 0},
        {name = "Goblin Thug",     groupId =  7, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -303.5979, yPos =  4.0216, zPos = -89.7256, rot = 116, respawn = 420, drops = 1173, skills = 133, spells = 0},
        {name = "Goblin Thug",     groupId =  7, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -334.7748, yPos =  4.1870, zPos = -68.3827, rot = 247, respawn = 420, drops = 1173, skills = 133, spells = 0},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -376.4630, yPos =  3.4620, zPos = 227.5735, rot = 251, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -478.3597, yPos =  4.0000, zPos = 203.0087, rot =  55, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -461.5409, yPos =  4.0155, zPos = 245.8418, rot =  51, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -435.1257, yPos =  3.9166, zPos = 250.7814, rot = 220, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -179.8353, yPos = -0.6809, zPos = 411.1542, rot =  35, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -134.2332, yPos = -0.2832, zPos = 455.0422, rot =  77, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -157.3972, yPos = -0.1782, zPos = 461.1233, rot = 121, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -227.3065, yPos =  3.8437, zPos = 273.8121, rot =  33, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -241.1274, yPos =  4.0000, zPos = 322.7900, rot = 237, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -119.5852, yPos =  4.0000, zPos = 286.6518, rot = 216, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -101.9061, yPos =  3.8116, zPos = 232.1829, rot = 124, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -132.0125, yPos =  4.2320, zPos = 225.0775, rot = 170, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -459.8086, yPos =  3.9732, zPos = -139.296, rot =  15, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Tinkerer", groupId = 12, groupZone = 191, funcLookup = "Default", min = 12, max = 16, xPos = -460.0278, yPos =  4.0416, zPos = -59.5597, rot =  63, respawn = 420, drops = 1176, skills = 133, spells = 5},
        {name = "Goblin Weaver",   groupId =  8, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -193.9471, yPos =  3.9595, zPos =  68.2179, rot = 213, respawn = 420, drops = 1187, skills = 133, spells = 3},
        {name = "Goblin Weaver",   groupId =  8, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -308.6761, yPos =  3.9940, zPos = -74.2260, rot =   7, respawn = 420, drops = 1187, skills = 133, spells = 3},
        {name = "Hoarder Hare",    groupId =  9, groupZone = 191, funcLookup = "Default", min =  6, max =  8, xPos = -318.1211, yPos =  3.9985, zPos = -10.6903, rot =   5, respawn = 420, drops = 1320, skills = 206, spells = 0},
        {name = "Hoarder Hare",    groupId =  9, groupZone = 191, funcLookup = "Default", min =  6, max =  8, xPos = -312.0997, yPos =  4.8240, zPos =  13.9792, rot = 184, respawn = 420, drops = 1320, skills = 206, spells = 0},
        {name = "Hoarder Hare",    groupId =  9, groupZone = 191, funcLookup = "Default", min =  6, max =  8, xPos = -319.9451, yPos =  4.0000, zPos =  49.1082, rot =  17, respawn = 420, drops = 1320, skills = 206, spells = 0},
        {name = "Hoarder Hare",    groupId =  9, groupZone = 191, funcLookup = "Default", min =  6, max =  8, xPos = -279.0532, yPos =  4.0000, zPos =  47.7158, rot =  59, respawn = 420, drops = 1320, skills = 206, spells = 0},
        {name = "Hoarder Hare",    groupId =  9, groupZone = 191, funcLookup = "Default", min =  6, max =  8, xPos = -243.0633, yPos =  4.0000, zPos =  50.1196, rot = 103, respawn = 420, drops = 1320, skills = 206, spells = 0},
        {name = "Hoarder Hare",    groupId =  9, groupZone = 191, funcLookup = "Default", min =  6, max =  8, xPos = -230.6759, yPos =  3.7949, zPos =  24.9511, rot = 163, respawn = 420, drops = 1320, skills = 206, spells = 0},
        {name = "Rock Lizard",     groupId =  6, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -169.1907, yPos = -0.5538, zPos = -11.8461, rot =  31, respawn = 420, drops = 2121, skills = 174, spells = 0},
        {name = "Rock Lizard",     groupId =  6, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -149.9838, yPos = -0.0360, zPos = -219.612, rot = 156, respawn = 420, drops = 2121, skills = 174, spells = 0},
        {name = "Rock Lizard",     groupId =  6, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -178.2848, yPos = -0.2590, zPos = -220.408, rot = 139, respawn = 420, drops = 2121, skills = 174, spells = 0},
        {name = "Rock Lizard",     groupId =  6, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -210.0643, yPos = -0.0263, zPos = -221.643, rot = 255, respawn = 420, drops = 2121, skills = 174, spells = 0},
        {name = "Rock Lizard",     groupId =  6, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -296.0000, yPos =  3.0000, zPos = -81.0000, rot = 127, respawn = 420, drops = 2121, skills = 174, spells = 0},
        {name = "Rock Lizard",     groupId =  6, groupZone = 191, funcLookup = "Default", min =  5, max =  8, xPos = -339.0000, yPos =  3.0000, zPos = -82.0000, rot = 255, respawn = 420, drops = 2121, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -290.3110, yPos =  4.3880, zPos = 445.1808, rot =  89, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -272.2481, yPos =  4.3754, zPos = 453.1190, rot = 112, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -254.1700, yPos =  4.3312, zPos = 443.2400, rot = 143, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -235.0394, yPos =  4.2709, zPos = 452.4754, rot =  86, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -259.3814, yPos =  3.5007, zPos = 423.9714, rot = 131, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -324.4196, yPos =  4.3306, zPos = 386.8873, rot = 116, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -186.0557, yPos =  3.3616, zPos = 540.8997, rot =  34, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -165.1689, yPos =  3.9209, zPos = 509.4445, rot = 101, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -186.8614, yPos =  3.9683, zPos = 513.9034, rot = 154, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -204.9995, yPos =  3.9021, zPos = 544.3754, rot = 109, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -225.6646, yPos =  3.8296, zPos = 524.4005, rot = 185, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -249.6685, yPos =  3.9716, zPos = 506.5628, rot = 251, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -252.7052, yPos =  3.9834, zPos = 522.9763, rot = 186, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -230.8423, yPos =  4.0294, zPos = 567.9594, rot = 236, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos = -207.1015, yPos =  4.0000, zPos = 562.9308, rot = 136, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos =  -76.5707, yPos =  4.0000, zPos = 486.6717, rot = 207, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos =  -95.1277, yPos =  3.9143, zPos = 484.8137, rot = 240, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos =  -87.6558, yPos =  3.9065, zPos = 517.3290, rot =  62, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Steam Lizard",    groupId = 15, groupZone = 191, funcLookup = "Default", min = 16, max = 20, xPos =  -67.4972, yPos =  3.9414, zPos = 471.4357, rot = 227, respawn = 420, drops = 2327, skills = 174, spells = 0},
        {name = "Stickpin",        groupId = 39, groupZone = 191, funcLookup = "Default", min =  7, max =  9, xPos = -290.0293, yPos =  4.3914, zPos = -75.7171, rot = 192, respawn = 420, drops = 3226, skills = 172, spells = 0},
        {name = "Stickpin",        groupId = 39, groupZone = 191, funcLookup = "Default", min =  7, max =  9, xPos = -310.3895, yPos =  4.4161, zPos = -84.3723, rot = 113, respawn = 420, drops = 3226, skills = 172, spells = 0},
        {name = "Stickpin",        groupId = 39, groupZone = 191, funcLookup = "Default", min =  7, max =  9, xPos = -326.5826, yPos =  4.4291, zPos = -73.3676, rot = 141, respawn = 420, drops = 3226, skills = 172, spells = 0},
        {name = "Stickpin",        groupId = 39, groupZone = 191, funcLookup = "Default", min =  7, max =  9, xPos = -334.1552, yPos =  4.3436, zPos = -76.6557, rot = 115, respawn = 420, drops = 3226, skills = 172, spells = 0},
        {name = "Stickpin",        groupId = 39, groupZone = 191, funcLookup = "Default", min =  7, max =  9, xPos = -374.2522, yPos =  3.1304, zPos = -108.544, rot = 211, respawn = 420, drops = 3226, skills = 172, spells = 0},
        {name = "Stickpin",        groupId = 39, groupZone = 191, funcLookup = "Default", min =  7, max =  9, xPos = -352.1177, yPos =  4.3962, zPos = -67.2765, rot = 226, respawn = 420, drops = 3226, skills = 172, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -462.9802, yPos =  4.0000, zPos = 200.0885, rot =  10, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -460.0518, yPos =  4.4443, zPos = 254.3972, rot = 154, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos =  -75.1777, yPos =  4.0000, zPos = 399.7560, rot = 122, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos =  -95.3889, yPos =  3.6727, zPos = 393.5871, rot = 155, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -104.6186, yPos =  3.9898, zPos = 394.8684, rot =  50, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -116.7505, yPos =  4.0000, zPos = 406.0549, rot = 228, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -114.2583, yPos =  4.0403, zPos = 372.3043, rot =  62, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -142.3939, yPos =  3.9805, zPos = 363.9201, rot = 133, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -267.7188, yPos =  3.9530, zPos = 312.3887, rot = 217, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -283.4696, yPos =  3.8170, zPos = 328.4950, rot = 226, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -238.1182, yPos =  4.0000, zPos = 326.0342, rot = 236, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -211.8204, yPos =  3.7121, zPos = 339.1573, rot = 241, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -195.1889, yPos =  4.0474, zPos = 332.0161, rot =   0, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Hare",       groupId = 14, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -241.1548, yPos =  4.0000, zPos = 311.1816, rot =  95, respawn = 420, drops = 2598, skills = 206, spells = 0},
        {name = "Wadi Leech",      groupId = 33, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -126.3576, yPos =  4.4291, zPos = 231.4721, rot =  59, respawn = 420, drops = 2599, skills = 172, spells = 0},
        {name = "Wadi Leech",      groupId = 33, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -132.6441, yPos =  4.3929, zPos = 207.9977, rot = 238, respawn = 420, drops = 2599, skills = 172, spells = 0},
        {name = "Wadi Leech",      groupId = 33, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos =  -95.6791, yPos =  3.7640, zPos = 224.7084, rot = 117, respawn = 420, drops = 2599, skills = 172, spells = 0},
        {name = "Wadi Leech",      groupId = 33, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos =  -72.9090, yPos =  4.4291, zPos = 247.0196, rot =  54, respawn = 420, drops = 2599, skills = 172, spells = 0},
        {name = "Wadi Leech",      groupId = 33, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos =  -76.5761, yPos =  4.3309, zPos = 254.4141, rot = 187, respawn = 420, drops = 2599, skills = 172, spells = 0},
        {name = "Wadi Leech",      groupId = 33, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos =  -89.5960, yPos =  4.4291, zPos = 284.8099, rot = 116, respawn = 420, drops = 2599, skills = 172, spells = 0},
        {name = "Wadi Leech",      groupId = 33, groupZone = 191, funcLookup = "Default", min = 11, max = 14, xPos = -113.2250, yPos =  4.4005, zPos = 293.0554, rot = 216, respawn = 420, drops = 2599, skills = 172, spells = 0},
    },
    [xi.zone.GARLAIGE_CITADEL] =
    {
        {name = "Borer Beetle", groupId = 1, groupZone = 200, funcLookup = "Default", min = 41, max = 44, xPos = -339.5031, yPos = 0.0000, zPos = 219.6490, rot = 252, respawn = 420, drops = 340, skills = 49, spells = 0},
        {name = "Chamber Beetle", groupId = 26, groupZone = 200, funcLookup = "Default", min = 56, max = 58, xPos = -248.0625, yPos = 19.1444, zPos = 233.4906, rot = 161, respawn = 420, drops = 448, skills = 49, spells = 0},
        {name = "Citadel Bats", groupId = 9, groupZone = 200, funcLookup = "Default", min = 46, max = 48, xPos = -314.5587, yPos = 6.0003, zPos = 380.6967, rot = 2, respawn = 420, drops = 473, skills = 47, spells = 0},
        {name = "Citadel Bats", groupId = 9, groupZone = 200, funcLookup = "Default", min = 46, max = 48, xPos = -247.5214, yPos = 0.0000, zPos = 379.9729, rot = 125, respawn = 420, drops = 473, skills = 47, spells = 0},
        {name = "Citadel Bats", groupId = 9, groupZone = 200, funcLookup = "Default", min = 46, max = 48, xPos = -153.1899, yPos = 0.0000, zPos = 177.1968, rot = 16, respawn = 420, drops = 473, skills = 47, spells = 0},
        {name = "Citadel Bats", groupId = 9, groupZone = 200, funcLookup = "Default", min = 46, max = 48, xPos = -99.5005, yPos = 0.0000, zPos = 239.6433, rot = 66, respawn = 420, drops = 473, skills = 47, spells = 0},
        {name = "Citadel Bats", groupId = 9, groupZone = 200, funcLookup = "Default", min = 46, max = 48, xPos = -99.9375, yPos = 0.0000, zPos = 207.0739, rot = 73, respawn = 420, drops = 473, skills = 47, spells = 0},
        {name = "Citadel Bats", groupId = 9, groupZone = 200, funcLookup = "Default", min = 46, max = 48, xPos = -100.0352, yPos = 0.0000, zPos = 185.8579, rot = 49, respawn = 420, drops = 473, skills = 47, spells = 0},
        {name = "Fallen Mage", groupId = 33, groupZone = 200, funcLookup = "Default", min = 59, max = 62, xPos = -141.0672, yPos = 19.2148, zPos = 247.3506, rot = 128, respawn = 420, drops = 812, skills = 227, spells = 28},
        {name = "Funnel Bats", groupId = 36, groupZone = 200, funcLookup = "Default", min = 51, max = 55, xPos = -65.0505, yPos = 0.0000, zPos = 100.4239, rot = 128, respawn = 420, drops = 919, skills = 47, spells = 0},
        {name = "Hellmine", groupId = 28, groupZone = 200, funcLookup = "Default", min = 59, max = 62, xPos = -105.5637, yPos = 18.1473, zPos = 188.3638, rot = 165, respawn = 420, drops = 1295, skills = 56, spells = 0},
        {name = "Hellmine", groupId = 28, groupZone = 200, funcLookup = "Default", min = 59, max = 62, xPos = -112.8181, yPos = 18.1794, zPos = 252.5712, rot = 121, respawn = 420, drops = 1295, skills = 56, spells = 0},
        {name = "Hellmine", groupId = 28, groupZone = 200, funcLookup = "Default", min = 59, max = 62, xPos = -172.2958, yPos = 18.2863, zPos = 251.5594, rot = 26, respawn = 420, drops = 1295, skills = 56, spells = 0},
        {name = "Hellmine", groupId = 28, groupZone = 200, funcLookup = "Default", min = 59, max = 62, xPos = -170.4128, yPos = 18.1969, zPos = 186.3965, rot = 208, respawn = 420, drops = 1295, skills = 56, spells = 0},
        {name = "Magic Jug", groupId = 38, groupZone = 200, funcLookup = "Default", min = 62, max = 64, xPos = -213.0023, yPos = 18.2650, zPos = 332.4632, rot = 32, respawn = 420, drops = 1566, skills = 175, spells = 36},
        {name = "Magic Jug", groupId = 38, groupZone = 200, funcLookup = "Default", min = 62, max = 64, xPos = -179.9270, yPos = 18.3462, zPos = 298.2362, rot = 149, respawn = 420, drops = 1566, skills = 175, spells = 36},
        {name = "Siege Bat", groupId = 2, groupZone = 200, funcLookup = "Default", min = 40, max = 43, xPos = -326.0408, yPos = 0.0000, zPos = 219.6302, rot = 251, respawn = 420, drops = 2246, skills = 46, spells = 0},
        {name = "Siege Bat", groupId = 2, groupZone = 200, funcLookup = "Default", min = 40, max = 43, xPos = -340.3157, yPos = 0.0000, zPos = 233.4547, rot = 188, respawn = 420, drops = 2246, skills = 46, spells = 0},
        {name = "Vault Weapon", groupId = 31, groupZone = 200, funcLookup = "Default", min = 59, max = 62, xPos = 123.8533, yPos = 0.0000, zPos = 44.3784, rot = 231, respawn = 420, drops = 2566, skills = 110, spells = 42},
        {name = "Vault Weapon", groupId = 31, groupZone = 200, funcLookup = "Default", min = 59, max = 62, xPos = 144.0276, yPos = 0.0000, zPos = 74.9054, rot = 46, respawn = 420, drops = 2566, skills = 110, spells = 42},
        {name = "Vault Weapon", groupId = 31, groupZone = 200, funcLookup = "Default", min = 59, max = 62, xPos = -283.2180, yPos = 18.2180, zPos = 176.2764, rot = 251, respawn = 420, drops = 2566, skills = 110, spells = 42},
        {name = "Vault Weapon", groupId = 31, groupZone = 200, funcLookup = "Default", min = 59, max = 62, xPos = -333.5753, yPos = 18.0021, zPos = 183.0812, rot = 20, respawn = 420, drops = 2566, skills = 110, spells = 42},
    },
    [xi.zone.RANGUEMONT_PASS] =
    {
        {name = "Blade Bat",         groupId =  2, groupZone = 166, funcLookup = "Default", min =  4, max =  7, xPos = -178.090, yPos =   4.5508, zPos = -217.4759, rot =  11, respawn = 420, drops =   82, skills =  46, spells = 0 },
        {name = "Floating Eye",      groupId = 20, groupZone = 166, funcLookup = "Default", min = 34, max = 36, xPos =   50.902, yPos = -25.1071, zPos =  100.1880, rot = 116, respawn = 420, drops =  850, skills =   4, spells = 11},
        {name = "Floating Eye",      groupId = 20, groupZone = 166, funcLookup = "Default", min = 34, max = 36, xPos =   25.034, yPos = -26.5000, zPos =  100.0259, rot = 128, respawn = 420, drops =  850, skills =   4, spells = 11},
        {name = "Floating Eye",      groupId = 20, groupZone = 166, funcLookup = "Default", min = 34, max = 36, xPos =   -0.681, yPos = -24.6928, zPos =  100.0646, rot = 103, respawn = 420, drops =  850, skills =   4, spells = 11},
        {name = "Goblin Pathfinder", groupId =  7, groupZone =   7, funcLookup = "Default", min = 32, max = 36, xPos = -189.872, yPos = -36.0884, zPos =   71.2274, rot = 146, respawn = 420, drops = 1131, skills = 133, spells = 0 },
        {name = "Goblin Pathfinder", groupId =  7, groupZone =   7, funcLookup = "Default", min = 32, max = 36, xPos = -207.056, yPos = -36.0000, zPos =  126.5034, rot =  37, respawn = 420, drops = 1131, skills = 133, spells = 0 },
        {name = "Goblin Shaman",     groupId =  4, groupZone =   7, funcLookup = "Default", min = 32, max = 36, xPos =  -90.919, yPos = -16.1200, zPos =   28.8158, rot =  90, respawn = 420, drops = 1152, skills = 133, spells = 2 },
        {name = "Goblin Smithy",     groupId =  3, groupZone =   7, funcLookup = "Default", min = 32, max = 36, xPos = -189.625, yPos = -36.0000, zPos =  129.9729, rot =  88, respawn = 420, drops = 1163, skills = 133, spells = 0 },
        {name = "Goblin Smithy",     groupId =  3, groupZone =   7, funcLookup = "Default", min = 32, max = 36, xPos = -190.871, yPos = -34.9760, zPos =   87.5155, rot =  64, respawn = 420, drops = 1163, skills = 133, spells = 0 },
        {name = "Seeker Bats",       groupId =  9, groupZone = 166, funcLookup = "Default", min = 25, max = 28, xPos =   82.750, yPos =  13.5245, zPos =  -99.4871, rot = 116, respawn = 420, drops =   80, skills =  47, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =   78.000, yPos =  -26.708, zPos =    98.000, rot = 127, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =   55.132, yPos =  -30.253, zPos =   131.912, rot =  24, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =   49.000, yPos =  -25.000, zPos =   100.000, rot =  22, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =   35.000, yPos =  -24.000, zPos =   100.000, rot =  91, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =   31.569, yPos =  -36.485, zPos =   140.948, rot = 138, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  -17.490, yPos =  -26.342, zPos =    82.798, rot =  64, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  -18.000, yPos =  -26.382, zPos =    65.000, rot = 127, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  -26.224, yPos =  -20.459, zPos =    22.437, rot = 127, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  -59.324, yPos =  -46.319, zPos =   198.840, rot =  26, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  -63.020, yPos =  -50.237, zPos =   211.641, rot = 121, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -114.298, yPos =  -16.622, zPos =    24.229, rot = 127, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -136.449, yPos =  -22.125, zPos =    30.259, rot = 127, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -164.884, yPos =  -36.507, zPos =    61.805, rot = 127, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -191.000, yPos =  -34.000, zPos =    90.000, rot = 127, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -197.000, yPos =  -35.000, zPos =   108.000, rot = 127, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -199.782, yPos =  -36.425, zPos =   113.459, rot = 127, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  157.651, yPos = -45.7629, zPos =  181.9794, rot = 104, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  143.369, yPos = -39.2482, zPos =  168.2592, rot =  68, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  136.180, yPos = -36.6074, zPos =  156.6764, rot =  63, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  129.584, yPos = -36.0709, zPos =  141.3494, rot = 119, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  110.368, yPos = -32.4872, zPos =  139.9702, rot =  64, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -187.381, yPos = -33.1827, zPos =  105.7554, rot = 105, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -214.093, yPos = -33.1337, zPos =   93.8043, rot = 234, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -242.723, yPos = -36.4683, zPos =  140.5897, rot =  10, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -260.423, yPos = -46.0000, zPos =  160.0520, rot =  56, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -144.698, yPos = -40.9809, zPos =  147.7559, rot = 117, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -137.004, yPos = -50.7793, zPos =  176.8040, rot = 195, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos = -138.330, yPos = -56.0000, zPos =  205.9147, rot =  54, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  -37.744, yPos = -36.0229, zPos =  180.6175, rot =  12, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  167.390, yPos =  24.0000, zPos = -207.3254, rot = 140, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  133.417, yPos =  26.8805, zPos = -187.0784, rot =  38, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  156.302, yPos =   5.3130, zPos =  -58.8074, rot = 140, respawn = 420, drops =  401, skills =  46, spells = 0 },
        {name = "Stirge",            groupId = 12, groupZone = 166, funcLookup = "Default", min = 30, max = 33, xPos =  122.156, yPos =   4.7073, zPos =  -55.2682, rot =  89, respawn = 420, drops =  401, skills =  46, spells = 0 },
    },
    [xi.zone.ZERUHN_MINES] =
    {
        {name = "Ding Bats",   groupId =  1, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos =  38.792, yPos = 8.1721, zPos = -220.569, rot =   0, respawn = 420, drops =  654, skills =  47, spells = 0},
        {name = "Ding Bats",   groupId =  1, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos =  -5.368, yPos = 8.1324, zPos = -299.112, rot = 139, respawn = 420, drops =  654, skills =  47, spells = 0},
        {name = "Ding Bats",   groupId =  1, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = -20.624, yPos = 8.0131, zPos = -272.676, rot =  58, respawn = 420, drops =  654, skills =  47, spells = 0},
        {name = "Ding Bats",   groupId =  1, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = -59.130, yPos = 8.2780, zPos = -317.422, rot = 180, respawn = 420, drops =  654, skills =  47, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos =  99.488, yPos =  7.749, zPos = -168.985, rot = 174, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos =  98.418, yPos =  7.869, zPos = -169.307, rot = 210, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos =  58.903, yPos =  8.121, zPos = -196.394, rot =  64, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos =  58.894, yPos =  8.137, zPos = -201.703, rot =  64, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos =   3.736, yPos =  8.860, zPos = -117.854, rot = 115, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos =   3.402, yPos =  8.536, zPos = -170.195, rot = 239, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos = -17.037, yPos = 10.850, zPos = -138.677, rot = 158, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos = -32.904, yPos =  8.017, zPos = -259.529, rot = 132, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos = -47.071, yPos =  7.870, zPos = -261.065, rot = 115, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Mouse Bat",   groupId = 14, groupZone = 100, funcLookup = "Default", min = 2, max = 4, xPos = -51.786, yPos =  8.100, zPos = -173.512, rot = 170, respawn = 420, drops = 1747, skills =  46, spells = 0},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = -90.922, yPos =  7.898, zPos = -221.289, rot = 100, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = -71.841, yPos =  7.754, zPos = -257.261, rot =  82, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = -67.751, yPos =  7.967, zPos = -261.296, rot =  61, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = -59.465, yPos =  8.068, zPos = -280.254, rot = 174, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = -43.026, yPos =  9.200, zPos = -153.055, rot =  94, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = -28.407, yPos = 10.325, zPos = -140.034, rot = 242, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos =   8.383, yPos =  8.651, zPos = -129.757, rot =  30, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos =  55.034, yPos =  8.322, zPos = -262.828, rot = 233, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos =  57.656, yPos =  7.917, zPos = -253.272, rot = 222, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos =  60.925, yPos =  8.655, zPos = -139.187, rot = 117, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos =  61.506, yPos =  8.378, zPos = -137.323, rot =  92, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = 135.744, yPos =  8.048, zPos = -194.101, rot =  67, respawn = 420, drops = 2501, skills = 258, spells = 9},
        {name = "Tunnel Worm",  groupId = 2, groupZone = 172, funcLookup = "Default", min = 1, max = 3, xPos = 136.140, yPos =  8.285, zPos = -188.395, rot =  68, respawn = 420, drops = 2501, skills = 258, spells = 9},
    },
}

local spawnerFunctions =
{
    ["Default"] =
    {
        onSpawn = function(mob)
            local index = mob:getZone():getLocalVar(string.format("[SPAWNER]Index_", mob:getID()))
            local table = spawnerMobs[mob:getZone():getID()][index]

            if table.min ~= nil and table.max ~= nil then
                mob:setMobLevel(math.random(table.min, table.max))
            end

            if table.drops ~= nil then
                mob:setDropID(table.drops)
            end

            if table.skills ~= nil then
                mob:setMobMod(xi.mobMod.SKILL_LIST, table.skills)
            end

            if table.spells ~= nil then
                mob:setSpellList(table.spells)
            end
        end,
        onEngaged           = function(mob, target) end,
        onFight             = function(mob, target) end,
        onDisengage         = function(mob, target) end,
        onWeaponskilPrepare = function(mob, target, skill) end,
        onWeaponskill       = function(mob, target, skill) end,
        onMagicPrepare      = function(mob, target, spell) end,
        onRoam              = function(mob) end,
        onDeath             = function(mob, playerArg, isKiller) end,
        onDespawn           = function(mob) end,
        mixins = {},
    }
}

-----------------------------------------------------------
--                    Spawner Code                       --
-----------------------------------------------------------

xi.horizon.spawnInitialMobs = function(zone)
    if spawnerMobs[zone:getID()] ~= nil then
        for index, list in pairs(spawnerMobs[zone:getID()]) do
            xi.horizon.spawnMob(zone, index)
        end
    end
end

xi.horizon.spawnMob = function(zone, index)
    local table = spawnerMobs[zone:getID()][index]
    if table.enabled ~= false then
        if table.releaseId == nil then
            table.releaseId = false
        end

        if table.spawnAnimation == nil then
            table.spawnAnimation = false
        end

        local functionTable = spawnerFunctions[table.funcLookup]
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = table.name,
            x = table.xPos,
            y = table.yPos,
            z = table.zPos,
            rotation = table.rot,
            groupId = table.groupId,
            groupZoneId = table.groupZone,
            onMobSpawn = functionTable.onSpawn,
            onMobEngaged = functionTable.onEngaged,
            onMobFight = functionTable.onFight,
            onMobDisengage = functionTable.onDisengage,
            onMobWeaponSkillPrepare = functionTable.onWeaponskilPrepare,
            onMobWeaponskill = functionTable.onWeaponskill,
            onMobMagicPrepare = functionTable.onMagicPrepare,
            onMobRoam = functionTable.onRoam,
            onMobDeath = functionTable.onDeath,
            onMobDespawn = functionTable.onDespawn,
            releaseIdOnDeath = table.releaseId,
            specialSpawnAnimation = table.spawnAnimation,
            mixins = functionTable.mixins,
        })

        mob:setSpawn(table.xPos, table.yPos, table.zPos, table.rot)
        zone:setLocalVar(string.format("[SPAWNER]Index_", mob:getID()), index)
        mob:spawn()

        if table.respawn ~= nil then
            mob:setRespawnTime(table.respawn)
        end

        if table.spawnType ~= nil then
            mob:setSpawnType(table.spawnType)
            DespawnMob(mob:getID())
        end
    end
end
