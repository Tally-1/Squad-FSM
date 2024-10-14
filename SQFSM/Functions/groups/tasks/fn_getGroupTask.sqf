params[
	["_group",nil,[grpNull]]
];
private _data = _group call getData;
if(isNil "_data")exitWith{};

private _task = _data get "taskData";
private _strT = str _task;

if(_strT isNotEqualTo "[]")exitWith{_task};

_task = [_group] call SQFM_fnc_reapplyTask;

_task;