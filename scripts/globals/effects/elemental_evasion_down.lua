-----------------------------------
-- xi.effect.ELEMENTAL_EVASION_DOWN
-- Used for era+ wyvern breath.
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

local mevas =
{
    xi.mod.FIRE_MEVA, -- Used for Water
    xi.mod.ICE_MEVA, -- Used for Fire
    xi.mod.WIND_MEVA, -- Used for Ice
    xi.mod.EARTH_MEVA, -- Used for Wind
    xi.mod.THUNDER_MEVA, -- Used for Earth
    xi.mod.WATER_MEVA, -- Used for Thunder
    xi.mod.LIGHT_MEVA, -- Used for Dark
    xi.mod.DARK_MEVA, -- Used for Light
}

effect_object.onEffectGain = function(target, effect)
    target:addMod(mevas[effect:getPower()], -20)
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(mevas[effect:getPower()], -20)
end

return effect_object
