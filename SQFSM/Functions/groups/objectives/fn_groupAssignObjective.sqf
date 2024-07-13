params[
	["_objectiveModule",nil,[objNull]]
];
private _objctvData = _objectiveModule getVariable "SQFM_objectiveData";
private _group      = _self get "grp";

_objctvData call ["assignGroup",[_group]];


true;