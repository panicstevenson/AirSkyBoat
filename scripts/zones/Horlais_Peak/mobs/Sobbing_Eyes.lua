-----------------------------------
-- Area: Horlais Peak
--  Mob: Sobbing Eyes
-- BCNM: Under Observation
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.SILENCERES, 75)
    mob:setMod(xi.mod.REGAIN, 100)
end

entity.onMobWeaponSkill = function(target, mob, skill)
    if skill:getID() == 439 then
        mob:resetEnmity(target)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
