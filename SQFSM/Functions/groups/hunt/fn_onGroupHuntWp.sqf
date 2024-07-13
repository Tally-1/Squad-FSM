params[
	["_group", nil, [grpNull]]
];
private _data     = _group call getData;
private _taskData = _data get "taskData";
_taskData call ["endTask"];

true;