-----------------------------------
-- HorizonXI Lua Module
-- Used to change ability luas.
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
require("scripts/globals/jobpoints")
-----------------------------------

local m = Module:new("horizon_status_effects")

m:addOverride("xi.globals.effects.defender.onEffectGain", function(player, target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)

    target:addMod(xi.mod.DEFP, 25)
    target:addMod(xi.mod.RATTP, -25)
    target:addMod(xi.mod.ATTP, -25)
    target:addMod(xi.mod.ENMITY_LOSS_REDUCTION, - 25)

    -- JP Bonus
    target:addMod(xi.mod.DEF, jpLevel * 3)
end)

m:addOverride("xi.globals.effects.defender.onEffectLose", function(player, target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)

    target:delMod(xi.mod.DEF, jpLevel * 3)
    target:delMod(xi.mod.DEFP, 25)
    target:delMod(xi.mod.ATTP, -25)
    target:delMod(xi.mod.RATTP, -25)
    target:delMod(xi.mod.ENMITY_LOSS_REDUCTION, - 25)
end)

return m
