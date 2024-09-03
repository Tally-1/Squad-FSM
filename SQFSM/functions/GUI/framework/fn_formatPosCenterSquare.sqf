params[
	["_xPos",nil,[0]],
	["_yPos",nil,[0]],
	["_size",nil,[0]]
];
private _aspectRatio = (getResolution#1)/(getResolution#0);
private _height      = _size;
private _width       = _size*_aspectRatio;
private _newX        = _xPos-(_width/2);
private _newY        = _yPos-(_height/2);
private _position    = [_newX, _newY, _width, _height];

_position;