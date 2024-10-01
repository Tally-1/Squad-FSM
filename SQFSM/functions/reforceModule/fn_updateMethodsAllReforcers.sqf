private _modules = entities "SQFSM_Reforcer";

{
    private _data = _x call getData;
    if(!isNil "_data")
    then{_data call ["setMethods"]};
    
} forEach _modules;

true;