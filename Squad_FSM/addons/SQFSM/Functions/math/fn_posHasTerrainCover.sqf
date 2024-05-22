params[
    ["_pos",            nil,  [[]]], // The position that is being evaluated
    ["_enemyPositions", nil,  [[]]], // A list of positions to hide from
    ["_z",              3,     [0]]  // Meters above ground (at 0 it may give a false positive)
];
if(surfaceIsWater _pos)exitWith{false;};

private _hasCover    = true;
private _searchEnded = false;
private _startPos    = [_pos#0, _pos#1, _z];

{
    if(_searchEnded)exitWith{};

    private _endPos  = [_x#0, _x#1, _z];
    private _inCover = terrainIntersect [_startPos, _endPos];
    
    if!(_inCover)exitWith{
        _hasCover    = false;
        _searchEnded = true;
    };

    
} forEach _enemyPositions;

_hasCover;