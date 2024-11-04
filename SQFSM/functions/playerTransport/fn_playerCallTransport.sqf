private _callStatus = call SQFM_fnc_playerCanCallTransport;
if(_callStatus isNotEqualTo "ready")
exitWith{[_callStatus]call SQFM_fnc_rejectTransportCall};

private _destination = call SQFM_fnc_selectTransportDestination;
if(isNil "_destination")exitWith{};

private _data     = group player call getData;
private _grpPos   = _data call ["getAvgPos"];
private _pos      = _destination#0;
private _distance = _grpPos distance2D _pos;
private _caller   = player;
if(_distance < 300)
exitWith{["too_close"]call SQFM_fnc_rejectTransportCall};

private _name     = _destination#1;
private _vehicle  = _data call ["callTransport",[_pos]];
if(isNull _vehicle)
exitWith{["no_transport"]call SQFM_fnc_rejectTransportCall};

[
    _vehicle, 
    "SQFM_transportCaller", 
    _caller
] call setGlobalVar;


[_vehicle, _destination] spawn SQFM_fnc_showTransportData;

str _destination call dbgm;