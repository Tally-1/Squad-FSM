params[
    ["_vehicle",  nil,[objNull]],  // The vehicle with an artillery gun / Mortar 
    ["_posArr",   nil,     [[]]],  // an arrray of positions that will be randomly selected to fire on.
    ["_magazine", nil,     [""]],  // The magazine CFG name which will be used.
    ["_rounds",     1,      [0]],  // How many rounds will be fired. 
    ["_wait",   false,   [true]]   // Wait until the fire-mission is complete.
];
if(_rounds < 1)exitWith{"no rounds to be fired" call dbgm};

private _hasMission = [_vehicle] call SQFM_fnc_artilleryHasActiveFireMission;
if(_hasMission)exitWith{};

private _fireMission = [_vehicle,_posArr,_magazine,_rounds] call SQFM_fnc_artilleryInitFireMission;
[_vehicle,_posArr,_magazine] spawn SQFM_fnc_artilleryFirstShot;

if(!_wait)exitWith{};

waitUntil {_fireMission call ["isCompleted"]};

true;