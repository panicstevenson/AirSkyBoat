-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Sozu Rogberry
-----------------------------------
require("scripts/globals/hunts")
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.CLAIMSHIELD, 4000)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 390)
end

return entity
