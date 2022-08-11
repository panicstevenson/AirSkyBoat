-----------------------------------
-- Area: Monarch Linn
-- Mob: Razon
-- ENM: Fire in the Sky
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

local elements =
{
    xi.damageType.EARTH,
    xi.damageType.WATER,
    xi.damageType.WIND,
    xi.damageType.FIRE,
    xi.damageType.ICE,
    xi.damageType.THUNDER,
    xi.damageType.LIGHT,
    xi.damageType.DARK,
}

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.SIGHT_RANGE, 20)
    mob:setMod(xi.mod.UDMGPHYS, -7500)
    mob:setMod(xi.mod.UDMGRANGE, -7500)
    mob:addStatusEffect(xi.effect.STONESKIN, 150, 0, 300)
    mob:setLocalVar("loseControl", 0)

    mob:setLocalVar("triggerElement1", elements[math.random(1,8)])
    mob:setLocalVar("triggerElement2", elements[math.random(1,8)])

    mob:addListener("TAKE_DAMAGE", "RAZON_TAKE_DAMAGE", function(mobArg, amount, attacker, attackType, damageType)
        if attackType == xi.attackType.MAGICAL and
            (damageType == mob:getLocalVar("triggerElement1") or damageType == mob:getLocalVar("triggerElement2"))
        then
            local tp = mobArg:getTP()
            mobArg:useMobAbility(626) -- dust cloud
            mobArg:setTP(tp)

            if mobArg:getAnimationSub() == 4 then
                mobArg:useMobAbility(575)
            elseif mobArg:getAnimationSub() == 5 then
                mobArg:useMobAbility(573)
            else
                mobArg:useMobAbility(571)
            end
        end
    end)
end

entity.onMobWeaponSkill = function(target, mob, skill)
    if skill:getID() == 571 then
        mob:timer(7000, function(mobArg)
            mobArg:getBattlefield():lose()
        end)
    end
end

entity.onMobDeath = function(mob)
end

return entity
