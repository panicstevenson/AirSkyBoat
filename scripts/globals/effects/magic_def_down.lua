-----------------------------------
-- xi.effect.MAGIC_DEF_DOWN
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    if (effect:getPower()>100) then
        effect:setPower(50)
    end
    target:delMod(xi.mod.MDEF, effect:getPower())
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:addMod(xi.mod.MDEF, effect:getPower())
end

return effect_object
