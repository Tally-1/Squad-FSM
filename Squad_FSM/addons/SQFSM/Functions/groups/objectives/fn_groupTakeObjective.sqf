params["_objModule"];
[_self, _objModule]spawn{
params[
    ["_self",      nil,[createHashmap]],
	["_objModule", nil,[objNull]]
];

private _dropPos   = _self call ["objectiveInsertPos",[_objModule]];
private _canTravel = _self call ["initTravel",[_dropPos]];

if!(_canTravel)exitWith{false;};

_self call ["initObjectiveTask",[_objModule]];
_self call ["assignObjective",  [_objModule]];

true;
}