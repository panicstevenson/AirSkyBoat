-----------------------------------------------
-- Global Damage Taken Calculation
-----------------------------------------------
require("scripts/globals/status")

xi = xi or {}
xi.damage = {} or xi.damage

local dmgMods =
{
    [xi.attackType.PHYSICAL] =
    {
        { mod = xi.mod.DMGPHYS, min = -0.5, max = 1000 },
        { mod = xi.mod.DMGPHYS_II, min = -0.5, max = 1000 },
        { mod = xi.mod.UDMGPHYS },
        { mod = xi.mod.DMG },
    },
    [xi.attackType.MAGICAL] =
    {
        { mod = xi.mod.DMGMAGIC, min = -0.5, max = 1000 },
        { mod = xi.mod.DMGMAGIC_II, min = -0.5, max = 1000 },
        { mod = xi.mod.UDMGMAGIC },
        { mod = xi.mod.DMG },
    },
    [xi.attackType.BREATH] =
    {
        { mod = xi.mod.DMGBREATH, min = -0.5, max = 1000 },
        { mod = xi.mod.UDMGBREATH },
        { mod = xi.mod.DMG },
    },
    [xi.attackType.RANGED] =
    {
        { mod = xi.mod.DMGRANGE, min = -0.5, max = 1000 },
        { mod = xi.mod.UDMGRANGE },
        { mod = xi.mod.DMG },
    },
    [xi.attackType.SPECIAL] =
    {
        { mod = xi.mod.DMG },
    },
    [xi.attackType.NONE] =
    {
        { mod = xi.mod.DMG },
    },
}

xi.damage.applyDamageTaken = function(target, dmg, attackType)
    local dmgTakenMod = 0

    for _, mod in pairs(dmgMods[attackType]) do
        if mod.min ~= nil then
            dmgTakenMod = dmgTakenMod + utils.clamp(target:getMod(mod.mod) / 10000, mod.min, mod.max)
        else
            dmgTakenMod = dmgTakenMod + (target:getMod(mod.mod) / 10000)
        end
    end

    dmgTakenMod = utils.clamp(dmgTakenMod, -1, 1000)

    return utils.clamp(dmg * (1 + dmgTakenMod), 0, 99999)
end

xi.damage.returnDamageTakenMod = function(target, attackType)
    local dmgTakenMod = 0

    for _, mod in pairs(dmgMods[attackType]) do
        if mod.min ~= nil then
            dmgTakenMod = dmgTakenMod + utils.clamp(target:getMod(mod.mod) / 10000, mod.min, mod.max)
        else
            dmgTakenMod = dmgTakenMod + (target:getMod(mod.mod) / 10000)
        end
    end

    return utils.clamp(dmgTakenMod, -1, 1000) + 1
end

xi.damage.handleCircleBonuses = function(attacker, defender, damage)
    local circleMod =
    {
        [xi.eco.UNDEAD] = { offensiveBonus = xi.mod.DMG_AGAINST_UNDEAD_MULT, defensiveBonus = xi.mod.UNDEAD_MITIGATION_MULT },
        [xi.eco.DEMON] =  { offensiveBonus = xi.mod.DMG_AGAINST_DEMON_MULT , defensiveBonus = xi.mod.DEMON_MITIGATION_MULT  },
        [xi.eco.DRAGON] = { offensiveBonus = xi.mod.DMG_AGAINST_DRAGON_MULT, defensiveBonus = xi.mod.DRAGON_MITIGATION_MULT },
        [xi.eco.ARCANA] = { offensiveBonus = xi.mod.DMG_AGAINST_ARCANA_MULT, defensiveBonus = xi.mod.ARCANA_MITIGATION_MULT },
    }

    if defender:isMob() then
        for eco, mods in pairs(circleMod) do
            if defender:getSystem() == eco and attacker:getMod(mods.offensiveBonus) > 0 then
                return damage * ((100 + attacker:getMod(mods.offensiveBonus)) / 100)
            end
        end
    end

    if defender:isPC() then
        for eco, mods in pairs(circleMod) do
            if attacker:getSystem() == eco and defender:getMod(mods.defensiveBonus) > 0 then
                return damage * ((100 - defender:getMod(mods.defensiveBonus)) / 100)
            end
        end
    end

    return damage
end
