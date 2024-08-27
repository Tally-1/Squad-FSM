params[
	["_enemy", nil, [objNull]] // can be man or vehicle
];
private _leader       = leader (_self get "grp");
private _men          = _self call ["getUnits"];
private _distance     = selectMin [500, (_leader distance _enemy)*1.5];
private _targets      = [_leader, _distance] call SQFM_fnc_zoneSuppressionTargets;

if(_targets isEqualTo []
||{_men     isEqualTo []})
exitWith{"Unable to return fire" call dbgm};

[["Initial suppression started ", round time]] call dbgm;
_self set["action", "Initial return fire"];

[_men, _targets, false] call SQFM_fnc_assignSuppressionTargets;

_self call ["endReturnFire"];

true;