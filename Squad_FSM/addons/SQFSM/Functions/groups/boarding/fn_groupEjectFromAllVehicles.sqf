{
	private _vehicle = vehicle _x;
	_x action ["Eject", _vehicle];
	unassignVehicle _x;
	_x leaveVehicle _vehicle;	
} forEach (_self call ["getUnits"]);

true;