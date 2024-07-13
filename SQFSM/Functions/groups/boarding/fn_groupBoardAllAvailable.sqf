private _vehicles = _self call ["allAvailableVehicles"];
private _men      = _self call ["getUnitsOnfoot"];

[_men, _vehicles] call SQFM_fnc_menOrderGetInVehicles;

true;