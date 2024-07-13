(_self get "params")params[
    ["_passengerGroup", nil,[grpNull]],
    ["_transportVeh",   nil,[objNull]]
];
private _passengerData        = _passengerGroup call getData;
private _transportGroup       = group driver _transportVeh;
private _transportData        = _transportGroup call getData;
private _transportHitEh       = _transportVeh addEventHandler ["Hit", {/*_this call SQFM_fnc_onTransportCrewHit*/"vehicle hit"call dbgm}];
private _onPassengerFired     = {(_this#0) removeEventHandler [_thisEvent, _thisEventHandler]; _this spawn SQFM_fnc_onPassengerFired};
private _onPassengerHit       = {(_this#0) removeEventHandler [_thisEvent, _thisEventHandler]; _this spawn SQFM_fnc_onPassengerHit};
private _onTransportCrewFired = {(_this#0) removeEventHandler [_thisEvent, _thisEventHandler]; _this spawn SQFM_fnc_onTransportCrewFired};
private _onTransportCrewHit   = {(_this#0) removeEventHandler [_thisEvent, _thisEventHandler]; _this spawn SQFM_fnc_onTransportCrewHit};

_passengerData call ["addUnitEH", ["FiredMan", _onPassengerFired,     "SQFM_transportFired"]];
_passengerData call ["addUnitEH", ["Hit",      _onPassengerHit,         "SQFM_transportHit"]];
_transportData call ["addUnitEH", ["FiredMan", _onTransportCrewFired, "SQFM_transportFired"]];
_transportData call ["addUnitEH", ["Hit",      _onTransportCrewHit,     "SQFM_transportHit"]];

_self set ["transportHitEh", _transportHitEh];
_self set ["removeEvents", SQFM_fnc_removeTransportEvents];

_transportVeh setVariable ["SQFM_trHitEh", _transportHitEh];

true;