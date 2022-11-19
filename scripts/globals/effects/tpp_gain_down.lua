-----------------------------------
-- xi.effect.TPP_GAIN_DOWN
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.TPP_GAIN_MOD, -effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.TPP_GAIN_MOD, -effect:getPower())
end

return effectObject
