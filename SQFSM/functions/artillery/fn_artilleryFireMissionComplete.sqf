private _complete = _self get "complete";
if(_complete)exitWith{true};

private _timeOut = time>(_self get "timeLimit");
if(_timeOut)exitWith{true};

private _vehicle = _self get "vehicle";
if(!alive _vehicle)exitWith{true};

private _noCrew = [_vehicle] call SQFM_fnc_deadCrew;
if(_noCrew)exitWith{true};

private _gunner = gunner _vehicle;
if(isNull _gunner)exitWith{true};
if(!alive _gunner)exitWith{true};

private _unConscious = [_gunner] call SQFM_fnc_unconscious;
if(_unConscious)exitWith{true};

if(!canFire _vehicle)exitWith{true};

private _hasAmmo = [_vehicle] call SQFM_fnc_artilleryHasLethalAmmo;
if(!_hasAmmo)exitWith{true};

private _roundsToFire = _self get "count";
if(_roundsToFire < 1)exitWith{true};

false;