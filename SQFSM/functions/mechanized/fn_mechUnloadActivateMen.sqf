params[
    ["_men",      nil,[[]]],
    ["_menDelay", 0,   [0]]
];

sleep _menDelay;

private _delayed = [];

{
    if!(_x getVariable ["FSM_moveEnded",true])then{
        _x setVariable ["MoveFsm_Reset", true];
        _delayed pushBack _x;
    };

    [_x] call SQFM_fnc_activateMechMan;

} forEach _men;

if(_delayed isEqualTo [])exitWith{true};

sleep 0.1;

{[_x] call SQFM_fnc_activateMechMan} forEach _delayed;

false;