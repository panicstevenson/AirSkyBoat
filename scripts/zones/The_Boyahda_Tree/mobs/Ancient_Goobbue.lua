-----------------------------------
-- Area: The Boyahda Tree
--   NM: Ancient Goobbue
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    mob:setMod(xi.mod.CRITHITRATE, 25)
end

entity.onMobSpawn = function(mob)
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = xi.jsa.HUNDRED_FISTS, cooldown = 60, hpp = math.random(85, 95) },
        },
    })
    mob:setMobMod(xi.mobMod.DRAW_IN, 1)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.nmTODPersist(mob, math.random(132, 138) * 600) -- 22 to 23 hours in 10 minute windows
end

return entity
