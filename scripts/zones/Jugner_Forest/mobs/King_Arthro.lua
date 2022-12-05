-----------------------------------
-- Area: Jugner Forest
--   NM: King Arthro
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest/IDs")
mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/rage")
}
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

local spawnBabyCrab1 = function(mob, zone, target)
    local baby1 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Rook Crab',
        x = mob:getXPos() + 1,
        y = mob:getYPos(),
        z = mob:getZPos() + 1,
        rotation = mob:getRotPos(),
        groupId = 6,
        groupZoneId = 104,
        releaseIdOnDeath = true,
        onMobDeath = function(baby1Arg, playerArg, isKiller)
            GetMobByID(ID.mob.KING_ARTHRO):setMod(xi.mod.UDMGPHYS, -3000)
            GetMobByID(ID.mob.KING_ARTHRO):setMod(xi.mod.DMGPHYS, -3000)
            GetMobByID(ID.mob.KING_ARTHRO):setMod(xi.mod.UDMGMAGIC, -3000)
            GetMobByID(ID.mob.KING_ARTHRO):setMod(xi.mod.DMGMAGIC, -3000)
            GetMobByID(ID.mob.KING_ARTHRO):setLocalVar("Rook", 0)
        end,
        onMobSpawn = function(baby1Arg)
            GetMobByID(ID.mob.KING_ARTHRO):setLocalVar('Rook', baby1Arg:getID())
        end,
    })

    baby1:setDropID(0)
    baby1:setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos() + 1, mob:getRotPos())
    baby1:spawn()
    baby1:updateEnmity(mob:getTarget())

    mob:setMod(xi.mod.UDMGPHYS, -9500)
    mob:setMod(xi.mod.DMGPHYS, -9500)
    mob:setMod(xi.mod.UDMGMAGIC, -9500)
    mob:setMod(xi.mod.DMGMAGIC, -9500)
end

local spawnBabyCrab2 = function(mob, zone, target)
    local baby2 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Bishop Crab',
        x = mob:getXPos() - 1,
        y = mob:getYPos(),
        z = mob:getZPos() - 1,
        rotation = mob:getRotPos(),
        groupId = 6,
        groupZoneId = 104,
        releaseIdOnDeath = true,
        onMobDeath = function(baby2arg, playerArg, isKiller)
            GetMobByID(ID.mob.KING_ARTHRO):setMod(xi.mod.TRIPLE_ATTACK, 0)
            GetMobByID(ID.mob.KING_ARTHRO):setLocalVar("Bishop", 0)
        end,
        onMobSpawn = function(baby2arg)
            GetMobByID(ID.mob.KING_ARTHRO):setLocalVar('Bishop', baby2arg:getID())
        end,
    })

    baby2:setDropID(0)
    baby2:setSpawn(mob:getXPos() - 1, mob:getYPos(), mob:getZPos() - 1, mob:getRotPos())
    baby2:spawn()
    baby2:updateEnmity(mob:getTarget())

    mob:setMod(xi.mod.TRIPLE_ATTACK, 35)
end

local spawnQueenCrab = function(mob, zone, target)
    local baby1 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Queen Crab',
        x = mob:getXPos() + 1,
        y = mob:getYPos(),
        z = mob:getZPos() + 1,
        rotation = mob:getRotPos(),
        groupId = 89,
        groupZoneId = 104,
        releaseIdOnDeath = true,
        onMobSpawn = function(baby1Arg)
            GetMobByID(ID.mob.KING_ARTHRO):setLocalVar('Queen', baby1Arg:getID())
        end,
        onMobFight = function(baby1Arg)
            local spell = 202
            baby1Arg:setMod(xi.mod.SILENCERES, 100)
            baby1Arg:setMod(xi.mod.UFASTCAST, 50)
            baby1Arg:setMod(xi.mod.MACC, 1000)
            baby1Arg:setMod(xi.mod.INT, 140)

            if baby1Arg:getLocalVar('CastTime') < os.time()  then
                baby1Arg:castSpell(spell, baby1Arg:getTarget())
                baby1Arg:setLocalVar('CastTime', os.time() + 12)
                baby1Arg:setMP(500)
            end
        end,
        onMobDeath = function(baby1Arg, playerArg, isKiller)
            GetMobByID(ID.mob.KING_ARTHRO):setLocalVar("Queen", 0)
        end,
    })

    -- Use the mob object as you normally would
    baby1:setDropID(0)
    baby1:setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos() + 1, mob:getRotPos())
    baby1:spawn()
    baby1:updateEnmity(mob:getTarget())
end

