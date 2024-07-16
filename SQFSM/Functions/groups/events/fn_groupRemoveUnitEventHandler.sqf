params[
    ["_type",    nil, [""]], 
    ["_varName", nil, [""]]       
];

{
    private _man = _x;
    private _eh  = _man getVariable _varName;
    if(!isNil "_eh")then{
        _man removeEventHandler [_type, _eh];
        _man setVariable [_varName, nil];
    };

} forEach (_self call ["getUnits"]);

private _ehs   = _self getOrDefault ["unitEvHandlers",[]];
private _index = _ehs find [_varName, _type];

_ehs deleteAt _index;

true;