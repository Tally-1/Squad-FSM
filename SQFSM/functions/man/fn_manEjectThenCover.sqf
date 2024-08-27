params [
    ["_man",       nil, [objNull]],
    ["_vehicle",   nil, [objNull]],
    ["_coverPos",  nil,      [[]]],
    ["_timeLimit", time+10,   [0]],
    ["_ejectOnly", false,    [[]]]
];
private _onArrival = [_this, SQFM_fnc_manEjectThenCoverOnArrival];
private _condition = [_man, {currentCommand _this isEqualTo "SCRIPTED"}];
private _ready     = [_man, _vehicle, true, _timeLimit] call SQFM_fnc_manEjectFromVehicle;

if(_ejectOnly) exitWith{[_man, "Ejected without moving"]   spawn SQFM_fnc_flashActionMan};
if!(_ready)    exitWith{[_man, "Failed to eject -> cover"] spawn SQFM_fnc_flashActionMan};


[_man, "Moving to position"] spawn SQFM_fnc_flashActionMan;

[
    _man, 
    _coverPos, 
    _timeLimit, 
    3,
    _onArrival
] call SQFM_fnc_fsmMoveManToPos;

true;