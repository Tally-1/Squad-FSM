private _group   = _self get "group";
private _valid   = [_group] call SQFM_fnc_validGroup;
if(!_valid)exitWith{_self call ["end",[false]]};

private _battle  = _self get "battle";
if(isNil "_battle")
exitWith{_self call ["end",[false]]};

private _switchNow = _self call ["canSwitchTask"];
if(_switchNow)exitWith{_self call ["end",[true]]};

private _target       = _self get "target";
private _valid        = [_target] call SQFM_fnc_validGroup;
if(!_valid)exitWith{_self call ["end",[true]]};

private _grpData  = _group call getData;
if(isNil "_grpData")exitWith{_self call ["end",[true]]};

private _activeWp = _grpData call ["activeWp"];
if(isNil "_activeWp") exitWith {_self call ["end",[true]]};
if(!_activeWp)        exitWith {["end",[true]]};

private _taskType = _self get "type";
if(_taskType isEqualTo "push")  exitWith{_self call ["updatePush"]};
if(_taskType isEqualTo "flank") exitWith{_self call ["updateFlank"]};
if(_taskType isEqualTo "hold")  exitWith{_self call ["updateHold"]};

true;