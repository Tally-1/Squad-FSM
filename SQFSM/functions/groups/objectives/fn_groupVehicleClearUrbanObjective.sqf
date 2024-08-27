"Vehicle clearing Urban objective" call dbgm;
params[
    ["_objective",nil,[objNull]]
];
private _objData    = _objective call getData;
private _center     = _objData get "position";
private _startPos   = _self call ["getAvgPos"];
private _roadMap    = _objData get "roadmap";
private _roads      = (_roadMap get "positions");//select{[_x, false, 8, 3]call SQFM_fnc_clearPos};
private _centerRoad = [_center, _roads] call SQFM_fnc_getNearest;
private _exits      = _roadMap get "exitPositions";
private _vehicle    = vehicle formationLeader leader (_self get "grp");

if([_centerRoad, false, 8, 3]call SQFM_fnc_clearPos)
then{_exits pushBackUnique _centerRoad};

private _pathPositions = [_startPos, _exits] call SQFM_fnc_posArrToPath;

[_pathPositions] call SQFM_fnc_showPosArr3D;

private _endFnc = "SQFM_fnc_endTaskGroup";
private _endPos = selectRandom _roads;

{_self call ["addWaypoint", [_x,5]]}forEach _pathPositions;
_self call ["addWaypoint", [_endPos,0,"MOVE",_endFnc]];

// _vehicle forceFollowRoad true;

true;