params[
    ["_abortStatus","",[""]]
];
if(_self get "aborted")exitWith{};

_self set  ["aborted", true];
_self call ["removeEvents"];

if(_abortStatus isNotEqualTo "combat")exitWith{};

private _passengerGroup = (_self get "params")#0;
private _vehicle        = (_self get "params")#1;
private _driver         = driver _vehicle;
private _passengerData  = (_self get "params")#2;
private _module         = (_self get "params")#3;
private _enemy          = _self get "enemy";
private _passengerTask  = _passengerData get "taskData";
private _abortFnc       = _passengerTask get "abort";
private _transportData  = _self call ["ownerData"];
private _transportGroup   = _transportData get "grp";
private _returnPos      = getPosATLVisual _module;
private _dropPos        = [_vehicle, _enemy] call SQFM_fnc_emergencyParking;

_passengerData call ["deleteWaypoints"];
_transportData call ["deleteWaypoints"];

_driver  doMove _dropPos;
_vehicle doMove _dropPos;

sleep 3;

if(!isNil "_abortFnc")
then{_passengerTask call ["abort",["combat during transport"]]};

_transportGroup setVariable ["SQFM_returnPos",_returnPos];

private _passengerWPC = '[group this] spawn SQFM_fnc_onPassengerCombatDrop';
private _transportWPC = '[group this] spawn SQFM_fnc_onTransportCombatDrop';
private _getOutWp     = _passengerData call ["addWaypoint",[_dropPos,  5, "GETOUT",    _passengerWPC]];
private _droppWp      = _transportData call ["addWaypoint",[_dropPos,  5, "MOVE",      _transportWPC]];

// _getOutWp synchronizeWaypoint [_droppWp];