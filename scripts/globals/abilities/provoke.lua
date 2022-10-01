-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(user, target, ability)
    if user:getMainJob() == xi.job.WAR then
        user:addEnmity(target, 250, 0)
    else
        user:addEnmity(target, 180, 0)
    end
end

return ability_object
