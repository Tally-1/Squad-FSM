private _vehicles = _self call ["getVehiclesInUse"];
private _unArmed  = _vehicles select {[_x] call SQFM_fnc_vehicleIsUnarmed};
private _group    = _self get "grp";

{
	private _crew = crew _x;
	_crew orderGetIn false;
	_crew allowGetIn false;
	[_x, true, canSuspend] call SQFM_fnc_vehicleEjectCrew;
	_group leaveVehicle _x;
} forEach _unArmed;

_unArmed;