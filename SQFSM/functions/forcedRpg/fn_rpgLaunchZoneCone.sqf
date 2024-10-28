// Returns an array of positions between a shooter and a target
params[
    ["_shooter", nil,          [objNull]],
    ["_target",  nil,          [objNull]],
    ["_width",   200,                [0]], // Width (in degrees) of the cone
    ["_maxRange", SQFM_maxRpgRange,  [0]]
];
private _shooterPos = getPosATL _shooter;
private _targetPos  = getPosATL _target;
private _distance   = _shooter distance _target;
private _posSpread  = round (_distance*0.15);
private _dir        = _target getDir _shooter;

if(_distance < 50)        then{_distance = 50};
if(_distance > _maxRange) then{_distance = _maxRange};

private _positions = [
    _targetPos,
    _distance,
    _dir,
    _width,
    40,
    _posSpread
] call SQFM_fnc_zoneCone;

_positions;