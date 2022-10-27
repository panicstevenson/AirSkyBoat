-----------------------------------
-- ID: 15290
-- Item: Haste Belt
-- Item Effect: 10% haste
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.HASTE)
    if effect ~= nil and effect:getSubType() == 15290 then
        target:delStatusEffect(xi.effect.HASTE)
    end
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.HASTE) then
        target:addStatusEffect(xi.effect.HASTE, 1000, 0, 180, 15290)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
