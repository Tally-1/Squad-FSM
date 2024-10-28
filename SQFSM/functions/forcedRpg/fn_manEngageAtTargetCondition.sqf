params[
    ["_man",    nil,[objNull]],
    ["_target", nil,[objNull]]
];
private _lastCheck = _man getVariable ["SQFM_lastAtConditionCheck", 0];
private _timeSince = time - _lastCheck;
if(_timeSince < 2)exitWith{true};

private _valid = [_target] call  SQFM_fnc_validAtTarget;
if!(_valid)exitWith{false};

private _isAtMan = [_man,true] call  SQFM_fnc_isAtMan;
if!(_isAtMan)exitWith{false};

private _canShoot = [_man, _target] call SQFM_fnc_isValidRpgFirePos;
if!(_canShoot)exitWith{true};

false;