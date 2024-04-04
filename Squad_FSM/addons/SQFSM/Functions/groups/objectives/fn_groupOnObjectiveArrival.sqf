private _taskData  = _self get "taskData";
private _zone      = _taskData get "zone";
private _pos       = _zone#0;
private _rad       = _zone#1;

_self set ["state", ""];
_self set ["action", "Clearing area"];
private _statement = '((group this getVariable "SQFM_grpData")get"taskData")call["endTask"]';
_taskData call ["addWaypoint", [_pos,nil,"SAD"]];
_taskData call ["addWaypoint", [_pos,_statement,nil,nil,nil,_rad]];