params[
    ["_iconPos",nil,[[]]]
];
(_self get "hostilesRevealed")
params[
    ["_time",       nil, [0]],
    ["_targetList", nil,[[]]]
];

if(_targetList isEqualTo []) exitWith{};
if(time-_time > 3)exitWith{_targetList set[1,[]]};

{
    _x params[
        ["_target",   nil,[objNull]],
        ["_prevCoef", nil,      [0]],
        ["_incCoef",  nil,      [0]]
    ];

    [_iconPos, _target, _prevCoef, _incCoef] call SQFM_fnc_drawIntelTarget3D
} forEach _targetList;

true;