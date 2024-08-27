params[
	["_objModule",nil,[objNull]]
];
[_self, _objModule]spawn{
params
["_self", "_objModule"];
private _infilPos  = _self call ["objectiveInsertPos", [_objModule]];
private _canTravel = _self call ["initTravel",[_infilPos]];
if!(_canTravel)exitWith{"Could not travel and attack" call dbgm;};

_self set ["action", "Attacking Objective!"];
_self call["assignObjective",[_objModule]];
private _taskName    = "Attack Objective";
private _objData     = _objModule call getData;
private _zone        = _objData get "zone";
// private _arrivalCode = {(_self call ["ownerData"]) call ["objectiveAttackLoop"]};
private _arrivalCode = {(_self call ["ownerData"]) call ["onObjectiveArrival"]};
private _endCode     = {(_self call ["ownerData"]) call ["endObjectiveAttack"]};
private _task       = _self call ["initTask",
[
    _taskName,      // Taskname     ["name"]
    _zone,          // Task zone    ["zone"]
    [_infilPos],    // Positions    ["positions"]
    [_objModule],   // TaskParams   ["params"]
    _arrivalCode,   // Arrival-code ["arrivalCode"]
    _endCode        // End-code     ["endCode"]
]];

};