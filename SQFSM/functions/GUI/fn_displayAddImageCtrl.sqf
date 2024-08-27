params[
	["_image",   nil,         [""]],
	["_pos",     nil,         [[]]],
	["_color",   [1,1,1,1],   [[]]],
	["_show",    PCA_debug,[false]]
];
private _img = _self call ["addCtrl",["RscPicture",_pos, _show]];

_img set  ["setText",   SQFM_fnc_imgCtrlSetText];
_img set  ["rotate",   SQFM_fnc_imgCtrlSetAngle];
_img set  ["getAngle", SQFM_fnc_imgCtrlGetAngle];
_img set  ["defaultColor",               _color];
_img call ["setImage",                 [_image]];
_img call ["setColor",                 [_color]];

_img;