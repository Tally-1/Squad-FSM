params[
    ["_groupsMap",nil,[createHashMap]]
];
private _available = _groupsMap call ["getAvailable",["all"]];
private _idle      = _available select {(_x call getData) call ["canIdleGarrison"]};
if(_idle isEqualTo [])exitWith{[]};

[_idle] spawn SQFM_fnc_groupListInitIdleState;

_idle;