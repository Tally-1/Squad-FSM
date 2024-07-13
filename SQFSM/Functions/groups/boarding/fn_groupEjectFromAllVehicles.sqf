{
	_x spawn {
	private _vehicle = vehicle _this;
	_this action ["Eject", _vehicle];
	unassignVehicle _this;
	_this leaveVehicle _vehicle;	
}} forEach (_self call ["getUnits"]);

true;