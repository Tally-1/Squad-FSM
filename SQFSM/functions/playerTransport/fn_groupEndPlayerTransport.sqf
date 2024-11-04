params[
	["_vehicle",nil,[objNull]]
];
private _group       = _self get "grp";
private _playerGroup = [_group] call SQFM_fnc_isPlayerGroup;
if(!_playerGroup)exitWith{};

private _caller = _vehicle getVariable "SQFM_transportCaller";
if(isNil "_caller")exitWith{};

[_vehicle, _caller] remoteExecCall ["SQFM_fnc_endPlayerTransport",_caller];