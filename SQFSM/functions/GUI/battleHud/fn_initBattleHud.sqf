params[
    ["_zone", nil, [[]]]
];
private _zonePos = _zone#0;
private _zoneRad = _zone#1;
private _camPos  = (positionCameraToWorld [0,0,0]);
private _inZone  = (_camPos distance2D _zonePos)<_zoneRad;
if!(_inZone)exitWith{};

private _display = call SQFM_fnc_initBattleDisplay;
private _data    = _display getVariable "SQFM_data";
private _dataArr = [
    ["update",          SQFM_fnc_updateBattleHud],
    ["updateBar",    SQFM_fnc_updateBattleStrBar],
    ["initStatText", SQFM_fnc_initBattleStatText]
];

{_data set [_x#0, _x#1]} forEach _dataArr;

private _statText = _data call ["initStatText"];
_statText call ["setValues", [1,1,1]];

_data set ["statText", _statText];

_display;