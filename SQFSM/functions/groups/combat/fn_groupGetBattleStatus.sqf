params[
    ["_battle",nil,[createHashmap]]
];
private _side     = _self get "side";
private _strength = [_battle, _side] call SQFM_fnc_getBattleStrength;
private _status   = "even";
private _hostiles = _self call ["getHostileBattleGroups",[_battle]];

if(_strength > 0.6)then{_status = "winning"};
if(_strength < 0.4)then{_status = "loosing"};

_status;