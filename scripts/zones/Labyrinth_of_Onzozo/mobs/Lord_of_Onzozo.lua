-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Lord of Onzozo
-----------------------------------
mixins = { require("scripts/mixins/rage") }
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 60)
    mob:addMod(xi.mod.MACC, 100)
    mob:addMod(xi.mod.SILENCERES, 80)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

entity.onMobEngaged = function(mob)
    mob:setLocalVar('timeCall', os.time() + 60)
end

entity.onMobFight = function(mob, target)
    local mantas = target:getZone():getMobs()
    local timeCaller = mob:getLocalVar('timeCall')
    local players = target:getAlliance()
    local drawInWait = mob:getLocalVar("DrawInWait")

    if os.time() > timeCaller then
        for _, v in pairs(mantas) do
            if v:getFamily() == 218 and not v:isEngaged() and not v:isNM() and not v:isPet() then
                v:updateEnmity(target)
            end
        end

        for _, player in pairs(players) do
            player:PrintToPlayer("The Lord of Onzozo summons its peons...", xi.msg.channel.NS_SAY)
        end

        mob:setLocalVar('timeCall', os.time() + 300)
    end

    if target:getZPos() > -51 and os.time() > drawInWait then -- North Tunnel Draw In
        local rot = target:getRotPos()
        target:setPos(-43, 15.15, -59.76, rot)
        mob:messageBasic(232, 0, 0, target)
        mob:setLocalVar("DrawInWait", os.time() + 2)
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    local params = {}
    params.chance = 100
    params.damage = math.random(20, 50)
    params.duration = math.random(4, 8) -- Based on captures
    return xi.mob.onAddEffect(mob, target, params.damage, xi.mob.ae.ENWATER, params)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 774, 1, xi.regime.type.GROUNDS)
end

return entity
