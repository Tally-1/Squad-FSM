private _group = _self get "grp";
private _valid = [_group] call SQFM_fnc_validGroup;
if!(_valid)exitWith{false};

private _waiting = _self get "awaitingReplenish" || {_self get "awaitingReforce"};
if(_waiting)exitWith{false};

private _groupType = _self get "groupType";
if("transport" in _groupType)exitWith{false};

true;