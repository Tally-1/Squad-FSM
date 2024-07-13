private _defTaskName = "Taking Objective";
private _defArrCode  = {(_self call ["ownerData"]) call ["onObjectiveArrival"]};
private _defEndCode  = {(_self call ["ownerData"]) call ["guardObjective"]};
params[
	["_objectiveModule", nil,     [objNull]],
    ["_taskName",        _defTaskName, [""]],
    ["_onArrival",       _defArrCode,  [{}]],
    ["_onTaskEnd",       _defEndCode,  [{}]]
];

private _objctvData = _objectiveModule getVariable "SQFM_objectiveData";
private _zone       = _objctvData get "zone";
private _pos        = _objctvData get "position";
private _task       = _self call ["initTask",
[
    _taskName,          // Taskname     ["name"]
    _zone,              // Task zone    ["zone"]
    [_pos],             // Positions    ["positions"]
    [_objectiveModule], // TaskParams   ["params"]
    _onArrival,         // Arrival-code ["arrivalCode"]
    _onTaskEnd          // End-code     ["endCode"]
]];

_task;