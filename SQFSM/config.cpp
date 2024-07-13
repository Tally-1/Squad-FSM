#include "Functions\cfgFunctions.hpp"
class CfgPatches
{
    class SQFSM_Main
    {
        units[]          = {};
        requiredVersion  = 1.0;
        requiredAddons[] = {"A3_Modules_F"};
    };
};

class Extended_PreInit_EventHandlers {
    class CBApreInit_SQFSM {
        init = "call compile preprocessFileLineNumbers '\SQFSM\CBA_Options\main.sqf'";
    };
};