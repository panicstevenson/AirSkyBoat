-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Rompaulion S Citalle
-- Involved with San d'Oria quest "Knight Stalker"
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.EVA_DOWN)
end

entity.onMobDeath = function(mob, player, optParams)
    -- check for Cleuvarion death
    if player:getCharVar("KnightStalker_Progress") == 4 and GetMobByID(mob:getID() - 1):isDead() then
        player:setCharVar("KnightStalker_Kill", 1)
    end
end

return entity
