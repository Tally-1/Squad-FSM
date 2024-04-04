params[
    ["_pos",nil,[[]]],
    ["_rad",nil,[0]]
];
private _entities = _pos nearEntities ["land", _rad];
private _groups   = [];

{
    private _group = group _x;
    if(!isNull _group)then{
        private _data = _group getVariable "SQFM_grpData";
        
        if((!isNil "_data")
        &&{[_group] call SQFM_fnc_validGroup})
        then{_groups pushBackUnique _group;};
    };

} forEach _entities;

_groups;