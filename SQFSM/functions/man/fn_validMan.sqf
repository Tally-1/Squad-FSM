params [
    ["_man",             nil, [objNull]],
    ["_includeExcluded", false,  [true]]
];
private _valid = [
    _man,
    true,
    true,
    true,
    _includeExcluded
    
] call SQFM_fnc_functionalMan;

_valid;