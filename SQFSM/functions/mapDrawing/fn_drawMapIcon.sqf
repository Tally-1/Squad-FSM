params[
	["_map",   nil, [controlNull]],
    ["_icon",  nil,          [""]],
	["_color", nil,          [[]]],
	["_pos",   nil,          [[]]],
	["_size",  25,            [0]],
	["_text",  "",           [""]],
	["_angle",  0,            [0]],
	["_side",  "left",       [""]]
];

_map drawIcon [
	_icon,           // texture
	_color,          // color
	_pos,            // position
	_size,           // width
	_size,           // height
	_angle,          // angle
	_text,           // text
	2,               // shadow
	0.05,            // textSize
	"PuristaMedium", // font
	_side            // align
];