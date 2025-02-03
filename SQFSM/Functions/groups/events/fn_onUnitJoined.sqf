params [
	["_group",   nil, [grpNull]],
	["_newUnit", nil, [objNull]]
];
private _data       = _group call getData;
private _birth      = _data get "birth";
private _timePassed = time - _birth;
private _strength   = _data call ["getStrength"];

if(_timePassed < 10)then{
	_data set  ["birth", round time];
	_data set  ["initialStrength", _strength];
	_data call ["globalize"]
};

_data call ["update"];

true;