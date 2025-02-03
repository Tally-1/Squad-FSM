params[
    ["_group",    nil,       [grpNull]],
    ["_keyValArr",nil,            [[]]]
];
private _data = _group call getData;
if(isNil "_data")then{
    [_group] call SQFM_fnc_initGroup;
    _data = _group call getData;
};

if(isNil "_data")exitWith{};

[_data, _keyValArr, true] call SQFM_fnc_applyKeyValArrToHash;

true;