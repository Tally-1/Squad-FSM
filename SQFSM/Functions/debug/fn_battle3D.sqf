private _camPos     = (positionCameraToWorld [0,0,0]);
private _nearBattle = [_camPos] call SQFM_fnc_nearestBattlePosRad;

if(isNil "_nearBattle")
exitWith{SQFM_currentBattle = nil};

private _pos        = _nearBattle#0;
private _rad        = _nearBattle#1;
private _battleData = SQFM_battles get _pos;
private _distance   = _camPos distance2D _pos;
private _maxDist    = selectMax[(_rad*1.3), 300];

SQFM_currentBattle  = _battleData;

if(_distance > _maxDist)exitWith{};
_battleData call ["drawBattle"];

true;