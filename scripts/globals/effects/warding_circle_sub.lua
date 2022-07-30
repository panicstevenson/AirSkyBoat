-----------------------------------
-- xi.effect.WARDING_CIRCLE_SUB
-----------------------------------
require("scripts/globals/jobpoints")
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    if effect:getPower() == 2 then
        target:addMod(xi.mod.DMG_AGAINST_DEMON_MULT, 10)
        target:addMod(xi.mod.DEMON_MITIGATION_MULT, 5)
    else
        target:addMod(xi.mod.DMG_AGAINST_DEMON_MULT, 5)
    end
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    if effect:getPower() == 2 then
        target:delMod(xi.mod.DMG_AGAINST_DEMON_MULT, 10)
        target:delMod(xi.mod.DEMON_MITIGATION_MULT, 5)
    else
        target:delMod(xi.mod.DMG_AGAINST_DEMON_MULT, 5)
    end
end

return effect_object
