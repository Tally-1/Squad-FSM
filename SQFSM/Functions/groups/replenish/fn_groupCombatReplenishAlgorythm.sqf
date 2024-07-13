// This algorythm gives a lower number the more apt a group is for merging.
private _data    = _x call getData;
private _pos     = _data call ["getAvgPos"];
private _dist    = _pos distance2D _grpPos;
private _coef    = _data call ["strengthCoef"];
private _ownType = _self get "groupType";
private _trgType = _data get "groupType";
private _value   = _dist*_coef;

// Similar group-types get a higher priority
if(_ownType isEqualTo _trgType)
then{_value = _value*0.5};

_value;