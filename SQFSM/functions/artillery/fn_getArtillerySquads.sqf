params[
    ["_side",nil,[west]]
];

private _squads = allGroups select{[_x,_side] call SQFM_fnc_isAvailArtySquad};

_squads;