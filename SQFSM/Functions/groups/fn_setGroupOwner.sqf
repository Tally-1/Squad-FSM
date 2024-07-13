params[
	["_group",nil,[grpNull]]
];
if (isNil "_group")       exitWith{};
if (isNull _group)        exitWith{};
if!(isDedicated)          exitWith{};
if!(isServer)             exitWith{};
if (SQFM_headlessPresent) exitWith{};

private _isPlayerGroup = [_group] call SQFM_fnc_isPlayerGroup;
if(_isPlayerGroup)exitWith{};

_group setGroupOwner 2;

2;