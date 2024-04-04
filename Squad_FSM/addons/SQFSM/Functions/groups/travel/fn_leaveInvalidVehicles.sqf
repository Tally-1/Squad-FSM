private _group = _self get "grp";

{
	if!(_self call ["validVehicle", [_x]])
	then{_group leaveVehicle _x;};
	
} forEach assignedVehicles _group;

true;