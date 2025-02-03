params[
    ["_vehicle",  nil,[objNull]],
    ["_posArr",   nil,     [[]]],
    ["_magazine", nil,     [""]],
    ["_rounds",     1,      [0]]
];

[_vehicle] call SQFM_fnc_artilleryFireEh;

private _targetPos  = _posArr#(count _posArr-1);
private _targetName = [_targetPos] call SQFM_fnc_areaName;
private _eta        = selectMax[10, round (_vehicle getArtilleryETA [_targetPos, _magazine])];
private _caller     = _vehicle getVariable ["SQFM_artyCaller",grpNull];
private _callerData = _caller call getData;
private _color      = [side _caller]call SQFM_fnc_sideColor;
private _timeLimit  = (time + (_rounds*10))+20;
private _missionId  = str [_targetPos,_caller,_vehicle,time,round random 1000000];
private _gunner     = gunner _vehicle;
private _globalize  = {[(_self get "vehicle"), "SQFM_fireMission", _fireMission] call setGlobalVar};

private _dataArr = [
    ["vehicle",           _vehicle],
    ["missionId",       _missionId],
    ["gunner",             _gunner],
    ["callerGrp",          _caller],
    ["positions",          _posArr],
    ["targetPos",       _targetPos],
    ["projectileTime",        _eta],
    ["targetName",     _targetName],
    ["magazine",         _magazine],
    ["count",              _rounds],
    ["countTotal",         _rounds],
    ["timeLimit",       _timeLimit],
    ["complete",             false],
    ["reloading",            false],

    /******************{METHODS}***********************/
    ["isCompleted",                          SQFM_fnc_artilleryFireMissionComplete],
    ["radioPrepare",                     SQFM_fnc_artilleryFireMissionRadioPrepare],
    ["radioFirst",                         SQFM_fnc_artilleryFireMissionRadioFirst],
    ["radioLast",                           SQFM_fnc_artilleryFireMissionRadioLast],
    ["update",                                 SQFM_fnc_artilleryFireMissionUpdate],
    ["globalize",                                                       _globalize],
    ["verifyFirstRound",             SQFM_fnc_artilleryFireMissionVerifyFirstRound],
    ["hasFired",         {(_self get "count")isNotEqualTo(_self get "countTotal")}],
    ["end",                                       SQFM_fnc_artilleryEndFireMission]
];

private _fireMission = createHashmapObject [_dataArr];
[_vehicle, "SQFM_fireMission", _fireMission] call setGlobalVar;


_color      set [3,0.5];
if(!isNil "_callerData")then{ 
    _callerData set  ["activeArty", _vehicle];
    _callerData call ["globalize"];
};

SQFM_activeArtyRequests set [
    _missionId,
    [
        _targetPos,
        _rounds,
        _color,
        _timeLimit
    ]
];

["SQFM_newArtyStrike", [_caller, _vehicle, _targetPos]] call CBA_fnc_localEvent;
[missionNamespace, "SQFM_activeArtyRequests", SQFM_activeArtyRequests] call setGlobalVar;

_fireMission;