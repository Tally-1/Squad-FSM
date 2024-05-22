private _defaultIcon  = "\A3\ui_f\data\map\markers\handdrawn\dot_CA.paa";

{
	_x params[
		["_pos",   nil,             [[]]],
		["_txt",   "",              [""]],
		["_color", [0.6,0.6,0.1,1], [[]]],
		["_icon",  _defaultIcon,    [""]],
		["_size",  1,                [0]]
	];

	drawIcon3D [
		_icon,
		_color,
		_pos,
		_size, 
		_size, 
		0,  
		_txt, 
		2, 
		0.035
	];

} forEach SQFM_Custom3Dpositions;