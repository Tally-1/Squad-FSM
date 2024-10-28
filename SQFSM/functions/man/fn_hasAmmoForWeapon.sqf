private _rifle = primaryWeapon (_this#0);
params[
    ["_man",    nil,    [objNull]],
    ["_weapon", _rifle,      [""]]
];
private _hasAmmo = false;

isNil{
    private _weaponData    = [_weapon] call objScan_fnc_weaponData;
    private _magazineTypes = _weaponData get "magazines";
    private _unitMags      = magazines _man;
    private _primaryMags   = primaryWeaponMagazine  _man; 
    private _secondaryMags = secondaryWeaponMagazine _man; 
    private _compatible    = compatibleMagazines _weapon;

    _magazineTypes insert [0,_compatible,true];
    _unitMags      insert [0,_primaryMags,true];
    _unitMags      insert [0,_secondaryMags,true];

    {
        if(_x in _magazineTypes)
        exitWith{_hasAmmo = true};
    } forEach _unitMags;
};


_hasAmmo;