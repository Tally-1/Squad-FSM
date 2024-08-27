params[
    ["_vehicle", nil,[objNull]],
    ["_men",     nil,     [[]]]
];
private _manCount   = count _men;
private _zone       = [getPosATLVisual _vehicle, 20];
private _dir        = [(getDirVisual _vehicle-180)] call SQFM_fnc_formatDir;
private _positions  = [_zone, _dir, 160,5,_manCount] call SQFM_fnc_semiCirclePosArr;

_positions;