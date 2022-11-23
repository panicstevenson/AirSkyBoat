-----------------------------------------
-- ID: 15554
-- Item: Pelican Ring
-- Fishing Skillup Rate increase
-----------------------------------------
-- Duration: 20:00 min
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if target:getMod(xi.mod.PELICAN_RING_EFFECT) >= 2 then -- Can stack effects of 2 rings
        result = xi.msg.basic.ITEM_UNABLE_TO_USE_2
    end
    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 1200)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.PELICAN_RING_EFFECT, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.PELICAN_RING_EFFECT, 1)
end

return itemObject
