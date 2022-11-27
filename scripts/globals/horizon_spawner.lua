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
        -- { name = "something", groupId = 1, groupZone = 1, funcLookup = "Default", min = 1, max = 2, xPos = 1.123, yPos = 1.123, zPos = 1.123, rot = 0, respawn = 30, drops = 123, skills = 234, spells = 345, enabled = true, spawnType = xi.spawnType.spawnType },
    --  }
    [xi.zone.BUBURIMU_PENINSULA] =
    {
        -- Camp 1, Birds/Mandragora
        { name = "Zu",        groupId =   8, groupZone = 118, funcLookup = "Default", min = 16, max = 20, xPos = 418.441, yPos =  -7.772, zPos = -237.247, rot =  127, respawn = 330, drops =  2812, skills = 55, spells = 0 },
        -- Camp 2, Rabbits/Bees TODO: DROPLIST
        { name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -199.4067, yPos =  -31.9499, zPos = 205.0240, rot =  127, respawn = 330, drops =  2812, skills = 48, spells = 0 },
        { name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -169.145, yPos =  -33.046, zPos = 233.089, rot =  32, respawn = 330, drops =  2812, skills = 48, spells = 0 },
        { name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -181.8291, yPos =  -33.1041, zPos = 219.6246, rot =  127, respawn = 330, drops =  2812, skills = 48, spells = 0 },
        { name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -177.8612, yPos =  -32.2039, zPos = 231.2208, rot =  40, respawn = 330, drops =  2812, skills = 48, spells = 0 },
        { name = "Cactus Bee",        groupId =   27, groupZone = 109, funcLookup = "Default", min = 20, max = 22, xPos = -189.9689, yPos =  -31.6995, zPos = 239.6820, rot =  127, respawn = 330, drops =  2812, skills = 48, spells = 0 },
        { name = "Mighty Rarab",      groupId =    7, groupZone = 118, funcLookup = "Default", min = 20, max = 22, xPos = -201.269, yPos =  -31.898, zPos = 215.811, rot =  111, respawn = 330, drops =  1670, skills = 206, spells = 0 },
        { name = "Mighty Rarab",      groupId =    7, groupZone = 118, funcLookup = "Default", min = 20, max = 22, xPos = -197.218, yPos =  -32.584, zPos = 193.997, rot =  24, respawn = 330, drops =  1670, skills = 206, spells = 0 },
        { name = "Mighty Rarab",      groupId =    7, groupZone = 118, funcLookup = "Default", min = 20, max = 22, xPos = -190.3863, yPos =  -32.1293, zPos = 231.5365, rot =  127, respawn = 330, drops =  1670, skills = 206, spells = 0 },
        { name = "Mighty Rarab",      groupId =    7, groupZone = 118, funcLookup = "Default", min = 20, max = 22, xPos = -210.1475, yPos =  -33.3674, zPos = 239.9679, rot =  127, respawn = 330, drops =  1670, skills = 206, spells = 0 },
        -- Camp 3, Dhalmel/Goblins
        { name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 91.7002, yPos =  -17.1401, zPos = 149.2057, rot =  110, respawn = 330, drops =  385, skills = 80, spells = 0 },
        { name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 71.5231, yPos =  -21.1037, zPos = 179.0625, rot =  60, respawn = 330, drops =  385, skills = 80, spells = 0 },
        { name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 65.1330, yPos =  -17.4409, zPos = 145.7298, rot =  22, respawn = 330, drops =  385, skills = 80, spells = 0 },
        { name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 127.215, yPos =  -24.067, zPos = 176.114, rot =  127, respawn = 330, drops =  385, skills = 80, spells = 0 },
        { name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 121.431, yPos =  -23.798, zPos = 155.742, rot =  59, respawn = 330, drops =  385, skills = 80, spells = 0 },
        { name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 136.7270, yPos = -15.2011, zPos = 119.8664, rot =  127, respawn = 330, drops =  385, skills = 80, spells = 0 },
        { name = "Bull Dhalmel",      groupId =   16, groupZone = 118, funcLookup = "Default", min = 24, max = 26, xPos = 131.127, yPos = -13.923, zPos = 104.942, rot =  95, respawn = 330, drops =  385, skills = 80, spells = 0 },
        { name = "Goblin Ambusher",   groupId =   9,  groupZone = 118, funcLookup = "Default", min = 22, max = 24, xPos = 155.971, yPos = -24.811, zPos = 164.991, rot =  126, respawn = 330, drops =  1017, skills = 133, spells = 0 },
        { name = "Goblin Leecher",    groupId =   18, groupZone = 118, funcLookup = "Default", min = 22, max = 24, xPos = 145.083, yPos = -23.895, zPos = 160.387, rot =  127, respawn = 330, drops =  1103, skills = 133, spells = 1 },
        { name = "Goblin Tinkerer",   groupId =   10, groupZone = 118, funcLookup = "Default", min = 22, max = 24, xPos = 81.333, yPos = -16.180, zPos = 138.959, rot =  127, respawn = 330, drops =  1032, skills = 133, spells = 5 },
        { name = "Goblin Gambler",    groupId =   19, groupZone = 118, funcLookup = "Default", min = 22, max = 24, xPos = 158.330, yPos = -20.332, zPos = 135.762, rot =  55, respawn = 330, drops =  1078, skills = 133, spells = 2 },
    },
    [xi.zone.CARPENTERS_LANDING] =
    {
        { name = "Flytrap", groupId = 13, groupZone = 2, funcLookup = "Default", min = 20, max = 22, xPos = -352.82, yPos = -5.4, zPos = 586.91, rot =  55, respawn = 330, drops = 852, skills = 114, spells = 0 },
        { name = "Flytrap", groupId = 13, groupZone = 2, funcLookup = "Default", min = 20, max = 22, xPos = -356.67, yPos = -5.6, zPos = 557.31, rot =  55, respawn = 330, drops = 852, skills = 114, spells = 0 },
    },
    [xi.zone.EASTERN_ALTEPA_DESERT] =
    {
        -- Additional mobs for I-6 Camp
        { name = "Sand Beetle", groupId = 8, groupZone = 114, funcLookup = "Default", min = 36, max = 40, xPos = 233.67, yPos = -8.2, zPos = 405.79, rot =  55, respawn = 330 },
        -- Additional mobs for J-8 Camp
        { name = "Desert Dhalmel", groupId = 7, groupZone = 114, funcLookup = "Default", min = 39, max = 44, xPos = 479.02, yPos = -8.00, zPos = 78.88, rot =  55, respawn = 330 },
        { name = "Desert Dhalmel", groupId = 7, groupZone = 114, funcLookup = "Default", min = 39, max = 44, xPos = 364.77, yPos = -7.67, zPos = 52.48, rot =  55, respawn = 330 },
        { name = "Desert Dhalmel", groupId = 7, groupZone = 114, funcLookup = "Default", min = 39, max = 44, xPos = 357.91, yPos = 0.00, zPos = -3.32, rot =  55, respawn = 330 },
        -- Additional goblins added to outpost camp
        { name = "Goblin Digger", groupId =   31, groupZone = 125, funcLookup = "Default", min = 51, max = 54, xPos = -291.79, yPos = 7.76, zPos = -188.57, rot =  127, respawn = 330 },
        { name = "Goblin Digger", groupId =   31, groupZone = 125, funcLookup = "Default", min = 51, max = 54, xPos = -269.93, yPos = 6.50, zPos = -296.84, rot =  127, respawn = 330 },
    },
    [xi.zone.GARLAIGE_CITADEL] =
    {
        -- Additional mobs to entrance camp
        { name = "Borer Beetle", groupId = 1, groupZone = 200, funcLookup = "Default", min = 41, max = 44, xPos = -352.5, yPos = 0, zPos = 299.14, rot =  55, respawn = 420 },
        { name = "Borer Beetle", groupId = 1, groupZone = 200, funcLookup = "Default", min = 41, max = 44, xPos = -290.9, yPos = 0, zPos = 299.25, rot =  55, respawn = 420 },
        -- Additional basement camp
        { name = "Funnel Bats", groupId = 36, groupZone = 200, funcLookup = "Default", min = 51, max = 55, xPos = -243.64, yPos = 18.67, zPos = 226.60, rot =  55, respawn = 420 },
        { name = "Funnel Bats", groupId = 36, groupZone = 200, funcLookup = "Default", min = 51, max = 55, xPos = -224.55, yPos = 18.29, zPos = 237.71, rot =  55, respawn = 420 },
        { name = "Funnel Bats", groupId = 36, groupZone = 200, funcLookup = "Default", min = 51, max = 55, xPos = -171.84, yPos = 19.00, zPos = 238.49, rot =  55, respawn = 420 },
        { name = "Funnel Bats", groupId = 36, groupZone = 200, funcLookup = "Default", min = 51, max = 55, xPos = -165.92, yPos = 19.00, zPos = 198.74, rot =  55, respawn = 420 },
        { name = "Funnel Bats", groupId = 36, groupZone = 200, funcLookup = "Default", min = 51, max = 55, xPos = -145.93, yPos = 14.38, zPos = 213.07, rot =  55, respawn = 420 },
        { name = "Funnel Bats", groupId = 36, groupZone = 200, funcLookup = "Default", min = 51, max = 55, xPos = -141.85, yPos = 13.59, zPos = 227.34, rot =  55, respawn = 420 },
        { name = "Funnel Bats", groupId = 36, groupZone = 200, funcLookup = "Default", min = 51, max = 55, xPos = -168.56, yPos = 19.12, zPos = 222.48, rot =  55, respawn = 420 },
        { name = "Chamber Beetle", groupId = 26, groupZone = 200, funcLookup = "Default", min = 56, max = 58, xPos = -161.80, yPos = 19.62, zPos = 223.00, rot =  55, respawn = 420 },
        { name = "Chamber Beetle", groupId = 26, groupZone = 200, funcLookup = "Default", min = 56, max = 58, xPos = -141.70, yPos = 18.59, zPos = 249.25, rot =  55, respawn = 420 },
        { name = "Chamber Beetle", groupId = 26, groupZone = 200, funcLookup = "Default", min = 56, max = 58, xPos = -149.16, yPos = 19.26, zPos = 192.86, rot =  55, respawn = 420 },
    },
    [xi.zone.JUGNER_FOREST] =
    {
        { name = "Jugner Funguar", groupId = 12, groupZone = 104, funcLookup = "Default", min = 22, max = 25, xPos = 493.98, yPos = 0.6, zPos = -160.7, rot =  55, respawn = 330, drops = 1419, skills = 116, spells = 0 },
        { name = "Land Pugil", groupId = 33, groupZone = 104, funcLookup = "Default", min = 17, max = 20, xPos = 243.64, yPos = -16.22, zPos = -556.42, rot =  55, respawn = 330 },
    },
    [xi.zone.KONSCHTAT_HIGHLANDS] =
    {
        -- Level 10-12 exp camp
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 202.69, yPos = 25.92, zPos = 494.16, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 224.08, yPos = 22.66, zPos = 487.91, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 213.36, yPos = 22.95, zPos = 470.18, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 237.35, yPos = 30.81, zPos = 509.44, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 232.56, yPos = 32.15, zPos = 535.62, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 212.49, yPos = 32.46, zPos = 527.21, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 244.85, yPos = 31.59, zPos = 573.51, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 238.80, yPos = 31.60, zPos = 599.30, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 255.08, yPos = 31.85, zPos = 604.66, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 243.62, yPos = 36.58, zPos = 623.59, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 256.22, yPos = 36.52, zPos = 639.09, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 279.30, yPos = 32.07, zPos = 634.44, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 215.97, yPos = 30.03, zPos = 508.35, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 208.43, yPos = 32.48, zPos = 532.49, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 234.60, yPos = 32.16, zPos = 528.79, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 280.05, yPos = 32.91, zPos = 618.83, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 253.69, yPos = 36.69, zPos = 622.09, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 247.32, yPos = 32.16, zPos = 599.93, rot =  51, respawn = 330 },
        -- Level 10-12 near Dunes entrance
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = -235.97, yPos =  72.00, zPos = 839.03, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = -278.34, yPos =  65.30, zPos = 810.30, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = -235.24, yPos =  71.93, zPos = 766.87, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = -244.84, yPos =  72.43, zPos = 779.50, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = -259.92, yPos =  66.60, zPos = 765.27, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = -265.83, yPos =  65.79, zPos = 786.88, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = -275.22, yPos =  67.87, zPos = 819.20, rot =  51, respawn = 330 },
        { name = "Yellow Jacket", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = -236.86, yPos =  72.27, zPos = 824.61, rot =  51, respawn = 330 },
        { name = "Goblin Weaver", groupId =   6, groupZone = 108, funcLookup = "Default", min = 17, max = 20, xPos = -255.92, yPos =  70.73, zPos = 826.00, rot =  51, respawn = 330 },
        { name = "Goblin Digger", groupId =  31, groupZone = 108, funcLookup = "Default", min = 17, max = 20, xPos = -268.81, yPos =  65.03, zPos = 778.83, rot =  51, respawn = 330 },
    },
    [xi.zone.LA_THEINE_PLATEAU] =
    {
        -- Manaburn Camp 1, Worms
        { name = "Eikon Worm", groupId =   8, groupZone = 107, funcLookup = "Manaburn_Low", min = 19, max = 23, xPos = -189.53, yPos =  7.09, zPos = 267.21, rot =  51, respawn = 330 },
        { name = "Eikon Worm", groupId =   8, groupZone = 107, funcLookup = "Manaburn_Low", min = 19, max = 23, xPos = -170.55, yPos =  7.35, zPos = 264.01, rot =  51, respawn = 330 },
        { name = "Eikon Worm", groupId =   8, groupZone = 107, funcLookup = "Manaburn_Low", min = 19, max = 23, xPos = -160.24, yPos =  8.00, zPos = 277.61, rot =  51, respawn = 330 },
        { name = "Eikon Worm", groupId =   8, groupZone = 107, funcLookup = "Manaburn_Low", min = 19, max = 23, xPos = -150.67, yPos =  5.78, zPos = 233.19, rot =  51, respawn = 330 },
        { name = "Eikon Worm", groupId =   8, groupZone = 107, funcLookup = "Manaburn_Low", min = 19, max = 23, xPos = -177.37, yPos =  4.78, zPos = 223.24, rot =  51, respawn = 330 },
        { name = "Eikon Worm", groupId =   8, groupZone = 107, funcLookup = "Manaburn_Low", min = 19, max = 23, xPos = -199.03, yPos =  8.00, zPos = 237.35, rot =  51, respawn = 330 },
        { name = "Eikon Worm", groupId =   8, groupZone = 107, funcLookup = "Manaburn_Low", min = 19, max = 23, xPos = -189.93, yPos =  8.30, zPos = 281.38, rot =  51, respawn = 330 },
        -- Level 10-12 exp camp
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 394.74, yPos = 23.60, zPos = -553.12, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 391.18, yPos = 22.77, zPos = -580.62, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 394.50, yPos = 23.37, zPos = -597.86, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 410.76, yPos = 20.93, zPos = -594.29, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 422.44, yPos = 19.89, zPos = -576.13, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 437.72, yPos = 23.01, zPos = -566.49, rot =  51, respawn = 330 },
        { name = "Snapper", groupId =  34, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 406.74, yPos = 24.47, zPos = -555.79, rot =  51, respawn = 330 },
        { name = "Snapper", groupId =  34, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 429.67, yPos = 25.66, zPos = -552.66, rot =  51, respawn = 330 },
        { name = "Snapper", groupId =  34, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 424.86, yPos = 24.75, zPos = -528.09, rot =  51, respawn = 330 },
        { name = "Snapper", groupId =  34, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 404.45, yPos = 25.38, zPos = -538.87, rot =  51, respawn = 330 },
        -- Level 10-12 camp near dunes entrance
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 41.40, yPos =  24.03, zPos = -553.48, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 44.24, yPos =  31.05, zPos = -587.56, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 72.39, yPos =  31.53, zPos = -617.63, rot =  51, respawn = 330 },
        { name = "Mineral Eater", groupId =   3, groupZone = 108, funcLookup = "Default", min = 15, max = 19, xPos = 114.45, yPos = 31.81, zPos = -610.88, rot =  51, respawn = 330 },
        { name = "Plateau Hare",  groupId =   6, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 129.00, yPos = 30.87, zPos = -591.27, rot =  51, respawn = 330 },
        { name = "Plateau Hare",  groupId =   6, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 100.25, yPos = 31.96, zPos = -554.71, rot =  51, respawn = 330 },
        { name = "Plateau Hare",  groupId =   6, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 58.34, yPos =  27.33, zPos = -562.29, rot =  51, respawn = 330 },
        { name = "Plateau Hare",  groupId =   6, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 51.15, yPos =  32.36, zPos = -601.93, rot =  51, respawn = 330 },
        { name = "Orcish Fodder",  groupId =  9, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 80.32, yPos =  32.30, zPos = -611.61, rot =  51, respawn = 330 },
        { name = "Orcish Grunt", groupId =  23, groupZone = 102, funcLookup = "Default", min = 17, max = 20, xPos = 59.41, yPos =  26.92, zPos = -553.60, rot =  51, respawn = 330 },
    },
    [xi.zone.MERIPHATAUD_MOUNTAINS] =
    {
        -- 18-23 Camp
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -257.16, yPos =  14.96, zPos = 547.39, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -221.58, yPos =  11.50, zPos = 558.06, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -228.24, yPos =  13.78, zPos = 582.35, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -280.26, yPos =  16.35, zPos = 548.97, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -268.29, yPos =  16.33, zPos = 597.37, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -313.05, yPos =  16.15, zPos = 520.43, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = -200.98, yPos =  8.00, zPos = 562.44, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = -250.01, yPos =  16.60, zPos = 597.17, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = -285.81, yPos =  16.09, zPos = 523.19, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = -264.81, yPos =  15.35, zPos = 573.93, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -432.38, yPos =  24.18, zPos = 557.43, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -473.77, yPos =  16.00, zPos = 502.48, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -454.38, yPos =  20.93, zPos = 578.50, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -477.14, yPos =  15.83, zPos = 564.63, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -448.60, yPos =  15.98, zPos = 479.59, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = -466.04, yPos =  15.50, zPos = 543.56, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = -488.49, yPos =  15.98, zPos = 526.70, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = -454.44, yPos =  22.28, zPos = 525.50, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = -471.64, yPos =  16.16, zPos = 480.74, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = -451.40, yPos =  19.08, zPos = 502.00, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = 74.35, yPos =  -8.39, zPos = 554.11, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = 183.24, yPos =  -7.16, zPos = 560.92, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = 91.29, yPos =  -8.10, zPos = 544.13, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = 101.77, yPos =  -7.09, zPos = 556.21, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = 158.98, yPos =  -7.92, zPos = 565.69, rot =  51, respawn = 330 },
        { name = "Migrant Hawker", groupId =  33, groupZone = 119, funcLookup = "Default", min = 24, max = 26, xPos = 101.89, yPos =  -7.94, zPos = 571.00, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = 126.26, yPos =  -7.96, zPos = 565.35, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = 145.98, yPos =  -8.70, zPos = 580.52, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = 123.42, yPos =  -7.37, zPos = 590.44, rot =  51, respawn = 330 },
        { name = "Dust Lizard", groupId =   3, groupZone = 119, funcLookup = "Default", min = 26, max = 28, xPos = 146.10, yPos =  -7.41, zPos = 601.50, rot =  51, respawn = 330 },
        -- 23-27 Camp
        { name = "Puma", groupId =  35, groupZone = 119, funcLookup = "Default", min = 29, max = 31, xPos = -516.49, yPos =  1.47, zPos = -268.04, rot =  51, respawn = 330 },
        { name = "Puma", groupId =  35, groupZone = 119, funcLookup = "Default", min = 29, max = 31, xPos = -491.53, yPos =  -7.83, zPos = -358.01, rot =  51, respawn = 330 },
        { name = "Puma", groupId =  35, groupZone = 119, funcLookup = "Default", min = 29, max = 31, xPos = -485.66, yPos =  8.08, zPos = -241.39, rot =  51, respawn = 330 },
        { name = "Puma", groupId =  35, groupZone = 119, funcLookup = "Default", min = 29, max = 31, xPos = -481.09, yPos =  1.79, zPos = -268.00, rot =  51, respawn = 330 },
        { name = "Puma", groupId =  35, groupZone = 119, funcLookup = "Default", min = 29, max = 31, xPos = -476.30, yPos =  -7.78, zPos = -391.58, rot =  51, respawn = 330 },
        { name = "Puma", groupId =  35, groupZone = 119, funcLookup = "Default", min = 29, max = 31, xPos = -465.05, yPos =  0.62, zPos = -279.75, rot =  51, respawn = 330 },
        { name = "Puma", groupId =  35, groupZone = 119, funcLookup = "Default", min = 29, max = 31, xPos = -448.94, yPos =  0.09, zPos = -277.82, rot =  51, respawn = 330 },
        { name = "Puma", groupId =  35, groupZone = 119, funcLookup = "Default", min = 29, max = 31, xPos = -478.47, yPos =  0.32, zPos = -309.56, rot =  51, respawn = 330 },
        { name = "Drooling Hound", groupId =  7, groupZone = 119, funcLookup = "Default", min = 31, max = 33, xPos = -481.46, yPos =  -3.46, zPos = -336.68, rot =  51, respawn = 330, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT },
        { name = "Drooling Hound", groupId =  7, groupZone = 119, funcLookup = "Default", min = 31, max = 33, xPos = -510.32, yPos =  8.29, zPos = -244.14, rot =  51, respawn = 330, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT },
    },
    [xi.zone.PASHHOW_MARSHLANDS] =
    {
        -- Camp 1, Flies/Dogs/Funguar
        { name = "Gadfly",        groupId =   6, groupZone = 109, funcLookup = "Default", min = 18, max = 21, xPos = 592.0, yPos =  25.0, zPos = 183.8, rot =  51, respawn = 330, drops =  923, skills = 113, spells = 0 },
        { name = "Gadfly",        groupId =   6, groupZone = 109, funcLookup = "Default", min = 18, max = 21, xPos = 634.8, yPos =  25.0, zPos = 208.1, rot =  51, respawn = 330, drops =  923, skills = 113, spells = 0 },
        { name = "Gadfly",        groupId =   6, groupZone = 109, funcLookup = "Default", min = 18, max = 21, xPos = 547.7, yPos =  24.6, zPos = 215.0, rot =  51, respawn = 330, drops =  923, skills = 113, spells = 0 },
        { name = "Gadfly",        groupId =   6, groupZone = 109, funcLookup = "Default", min = 18, max = 21, xPos = 621.1, yPos =  25.3, zPos = 230.8, rot =  51, respawn = 330, drops =  923, skills = 113, spells = 0 },
        { name = "Bog Dog",       groupId =  10, groupZone = 109, funcLookup = "Default", min = 18, max = 25, xPos = 634.1, yPos =  25.0, zPos = 185.4, rot =   7, respawn = 330, drops =  328, skills = 143, spells = 0, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT },
        { name = "Bog Dog",       groupId =  10, groupZone = 109, funcLookup = "Default", min = 18, max = 25, xPos = 655.3, yPos =  25.0, zPos = 208.4, rot =  22, respawn = 330, drops =  328, skills = 143, spells = 0, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT },
        { name = "Marsh Funguar", groupId =  36, groupZone = 109, funcLookup = "Default", min = 21, max = 25, xPos = 582.0, yPos =  25.0, zPos = 285.0, rot =  65, respawn = 330, drops = 1633, skills = 116, spells = 0 },
        { name = "Marsh Funguar", groupId =  36, groupZone = 109, funcLookup = "Default", min = 21, max = 25, xPos = 578.4, yPos =  24.3, zPos = 185.9, rot =  15, respawn = 330, drops = 1633, skills = 116, spells = 0 },
        { name = "Marsh Funguar", groupId =  36, groupZone = 109, funcLookup = "Default", min = 21, max = 25, xPos = 613.8, yPos =  24.7, zPos = 249.6, rot = 127, respawn = 330, drops = 1633, skills = 116, spells = 0 },
    },
    [xi.zone.PROMYVION_DEM] =
    {
        { name = "Wanderer", groupId = 1, groupZone = 18, funcLookup = "Default", min = 22, max = 24, xPos = 123.6830, yPos = 0.0000, zPos = -145.1416, rot = 54, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 18, funcLookup = "Default", min = 22, max = 24, xPos = 229.4485, yPos = 0.0000, zPos = -192.2512, rot = 25, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 18, funcLookup = "Default", min = 22, max = 24, xPos = 240.0715, yPos = -0.0220, zPos = -202.9063, rot = 239, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 18, funcLookup = "Default", min = 22, max = 24, xPos = 246.8561, yPos = 0.0000, zPos = -197.6888, rot = 229, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 18, funcLookup = "Default", min = 22, max = 24, xPos = 220.5242, yPos = 0.0000, zPos = -203.8187, rot = 88, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 18, funcLookup = "Default", min = 22, max = 24, xPos = 214.1336, yPos = 0.0000, zPos = -213.5485, rot = 94, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 18, funcLookup = "Default", min = 22, max = 24, xPos = 166.7611, yPos = 0.0000, zPos = -264.7926, rot = 126, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 18, funcLookup = "Default", min = 22, max = 24, xPos = 202.4139, yPos = 0.0000, zPos = -208.2369, rot = 222, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Weeper", groupId = 3, groupZone = 18, funcLookup = "Default", min = 24, max = 26, xPos = 205.2731, yPos = 0.0000, zPos = -199.2508, rot = 53, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 3, groupZone = 18, funcLookup = "Default", min = 24, max = 26, xPos = 233.2974, yPos = 0.0000, zPos = -201.1388, rot = 50, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 3, groupZone = 18, funcLookup = "Default", min = 24, max = 26, xPos = 237.0932, yPos = -0.0220, zPos = -201.6114, rot = 220, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 3, groupZone = 18, funcLookup = "Default", min = 24, max = 26, xPos = 147.9096, yPos = -0.0059, zPos = -275.0204, rot = 246, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -149.3577, yPos = 0.0000, zPos = 55.5899, rot = 52, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -155.9356, yPos = 0.0000, zPos = 43.1049, rot = 83, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -161.0702, yPos = 0.0000, zPos = 17.4387, rot = 197, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -205.9046, yPos = 0.0000, zPos = 87.7235, rot = 192, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -234.7187, yPos = 0.0000, zPos = 83.5966, rot = 95, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -245.3659, yPos = 0.0000, zPos = -47.0537, rot = 88, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -239.4392, yPos = -0.0862, zPos = -39.0142, rot = 217, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -274.5405, yPos = 0.0000, zPos = -80.9613, rot = 56, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -278.8589, yPos = 0.0000, zPos = -119.0648, rot = 54, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -280.4303, yPos = 0.0000, zPos = -130.9996, rot = 65, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -223.7596, yPos = 0.0000, zPos = -83.6825, rot = 167, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -227.3978, yPos = -0.2058, zPos = -72.0594, rot = 167, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -197.2272, yPos = 0.0000, zPos = -112.0765, rot = 25, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -160.4676, yPos = 0.0000, zPos = -107.2794, rot = 244, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 8, groupZone = 18, funcLookup = "Default", min = 26, max = 28, xPos = -130.4879, yPos = -0.0321, zPos = -65.8530, rot = 234, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Weeper", groupId = 7, groupZone = 18, funcLookup = "Default", min = 28, max = 30, xPos = -230.1805, yPos = 0.0000, zPos = 41.9039, rot = 185, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 7, groupZone = 18, funcLookup = "Default", min = 28, max = 30, xPos = -331.4749, yPos = 0.0000, zPos = 66.7192, rot = 111, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 7, groupZone = 18, funcLookup = "Default", min = 28, max = 30, xPos = -280.0117, yPos = 0.0000, zPos = -108.0744, rot = 73, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 7, groupZone = 18, funcLookup = "Default", min = 28, max = 30, xPos = -132.8533, yPos = 0.0000, zPos = -71.3400, rot = 1, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Seether", groupId = 9, groupZone = 18, funcLookup = "Default", min = 30, max = 32, xPos = -143.4011, yPos = -0.0310, zPos = 30.9479, rot = 209, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -25.6732, yPos = 0.0174, zPos = -329.2157, rot = 243, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -94.1066, yPos = 0.0000, zPos = -361.6518, rot = 190, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -106.6943, yPos = 0.0000, zPos = -313.2834, rot = 53, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -69.1074, yPos = 0.0000, zPos = -246.5605, rot = 71, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -40.9117, yPos = -0.0219, zPos = -239.5447, rot = 229, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -38.2722, yPos = 0.0000, zPos = -235.6121, rot = 224, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = 15.7746, yPos = 0.0000, zPos = -207.0066, rot = 200, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = 8.1945, yPos = 0.0000, zPos = -285.8515, rot = 165, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 18, funcLookup = "Default", min = 29, max = 31, xPos = -119.1092, yPos = 0.0000, zPos = -315.4438, rot = 189, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -212.7883, yPos = 0.0000, zPos = 383.0081, rot = 211, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Gorger", groupId = 15, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = -145.2211, yPos = 0.0000, zPos = 231.9888, rot = 121, respawn = 960, drops = 1207, skills = 137, spells = 5 },
        { name = "Gorger", groupId = 15, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = -150.2687, yPos = 0.0000, zPos = 190.6352, rot = 32, respawn = 960, drops = 1207, skills = 137, spells = 5 },
        { name = "Gorger", groupId = 15, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = -112.6683, yPos = 0.0000, zPos = 253.2081, rot = 223, respawn = 960, drops = 1207, skills = 137, spells = 5 },
        { name = "Seether", groupId = 14, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = -54.0617, yPos = 0.0000, zPos = 283.0210, rot = 220, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = -63.6199, yPos = 0.0000, zPos = 212.9416, rot = 116, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -63.6199, yPos = 0.0000, zPos = 212.9416, rot = 116, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 18, funcLookup = "Default", min = 29, max = 31, xPos = -47.6344, yPos = 0.0000, zPos = 165.6688, rot = 211, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -43.7210, yPos = 0.0000, zPos = 164.4325, rot = 12, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -43.7210, yPos = 0.0000, zPos = 164.4325, rot = 12, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = -32.3335, yPos = 0.0000, zPos = 163.9841, rot = 192, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -240.8025, yPos = 0.0000, zPos = 170.1377, rot = 65, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -244.6711, yPos = 0.0342, zPos = 170.4005, rot = 135, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 18, funcLookup = "Default", min = 29, max = 31, xPos = -247.2508, yPos = 0.1572, zPos = 167.0331, rot = 117, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = -277.9205, yPos = 0.0000, zPos = 157.8100, rot = 2, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = -57.3407, yPos = 0.0000, zPos = 285.6104, rot = 103, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 233.9348, yPos = 0.0000, zPos = 370.0797, rot = 62, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Gorger", groupId = 20, groupZone = 18, funcLookup = "Default", min = 37, max = 39, xPos = 165.8300, yPos = 0.0890, zPos = 272.7158, rot = 90, respawn = 960, drops = 1207, skills = 137, spells = 5 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 156.2321, yPos = 0.0000, zPos = 273.2146, rot = 33, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 135.2609, yPos = 0.0000, zPos = 221.3921, rot = 65, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 105.8827, yPos = 0.0000, zPos = 177.5993, rot = 158, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 135.5816, yPos = 0.0000, zPos = 165.3098, rot = 195, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 74.5047, yPos = 0.0000, zPos = 93.1188, rot = 18, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 77.9387, yPos = 0.0000, zPos = 97.5811, rot = 7, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 333.2168, yPos = 0.0000, zPos = 221.4591, rot = 117, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 287.4535, yPos = 0.0000, zPos = 199.0761, rot = 130, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Gorger", groupId = 20, groupZone = 18, funcLookup = "Default", min = 37, max = 39, xPos = 273.1469, yPos = 0.0000, zPos = 211.4061, rot = 111, respawn = 960, drops = 1207, skills = 137, spells = 5 },
        { name = "Gorger", groupId = 20, groupZone = 18, funcLookup = "Default", min = 37, max = 39, xPos = 254.3081, yPos = 0.0000, zPos = 224.2803, rot = 162, respawn = 960, drops = 1207, skills = 137, spells = 5 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 236.7041, yPos = 0.0000, zPos = 223.2167, rot = 112, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 237.0397, yPos = 0.0000, zPos = 209.5542, rot = 45, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 252.9077, yPos = 0.0000, zPos = 204.2056, rot = 66, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 237.3105, yPos = 0.0000, zPos = 289.9818, rot = 48, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 230.7857, yPos = 0.0000, zPos = 279.3124, rot = 76, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 238.0219, yPos = 0.0000, zPos = 262.6893, rot = 72, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 185.8532, yPos = 0.0000, zPos = 287.3867, rot = 175, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 316.4250, yPos = 0.0000, zPos = -65.5970, rot = 180, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 289.4455, yPos = 0.0000, zPos = -36.9234, rot = 153, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 281.5621, yPos = 0.0000, zPos = -35.7078, rot = 157, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 287.3992, yPos = 0.0000, zPos = -31.0283, rot = 245, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 311.5130, yPos = 0.0000, zPos = -5.0857, rot = 228, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 315.2974, yPos = 0.0000, zPos = 4.2468, rot = 215, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 318.7227, yPos = 0.0000, zPos = -4.1815, rot = 192, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = 318.7227, yPos = 0.0000, zPos = -4.1815, rot = 192, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 249.0382, yPos = 0.0000, zPos = 2.5912, rot = 140, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 242.8902, yPos = 0.0000, zPos = 6.7812, rot = 152, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 252.0257, yPos = 0.0000, zPos = 10.6348, rot = 246, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 237.8482, yPos = 0.0000, zPos = -2.0027, rot = 102, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 18, funcLookup = "Default", min = 35, max = 37, xPos = 239.3510, yPos = 0.0000, zPos = 42.5074, rot = 171, respawn = 960, drops = 2193, skills = 220, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 246.1906, yPos = 0.0000, zPos = 46.0129, rot = 226, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 18, funcLookup = "Default", min = 33, max = 35, xPos = 234.0564, yPos = 0.0000, zPos = 54.3887, rot = 161, respawn = 960, drops = 2635, skills = 256, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = 96.9813, yPos = 0.0000, zPos = 147.5743, rot = 132, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = 89.2392, yPos = 0.0000, zPos = 129.5868, rot = 115, respawn = 960, drops = 2613, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 18, funcLookup = "Default", min = 31, max = 33, xPos = 125.5846, yPos = 0.0000, zPos = 169.8895, rot = 212, respawn = 960, drops = 2613, skills = 255, spells = 0 },
    },
    [xi.zone.PROMYVION_MEA] =
    {
        { name = "Craver", groupId = 15, groupZone = 20, funcLookup = "Default", min = 35, max = 36, xPos = -203.5410, yPos = 0.0000, zPos = -39.0650, rot = 22, respawn = 960, drops = 526, skills = 78, spells = 0 },
        { name = "Craver", groupId = 15, groupZone = 20, funcLookup = "Default", min = 35, max = 36, xPos = 217.0681, yPos = 0.0000, zPos = -145.4061, rot = 191, respawn = 960, drops = 526, skills = 78, spells = 0 },
        { name = "Craver", groupId = 15, groupZone = 20, funcLookup = "Default", min = 35, max = 36, xPos = 235.3785, yPos = 0.0000, zPos = -147.7691, rot = 245, respawn = 960, drops = 526, skills = 78, spells = 0 },
        { name = "Craver", groupId = 15, groupZone = 20, funcLookup = "Default", min = 35, max = 36, xPos = 240.0935, yPos = 0.0000, zPos = -286.5584, rot = 135, respawn = 960, drops = 526, skills = 78, spells = 0 },
        { name = "Craver", groupId = 20, groupZone = 20, funcLookup = "Default", min = 36, max = 40, xPos = -3.6978, yPos = 0.0000, zPos = 306.5417, rot = 201, respawn = 960, drops = 526, skills = 78, spells = 0 },
        { name = "Craver", groupId = 20, groupZone = 20, funcLookup = "Default", min = 36, max = 40, xPos = 122.8674, yPos = 0.0000, zPos = 199.8091, rot = 240, respawn = 960, drops = 526, skills = 78, spells = 0 },
        { name = "Craver", groupId = 20, groupZone = 20, funcLookup = "Default", min = 36, max = 40, xPos = 141.3692, yPos = 0.0000, zPos = 213.1151, rot = 148, respawn = 960, drops = 526, skills = 78, spells = 0 },
        { name = "Craver", groupId = 20, groupZone = 20, funcLookup = "Default", min = 36, max = 40, xPos = 70.4368, yPos = 0.0000, zPos = 196.7684, rot = 128, respawn = 960, drops = 526, skills = 78, spells = 0 },
        { name = "Craver", groupId = 20, groupZone = 20, funcLookup = "Default", min = 36, max = 40, xPos = 62.1845, yPos = 0.0000, zPos = 222.6078, rot = 142, respawn = 960, drops = 526, skills = 78, spells = 0 },
        { name = "Seether", groupId = 9, groupZone = 20, funcLookup = "Default", min = 30, max = 32, xPos = -169.5153, yPos = 0.0000, zPos = -117.1931, rot = 131, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 9, groupZone = 20, funcLookup = "Default", min = 30, max = 32, xPos = -87.4735, yPos = 0.0000, zPos = -84.3405, rot = 110, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 9, groupZone = 20, funcLookup = "Default", min = 30, max = 32, xPos = 36.1872, yPos = 0.0000, zPos = -256.8729, rot = 169, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -111.7188, yPos = 0.0000, zPos = 114.7840, rot = 127, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -126.3720, yPos = 0.0000, zPos = 37.8120, rot = 50, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -197.3828, yPos = 0.0000, zPos = -36.3338, rot = 200, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -207.4920, yPos = 0.0000, zPos = 51.3723, rot = 70, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -77.3124, yPos = 0.0000, zPos = 36.9087, rot = 162, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = 168.2727, yPos = 0.0000, zPos = -119.4076, rot = 176, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = 239.1028, yPos = -0.0068, zPos = -170.6810, rot = 51, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = 280.0018, yPos = 0.0000, zPos = -225.5586, rot = 177, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 20, funcLookup = "Default", min = 35, max = 37, xPos = -18.9179, yPos = 0.0000, zPos = 202.6069, rot = 95, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 20, funcLookup = "Default", min = 35, max = 37, xPos = -31.8478, yPos = 0.0000, zPos = 205.4525, rot = 2, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 20, funcLookup = "Default", min = 35, max = 37, xPos = -32.5111, yPos = 0.0000, zPos = 219.8162, rot = 49, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 20, funcLookup = "Default", min = 35, max = 37, xPos = -36.4154, yPos = 0.0000, zPos = 284.1773, rot = 5, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Seether", groupId = 17, groupZone = 20, funcLookup = "Default", min = 35, max = 37, xPos = 0.5970, yPos = 0.0000, zPos = 166.7889, rot = 45, respawn = 960, drops = 2194, skills = 220, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 20, funcLookup = "Default", min = 22, max = 28, xPos = -131.1899, yPos = 0.0000, zPos = 239.4201, rot = 145, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 20, funcLookup = "Default", min = 22, max = 28, xPos = -159.1729, yPos = 0.0000, zPos = 313.2660, rot = 4, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 20, funcLookup = "Default", min = 22, max = 28, xPos = -165.8170, yPos = 0.0000, zPos = 314.6737, rot = 10, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 20, funcLookup = "Default", min = 22, max = 28, xPos = -181.9990, yPos = -0.1634, zPos = 294.1690, rot = 237, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 20, funcLookup = "Default", min = 22, max = 28, xPos = -198.7418, yPos = -0.0019, zPos = 302.0071, rot = 151, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 20, funcLookup = "Default", min = 26, max = 28, xPos = -182.1928, yPos = -0.7445, zPos = -297.0256, rot = 252, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 20, funcLookup = "Default", min = 26, max = 28, xPos = -198.6454, yPos = -0.0035, zPos = -298.6935, rot = 31, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 20, funcLookup = "Default", min = 26, max = 28, xPos = -295.3730, yPos = -0.0765, zPos = -296.8262, rot = 207, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 20, funcLookup = "Default", min = 26, max = 28, xPos = -93.8584, yPos = -0.0845, zPos = -279.0803, rot = 37, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 20, funcLookup = "Default", min = 26, max = 28, xPos = 37.5488, yPos = 0.0000, zPos = -259.6561, rot = 161, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 20, funcLookup = "Default", min = 26, max = 28, xPos = 45.8727, yPos = 0.0000, zPos = -308.1916, rot = 197, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = -103.9216, yPos = 0.0000, zPos = 38.0581, rot = 253, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = -210.3597, yPos = 0.0000, zPos = 51.0716, rot = 249, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = -225.2492, yPos = 0.0000, zPos = 37.3199, rot = 100, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = -85.3336, yPos = 0.0000, zPos = 105.5285, rot = 44, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 122.5767, yPos = 0.0000, zPos = -144.5324, rot = 185, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 156.5073, yPos = 0.0000, zPos = -242.8773, rot = 172, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 204.5806, yPos = -0.0203, zPos = -170.2471, rot = 156, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 213.6263, yPos = -0.3243, zPos = -167.0036, rot = 1, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 221.0450, yPos = 0.0000, zPos = -45.4594, rot = 217, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 222.4258, yPos = 0.0000, zPos = -67.5480, rot = 225, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 234.1506, yPos = 0.0000, zPos = -118.0206, rot = 60, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 285.2816, yPos = 0.0000, zPos = -140.7099, rot = 253, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 322.0376, yPos = 0.0000, zPos = -112.6092, rot = 103, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 20, funcLookup = "Default", min = 29, max = 31, xPos = 339.7586, yPos = 0.0000, zPos = -85.9699, rot = 114, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 42.9205, yPos = -0.1065, zPos = 212.9443, rot = 50, respawn = 960, drops = 2614, skills = 255, spells = 0 },
        { name = "Weeper", groupId = 2, groupZone = 20, funcLookup = "Default", min = 25, max = 30, xPos = -153.1628, yPos = 0.0000, zPos = 318.7098, rot = 245, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 2, groupZone = 20, funcLookup = "Default", min = 25, max = 30, xPos = -159.2192, yPos = 0.0000, zPos = 324.5349, rot = 245, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 2, groupZone = 20, funcLookup = "Default", min = 25, max = 30, xPos = -162.8628, yPos = 0.0000, zPos = 314.9915, rot = 80, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 2, groupZone = 20, funcLookup = "Default", min = 25, max = 30, xPos = -185.0661, yPos = -0.0595, zPos = 289.3329, rot = 208, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = -11.1580, yPos = 0.0000, zPos = -291.5265, rot = 228, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = -175.2620, yPos = -0.4042, zPos = -184.9712, rot = 28, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = -187.2605, yPos = -0.6816, zPos = -184.5325, rot = 97, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = -280.7523, yPos = 0.0000, zPos = -302.3850, rot = 254, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = -80.5627, yPos = 0.0000, zPos = -149.1426, rot = 204, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = -81.9632, yPos = -0.1124, zPos = -270.7890, rot = 221, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = -90.1465, yPos = 0.0000, zPos = -164.3555, rot = 124, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = -97.3030, yPos = 0.0000, zPos = -255.2221, rot = 175, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = 0.6194, yPos = 0.0000, zPos = -155.5024, rot = 165, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = 36.1870, yPos = 0.0000, zPos = -355.2983, rot = 83, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = 39.2471, yPos = 0.0000, zPos = -342.3100, rot = 189, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 20, funcLookup = "Default", min = 28, max = 30, xPos = 43.3614, yPos = -0.0042, zPos = -356.2021, rot = 255, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -140.1423, yPos = 0.0000, zPos = 44.0236, rot = 241, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -203.0889, yPos = 0.0000, zPos = -40.3071, rot = 120, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -237.4477, yPos = 0.0000, zPos = 114.8612, rot = 74, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -266.4978, yPos = 0.0000, zPos = 16.4710, rot = 166, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -267.8246, yPos = 0.0000, zPos = 53.2841, rot = 33, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -267.8791, yPos = 0.0000, zPos = 83.9794, rot = 150, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -57.2627, yPos = 0.0000, zPos = 45.8245, rot = 6, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -74.3729, yPos = 0.0000, zPos = 44.3116, rot = 201, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -77.3064, yPos = 0.0000, zPos = 106.6070, rot = 36, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = -91.6701, yPos = 0.0000, zPos = 110.6555, rot = 178, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 159.1805, yPos = 0.0000, zPos = -50.3084, rot = 158, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 161.0767, yPos = 0.0000, zPos = -123.0629, rot = 70, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 169.2239, yPos = 0.0000, zPos = -64.9674, rot = 167, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 180.6789, yPos = 0.0000, zPos = -82.0789, rot = 180, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 189.3946, yPos = 0.0000, zPos = -101.5107, rot = 163, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 195.8040, yPos = 0.0000, zPos = -285.1410, rot = 117, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 215.3007, yPos = -0.4146, zPos = -181.5176, rot = 116, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 226.9680, yPos = -0.6384, zPos = -181.5468, rot = 102, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 231.0258, yPos = 0.0000, zPos = -92.0839, rot = 174, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 232.8524, yPos = -0.5075, zPos = -173.7235, rot = 13, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 267.2762, yPos = -0.3234, zPos = -138.7713, rot = 118, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 276.4438, yPos = 0.0000, zPos = -215.6132, rot = 114, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 277.8939, yPos = 0.0000, zPos = -73.7111, rot = 188, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 280.2947, yPos = 0.0000, zPos = -130.5722, rot = 158, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 283.3987, yPos = 0.0000, zPos = -213.1815, rot = 236, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 288.8450, yPos = 0.0000, zPos = -94.1469, rot = 45, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 346.9273, yPos = 0.0000, zPos = -91.4017, rot = 233, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 20, funcLookup = "Default", min = 31, max = 33, xPos = 352.2067, yPos = 0.0000, zPos = -146.0272, rot = 139, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -18.0180, yPos = 0.0000, zPos = 285.5039, rot = 227, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -24.6936, yPos = 0.0000, zPos = 224.9715, rot = 174, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -30.9136, yPos = -0.0262, zPos = 215.8014, rot = 56, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -34.9840, yPos = 0.0000, zPos = 230.2681, rot = 115, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -36.6354, yPos = 0.0000, zPos = 280.1519, rot = 236, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -42.1278, yPos = 0.0000, zPos = 207.6436, rot = 128, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -46.4774, yPos = 0.0000, zPos = 287.3968, rot = 117, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -6.4001, yPos = 0.0000, zPos = 167.2185, rot = 50, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -70.8896, yPos = 0.0000, zPos = 312.3822, rot = 34, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = -81.7127, yPos = 0.0000, zPos = 313.2483, rot = 133, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = 42.0427, yPos = 0.0000, zPos = 274.3219, rot = 150, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = 42.5801, yPos = 0.0000, zPos = 260.4901, rot = 176, respawn = 960, drops = 2636, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 18, groupZone = 20, funcLookup = "Default", min = 33, max = 35, xPos = 5.0018, yPos = 0.0000, zPos = 176.6592, rot = 249, respawn = 960, drops = 2636, skills = 256, spells = 0 },
    },
    [xi.zone.PROMYVION_HOLLA] =
    {
        { name = "Seether", groupId = 10, groupZone = 16, funcLookup = "Default", min = 30, max = 32, xPos = -124.7374, yPos = 0.0000, zPos = -147.4496, rot = 208, respawn = 960, drops = 2192, skills = 220, spells = 0 },
        { name = "Seether", groupId = 10, groupZone = 16, funcLookup = "Default", min = 30, max = 32, xPos = -196.0177, yPos = 0.0000, zPos = -114.4656, rot = 54, respawn = 960, drops = 2192, skills = 220, spells = 0 },
        { name = "Seether", groupId = 10, groupZone = 16, funcLookup = "Default", min = 30, max = 32, xPos = -214.3801, yPos = 0.0000, zPos = -76.2203, rot = 253, respawn = 960, drops = 2192, skills = 220, spells = 0 },
        { name = "Seether", groupId = 14, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 181.5853, yPos = 0.0000, zPos = 297.2704, rot = 170, respawn = 960, drops = 2192, skills = 220, spells = 0 },
        { name = "Seether", groupId = 18, groupZone = 16, funcLookup = "Default", min = 35, max = 37, xPos = -10.2774, yPos = 0.0000, zPos = -195.5139, rot = 234, respawn = 960, drops = 2192, skills = 220, spells = 0 },
        { name = "Seether", groupId = 18, groupZone = 16, funcLookup = "Default", min = 35, max = 37, xPos = 202.2960, yPos = 0.0000, zPos = -187.9723, rot = 64, respawn = 960, drops = 2192, skills = 220, spells = 0 },
        { name = "Seether", groupId = 18, groupZone = 16, funcLookup = "Default", min = 35, max = 37, xPos = 240.1526, yPos = 0.0000, zPos = -108.7290, rot = 197, respawn = 960, drops = 2192, skills = 220, spells = 0 },
        { name = "Thinker", groupId = 15, groupZone = 16, funcLookup = "Default", min = 35, max = 37, xPos = 197.0874, yPos = 0.0000, zPos = 238.8428, rot = 131, respawn = 960, drops = 2398, skills = 241, spells = 0 },
        { name = "Thinker", groupId = 20, groupZone = 16, funcLookup = "Default", min = 37, max = 39, xPos = 196.2191, yPos = 0.0000, zPos = -175.0567, rot = 193, respawn = 960, drops = 2398, skills = 241, spells = 0 },
        { name = "Thinker", groupId = 20, groupZone = 16, funcLookup = "Default", min = 37, max = 39, xPos = 89.9877, yPos = 0.0000, zPos = -40.4659, rot = 89, respawn = 960, drops = 2398, skills = 241, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 16, funcLookup = "Default", min = 22, max = 24, xPos = 13.6133, yPos = 0.0000, zPos = 153.0929, rot = 251, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 16, funcLookup = "Default", min = 22, max = 24, xPos = 18.9119, yPos = 0.0000, zPos = 161.2852, rot = 156, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 16, funcLookup = "Default", min = 22, max = 24, xPos = 24.6718, yPos = 0.0000, zPos = 144.3696, rot = 20, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 16, funcLookup = "Default", min = 22, max = 24, xPos = 29.4749, yPos = -0.0284, zPos = 154.4490, rot = 171, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 1, groupZone = 16, funcLookup = "Default", min = 22, max = 24, xPos = 31.6055, yPos = -0.1234, zPos = 146.0929, rot = 252, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 16, funcLookup = "Default", min = 26, max = 28, xPos = -141.6830, yPos = 0.0000, zPos = 10.5648, rot = 0, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 16, funcLookup = "Default", min = 26, max = 28, xPos = -146.0844, yPos = 0.0000, zPos = -74.5259, rot = 221, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 16, funcLookup = "Default", min = 26, max = 28, xPos = -156.6763, yPos = 0.0000, zPos = -84.1726, rot = 135, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 16, funcLookup = "Default", min = 26, max = 28, xPos = -166.1567, yPos = 0.0000, zPos = -84.8609, rot = 124, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 16, funcLookup = "Default", min = 26, max = 28, xPos = -178.1464, yPos = 0.0000, zPos = -74.5356, rot = 93, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 16, funcLookup = "Default", min = 26, max = 28, xPos = -195.3456, yPos = 0.0000, zPos = -125.5277, rot = 169, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 16, funcLookup = "Default", min = 26, max = 28, xPos = -46.9701, yPos = 0.0000, zPos = -48.1017, rot = 101, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 16, funcLookup = "Default", min = 26, max = 28, xPos = -54.2072, yPos = 0.0000, zPos = -34.6597, rot = 152, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 7, groupZone = 16, funcLookup = "Default", min = 26, max = 28, xPos = -63.0726, yPos = 0.0000, zPos = -42.6213, rot = 104, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 16, funcLookup = "Default", min = 29, max = 31, xPos = -229.0617, yPos = 0.0000, zPos = 147.6563, rot = 176, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 12, groupZone = 16, funcLookup = "Default", min = 29, max = 31, xPos = -236.3468, yPos = 0.0000, zPos = 160.1084, rot = 163, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 16, funcLookup = "Default", min = 32, max = 33, xPos = 119.1912, yPos = 0.0000, zPos = -223.8422, rot = 192, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 16, funcLookup = "Default", min = 32, max = 33, xPos = 167.1472, yPos = 0.0000, zPos = -62.7108, rot = 208, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 16, funcLookup = "Default", min = 32, max = 33, xPos = 237.5862, yPos = 0.0000, zPos = -66.7176, rot = 157, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 16, funcLookup = "Default", min = 32, max = 33, xPos = 246.8674, yPos = -0.1266, zPos = -78.9295, rot = 227, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 16, funcLookup = "Default", min = 32, max = 33, xPos = 44.7252, yPos = -0.0171, zPos = -205.8898, rot = 205, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 16, funcLookup = "Default", min = 32, max = 33, xPos = 5.6246, yPos = 0.0000, zPos = -197.4253, rot = 172, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 16, funcLookup = "Default", min = 32, max = 33, xPos = 82.4575, yPos = 0.0000, zPos = -67.9565, rot = 191, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 19, groupZone = 16, funcLookup = "Default", min = 32, max = 33, xPos = 96.2521, yPos = 0.0000, zPos = -31.6320, rot = 207, respawn = 960, drops = 2612, skills = 255, spells = 0 },
        { name = "Weeper", groupId = 2, groupZone = 16, funcLookup = "Default", min = 24, max = 26, xPos = 25.1202, yPos = 0.0000, zPos = 156.5509, rot = 39, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 2, groupZone = 16, funcLookup = "Default", min = 24, max = 26, xPos = 32.7660, yPos = -0.1404, zPos = 143.4634, rot = 58, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -137.1986, yPos = 0.0000, zPos = -23.0001, rot = 246, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -152.4897, yPos = 0.0000, zPos = -11.6160, rot = 126, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -159.7139, yPos = 0.0000, zPos = 11.3103, rot = 134, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -174.2570, yPos = 0.0000, zPos = -12.5664, rot = 124, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -189.8713, yPos = 0.0000, zPos = -120.1961, rot = 213, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -207.8615, yPos = 0.0000, zPos = -75.6778, rot = 195, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -218.4607, yPos = 0.0000, zPos = -76.6403, rot = 141, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -51.7899, yPos = 0.0000, zPos = -35.5826, rot = 13, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -85.6527, yPos = 0.0000, zPos = -73.7001, rot = 153, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 8, groupZone = 16, funcLookup = "Default", min = 28, max = 30, xPos = -95.4448, yPos = 0.0000, zPos = -42.5660, rot = 52, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = -218.7256, yPos = 0.0000, zPos = 124.3018, rot = 143, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = -322.2249, yPos = 0.0000, zPos = 226.3937, rot = 212, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = -341.0750, yPos = 0.0000, zPos = 193.2102, rot = 188, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = -379.8234, yPos = 0.0000, zPos = 200.7532, rot = 241, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = -392.6702, yPos = 0.0000, zPos = 160.9548, rot = 148, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = 121.5937, yPos = 0.0000, zPos = 288.3381, rot = 135, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = 203.5749, yPos = 0.0000, zPos = 259.6523, rot = 248, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = 226.0103, yPos = 0.0000, zPos = 237.8641, rot = 253, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = 236.7791, yPos = 0.0000, zPos = 228.9178, rot = 20, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 16, funcLookup = "Default", min = 31, max = 33, xPos = 72.4205, yPos = 0.0000, zPos = 276.2931, rot = 138, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = -25.8055, yPos = -0.1235, zPos = -202.5337, rot = 105, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 116.7053, yPos = 0.0000, zPos = -232.5491, rot = 185, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 15.2550, yPos = 0.0000, zPos = -142.3208, rot = 204, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 200.6621, yPos = -0.0600, zPos = -151.6800, rot = 124, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 207.1405, yPos = 0.0000, zPos = -179.9718, rot = 131, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 208.4545, yPos = 0.0000, zPos = -147.3638, rot = 119, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 245.5970, yPos = 0.0000, zPos = -187.7445, rot = 250, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 276.3941, yPos = 0.0000, zPos = -152.6242, rot = 155, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 284.6667, yPos = 0.0000, zPos = -163.0480, rot = 70, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 3.6039, yPos = 0.0000, zPos = -183.8802, rot = 188, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 32.6333, yPos = -0.0835, zPos = -197.8983, rot = 174, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 35.4814, yPos = 0.0000, zPos = -209.3724, rot = 48, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 7.6253, yPos = 0.0000, zPos = -135.1767, rot = 85, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 83.1074, yPos = 0.0000, zPos = -55.1334, rot = 197, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 88.2826, yPos = 0.0000, zPos = -279.5879, rot = 179, respawn = 960, drops = 2634, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 17, groupZone = 16, funcLookup = "Default", min = 33, max = 35, xPos = 90.0469, yPos = 0.0525, zPos = -245.0202, rot = 224, respawn = 960, drops = 2634, skills = 256, spells = 0 },
    },
    [xi.zone.PROMYVION_VAHZL] =
    {
        { name = "Gorger", groupId = 17, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = -107.0711, yPos = 0.0000, zPos = 159.7787, rot = 253.0000, respawn = 960, drops = 1208, skills = 137, spells = 5 },
        { name = "Gorger", groupId = 17, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = 89.5394, yPos = -0.0382, zPos = 196.3522, rot = 168.0000, respawn = 960, drops = 1208, skills = 137, spells = 5 },
        { name = "Gorger", groupId = 17, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = 97.5491, yPos = 0.0000, zPos = 184.1264, rot = 116.0000, respawn = 960, drops = 1208, skills = 137, spells = 5 },
        { name = "Gorger", groupId = 25, groupZone = 22, funcLookup = "Default", min = 56, max = 58, xPos = 287.3056, yPos = 0.0000, zPos = -238.4046, rot = 248.0000, respawn = 960, drops = 1208, skills = 137, spells = 5 },
        { name = "Gorger", groupId = 33, groupZone = 22, funcLookup = "Default", min = 56, max = 58, xPos = 393.9876, yPos = 0.0000, zPos = 124.5627, rot = 25.0000, respawn = 960, drops = 1208, skills = 137, spells = 5 },
        { name = "Gorger", groupId = 33, groupZone = 22, funcLookup = "Default", min = 56, max = 58, xPos = -312.5879, yPos = 0.0000, zPos = 107.7147, rot = 106.0000, respawn = 960, drops = 1208, skills = 137, spells = 5 },
        { name = "Seether", groupId = 15, groupZone = 22, funcLookup = "Default", min = 52, max = 52, xPos = 42.9962, yPos = 0.0000, zPos = 169.6137, rot = 4.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 15, groupZone = 22, funcLookup = "Default", min = 52, max = 52, xPos = 75.6930, yPos = 0.0000, zPos = 166.0338, rot = 69.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 22, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = 407.6677, yPos = 0.0000, zPos = -172.3200, rot = 131.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = 134.8804, yPos = 0.0000, zPos = 73.8451, rot = 170.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = 139.3968, yPos = 0.0000, zPos = 66.2553, rot = 142.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = 392.2215, yPos = 0.0000, zPos = 67.3003, rot = 87.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = 429.5049, yPos = 0.0000, zPos = 234.7464, rot = 91.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = -111.1792, yPos = 0.0000, zPos = 10.9221, rot = 108.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = -262.4351, yPos = 0.0000, zPos = 108.1244, rot = 172.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = -372.7559, yPos = 0.0000, zPos = 72.3207, rot = 163.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = -432.5600, yPos = 0.0000, zPos = 45.8416, rot = 36.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = -445.6455, yPos = 0.0000, zPos = 108.2592, rot = 159.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Seether", groupId = 30, groupZone = 22, funcLookup = "Default", min = 54, max = 56, xPos = -60.2247, yPos = 0.0000, zPos = 36.5392, rot = 101.0000, respawn = 960, drops = 2195, skills = 220, spells = 0 },
        { name = "Thinker", groupId = 8, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 41.3506, yPos = 0.0000, zPos = -170.4736, rot = 81.0000, respawn = 960, drops = 2399, skills = 241, spells = 0 },
        { name = "Thinker", groupId = 8, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 59.2404, yPos = 0.0000, zPos = -235.6242, rot = 135.0000, respawn = 960, drops = 2399, skills = 241, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = -3.4028, yPos = -0.0972, zPos = -306.9572, rot = 230.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 107.0345, yPos = 0.0000, zPos = -312.5075, rot = 228.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 109.6144, yPos = 0.0000, zPos = -320.2246, rot = 57.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 110.6579, yPos = 0.0000, zPos = -196.3064, rot = 22.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 115.7168, yPos = -0.0061, zPos = -264.9371, rot = 102.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 117.8257, yPos = 0.0000, zPos = -244.1487, rot = 158.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 120.4018, yPos = 0.0000, zPos = -206.9548, rot = 27.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 123.2841, yPos = 0.0000, zPos = -195.7899, rot = 156.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 16.8965, yPos = -0.1288, zPos = -240.1012, rot = 243.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 37.5574, yPos = 0.0000, zPos = -155.7460, rot = 72.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 43.3734, yPos = 0.0000, zPos = -197.7964, rot = 84.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 46.0013, yPos = 0.0000, zPos = -109.9449, rot = 43.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 55.4550, yPos = 0.0000, zPos = -245.5698, rot = 3.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 55.6586, yPos = 0.0000, zPos = -238.3228, rot = 219.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 69.8927, yPos = 0.0000, zPos = -243.7457, rot = 253.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 70.2362, yPos = -0.0422, zPos = -288.5089, rot = 200.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 5, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 70.3728, yPos = -0.6718, zPos = -298.7267, rot = 4.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 14, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 151.6194, yPos = 0.0000, zPos = 282.2454, rot = 47.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 14, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 35.1499, yPos = 0.0000, zPos = 170.8544, rot = 116.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 14, groupZone = 22, funcLookup = "Default", min = 46, max = 48, xPos = 82.3046, yPos = 0.0000, zPos = 164.4262, rot = 32.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 20, groupZone = 22, funcLookup = "Default", min = 50, max = 52, xPos = 238.9881, yPos = 0.0000, zPos = -184.7035, rot = 169.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 28, groupZone = 22, funcLookup = "Default", min = 50, max = 52, xPos = -105.7565, yPos = 0.0000, zPos = 13.9440, rot = 237.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 28, groupZone = 22, funcLookup = "Default", min = 50, max = 52, xPos = -109.5712, yPos = 0.0000, zPos = 4.4615, rot = 56.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 28, groupZone = 22, funcLookup = "Default", min = 50, max = 52, xPos = -116.8680, yPos = 0.0000, zPos = 8.2442, rot = 109.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Wanderer", groupId = 28, groupZone = 22, funcLookup = "Default", min = 50, max = 52, xPos = -93.6346, yPos = 0.0000, zPos = 26.5810, rot = 221.0000, respawn = 960, drops = 2192, skills = 255, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 114.8524, yPos = -0.1573, zPos = -257.2235, rot = 112.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 114.9795, yPos = 0.0000, zPos = -204.5667, rot = 77.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 115.6957, yPos = 0.0000, zPos = -191.8821, rot = 165.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 123.4105, yPos = 0.0000, zPos = -249.8445, rot = 163.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 127.7593, yPos = 0.0000, zPos = -257.8716, rot = 129.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 45.7085, yPos = 0.0000, zPos = -160.0693, rot = 93.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 50.9664, yPos = 0.0000, zPos = -102.0589, rot = 208.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 56.1243, yPos = 0.0000, zPos = -322.9076, rot = 151.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 68.6942, yPos = 0.0000, zPos = -276.2012, rot = 3.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 71.2046, yPos = 0.0000, zPos = -239.3531, rot = 210.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 79.8733, yPos = 0.0000, zPos = -286.7848, rot = 91.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 6, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 97.9613, yPos = 0.0000, zPos = -322.7393, rot = 251.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = -8.9694, yPos = 0.0000, zPos = 209.8169, rot = 168.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 159.8643, yPos = 0.0000, zPos = 280.6787, rot = 51.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 39.3344, yPos = 0.0000, zPos = 174.3714, rot = 132.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 6.7899, yPos = 0.0000, zPos = 191.6674, rot = 66.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 13, groupZone = 22, funcLookup = "Default", min = 48, max = 50, xPos = 76.0191, yPos = -0.0041, zPos = 156.1955, rot = 73.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 21, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 193.9457, yPos = 0.0000, zPos = -49.6793, rot = 97.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 21, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 200.5075, yPos = 0.0000, zPos = -168.5523, rot = 207.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 21, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 205.3018, yPos = 0.0000, zPos = -46.8240, rot = 215.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 21, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 310.6964, yPos = 0.0000, zPos = -102.9936, rot = 15.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 21, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 406.2446, yPos = 0.0000, zPos = -204.7963, rot = 78.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 21, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 408.6327, yPos = 0.0000, zPos = -192.6933, rot = 72.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 21, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 409.2191, yPos = 0.0000, zPos = -197.0434, rot = 51.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 133.8922, yPos = 0.0000, zPos = 87.2803, rot = 167.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 139.9284, yPos = 0.0000, zPos = 78.3535, rot = 168.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 146.2530, yPos = 0.0000, zPos = 69.9911, rot = 253.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 226.6495, yPos = 0.0000, zPos = 154.9408, rot = 96.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 241.0630, yPos = -0.0011, zPos = 128.1464, rot = 65.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 245.4719, yPos = 0.0000, zPos = 182.0051, rot = 109.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 281.2682, yPos = 0.0000, zPos = 48.6394, rot = 94.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 389.5133, yPos = 0.0000, zPos = 161.5965, rot = 128.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 392.8662, yPos = 0.0000, zPos = 141.8401, rot = 115.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 400.1679, yPos = 0.0000, zPos = 138.8539, rot = 94.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 402.5379, yPos = 0.0000, zPos = 76.4410, rot = 173.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 405.2910, yPos = 0.0000, zPos = 165.5917, rot = 214.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 408.7167, yPos = 0.0000, zPos = 68.3496, rot = 92.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = 412.7112, yPos = 0.0000, zPos = 72.5015, rot = 165.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -170.7182, yPos = 0.0000, zPos = 49.2200, rot = 189.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -223.5898, yPos = 0.0000, zPos = 21.2239, rot = 127.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -245.2416, yPos = 0.0000, zPos = 101.6425, rot = 102.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -247.4728, yPos = 0.0000, zPos = -1.5360, rot = 184.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -307.8439, yPos = -0.0195, zPos = 128.3690, rot = 54.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -356.3988, yPos = 0.0000, zPos = 73.3035, rot = 129.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -363.8326, yPos = 0.0000, zPos = 79.4898, rot = 147.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -428.3708, yPos = 0.0000, zPos = 48.4711, rot = 247.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -439.0869, yPos = 0.0000, zPos = 105.6139, rot = 249.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -54.2657, yPos = 0.0000, zPos = 35.3454, rot = 205.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -60.5094, yPos = 0.0000, zPos = 26.3884, rot = 50.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
        { name = "Weeper", groupId = 29, groupZone = 22, funcLookup = "Default", min = 52, max = 54, xPos = -86.8195, yPos = 0.0000, zPos = 26.2103, rot = 244.0000, respawn = 960, drops = 2637, skills = 256, spells = 0 },
    },
    [xi.zone.QUICKSAND_CAVES] =
    {
        -- Additional mobs for K-7 Eastern Altepa entrance
        { name = "Helm Beetle", groupId =  45, groupZone = 208, funcLookup = "Default", min = 51, max = 54, xPos = 855.41, yPos = -8, zPos = -300.67, rot =  127, respawn = 420 },
        { name = "Helm Beetle", groupId =  45, groupZone = 208, funcLookup = "Default", min = 51, max = 54, xPos = 857.76, yPos = -8, zPos = -399.63, rot =  127, respawn = 420 },
        -- Aditional mobs for J-9 Western Altepa entrance
        { name = "Helm Beetle", groupId =  8, groupZone = 208, funcLookup = "Default", min = 55, max = 59, xPos = 63.00, yPos = -0.16, zPos = -137.29, rot =  127, respawn = 420 },
        { name = "Helm Beetle", groupId =  8, groupZone = 208, funcLookup = "Default", min = 55, max = 59, xPos = 57.47, yPos = 0.00, zPos = -101.68, rot =  127, respawn = 420 },
        { name = "Helm Beetle", groupId =  8, groupZone = 208, funcLookup = "Default", min = 55, max = 59, xPos = 139.62, yPos = -8.00, zPos = -180.75, rot =  127, respawn = 420 },
    },
    [xi.zone.SAUROMUGUE_CHAMPAIGN] =
    {
        -- Camp 1, Beetles/Cockatrice
        { name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 30, max = 32, xPos = -258.104, yPos =  7.783, zPos = 67.375, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0 },
        { name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 30, max = 32, xPos = -270.230, yPos =  7.692, zPos = 79.879, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0 },
        { name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 30, max = 32, xPos = -265.657, yPos =  7.717, zPos = 48.222, rot =  72, respawn = 330, drops =  670, skills = 49, spells = 0 },
        { name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 30, max = 32, xPos = -252.07, yPos =  7.427, zPos = 67.956, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0 },
        { name = "Tabar Beak",           groupId =   20, groupZone = 120, funcLookup = "Default", min = 31, max = 33, xPos = -285.4515, yPos =  7.6353, zPos = 80.8471, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0 },
        { name = "Tabar Beak",           groupId =   20, groupZone = 120, funcLookup = "Default", min = 31, max = 33, xPos = -244.0897, yPos =  8.6927, zPos = 95.1469, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0 },
        { name = "Tabar Beak",           groupId =   20, groupZone = 120, funcLookup = "Default", min = 31, max = 33, xPos = -238.1371, yPos =  8.0000, zPos = 37.0856, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0 },
        -- Camp 2, Coeurl/Beetle/Yagudo/Bats
        { name = "Champaign Coeurl",     groupId =   9, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 553.7828, yPos = -0.0548, zPos = -271.5814, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0 },
        { name = "Champaign Coeurl",     groupId =   9, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 550.4348, yPos = 0.0706,  zPos = -218.1270, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0 },
        { name = "Champaign Coeurl",     groupId =   9, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 545.0939, yPos = 0.1799,  zPos = -201.4806, rot =  127, respawn = 330, drops =  2370, skills = 70, spells = 0 },
        { name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 35, max = 37, xPos = 568.6832, yPos = -0.3815, zPos = -224.9137, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0 },
        { name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 35, max = 37, xPos = 567.2023, yPos = -0.0632, zPos = -190.8926, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0 },
        { name = "Diving Beetle",        groupId =   36, groupZone = 120, funcLookup = "Default", min = 35, max = 37, xPos = 545.0492, yPos = -0.4096, zPos = -178.6207, rot =  127, respawn = 330, drops =  670, skills = 49, spells = 0 },
        { name = "Midnight Wings",       groupId =   7, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 548.1401, yPos = -0.0106, zPos = -223.0685, rot =  55,  respawn = 330, drops =  1668, skills = 47, spells = 0, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT },
        { name = "Midnight Wings",       groupId =   7, groupZone = 120, funcLookup = "Default",  min = 35, max = 37, xPos = 570.9258, yPos = -0.7598, zPos = -236.1827, rot =  55,  respawn = 330, drops =  1668, skills = 47, spells = 0, spawnType = xi.spawnType.SPAWNTYPE_ATNIGHT },
        { name = "Yagudo Votary",        groupId =   10, groupZone = 120, funcLookup = "Default", min = 36, max = 38, xPos = 541.4835, yPos = -0.0323, zPos = -221.0322, rot =  43,  respawn = 330, drops =  2775, skills = 270, spells = 0 },
        { name = "Yagudo Interrogator",  groupId =   17, groupZone = 120, funcLookup = "Default", min = 36, max = 38, xPos = 547.334,  yPos =  7.5221, zPos = -129.7686, rot =  127, respawn = 330, drops =  2772, skills = 270, spells = 0 },
        -- MB Camp 1, Urganites
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 402.7, yPos = 40, zPos = 444.8, rot = 133, respawn = 330 },
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 405.9, yPos = 40, zPos = 423.3, rot = 233, respawn = 330 },
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 408.75, yPos = 40, zPos = 416.4, rot = 333, respawn = 330 },
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 391.9, yPos = 40, zPos = 421.29, rot = 33, respawn = 330 },
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 389.25, yPos = 40.5, zPos = 410.27, rot = 87, respawn = 330 },
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 376.66, yPos = 40.5, zPos = 426.04, rot = 93, respawn = 330 },
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 380.02, yPos = 40, zPos = 440.17, rot = 120, respawn = 330 },
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 378.97, yPos = 40, zPos = 419.51, rot = 100, respawn = 330 },
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 358.59, yPos = 40, zPos = 439.57, rot = 110, respawn = 330 },
        { name = "Young Uragnite",       groupId = 8, groupZone = 4, funcLookup = "Manaburn_Low", min = 36, max = 42, xPos = 361.89, yPos = 40, zPos = 419.58, rot = 109, respawn = 330 },
    },
    [xi.zone.TAHRONGI_CANYON] =
    {
        -- Additional bee for I-9 Camp
        { name = "Killer Bee", groupId =  51, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = -328.69, yPos = 7.98, zPos = 246.62, rot =  51, respawn = 330 },
        -- Lvl 10-12 camp near Bubu entrance
        { name = "Canyon Wasp", groupId =  51, groupZone = 117, funcLookup = "Default", min = 15, max = 19, xPos = 225.76, yPos = -15.84, zPos = -114.90, rot =  51, respawn = 330 },
        { name = "Canyon Wasp", groupId =  51, groupZone = 117, funcLookup = "Default", min = 15, max = 19, xPos = 194.82, yPos = -15.79, zPos = -115.65, rot =  51, respawn = 330 },
        { name = "Canyon Wasp", groupId =  51, groupZone = 117, funcLookup = "Default", min = 15, max = 19, xPos = 154.27, yPos = -8.16, zPos = -127.09, rot =  51, respawn = 330 },
        { name = "Canyon Wasp", groupId =  51, groupZone = 117, funcLookup = "Default", min = 15, max = 19, xPos = 159.83, yPos = -16.00, zPos = -158.57, rot =  51, respawn = 330 },
        { name = "Cactus Grub", groupId =  10, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 192.79, yPos = -19.50, zPos = -140.18, rot =  51, respawn = 330 },
        { name = "Cactus Grub", groupId =  10, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 187.66, yPos = -13.42, zPos = -84.77, rot =  51, respawn = 330 },
        { name = "Cactus Grub", groupId =  10, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 158.28, yPos = -8.00, zPos = -115.77, rot =  51, respawn = 330 },
        { name = "Cactus Grub", groupId =  10, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 211.79, yPos = -14.94, zPos = -110.97, rot =  51, respawn = 330 },
        { name = "Yagudo Acolyte", groupId =  23, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 238.53, yPos = -14.92, zPos = -100.21, rot =  51, respawn = 330 },
        { name = "Yagudo Piper", groupId =  25, groupZone = 117, funcLookup = "Default", min = 17, max = 20, xPos = 181.79, yPos = -13.02, zPos = -121.81, rot =  51, respawn = 330 },
    },
    [xi.zone.VALKURM_DUNES] =
    {
        -- Additional mobs to (D-7) Lizard camp
        { name = "Hill Lizard",          groupId =   23, groupZone = 103, funcLookup = "Default", min = 15, max = 19, xPos = -522.5940, yPos =  -8.1269, zPos = 165.6588, rot =  127, respawn = 330, drops =  1316, skills = 174, spells = 0 },
        { name = "Hill Lizard",          groupId =   23, groupZone = 103, funcLookup = "Default", min = 15, max = 19, xPos = -480.8232, yPos =  -7.6422, zPos = 91.3019, rot =  127, respawn = 330, drops =  1316, skills = 174, spells = 0 },
        -- Additional mobs to (K-9) Lizard camp
        { name = "Hill Lizard",          groupId =   23, groupZone = 103, funcLookup = "Default", min = 15, max = 19, xPos = 698.8024, yPos =  -4.7393, zPos = -184.5671, rot =  46, respawn = 330, drops =  1316, skills = 174, spells = 0 },
        -- Additional mobs to (H-9) Pugil camp
        { name = "Beach Pugil",          groupId =   28, groupZone = 103, funcLookup = "Default", min = 23, max = 26, xPos = -156.5827, yPos =  4.0, zPos = -125.7460, rot =  4, respawn = 330, drops =  248, skills = 197, spells = 0 },
        -- Additional mobs to (E-9) Pugil camp
        { name = "Beach Pugil",          groupId =   28, groupZone = 103, funcLookup = "Default", min = 23, max = 26, xPos = -232.1026, yPos =  4.3, zPos = -49.2252, rot =  4, respawn = 330, drops =  248, skills = 197, spells = 0 },
    },
    [xi.zone.WESTERN_ALTEPA_DESERT] =
    {
        -- Additional beetles added to revelation rock exp camp
        { name = "Desert Beetle", groupId =   12, groupZone = 125, funcLookup = "Default", min = 47, max = 51, xPos = -224.50, yPos = 0.14, zPos = 151.68, rot =  127, respawn = 330 },
        { name = "Desert Beetle", groupId =   12, groupZone = 125, funcLookup = "Default", min = 47, max = 51, xPos = -259.91, yPos = 0.36, zPos = 152.66, rot =  127, respawn = 330 },
        { name = "Desert Beetle", groupId =   12, groupZone = 125, funcLookup = "Default", min = 47, max = 51, xPos = -268.74, yPos = -1.29, zPos = 135.31, rot =  127, respawn = 330 },
        { name = "Desert Beetle", groupId =   12, groupZone = 125, funcLookup = "Default", min = 47, max = 51, xPos = -266.08, yPos = 0.96, zPos = 176.45, rot =  127, respawn = 330 },
        { name = "Desert Beetle", groupId =   12, groupZone = 125, funcLookup = "Default", min = 47, max = 51, xPos = -202.67, yPos = 0.40, zPos = -92.15, rot =  127, respawn = 330 },
        { name = "Desert Beetle", groupId =   12, groupZone = 125, funcLookup = "Default", min = 47, max = 51, xPos = -249.22, yPos = -3.45, zPos = -61.18, rot =  127, respawn = 330 },
        { name = "Desert Beetle", groupId =   12, groupZone = 125, funcLookup = "Default", min = 47, max = 51, xPos = -135.06, yPos = -1.59, zPos = -67.53, rot =  127, respawn = 330 },
        { name = "Desert Beetle", groupId =   12, groupZone = 125, funcLookup = "Default", min = 47, max = 51, xPos = -209.08, yPos = -0.29, zPos = -71.06, rot =  127, respawn = 330 },
    },
}

