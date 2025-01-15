params[
    ["_vehicle",nil,[objNull]]
];
private _fireMission = _vehicle getVariable "SQFM_fireMission";
private _targetPos   = _fireMission get "targetPos";
private _magazine    = _fireMission get "magazine";
private _remaining   = (_fireMission get "count")-1;
private _callerData  = _fireMission get "callerGrp" call getData;
private _eta         = round (_vehicle getArtilleryETA [_targetPos, _magazine]);
private _total       = _fireMission get "countTotal";
private _fired       = _total-_remaining;
private _first       = _fired isEqualTo 1;
private _last        = _fired isEqualTo _total;
private _arrival     = time+_eta;
private _missionId   = _fireMission get "missionId";
private _strikeDebug = SQFM_activeArtyRequests get _missionId;


_fireMission set ["count", _remaining];
_strikeDebug set [3, _arrival];
_vehicle setVariable ["SQFM_lastArtyFire", round time, true];


private _completed = _fireMission call ["update"];
if(_first)     then{_fireMission call ["radioFirst"]};
if(_last)      then{
    _fireMission call ["radioLast"];
    _fireMission call ["end"];
};
if(!isNil "_callerData")
then{_callerData set["artyRequestEnd", _arrival]};
if(_completed) exitWith{};

private _positions = _fireMission get "positions";
private _magazine  = _fireMission get "magazine";
private _targetPos = selectRandom _positions;

_vehicle commandArtilleryFire [_targetPos, _magazine, 1];

true;