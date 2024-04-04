params [
	["_number",      nil,[0]],
	["_maxDecimals", nil,[0]]
];
private _roundNumber = parseNumber (_number toFixed _maxDecimals);

_roundNumber;