-----------------------------------
-- ID:18220
-- Item: Prominence Axe
-- Enchantment: Enfire
-- Duration: 3 minutes
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENFIRE)
    if effect ~= nil and effect:getSubType() == 18220 then
        target:delStatusEffect(xi.effect.ENFIRE)
    end
    return 0
end

itemObject.onItemUse = function(target)
    local effect = xi.effect.FIRE
    local magicskill = target:getSkillLevel(xi.skill.ENHANCING_MAGIC)
    local potency = 0

    if magicskill <= 200 then
        potency = 3 + math.floor(6 * magicskill / 100)
    elseif magicskill > 200 then
        potency = 5 + math.floor(5 * magicskill / 100)
    end

    potency = utils.clamp(potency, 3, 25)

    target:addStatusEffect(effect, potency, 0, 180, 18220)
end

return itemObject
