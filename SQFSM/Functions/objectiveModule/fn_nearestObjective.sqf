params[
    ["_pos",nil,[[]]]
];
private _objectives = entities "SQFSM_Objective";
if(_objectives isEqualTo [])exitWith{};

private _nearest = [_pos, _objectives] call SQFM_fnc_getNearest;

_nearest;