params[
	["_taskName",    nil, [""]], // The name of the task.
	["_zone",        nil, [[]]], // [pos, rad] (where the task will take place)
	["_positions",   [],  [[]]], // Array of positions used in the task 
	["_taskParams",  [],  [[]]], // Other data you may need 
	["_arrivalCode", {},  [{}]], // Code called on arrival (If travel is needed)
	["_endCode",     {},  [{}]]  // Code called when the task is neded.
];
private _dataArr = [
	["name",                                           _taskName],
	["zone",                                               _zone],
	["positions",                                     _positions],
	["params",                                       _taskParams],
	["state",                                     "initialized"],
	["owner",                                  (_self get "grp")],
	["ownerData", {_self get "owner" getVariable "SQFM_grpData"}],
	["active",                                              true],
	["waypoints",                                             []],
	["startTime",                                           time],
	["timeSinceStart",          {time - (_self get "startTime")}],
	["addWaypoint",                     SQFM_fnc_addTaskWaypoint],
	["endCode",                                         _endCode],
	["arrivalCode",                                 _arrivalCode],
	["endTask",                                 SQFM_fnc_endTask]
];
private _taskData = createHashmapObject [_dataArr];
_self set ["taskData", _taskData];

_taskData;