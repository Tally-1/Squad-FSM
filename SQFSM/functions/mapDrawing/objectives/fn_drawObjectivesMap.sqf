params[
    ["_map",nil,[controlNull]]
];
private _objectives = entities "SQFSM_Objective"select{[_x]call SQFM_fnc_objectiveCanshowMarker};

{[_x, _map] call SQFM_fnc_thisObjectiveOnMap} forEach _objectives;

[_objectives, _map] call SQFM_fnc_setFocusedMapObjective;

true;