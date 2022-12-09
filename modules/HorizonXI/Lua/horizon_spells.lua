-----------------------------------
-- HorizonXI Lua Module
-- Used to change spell luas.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

local m = Module:new("horizon_spells")

m:addOverride("xi.globals.spells.black.drain.onSpellCast", function(caster, target, spell)
    --calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
    -- also have small constant to account for 0 dark skill
    local dmg = 10 + (1.035 * caster:getSkillLevel(xi.skill.DARK_MAGIC))

    if (dmg > (caster:getSkillLevel(xi.skill.DARK_MAGIC) + 20)) then
        dmg = (caster:getSkillLevel(xi.skill.DARK_MAGIC) + 20)
    end

    --get resist multiplier (1x if no resist)
    local params = {}
    params.diff = caster:getStat(xi.mod.INT)-target:getStat(xi.mod.INT)
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.bonus = 1.0
    local resist = xi.magic.applyResistance(caster, target, spell, params)

    --get the resisted damage
    dmg = dmg * resist

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = xi.magic.addBonuses(caster, spell, target, dmg)

    --add in target adjustment
    dmg = xi.magic.adjustForTarget(target, dmg, spell:getElement())

    --add in final adjustments
    if (dmg < 0) then
        dmg = 0
    end

    if (target:isUndead()) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- No effect
        return dmg
    end

    if caster:isUndead() and target:hasStatusEffect(xi.effect.HOLY_CIRCLE)  then
        dmg = dmg / 2
    end

    dmg = xi.magic.finalMagicAdjustments(caster, target, spell, dmg)

    caster:addHP(dmg)

    return dmg
end)

m:addOverride("xi.globals.spells.black.drain_ii.onSpellCast", function(caster, target, spell)
    --calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
    -- also have small constant to account for 0 dark skill
    local dmg = 20 + (1.236 * caster:getSkillLevel(xi.skill.DARK_MAGIC))

    if (dmg > (caster:getSkillLevel(xi.skill.DARK_MAGIC) + 85)) then
        dmg = (caster:getSkillLevel(xi.skill.DARK_MAGIC) + 85)
    end

    --get resist multiplier (1x if no resist)
    local params = {}
    params.diff = caster:getStat(xi.mod.INT)-target:getStat(xi.mod.INT)
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.bonus = 1.0
    local resist = xi.magic.applyResistance(caster, target, spell, params)

    --get the resisted damage
    dmg = dmg * resist

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = xi.magic.addBonuses(caster, spell, target, dmg)

    --add in target adjustment
    dmg = xi.magic.adjustForTarget(target, dmg, spell:getElement())

    --add in final adjustments
    if (dmg < 0) then
        dmg = 0
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP()
    end

    if (target:isUndead()) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- No effect
        return dmg
    end

    if caster:isUndead() and target:hasStatusEffect(xi.effect.HOLY_CIRCLE) then
        dmg = dmg / 2
    end

    dmg = xi.magic.finalMagicAdjustments(caster, target, spell, dmg)

    local leftOver = (caster:getHP() + dmg) - caster:getMaxHP()

    if (leftOver > 0) then
        caster:addStatusEffect(xi.effect.MAX_HP_BOOST, (leftOver/caster:getMaxHP())*100, 0, 60)
    end

    dmg = xi.magic.finalMagicAdjustments(caster, target, spell, dmg)
    caster:addHP(dmg)
    spell:setMsg(xi.msg.basic.MAGIC_DRAIN_HP) --change msg to 'xxx hp drained from the yyyy.'

    return dmg
end)

m:addOverride("xi.globals.spells.black.absorb-acc.onSpellCast", function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.msg = xi.msg.basic.MAGIC_ABSORB_ACC
    params.failReturn = xi.effect.ACC_DOWN
    params.effect = xi.effect.ACC_DOWN
    params.bonusEffect = xi.effect.ACC_BOOST
    params.msgFail = xi.msg.basic.MAGIC_RESIST
    params.bonus = 0
    params.baseDuration = 90

    return xi.magic.doAbsorbSpell(caster, target, spell, params)
end)

m:addOverride("xi.globals.spells.black.absorb-agi.onSpellCast", function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.msg = xi.msg.basic.MAGIC_ABSORB_AGI
    params.failReturn = xi.effect.AGI_DOWN
    params.effect = xi.effect.AGI_DOWN
    params.bonusEffect = xi.effect.AGI_BOOST
    params.msgFail = xi.msg.basic.MAGIC_RESIST
    params.bonus = 0
    params.baseDuration = 90

    return xi.magic.doAbsorbSpell(caster, target, spell, params)
end)

