params [
    ["_man",   nil, [objNull]],
    ["_enemy", nil, [objNull]]
];
private _valid = [_enemy] call SQFM_fnc_validLandEntity;
if!(_valid)exitWith{};

private _hostile = [_man, _enemy] call SQFM_fnc_hostile;
if!(_hostile)exitWith{};

private _transportGroup = group _man;
private _taskData = (_transportGroup call getData) call ["getTaskData"];
if(!isNil "_taskData")then{ 
    _taskData set  ["enemy",     _enemy];
    _taskData call ["abort", ["combat"]]
};

"Transport crew got hit during transit" call dbgm;

true;