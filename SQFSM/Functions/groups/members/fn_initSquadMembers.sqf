params[
    ["_group", nil, [grpNull]]
];
private _side         = side _group;
private _hasTransport = _side in SQFM_transportSides;

{
    private _addTrAction = _hasTransport && {[_x] call SQFM_fnc_canGetTransportAction};
    if(_addTrAction)
    then{[_x] remoteExec["SQFM_fnc_callTransportAction"]};
    
} forEach (units _group);