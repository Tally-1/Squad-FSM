params[
    ["_battle", nil,[createHashmap]],
    ["_side",  nil,          [east]]
];
private _strengthData = _battle get "strengthData";
private _sides        = _battle get "sides";
if!(_side in _sides)exitWith{0};

private _strength      = _strengthData call ["friendlyStrength",[_side]];
if(isNil "_strength")exitWith{};

private _enemyStrength = _strengthData call ["enemyStrength",[_side]];
private _total         = _strength+_enemyStrength;
if(_total isEqualTo 0)exitWith{};

private _finalStrength = _strength/_total;

_finalStrength;