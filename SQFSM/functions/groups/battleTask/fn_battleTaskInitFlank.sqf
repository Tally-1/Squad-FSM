private _target = _self call ["newTarget"];
if(isNull _target)exitWith{_self call ["end",[false]]};

private _group         = _self get "group";
private _grpData       = _group call getData;
private _battleRadius  = _self get "battle" get "radius";
private _grpPos        = _grpData call ["getAvgPos"];
private _targetData    = _target call getData;
private _targetPos     = _targetData call ["getAvgPos"];
private _flankSide     = selectRandom ["left","right","center"];
private _direction     = _targetPos getDir _grpPos;
private _distance      = (_grpPos distance2D _targetPos);
private _targetNear   = _distance < 100;
// select a distance between 100 and 200 meters, depending on circumstances.
private _flankDistance = if(_distance < 100)then{100}else{selectMin [200,_distance, _battleRadius]};
private _flankPos      = [_grpPos, _targetPos, _flankSide, _distance, true]call SQFM_fnc_calculateFlank;
private _leader        = leader _group;
private _battleTime    = _self call ["battleTime"];
private _outOfBounds   = !(_self get "battle" call ["posInZone",[_flankPos]]);

// If the flank position is outside the battleZone the squad will just push (Attack nearest enemy)
if(_outOfBounds)exitWith{_self call ["initPush"]};

_grpData call ["deleteWaypoints"];

private _flankWp   = _grpData call ["addWaypoint",[_flankPos, 30,"MOVE","SQFM_fnc_groupFlankWp","AWARE",nil,20]];
private _destroyWp = _grpData call ["addWaypoint",[_targetPos, 50,"SAD", "SQFM_fnc_groupEndBattleTask"]];

private _posText       = ["flankPos ",_flankSide]joinString"";
SQFM_Custom3Dpositions = [[_flankPos, _posText]];

_self set ["type",                     "flank"];
_self set ["target",                   _target];
_self set ["destination",           _targetPos];
_self set ["inPosition",                 false];
_self set ["destroyWp",             _destroyWp];
_self set ["waypoints",  [_flankWp,_destroyWp]];

if(!_targetNear)
then{if(_battleTime>60)then{_grpData call ["disableAttack"]}}
else{_self set  ["inPosition", true]};

true;