params[
    ["_callPos",nil,[[]]] // The position the call was made from.
];
private _side    = _self get "side";
private _zone    = [_callPos, 150];
private _enemies = [_side, _zone] call SQFM_fnc_enemiesInZone;


if(_enemies isEqualTo [])exitWith{_callPos};

private _grpPos     = _self call ["getAvgPos"];
private _insertZone = [_callPos, 100];
private _buffer     = 200;
private _dirRange   = 140;
private _posDist     = 50;

private _safePositions = 
[
    _grpPos,
    _zone,
    _side,
    _buffer,
    _dirRange,
    _posDist
] call SQFM_fnc_dangerZoneSafePositions;

private _safePos   = [_callPos, _safePositions] call SQFM_fnc_getNearest;

_safePos;