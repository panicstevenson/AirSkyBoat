-----------------------------------------
-- ID: 5268
-- Item: CCB Polymer Pump
-- Used during CoP 6-4 One To Be Feared on Ultima or Omega to inflict a 1 minute amnesia
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, player)
    local result = xi.msg.basic.ITEM_UNABLE_TO_USE

    if (target:getName() == "Omega" or target:getName() == "Ultima") and not target:hasStatusEffect(xi.effect.AMNESIA) then
        result = 0
    elseif target:checkDistance(player) > 10 then
        result = xi.msg.basic.TOO_FAR_AWAY
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.AMNESIA, 1, 0, 60)
end

return itemObject
