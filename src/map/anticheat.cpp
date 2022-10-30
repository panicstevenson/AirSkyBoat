/*
===========================================================================

  Copyright (c) 2010-2019 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "anticheat.h"
#include "map.h"
#include "packets/chat_message.h"
#include "status_effect_container.h"
#include "utils/charutils.h"
#include "utils/zoneutils.h"
#include "zone.h"

namespace anticheat
{
    // List of jail cell locations
    int32 g_jailCells[][4] = {
        // Floor 1 (Bottom)
        { -620, 11, 660, 0 },
        { -180, 11, 660, 0 },
        { 260, 11, 660, 0 },
        { 700, 11, 660, 0 },
        { -620, 11, 220, 0 },
        { -180, 11, 220, 0 },
        { 260, 11, 220, 0 },
        { 700, 11, 220, 0 },
        { -620, 11, -220, 0 },
        { -180, 11, -220, 0 },
        { 260, 11, -220, 0 },
        { 700, 11, -220, 0 },
        { -620, 11, -620, 0 },
        { -180, 11, -620, 0 },
        { 260, 11, -620, 0 },
        { 700, 11, -620, 0 },

        // Floor 2 (Top)
        { -620, -400, 660, 0 },
        { -180, -400, 660, 0 },
        { 260, -400, 660, 0 },
        { 700, -400, 660, 0 },
        { -620, -400, 220, 0 },
        { -180, -400, 220, 0 },
        { 260, -400, 220, 0 },
        { 700, -400, 220, 0 },
        { -620, -400, -220, 0 },
        { -180, -400, -220, 0 },
        { 260, -400, -220, 0 },
        { 700, -400, -220, 0 },
        { -620, -400, -620, 0 },
        { -180, -400, -620, 0 },
        { 260, -400, -620, 0 },
        { 700, -400, -620, 0 },
    };

    // Action bitmask of the cheat
    CheatAction GetCheatPunitiveAction(CheatID cheatid, char* warningmsg, size_t warningsize)
    {
        const char* fmtQuery = "SELECT action_bitmask, warning_message FROM cheat_types WHERE cheatid = %u";
        int32       ret      = sql->Query(fmtQuery, static_cast<uint32>(cheatid));

        if (ret != SQL_ERROR && sql->NumRows() != 0 && sql->NextRow() == SQL_SUCCESS)
        {
            if (warningmsg != nullptr)
            {
                memset(warningmsg, 0, warningsize);
                char* warnptr = (char*)sql->GetData(1);
                if (warnptr != nullptr)
                {
                    strncpy(warningmsg, warnptr, warningsize - 1);
                }
            }
            return (CheatAction)sql->GetUIntData(0);
        }
        return CHEAT_ACTION_NOTHING;
    }

    // Jail character
    bool JailChar(CCharEntity* PChar, uint32 cellid)
    {
        if (PChar == nullptr)
        {
            return false;
        }
        // If given cell id is invalid default to cell #1
        if ((cellid == 0) || (cellid > 32))
        {
            cellid = 1;
        }
        const char* fmtQuery = "INSERT INTO char_vars SET charid = %u, varname = '[JAIL]inJail', value = %i ON DUPLICATE KEY UPDATE value = %i;";
        sql->Query(fmtQuery, PChar->id, cellid, cellid);
        PChar->loc.p.x         = (float)g_jailCells[cellid - 1][0];
        PChar->loc.p.y         = (float)g_jailCells[cellid - 1][1];
        PChar->loc.p.z         = (float)g_jailCells[cellid - 1][2];
        PChar->loc.p.rotation  = (uint8)g_jailCells[cellid - 1][3];
        PChar->loc.destination = ZONEID::ZONE_MORDION_GAOL;
        PChar->status          = STATUS_TYPE::DISAPPEAR;
        PChar->loc.boundary    = 0;
        PChar->m_moghouseID    = 0;
        PChar->clearPacketList();
        charutils::SendToZone(PChar, 2, zoneutils::GetZoneIPP(PChar->loc.destination));
        return true;
    }

    // Log and possibly jail
    bool ReportCheatIncident(CCharEntity* PChar, CheatID cheatid, uint32 cheatarg, const char* description)
    {
        if (PChar == nullptr)
        {
            return false;
        }
        if (!settings::get<bool>("map.ANTICHEAT_ENABLED"))
        {
            return false;
        }
        // Check what we should do
        char        warningmsg[256] = { 0 };
        CheatAction action          = GetCheatPunitiveAction(cheatid, warningmsg, sizeof(warningmsg));
        if (action & CHEAT_ACTION_LOG)
        {
            // Log intgo cheat_incidents table
            const char* fmtQuery = "INSERT INTO cheat_incidents SET charid = %u, cheatid = %u, cheatarg = %u, description= '%s';";
            sql->Query(fmtQuery, PChar->id, static_cast<uint32>(cheatid), cheatarg, description != nullptr ? description : "");
        }
        if (action & CHEAT_ACTION_WARN)
        {
            // The message in the warning column in DB is sent as a system message to the offender
            PChar->pushPacket(new CChatMessagePacket(PChar, CHAT_MESSAGE_TYPE::MESSAGE_SYSTEM_1, warningmsg));
        }
        if ((action & CHEAT_ACTION_JAIL) && (!settings::get<bool>("map.ANTICHEAT_JAIL_DISABLE")))
        {
            // Send to jail only if both the cheat type requires it *and* the admin
            // has not disabled auto-jailing globally.
            JailChar(PChar);
        }
        return true;
    }

    bool DoPosHackCheck(CCharEntity* PChar, float newX, float newY, float newZ)
    {
        // clang-format off
        time_t timeNow = time(NULL);

        if (timeNow != PChar->m_charAnticheat.lastCheckTime && PChar->m_GMlevel < 2)
        {
            float new_distance   = abs(newX - PChar->loc.p.x) + abs(newZ - PChar->loc.p.z);

            /*
                diffTime is clamped to stop cheaters from AFKing for an extensive period of time
                then coming back to pos hack. The grace period is the time in seconds before the
                anticheat engages and is configurable in the settings.
            */
            uint8 diffTime = std::clamp(static_cast<int>(timeNow - PChar->m_charAnticheat.lastCheckTime), 1, static_cast<int>(settings::get<uint8>("map.ANTICHEAT_POS_HACK_GRACE")));
            float cheatThreshold = 40.f + static_cast<float>(settings::get<uint16>("map.ANTICHEAT_POS_HACK_OVERSPEED"));
            float diffDSec = ((new_distance / diffTime) * 40.f);
            PChar->m_charAnticheat.lastCheckTime = timeNow;

            bool  isMounted = PChar->isMounted();

            if (PChar->GetSpeed() > PChar->speed)
            {
                cheatThreshold *= (PChar->GetSpeed() / PChar->speed);
            }

            if (isMounted)
            {
                cheatThreshold *= 2;
            }

            if ((diffDSec > cheatThreshold) && (!PChar->isCharmed))
            {
                PChar->m_charAnticheat.overSpeedCounter++;
            }
            else
            {
                PChar->m_charAnticheat.speedResetCounter++;
            }

            if (PChar->m_charAnticheat.speedResetCounter > 55) // Cleans up overspeed counter if they have not sped for 60 syncs.
            {
                PChar->m_charAnticheat.speedResetCounter = 0;
                PChar->m_charAnticheat.overSpeedCounter  = 0;
            }

            if (PChar->m_charAnticheat.overSpeedCounter > 60 || (diffDSec > (isMounted ? 275 : 200))) // If we have sped for 60 ticks or if we went over 200 yalm/tick (Catches pos hackers).
            {
                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_POS_HACK,
                        static_cast<uint32>(diffDSec),
                        "Player is moving too fast or is teleporting. Speed has been recorded.");
                PChar->m_charAnticheat.speedResetCounter = 0;
                PChar->m_charAnticheat.overSpeedCounter  = 0;
            }
        }

        return true;
        // clang-format on
    }

    void DoFastDigCheck(CCharEntity* PChar, float newX, float newY, float newZ)
    {
        // clang-format off
        if (PChar != nullptr)
        {
            float minDigDistance      = static_cast<float>(settings::get<uint16>("main.DIG_DISTANCE_REQ"));
            time_t currentTime        = time(NULL);

            /*
                This detection method allows for 3x of consecutive fast digs until it triggers.
                This is to allow for players who may be lagging or may have framerate issues to
                not automatically trigger this system consistently.
            */
            if ((PChar->m_charDigging.lastDigT + 3.7 > currentTime) &&
                ((abs(PChar->loc.p.x - PChar->m_charDigging.lastDigX) * abs(PChar->loc.p.z - PChar->m_charDigging.lastDigZ)) > (minDigDistance * minDigDistance)))
            {
                if (PChar->m_charAnticheat.digDistGrace < 3)
                {
                    PChar->m_charAnticheat.digDistGrace++;
                    return;
                }

                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_FAST_DIG,
                                                static_cast<uint32>(std::round(abs((PChar->m_charDigging.lastDigT + 3.7) - currentTime) * 1000)),
                                                "Player is digging before the animation should have completed. Last animation time difference recorded in ms.");
            }
            else
            {
                PChar->m_charAnticheat.digDistGrace = 0;
            }

            return;
        }
        // clang-format on
    }

    void DoDigBotCheck(CCharEntity* PChar, float newX, float newY, float newZ)
    {
        // clang-format off
        if (PChar != nullptr)
        {
            anticheat::DoDigCheckSetup(PChar, true);

            /*
                Compare averages of the set of digs to determine if once the grace period
                is over if the player is below the DIG_AVG time or under the AVG_DIST amount.
                If the player is consistently under this we should report.
            */
            if ((PChar->m_charAnticheat.digCount > settings::get<uint16>("map.ANTICHEAT_DIG_GRACE_COUNT")) &&
                (((PChar->m_charAnticheat.digDiffAvg < (settings::get<uint16>("map.ANTICHEAT_DIG_AVG_THRESHOLD")))) ||
                 ((PChar->m_charAnticheat.digDistDiffAvg < (settings::get<uint16>("map.ANTICHEAT_DIG_AVG_DIST_THRESHOLD"))))))
            {
                uint32 cheatArg = PChar->m_charAnticheat.digDistDiffAvg;

                if ((PChar->m_charAnticheat.digDiffAvg < (settings::get<uint16>("map.ANTICHEAT_DIG_AVG_THRESHOLD"))))
                {
                    cheatArg = PChar->m_charAnticheat.digDiffAvg;
                }

                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_DIG_BOT,
                                cheatArg,
                                "Player is dig botting, dig times or movement are too close. Last difference recorded should be divided by 1000.");
            }

            return;
        }
        // clang-format on
    }

    void DoDigCheckSetup(CCharEntity* PChar, bool first)
    {
        // clang-format off
        if (PChar != nullptr)
        {
            if (PChar->m_charAnticheat.prevDigT_1 != 0)
            {
                PChar->m_charAnticheat.digCount++;
                PChar->m_charAnticheat.digDiffTotal     = PChar->m_charAnticheat.digDiffTotal + (uint32)std::round((PChar->m_charDigging.lastDigT - PChar->m_charAnticheat.prevDigT_1));
                PChar->m_charAnticheat.digDistDiffTotal = PChar->m_charAnticheat.digDistDiffTotal + (uint32)std::round((sqrt(abs(PChar->m_charDigging.lastDigX - PChar->m_charAnticheat.prevDigT_1) * abs(PChar->m_charDigging.lastDigZ - PChar->m_charAnticheat.prevDigZ_1))));
                PChar->m_charAnticheat.digDiffAvg       =  std::round(PChar->m_charAnticheat.digDiffTotal / PChar->m_charAnticheat.synthCount);
                PChar->m_charAnticheat.digDistDiffAvg   =  std::round(PChar->m_charAnticheat.digDistDiffTotal / PChar->m_charAnticheat.digCount);

            }

            PChar->m_charAnticheat.prevDigT_1 = PChar->m_charDigging.lastDigT;
            PChar->m_charAnticheat.prevDigX_1 = PChar->m_charDigging.lastDigX;
            PChar->m_charAnticheat.prevDigZ_1 = PChar->m_charDigging.lastDigZ;

            return;
        }
        // clang-format on
    }

    void DoCraftBotCheck(CCharEntity* PChar, time_t currentTime)
    {
        // clang-format off
        if (PChar != nullptr)
        {
            uint8 craftAnimTime = 10; // Craft animation is 10 seconds long.

            /*
                Check for addons like crafty with auto-recipe swapping.
                Players should not be able to swap recipes in under 10s.
            */
            if ((PChar->m_charAnticheat.lastSynthReq != PChar->m_charCrafting.lastSynthReq) && ((abs(currentTime - PChar->m_charAnticheat.lastSynthStart)) < (settings::get<uint8>("map.ANTICHEAT_CRAFT_SWAP_TIME") + craftAnimTime)))
            {
                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_CRAFT_BOT,
                                                static_cast<uint32>(std::round(abs((currentTime - PChar->m_charAnticheat.lastSynthStart) - craftAnimTime))),
                                                "Player swapped crafts in under alloted and is using crafty to auto recipe swap. Recipe start time diff has been recorded in seconds.");
                anticheat::GetCheatPunitiveAction(anticheat::CheatID::CHEAT_ID_CRAFT_BOT, nullptr, 1);
            }

            /*
                Check for addons like crafty or synthall where it will
                auto-craft using packet injection which keeps the synth
                start times the same. We take the diff between each prev
                start time and see if it is under what human error could
                be (1s). By doing this accross 6 crafts, this elimates the
                chance this is an in-game macro.
            */
            if ((PChar->m_charAnticheat.synthCount > settings::get<uint16>("map.ANTICHEAT_CRAFT_COUNT")) && (PChar->m_charAnticheat.synthTimeDiffAvg < (uint32)(settings::get<float>("map.ANTICHEAT_CRAFT_TIME_AVG") * 1000)))
            {
                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_AUTO_CRAFT,
                                PChar->m_charAnticheat.synthTimeDiffAvg,
                                "Player did multiple crafts with low variance, likely using an auto craft bot. Average start time diff has been recorded in ms.");
                anticheat::GetCheatPunitiveAction(anticheat::CheatID::CHEAT_ID_AUTO_CRAFT, nullptr, 1);
            }
        }
        // clang-format on
    }

    void DoCraftBotSetup(CCharEntity* PChar, time_t currentTime)
    {
        // clang-format off
        if (PChar != nullptr)
        {
            if (PChar->m_charAnticheat.lastSynthStart != 0)
            {
                PChar->m_charAnticheat.synthStartTotal  = PChar->m_charAnticheat.synthStartTotal + (currentTime - PChar->m_charAnticheat.lastSynthStart);
                PChar->m_charAnticheat.synthCount++;
                PChar->m_charAnticheat.synthTimeDiffAvg = (uint32)std::round((PChar->m_charAnticheat.synthStartTotal * 1000) / PChar->m_charAnticheat.synthCount);
            }

            PChar->m_charAnticheat.lastSynthStart = currentTime;
            PChar->m_charAnticheat.lastSynthReq   = PChar->m_charCrafting.lastSynthReq;
        }
        // clang-format on
    }

    bool DoFishBotCheck(CCharEntity* PChar)
    {
        // clang-format off
        if (PChar != nullptr)
        {
            time_t currentTime = time(NULL);

            if (PChar->m_charAnticheat.firstFishingStrike == 0)
            {
                PChar->m_charAnticheat.firstFishingStrike = currentTime;
                PChar->m_charAnticheat.fishingStikes++;

                return false;
            }
            else if ((PChar->m_charAnticheat.firstFishingStrike + 360) < currentTime)
            {
                PChar->m_charAnticheat.firstFishingStrike = currentTime;
                PChar->m_charAnticheat.fishingStikes      = 1;

                return false;
            }

            if (PChar->m_charAnticheat.fishingStikes >= settings::get<uint16>("map.ANTICHEAT_FISHING_GRACE"))
            {
                PChar->m_charAnticheat.fishingStikes++;

                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_FISH_BOT,
                                                static_cast<uint32>(PChar->m_charAnticheat.fishingStikes),
                                                "Player is either fishing packet manipulating or running a fish bot. Number of strikes has been recorded.");

                return true;
            }
        }

        return false;
        // clang-format on
    }

} // namespace anticheat
