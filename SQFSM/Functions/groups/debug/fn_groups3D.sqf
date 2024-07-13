private _camPos = (positionCameraToWorld [0,0,0]);
private _groups = [];
private _men    = _camPos nearEntities ["land", 200];

{_groups pushBackUnique group _x} forEach _men;

{[_x] call SQFM_fnc_group3D} forEach _groups;