-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Genbu
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    -- Based on tested stats found at https://docs.google.com/spreadsheets/d/1YBoveP-weMdidrirY-vPDzHyxbEI2ryECINlfCnFkLI/edit#gid=1789487472
    mob:setMod(xi.mod.SILENCERES, 90)
    mob:addMod(xi.mod.DEF, 190)
    mob:addMod(xi.mod.VIT, 84)
    mob:addMod(xi.mod.DOUBLE_ATTACK, 10)
    mob:setDamage(120)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 35)
    mob:setLocalVar('defaultATT', mob:getMod(xi.mod.ATT))
end

entity.onMobSpawn = function(mob ,target)
    GetNPCByID(ID.npc.PORTAL_TO_GENBU):setAnimation(xi.anim.CLOSE_DOOR)
    mob:SetMagicCastingEnabled(false)
end

entity.onMobEngaged = function(mob, target)
    mob:messageText(mob, ID.text.SKY_GOD_OFFSET + 5)
    mob:timer(5000, function(mobArg)
        mobArg:SetMagicCastingEnabled(true)
    end)
end

entity.onMobFight = function(mob, target)
    -- Appears to gain +10 attack per 1% HP lost
    local hp = mob:getHPP()
    local power = (100 - hp) * 10

    mob:setMod(xi.mod.ATT, mob:getLocalVar('defaultATT') + power)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENWATER)
end

entity.onMobDeath = function(mob, player, isKiller)
    if isKiller then
        mob:messageText(mob, ID.text.SKY_GOD_OFFSET + 6)
        GetNPCByID(ID.npc.PORTAL_TO_GENBU):setAnimation(xi.anim.OPEN_DOOR)
    end
end

entity.onMobDespawn = function(mob)
    GetNPCByID(ID.npc.PORTAL_TO_GENBU):setAnimation(xi.anim.OPEN_DOOR)
end

return entity
