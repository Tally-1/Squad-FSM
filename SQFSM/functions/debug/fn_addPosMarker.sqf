params[
    ["_position", nil,         [[]]],
    ["_text",     nil,         [""]],
    ["_size",     1,            [0]],
    ["_type",    "hd_dot",     [""]],
    ["_color",   "ColorBlack", [""]]    
];

private _markerName  = [_type,"_",round random 1000000] joinString "";
private _marker = createMarkerLocal [_markerName, _position];

_markerName setMarkerTypeLocal _type;
_markerName setMarkerSizeLocal  [_size, _size];
_markerName setMarkerColorLocal _color;
_markerName setMarkerTextLocal _text;
_markerName setMarkerAlpha 1;

_markerName;