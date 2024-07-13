private _red = [1,0.3,0.3,1];
params[ 
    ["_pos",    nil, [[]]],
    ["_rad",    nil,  [0]],
	["_PORs",   32,   [0]],
	["_color", _red, [[]]]
];
private _edgePositions = [_pos, _rad, _PORs, 2] call SQFM_fnc_pos360;
private _lines = [];

for "_i" from 0 to (count _edgePositions -1)do{
	private _startPos = _edgePositions#_i;
	private _endPos   = _edgePositions#(_i+1);
	if(isNil "_endPos")
	then{_endPos = _edgePositions#0;};
	
	private _line     = [_startPos, _endPos, _color];

	_lines pushBackUnique _line;
};

_lines;