params[
    ["_group", nil,     [grpNull]],
    ["_map",   nil, [controlNull]]
];
private _data      = _group call getData;
private _mouseOver = _group isEqualTo SQFM_currentMapSquad;
private _icon      = _data get   "mapIcon";
private _color     = _data get   "mapColor";
private _pos       = _data call ["getAvgPos"];

if(_mouseOver)then{
    _data call ["drawOnMapMouseOver",[_map, _icon, _color,_pos]]
};


[_map, _icon, _color,_pos] call SQFM_fnc_drawMapIcon;

true;