params[
    ["_vehicle",nil,[objNull]]
];
private ["_smoker"];
{
    private _weapons = _vehicle weaponsTurret _x;

    if("SmokeLauncher" in _weapons)
    exitWith{_smoker = _vehicle turretUnit _x};
    
} forEach (allTurrets _vehicle);

if(isNil "_smoker") then{_smoker = driver _vehicle};
if(isNull _smoker)  exitwith{"no smokers on board" call dbgm};


_smoker forceWeaponFire ["SmokeLauncher","SmokeLauncher"];

true;