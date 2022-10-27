-----------------------------------
-- ID: 15782
-- Item: Manashell Ring
-- Item Effect: MP +9
-- Duration: 3 minutes
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.MAX_MP_BOOST)
    if effect ~= nil and effect:getSubType() == 15782 then
        target:delStatusEffect(xi.effect.MAX_MP_BOOST)
    end
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.MAX_MP_BOOST, 9, 0, 180, 15782)
end

return itemObject
