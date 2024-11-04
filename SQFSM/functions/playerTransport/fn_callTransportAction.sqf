params [
    ["_player",nil,[objNull]]
];

private _actionId = _player getVariable "SQFM_callTransportAction";
if(!isNil "_actionId")exitWith{};

private _title     = "<t color='#95f8de'>Call Transport</t>";
private _code      = {[] spawn SQFM_fnc_playerCallTransport};
private _condition = "
    _this isEqualTo _target
    &&{[_this] call SQFM_fnc_callTransportActionCondition};
";

private _actionId = 
[
    _player,
    _title,
    _code,
    _condition

] call SQFM_fnc_simpleSelfAction;

_player setVariable ["SQFM_callTransportAction", _actionId];

true;