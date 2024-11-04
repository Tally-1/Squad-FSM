private _group      = _self get "grp";
private _unitCount  = count units _group;
private _initial    = _self getOrDefault ["initialStrength",_unitCount,true];
private _current    = _self call ["getStrength"];

if(_initial isEqualTo 0)exitWith{1};
if(isNil "_current")    exitWith{0};
if(_current isEqualTo 0)exitWith{0};

private _coef = _current / _initial;

_coef;