private _module = _self get "objective";
if(isNull _module)exitWith{};

private _data = _module getVariable "SQFM_objectiveData";
if(isNil "_data")exitWith{};

_data;