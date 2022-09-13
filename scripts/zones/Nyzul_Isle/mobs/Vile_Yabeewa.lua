-----------------------------------
--  MOB: Vile Yabeewa
-- Area: Nyzul Isle
-- Info: Enemy Leader
-----------------------------------
require('scripts/globals/nyzul')
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.enemyLeaderKill(mob)
    end
end

return entity
