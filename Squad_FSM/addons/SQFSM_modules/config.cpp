#include "BIS_AddonInfo.hpp"
#include "config\defines.hpp"
#include "config\cfgVehicles.hpp"
#include "config\cfgFunctions.hpp"


class CfgPatches
{
    class SQFSM_Obj
    {
        units[] = {"SQFSM_Objective"};
        requiredVersion = 1.0;
        requiredAddons[] = {"A3_Modules_F"};
    };

};

class CfgFactionClasses
{
    class NO_CATEGORY;
    class SQFSM_modules: NO_CATEGORY
    {
        displayName = "DCO Squad FSM";
    };
};

class Cfg3DEN
{
        
    class EventHandlers
    {
        class mySection
        {
            
        };
    };
};