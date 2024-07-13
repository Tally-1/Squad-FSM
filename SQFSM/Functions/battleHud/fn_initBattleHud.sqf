params[
    ["_battleZone", nil, [[]]]
];
private _zonePos = _battleZone#0;
private _zoneRad = _battleZone#1;
private _camPos  = (positionCameraToWorld [0,0,0]);
private _inZone  = (_camPos distance2D _zonePos)<_zoneRad;
if!(_inZone)exitWith{};

private _display = uiNameSpace getVariable ["SQFM_BattleHUD",displayNull];
if(!isNull _display) then{_display closeDisplay 1; uiSleep 0.1;};

1 cutRsc ["SQFM_BattleHUD","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "SQFM_BattleHUD")};
private _display      = uiNameSpace getVariable ["SQFM_BattleHUD",displayNull];
//                        x    y    w     h
private _strengthPos  = [0.4, 0.08, 0.2, 0.03];
private _barTitle     = "Battle Presence";
private _strengthBar  = [_display, _strengthPos, _barTitle] call SQFM_fnc_BattleProgressBars;
private _dataArr      = [["strengthBar", _strengthBar]];
private _battleHud    = createHashMapObject [_dataArr];


_display setVariable ["SQFM_HUD",       _battleHud];
_display setVariable ["SQFM_BattlePos", _zonePos];
_display setVariable ["SQFM_BattleRad", _zoneRad];

_display;