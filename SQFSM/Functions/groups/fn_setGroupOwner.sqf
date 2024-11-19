params[
	["_group",nil,[grpNull]]
];
if (isNil "_group")       exitWith{};
if (isNull _group)        exitWith{};
if!(isDedicated)          exitWith{};
if!(isServer)             exitWith{};
// if (SQFM_headlessPresent) exitWith{};

private _isPlayerGroup = [_group] call SQFM_fnc_isPlayerGroup;
private _prevOwner     = groupOwner _group;
if(_isPlayerGroup)exitWith{};
if(_prevOwner isEqualTo 2)exitWith{};

_group setGroupOwner 2;


true;