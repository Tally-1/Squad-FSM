params[
	["_transportGroup", nil, [grpNull]]
];
private _grpData  = _transportGroup getVariable "SQFM_grpData";
private _taskData = _grpData get "taskData";
(_taskData get "params")params[
	["_passengerGroup", nil,       [grpNull]],
	["_vehicle",        nil,       [objNull]],
    ["_psngrData",      nil, [createHashMap]],
    ["_module",         nil,       [objNull]]
];
private _timer      = time + round(count units _passengerGroup * 2);
private _returnPos  = getPosATLVisual _module;
private _onReturnWp = '[group this] call  SQFM_fnc_onReturnWpTransporter';

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
_grpData   call ["addWaypoint", [_returnPos, 30, "MOVE", _onReturnWp]];

true;