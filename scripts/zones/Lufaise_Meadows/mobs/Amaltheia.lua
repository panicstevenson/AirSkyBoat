-----------------------------------
-- Area: Lufaise Meadows
--   NM: Amaltheia
-----------------------------------
local entity = {}

local dots =
{
    xi.effect.BURN,
    xi.effect.FROST,
    xi.effect.CHOKE,
    xi.effect.RASP,
    xi.effect.SHOCK,
    xi.effect.DROWN,
    xi.effect.DIA,
    xi.effect.BIO,
    xi.effect.REQUIEM,
    xi.effect.HELIX,
    xi.effect.POISON,
}

entity.onMobSpawn = function(mob)
    mob:setLocalVar("holyTimer", os.time() + 30)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)

    -- Dots placed on Amaltheia will immediately fall off
    mob:addListener("MAGIC_TAKE", "AMALTHEIA_MAGIC_TAKE", function(mobArg, caster, spell)
        for _,v in pairs(dots) do
            if mob:hasStatusEffect(v) then
                mob:delStatusEffect(v)
            end
        end
    end)
end

entity.onMobFight = function(mob, target)
    -- All sheep and ram in the zone assist Amaltheia
    local sheepRam = target:getZone():getMobs()
    for _, v in pairs(sheepRam) do
        if (v:getFamily() == 208 or v:getFamily() == 226) and not v:isEngaged() and not v:isNM() and not v:isPet() then
            v:updateEnmity(target)
        end
    end

    -- Cast Holy on a random target in range
    if os.time() > mob:getLocalVar("holyTimer") and mob:canUseAbilities() then
        mob:setLocalVar("holyTimer", os.time() + 30)
        local enmityList = mob:getEnmityList()
        local victim = utils.randomEntry(enmityList)["entity"]
        mob:castSpell(21, victim)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
