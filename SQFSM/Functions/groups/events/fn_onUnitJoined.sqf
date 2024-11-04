params [
	["_group",   nil, [grpNull]],
	["_newUnit", nil, [objNull]]
];
private _data       = _group call getData;
private _birth      = _data get "birth";
private _timePassed = time - _birth;
private _strength   = _data call ["getStrength"];
private _noUpdate   = (time - (_self get "lastUpdate"))<1;

if(_timePassed < 10)then{
	_data set ["birth", round time];
	_data set ["initialStrength", _strength];

	if(_noUpdate)
	then{_data call ["globalize"]};
};

_data call ["update"];

true;