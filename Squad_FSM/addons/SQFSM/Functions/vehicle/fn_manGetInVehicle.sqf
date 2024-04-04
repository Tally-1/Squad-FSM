params[
	["_man",      nil, [objNull]],
	["_vehicle",  nil, [objNull]]
];

// if(_man distance _vehicle < 10)exitWith{_man moveInAny _vehicle;};
private _crewData     = [_vehicle] call SQFM_fnc_crewData;
private _driverStatus = _crewData get   "driver"get"status";
private _gunnerStatus = _crewData get   "gunner"get"status";
private _cmmndrStatus = _crewData get"commander"get"status";
private _turret       = (_crewData get"turrets"   select{_x get"status"isEqualTo"available"})#0;
private _seat         = (_crewData get"passengers"select{_x get"status"isEqualTo"available"})#0;

if((!isNil "_driverStatus")
&&{_driverStatus isEqualTo "available"})exitWith{
	_man assignAsDriver _vehicle;
	[_man] allowGetIn true;
	[_man] orderGetIn true;
	true;
};

if((!isNil "_gunnerStatus")
&&{_gunnerStatus isEqualTo "available"})exitWith{
	_man assignAsGunner _vehicle;
	[_man] allowGetIn true;
	[_man] orderGetIn true;
	true;
};

if((!isNil "_cmmndrStatus")
&&{_cmmndrStatus isEqualTo "available"})exitWith{
	_man assignAsCommander _vehicle;
	[_man] allowGetIn true;
	[_man] orderGetIn true;
	true;
};

if(!isNil "_turret")exitWith{ 
	private _turretPath = (_turret get"seat")#1;
	_man assignAsTurret [_vehicle, _turretPath];
	[_man] allowGetIn true;
	[_man] orderGetIn true;
	true;
};

if(!isNil "_seat")exitWith{ 
	_man assignAsCargo _vehicle;
	[_man] allowGetIn true;
	[_man] orderGetIn true;
	true;
};

false;