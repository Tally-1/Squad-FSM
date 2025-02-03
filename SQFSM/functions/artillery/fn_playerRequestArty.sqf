private _position   = call SQFM_fnc_selectArtyStrikePos;
if(isNil "_position")exitWith{false};

private _player     = call SQFM_fnc_currentMan;
private _group      = group _player;
private _data       = _group call getData;
private _canRequest = _data call ["canRequestArtillery",[true]];
if(!_canRequest)exitWith{
    "Player cannot call Artillery at this time." call dbgm;
    false;
};

[_position, _group] remoteExecCall ["SQFM_fnc_playerRequestArtyServer",2];


true;