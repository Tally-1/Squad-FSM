private _group = _self get "grp";

_self call ["unStop"];
_group enableAttack false;
_group setBehaviourStrong "AWARE";

{
    _x setVariable ["SFSM_Excluded",true,true];
    _x setUnitPos "UP";
    _x disableAI "AUTOCOMBAT";
    _x disableAI "TARGET";

}foreach units _group;

true;