// Returns a position a position to the left or right of a target.
params[
    ["_startPos", nil,  [[]]],  // Position of attacker
    ["_targetPos",nil,  [[]]],  // Position of target being flanked
    ["_flankSide",nil,  [""]],  // "left" or "right" "center" from the POV of the attacker
    ["_distance", nil,   [0]],  // Distance from the target to the flankPosition
    ["_findClear",nil,[true]]   // If a clear position should be searched for.
];
if(_flankSide isEqualTo "center")exitWith{_startPos};

// Calculate the direction from the attacker to the target
private _direction = _startPos getDirVisual _targetPos;
private _flankDir  = if (_flankSide isEqualTo "left") then {_direction - 100} else {_direction + 100};

_flankDir = [_flankDir] call SQFM_fnc_formatDir;

private _flankPos = _targetPos getPos [_distance, _flankDir];

if(_findClear)
then{_flankPos = [_flankPos]call SQFM_fnc_findParkingSpot};

_flankPos;