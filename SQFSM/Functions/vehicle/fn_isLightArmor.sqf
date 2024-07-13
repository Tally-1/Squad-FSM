params[
    ["_vehicle", nil, [objNull]]
];
private _class        = ([_vehicle] call SQFM_fnc_vehicleDescription)#1;
private _isLightArmor = _class isEqualTo "light armor";

_isLightArmor;