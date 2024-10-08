params[
    ["_map",nil,[controlNull]]
];
// private _pos = _self get"position";
private _area  = _self get"area";
private _color = _self get"3dColor";

_map drawRectangle [
    _area#0,  //  [Array]or{Object} - In format Position2D/3D
    _area#1,  //  Number            - 1/2 width of rectangle in meters
    _area#2,  //  Number            - 1/2 height of rectangle in meters
    _area#3,  //  Number            - Angle of rotation in degrees
    _color,   //  [Array]           - Format Color (RGBA) - line color
    ""        //  "String"          - Fill texture file or Procedural Textures.
];

true;