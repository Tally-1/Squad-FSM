{
    private _data  = _x call getData;
    
    if(!isNil "_data")
    then{_data call ["setMethods"]};
    
} forEach entities "SQFSM_Objective";

true;