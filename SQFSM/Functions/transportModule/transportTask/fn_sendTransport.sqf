params[
	["_passengerGroup", nil, [grpNull]],
	["_dropPos",  nil,         [[]]]
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
private _callerData       = _passengerGroup getVariable "SQFM_grpData";
        _dropPos       = [_dropPos] call SQFM_fnc_findParkingSpot;
private _pickupPos        = _callerData call ["getPickupPos"];
private _capacityNeeded   = count(_callerData call ["getUnitsOnfoot"]);
private _transportVehicle = _self call ["spawnTransport", [_capacityNeeded]];

if(isNil "_transportVehicle")
exitWith{
	_self call ["globalize"];
	"Vehicle could not spawn" call dbgm; 
	objNull;
};

private _transportGroup = group _transportVehicle;
private _timer          = time + 2;

waitUntil {
	_transportersData = _transportGroup getVariable "SQFM_grpData";
	(_timer < time) or 
	{!isNil "_transportersData"}; 
};

_self call ["initTransportTask",[
    _passengerGroup,
    _transportVehicle,
    _pickupPos,
    _dropPos
]];

_transportGroup setVariable ["SQFM_transportVehcicle",  _transportVehicle];
_transportGroup setVariable ["SQFM_transportModule", (_self get "module")];

_transportVehicle;