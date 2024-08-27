params [
    ["_man",     nil, [objNull]],
    ["_role",    nil,      [""]],
    ["_vehicle", nil, [objNull]],
    ["_turret",  nil,      [[]]],
    ["_isEject", nil,    [true]]
];
private _group = group _man;
private _data  = _group call getData;

if(isNil "_data")exitWith{};

_data call ["update"];

true;