-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Patripatan
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:addMod(xi.mod.REGAIN, 50) -- "fairly potent Regain effect"
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PARALYZE)
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 269)
    xi.regime.checkRegime(player, mob, 63, 1, xi.regime.type.FIELDS)
end

return entity
