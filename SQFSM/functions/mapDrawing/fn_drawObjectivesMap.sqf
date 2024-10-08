params[
    ["_map",nil,[controlNull]]
];
private _objectives = entities "SQFSM_Objective";
{[_x, _map] call SQFM_fnc_thisObjectiveOnMap} forEach _objectives;

[_objectives, _map] call SQFM_fnc_setFocusedMapObjective;

true;