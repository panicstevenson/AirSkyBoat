/************************************************************************
 * Print runtime stats
 *
 * Print information every minute about:
 * - Player count (on this process)
 * - Session count (across all processes)
 * - Active zones (on this process)
 ************************************************************************/

#include "map/utils/moduleutils.h"

#include "common/taskmgr.h"
#include "map/zone.h"

class CCharEntity;

extern std::map<uint16, CZone*> g_PZoneList;

int32 print_player_count(time_point tick, CTaskMgr::CTask* PTask)
{
    auto totalSessions        = 0;
    auto playersOnThisProcess = 0;
    auto activeZones          = 0;

    for (auto entry : g_PZoneList)
    {
        auto* PZone = entry.second;
        if (PZone)
        {
            ++activeZones;

            // clang-format off
            PZone->ForEachChar([&](CCharEntity*)
            {
                ++playersOnThisProcess;
            });
            // clang-format on

            // Only run this bit of logic once: on the process that has Lower Jeuno
            // ie.: The very poor man's world server
            if (PZone->GetID() == ZONE_LOWER_JEUNO)
            {
                auto ret = sql->Query("SELECT COUNT(*) FROM accounts_sessions;");
                if (ret != SQL_ERROR && sql->NumRows() && sql->NextRow() == SQL_SUCCESS)
                {
                    totalSessions = sql->GetUIntData(0);
                }
            }
        }
    }

    if (playersOnThisProcess)
    {
        ShowInfo(fmt::format("STATS: Players on this process: {}", playersOnThisProcess));
    }

    if (totalSessions)
    {
        ShowInfo(fmt::format("STATS: Total sessions across all processes: {}", totalSessions));
    }

    if (activeZones)
    {
        ShowInfo(fmt::format("STATS: Active zones on this process: {}", activeZones));
    }

    return 0;
}

class PlayerCountPrintModule : public CPPModule
{
    void OnInit() override
    {
        ShowInfo("Registering print_player_count task");
        CTaskMgr::getInstance()->AddTask("print_player_count", server_clock::now(), nullptr, CTaskMgr::TASK_INTERVAL, print_player_count, 1min);
    }
};

REGISTER_CPP_MODULE(PlayerCountPrintModule);