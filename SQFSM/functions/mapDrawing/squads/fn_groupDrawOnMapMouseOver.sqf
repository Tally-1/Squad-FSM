params[
    ["_map",   nil, [controlNull]],
    ["_icon",  nil,          [""]],
    ["_color", nil,          [[]]],
    ["_pos",   nil,          [[]]]
];
private _text     = toUpper(_self get "groupType");
private _radius   = _self get "groupCluster"get"radius";
private _white    = [1,1,1,1];
private _black    = [0,0,0,1];
private _callSign = groupId (_self get "grp");

_map drawEllipse [_pos, _radius, _radius, 0, _color, ""];

[_map, _icon, _white,_pos,25,_text] call SQFM_fnc_drawMapIcon;
[_map, _icon, _white,_pos,25,_callSign,0,"right"] call SQFM_fnc_drawMapIcon;

if!(_self call ["activeWp"])exitWith{};
private _group = _self get "grp";
private _index = currentWaypoint _group;
private _wp    = [_group, _index];
private _posWp = waypointPosition _wp;
private _dir   = _pos getDir _posWp;
private _arrow = "\A3\ui_f\data\map\markers\military\triangle_CA.paa";

_map drawLine [_pos, _posWp, [0,0,0,1], 5];

[_map, _arrow, _black,_posWp,25,"",_dir] call SQFM_fnc_drawMapIcon;

true;