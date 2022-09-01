-----------------------------------
-- Area: Riverne Site B01
-- Note: Weaker version of Ouryu summoned by Bahamut during The Wyrmking Descends
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------
local entity = {}

local offsets = {4, 5, 6, 7}

entity.onMobSpawn = function(mob)
    mob:SetMobSkillAttack(0)
    mob:setAnimationSub(0)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
    mob:setLocalVar("savageDmgMultipliers", 1)
    mob:setLocalVar("twoHour", 0)

    -- mods put fight in line with retail difficulty
    mob:addMod(xi.mod.SLEEPRES, 100)
    mob:addMod(xi.mod.LULLABYRES, 100)
    mob:addMod(xi.mod.EARTHRES, 1000)
    mob:addMod(xi.mod.BLINDRESTRAIT, 25)
    mob:addMod(xi.mod.PARALYZERESTRAIT, 25)
    mob:addMod(xi.mod.STUNRES, 100)
    mob:addMod(xi.mod.MDEF, 100)
    mob:setMod(xi.mod.UDMGRANGE, -50)
    mob:setMod(xi.mod.MATT, -100)
    for i = 8, 9 do
        SpawnMob(mob:getID() + i)
    end
end

--Ouryu cuts remote and magic damage by 50% and has the ability to fly.

entity.onMobFight = function(mob, target)
    -- use 2hr
    if (mob:getAnimationSub() == 2 and mob:getLocalVar("twoHour") == 0 and mob:getHPP() < 75) then
        mob:useMobAbility(694)
        mob:setLocalVar("twoHour", 1)
    end

    if (mob:hasStatusEffect(xi.effect.INVINCIBLE) == false and mob:actionQueueEmpty() == true) then
        local changeTime = mob:getLocalVar("changeTime")

        -- first flight
        if (mob:getAnimationSub() == 0 and not hasSleepEffects(mob) and mob:getBattleTime() - changeTime > 60) then
            mob:setAnimationSub(1)
            mob:addStatusEffectEx(xi.effect.ALL_MISS, 0, 1, 0, 0)
            mob:SetMobSkillAttack(731)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        -- land
        elseif (mob:getAnimationSub() == 1 and mob:getBattleTime() - changeTime > 120) then
            mob:useMobAbility(1302)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        -- fly
        elseif (mob:getAnimationSub() == 2 and not hasSleepEffects(mob) and mob:getBattleTime() - changeTime > 120) then
            mob:setAnimationSub(1)
            mob:addStatusEffectEx(xi.effect.ALL_MISS, 0, 1, 0, 0)
            mob:SetMobSkillAttack(731)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    end

    local delay = mob:getLocalVar("delay")
    if (delay > 120) then -- Summon Ziryu every 60s, this is a guess until we get a capture
        mob:setLocalVar("delay", 0)

        local mobId = mob:getID()
        for i, offset in ipairs(offsets) do
            local pet = GetMobByID(mobId + offset)

            if not pet:isSpawned() then
                    pet:spawn(60)
                    local pos = mob:getPos()
                    pet:setPos(pos.x + math.random(2, 6), pos.y, pos.z + math.random(2, 6))
                    pet:updateEnmity(mob:getTarget())
                break
            end
        end

    else
        mob:setLocalVar("delay", delay+1)
    end

    -- Wakeup from sleep immediately if flying
    if mob:getAnimationSub() == 1 and
    (mob:hasStatusEffect(xi.effect.SLEEP_I) or
    mob:hasStatusEffect(xi.effect.SLEEP_II) or
    mob:hasStatusEffect(xi.effect.LULLABY)) then
        mob:wakeUp()
    end
end

-- Prevents any stuck logic due to wipes
entity.onMobDisengage = function(mob)
    mob:setLocalVar("changeTime", 0)
end

return entity
