params [
    ["_targetPos", nil, [[]]],
    ["_rounds",    nil,  [0]],
    ["_color",     nil, [[]]],
    ["_timeLimit", nil,  [0]]
];
private _spread = selectMax [30, SQFM_artySpread];
private _zone   = [_targetPos,_spread];
private _circle = [_zone,0,359,3,100] call SQFM_fnc_semiCirclePosArr;
private _orange = [0.85,0.4,0,1];
private _icon   = "\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa";

{[_x, _color] call SQFM_fnc_draw3dMarker} forEach _circle;
[_targetPos,_orange,"fire-mission",_icon] call SQFM_fnc_draw3dMarker;

true;