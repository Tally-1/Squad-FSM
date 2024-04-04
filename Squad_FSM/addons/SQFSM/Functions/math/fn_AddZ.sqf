params[
	["_Position",   nil, [[]]],
	["_valueToAdd", nil,  [0]]
];
if(typeName _Position isNotEqualTo "ARRAY") exitWith{};
if(count _Position < 3)                     exitWith{};

private _newPos = [
	_Position select 0,
    _Position select 1,
    (_Position select 2) + _valueToAdd
];

_newPos;