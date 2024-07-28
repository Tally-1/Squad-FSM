params[
    ["_buildings", nil,[[]]],
    ["_pos",       nil,[[]]]
];

if(_buildings isEqualTo [])
exitWith{[0.0001,0.0001,0.0001]};

private _distances = [];
private _posCounts = [];
private _sizes     = [];

{
    private _distance  = _x distance2D _pos;
    private _positions = [_x] call SQFM_fnc_buildingPosCount;
    private _shape     = [_x] call SQFM_fnc_objectShape;
    private _size      = selectMax [(_shape get "width"),(_shape get "length")];

    _distances pushBack _distance;
    _posCounts pushBack _positions;
    _sizes     pushBack _size;

    
} forEach _buildings;

private _maxDistance = selectMax _distances;
private _maxPosCount = selectMax _distances;
private _maxSize     = selectMax _distances;

if(isNil "_maxDistance") then{_maxDistance=0.0001};
if(isNil "_maxPosCount") then{_maxPosCount=0.0001};
if(isNil "_maxSize")     then{_maxSize=0.0001};

[_maxDistance, _maxPosCount, _maxSize];