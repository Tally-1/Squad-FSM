_self call ["leaveInvalidVehicles"];
private _group    = _self get "grp";
private _inUse    = _self call ["getGrpMembers"] select {[_x] call SQFM_fnc_isLandVehicle};
private _assigned = assignedVehicles _group select {alive _x;};
private _all      = [];

_all insert [0, _inUse,    true];
_all insert [0, _assigned, true];

[_all, _assigned, _inUse];