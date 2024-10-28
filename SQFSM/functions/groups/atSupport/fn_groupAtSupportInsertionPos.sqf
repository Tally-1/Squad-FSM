params[ 
    ["_target",nil,[objNull]]
];
private _grpPos     = _self call ["getAvgPos"];
private _targetPos  = getPosATLVisual _target;
private _distance   = _grpPos distance2D _targetPos;
private _direction  = _targetPos getDir _grpPos;
private _radius     = selectMin [300, _distance];
private _clearDist  = _radius*0.7; // 100; // 
private _dirRange   = 180;
private _posDist    = 50;
private _side       = _self get "side";
private _enemies    = [_side, [_targetPos, _radius]] call SQFM_fnc_enemiesInZone;
private _positions  = [
    _targetPos,
    _radius,
    _direction,
    _dirRange,
    _clearDist,
    _posDist
] call SQFM_fnc_zoneCone;

private _safePositions = [_positions, _enemies]    call SQFM_fnc_selectSafePositions;
private _safePos       = [_grpPos, _safePositions] call SQFM_fnc_getNearest;

if(isNil "_safePos")exitWith{};

SQFM_Custom3Dpositions = [[_safePos, "AT-support insertion-pos"]];

_safePos;