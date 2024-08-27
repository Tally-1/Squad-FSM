params[
    ["_objective",nil,[objNull]]
];
[_self, _objective] spawn { 
params[
    ["_self",      nil,[createHashmap]],
    ["_objective", nil,      [objNull]]
];

private _objData    = _objective call getData;
private _center     = _objData get "position";
private _startPos   = _self call ["getAvgPos"];
private _roadMap    = _objData get "roadmap";
private _roads      = (_roadMap get "positions");
private _centerRoad = [_center, _roads] call SQFM_fnc_getNearest;
private _exits      = _roadMap get "exitPositions";

if([_centerRoad, false, 8, 3]call SQFM_fnc_clearPos)
then{_exits pushBackUnique _centerRoad};

_self call ["initMechClearing"];

private _vehicle       = vehicle formationLeader leader (_self get "grp");
private _wpFnc         = "SQFM_fnc_onMechClearingWp";
private _endFnc        = "SQFM_fnc_endTaskGroup";
private _endPos        = selectRandom _roads;
private _pathPositions = [_startPos, _exits] call SQFM_fnc_posArrToPath;
private _startPos      = _pathPositions#0;
private _firstWp       = _self call["addWaypoint",[_startPos,0,"MOVE",nil,nil,"LIMITED"]];

// _vehicle forceFollowRoad true;
_pathPositions deleteAt 0;

if(_pathPositions isEqualTo [])
exitWith{_self call["addWaypoint",[_endPos,0,"MOVE",_endFnc]]};


{_self call ["addWaypoint", [_x,15, "MOVE", _wpFnc, "AWARE", "LIMITED"]]}forEach _pathPositions;

private _lastWp = _self call ["addWaypoint", [_endPos,0,"MOVE",_endFnc, "AWARE", "NORMAL"]];

true;
};

 
true;