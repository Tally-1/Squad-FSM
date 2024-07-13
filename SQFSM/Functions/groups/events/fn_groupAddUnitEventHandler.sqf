params[
    ["_type",    nil, [""]],
    ["_code",    nil, [{}]],
    ["_varName", nil, [""]]
];
private _group = _self get "grp";

{
    private _man = _x;
    private _eh  = _man addEventHandler [_type, _code];
    _man setVariable [_varName, _eh];
    
} forEach (_self call ["getUnits"]);

(_self get "unitEvHandlers")pushBackUnique [_varName, _type];

true;