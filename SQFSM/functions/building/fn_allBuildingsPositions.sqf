params[
    ["_buildings",nil,[[]]],
    ["_startPos", nil,[[]]]   // If declared it will be used to sort the positions according to distance.
];
private _positions = [];

{
    _positions insert [(count _positions), _x buildingPos -1,true];
    
} forEach _buildings;

if(!isNil "_startPos")then{
    _positions = [_positions, [], {_startPos distance _x}, "ASCEND"] call BIS_fnc_sortBy;
};

_positions;