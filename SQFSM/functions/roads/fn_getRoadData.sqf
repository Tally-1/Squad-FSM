params[
    ["_roadSegment",nil,[objNull]]
];getRoadInfo _roadSegment
params[
    ["_type",         nil,   [""]],
    ["_width",        nil,    [0]],
    ["_pedestrian",   nil, [true]],
    ["_texture",      nil,   [""]],
    ["_textureEnd",   nil,   [""]],
    ["_material",     nil,   [""]],
    ["_begPos",       nil,   [[]]],
    ["_endPos",       nil,   [[]]],
    ["_isBridge",     nil, [true]],
    ["_AIpathOffset", nil,    [0]]
];
// private _shape     = [_roadSegment] call SQFM_fnc_objectShape;
private _length    = _begPos distance2D _endPos;//(_shape get "length")+0;
private _dir       = _begPos getDir _endPos; //getDirVisual _roadSegment;
private _position  = getPosATLVisual _roadSegment;
private _connected = roadsConnectedTo _roadSegment;
private _dataArr = [
    ["type",                _type],
    ["segment",      _roadSegment],
    ["position",        _position],
    ["dir",                  _dir],
    ["width",              _width],
    ["length",            _length],
    ["pedestrian",    _pedestrian],
    ["startPos",          _begPos],
    ["endPos",            _endPos],
    ["isBridge",        _isBridge],
    ["connected",      _connected]
];

private _hashmap = createHashmapObject [_dataArr];

_hashmap;