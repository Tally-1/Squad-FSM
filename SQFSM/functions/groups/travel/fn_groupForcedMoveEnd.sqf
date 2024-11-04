private _group = _self get "grp";

_group enableAttack true;
_group setBehaviour "AWARE";

{
    _x setUnitPos "AUTO";
    _x enableAI "AUTOCOMBAT";
    _x enableAI "TARGET";

}foreach units _group;

_self call ["toggleExternalAi",[true]];

true;