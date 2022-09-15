#include "mobshield_state.h"
#include "../../entities/battleentity.h"
#include "../../entities/mobentity.h"
#include "../../mob_modifier.h"
#include "../../status_effect_container.h"
#include "../../utils/battleutils.h"
#include "../ai_container.h"

CMobShieldState::CMobShieldState(CBaseEntity* PEntity)
: CState(PEntity, 0)
{
    TracyZoneScoped;

    if (PEntity == nullptr || PEntity->objtype != TYPE_MOB)
    {
        ShowDebug("CMobShieldState PEntity is nullptr or not TYPE_MOB. Exiting...");
        return;
    }

    auto* PMob = static_cast<CMobEntity*>(PEntity);

    if (PMob != nullptr)
    {
        PMob->status        = STATUS_TYPE::INVISIBLE;
        PMob->m_unkillable  = true;
        PMob->m_IsClaimable = false;

        PMob->setModifier(Mod::MOBSHIELD_FAKE_SPAWN, xirand::GetRandomNumber(4000, 8000));
        PMob->setModifier(Mod::CLAIMBOT_REPORT_CHECK, 0);
        PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_STUN, EFFECT_STUN, 1, 0, PMob->getMod(Mod::MOBSHIELD_FAKE_SPAWN)), false);

        // clang-format off
        PMob->PAI->QueueAction(queueAction_t(std::chrono::milliseconds(PMob->getMod(Mod::MOBSHIELD_FAKE_SPAWN)), false, [&](CBaseEntity* PEntity)
        {
            auto* PMobEntity = static_cast<CMobEntity*>(PEntity);
            battleutils::DoReportClaimBot(PMobEntity);
        }));
        // clang-format on
    }
}

bool CMobShieldState::Update(time_point tick)
{
    TracyZoneScoped;

    if (m_PEntity == nullptr || m_PEntity->objtype != TYPE_MOB)
    {
        return false;
    }

    auto* PMob = static_cast<CMobEntity*>(m_PEntity);

    if (PMob != nullptr && !IsCompleted() &&
        (tick > (GetEntryTime() + std::chrono::milliseconds(PMob->getMod(Mod::MOBSHIELD_FAKE_SPAWN)))) &&
        PMob->getMod(Mod::CLAIMBOT_REPORT_CHECK) != 0)
    {
        if (PMob != nullptr)
        {
            PMob->m_IsClaimable = true;
            PMob->m_unkillable  = false;
            PMob->health.hp     = PMob->health.maxhp;

            return true;
        }
    }

    return false;
}

void CMobShieldState::Cleanup(time_point tick)
{
    return;
}
