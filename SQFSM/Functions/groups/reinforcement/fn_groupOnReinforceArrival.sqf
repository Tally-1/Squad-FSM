private _group    = _self get "grp";
private _taskData = _self call ["getTaskData"];
(_taskData get "params")
params[
    ["_callPos",     nil,           [[]]],
    ["_callerGrp",   nil,      [grpNull]],
	["_battleField", nil,[createHashmap]]
];

if!(isNil "_battleField")then{ 
    (_battlefield get "activeReinforcements") deleteAt 
    ((_battlefield get "activeReinforcements") find _group);
};

if!([_callerGrp]call SQFM_fnc_validGroup)
exitWith{_taskData call ["endTask", ["invalid caller",grpNull]]};

private _callerData     = _callerGrp call getData;
private _callerStrength = _callerData call ["strengthCoef"];
_callerData set ["awaitingReforce", false];

if(_callerStrength <= 0.25)
exitWith{_taskData call ["endTask", ["replenish caller",_callerGrp]]};

private _enemy = _callerData call ["nearEnemyGrp"];
if(!isNull _enemy)
exitWith{_taskData call ["endTask", ["attack callers enemy",_enemy]]};

_enemy = _self call ["nearEnemyGrp"];
if(!isNull _enemy)
exitWith{_taskData call ["endTask", ["attack own enemy",_enemy]]};

_taskData call ["endTask", ["move to callerPos",grpNull]];