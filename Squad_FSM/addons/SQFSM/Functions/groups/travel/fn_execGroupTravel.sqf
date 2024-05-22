params[
	["_movePos",     nil,      [[]]],
	["_taskName",    "move",   [""]],
    ["_findParking", false, [false]]
];
_self call ["deleteWaypoints"];

private _vehGrp      = _self call ["isVehicleGroup"];
private _vehicles    = _self call ["getVehiclesInUse"];
private _singleVeh   = count _vehicles isEqualTo 1;
private _onCompleted = '(group this getVariable "SQFM_grpData") call ["onArrival"]';
private _parkingSpot = _movePos; 

if(_findParking)
then{_parkingSpot = [_movePos] call SQFM_fnc_findParkingSpot};

private _targetPos = _parkingSpot;

if(_movePos distance2D _parkingSpot > 100) then{_targetPos = _movePos;};

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
_wp setWaypointCompletionRadius 10;

if(_vehGrp)then{
	_wp setWaypointCompletionRadius 30;
	_wp setWaypointFormation "FILE";
	if(_singleVeh)then{_vehicles#0 doMove _movePos};
};
