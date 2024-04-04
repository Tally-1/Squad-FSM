params[
    ["_groups",nil,[[]]]
];
{
    private _grpData = _x call getData;
    _grpData call ["autoAssignObjective"];
    
} forEach _groups;

true;