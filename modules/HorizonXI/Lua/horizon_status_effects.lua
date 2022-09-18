-----------------------------------
-- HorizonXI Lua Module
-- Used to change ability luas.
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
require("scripts/globals/jobpoints")
-----------------------------------

local m = Module:new("horizon_status_effects")

m:addOverride("xi.globals.effects.defender.onEffectGain", function(target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)

    target:addMod(xi.mod.DEFP, 25)
    target:addMod(xi.mod.RATTP, -25)
    target:addMod(xi.mod.ATTP, -25)
    target:addMod(xi.mod.ENMITY_LOSS_REDUCTION, - 25)

    -- JP Bonus
    target:addMod(xi.mod.DEF, jpLevel * 3)
end)

m:addOverride("xi.globals.effects.defender.onEffectLose", function(target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)

    target:delMod(xi.mod.DEF, jpLevel * 3)
    target:delMod(xi.mod.DEFP, 25)
    target:delMod(xi.mod.ATTP, -25)
    target:delMod(xi.mod.RATTP, -25)
    target:delMod(xi.mod.ENMITY_LOSS_REDUCTION, - 25)
end)

m:addOverride("xi.globals.effects.holy_circle.onEffectGain", function(target, effect)
    target:addMod(xi.mod.UNDEAD_KILLER, effect:getPower())
    if effect:getPower() >= 15 then
        target:addMod(xi.mod.DMG_AGAINST_UNDEAD_MULT, 10)
        target:addMod(xi.mod.UNDEAD_MITIGATION_MULT, 5)
    else
        target:addMod(xi.mod.DMG_AGAINST_UNDEAD_MULT, 5)
    end
end)

m:addOverride("xi.globals.effects.holy_circle.onEffectLose", function(target, effect)
    target:delMod(xi.mod.UNDEAD_KILLER, effect:getPower())
    if effect:getPower() >= 15 then
        target:delMod(xi.mod.DMG_AGAINST_UNDEAD_MULT, 10)
        target:delMod(xi.mod.UNDEAD_MITIGATION_MULT, 5)
    else
        target:delMod(xi.mod.DMG_AGAINST_UNDEAD_MULT, 5)
    end
end)

m:addOverride("xi.globals.effects.warding_circle.onEffectGain", function(target, effect)
    target:addMod(xi.mod.DEMON_KILLER, effect:getPower())
    if effect:getPower() >= 15 then
        target:addMod(xi.mod.DMG_AGAINST_DEMON_MULT, 10)
        target:addMod(xi.mod.DEMON_MITIGATION_MULT, 5)
    else
        target:addMod(xi.mod.DMG_AGAINST_DEMON_MULT, 5)
    end
end)

m:addOverride("xi.globals.effects.warding_circle.onEffectLose", function(target, effect)
    target:delMod(xi.mod.DEMON_KILLER, effect:getPower())
    if effect:getPower() >= 15 then
        target:delMod(xi.mod.DMG_AGAINST_DEMON_MULT, 10)
        target:delMod(xi.mod.DEMON_MITIGATION_MULT, 5)
    else
        target:delMod(xi.mod.DMG_AGAINST_DEMON_MULT, 5)
    end
end)

m:addOverride("xi.globals.effects.ancient_circle.onEffectGain", function(target, effect)
    target:addMod(xi.mod.DRAGON_KILLER, effect:getPower())
    if effect:getPower() >= 15 then
        target:addMod(xi.mod.DMG_AGAINST_DRAGON_MULT, 10)
        target:addMod(xi.mod.DRAGON_MITIGATION_MULT, 5)
    else
        target:addMod(xi.mod.DMG_AGAINST_DRAGON_MULT, 5)
    end
end)

m:addOverride("xi.globals.effects.ancient_circle.onEffectLose", function(target, effect)
    target:delMod(xi.mod.DRAGON_KILLER, effect:getPower())
    if effect:getPower() >= 15 then
        target:delMod(xi.mod.DMG_AGAINST_DRAGON_MULT, 10)
        target:delMod(xi.mod.DRAGON_MITIGATION_MULT, 5)
    else
        target:delMod(xi.mod.DMG_AGAINST_DRAGON_MULT, 5)
    end
end)

m:addOverride("xi.globals.effects.arcane_circle.onEffectGain", function(target, effect)
    target:addMod(xi.mod.ARCANA_KILLER, effect:getPower())
    if effect:getPower() >= 15 then
        target:addMod(xi.mod.DMG_AGAINST_ARCANA_MULT, 10)
        target:addMod(xi.mod.ARCANA_MITIGATION_MULT, 5)
    else
        target:addMod(xi.mod.DMG_AGAINST_ARCANA_MULT, 5)
    end
end)

m:addOverride("xi.globals.effects.arcane_circle.onEffectLose", function(target, effect)
    target:delMod(xi.mod.ARCANA_KILLER, effect:getPower())
    if effect:getPower() >= 15 then
        target:delMod(xi.mod.DMG_AGAINST_ARCANA_MULT, 10)
        target:delMod(xi.mod.ARCANA_MITIGATION_MULT, 5)
    else
        target:delMod(xi.mod.DMG_AGAINST_ARCANA_MULT, 5)
    end
end)

return m
