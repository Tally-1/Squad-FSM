private _men      = _self call["getUnits"];
private _vehicles = (_self call["getOwnVehicles"])#0;
private _canTransport = [_men, _vehicles] call SQFM_fnc_vehiclesCanTransportMen;

_canTransport;