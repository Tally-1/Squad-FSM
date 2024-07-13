addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if!(_unit isKindOf "caManBase")exitWith{};
	
	private _data = group _unit call getData;
	if(isNil "_data")exitWith{};
	_data call ["update"];
}];