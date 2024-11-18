params[
	["_playerGroup",nil,[grpNull]]
];
private _data   = _playerGroup call getData;
private _caller = leader _playerGroup;

_data call ["update"];
_data call ["requestReinforcements"];
// _data call ["globalize"];

[] remoteExec ["SQFM_fnc_showReforceData", _caller];

true; 