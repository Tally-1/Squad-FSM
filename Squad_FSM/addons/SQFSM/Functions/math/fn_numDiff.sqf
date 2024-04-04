params[
	["_numberA", nil, [0]],
	["_numberB", nil, [0]]
];
private _diff = _numberA - _numberB;

if(_diff < 0)then{_diff = 0 - (_diff)};

_diff;