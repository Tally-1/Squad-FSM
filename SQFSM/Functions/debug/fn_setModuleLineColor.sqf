params[
	["_color", nil, [[]]]
];

private _newLines = [];
{_newLines pushBack [_x#0, _x#1, _color]}forEach(_self get "lines");

_self set ["lines", _newLines];

true;