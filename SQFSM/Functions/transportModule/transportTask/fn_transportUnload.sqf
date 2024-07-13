params[
	["_passengerGroup", nil,       [grpNull]],
	["_timer",          nil,             [0]],
    ["_taskData",       nil, [createHashMap]],
    ["_vehicle",        nil,       [objNull]]
];
private _psngrData = _passengerGroup call getData;
private _driver = driver _vehicle;
_taskData  set  ["state", "Unloading"];
_psngrData call ["ejectAll"];

_driver disableAI "path";
_vehicle setVelocityModelSpace [0,0,0];

waitUntil {
    sleep 1;
    private _unloadComplete = [_passengerGroup, _timer, _taskData] call SQFM_fnc_transportUnloadStatus;
    _unloadComplete;
};

private _onFoot = _psngrData call ["boardingStatus"] isEqualTo "on foot";
if!(_onFoot)then{_psngrData call ["ejectAll"]};

_driver enableAI "path";

true;