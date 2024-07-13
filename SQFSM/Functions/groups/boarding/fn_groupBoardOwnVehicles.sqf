private _vehicles       = _self call ["getOwnVehicles"];
private _menOnFoot      = _self call ["getUnitsOnfoot"];
private _grpVehInUse    = _vehicles#2;
private _allOwnVehicles = _vehicles#0;
private _hasCapacity    = [_menOnFoot, _grpVehInUse] call SQFM_fnc_vehiclesCanTransportMen;
if(_hasCapacity)exitWith{
	[_menOnFoot, _grpVehInUse] call SQFM_fnc_menOrderGetInVehicles;
};

[_menOnFoot, _allOwnVehicles] call SQFM_fnc_menOrderGetInVehicles;

true;