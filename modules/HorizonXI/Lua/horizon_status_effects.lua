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
    target:addMod(xi.mod.DEFP, 25)
    target:addMod(xi.mod.RATTP, -25)
    target:addMod(xi.mod.ATTP, -25)
    target:addMod(xi.mod.ENMITY_LOSS_REDUCTION, - 25)
    target:addMod(xi.mod.SHIELDBLOCKRATE, 10)
end)

m:addOverride("xi.globals.effects.defender.onEffectLose", function(target, effect)
    target:delMod(xi.mod.DEFP, 25)
    target:delMod(xi.mod.ATTP, -25)
    target:delMod(xi.mod.RATTP, -25)
    target:delMod(xi.mod.ENMITY_LOSS_REDUCTION, - 25)
    target:delMod(xi.mod.SHIELDBLOCKRATE, - 10)
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

m:addOverride("xi.globals.effects.enlight.onEffectGain", function(target, effect)
    target:addMod(xi.mod.ENMITY, 10)
    target:addMod(xi.mod.ENSPELL, xi.magic.element.LIGHT)
    target:addMod(xi.mod.ENSPELL_DMG, effect:getPower())
    target:addMod(xi.mod.ACC, effect:getPower())
end)

m:addOverride("xi.globals.effects.enlight.onEffectTick", function(target, effect)
end)

m:addOverride("xi.globals.effects.enlight.onEffectLose", function(target, effect)
    local lightEffect_size = effect:getPower()
    target:delMod(xi.mod.ENMITY, 10)
    target:setMod(xi.mod.ENSPELL_DMG, 0)
    target:setMod(xi.mod.ENSPELL, 0)
    if lightEffect_size > 0 then
        target:delMod(xi.mod.ACC, effect:getPower())
    end
end)

m:addOverride("xi.globals.effects.perfect_dodge.onEffectGain", function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.PERFECT_DODGE_EFFECT)
    target:addMod(xi.mod.ACC, 999)
    target:addMod(xi.mod.RACC, 999)
    target:addMod(xi.mod.MEVA, jpValue * 3)
end)

m:addOverride("xi.globals.effects.enlight.onEffectTick", function(target, effect)
end)

m:addOverride("xi.globals.effects.enlight.onEffectLose", function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.PERFECT_DODGE_EFFECT)
    target:delMod(xi.mod.ACC, 999)
    target:delMod(xi.mod.RACC, 999)
    target:delMod(xi.mod.MEVA, jpValue * 3)
end)

m:addOverride("xi.globals.effects.camouflage.onEffectGain", function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.CAMOUFLAGE_EFFECT)
    target:addMod(xi.mod.ENMITY, -25)
    target:addMod(xi.mod.CRITHITRATE, jpValue)
end)

m:addOverride("xi.globals.effects.camouflage.onEffectTick", function(target, effect)
end)

m:addOverride("xi.globals.effects.camouflage.onEffectLose", function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.CAMOUFLAGE_EFFECT)
    target:delMod(xi.mod.ENMITY, -25)
    target:delMod(xi.mod.CRITHITRATE, jpValue)
end)

return m
