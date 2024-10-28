params[
    ["_group",nil,[grpNull]]
];
private _self     = _group call getData;
private _taskData = _self call ["getTaskData"];
private _target   = (_taskData get "params")#0;
private _valid    = [_target] call  SQFM_fnc_validAtTarget;
if!(_valid)exitWith{_taskData call["endTask"]};

_self call ["onAtInsertion"];

true;