params [
    ["_pos",     nil,  [[]]], // Center position of the zone
    ["_rad",     nil,   [0]],  // Radius of the zone
    ["_posDist", 10,    [0]] 
];

private _positions = []; // Array to store the positions

// Iterate over the radius, generating semicircles with decreasing radii
for "_r" from _rad to 0 step -_posDist do { 
    if(_r < _posDist)exitWith{};

    private _semiCirclePositions = [[_pos, _r],0, 359, _posDist] call SQFM_fnc_semiCirclePosArr;
    private _lastIndex = count _semiCirclePositions-1;
    private _first     = _semiCirclePositions#0;
    private _last      = _semiCirclePositions#_lastIndex;
        
    if(_first distance2D _last < _posDist)
    then{
        _semiCirclePositions deleteAt _lastIndex;
        _lastIndex = count _semiCirclePositions-1;
        _last      = _semiCirclePositions#_lastIndex;
        if(_first distance2D _last < _posDist)
        then{_semiCirclePositions deleteAt _lastIndex};
    };

    _positions append _semiCirclePositions;
};

_positions;