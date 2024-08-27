_self spawn{ 
private _self      = _this;
private _taskData  = _self call ["getTaskData"];
private _objective = (_taskData get "params")#0;
private _objData   = _objective call getData;
private _center    = (_objData get "zone")#0;

_self set  ["state", ""];
_self set  ["action", "Clearing Objective"];
_self call ["leaveUnarmedVehicles"];
_self call ["clearObjective",[_objective]];
};