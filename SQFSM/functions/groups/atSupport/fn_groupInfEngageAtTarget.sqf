params[
    ["_target",nil,[objNull]]
];
private _grpPos   = _self call ["getAvgPos"];
private _distance = _target distance2D _grpPos;
if(_distance > 1000)exitWith{};

private _hunters = _self call ["getAtMen"];
if(_hunters isEqualTo [])exitWith{};

{[_x, _target] spawn SQFM_fnc_manEngageAtTarget}forEach _hunters;

true;