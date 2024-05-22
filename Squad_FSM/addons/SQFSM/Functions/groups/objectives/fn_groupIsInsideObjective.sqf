params[
	["_objModule",nil,[objNull]]
];
if(isNil "_objModule") then{_objModule = _self get "objective"};
if(isNil "_objModule") exitWith{};
if(isNull _objModule)  exitWith{};
private _ownGroup = _self get "grp";
private _objData  = _objModule call getData;
private _groups   = _objData call ["getGroupsInZone"];
private _present  = _ownGroup in _groups;

_present;