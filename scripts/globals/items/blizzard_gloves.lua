-----------------------------------
-- ID: 14990
-- Blizzard Gloves
--  Enchantment: "Enblizzard"
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENBLIZZARD)
    if effect ~= nil and effect:getSubType() == 14990 then
        target:delStatusEffect(xi.effect.ENBLIZZARD)
    end
    return 0
end

itemObject.onItemUse = function(target)
    local effect = xi.effect.ENBLIZZARD
    local magicskill = target:getSkillLevel(xi.skill.ENHANCING_MAGIC)
    local potency = 0

    if magicskill <= 200 then
        potency = 3 + math.floor(6 * magicskill / 100)
    elseif magicskill > 200 then
        potency = 5 + math.floor(5 * magicskill / 100)
    end

    potency = utils.clamp(potency, 3, 25)

    target:addStatusEffect(effect, potency, 0, 180, 14990)
end

return itemObject
