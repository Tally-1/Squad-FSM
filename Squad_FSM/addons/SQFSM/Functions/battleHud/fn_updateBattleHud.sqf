params[
    ["_zone",              nil,            [[]]],
    ["_strengthData",      nil, [createHashmap]],
    ["_reinforcementData", nil, [createHashmap]]
];

private _zonePos    = _zone#0;
private _zoneRad    = _zone#1;
private _camPos     = (positionCameraToWorld [0,0,0]);
private _inZone     = (_camPos distance2D _zonePos)<_zoneRad;
private _display    = uiNameSpace getVariable ["SQFM_BattleHUD",displayNull];
private _battlePos  = _display getVariable "SQFM_BattlePos";
private _sameBattle = (!isNil "_battlePos")&&{_zonePos distance2D _battlePos <10};

if!(_sameBattle)    exitWith{call SQFM_fnc_toggleBattleHud};
if!(_inZone)        exitWith{call SQFM_fnc_toggleBattleHud};
if(isNull _display) exitWith{call SQFM_fnc_toggleBattleHud};

private _strengthBar = _display getVariable "SQFM_HUD"get"strengthBar";
[_strengthData, _strengthBar] call SQFM_fnc_setBattleHudStrengthBar;

true;