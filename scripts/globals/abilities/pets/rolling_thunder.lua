-----------------------------------
--
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onPetAbility = function(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 120 + bonusTime

    local potency = math.floor((0.04 * summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC)) + xi.mobskills.getWeatherDayBonuses(pet, 5))

    local typeEffect = xi.effect.ENTHUNDER

    skill:setMsg(xi.mobskills.mobBuffMove(target, typeEffect, potency, 0, duration))

    return typeEffect
end

return ability_object
