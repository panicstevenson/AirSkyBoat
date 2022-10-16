-----------------------------------
-- ID: 15507
-- Item: Purgatory Collar
-- Item Effect: Conserve MP
-- Duration: 45 seconds
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 15507 then
        target:delStatusEffect(xi.effect.ENCHANTMENT)
    end
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 45, 15507)
end

itemObject.onEffectGain = function(target)
    -- **Power needs validation**
    target:addMod(xi.mod.CONSERVE_MP, 10)
end

itemObject.onEffectLose = function(target)
    target:delMod(xi.mod.CONSERVE_MP, 10)
end

return itemObject
