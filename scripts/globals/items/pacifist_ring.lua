-----------------------------------
-- ID: 14680
-- Item: Pacifist Ring
-- Item Effect: Enmity -12
-- Duration: 3 Minutes
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENMITY_DOWN)
    if effect ~= nil and effect:getSubType() == 14680 then
        target:delStatusEffect(xi.effect.ENMITY_DOWN)
    end
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ENMITY_DOWN, 12, 0, 180, 14680)
end

return itemObject
