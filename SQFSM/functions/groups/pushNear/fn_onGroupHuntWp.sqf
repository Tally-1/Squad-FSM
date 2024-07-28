params[
	["_group", nil, [grpNull]]
];
private _data     = _group call getData;
private _taskData = _data call ["getTaskData"];
private _nullTask = str _taskData isEqualTo "[]";


_taskData call ["endTask"];

true;