(_self get "params")params[
    ["_passengerGroup", nil,[grpNull]],
    ["_transportVeh",   nil,[objNull]]
];
private _vehicleEh      = _transportVeh getVariable "SQFM_trHitEh";

if(isNil "_vehicleEh")exitWith{"Transport events not found" call dbgm};

private _passengerData  = _passengerGroup call getData;
private _transportGroup = group driver _transportVeh;
private _transportData  = _transportGroup call getData;


_passengerData call ["removeUnitEH", ["FiredMan", "SQFM_transportFired"]];
_transportData call ["removeUnitEH", ["FiredMan", "SQFM_transportFired"]];
_passengerData call ["removeUnitEH", ["Hit", "SQFM_transportHit"]];
_transportData call ["removeUnitEH", ["Hit", "SQFM_transportHit"]];

_transportVeh removeEventHandler ["Hit", _vehicleEh];

_transportVeh setVariable ["SQFM_trHitEh", nil];

"Transport-events deleted" call dbgm;

true;