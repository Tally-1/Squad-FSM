private _transportVehicle = _self getOrDefault ["transportVehicle",objNull];
private _transportGroup   = group driver _transportVehicle;
private _reforceGroup     = _self get "grp";
private _transporterData  = _transportGroup call getData;

_self call ["deleteWaypoints"];
_self call ["removeTask"];

if(!isNil "_transporterData")then{
    private _taskData = _transporterData call ["getTaskData"];
    
    _taskData        set  ["aborted", true];
    _taskData        call ["removeEvents"];
    _transporterData call ["deleteWaypoints"];

    private _dropPos  = getPosATLVisual _transportVehicle;
    private _passengerWPC = 'SQFM_fnc_onPassengerCombatDrop';
    private _transportWPC = 'SQFM_fnc_onTransportCombatDrop';
    private _getOutWp     = _passengerData call ["addWaypoint",[_dropPos,  5, "GETOUT", _passengerWPC]];
    private _droppWp      = _transportData call ["addWaypoint",[_dropPos,  5, "MOVE",   _transportWPC]];

    _transporterData set ["travelData", nil];
    _transporterData set ["action",      ""];
    _transporterData set ["state",       ""];
    _transporterData deleteAt "travelData";
};

_self spawn{
    sleep 1;
    _this set ["travelData", nil];
    _this set ["action",      ""];
    _this set ["state",       ""];
    _this deleteAt "travelData";
    _this call ["update"];
    _this call ["globalize"];
};

_self deleteAt "travelData";


true;