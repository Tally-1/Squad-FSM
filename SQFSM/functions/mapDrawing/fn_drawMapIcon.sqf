params[
	["_map",   nil, [controlNull]],
    ["_icon",  nil,          [""]],
	["_color", nil,          [[]]],
	["_pos",   nil,          [[]]],
	["_size",  nil,           [0]],
	["_text",  nil,          [""]]
];
// systemChat str [round time];
// private _map = findDisplay 12 displayCtrl 51;
_map drawIcon [
	_icon,           // texture
	_color,          // color
	_pos,            // position
	_size,           // width
	_size,           // height
	0,               // angle
	_text,           // text
	2,               // shadow
	0.05,            // textSize
	"PuristaMedium", // font
	"left"          // align
];