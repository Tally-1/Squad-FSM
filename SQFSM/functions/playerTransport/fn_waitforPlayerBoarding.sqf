params[
    ["_psngrData", nil, [createHashMap]],
    ["_driver",    nil,       [objNull]],
    ["_vehicle",   nil,       [objNull]],
    ["_dropPos",   nil,            [[]]]
];
private _timeLimit = round(time+120);
private _group     = _psngrData get "grp";
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

if(_psngrData call["isBoarded"])
then{[_group] remoteExecCall ["SQFM_fnc_onGetinWpPassenger",2]}
else{call SQFM_fnc_abortPlayerTransport};