params[
    ["_startPos",  nil,                                 [[]]], // The position where you start the calculation
    ["_zone",      nil,                                 [[]]], // The dangerous area [pos, rad]
    ["_ownSide",   nil, [objNull,west,grpNull,createHashmap]], // the (side of the) entity doing the inquiry
    ["_bufferRad", nil,                                  [0]], // Added distance to Zone-radius 
    ["_dirRange",  nil,                                  [0]], // The width in degrees (0-359)
    ["_posDist",   nil,                                  [0]]//, // Distance between the returned positions.
];
private _safePositions = [];

isNil{
private _center     = _zone#0;
private _radius     = _zone#1;
private _maxDist    = _startPos distance2D _center;
private _finalRad   = _radius+_bufferRad;

if(_finalRad > _maxDist)then{_finalRad = _maxDist};

private _enemies   = [_ownSide, [_center, _finalRad]] call SQFM_fnc_enemiesInZone;
private _zeroDir   = [_center getDir _startPos] call SQFM_fnc_formatDir;
private _zeroPos   = [_center, _zeroDir, _finalRad] call SQFM_fnc_sinCosPos;
private _positions = [];
private _line1     = [[_center, _finalRad-_posDist], _zeroDir, _dirRange, _posDist] call SQFM_fnc_semiCirclePosArr;
private _line2     = [[_center, _finalRad], _zeroDir, _dirRange, _posDist] call SQFM_fnc_semiCirclePosArr;
private _line3     = [[_center, _finalRad+_posDist], _zeroDir, _dirRange, _posDist] call SQFM_fnc_semiCirclePosArr;

_positions append _line1;
_positions append _line2;
_positions append _line3;

_safePositions = [_positions, _enemies] call SQFM_fnc_selectSafePositions;

// SQFM_Custom3Dpositions = [];
// SQFM_Custom3Dpositions append (_positions apply{[_x]});
// SQFM_Custom3Dpositions append (_safePositions apply{[_x,str(round (_x distance2D _center)),[0,1,0,1]]});
};

_safePositions;