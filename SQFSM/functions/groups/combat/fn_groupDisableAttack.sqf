private _group = _self get "grp";
private _men     = _self call ["getUnitsOnfoot"];
private _leader = leader _group;

_group enableAttack false;
_group setCombatMode "GREEN";

{
    private _target    = getAttackTarget _x;
    private _hasTarget = !isNull _target;
    private _setMode   = (unitCombatMode _x) isNotEqualTo "GREEN";
    private _command   = currentCommand _x;
    private _attacking = _command isEqualTo "ATTACK";

    
    if(_hasTarget) then{_x forgetTarget _target};
    if(_attacking) then{doStop _x; _x doWatch objNull; _x doMove getPosATLVisual _x; _x doFollow _leader};
    if(_setMode)   then{_x setUnitCombatMode "GREEN"};

    _x disableAI "TARGET";
    [_x, false] call SQFM_fnc_manToggleExternalAi;
    
} forEach _men;

true;