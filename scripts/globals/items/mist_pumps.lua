-----------------------------------
-- ID: 15312
-- Item: Mist Pumps
-- Item Effect: Evasion Boost
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.EVASION_BOOST)
    if effect ~= nil and effect:getSubType() == 15312 then
        target:delStatusEffect(xi.effect.EVASION_BOOST)
    end
    return 0
end

item_object.onItemUse = function(target)
    if (not target:hasStatusEffect(xi.effect.EVASION_BOOST)) then
        target:addStatusEffect(xi.effect.EVASION_BOOST, 15, 0, 180, 15312)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return item_object
