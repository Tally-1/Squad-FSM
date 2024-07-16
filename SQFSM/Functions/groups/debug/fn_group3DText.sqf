params [
	["_group", nil, [grpNull]]
];

private _data     = _group getVariable "SQFM_grpData";
private _taskData = _data call ["getTaskData"];
private _taskName = _taskData get "name";
private _action   = _data get "action";

if(isNil "_action")
then{_action = "";};

if(isNil "_taskName")
exitWith{_action};

if(_taskName isEqualTo "transport")
exitWith{_taskData get "state"};

_action