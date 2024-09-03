params [
	["_progress", 0, [0]] // 0-1
];
private _framePos  = (_self get "frame")call ["getPos"];
private _fill      = _self get "fill";
private _top       = _self get "top";
private _size      = _self get "size";
private _newHeight = _size * _progress;
private _newYPos   = _top + (_size - _newHeight);
private _fillPos   = [_framePos#0, _newYPos, _framePos#2, _newHeight];

_fill call ["setPos", [_fillPos]];
_fill set ["progress", _progress];


_fillPos;