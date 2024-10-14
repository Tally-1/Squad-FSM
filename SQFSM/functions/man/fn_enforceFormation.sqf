params[
    ["_men", nil, [[]]]
];

if(_men isEqualTo [])exitWith{false};

private _group = group (_men#0);
if(isNil "_group")exitWith{false};

private _leaderVehicle = vehicle formationLeader leader _group;
private _scripts = [];

_group setFormDir getDir _leaderVehicle;

{
    private _position  = formationPosition _x;
    private _distance  = if(!isNil "_position")then{_x distance _position}else{0};
    private _timeLimit = selectMin [30, round _distance+10];
    _x setUnitPos "UP";
    if(_timeLimit >= 10
    &&{_distance > 5})then{ 
        _scripts pushBack 
        ([
            _x, 
            _position, 
            _timeLimit, 
            3
        ] spawn SQFM_fnc_fsmMoveManToPos);
    };
    
    
} forEach _men;

if(_scripts isEqualTo [])exitWith{false};

{_x setVariable ["SFSM_Excluded",true,true]} forEach _men;

[_scripts, 30] call SQFM_fnc_waitForScriptList;

{
    _x setVariable ["SFSM_Excluded",false,true];
    _x setUnitPos "AUTO";
} forEach _men;

true;