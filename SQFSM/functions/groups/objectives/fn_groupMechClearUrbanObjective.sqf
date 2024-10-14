params[
    ["_objective",nil,[objNull]]
];
[_self, _objective] spawn { 
params[
    ["_self",      nil,[createHashmap]],
    ["_objective", nil,      [objNull]]
];

private _objData     = _objective call getData;
private _center      = _objData get "position";
private _startPos    = _self call ["getAvgPos"];
private _roadMap     = _objData get "roadmap";
private _roads       = (_roadMap get "positions");
private _centerRoad  = [_center, _roads] call SQFM_fnc_getNearest;
private _distance    = (_centerRoad distance2D _startPos)*1.1;
private _exits       = _roadMap get "exitPositions";
private _clearPosArr = _exits;

// Add the center of town to search positions 
if([_centerRoad, false, 8, 3]call SQFM_fnc_clearPos)
then{_clearPosArr pushBackUnique _centerRoad};

// Add the a random amount of road-positions to search positions 
if(count _roads > 10)then{
    private _addCount = floor random 7;
    for "_i"from 1 to _addCount do{
        private _pos = selectRandom (_roads select {!(_x in _clearPosArr)});
        if(!isNil "_pos")
        then{_clearPosArr pushBackUnique _pos};
}};


_self call ["initMechClearing"];

private _vehicle       = vehicle formationLeader leader (_self get "grp");
private _wpFnc         = "SQFM_fnc_onMechClearingWp";
private _endFnc        = "SQFM_fnc_endTaskGroup";
private _endPos        = selectRandom _roads;
private _startPos      = selectRandom (_clearPosArr select {(_x distance2D _startPos)<_distance});
private _pathPositions = [_startPos, _clearPosArr] call SQFM_fnc_posArrToPath;
private _index         = _pathPositions find _startPos;
private _firstWp       = _self call["addWaypoint",[_startPos,0,"MOVE",nil,nil,"LIMITED"]];

// Remove the random startPosition from the path array.
_pathPositions deleteAt _index;

if(_pathPositions isEqualTo [])
exitWith{_self call["addWaypoint",[_endPos,0,"MOVE",_endFnc]]};


{_self call ["addWaypoint", [_x,15, "MOVE", _wpFnc, "AWARE", "LIMITED"]]}forEach _pathPositions;

private _lastWp = _self call ["addWaypoint", [_endPos,0,"MOVE",_endFnc, "AWARE", "NORMAL"]];

true;
};

 
true;