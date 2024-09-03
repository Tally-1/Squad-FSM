params[
    ["_module",nil,[objNull]]
];
private _groups     = [];
private _objectives = [];
{
    private _group = group _x;
    private _type  = typeOf _x;

    if(isNil "_group")
    then{_group = grpNull};

    if([_group] call SQFM_fnc_validgroup)
    then{_groups pushBackUnique _group};

    if(_type isEqualTo "SQFSM_Objective")
    then{_objectives pushBackUnique _x};
    
} forEach synchronizedObjects _module;

if(_groups isEqualTo [])
exitWith{["Reforce-module without groups assigned","hint"] call dbgm};

private _objective     = _objectives#0;
private _side          = side (_groups#0);
private _virtualSquads = [_groups] call SQFM_fnc_virtualizeSquadsWhenReady;
private _squadCount    = _module getVariable "reforce_squadcount";
private _maxIngame     = _module getVariable "max_simultaneous";
private _range         = _module getVariable "reforce_range";

if(isNil "_objective")
then{_objective = objNull};

if(_squadCount isEqualTo -1)
then{_squadCount = 9999};

copyToClipboard str (_virtualSquads apply {typeName _x});

private _dataArr       = [
    ["module",                _module],
    ["squads_ingame",              []],
    ["side",                    _side],
    ["objectives",        _objectives],
    ["last_spawn",                  0],
    ["sentCount",                   0],
    ["max_ingame",         _maxIngame],
    ["maxCount",          _squadCount],
    ["maxRange",               _range],
    ["virtualSquads",  _virtualSquads],

    ["setMethods", {[_self] call SQFM_fnc_setReforceModuleMethods}]
];

private _data = createHashmapObject [_dataArr];

_data call ["setMethods"];

_module setVariable ["SQFM_reforcerData", _data, true];

true;