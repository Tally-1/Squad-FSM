private _group      = _self get "grp";
private _battle     = _self call ["getBattle"];
if(isNil "_battle")exitWith{};

private _taskData   = _self call ["getTaskData"];
private _objective  = (_taskData get "params")#0;
private _objPos     = getPosATL _objective;
private _objData    = _objective call getData;
private _objBattle  = _battle call ["posInZone",[_objPos]];

if(!_objBattle)then{
    _objData call ["unAssignGroup",[_group]];
};
_self    call ["abortTransport"];
_self    set  ["action", ""];
_self    call ["deleteWaypoints"];
_self    call ["removeTask"];

true;