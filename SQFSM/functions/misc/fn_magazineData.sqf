params[
    ["_magazine",nil,[""]],
    ["_ammoCount",nil,[0]]
];
private _magData      = [_magazine] call objScan_fnc_magazineData;
private _ammo         = _magData get "AmmoType";
private _ammoData     = [_ammo] call ObjScan_fnc_getAmmoData;
private _ammoClass    = _ammoData get "class ID";
private _description  = _ammoData get "Description";
private _splashDamage = _ammoData get "splashDamage";
private _splashRange  = _ammoData get "splashRange";
private _baseDamage   = _ammoData get "dammage";
private _artyHE       = "8"in str _ammoClass;
private _dataArr      = [
    ["name",             _magazine],
    ["ammoClass",       _ammoClass],
    ["description",   _description],
    ["splashRange",   _splashRange],
    ["splashDamage", _splashDamage],
    ["damage",         _baseDamage],
    ["count",           _ammoCount],
    ["artyHE",             _artyHE]
];

private _data = createHashmapObject [_dataArr];

_data;