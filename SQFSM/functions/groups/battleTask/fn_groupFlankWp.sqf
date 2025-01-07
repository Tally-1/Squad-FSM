_this spawn{
params[
    ["_group",nil,[grpNull]]
];
private _grpData = _group call getData;
private _task    = _grpData get "battleTask";
if(isNil "_task")exitWith{};

private _pos = _grpData call ["getAvgPos"];

_grpData call ["regroup",[false]];
_grpData call ["enableAttack"];

_group move _pos;
_group enableAttack true;
_group setCombatMode "RED";

_task set ["inPosition", true];

true;
}