params[
    ["_vehicle",nil,[objNull]]
];

private _class  = ([_vehicle] call SQFM_fnc_vehicleDescription)#0;
private _type   = [_class] call SQFM_fnc_vehicleClass;
private _isArty = _type isEqualTo "artillery";

_isArty;