params[
    ["_target",nil,[objNull]]
];
if!(_self call ["isATsquad"])      exitWith{false};
if (_self call ["isVehicleGroup"]) exitWith{true};

private _sinceLast = time-(_self get "lastAtEngagement");
if(_sinceLast < 60)exitWith{false};

private _hunters = (_data call ["getAtMen"]) select {
	(currentCommand _x != "SCRIPTED")
	&&{isNil{_x getVariable "SQFM_launchPos"
}}};

if(count _hunters isEqualTo 0)exitWith{false};
{[_x, _target] spawn SQFM_fnc_manEngageAtTarget}forEach _hunters;
_data set ["lastAtEngagement", round time];

true;