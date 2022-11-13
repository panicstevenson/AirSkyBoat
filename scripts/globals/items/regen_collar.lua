-----------------------------------
-- ID: 15526
-- Item: Regen Collar
-- Item Effect: Restores 40 HP over 120 seconds
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.REGEN)
    if effect ~= nil and effect:getSubType() == 15526 then
        target:delStatusEffect(xi.effect.REGEN)
    end
    return 0
end

itemObject.onItemUse = function(target)
    if (not target:hasStatusEffect(xi.effect.REGEN)) then
        target:addStatusEffect(xi.effect.REGEN, 1, 3, 120, 15526)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
