params[
	["_callerGroup", nil, [grpNull]],
	["_dropOffPos",  nil,      [[]]]
];


// Check if the module is already queing vehicles
if(_self get "waitingToSpawn")then{
	waitUntil { 
		sleep 0.1;
		(_self get "waitingToSpawn" isEqualTo false);
	};
};

// If a vehicle was just spawned then waitUntil 10 seconds have passed.
if(_self call ["timeSinceSpawn"] < 10)then{
    private _wait = 10 - (_self call ["timeSinceSpawn"]);
    _self set ["waitingToSpawn",  true];
    sleep _wait;
    _self set ["waitingToSpawn", false];
};

private ["_transportersData"];
private _callerData       = _callerGroup getVariable "SQFM_grpData";
        _dropOffPos       = [_dropOffPos] call SQFM_fnc_findParkingSpot;
private _pickupPos        = _callerData call ["getPickupPos"];
private _capacityNeeded   = count(_callerData call ["getUnitsOnfoot"]);
private _transportVehicle = _self call ["spawnTransport", [_capacityNeeded]];

if(isNil "_transportVehicle")
exitWith{
	"Vehicle could not spawn" call dbgm; 
	objNull;
};

private _transportGroup   = group _transportVehicle;
private _timer            = time + 2;
waitUntil {
	_transportersData = _transportGroup getVariable "SQFM_grpData";
	(_timer < time) or 
	{!isNil "_transportersData"}; 
};


private _module           = _self get "module";
private _startPos         = getPosATLVisual _module;
private _transportParams  = [_callerGroup, _transportVehicle, _callerData, _module];
private _Zone             = [_callerGroup, _transportGroup] call SQFM_fnc_getGroupsZone;
private _transportTask    = _transportersData call ["initTask", ["transport", _Zone,  [_pickupPos, _dropOffPos], _transportParams]];
private _onPickupWp       = '[group this] call  SQFM_fnc_onPickupWpTransporter';
private _onDropWp         = '[group this] spawn SQFM_fnc_onDropOffWpTransporter';
private _onReturnWp       = '[group this] call  SQFM_fnc_onReturnWpTransporter';

private _pickupWp = _transportTask call ["addWaypoint", [_pickupPos, _onPickupWp,nil,"FULL"]];
private _droppWp  = _transportTask call ["addWaypoint",             [_dropOffPos, _onDropWp]];
private _returnWp = _transportTask call ["addWaypoint",             [_startPos, _onReturnWp]];
private _waitWp   = _callerGroup addWaypoint [_pickupPos, 0];

_pickupWp synchronizeWaypoint [_waitWp];
_waitWp   setWaypointCompletionRadius 30;
_pickupWp setWaypointCompletionRadius 50;
_droppWp  setWaypointCompletionRadius 100;
_returnWp setWaypointCompletionRadius 30;

_transportGroup setSpeedMode "FULL";
_transportGroup setBehaviour "SAFE";

_transportTask set ["state",           "Picking up passengers"];
_callerData    set ["action",          "Waiting for transport"];
_callerData    set ["transportVehicle", _transportVehicle];

"Transport vehicle spawned in" call dbgm;

_transportVehicle;