params[
	["_objModule",nil,[objNull]]
];
private _area      = _objModule getVariable "SQFM_objectiveData"get"area";
private _pos       = _area#0;
private _leader    = leader(_self get"grp");
private _dropPos   = [_area, 6, _leader, true] call SQFM_fnc_getAreaParkingPos;
private _canTravel = _self call ["initTravel",[_dropPos]];

if!(_canTravel)exitWith{false;};

_self call ["initObjectiveTask",[_objModule]];
_self call ["assignObjective",  [_objModule]];

true;