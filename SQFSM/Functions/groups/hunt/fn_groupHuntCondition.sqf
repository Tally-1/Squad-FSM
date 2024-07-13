private _hunter = _self get "owner";
private _hunted = (_self get "params")#2;

if!([_hunter] call SQFM_fnc_validGroup)exitWith{false};
if!([_hunter] call SQFM_fnc_validGroup)exitWith{false};

true;