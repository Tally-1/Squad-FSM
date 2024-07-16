(_self get "params")params[
    ["_passengerGroup", nil,[grpNull]],
    ["_transportVeh",   nil,[objNull]]
];

// Check that events have been set, and are not deleted.
private _vehicleEh      = _transportVeh getVariable "SQFM_trHitEh";
if(isNil "_vehicleEh")exitWith{
    "Transport events not found" call dbgm;
};

// Remove eventhandlers from passengers
if((!isNil "_passengerGroup")
&&{!isNull _passengerGroup})then{ 
    private _passengerData  = _passengerGroup call getData;

    _passengerData call ["removeUnitEH", ["FiredMan", "SQFM_transportFired"]];
    _passengerData call ["removeUnitEH", ["Hit", "SQFM_transportHit"]];
};

// Remove eventhandlers from transportGroup
private _transportGroup = group driver _transportVeh;
if((!isNil "_transportGroup")
&&{!isNull _transportGroup})then{ 
    private _transportData  = _transportGroup call getData;

    _transportData call ["removeUnitEH", ["FiredMan", "SQFM_transportFired"]];
    _transportData call ["removeUnitEH", ["Hit", "SQFM_transportHit"]];
};

// Remove eventhandlers from transportVehicle
_transportVeh removeEventHandler ["Hit", _vehicleEh];
_transportVeh setVariable ["SQFM_trHitEh", nil];

"Transport-events deleted" call dbgm;

true;