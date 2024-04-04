params[
	["_men",     nil,      [[]]],
	["_vehicle", nil, [objNull]]
];
[_vehicle] call SQFM_fnc_vehicleEjectDeadAndUncon;
private _canTeleport = _this call SQFM_fnc_menCanTeleportBoard;

if(_canTeleport)exitwith{
	{_x moveInAny _vehicle} forEach _men;
	private _crewMen = _men select {vehicle _x isEqualTo _vehicle};

	_crewMen;
};

private _crewMen = [];
{
	private _boarded = [_x, _vehicle] call SQFM_fnc_manGetInVehicle;
	if(_boarded)then{_crewMen pushBackUnique _x;};
	
} forEach _men;

_crewMen;