params[
	["_position",   nil, [[]]]
];

if(typeName _position isNotEqualTo "ARRAY") exitWith{};
if(count _position < 3)                     exitWith{};

private _newPos = _position apply {round _x};

_newPos;