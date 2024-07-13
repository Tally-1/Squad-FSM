private _defAbrt = {_self call ["endTask"]};
params[
	["_taskName",    nil,      [""]], // The name of the task.
	["_zone",        nil,      [[]]], // [pos, rad] (where the task will take place)
	["_positions",   [],       [[]]], // Array of positions used in the task 
	["_taskParams",  [],       [[]]], // Other data you may need 
	["_arrivalCode", {},       [{}]], // Code called on arrival (If travel is needed)
	["_endCode",     {},       [{}]], // Code called when the task is ended.
    ["_updateCode",  {},       [{}]], // Code called during the task.
    ["_condition",   {true},   [{}]], // Code called to check if it can continue.
    ["_abortCode",   _defAbrt, [{}]]  // Code called when the task is neded.
];
private _owner   = _self get "grp";
private _dataArr = [
	["name",                                           _taskName],
	["zone",                                               _zone],
	["positions",                                     _positions],
	["params",                                       _taskParams],
	["state",                                      "initialized"],
	["owner",                                             _owner],
	["ownerData", {_self get "owner" getVariable "SQFM_grpData"}],
	["active",                                              true],
    ["aborted",                                            false],
	["waypoints",                                             []],
    /***********************{Methods}***************************/
	["startTime",                                           time],
	["timeSinceStart",          {time - (_self get "startTime")}],
	["addWaypoint",                     SQFM_fnc_addTaskWaypoint],
    ["update",                                       _updateCode],
	["endCode",                                         _endCode],
	["arrivalCode",                                 _arrivalCode],
    ["abort",                                 SQFM_fnc_abortTask],
    ["abortCode",                                     _abortCode],
	["endTask",                                 SQFM_fnc_endTask]
];
private _taskData = createHashmapObject [_dataArr];

_self set ["taskData", _taskData];

SQFM_taskGroups pushBackUnique _owner;

_taskData;