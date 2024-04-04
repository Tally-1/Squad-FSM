params[
	["_capacityNeeded",nil,[0]]
];
private _assetCount = _self get "assetCount";
if(_assetCount < 1)exitWith{[false,-1]};

private _capacity = _self get "maxCapacity";
if(_capacity < _capacityNeeded)exitWith{[false,-1]};

private _timeSinceSpawn = _self call ["timeSinceSpawn"];
if(_timeSinceSpawn < 10)exitWith{[true, 10-_timeSinceSpawn]};

[true,0];