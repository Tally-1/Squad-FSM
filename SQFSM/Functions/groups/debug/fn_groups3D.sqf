private _groups = [];
private _men    = camPos nearEntities ["land", 200];

{_groups pushBackUnique group _x} forEach _men;

{[_x] call SQFM_fnc_group3D} forEach _groups;