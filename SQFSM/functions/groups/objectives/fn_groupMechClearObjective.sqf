params[
    ["_objective",nil,[objNull]]
];
[_self, _objective] spawn { 
params[
    ["_self",      nil,[createHashmap]],
    ["_objective", nil,      [objNull]]
];
(_self call ["vehicleClearObjective",[_objective, true]])params[
    ["_firePositions", nil,[[]]],
    ["_centerPos",     nil,[[]]]
];
_self call ["initMechClearing"];

private _wpFnc   = "SQFM_fnc_onMechClearingWp";
private _endFnc  = "SQFM_fnc_endTaskGroup";
private _objData = _objective call getData;
private _roadMap = _objData get "roadmap";
private _roads   = (_roadMap get "positions");

_roads pushBackUnique _centerPos;

private _endPos = selectRandom _roads;

if(_firePositions isNotEqualTo [])then{
    private _firePos = selectRandom _firePositions;
    _self call ["addWaypoint", [_firePos,15, "MOVE", _wpFnc, "AWARE", "LIMITED"]];
};

_self call ["addWaypoint", [_endPos,0,"MOVE",_endFnc, "AWARE", "NORMAL"]];

true;
}