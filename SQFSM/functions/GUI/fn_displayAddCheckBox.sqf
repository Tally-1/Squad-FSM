params[
	["_pos",      nil,   [[]]],
	["_value",    nil, [true]],
    ["_onChange", nil,   [{}]]
];
private _cBox = _self call ["addCtrl",["RscCheckBox",_pos, true]];
private _ctrl = _cBox get "ctrl";

_cBox set ["setValue", {(_self get "ctrl") cbSetChecked (_this#0)}];
_cBox set ["getValue", {cbChecked (_self get "ctrl")}];

_cBox call ["setPosSqr",[_pos]];
_cBox call ["setValue", [_value]];

if(!isNil "_onChange")then{
    _ctrl ctrlAddEventHandler ["CheckedChanged", _onChange];
    [_ctrl] call _onChange;
};

_cBox;