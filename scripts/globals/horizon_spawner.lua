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
    -- [xi.zones.EXAMPLE] =
    -- {
        -- {name = "something", groupId = 1, groupZone = 1, min = 1, max = 2, xPos = 1.123, yPos = 1.123, zPos = 1.123, rot = 0, respawn = 30, releaseId = false, spawnAnimation = false, drops = 123, skills = 234, spells = 345},
    -- }
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
    if table.enabled == true then
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

        if table.min ~= nil and table.max ~= nil then
            mob:setMobLevel(math.random(table.min, table.max))
        end

        if table.respawn ~= nil then
            mob:setRespawnTime(table.respawn)
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
    end
end
