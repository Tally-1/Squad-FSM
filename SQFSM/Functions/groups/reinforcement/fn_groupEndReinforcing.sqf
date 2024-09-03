params[
    ["_status",      nil,      [""]],
    ["_targetGroup", nil, [grpNull]]  // Can be either a hostile group, or the group that called for reinforcments
];
private _taskData  = _self call ["getTaskData"];
private _callerPos = (_taskData get"params")#0;
private _callerGrp = (_taskData get"params")#1;

_self call ["setDataDelayed", ["action",     ""]];
_self call ["setDataDelayed", ["state",      ""]];
_self call ["leaveUnarmedVehicles"];

if(_status isEqualTo "invalid caller")
exitWith{_self call ["addWaypoint", [_callerPos, 20]]};

private _responder  =  _self get "groupType";
private _grpName    = groupId _callerGrp;
private _side       = side _callerGrp;
private _msg        = [_grpName, ": Reinforcments (",_responder,") arrived."]joinString"";
private _mechanized = _self call ["isMechanized"];

if(_status isEqualTo "replenish caller")
exitWith{
    _self call ["setDataDelayed", ["action", "Merging"]];
    _msg = [_msg, " They will replenish your squad now"]joinString"";
    [[_side, "base"], _msg] remoteExecCall ["sideChat"];
    _self call ["mergeWithGroup",[_callerGrp]];
};

if("attack" in _status)
exitWith{ 

    _self call ["setDataDelayed", ["action", _status]];
    _msg = [_msg, " They are engaging the enemy!"]joinString"";
    [[_side, "base"], _msg] remoteExecCall ["sideChat"];
    _self call ["attackGroup",[_targetGroup]];
};

_msg = [_msg, " They are moving into position"]joinString"";
[[_side, "base"], _msg] remoteExecCall ["sideChat"];

if!(_mechanized)
exitWith{_self call["addWaypoint",[_callerPos, 50, "SAD"]]};

[_self, _callerPos]spawn{
params["_self","_pos"];

_self call ["initMechClearing"];
_self call ["addWaypoint", [_pos, 50, "MOVE", "SQFM_fnc_wpEndMechClearing"]];

true;
};