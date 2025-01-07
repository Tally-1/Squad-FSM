params[
    ["_battle",nil,[createHashmap]]
];

private _data     = _display getVariable "SQFM_data";
private _statText = _data get "statText";

_data     call ["updateBar", [_battle]];
_statText call ["update",    [_battle]];


true;