params ["_man", "_vehicle"];
if!([_vehicle] call SQFM_fnc_validVehicle)  exitWith{false;};
if!([_man, _vehicle] call SQFM_fnc_hostile) exitWith{false;};

true;