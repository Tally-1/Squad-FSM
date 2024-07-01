params[
    ["_display",  nil,[displayNull]],
    ["_ctrlType", nil,         [""]],
    ["_ctrlPos",  nil,         [[]]],
    ["_color",    nil,         [[]]]
];

private _ctrlPos = _ctrlPos call SQFM_fnc_formatCtrlPos;
private _ctrl     = _display ctrlCreate [_ctrlType, -1];

if(_ctrlType == "RscProgress")then{_ctrl progressSetPosition 0;};
if(!isNil "_color")           then{_ctrl ctrlSetTextColor _color};

_ctrl ctrlSetPosition _ctrlPos;
_ctrl ctrlCommit 0;

_ctrl;