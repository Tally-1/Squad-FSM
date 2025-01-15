params[
    ["_vehicle",  nil,[objNull]]
];
private _fireMission   = _vehicle getVariable "SQFM_fireMission";
if(isNil "_fireMission")exitWith{false};

private _completed = _fireMission call ["isCompleted"];
if(_completed)exitWith{false};

true;