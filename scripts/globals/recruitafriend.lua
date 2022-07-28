--------------------------------------------------
--        Horizon Recruit a Friend System       --
--------------------------------------------------

xi.horizon = xi.horizon or {}

local recruiterRewards =
{
    [30] =
    {
        [1]  = {1},
        [2]  = {2},
        [3]  = {3},
        [4] = {4},
    },
    [60] =
    {
        [1]  = {1},
        [2]  = {2},
        [3]  = {3},
        [4] = {4},
    },
    [90] =
    {
        [1]  = {1},
        [2]  = {2},
        [3]  = {3},
        [4] = {4},
    },
    [120] =
    {
        [1]  = {1},
        [2]  = {2},
        [3]  = {3},
        [4] = {4},
    },
    [150] =
    {
        [1]  = {1},
        [2]  = {2},
        [3]  = {3},
        [4] = {4},
    },
    [180] =
    {
        [1]  = {1},
        [2]  = {2},
        [3]  = {3},
        [4] = {4},
    },
}

local recruitRewards =
{
    [30]  = {1},
    [60]  = {2},
    [90]  = {3},
    [120] = {4},
    [150] = {5},
    [180] = {6},
}

local timeSort = {30, 60, 90, 120}

xi.horizon.rafOnTrigger = function(player, npc)
    if player:getCharVar("[RAF]SavedItem") ~= 0 then
        xi.horizon.rafAddRewards(player, npc, player:getCharVar("[RAF]SavedItem"))
    elseif player:getPartySize() == 2 then
        local party = player:getParty()
        local timeRedeemed = 0
        local rafMember
        local rafReward
        local recruiterReward
        local timePeriod = 0

        if player:getWorldpassId(party[2]:getID()) ~= 0 then
            rafMember = party[2]
            timeRedeemd = rafMember:getWorldPassRedeemTime()
        else
            xi.horizon.rafStandardText(player, npc)
        end

        if timeRedeemed ~= 0 and timeRedeemed ~= nil then
            local rewardsGiven =
            {
                [30]  = player:getCharVar(string.format("[RAF]Reward_30_%s", rafMember:getID())),
                [60]  = player:getCharVar(string.format("[RAF]Reward_60_%s", rafMember:getID())),
                [90]  = player:getCharVar(string.format("[RAF]Reward_90_%s", rafMember:getID())),
                [120] = player:getCharVar(string.format("[RAF]Reward_120_%s", rafMember:getID())),
                [150] = player:getCharVar(string.format("[RAF]Reward_150_%s", rafMember:getID())),
                [180] = player:getCharVar(string.format("[RAF]Reward_180_%s", rafMember:getID())),
            }

            for _, sort in pairs(timeSort) do
                if timeRedeemed >= sort and not rewardsGiven[sort] then
                    timePeriod = sort
                    rafReward = recruitRewards[timePeriod]
                    break
                end
            end

            for _, reward in pairs(recruiterRewards[timePeriod]) do
                if not player:hasItem(reward) then
                    recruiterReward = reward
                end
            end

            if recruiterReward and rafReward then
                player:PrintToPlayer(string.format("Congratuations on being with %s for %s days! To celebrate your time on HorizonXI you have been given a %s!", rafMember:getName(), timePeriod, recruiterReward[2]), xi.msg.channel.SAY, npc:getName())
                player:PrintToPlayer("Thanks for playing on HorizonXI!", xi.msg.channel.SAY, npc:getName())
                xi.horizon.rafAddRewards(player, npc, recruiterReward[1])
                rafMember:PrintToPlayer(string.format("Congratuations on being with %s for %s days! To celebrate your time on HorizonXI you have been given a %s!", player:getName(), timePeriod, rafReward[2]), xi.msg.channel.SAY, npc:getName())
                rafMember:PrintToPlayer("Thanks for playing on HorizonXI!", xi.msg.channel.SAY, npc:getName())
                xi.horizon.rafAddRewards(rafMember, npc, rafReward[1])
            else
                player:PrintToPlayer("Oops! Looks like you haven't waited long enough, check back in a few days to see if you got a new reward!", xi.msg.channel.SAY, npc:getName())
                rafMember:PrintToPlayer("Oops! Looks like you haven't waited long enough, check back in a few days to see if you got a new reward!", xi.msg.channel.SAY, npc:getName())
            end
        end
    else
        xi.horizon.rafStandardText(player, npc)
    end
end

xi.horizon.rafStandardText = function(player, npc)
    player:PrintToPlayer("Hello! If you are interested in recruiting a friend to HorizonXI, you can purchase Gold World Passes on horizonxi.com for 10,000 gil.", xi.msg.channel.SAY, npc:getName())
    player:PrintToPlayer("We are always excited when our adventurers choose to find their friends here, so we provide different rewards for the time you have played together!", xi.msg.channel.SAY, npc:getName())
    player:PrintToPlayer("With a gold world pass, you will be able to get special rewards at 30, 60, 90, and 120 days of playing together.", xi.msg.channel.SAY, npc:getName())
    player:PrintToPlayer("Another positive of a Gold World Pass is that you will get as much EXP as your lowest Recruit A Friend while level synced!", xi.msg.channel.SAY, npc:getName())
    player:PrintToPlayer("If you are in a party with your recruit a friend, you can receive your rewards by talking with me!", xi.msg.channel.SAY, npc:getName())
end

xi.horizon.rafAddRewards = function(player, npc, rewardId)
    if player:getFreeSlotsCount() > 0 then
        player:addItem(rewardId, 1)
        player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, rewardId)
        player:setCharVar("[RAF]SavedItem", 0)
    else
        player:setCharVar("[RAF]SavedItem", rewardId)
        player:PrintToPlayer("Oops! Looks like you don't have enough free inventory space. You can talk to me again while in a party with your buddy to get your item!", xi.msg.channel.SAY, npc:getName())
    end
end
