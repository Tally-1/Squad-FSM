params[
    ["_objective",nil,[objNull]]
];

private _objData         = _objective call getData;
private _center          = (_objData get "zone")#0;
private _radius          = ((_objData get "zone")#1)*0.8;
private _posCount        = 3 + (round random 6);
private _endFunction     = 'SQFM_fnc_endTaskGroup';
private _edgePositions   = [_center, _radius, _posCount] call SQFM_fnc_pos360;

_edgePositions pushBackUnique (_self call ["getAvgPos"]);

private _startPos        = selectRandom _edgePositions;
private _pathPositions   = [_startPos, _edgePositions] call SQFM_fnc_posArrToPath;


_pathPositions pushBackUnique _center;

{_self call ["addWaypoint", [_x, 20]]}forEach _pathPositions;


// Place the last waypoint at a random position inside the objective radius
_self call ["addWaypoint", [_center,5,"MOVE", _endFunction,nil,nil,_radius]];

_pathPositions;