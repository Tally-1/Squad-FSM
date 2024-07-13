params[
	["_building", nil, [objNull]]
];
	
private _data  = _building getVariable ["SQFM_buildingData", ["", [1,1,1,1]]];
private _text  = _data#0;
private _color = _data#1;
private _pos   = getPosATL _building;

drawIcon3D [
        "\A3\ui_f\data\map\mapcontrol\Tourism_CA.paa",            
        _color,
        _pos,
        0.6,
        0.6,
        0,       
        _text,
        2,             
        0.028
];

true;