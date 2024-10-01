params[
    ["_module",nil,[objNull]],
    ["_status",nil,   [true]]
];
private _statusText = "deactivated";
private _data       = _module call getData;
private _type       = _data get "type";

if(_status)
then{_statusText = "activated"};

private _text    = [_type, "-Objective: ", _module, " ", _statusText, " by trigger"]joinString"";

_text call dbgm;