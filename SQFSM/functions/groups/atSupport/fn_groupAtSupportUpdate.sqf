private _taskData = _self call ["getTaskData"];
(_taskData get"params")params[
    ["_target",nil,[objNull]]
];
private _valid = [_target] call SQFM_fnc_validAtTarget;
if!(_valid)exitWith{_taskData call["endTask"]};

private _hasAt = _data call ["isATsquad"];
if!(_hasAt)exitWith{_taskData call["endTask"]};

true;