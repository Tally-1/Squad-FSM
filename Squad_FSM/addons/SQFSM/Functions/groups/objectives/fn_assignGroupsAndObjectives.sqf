params[
    ["_groupsMap", nil,            [createHashmap]],
    ["_category",  "attackSquads",            [""]],
    ["_side",      nil,                     [west]]
]; 
private _defenseAssignment  = _category isEqualTo "defenseSquads";
private _available          = _groupsMap call ["getAvailable",[_category, _side]];
private _assignedGroups     = [];
private _assignedObjectives = [];
{
    private _grpData     = _x call getData;
    private _isDefensive = _defenseAssignment && {_grpData get "canDefend"};
    private _params      = [_assignedObjectives, _defenseAssignment];
    private _grpObj      = _grpData call ["autoAssignObjective", _params];
    private _objAssigned = _grpObj isNotEqualTo [];
    
    if(_objAssigned)then{
        _grpObj params["_group", "_objective"];
        _assignedGroups     pushBackUnique _group;
        _assignedObjectives pushBackUnique _objective;
    };
    
} forEach _available;

_assignedGroups;