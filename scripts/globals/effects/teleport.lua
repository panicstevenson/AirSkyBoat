-----------------------------------
-- xi.effect.TELEPORT
-----------------------------------
require("scripts/globals/teleports")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    local destination = effect:getPower()

    -- Dismount player if they are teleported
    if target:hasStatusEffect(xi.effect.MOUNTED) then
        target:delStatusEffect(xi.effect.MOUNTED)
    end

    if (target:isMob()) then
        DespawnMob(target:getID())
    elseif (destination == xi.teleport.id.WARP) then
        target:warp()
    elseif (destination == xi.teleport.id.ESCAPE) then
        xi.teleport.escape(target)
    elseif (destination == xi.teleport.id.OUTPOST) then
        local region = effect:getSubPower()
        xi.teleport.toOutpost(target, region)
    elseif (destination == xi.teleport.id.LEADER) then
        xi.teleport.toLeader(target)
    elseif (destination == xi.teleport.id.HOME_NATION) then
        xi.teleport.toHomeNation(target)
    elseif (destination == xi.teleport.id.RETRACE) then
        xi.teleport.toAlliedNation(target)
    else
        xi.teleport.to(target, destination)
    end
end

return effect_object
