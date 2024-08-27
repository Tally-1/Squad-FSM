params[
    ["_man",  nil, [objNull]]
];
private _command = currentCommand _man;
private _action  = _man getVariable ["SQFM_flashActionMan", _command];

if(camPos distance2D _man > 100)   exitWith{false};
if(vehicle _man isNotEqualTo _man) exitWith{false};
if(_action isEqualTo "")           exitWith{false};

private _icon    = "";
private _color   = [0.8,0.8,0.8,0.6];
private _isFlash = _action isNotEqualTo _command;

if(_isFlash)then{
    _color = [1,1,1,1];
    _icon  = "\A3\ui_f\data\map\markers\military\dot_CA.paa";
};

drawIcon3D[
	_icon,
	_color,
	getPosATLVisual _man,
	1, 
	1, 
	0,  
	_action, 
	2,
	0.035
];

true;