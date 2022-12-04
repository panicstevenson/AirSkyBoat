-----------------------------------
-- Spell: Drown
-- Deals water damage that lowers an enemy's strength and gradually reduces its HP.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:getStatusEffect(xi.effect.SHOCK) ~= nil then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        -- local dINT = caster:getStat(xi.mod.INT)-target:getStat(xi.mod.INT)
        local params = {}
        params.diff = nil
        params.attribute = xi.mod.INT
        params.skillType = xi.skill.ELEMENTAL_MAGIC
        params.bonus = 0
        params.effect = nil
        params.tier = 1

        if not xi.magic.differentEffect(caster, target, spell, params) then
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
            return params.effect
        end

        local resist = xi.magic.applyResistance(caster, target, spell, params)
        if resist <= 0.125 then
            spell:setMsg(xi.msg.basic.MAGIC_RESIST)
        else
            if target:getStatusEffect(xi.effect.BURN) ~= nil then
                target:delStatusEffect(xi.effect.BURN)
            end

            local sINT = caster:getStat(xi.mod.INT)
            local DOT = xi.magic.getElementalDebuffDOT(sINT)
            local effect = target:getStatusEffect(xi.effect.DROWN)
            local noeffect = false
            if effect ~= nil then
                if effect:getPower() >= DOT then
                    noeffect = true
                end
            end

            if noeffect then
                spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
            else
                if effect ~= nil then
                    target:delStatusEffect(xi.effect.DROWN)
                end

                spell:setMsg(xi.msg.basic.MAGIC_ENFEEB)
                local duration = math.floor(xi.settings.main.ELEMENTAL_DEBUFF_DURATION * resist)
                duration = duration + caster:getMerit(xi.merit.ELEMENTAL_DEBUFF_DURATION)

                local mbonus = caster:getMerit(xi.merit.ELEMENTAL_DEBUFF_EFFECT)
                DOT = DOT + mbonus / 2 -- Damage

                target:addStatusEffect(xi.effect.DROWN, DOT, 3, duration, 0, params.tier)
            end
        end
    end

    return xi.effect.DROWN
end

return spellObject
