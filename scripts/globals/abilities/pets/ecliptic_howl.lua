-----------------------------------
-- Aerial Armor
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onPetAbility = function(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime

    local moon = VanadielMoonPhase()
    local accuracy = 0
    local evasion = 0

    if moon > 90 then -- Full Moon
        accuracy = 25
        evasion = 15
    elseif moon > 60 then -- Gibbous Moon
        accuracy = 21
        evasion = 18
    elseif moon > 25 then -- Quarter Moon
        accuracy = 18
        evasion = 18
    elseif moon > 10 then -- Crescent Moon
        accuracy = 16
        evasion = 21
    else -- New Moon
        accuracy = 15
        evasion = 25
    end
    target:delStatusEffect(xi.effect.ACCURACY_BOOST)
    target:delStatusEffect(xi.effect.EVASION_BOOST)
    target:addStatusEffect(xi.effect.ACCURACY_BOOST, accuracy, 0, duration)
    target:addStatusEffect(xi.effect.EVASION_BOOST, evasion, 0, duration)
    skill:setMsg(xi.msg.basic.NONE)
    return 0
end

return abilityObject
