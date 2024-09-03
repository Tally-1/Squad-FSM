params[
    ["_callPos", nil,     [[]]],
    ["_caller",  nil,[grpNull]]
];

private _available = (entities "SQFSM_Reforcer")select{
    private _data     = _x call getData;
    private _canSpawn = if(isNil "_data")then{false}else{_data call ["canSpawn", [_callPos, _caller]]};
    _canSpawn;
};

private _failMessage = ["No available reinforcement modules for ", str side _caller]joinString"";
if(_available isEqualTo [])
exitWith{
    _failMessage call dbgm;
    grpNull;
};

private _nearest = [_callPos, _available] call SQFM_fnc_getNearest;
private _data    = _nearest call getData;
private _group   = _data call ["spawnSquad"];

_group;