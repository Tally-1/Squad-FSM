params[
    ["_group",   nil, [grpNull]],
    ["_driver",  nil, [objNull]],
    ["_vehicle", nil, [objNull]],
    ["_dropPos", nil,      [[]]],
    ["_getInWp", nil,      [[]]],
    ["_loadWp",  nil,      [[]]],
    ["_dropPos", nil,      [[]]]
];
private _psngrData = _group call getData;
private _timeLimit = round(time+120);
private _caller    = owner (_vehicle getVariable "SQFM_transportCaller");
[_driver, "path"]  remoteExecCall ["disableAI"];
[_vehicle,"SQFM_transportWait",_timeLimit] call setGlobalVar;

"Transport waiting for playergroup" call dbgS;

waitUntil{ 
    sleep 0.1;
    if(time>_timeLimit)              exitWith{true};
    if(_psngrData call["isBoarded"]) exitWith{true};
    false;
};

[_vehicle,"SQFM_transportWait",nil] call setGlobalVar;

[_driver, "path"]  remoteExecCall ["enableAI"];
_driver doMove _dropPos;


if(_psngrData call["isBoarded"])then{
    "Player Transport ordered to move" call dbgS;
    [_group] call SQFM_fnc_onGetinWpPassenger;
    [_group] remoteExecCall ["SQFM_fnc_onGetinWpPassenger",[2]];
    _getInWp synchronizeWaypoint [];
    _loadWp  synchronizeWaypoint [];
    [_driver, "path"]   remoteExecCall ["enableAI"];
    [_driver, _dropPos] remoteExec     ["doMove"];
}
else{
    "Player Transport failed" call dbgS;
    call SQFM_fnc_abortPlayerTransport;
};