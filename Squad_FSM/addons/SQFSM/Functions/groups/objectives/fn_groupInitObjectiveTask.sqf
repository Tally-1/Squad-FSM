params[
	["_objectiveModule", nil,        [objNull]],
    ["_taskName",        "Take Objective",[""]]
];

private _objctvData = _objectiveModule getVariable "SQFM_objectiveData";
private _zone       = _objctvData get "zone";
private _pos        = _objctvData get "position";
private _onArrival  = {(_self call ["ownerData"]) call ["onObjectiveArrival"]};
private _onTaskEnd  = {(_self call ["ownerData"]) call ["guardObjective"]};
private _task       = _self call ["initTask",
[
    "Taking Objective", // Taskname     ["name"]
    _zone,              // Task zone    ["zone"]
    [_pos],             // Positions    ["positions"]
    [_objectiveModule], // TaskParams   ["params"]
    _onArrival,         // Arrival-code ["arrivalCode"]
    _onTaskEnd          // End-code     ["endCode"]
]];

_task;