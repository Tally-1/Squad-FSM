private _members     = _self call ["getGrpMembers"];
private _membersData = [_members] call SQFM_fnc_objArrData;
private _hashmap     = [_membersData] call SQFM_fnc_hashifyClusterData;


_hashmap;