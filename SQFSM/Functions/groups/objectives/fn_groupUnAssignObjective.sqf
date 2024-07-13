private _objData = (_self get "objective")call getData;
private _group   = _self get "grp";
if(isNil "_objData")exitWith{};
_objData call ["unAssignGroup", [_group]];

true;