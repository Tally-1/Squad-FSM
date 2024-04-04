params [
	["_pos", nil,[[],objNull]]
];
if(SQFM_battleList isEqualTo [])exitWith{};
private _nearest = ([SQFM_battleList, [], {_pos distance (_x#0)}, "ASCEND"] call BIS_fnc_sortBy)#0;

_nearest;