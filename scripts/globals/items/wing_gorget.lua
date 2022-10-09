-----------------------------------
-- ID: 15170
-- Item: wing gorget
-- Item Effect: gives regain
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.REGAIN)
    if effect ~= nil and effect:getSubType() == 15170 then
        target:delStatusEffect(xi.effect.REGAIN)
    end
    return 0
end

item_object.onItemUse = function(target)
    if (target:hasStatusEffect(xi.effect.REGAIN)) then
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(xi.effect.REGAIN, 5, 3, 30, 15170)
    end
end

return item_object
