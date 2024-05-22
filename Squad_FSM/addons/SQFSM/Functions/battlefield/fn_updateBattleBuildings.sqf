private _updateNeeded = false;
{
    if!([_x] call SQFM_fnc_isHouse)
    exitWith{_updateNeeded = true};

} forEach (_self get "buildings");

if(_updateNeeded isEqualTo false)exitWith{};

_self call ["initBuildings"];

"Battle buildings updated" call dbgm;

true;