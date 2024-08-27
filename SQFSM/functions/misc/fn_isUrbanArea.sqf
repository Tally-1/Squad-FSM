params[
    ["_position",  nil, [[]]],
    ["_radius",     nil, [0]],
    ["_buildings", nil, [[]]]
];
private _urbanCoef = _this call SQFM_fnc_zoneUrbanCoef;
private _minCoef   = 0.22;
if(_urbanCoef >= _minCoef)exitWith{true};

false;