params[
	["_objModule",nil,[objNull]]
];
private ["_insertionPos"];
private _danger       = _self call ["objectiveHostile",[_objModule]];
private _vehicleGroup = _self call ["isVehicleGroup"];

// Vehicle groups do not need to drop infantry, so a standard position is valid.
if(_danger       isEqualTo false 
or{_vehicleGroup isEqualTo true})
then{_insertionPos = _self call ["objectiveInsertPosStandard",[_objModule]]}
else{_insertionPos = _self call ["objectiveInsertPosDanger",[_objModule]]};

_insertionPos;