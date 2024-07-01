params[
    ["_targetGroup",nil,[grpNull]]
];

_self call ["deleteWaypoints"];

private _joinDistance = 150;
private _maxJoinDist  = _joinDistance+50;
private _directJoin   = _self call ["replenishDirect",[_targetGroup, _maxJoinDist]];
if(_directJoin)
exitWith{"Group joined directly" call dbgm};

private _targetData   = _targetGroup call getData;
private _targetPos    = _targetData call ["getAvgPos"];
private _canTravel    = _self call ["initTravel",[_targetPos]];
if!(_canTravel)
exitWith{"Could not travel to replenish squad." call dbgm};


private _taskName    = "Replenish friendly squad";
private _zone        = [_targetPos, 200];
private _params      = [_targetGroup, _maxJoinDist];
private _positions   = [_targetPos];
private _arrivalCode = {_self call ["endTask"]};
private _endCode     = { call SQFM_fnc_groupReplenishTaskEnd};

private _task = _self call ["initTask",
[
    _taskName,     // Taskname     ["name"]
    _zone,         // Task zone    ["zone"]
    _positions,    // Positions    ["positions"]
    _params,       // TaskParams   ["params"]
    _arrivalCode,  // Arrival-code ["arrivalCode"]
    _endCode       // End-code     ["endCode"]
]];

_targetData set ["awaitingReplenish", true];

_self call ["waitForTransportSpawn"];

private _transportVehicle = _self get "transportVehicle";
private _validVehicle     = (!isNil "_transportVehicle")&&{alive _transportVehicle};


// Set waypoint radius to 150 in order to execute replenishment from a distance (Safer)
if(_validVehicle isEqualTo false)exitWith{
    private _wp = [_group, (currentWaypoint _group)];
    _wp setWaypointCompletionRadius _joinDistance;
};
private _group          = _self get "grp";
private _transportGroup = group driver _transportVehicle;
private _wpG            = (waypoints _group)#2;
private _wpT            = (waypoints _transportGroup)#2;

_wpG setWaypointCompletionRadius _joinDistance;
_wpT setWaypointCompletionRadius _joinDistance;

true;