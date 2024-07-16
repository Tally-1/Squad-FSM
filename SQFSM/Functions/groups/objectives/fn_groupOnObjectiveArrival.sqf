private _taskData  = _self call ["getTaskData"];
private _zone      = _taskData get "zone";
private _pos       = _zone#0;
private _rad       = _zone#1;

_self set ["state", ""];
_self set ["action", "Clearing area"];

private _function = 'SQFM_fnc_endTaskGroup';

_self call ["addWaypoint", [_pos,5,"SAD"]];
_self call ["addWaypoint", [_pos,_rad,"MOVE",_function]];