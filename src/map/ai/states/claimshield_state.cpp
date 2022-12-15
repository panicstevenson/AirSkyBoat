#include "claimshield_state.h"
#include "../../entities/battleentity.h"
#include "../../entities/mobentity.h"
#include "../../mob_modifier.h"
#include "../../status_effect_container.h"
#include "../../utils/battleutils.h"
#include "../ai_container.h"

CClaimShieldState::CClaimShieldState(CBaseEntity* PEntity)
: CState(PEntity, 0)
{
    TracyZoneScoped;

    if (PEntity == nullptr || PEntity->objtype != TYPE_MOB)
    {
        return;
    }

    auto* PMob = dynamic_cast<CMobEntity*>(PEntity);

    if (PMob != nullptr)
    {
        PMob->status        = STATUS_TYPE::INVISIBLE;
        PMob->m_unkillable  = true;
        PMob->m_IsClaimable = false;

        PMob->setModifier(Mod::CLAIMSHIELD_FAKE_SPAWN, xirand::GetRandomNumber(4000, 8000));
        PMob->setModifier(Mod::CLAIMBOT_REPORT_CHECK, 0);
        PMob->PAI->Inactive(std::chrono::milliseconds(PMob->getMod(Mod::CLAIMSHIELD) + PMob->getMod(Mod::CLAIMSHIELD_FAKE_SPAWN)), true);

        // clang-format off
        PMob->PAI->QueueAction(queueAction_t(std::chrono::milliseconds(PMob->getMod(Mod::CLAIMSHIELD_FAKE_SPAWN)), false, [](CBaseEntity* PEntity)
        {
            auto* PMobEntity = static_cast<CMobEntity*>(PEntity);
            battleutils::DoReportClaimBot(PMobEntity);
        }));
        // clang-format on
    }
}

bool CClaimShieldState::Update(time_point tick)
{
    TracyZoneScoped;

    if (m_PEntity == nullptr || m_PEntity->objtype != TYPE_MOB)
    {
        return false;
    }

    auto* PMob = static_cast<CMobEntity*>(m_PEntity);

    if (PMob)
    {
        if (!IsCompleted() &&
            tick >= GetEntryTime() + std::chrono::milliseconds(PMob->getMod(Mod::CLAIMSHIELD) + PMob->getMod(Mod::CLAIMSHIELD_FAKE_SPAWN)))
        {
            battleutils::DoClaimShieldLottery(PMob);
            Complete();
            return true;
        }
    }

    return false;
}

void CClaimShieldState::Cleanup(time_point tick)
{
    return;
}
