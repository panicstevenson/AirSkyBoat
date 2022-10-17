-----------------------------------
-- ID: 15610
-- Item: sturdy_trousers
-- Item Effect: HP +10
-- Duration: 30 Minutes
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.MAX_HP_BOOST)
    if effect ~= nil and effect:getSubType() == 15610 then
        target:delStatusEffect(xi.effect.MAX_HP_BOOST)
    end
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.MAX_HP_BOOST, 10, 0, 1800, 15610)
end

return itemObject
