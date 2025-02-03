params[
    ["_vehicle",   nil, [objNull]],  
    ["_posArr",   nil,       [[]]],  
    ["_magazine",  nil,      [""]]
];
private _fireMission = _vehicle getVariable "SQFM_fireMission";
private _firePos     = selectRandom _posArr;

_fireMission call ["radioPrepare"];

_vehicle setVariable ["SQFM_preparingArtyFire",true,true];
_vehicle setVariable ["SQFM_preparingArtyTime",time,true];

sleep SQFM_artyDelay;

_vehicle setVariable ["SQFM_preparingArtyFire",false,true];

[_vehicle, [_firePos, _magazine, 1]]remoteExec["doArtilleryFire"];

_fireMission call ["verifyFirstRound"];

true;