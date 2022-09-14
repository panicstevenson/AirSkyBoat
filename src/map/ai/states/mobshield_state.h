#ifndef _CMOBSHIELD_STATE_H
#define _CMOBSHIELD_STATE_H

#include "state.h"

class CMobShieldState : public CState
{
public:
    CMobShieldState(CBaseEntity* PEntity);

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
