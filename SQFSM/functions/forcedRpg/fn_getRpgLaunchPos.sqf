params[
    ["_man",      nil,         [objNull]],
    ["_target",   nil,         [objNull]],
    ["_maxRange", SQFM_maxRpgRange,  [0]]
];

// Return current position if the RPG guy can shoot from there.
if([_man, _target] call SQFM_fnc_isValidRpgFirePos)
exitWith{getPosATLVisual _man;};

private ["_launchPos"];

isNil{ 
private _targetPosASL = aimPos _target;
private _positions    = [_man, _target, _maxRange] call SQFM_fnc_rpgLaunchZoneCone;
_positions = [_positions, [], {_man distance2D _x}, "ASCEND"] call BIS_fnc_sortBy;

{
    if(!isNil "_launchPos")exitWith{};
    private _firePos = ATLToASL (_x vectorAdd [0,0,1.4]);
    private _valid   = [_man, _target, _firePos] call SQFM_fnc_isValidRpgFirePos;
    if(_valid)exitWith{_launchPos = _x};
    
} forEach _positions;

};

if(isNil "_launchPos")exitWith{systemChat "No pos found";nil};

_launchPos;