params[
    ["_transportGroup",nil,[grpNull]]
];
private _grpData  = _transportGroup call getData;
private _owner    = _grpData get "owner";
private _taskData = _grpData call ["getTaskData"];
private _nullTask = str _taskData isEqualTo "[]";
if(_nullTask)exitWith{"No taskdata for transport pickup  WP" call dbgS};
(_taskData get "params")params[
    ["_passengerGroup",nil,[grpNull]],
    ["_vehicle",     nil,[objNull]]
];

if(_owner isNotEqualTo clientOwner
&&{_owner isNotEqualTo 0})
exitWith{
    "{wrong owner on wp}"call dbgm;
    "{wrong owner on wp}"call dbgS;
    private _driver = driver _vehicle;
    [_driver, "MOVE"] remoteExecCall ["disableAI", _owner];
    [_transportGroup] remoteExecCall ["SQFM_fnc_onPickupWpTransporter", _owner];
};

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

_psngrData call ["globalize"];
_psngrData call ["deleteWaypoints"];
_psngrData call ["unStop"];

_passengerGroup setVariable ["SQFM_transportGroup", _transportGroup, true];
_transportGroup setVariable ["SQFM_transportPos",   _dropPos,        true];

private _onDropWp  = 'SQFM_fnc_onDropOffWpTransporter';
private _onGetinWp = 'SQFM_fnc_onGetinWpPassenger';
private _getInWp   = _psngrData call ["addWaypoint",[_getInPos, 10, "GETIN"]];
private _loadWp    = _grpData   call ["addWaypoint",[_getInPos, 10, "LOAD"]];
private _getOutWp  = _psngrData call ["addWaypoint",[_dropPos,  _dropRad, "GETOUT"]];
private _droppWp   = _grpData   call ["addWaypoint",[_dropPos,  _dropRad, "TR UNLOAD",_onDropWp]];
private _playerGrp = [_passengerGroup]call SQFM_fnc_isPlayerGroup;

_getInWp synchronizeWaypoint [_loadWp];

_getInWp waypointAttachObject _vehicle;
_passengerGroup addVehicle _vehicle;
[_driver, "path"]  remoteExecCall ["disableAI"];
doStop _driver;

// To all the "no nesters" I apologize deeply for this codeblock
// getting this to work for players on a dedicated server is a nightmare.
[_men, _vehicle] call SQFM_fnc_menGetInSingleVehicle;
if(_playerGrp)then{
    [
		_passengerGroup,
		_driver,
		_vehicle,
		_dropPos,
        _getInWp,
        _loadWp,
        _dropPos
	] spawn SQFM_fnc_waitforPlayerBoarding;
}
else{
	"Transport moving now" call dbgS;
    _getInWp synchronizeWaypoint [];
    _loadWp  synchronizeWaypoint [];
    deleteWaypoint _loadWp;
    deleteWaypoint _getInWp;
	[_driver, "path"]   remoteExecCall ["enableAI"];
    [_driver, "path"]   remoteExecCall ["enableAI"];
    [_driver, _dropPos] remoteExec     ["doMove"];
};


_psngrData set ["state", "Being dropped off"];
_psngrData set ["action", _taskName];
_taskData  set ["state", "Dropping off"];

true;