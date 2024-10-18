params[
    ["_objective", nil,[objNull]],
    ["_map",       nil,[controlNull]]
];
private _data = _objective call getData;
if(isNil "_data")exitWith{};
(_data call ["getDebugIconAndColor"])
params["_icon", "_color"];
private _pos          = _data get "position";
private _size         = 25;
private _mouseOver    = _objective isEqualTo SQFM_currentMapObjective;
private _text         = "";

if(_mouseOver)then{ 
    _data call ["drawAdvancedOnMap",[_map]];
    _text = toUpper(_data get "description");
};


[
    _map,
    _icon,
    _color,
    _pos,
    _size,
    _text
] call SQFM_fnc_drawMapIcon;

true;