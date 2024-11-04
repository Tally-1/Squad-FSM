private _group = _self get "grp";

_self call ["unStop"];
_self call ["toggleExternalAi",[false]];
_group enableAttack false;
_group setBehaviourStrong "AWARE";

{
    _x setUnitPos "UP";
    _x disableAI "AUTOCOMBAT";
    _x disableAI "TARGET";

}foreach units _group;

true;