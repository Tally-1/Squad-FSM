params[
	["_transportGroup", nil, [grpNull]]
];
private _grpData   = _transportGroup call getData;
private _owner     = _grpData get "owner";

if(_owner isNotEqualTo clientOwner)
exitWith{"{wrong owner on wp}"call dbgm};

private _taskData = _grpData call ["getTaskData"];
private _nullTask = str _taskData isEqualTo "[]";

if(_nullTask)exitWith{"No taskdata for transport pickup  WP" call dbgS};

(_taskData get "params")params[
	["_passengerGroup",nil,[grpNull]],
	["_vehicle",     nil,[objNull]]
];

private _dropPos   = (_taskData get "positions")#1;
private _psngrData = _passengerGroup getVariable "SQFM_grpData";
private _men       = _psngrData call ["getUnitsOnfoot"];
private _psngrTask = _psngrData call ["getTaskData"];
private _taskName  = _psngrTask getOrDefault ["name", "Being dropped off"];
private _getInPos  = getPosATLVisual _vehicle;
private _driver    = driver _vehicle;
private _danger    = [_transportGroup, _dropPos] call SQFM_fnc_posIsHostile;
private _dropRad   = 10;

if(_danger)then{_dropRad = 300};

_psngrData call ["deleteWaypoints"];
_psngrData call ["unStop"];

private _onDropWp = 'SQFM_fnc_onDropOffWpTransporter';
private _getInWp  = _psngrData call ["addWaypoint",[_getInPos, 10, "GETIN"]];// _passengerGroup addWaypoint [_getInPos, 0];
private _getOutWp = _psngrData call ["addWaypoint",[_dropPos,  _dropRad, "GETOUT"]];
private _droppWp  = _grpData   call ["addWaypoint",[_dropPos,  _dropRad, "TR UNLOAD",_onDropWp]];

_getInWp waypointAttachObject _vehicle;
_passengerGroup addVehicle _vehicle;
_driver disableAI "MOVE";

[_men, _vehicle] call SQFM_fnc_menGetInSingleVehicle;

_driver enableAI "MOVE";

_psngrData set ["state", "Being dropped off"];
_psngrData set ["action", _taskName];
_taskData  set ["state", "Dropping off"];

true;