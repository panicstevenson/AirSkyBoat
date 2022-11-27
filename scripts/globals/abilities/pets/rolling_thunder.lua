-----------------------------------
--
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, skill, summoner)
    local duration = math.min(60 + xi.summon.getSummoningSkillOverCap(pet) * 2, 180)
    local potency = math.floor((0.04 * summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC)) + xi.mobskills.getWeatherDayBonuses(pet, 5))

    local typeEffect = xi.effect.ENTHUNDER

    skill:setMsg(xi.mobskills.mobBuffMove(target, typeEffect, potency, 0, duration))

    return typeEffect
end

return abilityObject
