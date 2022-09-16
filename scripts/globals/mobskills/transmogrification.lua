-----------------------------------
--  Transmogrification
--
--  Description: Activates a shield to absorb all incoming physical damage.
--  Type: Physical
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() == 0 then
        return 0
    end
    return 1
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    mob:setMod(xi.mod.PHYS_ABSORB, 1000)
    mob:timer(1000 * math.random(28, 32), function(mobArg)
        mobArg:delMod(xi.mod.PHYS_ABSORB, 1000)
    end)

    skill:setMsg(xi.msg.basic.NONE)

    return 0
end

return mobskill_object
