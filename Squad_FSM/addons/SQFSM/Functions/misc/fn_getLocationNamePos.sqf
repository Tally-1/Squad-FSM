params [
    ["_position",      nil,   []],
    ["_radius",        nil,  [0]],
    ["_locationTypes", nil, [[]]]
];
private _name = "";
private _pos  = [0,0,0];
{
    if ((text _x) isNotEqualTo "") 
    exitWith{
                _name = text _x; 
                _pos  = locationPosition _x;
                
                _name
        };
} forEach nearestLocations [_position, _locationTypes, _Radius];

[_name, _pos];