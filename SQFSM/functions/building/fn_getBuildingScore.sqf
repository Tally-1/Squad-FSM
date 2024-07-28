params[
    ["_building",    nil, [objNull]],
    ["_pos",         nil,      [[]]],
    ["_maxDistance", nil,       [0]],
    ["_maxPosCount", nil,       [0]],
    ["_maxSize",     nil,       [0]],
    ["_ownMen",      nil,      [[]]]
];
private _occupants = count([_building] call SQFM_fnc_menInsideBuilding select {!(_x in _ownMen)});
// private _movingIn  = _building getVariable ["SQFM_movingIn",0];
private _distance  = _building distance2D _pos;
private _posCount  = [_building] call SQFM_fnc_buildingPosCount;
private _shape     = [_building] call SQFM_fnc_objectShape;
private _size      = selectMax [(_shape get "width"),(_shape get "length")];

private _distCoef = (_maxDistance/_distance)*0.2; // Distance is less important than size and poscount
private _posCoef  = (_posCount/_maxPosCount)*1.2;
private _sizeCoef = (_size/_maxSize);
private _score    = _distCoef+_posCoef+_sizeCoef;

// _occupants=_occupants+_movingIn;

if(_occupants > 0)
then{
    _score = _score*0.5;
    if(_occupants > 4)
    then{_score = _score*0.5};
};

_score;