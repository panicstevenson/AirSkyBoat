-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Bomb Queen
--  Vid: https://www.youtube.com/watch?v=AVsEbYjSAHM
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(xi.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    mob:setMod(xi.mod.STUNRES, 50)
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar("petCooldown", os.time() + 5) -- five seconds for first pet
end

entity.onMobFight = function(mob, target)
    -- every ~30 seconds after first pet, a new pet will spawn around queen's position.
    -- 49.5% (198/400) chance for Prince/Princess. 1% (4/400) chance for Bomb Bastard.
    if os.time() > mob:getLocalVar("petCooldown") then
        local petId = mob:getID() + 1 + math.floor(math.random(0, 399) / 99)
        local pet = GetMobByID(petId)

        if pet and not pet:isSpawned() and mob:canUseAbilities() then
            local pos = mob:getPos()
            mob:entityAnimationPacket("casm")
            mob:SetAutoAttackEnabled(false)
            mob:SetMagicCastingEnabled(false)
            mob:SetMobAbilityEnabled(false)
            mob:setLocalVar("petCooldown", os.time() + 30)
            mob:timer(3000, function(mobArg)
                mobArg:entityAnimationPacket("shsm")
                mobArg:SetMobAbilityEnabled(true)
                mobArg:SetAutoAttackEnabled(true)
                mobArg:SetMagicCastingEnabled(true)
                pet:setSpawn(pos.x + math.random(-2, 2), pos.y, pos.z + math.random(-2, 2), pos.rot)
                pet:spawn()
                pet:updateEnmity(target)
            end)
        end
    end
end

entity.onMobDeath = function(mob, player, isKiller)
    -- pets die with queen
    if isKiller then
        local mobId = mob:getID()
        for i = mobId + 1, mobId + 5 do
            local pet = GetMobByID(i)
            if pet:isAlive() then
                pet:setHP(0)
            end
        end
    end
end

return entity
