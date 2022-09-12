#ifndef _CCLAIMSHIELD_STATE_H
#define _CCLAIMSHIELD_STATE_H

#include "state.h"

class CClaimShieldState : public CState
{
public:
    CClaimShieldState(CBaseEntity* PEntity);

    virtual bool Update(time_point tick) override;

    virtual void Cleanup(time_point tick) override;

    virtual bool CanChangeState() override
    {
        return false;
    }
    virtual bool CanFollowPath() override
    {
        return true;
    }
    virtual bool CanInterrupt() override
    {
        return false;
    }
};

#endif
