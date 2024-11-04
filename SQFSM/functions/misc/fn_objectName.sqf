params[
    ["_object",nil,[objNull]]
];
private _name = getText (configfile >> "CfgVehicles" >> (typeOf _object) >> "displayName");

_name;