params[ 
    ["_startPosASL", nil,      [[]]],
    ["_building",    nil, [objNull]]
];
private _shape     = [_building] call SQFM_fnc_objectShape;
private _size      = _shape get "maxSize";
private _modelPos  = ATLToASL(_building modelToWorld (_shape get "center"));
private _distance  = (_startPosASL distance _modelPos) - _size;
private _targetPos = [_startPosASL, _modelPos, _distance] call SQFM_fnc_posOnVector;

_targetPos;