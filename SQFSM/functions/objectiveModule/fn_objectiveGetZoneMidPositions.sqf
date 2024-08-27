params[
    ["_dir",       0,        [0]],
    ["_posCount",  4,        [0]],
    ["_randomRad", false, [true]]
];
private _center    = (_self get "zone")#0;
private _radius    = (_self get "zone")#1;
private _dir       = _startPos getDir _center;
private _altitude  = 0;
private _coef      = if(_randomRad)then{0.5}else{0.35+(random 0.55)};

// This ensures we get positions between the center and the edge of the objective
// The random coef is usefull to make ai pathing unpredictable for the player.
// The output of the random coef is 35-90% of the zone radius.
_radius = _radius * _coef;

private _positions = [_center, _radius, _posCount, _altitude, _dir] call SQFM_fnc_pos360;

_positions;