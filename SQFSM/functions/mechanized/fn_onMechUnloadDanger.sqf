params[
    ["_vehicle",  nil,[objNull]],
    ["_shooters", nil,     [[]]],
    ["_targets",  nil,     [[]]]
];
[_vehicle] call SQFM_fnc_deployVehicleSmoke;
if(_targets isEqualTo [])exitWith{};

private _gunners = (allTurrets _vehicle)apply{_vehicle turretUnit _x};
[_gunners, _targets, false] call SQFM_fnc_assignSuppressionTargets;

if(_shooters isEqualTo [])exitWith{};
[_shooters, _targets, true] call SQFM_fnc_assignSuppressionTargets;

private _gunner = gunner _vehicle;
if(!alive _gunner)exitWith{};

sleep 3;

private _command = toLower currentCommand _gunner;
if("supp" in _command)exitWith{};

_gunner suppressFor 15;

true;