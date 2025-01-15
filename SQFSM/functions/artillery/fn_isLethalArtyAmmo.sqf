params[
    ["_magazine",nil,[""]]
];
private _magData   = [_magazine] call objScan_fnc_magazineData;
private _ammo      = _magData get "AmmoType";
private _ammoData  = [_ammo] call ObjScan_fnc_getAmmoData;
private _ammoClass = _ammoData get "class ID";
private _artyHE    = "8"in str _ammoClass;

_artyHE;