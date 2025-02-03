params[
    ["_group", nil, [grpNull]]
];
private _side         = side _group;
private _hasTransport = _side in SQFM_transportSides;

{
    private _playable    = [_x] call SQFM_fnc_playableUnit;
    private _addTrAction = _hasTransport && {_playable};

    if(_addTrAction) then{[_x] remoteExec["SQFM_fnc_callTransportAction"]};
    if(_playable)    then{
        [_x] remoteExec["SQFM_fnc_callReinforcementsAction"];
        [_x] remoteExec["SQFM_fnc_playerRequestArtyAction"];
    };
    
} forEach (units _group);