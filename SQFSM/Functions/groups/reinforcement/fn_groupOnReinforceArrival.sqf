private _group    = _self get "grp";
private _taskData = _self call ["getTaskData"];
(_taskData get "params")
params[
    ["_callPos",     nil,              [[]]],
    ["_callerGrp",   nil, [grpNull,objNull]],
	["_battleField", nil,   [createHashmap]]
];
private _isTrigger  = typeName _callerGrp isEqualTo "OBJECT"&&{"EmptyDetector" in typeOf _callerGrp};

if!(isNil "_battleField")then{ 
    (_battlefield get "activeReinforcements") deleteAt 
    ((_battlefield get "activeReinforcements") find _group);
};

if(_isTrigger)exitWith{ 
    _taskData call ["endTask", ["move to callerPos",grpNull]];
};

if!([_callerGrp]call SQFM_fnc_validGroup)
exitWith{_taskData call ["endTask", ["invalid caller",grpNull]]};

private _callerData     = _callerGrp call getData;
if(isNil "_callerData")
exitWith{_taskData call ["endTask", ["invalid caller",grpNull]]};

private _callerStrength = _callerData call ["strengthCoef"];
_callerData set ["awaitingReforce",   false];
_callerData set ["lastReforceArrival", time];
_callerData spawn{
    sleep 3;
    _this set ["lastReforceArrival", -1];
};

private _enemy = _callerData call ["nearEnemyGrp"];
if(!isNull _enemy)
exitWith{_taskData call ["endTask", ["attack callers enemy", _enemy]]};

_enemy = _self call ["nearEnemyGrp"];
if(!isNull _enemy)
exitWith{_taskData call ["endTask", ["attack own enemy",_enemy]]};

_taskData call ["endTask", ["move to callerPos",grpNull]];