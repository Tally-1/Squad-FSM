params[
	["_vehicle", nil, [objNull]]
];

if(isNil "_vehicle")exitWith{
	"Vehicle is nil!" call dbgm;
	[-1,"nil","nil"];
};

private _vehicleData = [_vehicle]     call objScan_fnc_vehicleData;
private _description = [_vehicleData] call ObjScan_fnc_vehicleDescription;
private _class       = _vehicleData get"chassis"get"chassisID";
private _classDesc   = [_class] call SQFM_fnc_vehicleClass;

if("Artillery" in _description)
then{_class = 6;};

[_class, _classDesc, _description];