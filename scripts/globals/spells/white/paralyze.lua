-----------------------------------
-- Spell: Paralyze
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local dMND = caster:getStat(xi.mod.MND) - target:getStat(xi.mod.MND)

    -- Calculate potency.
    local potency = utils.clamp(math.floor(dMND / 4) + 15, 5, 25)
    potency = xi.magic.calculatePotency(potency, spell:getSkillType(), caster, target)

    -- Calculate duration.
    local duration = xi.magic.calculateDuration(120, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local params   = {}

    params.diff = dMND
    params.skillType = xi.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = xi.effect.PARALYSIS
    local resist = xi.magic.applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then -- There are no quarter or less hits, if target resists more than .5 spell is resisted completely
        local resduration = duration * resist

        resduration = xi.magic.calculateBuildDuration(target, duration, params.effect, caster)

        if resduration == 0 then
            spell:setMsg(xi.msg.basic.NONE)
        elseif target:addStatusEffect(params.effect, potency, 0, duration * resist) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
        else
            -- no effect
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        -- resist
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end

return spellObject
