private _formDir = _self call ["getHoldFormDir"];
private _group   = _self get "group";
private _grpData = _group call getData;
private _men     = _grpData call ["getUnitsOnfoot"];

_group setFormDir _formDir;
_group setCombatMode "YELLOW";
_group setCombatBehaviour "STEALTH";

{
    private _setCombatMode = (unitCombatMode _x)   isNotEqualTo "YELLOW";
    private _setBehaviour  = (combatBehaviour  _x) isNotEqualTo "STEALTH";
    private _canTarget     = _x checkAIFeature "TARGET";
    private _allowExtAi    = (_x getVariable ["SQFM_externalAiExcluded", false]);

    if(_setCombatMode) then{_x setUnitCombatMode "GREEN"};
    if(_setBehaviour)  then{_x setCombatBehaviour "STEALTH"};
    if(_canTarget)     then{_x disableAI "TARGET"};
    if(_allowExtAi)    then{[_x] call SQFM_fnc_manToggleExternalAi};
    
} forEach _men;

true;