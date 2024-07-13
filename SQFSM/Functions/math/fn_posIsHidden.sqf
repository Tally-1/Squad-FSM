params[
    ["_pos",            nil,  [[]]], // The position that is being evaluated
    ["_enemyPositions", nil,  [[]]], // A list of positions to hide from
    ["_z",              0,     [0]], // Meters above ground (at 0 it may give a false positive)
    ["_objectList",     [],   [[]]]  // A list of units or vehicles that does not break LOS 
];

private _hidden = true;
private _startPos = ATLToASL [_pos#0, _pos#1, _z];
{
    if!(_hidden)exitWith{};

    private _endPos  = ATLToASL [_x#0, _x#1, _z];
    private _blocked = [_startPos,_endPos,_objectList] call SQFM_fnc_lineBroken;
    
    if!(_blocked)exitWith{_hidden = false;};

} forEach _enemyPositions;

_hidden;