params[
	["_movePos",  nil,    [[]]],
	["_taskName", "move", [""]]
];
_self call ["deleteWaypoints"];
private _parkingSpot = [_movePos] call SQFM_fnc_findParkingSpot;
private _targetPos   = _parkingSpot;
private _onCompleted = '(group this getVariable "SQFM_grpData") call ["onArrival"]';
if(_movePos distance2D _parkingSpot > 100)
then{_targetPos = _movePos;};

private _wp = (_self get "grp") addWaypoint [_targetPos, 0];
private _dataArr = [
	["startTime", round time],
	["waypoint",         _wp],
	["taskName",   _taskName]
];

private _travelData = createHashmapObject [_dataArr];
_self set ["travelData", _travelData];
_self set ["action",     "traveling"];
_self set ["state",      "traveling"];


_wp setWaypointStatements ["true", _onCompleted];