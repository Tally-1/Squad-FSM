params[
    ["_position",  nil, [[]]],
    ["_radius",     nil, [0]],
    ["_buildings", nil, [[]]]
];
if(isNil "_buildings")      then{_buildings = [_position, _radius] call SQFM_fnc_nearBuildings};
if(_buildings isEqualTo []) exitWith{0};
if(_radius <= 20)           exitWith{0};

private _count = count _buildings;
private _coef  = _count/_radius;

_coef;