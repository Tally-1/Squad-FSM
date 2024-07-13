private _groups = _self call ["getGroupsInZone"];
private _sides  = [_groups] call SQFM_fnc_sidesFromGroupArr;

_sides;