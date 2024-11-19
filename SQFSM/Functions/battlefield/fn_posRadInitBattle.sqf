params[
	["_pos",nil,[[]]],
	["_rad",nil, [0]]
];

SQFM_battleList pushBackUnique [_pos, _rad];

private _battleMap = [
	_pos, 
	_rad
] call SQFM_fnc_initBattleMap;

SQFM_battles set [_pos, _battleMap];

_battleMap call ["initGroups"];

SQFM_battles set [_pos, _battleMap];
if(SQFM_battlePublicVar)
then{
		publicVariable "SQFM_battles";
		publicVariable "SQFM_battleList";
}else{
	missionNamespace setVariable ["SQFM_battles", SQFM_battles];
	missionNamespace setVariable ["SQFM_battleList", SQFM_battleList];

	call SQFM_fnc_globalizeBattles;
};



_battleMap call ["postInit"];

[["Battle initializing | ", round time]] call dbgm;

_battleMap;