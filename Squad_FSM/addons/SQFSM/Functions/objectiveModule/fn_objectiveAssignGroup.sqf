params[
    ["_group",nil,[grpNull]]
];
private _grpData = _group getVariable "SQFM_grpData";
private _side    = _grpData call ["getStrSide"];
private _grpList = _self get"assignedGroups"get _side;
private _module  = _self get "module";

_grpData set ["objective",_module];

_grpList pushBackUnique _group;

_grpList = [_grpList] call SQFM_fnc_removeNull;

_grpList;