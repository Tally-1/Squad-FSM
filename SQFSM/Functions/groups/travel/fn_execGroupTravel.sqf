params[
	["_movePos",     nil,      [[]]],
	["_taskName",    "move",   [""]],
    ["_findParking", false, [false]]
];
[_self, _movePos, _taskName, _findParking] spawn { 
params[
	["_self",        nil, [createHashmap]],
	["_movePos",     nil,            [[]]],
	["_taskName",    "move",         [""]],
    ["_findParking", false,       [false]]
];

_self call ["deleteWaypoints"];


private _vehGrp        = _self call ["isVehicleGroup"];
private _vehicles      = _self call ["getVehiclesInUse"];
private _singleVeh     = count _vehicles isEqualTo 1;
private _parkingSpot   = _movePos;


if(_findParking)
then{_parkingSpot = [_movePos] call SQFM_fnc_findParkingSpot};

private _targetPos = _parkingSpot;

if(_movePos distance2D _parkingSpot > 100) then{_targetPos = _movePos;};
private _setCompRad = {
	params[["_CR",nil,[0]]];
	(_self get "waypoint") setWaypointCompletionRadius _CR;
};

private _onWp = "SQFM_fnc_onWpGroupTravelArrival";
private _wp   = _self call ["addWaypoint",[_targetPos,30,nil,_onWp]];// (_self get "grp") addWaypoint [_targetPos, 0];
private _dataArr = [
	["startTime",     round time],
	["waypoint",             _wp],
	["taskName",       _taskName],
	["setCompRad",   _setCompRad]
];

private _travelData = createHashmapObject [_dataArr];

_self set ["travelData", _travelData];
_self set ["action",     "traveling"];
_self set ["state",      "traveling"];

if(_vehGrp)then{_wp setWaypointFormation "FILE"};

sleep 1;

private _group    = _self get "grp";
private _boarding = [_group] call SQFM_fnc_isVanillaBoarding;

if!(_boarding)exitWith{};

"Group is vanilla boarding" call dbgm;

private _timer = time+20;
waitUntil {
    sleep 1;
    private _ended    = !([_group] call SQFM_fnc_isVanillaBoarding);
    private _timedOut = time>_timer;

    _ended || {_timedOut};
};

private _driver = driver vehicle formationLeader leader _group;

_driver doMove _targetPos;
_group move _targetPos;

};