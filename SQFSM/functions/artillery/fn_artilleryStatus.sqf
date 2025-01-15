params[
    ["_vehicle",nil,[objNull]]
];
if(!alive _vehicle)exitWith{"destroyed"};
private _noCrew = [_vehicle] call SQFM_fnc_deadCrew;
if(_noCrew)exitWith{"no crew"};

private _gunner = gunner _vehicle;
if(isNull _gunner)exitWith{"no gunner"};
if(!alive _gunner)exitWith{"gunner dead"};

private _unConscious = [_gunner] call SQFM_fnc_unconscious;
if(_unConscious)exitWith{"gunner unconscious"};

if(!canFire _vehicle)exitWith{"Broken gun"};

private _hasAmmo = [_vehicle] call SQFM_fnc_artilleryHasLethalAmmo;
if(!_hasAmmo)exitWith{"no lethal ammo"};

private _lastShot = _vehicle getVariable "SQFM_lastArtyFire";
private _time     = if(isNil "_lastShot")then{10000}else{round(time-_lastShot)};
private _coolDown = _time < SQFM_artyCooldown;
if(_coolDown)exitWith{
    private _text = ["Cooldown: ", SQFM_artyCooldown-_time," seconds remaining"]joinString"";
    _text;
};

private _preparing = _vehicle getVariable ["SQFM_preparingArtyFire",false];
if(_preparing)exitWith{
    private _prepStart = _vehicle getVariable ["SQFM_preparingArtyTime",0];
    private _time      = round(SQFM_artyDelay-(time - _prepStart));
    private _text      = ["Preparing to fire, ",_time," seconds left"] joinstring"";
    _text;
};

private _busy = [_vehicle] call SQFM_fnc_artilleryHasActiveFireMission;
if(_busy)exitWith{"Fire mission Assigned"};

"ready";