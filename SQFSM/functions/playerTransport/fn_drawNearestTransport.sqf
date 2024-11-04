params[
    ["_map",nil,[controlNull]]
];
if(isNil "SQFM_nearestTransport") exitWith{};
if(!alive SQFM_nearestTransport)  exitWith{};

private _icon  = "\A3\ui_f\data\map\markers\military\pickup_CA.paa";
Private _color = [1,1,1,1];
private _pos   = getPosASLVisual SQFM_nearestTransport;
private _text  = "Transport";

[
    _map,
    _icon,
    _color,
    _pos,
    25,
    _text

] call SQFM_fnc_drawMapIcon;

true;