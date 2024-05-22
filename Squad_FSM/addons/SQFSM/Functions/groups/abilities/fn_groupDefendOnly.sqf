private _abilities = _self call ["getAbilities"];
private _canAttack = "attack" in _abilities;
private _canDefend = "defend" in _abilities;

if!(_canDefend)exitWith{false;};
if (_canAttack)exitWith{false;};

true;