params [
    ["_player",nil,[objNull]]
];

private _actionId = _player getVariable "SQFM_callArtyAction";
if(!isNil "_actionId")exitWith{};

private _title     = "<t color='#95f8de'>Call Artillery</t>";
private _code      = {[] spawn SQFM_fnc_playerRequestArty};
private _condition = '
    private _selfCall = _this isEqualTo _target;
    if(!_selfCall)exitWith{false};

    private _leader = _this isEqualTo leader group _this;
    if(!_leader)exitWith{false};

    private _data        = group _this call getData;
    private _canCallArty = _data call ["canRequestArtillery",[true]];
    if(!_canCallArty) exitWith {false};
    if(_canCallArty)  exitWith  {true};
    
    false;
';

private _actionId = 
[
    _player,
    _title,
    _code,
    _condition

] call SQFM_fnc_simpleSelfAction;

_player setVariable ["SQFM_callArtyAction", _actionId];

true;