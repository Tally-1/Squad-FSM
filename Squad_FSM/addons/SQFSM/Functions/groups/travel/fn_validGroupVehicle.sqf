params[
	["_vehicle", nil, [objNull]]
];
private _grpPos   = _self get"groupCluster"get"position";

if(!alive _vehicle)
exitWith{false;};

if(!canMove _vehicle)
exitWith{false;};

if(fuel _vehicle < 0.05)
exitWith{false;};

if!([_vehicle] call SQFM_fnc_isLandVehicle)
exitWith{false;};

private _men           = _self call ["getUnits"];
private _menInVehicles = _men select {vehicle _x isEqualTo _vehicle};
private _crewed        = count _menInVehicles > 0;

if(_vehicle distance2D _grpPos > 200
&&{_crewed isEqualTo false})
exitWith{false;};

true;