-----------------------------------
-- Zone: Inner Horutoto Ruins (192)
-----------------------------------
local ID = require('scripts/zones/Inner_Horutoto_Ruins/IDs')
require('scripts/globals/conquest')
require('scripts/globals/treasure')
require('scripts/globals/status')
-----------------------------------
local zoneObject = {}

local thfsNeckNPC =
{
    objtype = xi.objType.NPC,
    name = "???",
    look = 2295,
    x = -27.6832,
    y = -0.5,
    z = 19.2311,
    rotation = 157,
    widescan = 1,
    namevis = 0x008,
    onTrigger = function(player, npc)
        if player:getCharVar("thfsNeck") == 2 then
            player:PrintToPlayer("You find a lucky necklace made for you by Nanaa Mihgo.", xi.msg.channel.NS_SAY)
            player:setCharVar("thfsNeck", 3)
            player:addItem(xi.items.PUMMELERS_MASK_P2)
            player:messageSpecial(ID.text.ITEM_OBTAINED, xi.items.PUMMELERS_MASK_P2)
        else
            player:PrintToPlayer("You hear a voice whisper from the shadows.", xi.msg.channel.NS_SHOUT)
            player:PrintToPlayer("I wouldn't suggest taking that, it's not forrr you.", xi.msg.channel.SAY , "Nanaa Mihgo")
        end
    end,
}

zoneObject.onInitialize = function(zone)
    zone:registerTriggerArea(1, -260.7, 0, -30.2, -259.4, 1, -29.1) -- Red
    zone:registerTriggerArea(2, -264.0, 0, -24.7, -262.4, 1, -23.5) -- White
    zone:registerTriggerArea(3, -257.8, 0, -24.9, -256.1, 1, -23.5) -- Black
    zone:registerTriggerArea(4, -261, -3, 182, -257, -1, 186) -- Teleport at H-6

    -- NM Persistence
    xi.mob.nmTODPersistCache(zone, ID.mob.MALTHA)

    xi.treasure.initZone(zone)
    hxi.spawner.spawnInitialMobs(zone)
    zone:insertDynamicEntity(thfsNeckNPC)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-259.996, 6.399, 242.859, 67)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    local circle = ID.npc.PORTAL_CIRCLE_BASE
    local red    = GetNPCByID(circle)
    local white  = GetNPCByID(circle + 1)
    local black  = GetNPCByID(circle + 2)

    -- Prevent negatives..
    if triggerArea:GetCount() < 0 then
        triggerArea:AddCount(math.abs(triggerArea:GetCount()))
    end

    switch (triggerArea:GetTriggerAreaID()): caseof
    {
        [1] = function()  -- Red Circle
            if player:getMainJob() == xi.job.RDM and triggerArea:AddCount(1) == 1 then
                red:setAnimation(xi.anim.OPEN_DOOR)
                red:entityAnimationPacket("smin")
                if
                    white:getAnimation() == xi.anim.OPEN_DOOR and
                    black:getAnimation() == xi.anim.OPEN_DOOR
                then
                    GetNPCByID(circle + 3):openDoor(30)
                    GetNPCByID(circle + 4):openDoor(30)
                end
            end
        end,

        [2] = function()  -- White Circle
            if player:getMainJob() == xi.job.WHM and triggerArea:AddCount(1) == 1 then
                white:setAnimation(xi.anim.OPEN_DOOR)
                white:entityAnimationPacket("smin")
                if
                    red:getAnimation() == xi.anim.OPEN_DOOR and
                    black:getAnimation() == xi.anim.OPEN_DOOR
                then
                    GetNPCByID(circle + 3):openDoor(30)
                    GetNPCByID(circle + 4):openDoor(30)
                end
            end
        end,

        [3] = function()  -- Black Circle
            if player:getMainJob() == xi.job.BLM and triggerArea:AddCount(1) == 1 then
                black:setAnimation(xi.anim.OPEN_DOOR)
                black:entityAnimationPacket("smin")
                if
                    red:getAnimation() == xi.anim.OPEN_DOOR and
                    white:getAnimation() == xi.anim.OPEN_DOOR
                then
                    GetNPCByID(circle + 3):openDoor(30)
                    GetNPCByID(circle + 4):openDoor(30)
                end
            end
        end,

        [4] = function()  -- Teleport at H-6
            player:startEvent(47)
        end,
    }
end

zoneObject.onTriggerAreaLeave = function(player, triggerArea)
    local circle = ID.npc.PORTAL_CIRCLE_BASE
    local red    = GetNPCByID(circle)
    local white  = GetNPCByID(circle + 1)
    local black  = GetNPCByID(circle + 2)

    switch (triggerArea:GetTriggerAreaID()): caseof
    {
        [1] = function()  -- Red Circle
            if player:getMainJob() == xi.job.RDM and triggerArea:DelCount(1) == 0 then
                red:setAnimation(xi.anim.CLOSE_DOOR)
                red:entityAnimationPacket("kmin")
            end
        end,

        [2] = function()  -- White Circle
            if player:getMainJob() == xi.job.WHM and triggerArea:DelCount(1) == 0 then
                white:setAnimation(xi.anim.CLOSE_DOOR)
                white:entityAnimationPacket("kmin")
            end
        end,

        [3] = function()  -- Black Circle
            if player:getMainJob() == xi.job.BLM and triggerArea:DelCount(1) == 0 then
                black:setAnimation(xi.anim.CLOSE_DOOR)
                black:entityAnimationPacket("kmin")
            end
        end,
    }

    -- Prevent negatives
    if triggerArea:GetCount() < 0 then
        triggerArea:AddCount(math.abs(triggerArea:GetCount()))
    end
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
