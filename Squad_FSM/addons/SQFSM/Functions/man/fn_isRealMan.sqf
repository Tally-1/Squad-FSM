params[
    ["_man", nil, [objNull]] // Object - The unit to check
];

private _isRealMan = true;

isNil{//Forced unscheduled execution

    if!(alive _man)                         exitWith {_isRealMan = false};
    if!(_man isKindOf "CAManBase")          exitWith {_isRealMan = false};

    private _group = group _man;
    if(isNull _group)                       exitWith {_isRealMan = false};
    if(side _group isEqualTo sideLogic)     exitWith {_isRealMan = false};
    if(isObjectHidden _man)                 exitWith {_isRealMan = false};
};


_isRealMan;