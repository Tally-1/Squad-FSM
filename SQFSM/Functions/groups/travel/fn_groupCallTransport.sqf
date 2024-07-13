params[
	["_dropPos",nil,[[]]]
];
private _spawner = _self call ["getTransportSpawner"];
if(isNil "_spawner")exitWith{objNull};

private _group   = _self get "grp";
private _vehicle = _spawner call ["sendTransport", [_group, _dropPos]];

_self set ["lastTransportCall", round time];

_vehicle;