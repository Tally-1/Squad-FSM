private _members = (_self call ["getGrpMembers"])select{[_x] call SQFM_fnc_validLandEntity};
private _pos     = _self call ["getAvgPos"];
private _radius  = [_pos, _members] call SQFM_fnc_clusterRadius;

_radius;