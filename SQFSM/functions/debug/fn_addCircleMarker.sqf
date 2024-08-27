params[
    ["_position", nil,          [[]]],
    ["_radius",   nil,           [0]],
    ["_brush",    "BORDER",     [""]],
    ["_color",    "ColorBlack", [""]]
];

private _markerName  = [round random 1000000, "_circleMarker"] joinString "";
private _marker = createMarker [_markerName, _position];

_markerName setMarkerShape "ELLIPSE";
_markerName setMarkerBrush _brush;
_markerName setMarkerSize  [_radius, _radius];
_markerName setMarkerColor _color;
_markerName setMarkerAlpha 1;


_markerName;