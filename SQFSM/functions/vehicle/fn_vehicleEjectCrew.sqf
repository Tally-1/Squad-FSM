params[
    ["_vehicle",nil, [objNull]],
    ["_smoke",  nil,    [true]],
    ["_wait",   nil,    [true]]
];
if(_smoke)
then{[_vehicle] call SQFM_fnc_deployVehicleSmoke};

private _scripts = [];
{_scripts pushBack([_x, _vehicle, _wait] spawn SQFM_fnc_manEjectFromVehicle)} forEach crew _vehicle;

if(_wait)
then{[_scripts, (count _scripts*2), 0.1] call SQFM_fnc_waitForScriptList};

true;