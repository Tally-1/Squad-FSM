private _objectives = (synchronizedObjects thisTrigger) select {typeOf _x isEqualTo "SQFSM_Objective"};

{
    private _data = _x call getData;
    _data call ["update"];
    
}forEach _objectives;

true;