params[
    ["_passengerGroup",   nil, [grpNull]],
    ["_transportVehicle", nil, [objNull]],
    ["_pickupPos",        nil,      [[]]],
    ["_dropPos",          nil,      [[]]]
];
private _transportGroup   = group _transportVehicle;
private _transportersData = _transportGroup call getData;
private _callerData       = _passengerGroup call getData;
private _module           = _self get "module";
private _transportParams  = [_passengerGroup, _transportVehicle, _callerData, _module, _dropPos];
private _Zone             = [_passengerGroup, _transportGroup] call SQFM_fnc_getGroupsZone;
private _transportTask    = _transportersData call ["initTask",[
    "transport",                 // Taskname 
    _Zone,                       // taskZone 
    [_pickupPos, _dropPos],      // task positions
    _transportParams,            // task params 
    {},                          // _arrivalCode (not used for transport)
    SQFM_fnc_transportEnded,     // _endCode     
    SQFM_fnc_updateTransport,    // _updateCode 
    SQFM_fnc_transportCondition, // _condition 
    SQFM_fnc_transportAborted    // _abortCode 
    
]];



_transportTask  set ["setEventHandlers", SQFM_fnc_setTransportEvents];
_transportTask call ["setEventHandlers"];

private _onPickupWp = 'SQFM_fnc_onPickupWpTransporter';
private _pickupWp   = _transportersData call ["addWaypoint", [_pickupPos, 30, "MOVE", _onPickupWp, "SAFE", "FULL"]];
private _waitWp     = _callerData call ["addWaypoint", [_pickupPos, 30, "HOLD"]];

_transportTask set  ["state",           "Picking up passengers"];
_callerData    set  ["action",          "Waiting for transport"];
_callerData    set  ["transportVehicle", _transportVehicle];
_self          call ["globalize"];
_callerData    call ["globalize"];

[["[",_transportGroup,"]"," is moving to pick up ", "[",_passengerGroup,"]"]] call dbgm;


_transportVehicle;