params[
    ["_map",       nil, [controlNull]],
    ["_targetPos", nil,          [[]]],
    ["_rounds",    nil,           [0]],
    ["_color",     nil,          [[]]],
    ["_timeLimit", nil,           [0]]
];
private _rad    = selectMax [20, SQFM_artySpread];
private _orange = [0.85,0.4,0,1];
private _icon   = "\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa";

[_map, _icon, _orange,_targetPos,25, "fire-mission"] call SQFM_fnc_drawMapIcon;
_map drawEllipse [_targetPos, _rad, _rad, 0, _color, ""];

true;