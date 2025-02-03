params [
    ["_player",nil,[objNull]]
];

private _actionId = _player getVariable "SQFM_callReinforcementsAction";
if(!isNil "_actionId")exitWith{};

private _title     = "<t color='#95f8de'>Call Reinforcements</t>";
private _code      = {[] spawn SQFM_fnc_playerCallReinforcements};
private _condition = "
    _this isEqualTo _target
    &&{[_this] call SQFM_fnc_callReinforcementsActionCondition};
";

private _actionId = 
[
    _player,
    _title,
    _code,
    _condition

] call SQFM_fnc_simpleSelfAction;

_player setVariable ["SQFM_callReinforcementsAction", _actionId];

true;