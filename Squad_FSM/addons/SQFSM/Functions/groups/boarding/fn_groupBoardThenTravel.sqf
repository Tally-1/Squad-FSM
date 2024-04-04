params[
	["_movePos",  nil,    [[]]],
	["_taskName", nil,    [""]]
];

//This will have the group attempt to board vehicles 3 times.
private _onboard = _self call ["boardVehicles", [true]];
if!(_onboard)
then{_onboard = _self call ["boardVehicles", [false]]};

// If all 3 attempts failed then all men in vehicles eject from them,
// and the group is unassigned from said vehicles.
if!(_onboard)exitWith{
	_self call ["ejectAll"];
	"Cannot travel, boarding failed" call dbgm;
	false;
};

_self call ["execTravel", [_movePos, _taskName]]; 

true;