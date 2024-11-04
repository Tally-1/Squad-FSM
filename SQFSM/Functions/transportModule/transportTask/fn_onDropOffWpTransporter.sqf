_this spawn {
params[
	["_transportGroup", nil, [grpNull]]
];
private _grpData  = _transportGroup getVariable "SQFM_grpData";
private _taskData = _grpData call ["getTaskData"];
private _nullTask = str _taskData isEqualTo "[]";

if(_nullTask)
exitWith{"{TaskData not found}" call dbgm};


private _onReturnWp = 'SQFM_fnc_onReturnWpTransporter';

(_taskData get "params")params[
	["_passengerGroup", nil,       [grpNull]],
	["_vehicle",        nil,       [objNull]],
    ["_psngrData",      nil, [createHashMap]],
    ["_module",         nil,       [objNull]]
];
private _timer      = time + round(count units _passengerGroup * 2);
private _returnPos  = getPosATLVisual _module;


[
    _passengerGroup,
	_timer,
    _taskData,
    _vehicle

] call SQFM_fnc_transportUnload;

_taskData  call ["removeEvents"];
_taskData  set  ["state", "Returning to base"];
_psngrData set  ["transportVehicle",objNull];
_psngrData call ["deleteWaypoints"];
_psngrData call ["onArrival"];
_psngrData call ["endPlayerTransport",[_vehicle]];
_grpData   call ["addWaypoint", [_returnPos, 30, "MOVE", _onReturnWp]];

_psngrData call ["globalize"];
_grpData   call ["globalize"];

true
};
true;