m:addOverride("xi.globals.spells.black.absorb-chr.onSpellCast", function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.msg = xi.msg.basic.MAGIC_ABSORB_CHR
    params.failReturn = xi.effect.CHR_DOWN
    params.effect = xi.effect.CHR_DOWN
    params.bonusEffect = xi.effect.CHR_BOOST
    params.msgFail = xi.msg.basic.MAGIC_RESIST
    params.bonus = 0
    params.baseDuration = 90

    return xi.magic.doAbsorbSpell(caster, target, spell, params)
end)

m:addOverride("xi.globals.spells.black.absorb-dex.onSpellCast", function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.msg = xi.msg.basic.MAGIC_ABSORB_DEX
    params.failReturn = xi.effect.DEX_DOWN
    params.effect = xi.effect.DEX_DOWN
    params.bonusEffect = xi.effect.DEX_BOOST
    params.msgFail = xi.msg.basic.MAGIC_RESIST
    params.bonus = 0
    params.baseDuration = 90

    return xi.magic.doAbsorbSpell(caster, target, spell, params)
end)

m:addOverride("xi.globals.spells.black.absorb-int.onSpellCast", function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.msg = xi.msg.basic.MAGIC_ABSORB_INT
    params.failReturn = xi.effect.INT_DOWN
    params.effect = xi.effect.INT_DOWN
    params.bonusEffect = xi.effect.INT_BOOST
    params.msgFail = xi.msg.basic.MAGIC_RESIST
    params.bonus = 0
    params.baseDuration = 90

    return xi.magic.doAbsorbSpell(caster, target, spell, params)
end)

m:addOverride("xi.globals.spells.black.absorb-mnd.onSpellCast", function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.msg = xi.msg.basic.MAGIC_ABSORB_MND
    params.failReturn = xi.effect.MND_DOWN
    params.effect = xi.effect.MND_DOWN
    params.bonusEffect = xi.effect.MND_BOOST
    params.msgFail = xi.msg.basic.MAGIC_RESIST
    params.bonus = 0
    params.baseDuration = 90

    return xi.magic.doAbsorbSpell(caster, target, spell, params)
end)

m:addOverride("xi.globals.spells.black.absorb-str.onSpellCast", function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.msg = xi.msg.basic.MAGIC_ABSORB_STR
    params.failReturn = xi.effect.STR_DOWN
    params.effect = xi.effect.STR_DOWN
    params.bonusEffect = xi.effect.STR_BOOST
    params.msgFail = xi.msg.basic.MAGIC_RESIST
    params.bonus = 0
    params.baseDuration = 90

    return xi.magic.doAbsorbSpell(caster, target, spell, params)
end)

m:addOverride("xi.globals.spells.black.absorb-vit.onSpellCast", function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.msg = xi.msg.basic.MAGIC_ABSORB_VIT
    params.failReturn = xi.effect.VIT_DOWN
    params.effect = xi.effect.VIT_DOWN
    params.bonusEffect = xi.effect.VIT_BOOST
    params.msgFail = xi.msg.basic.MAGIC_RESIST
    params.bonus = 0
    params.baseDuration = 90

    return xi.magic.doAbsorbSpell(caster, target, spell, params)
end)

m:addOverride("xi.globals.spells.songs.horde_lullaby.onSpellCast", function(caster, target, spell)
    local duration = 30
    -- local pCHR = caster:getStat(xi.mod.CHR)
    -- local mCHR = target:getStat(xi.mod.CHR)
    -- local dCHR = pCHR - mCHR
    local params = {}
    params.diff = nil
    params.attribute = xi.mod.CHR
    params.skillType = xi.skill.SINGING
    params.bonus = 0
    params.effect = xi.effect.LULLABY
    local resm = xi.magic.applyResistanceEffect(caster, target, spell, params)

    if resm < 0.5 then
        spell:setMsg(xi.msg.basic.MAGIC_RESIST) -- resist message
    else
        local iBoost = caster:getMod(xi.mod.LULLABY_EFFECT) + caster:getMod(xi.mod.ALL_SONGS_EFFECT)
        duration = duration * (iBoost * 0.1 + caster:getMod(xi.mod.SONG_DURATION_BONUS) / 100 + 1) + caster:getJobPointLevel(xi.jp.LULLABY_DURATION)

        if caster:hasStatusEffect(xi.effect.TROUBADOUR) then
            duration = duration * 2
        end

        duration = duration * resm
        duration = xi.magic.calculateBuildDuration(target, duration, params.effect)

        if duration == 0 then
            spell:setMsg(xi.msg.basic.NONE)
        elseif target:addStatusEffect(xi.effect.LULLABY, 1, 0, duration) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB)
        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    end

    return xi.effect.LULLABY
end)

m:addOverride("xi.globals.spells.white.enlight.onSpellCast", function(caster, target, spell)
    return xi.spells.enhancing.useEnhancingSpell(caster, target, spell)
end)

return m
