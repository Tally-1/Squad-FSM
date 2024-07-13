params[
    ["_vehicle", nil, [objNull]]
];
private _class        = ([_vehicle] call SQFM_fnc_vehicleDescription)#1;
private _isHeavyArmor = _class isEqualTo "heavy armor";

_isHeavyArmor;