-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(user, target, ability)
    if user:getMainJob() == xi.job.WAR then
        user:addEnmity(target, 250, 0)
    else
        user:addEnmity(target, 180, 0)
    end
end

return abilityObject
