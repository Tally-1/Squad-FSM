private _taskData = _self call ["getTaskData"];
(_taskData get"params")params[
    ["_target",nil,    [objNull]],
    ["_caller",grpNull,[grpNull]]
];
private _vehicles = [];
private _group    = _self get "grp";
private _hasAt    = _self call ["isATsquad"];

{_vehicles pushBackUnique vehicle _x} forEach units _group;
{(gunner _x) doWatch objNull}         forEach _vehicles;

_self call ["deInitAtTarget",[_target]];
_self call ["deleteWaypoints"];
_self set  ["state",       ""];
_self set  ["action",      ""];
_self set  ["travelData", nil];
_self call ["flashAction",["AT-Support ended"]];

if!(_hasAt)then{
    _self set  ["squadClass",  "standard"];
    _self call ["setGroupType"];
    _self call ["update"];
    "Group is no longer classified as AT-support" call dbgm;

};

"Group ended AT-support" call dbgm;

true;