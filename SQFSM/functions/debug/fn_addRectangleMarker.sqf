params[
    ["_position", nil,          [[]]],
    ["_a",        nil,           [0]],
    ["_b",        nil,           [0]],
    ["_dir",      nil,           [0]],
    ["_color",    "ColorBlack", [""]],
    ["_brush",    "BORDER",     [""]]    
];
private _markerName  = [round random 1000000, "_ellipseMarker"] joinString "";
private _marker = createMarker [_markerName, _position];

_marker setMarkerColorLocal _color;
_marker setMarkerDirLocal   _dir;
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerSizeLocal  [_a, _b];
_marker setMarkerBrushLocal _brush;
_marker setMarkerAlpha      1;

_marker;