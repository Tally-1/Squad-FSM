params[
    ["_leaveUnArmed",true,    [true]],
    ["_waitForMen",  true,    [true]]
];
private _vehicles = _self call ["getVehiclesInUse"];

if(_leaveUnArmed)then{ 
    private _abandoned = _self call ["leaveUnarmedVehicles"];
    _vehicles = _vehicles select {!(_x in _abandoned)};
};

{
	_x setVelocityModelSpace [0,0,0];
	[_x, _waitForMen] call SQFM_fnc_mechUnload

} forEach _vehicles;

true;