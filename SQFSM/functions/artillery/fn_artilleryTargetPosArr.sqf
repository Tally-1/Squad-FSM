params[
    ["_targetPos", nil,      [[]]],
    ["_vehicle",   nil, [objNull]],
    ["_magazine",  nil,      [""]]
];
private _posArr      = [];
private _radius      = SQFM_artySpread;
private _direction   = 0;
private _dirRange    = round floor 360;
private _posDist     = 20;
private _clearDist   = _posDist;
private _maxPosCount = 20;

isNil{
_posArr = [
    _targetPos,
    _radius,
    _direction,
    _dirRange,
    _clearDist,
    _posDist
] call SQFM_fnc_zoneCone;

_posArr = _posArr select {
    private _eta   = _vehicle getArtilleryETA [_x, _magazine];
    private _valid = _eta > 0;
    _valid;
};

if(_posArr isEqualTo [])
then{"No valid artillery positions, attempting to fire at target" call dbgm};
};

// Make sure to also include the actual target.
_posArr pushBack _targetPos;

_posArr;