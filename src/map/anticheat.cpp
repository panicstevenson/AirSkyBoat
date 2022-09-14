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
        const char* fmtQuery = "INSERT INTO char_vars SET charid = %u, varname = 'inJail', value = %i ON DUPLICATE KEY UPDATE value = %i;";
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

    bool DoPosHackCheck(CCharEntity* PChar, float newX, float newY, float newZ, bool moved)
    {
        // clang-format off
        float new_distance        = static_cast<float>(sqrt(pow(newX - PChar->loc.p.x, 2) + pow(newZ - PChar->loc.p.z, 2)));
        CharAnticheat_t Anticheat = PChar->m_charAnticheat;
        Anticheat.lastCheckDist   += new_distance;
        time_t timeNow = time(NULL);

        if ((Anticheat.lastTeleport >= (timeNow - 3)) || (Anticheat.gracePeriod > timeNow))
        {
            Anticheat.lastCheckDist = 0;
            Anticheat.lastCheckTime = timeNow;
        }

        if (timeNow != Anticheat.lastCheckTime)
        {
            /*
                diffTime is clamped to stop cheaters from AFKing for an extensive period of time
                then coming back to pos hack. The grace period is the time in seconds before the
                anticheat engages and is configurable in the settings.
            */
            uint8 diffTime = std::clamp(static_cast<int32>(timeNow - Anticheat.lastCheckTime), 0, static_cast<int>(settings::get<uint8>("map.ANTICHEAT_POS_HACK_GRACE")));
            float cheatThreshold = static_cast<float>(settings::get<uint16>("map.ANTICHEAT_POS_HACK_THRESHOLD"));
            float diffDSec = Anticheat.lastCheckDist / diffTime;
            bool  hasMovementEffect = (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_FLEE) ||
                                        PChar->StatusEffectContainer->HasStatusEffect(EFFECT_QUICKENING) ||
                                        PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BOLTERS_ROLL));
            bool  isMounted = PChar->isMounted();

            if (PChar->GetSpeed() > PChar->speed)
            {
                cheatThreshold *= (PChar->GetSpeed() / PChar->speed);
            }

            if (isMounted)
            {
                cheatThreshold *= 2;
            }

            if ((diffDSec > cheatThreshold) && (!PChar->isCharmed) && (((PChar->nameflags.flags & FLAG_GM) == 0) || (PChar->m_GMlevel < 2)))
            {
                /*
                    The speedCounter system is meant to give additional leyway during lag spikes.
                    This is to counteract major lag spikes auto jailing, instead gives the player an
                    additional few counts before potentially jailing. This also allows for a lower grace
                    period of 15s vs 30s. So if a player has a movement effect they effectively get 45s of
                    grace time compared to 15s.
                */
                if ((isMounted || hasMovementEffect) && (Anticheat.speedCounter < 3))
                {
                    Anticheat.speedCounter += 1;
                }
                else
                {
                    anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_POS_HACK,
                                                    static_cast<uint32>(diffDSec * 100),
                                                    "Player is moving too fast or is teleporting. Speed has been recorded.");
                    if (anticheat::GetCheatPunitiveAction(anticheat::CheatID::CHEAT_ID_POS_HACK, nullptr, 1) & anticheat::CHEAT_ACTION_BLOCK)
                    {
                        moved = false;
                    }
                }
            }
            else
            {
                Anticheat.speedCounter = 0;
            }
        }

        return moved;
        // clang-format on
    }

    void DoFastDigCheck(CCharEntity* PChar, float newX, float newY, float newZ)
    {
        // clang-format off
        if (PChar != nullptr)
        {
            CharDigging_t DigTable    = PChar->m_charDigging;
            CharAnticheat_t Anticheat = PChar->m_charAnticheat;
            float minDigDistance      = static_cast<float>(settings::get<uint16>("main.DIG_DISTANCE_REQ"));
            time_t currentTime        = time(NULL);

            /*
                This detection method allows for 3x of consecutive fast digs until it triggers.
                This is to allow for players who may be lagging or may have framerate issues to
                not automatically trigger this system consistently.
            */
            if ((DigTable.lastDigT + 3.7 > currentTime) &&
                ((abs(PChar->loc.p.x - DigTable.lastDigX) * abs(PChar->loc.p.z - DigTable.lastDigZ)) > (minDigDistance * minDigDistance)))
            {
                if (Anticheat.digDistGrace < 3)
                {
                    Anticheat.digDistGrace += 1;
                    return;
                }

                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_FAST_DIG,
                                                static_cast<uint32>(std::round(abs((DigTable.lastDigT + 3.7) - currentTime) * 1000)),
                                                "Player is digging before the animation should have completed. Last animation time difference recorded in ms.");
                anticheat::GetCheatPunitiveAction(anticheat::CheatID::CHEAT_ID_FAST_DIG, nullptr, 1);
            }
            else
            {
                Anticheat.digDistGrace = 0;
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
            CharDigging_t   DigTable  = PChar->m_charDigging;
            CharAnticheat_t Anticheat = PChar->m_charAnticheat;

            /*
                This sort will populate out the last 3 digs worth of data to have a valid
                set of data to make anticheat decisions on. This does require a full 3 digs
                and each of these besides DigT variables are reset upon zone.
            */
            if ((Anticheat.prevDigT_1 == 0) || (Anticheat.prevDigX_1 == 0) || (Anticheat.prevDigZ_1 == 0))
            {
                anticheat::DoDigCheckSetup(PChar, true);
                return;
            }
            else if ((Anticheat.prevDigT_2 == 0) || (Anticheat.prevDigX_2 == 0) || (Anticheat.prevDigZ_2 == 0))
            {
                anticheat::DoDigCheckSetup(PChar, false);
                return;
            }

            /*
                Start by comparing times as this is one of the best indicators of automation.
                If the digs are within 2 seconds of each other for the past 3 digs then we
                should check positions.
            */
            if (!((Anticheat.prevDigT_1 - DigTable.lastDigT) < 2) &&
                !((Anticheat.prevDigT_2 - DigTable.lastDigT) < 2 ) &&
                !((Anticheat.prevDigT_1 - Anticheat.prevDigT_2) < 2))
            {
                anticheat::DoDigCheckSetup(PChar, false);
                return;
            }

            /*
                Continue by comparing all 3 sets of dig positions. If they are all within 0.5'
                then we are suspecting this player of botting and it should be reported for
                human inspection. Dozens of reports quickly should indicate an automatic jail,
                however no automatic jail system is implemented.
            */
            if (((abs(Anticheat.prevDigX_1 - Anticheat.prevDigX_2) < 0.5) && (abs(Anticheat.prevDigZ_1 - Anticheat.prevDigZ_2) < 0.5)) &&
                ((abs(Anticheat.prevDigX_1 - DigTable.lastDigX) < 0.5) && (abs(Anticheat.prevDigZ_1 - DigTable.lastDigZ) < 0.5)) &&
                ((abs(Anticheat.prevDigX_2 - DigTable.lastDigX) < 0.5) && (abs(Anticheat.prevDigZ_2 - DigTable.lastDigZ) < 0.5)))
            {
                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_DIG_BOT,
                                static_cast<uint32>(std::min(std::round(abs(Anticheat.prevDigX_1 - DigTable.lastDigX) * 100), std::round(abs(Anticheat.prevDigZ_1 - DigTable.lastDigZ) * 100))),
                                "Player is dig botting, dig times and movement are too close. Last minimum position difference recorded should be divided by 100.");
                anticheat::GetCheatPunitiveAction(anticheat::CheatID::CHEAT_ID_DIG_BOT, nullptr, 1);
            }

            anticheat::DoDigCheckSetup(PChar, false);
            return;
        }
        // clang-format on
    }

    void DoDigCheckSetup(CCharEntity* PChar, bool first)
    {
        // clang-format off
        if (PChar != nullptr)
        {
            CharDigging_t DigTable    = PChar->m_charDigging;
            CharAnticheat_t Anticheat = PChar->m_charAnticheat;

            Anticheat.prevDigT_2 = Anticheat.prevDigT_1;
            Anticheat.prevDigX_2 = Anticheat.prevDigX_1;
            Anticheat.prevDigZ_2 = Anticheat.prevDigZ_1;
            Anticheat.prevDigT_1 = DigTable.lastDigT;
            Anticheat.prevDigX_1 = DigTable.lastDigX;
            Anticheat.prevDigZ_1 = DigTable.lastDigZ;

            return;
        }
        // clang-format on
    }

    void DoCraftBotCheck(CCharEntity* PChar, time_t currentTime)
    {
        // clang-format off
        if (PChar != nullptr)
        {
            CharCrafting_t  CraftTable = PChar->m_charCrafting;
            CharAnticheat_t Anticheat  = PChar->m_charAnticheat;

            /*
                Check for addons like crafty with auto-recipe swapping.
                Players should not be able to swap recipes in under 10s.
            */
            if ((Anticheat.lastSynthReq != CraftTable.lastSynthReq) && ((Anticheat.lastSynthStart_1 - currentTime) < 10))
            {
                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_CRAFT_BOT,
                                                static_cast<uint32>(std::round(Anticheat.lastSynthStart_1 - currentTime)),
                                                "Player swapped crafts in under 10s and isusing crafty to auto recipe swap. Recipe start time diff has been recorded in seconds.");
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
            if ((((Anticheat.lastSynthStart_1 - currentTime) - (Anticheat.lastSynthStart_2 - Anticheat.lastSynthStart_1)) < 2) &&
                (((Anticheat.lastSynthStart_3 - Anticheat.lastSynthStart_2) - (Anticheat.lastSynthStart_4 - Anticheat.lastSynthStart_3)) < 2) &&
                (((Anticheat.lastSynthStart_5 - Anticheat.lastSynthStart_4) - (Anticheat.lastSynthStart_6 - Anticheat.lastSynthStart_5)) < 2))
            {
                auto cheatArg = std::min(((Anticheat.lastSynthStart_1 - currentTime) - (Anticheat.lastSynthStart_2 - Anticheat.lastSynthStart_1)), ((Anticheat.lastSynthStart_3 - Anticheat.lastSynthStart_2) - (Anticheat.lastSynthStart_4 - Anticheat.lastSynthStart_3)));

                cheatArg = std::min(cheatArg, ((Anticheat.lastSynthStart_3 - Anticheat.lastSynthStart_2) - (Anticheat.lastSynthStart_4 - Anticheat.lastSynthStart_3)));
                anticheat::ReportCheatIncident(PChar, anticheat::CheatID::CHEAT_ID_AUTO_CRAFT,
                                static_cast<uint32>(cheatArg),
                                "Player did multiple crafts with low variance, likely using an auto craft bot. Lowest start time diff has been recorded in seconds.");
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
            CharCrafting_t  CraftTable = PChar->m_charCrafting;
            CharAnticheat_t Anticheat  = PChar->m_charAnticheat;

            Anticheat.lastSynthReq     = CraftTable.lastSynthReq;
            Anticheat.lastSynthStart_6 = Anticheat.lastSynthStart_5;
            Anticheat.lastSynthStart_5 = Anticheat.lastSynthStart_4;
            Anticheat.lastSynthStart_4 = Anticheat.lastSynthStart_3;
            Anticheat.lastSynthStart_3 = Anticheat.lastSynthStart_2;
            Anticheat.lastSynthStart_2 = Anticheat.lastSynthStart_1;
            Anticheat.lastSynthStart_1 = currentTime;
        }
        // clang-format on
    }

} // namespace anticheat
