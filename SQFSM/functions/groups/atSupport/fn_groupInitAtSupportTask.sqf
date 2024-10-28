params[
    ["_target",nil,     [objNull]],
    ["_caller",grpNull, [grpNull]]
];

private _canMove      = _self call ["initAtSupportTravel",[_target]];
if!(_canMove)exitWith{"AT-Support cannot move to target" call dbgm};

private _arrivalCode  = {(_self call ["ownerData"]) call ["onAtInsertion"]};
private _endCode      = {(_self call ["ownerData"]) call ["endAtSupport"]};
private _updateCode   = {(_self call ["ownerData"]) call ["atSupportUpdate"]};
private _grpPos       = _self call ["getAvgPos"];
private _targetPos    = getPosATLVisual _target;
private _taskName     = ["AT-Support"]joinString"";
private _taskParams   = [_target, _caller];
private _zoneRadius   = selectMin [1000, floor(_targetPos distance2D _grpPos)];
private _zone         = [_targetPos, _zoneRadius];

_self set  ["action",      _taskName];
_self call ["initAtTarget",[_target]];
_self call ["initTask",
[
    _taskName,     // Taskname     ["name"]
    _zone,         // Task zone    ["zone"]
    [_targetPos],  // Positions    ["positions"]
    _taskParams,   // TaskParams   ["params"]
    _arrivalCode,  // Arrival-code ["arrivalCode"]
    _endCode,      // End-code     ["endCode"]
    _updateCode
]];

true;