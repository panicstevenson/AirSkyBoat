-----------------------------------
-- Marionette Dice (4 & 10)
-- Description: Restores HP and MP to player
-- Type: Magical
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local amount = 150

    mob:timer(5000, function(mobArg)
        target:addHP(amount)
        target:addMP(amount)
        target:wakeUp()
    end)

    skill:setMsg(xi.msg.basic.RECOVERS_HP_AND_MP)
    return amount
end

return mobskill_object
