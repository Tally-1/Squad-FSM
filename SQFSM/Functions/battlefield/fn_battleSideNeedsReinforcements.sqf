params[
    ["_side",nil,[east]]
];

private _strengthData      = _self get "strengthData";
private _reinforcementData = _self get "reinforData";
private _baseCoef          = _strengthData call ["strengthCoef", [_side]];

if(_baseCoef > 0.4)        exitWith{
    false;
};

if(_baseCoef isEqualTo -1) exitWith{
    [[_side," is eliminated in a battle"]] call dbgm;
    false;
};

private _strength      = _strengthData      call ["friendlyStrength",[_side]];
private _reforce       = _reinforcementData call ["friendlyStrength",[_side]];
private _enemyStrength = _strengthData      call ["enemyStrength",   [_side]];
private _allyStrength  = _strength+_reforce;
private _totalStrength = _enemyStrength+_allyStrength;
private _finalCoef     = _strength/_totalStrength;
if(_finalCoef > 0.6)exitWith{
    [[_side," has enough reinforcements for battle"]] call dbgm;
    false;
};

true;