private _objective = SQFM_currentMapObjective;
if(isNull _objective)exitWith{};

[SQFM_currentMapObjective] spawn SQFM_fnc_showObjectiveData;