params [
    ["_curator", nil,[objNull]],
    ["_entity",  nil,[objNull]]
];
private _objects = count (curatorSelected#0);
if(_objects > 1)exitWith{};
if(_objects < 1)exitWith{};

if([_entity] call SQFM_fnc_isArtillery
&&{SQFM_debugMode})
exitWith{[_entity] spawn SQFM_fnc_artilleryDebugHint};

true;