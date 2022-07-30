-----------------------------------
-- HorizonXI Lua Module
-- Used to change mobskill luas.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

local m = Module:new("horizon_mobskills")

m:addOverride("xi.globals.mobskills.wild_oats.onMobWeaponSkill", function(target, mob, skill)
    local typeEffect = xi.effect.VIT_DOWN

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 10, 3, 120))

    if mob:isPet() then
        target:addStatusEffectEx(xi.effect.DEFENSE_DOWN, xi.effect.NONE, 15, 3, 120)
    end

    return typeEffect
end)

return m
