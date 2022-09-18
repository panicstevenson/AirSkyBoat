-----------------------------------
-- Dream Flower
-- 15' AoE sleep
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    if mob:getZoneID() == xi.zone.DYNAMIS_VALKURM then
        local effect = xi.effect.SLEEP_I
        local resist = xi.mobskills.applyPlayerResistance(mob, nil, target, mob:getStat(xi.mod.INT)-target:getStat(xi.mod.INT), 1, xi.magic.ele.DARK)
        local duration = math.ceil(60 + math.floor(31*math.random()) * resist) -- wiki: duration variable from 30 to 90. can be thought of random 60-90 with possible half resist making it range 30-90
        if resist >= 0.5 then
            target:delStatusEffectSilent(effect)
            target:delStatusEffectSilent(xi.effect.LULLABY)
            target:delStatusEffectSilent(xi.effect.SLEEP_I)
            target:delStatusEffectSilent(xi.effect.POISON)
            local dotdmg = 50
            if not (target:hasImmunity(1) or hasSleepEffects(target)) and target:addStatusEffect(effect, 1, 0, duration, 25, 25, 1) then -- subid/subpower for poison detection on wakup function
                target:addStatusEffect(xi.effect.POISON, dotdmg, 3, duration, 0, 15, 2)
                skill:setMsg(xi.msg.basic.SKILL_ENFEEB_IS)
            else
                skill:setMsg(xi.msg.basic.SKILL_NO_EFFECT)
            end
        else
            skill:setMsg(xi.msg.basic.SKILL_MISS)
        end
        return effect
    else
        local typeEffect = xi.effect.SLEEP_I
        skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1, 0, 30))
        return typeEffect
    end
end

return mobskill_object
