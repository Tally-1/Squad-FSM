params[
    ["_newOwner",nil,[west]]
];
private _color        = [_newOwner] call SQFM_fnc_sideColor;
private _strSide      = [_newOwner] call SQFM_fnc_sideToStrSide;
private _pos          = _self get "position";
private _desc         = _self get "description";
private _areaName     = [_pos] call SQFM_fnc_areaName;
private _msg          = [_desc, " ", _areaName, " captured by ",_strSide,"!"]joinString"";
private _attackGroups = (_self get "assignedGroups"get _strSide) select {(_x call getData) call ["canAttackOnly"]};

_self set ["3dColor",         _color];
_self set ["owner",        _newOwner];
_self set ["captureTime", round time];

{
    private _grpData  = _x call getData;
    private _taskData = _grpData get "taskData";
    if(!isNil "_taskData")
    then{_taskData call ["endTask"]}
    else{_grpData  call ["autoAssignObjective"]};

} forEach _attackGroups;

if(count _attackGroups > 0)
then{[["Reassigned ", count _attackGroups, " Attack-Squads"]] call dbgm};

_msg call dbgm;