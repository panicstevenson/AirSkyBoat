-----------------------------------
-- ID: 15681
-- Item: hydra_spats
-- Item Effect: Eva +15
-- Duration: 20 Minutes
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.EVASION_BOOST)
    if effect ~= nil and effect:getSubType() == 15681 then
        target:delStatusEffect(xi.effect.EVASION_BOOST)
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.EVASION_BOOST, 15, 0, 1200, 15681)
end

return item_object
