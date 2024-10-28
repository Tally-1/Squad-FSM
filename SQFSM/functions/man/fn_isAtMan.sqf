params[
    ["_man",       nil,  [objNull]],
    ["_checkAmmo", false,   [true]]
];
private _isMan = [_man,true] call SQFM_fnc_validMan;
if!(_isMan)exitWith{false};

private _launcher     = secondaryWeapon _man;
private _launcherType = ([_launcher] call objScan_fnc_weaponData)get"description";
private _noLauncher   = _launcher isEqualTo "";
if(_noLauncher)exitWith{false};

private _aaLauncher = _launcherType == "AA misile launcher";
if (_aaLauncher)exitWith{false};
if!(_checkAmmo)  exitWith{true};

private _hasAmmo = [_man, _launcher] call SQFM_fnc_hasAmmoForWeapon;
if!(_hasAmmo)exitWith{false};

true;