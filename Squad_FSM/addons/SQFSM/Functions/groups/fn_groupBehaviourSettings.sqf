params[
    ["_group", nil, [grpNull]]
];
private _module = [_group] call SQFM_fnc_groupGetBehaviorModule;
if(isNil "_module")
exitWith{["standard", true, true, true, true, true, true, true]};

private _squadType     = _module getVariable "squadtype"; //"standard";
private _defend        = _module getVariable "allowobjectivedefense";
private _attack       = _module getVariable "allowobjectivecapture";
private _hunt          = _module getVariable "canhunt";

private _reinforce     = _module getVariable "isreinforcement";
private _callReinforce = _module getVariable "allowreinforcementcall";
private _callAir       = _module getVariable "allowairsupportcall";
private _callArty      = _module getVariable "allowartysupportcall";

if(_squadType isEqualTo "support")then{
    _defend    = false;
    _attack    = false;
    _hunt      = false;
    _reinforce = false;
};

[
    _squadType, 
    _defend, 
    _attack, 
    _hunt, 
    _reinforce, 
    _callReinforce, 
    _callAir, 
    _callArty

];