local spawnPawn = function(mob, zone)
    local baby2 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Pawn Crab',
        x = -176 + math.random(-5, 5),
        y = 0.15,
        z = 463 + math.random(-5, 5),
        rotation = 244,
        groupId = 90,
        groupZoneId = 104,
        releaseIdOnDeath = true,
        onMobDeath = function(baby2arg, playerArg, isKiller)
        end,
        onMobSpawn = function(baby2arg, targetArg)
            baby2arg:setSpeed(18)
            baby2arg:setAutoAttackEnabled(false)
            baby2arg:setMod(xi.mod.INT, 120)
            baby2arg:setMod(xi.mod.MACC, 500)
        end,
        onMobFight = function(baby2arg, targetArg)
            if targetArg then
                local pxDist = targetArg:getXPos()
                local mxdist = baby2arg:getXPos()
                local pzDist = targetArg:getZPos()
                local mzdist = baby2arg:getZPos()

                local distance = math.sqrt((math.abs(pxDist-mxdist))^2 + (math.abs(pzDist-mzdist))^2)
                if distance < 5 and baby2arg:getLocalVar('abilityUsed') == 0 then
                    baby2arg:setLocalVar('abilityUsed', 1)
                    baby2arg:useMobAbility(442)
                    baby2arg:timer(4000, function(baby2arg2) DespawnMob(baby2arg2:getID()) end)
                end
            end
        end,
        onMobRoam = function(baby2arg)
            DespawnMob(baby2arg:getID())
        end,
    })

    baby2:setDropID(0)
    baby2:setSpawn(-176 + math.random(-5, 5), 0.15, 463 + math.random(-5, 5), 244)
    baby2:spawn()
    local victimList = mob:getEnmityList()
    local victim1 = utils.randomEntry(victimList)["entity"]
    baby2:updateEnmity(victim1)
end

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMod(xi.mod.UFASTCAST, 100)
    mob:setMod(xi.mod.UDMGPHYS, -3000)
    mob:setMod(xi.mod.DMGPHYS, -3000)
    mob:setMod(xi.mod.UDMGMAGIC, -3000)
    mob:setMod(xi.mod.DMGMAGIC, -3000)
    mob:setMod(xi.mod.CLAIMSHIELD, 4000)
end

entity.onMobSpawn = function(mob)
    local kingArthroID = mob:getID()
    mob:setLocalVar("state", 1)
    mob:addMod(xi.mod.ACC, 200)

    -- Use King Arthro ID to determine Knight Crab Id's, then set their respawn to 0 so they don't spawn while KA is up
    for offset = 1, 10 do
        GetMobByID(kingArthroID - offset):setRespawnTime(0)
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    if mob:hasStatusEffect(xi.effect.ENWATER) then
        return 0, 0, 0
    else
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PARALYZE)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    local rook = mob:getLocalVar("Rook")
    local bishop = mob:getLocalVar("Bishop")
    local queen = mob:getLocalVar("Queen")

    if rook ~= 0 then
        DespawnMob(rook)
    end
    if bishop ~= 0 then
        DespawnMob(bishop)
    end
    if queen ~= 0 then
        DespawnMob(queen)
    end
end

entity.onMobDespawn = function(mob)
    local kingArthroID = mob:getID()

    UpdateNMSpawnPoint(mob:getID())
    GetMobByID(kingArthroID):setLocalVar("[POP]King_Arthro", 0)

    -- Set respawn persistence of knight crabs
    local respawnTime = 75900 + math.random(0, 6) * 1800 -- 21:05 to 24:05 respawn timer in 30 minute intervals
    for offset = 1, 10 do
        xi.mob.nmTODPersist(GetMobByID(kingArthroID - offset), respawnTime)
    end
end

entity.onMobFight = function(mob, player, target)
    local hPPercents =
    {
        80, 60, 40, 20
    }
    local state = mob:getLocalVar("state")
    local canSpawn = hPPercents[state]
    local rook = mob:getLocalVar("Rook")
    local bishop = mob:getLocalVar("Bishop")

    if canSpawn == nil then
        canSpawn = 0
    end

    if
        mob:getHPP() <= canSpawn
    then
        mob:setLocalVar(tostring(hPPercents[state]), 1)
        mob:setLocalVar("state", state + 1)
        mob:setLocalVar('CanSpawnBabie1', 1)
        mob:setLocalVar('CanSpawnBabie2', 1)
    elseif mob:getHPP() <= 50 and mob:getLocalVar('queenSpawned') == 0 then
        mob:setLocalVar('queenSpawned', 1)
        mob:setLocalVar(tostring(hPPercents[state + 1]), 1)
        spawnQueenCrab(mob, mob:getZone(), target)
        GetMobByID(mob:getLocalVar("Queen")):updateEnmity(target)
    end
    if
        mob:getLocalVar('CanSpawnBabie1') == 1 and
        rook == 0
    then
        mob:setLocalVar('CanSpawnBabie1', 0)
        spawnBabyCrab1(mob, mob:getZone(), target)
        GetMobByID(mob:getLocalVar("Rook")):updateEnmity(target)
    end

    if
        mob:getLocalVar('CanSpawnBabie2') == 1 and
        bishop == 0
    then
        mob:setLocalVar('CanSpawnBabie2', 0)
        spawnBabyCrab2(mob, mob:getZone(), target)
        GetMobByID(mob:getLocalVar("Bishop")):updateEnmity(target)
    end

    local nextMob = mob:getLocalVar('nextTime')
    local time = os.time()

    if nextMob < time then
        mob:setLocalVar('nextTime', os.time() + 25)
        spawnPawn(mob, mob:getZone())
    end
end

entity.onMobEngaged = function(mob, target)
    local rook = mob:getLocalVar("Rook")
    local bishop = mob:getLocalVar("Bishop")
    local queen = mob:getLocalVar("Queen")

    if rook ~= 0 then
        GetMobByID(rook):updateEnmity(target)
    end
    if bishop ~= 0 then
        GetMobByID(bishop):updateEnmity(target)
    end
    if queen ~= 0 then
        GetMobByID(bishop):updateEnmity(target)
    end
end

return entity
