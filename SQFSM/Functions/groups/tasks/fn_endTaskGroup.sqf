params[
	["_group",nil,[grpNull]]
];
private _data     = _group call getData;
private _taskData = _data call ["getTaskData"];
private _nullTask = str _taskData isEqualTo "[]";

if(_nullTask)then{
	_taskData = [_group] call SQFM_fnc_reapplyTask;
	_nullTask = str _taskData isEqualTo "[]";
};

if(_nullTask)
exitWith{"{TaskData not found}" call dbgm};

_taskData call["endTask"];

true