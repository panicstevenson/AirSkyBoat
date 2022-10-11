-----------------------------------
-- ID: 18067
-- Equip: Keen Zaghnal
--  Enchantment: Accuracy +3
-- Enchantment will wear off if weapon is unequipped.
--  Effect lasts for 30 minutes
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ACCURACY_BOOST)
    if effect ~= nil and effect:getSubType() == 18067 then
        target:delStatusEffect(xi.effect.ACCURACY_BOOST)
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ACCURACY_BOOST, 3, 0, 1800, 18067)
end

return item_object
