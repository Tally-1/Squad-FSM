params[
	["_transportGroup", nil, [grpNull]]
];
private _grpData   = _transportGroup getVariable "SQFM_grpData";
private _taskData  = _grpData get "taskData";
private _dropPos   = (_taskData get "positions")#1;

(_taskData get "params")params[
	["_passengerGrp",nil,[grpNull]],
	["_vehicle",     nil,[objNull]]
];
private _psngrData = _passengerGrp getVariable "SQFM_grpData";
private _men       = _psngrData call ["getUnitsOnfoot"];
private _psngrTask = _psngrData get "taskData";
private _taskName  = _psngrTask getOrDefault ["name", "Being dropped off"];
private _getInPos  = getPosATLVisual _vehicle;
private _getInWp   = _passengerGrp addWaypoint [_getInPos, 0];
private _getOutWp  = _passengerGrp addWaypoint [_dropPos, 0];

_getInWp setWaypointType "GETIN";
_getInWp waypointAttachObject _vehicle;

_getOutWp setWaypointType "GETOUT";
_getOutWp setWaypointCompletionRadius 300;

_passengerGrp addVehicle _vehicle;

[_men, _vehicle] call SQFM_fnc_menGetInSingleVehicle;

[
	_men, 
	_vehicle,
	_passengerGrp

] spawn SQFM_fnc_transportPostboarding;
_psngrData set ["state", "Being dropped off"];
_psngrData set ["action", _taskName];
_taskData  set ["state", "Dropping off"];

true;