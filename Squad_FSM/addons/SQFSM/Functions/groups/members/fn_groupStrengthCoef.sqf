private _initial = _self get "initialStrength";
private _current = _self call ["getStrength"];

if(_initial isEqualTo 0)exitWith{1};
if(_current isEqualTo 0)exitWith{0};
private _coef = _current / _initial;

_coef;