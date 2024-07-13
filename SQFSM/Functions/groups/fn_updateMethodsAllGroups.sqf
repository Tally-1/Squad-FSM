{
    private _grpData  = _x call getData;
    
    if(!isNil "_grpData")
    then{_grpData call ["setMethods"]};
    
} forEach allGroups;

true;