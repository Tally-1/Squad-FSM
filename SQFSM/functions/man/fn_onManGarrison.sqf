params[
    ["_man",      nil,[objNull]],
    ["_building", nil,[objNull]],
    ["_pos",      nil,     [[]]]
];
private _dist = _man distance _pos;
private _inside = ([_man] call SQFM_fnc_manGetBuilding)isEqualTo _building;

if(_dist>5
&&{_inside isEqualTo false})
exitWith{};

doStop _man;

true;