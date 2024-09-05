_self spawn{ 
private _self      = _this;
private _taskData  = _self call ["getTaskData"];
private _objective = (_taskData get "params")#0;
private _group     = _self get "grp";
private _objData   = _objective call getData;
private _center    = (_objData get "zone")#0;
private _defensive = _self call ["canInitObjectiveDefense",[_objective]];

_self call ["leaveUnarmedVehicles"];
_self set  ["state", ""];

"Group arrived at objective" call dbgm;

if(_defensive)
exitWith{
    _self call ["initObjectiveDefense",[_objective]];
};

_self set  ["action", "Clearing Objective"];
_self call ["clearObjective",[_objective]];

true;
};