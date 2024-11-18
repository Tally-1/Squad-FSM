private _group = _self get "grp";
private _valid = [_group] call SQFM_fnc_validGroup;
if!(_valid)exitWith{false};

private _waiting = _self get "awaitingReplenish";
if(_waiting)exitWith{false};

if(_self call["isPlayerGroup"])exitWith{false};

true;