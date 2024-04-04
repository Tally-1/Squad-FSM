params[
	["_module",nil,[objNull]]
];
private _text  = "Not initialized!";
private _color = [1,0.1,0.1,1];
private _pos   = getPosATL _module;

drawIcon3D [
        "\A3\ui_f\data\map\markers\military\unknown_CA.paa",            
        _color,
        _pos,
        1,
        1,
        0,       
        _text,
        2,             
        0.03
];

true;