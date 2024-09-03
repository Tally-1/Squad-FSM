params[
	["_red",   nil,      [0]],
	["_green", nil,      [0]],
	["_blue",  nil,      [0]],
	["_alpha", 256,      [0]],
	["_copy",  false, [true]]
];

private _A3Red   = _red   / 256;
private _A3Green = _green / 256;
private _A3Blue  = _blue  / 256;
private _A3Alpha = _alpha / 256;

private _a3Color = [_A3Red, _A3Green, _A3Blue, _A3Alpha];

if(_copy)then{copyToClipboard str _a3Color;};

_a3Color;