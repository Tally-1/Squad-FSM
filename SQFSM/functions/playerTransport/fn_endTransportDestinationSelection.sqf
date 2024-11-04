params[
    ["_position", nil,[[]],3]
];
private _displayHint = uiNamespace getVariable ["SQFM_mapInfo",displayNull];
private _displayMap  = findDisplay 12;

openMap [false, false];
removeMissionEventHandler             ["MapSingleClick", SQFM_mapClickEh];
_displayMap displayRemoveEventHandler ["KeyDown",         SQFM_keyDownEh];

if!(isNull _displayHint) then{_displayHint closeDisplay 1};
if (isNil "_position")   exitWith{};
private _posName = [_position] call SQFM_fnc_areaName;

SQFM_nearestTransport = nil;
SQFM_mapClickEh       = nil;
SQFM_keyDownEh        = nil;
SQFM_transportDestination = [_position, _posName];

true;