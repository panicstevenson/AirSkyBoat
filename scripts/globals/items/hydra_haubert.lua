-----------------------------------
-- ID: 14517
-- Item: Hydra Haubert
-- Item Effect: gives refresh
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.REFRESH)
    if effect ~= nil and effect:getSubType() == 14517 then
    end
        target:delStatusEffect(xi.effect.REFRESH)
    return 0
end

itemObject.onItemUse = function(target)
    if (target:hasStatusEffect(xi.effect.REFRESH)) then
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(xi.effect.REFRESH, 4, 3, 180, 14517)
    end
end

return itemObject
