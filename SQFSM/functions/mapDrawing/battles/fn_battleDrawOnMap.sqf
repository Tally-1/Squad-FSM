params[
    ["_map",nil,[controlNull]]
];
private _orange       = [0.85,0.4,0,1];
private _green        = [0.3,1,0.3,1];
private _red          = [1,0.3,0.3,1];
private _blue         = [0.3,0.3,1,1];
private _icon         = "\a3\ui_f\data\igui\cfg\simpletasks\types\attack_ca.paa";
private _pos          = (_self get "zone")#0;
private _rad          = (_self get "zone")#1;
private _updtTime     = time - (_self get "updateTime");
private _iconColor    = _orange;
private _text         = "";
private _southPos     = _self get "southPos";
private _strengthEast = [round((_self get "strengthEast")*100),"%"]joinString"";
private _strengthGuer = [round((_self get "strengthGuer")*100),"%"]joinString"";
private _strengthWest = [round((_self get "strengthWest")*100),"%"]joinString"";
private _sides        = _self get "sides";

if(_updtTime < 2)then{
    _text      = "Updated";
    _icon      = "\a3\ui_f\data\igui\cfg\simpletasks\types\move_ca.paa";
    _iconColor = _green;
};

[_map, _icon, _iconColor,_pos,25,_text] call SQFM_fnc_drawMapIcon;
_map drawEllipse [_pos, _rad, _rad, 0, _red, ""];

if(east in _sides)then{
    private _pos = [(_southPos#0)-25, _southPos#1, 0];
    _map drawIcon [
	_icon,           // texture
	_red,          // color
	_pos,            // position
	0,               // width
	0,               // height
	0,          // angle
	_strengthEast,   // text
	2,               // shadow
	0.07,            // textSize
	"PuristaMedium", // font
	"center"         // align
];
};

if(independent in _sides)then{
    _map drawIcon [
	_icon,           // texture
	_green,          // color
	_southPos,       // position
	0,               // width
	0,               // height
	0,          // angle
	_strengthGuer,   // text
	2,               // shadow
	0.07,            // textSize
	"PuristaMedium", // font
	"center"         // align
];
};

if(west in _sides)then{
    private _pos = [(_southPos#0)+25, _southPos#1, 0];
    _map drawIcon [
	_icon,           // texture
	_blue,          // color
	_pos,            // position
	0,               // width
	0,               // height
	0,          // angle
	_strengthWest,   // text
	2,               // shadow
	0.07,            // textSize
	"PuristaMedium", // font
	"center"         // align
];
};

true;