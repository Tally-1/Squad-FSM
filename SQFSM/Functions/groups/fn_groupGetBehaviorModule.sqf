params[
    ["_group", nil, [grpNull]]
];
private _bModules = [];
{
    private _synched = synchronizedObjects _x;
    _synched append (synchronizedObjects vehicle _x);
    if(_synched isNotEqualTo [])
    then{
        private _module = (_synched select {typeOf _x isEqualTo "SQFSM_Behaviour"})#0;
        if(!isNil "_module")
        then{_bModules pushBackUnique _module;};
    };
    
} forEach units _group;

private _behaviorModule = _bModules#0;

if(isNil "_behaviorModule")exitWith{};

_behaviorModule;