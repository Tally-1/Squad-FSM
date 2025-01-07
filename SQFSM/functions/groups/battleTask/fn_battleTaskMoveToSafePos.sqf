private _safeDirection = _self call ["safeDirection"];
private _group         = _self get "group";
private _grpData       = _group call getData;
private _grpPos        = _grpData call ["getAvgPos"];
private _battlePos     = _self get "battle" get "position";
private _battleRad     = _self get "battle" get "radius";
private _distance      = _grpPos distance2D _battlePos;
private _remainingRad  = _battleRad - _distance;
private _moveDistance  = selectMin [_remainingRad, 100];
private _safePos       = _grpPos getPos [_safeDirection, _moveDistance];
private _movePos       = [_safePos,nil,50]call SQFM_fnc_findParkingSpot;
private _wpDistance    = _grpPos distance2D _movePos;
private _wpInBattle    = (_movePos distance2D _battlePos)<_battleRad;

if(_moveDistance < 50) exitWith{_self call ["holdInTheOpen"]};
if(_wpDistance < 50)   exitWith{_self call ["holdInTheOpen"]};
if(!_wpInBattle)       exitWith{_self call ["holdInTheOpen"]};

_grpData call ["deleteWaypoints"];
_grpData call ["disableAttack"];

private _wp = _grpData call ["addWaypoint",[_movePos, 20,"MOVE", "SQFM_fnc_groupEndBattleTask", "AWARE"]];
_self set ["waypoints",     [_wp]];
_self set ["garrisoned",    false];
_self set ["destination",_movePos];

true;