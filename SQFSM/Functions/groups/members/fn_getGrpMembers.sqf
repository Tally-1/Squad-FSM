private _grpVehMen = []; // all men and vehicles in the group
{
	private _vehicle = vehicle _x;
	// private _valid   = [] call SQFM_fnc_validLandEntity;
	// if(_valid)
	// then{_grpVehMen pushBackUnique _vehicle};
	_grpVehMen pushBackUnique _vehicle;

} forEach units (_self get "grp");
_grpVehMen;