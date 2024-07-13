params [
	["_group", nil, [grpNull]]
];
if(isNull leader _group)exitwith{};

private _pos   = ASLToATL eyePos vehicle leader _group;
private _icon  = "\a3\Ui_F_Curator\Data\CfgMarkers\minefield_ca.paa";
private _color = [0.4, 1, 0.9, 1];
private _text  = "Not initialized";


drawIcon3D[
    _icon,            
    _color,
    _pos,    
    1,         
    1,         
    0,              
    _text, 
    2,             
    0.035
];