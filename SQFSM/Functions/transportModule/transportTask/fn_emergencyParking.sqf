params[
    ["_vehicle", nil, [objNull]],
    ["_enemy",   nil, [objNull]]    
];
private _driver = driver _vehicle;
private _pos    = getPosATLVisual _vehicle;
if(!alive _driver)exitWith{_pos};


private _rad           = selectMax [(_enemy distance2D _pos), (_enemy distance2D _vehicle), 50]; 
private _positions     = [_pos, _rad, 50, 2] call SQFM_fnc_squareGrid;
private _safePositions = [_positions, [_enemy],true] call SQFM_fnc_selectSafePositions;
if(_safePositions isEqualTo [])exitWith{_pos};

private _nearest = [_pos, _positions] call SQFM_fnc_getNearest;

_nearest;