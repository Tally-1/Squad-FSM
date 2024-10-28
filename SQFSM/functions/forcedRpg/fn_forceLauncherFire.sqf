params[
    ["_man",nil,[objNull]]
];
private _timeLimit = round(time+15);
private _launcher  = secondaryWeapon _man;
private _rifle     = primaryWeapon _man;
private _mode      = (getArray (configFile >> "CfgWeapons" >> _launcher >> "modes"))#0;
private _eh        = [_man] call SQFM_fnc_forcedLauncherEh;

if(isNil "_mode")then{_mode = "this"};

_man enableAI "anim";
_man selectWeapon _launcher;

if(currentWeapon _man != _launcher)
then{_man selectWeapon _launcher}
else{_man forceWeaponFire [_launcher, _mode]};

waitUntil { 
        private _timeOut = time> _timeLimit;
        if(_timeOut)exitWith{true};
        
        private _fired = _man getVariable ["SQFM_forcedLauncher", false];
        if(_fired)exitWith{true};

        if(currentWeapon _man != _launcher)
        then{_man selectWeapon _launcher};

        _man forceWeaponFire [_launcher, _mode];
        
        false;
};

_man forceWeaponFire ["",""];
_man selectWeapon _rifle;
_man setVariable ["SQFM_forcedLauncher",nil];
_man removeEventHandler ["Fired", _eh]; 

true;