local spawnerFunctions =
{
    ["Default"] =
    {
        onSpawn             = function(mob) end,
        onEngaged           = function(mob, target) end,
        onFight             = function(mob, target) end,
        onDisengage         = function(mob, target) end,
        onWeaponskilPrepare = function(mob, target, skill) end,
        onWeaponskill       = function(mob, target, skill) end,
        onMagicPrepare      = function(mob, target, spell) end,
        onRoam              = function(mob) end,
        onDeath             = function(mob, playerArg, isKiller) end,
        onDespawn           = function(mob) end,
        mixins = {  },
    },
    ["Manaburn_Low"] =
    {
        onSpawn             = function(mob) mob:addMod(xi.mod.DMGPHYS, -9000) mob:addMod(xi.mod.DMGMAGIC, 500) mob:addMod(xi.mod.MEVA, -10) mob:setMobMod(xi.mobMod.NO_AGGRO, 0) end,
        onEngaged           = function(mob, target) end,
        onFight             = function(mob, target) end,
        onDisengage         = function(mob, target) end,
        onWeaponskilPrepare = function(mob, target, skill) end,
        onWeaponskill       = function(mob, target, skill) end,
        onMagicPrepare      = function(mob, target, spell) end,
        onRoam              = function(mob) end,
        onDeath             = function(mob, playerArg, isKiller) end,
        onDespawn           = function(mob) end,
        mixins = {  },
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

        if table.min == nil then
            table.min = 0
        end

        if table.max == nil then
            table.max = 0
        end

        if table.skills == nil then
            table.skills = 0
        end

        if table.drops == nil then
            table.drops = 0
        end

        if table.skills == nil then
            table.skills = 0
        end

        if table.spells == nil then
            table.spells = 0
        end

        if table.respawn == nil then
            table.respawn = 0
        end

        if table.spawnType == nil then
            table.spawnType = 0
        end

        if table.subRatio == nil then
            table.subRatio = 3
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
            minLevel = table.min,
            maxLevel = table.max,
            dropId = table.drops,
            skillList = table.skills,
            spellList = table.spells,
            respawn = table.respawn,
            spawnType = table.spawnType,
            subRatio = table.subRatio,
        })

        mob:setSpawn(table.xPos, table.yPos, table.zPos, table.rot)
        mob:spawn()

        if table.spawnType ~= xi.spawnType.SPAWNTYPE_NORMAL then
            DespawnMob(mob:getID())
        end
    end
end
