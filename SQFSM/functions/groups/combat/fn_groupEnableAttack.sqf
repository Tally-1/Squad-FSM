private _group = _self get "grp";
private _men   = _self call ["getUnitsOnfoot"];

_group enableAttack true;
_group setCombatMode "YELLOW";

{
    _x setUnitCombatMode "YELLOW";
    _x enableAI "TARGET";
    [_x, true] call SQFM_fnc_manToggleExternalAi;
} forEach _men;

true;