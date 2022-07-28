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
        -- {name = "something", groupId = 1, groupZone = 1, funcLookup = "Default", min = 1, max = 2, xPos = 1.123, yPos = 1.123, zPos = 1.123, rot = 0, respawn = 30, releaseId = false, spawnAnimation = false, drops = 123, skills = 234, spells = 345, enabled = true, spawnType = xi.spawnType.spawnType},
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
        mob:spawn()

        if table.respawn ~= nil then
            mob:setRespawnTime(table.respawn)
            zone:setLocalVar(string.format("[SPAWNER]Index_", mob:getID()), index)
        end

        if table.spawnType ~= nil then
            mob:setSpawnType(table.spawnType)
            DespawnMob(mob:getID())
        end
    end
end
