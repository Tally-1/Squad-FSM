params[
	["_floor", nil, [[]]], // BottomCorners
	["_roof",  nil, [[]]]  // TopCorners
];
private _color = [0.4, 1, 0.9, 1];
private _j     = 0;
private _lines = (_floor apply {
	private _endPos = _roof#_j; _j= _j+1;
	[_x, _endPos, _color];
});

_lines append [
	[_roof#0, _roof#1, _color],
	[_roof#2, _roof#3, _color],
	[_roof#0, _roof#3, _color],
	[_roof#1, _roof#2, _color]
];


_lines;