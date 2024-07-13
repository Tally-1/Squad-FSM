params[
	["_enemy", nil, [objNull]] // can be man or vehicle
];
private _enemyCluster  = [_enemy, 100, [], true] call SQFM_fnc_cluster;
private _grid          = _enemyCluster get "grid";
private _enemyVehicles = _enemyCluster call ["getVehicles"];
private _enemyMen      = _enemyCluster call ["getMen"];

if(_enemyVehicles isEqualTo []
&&{_enemyMen      isEqualTo []})
exitWith{};

[["Initial suppression started ", round time]] call dbgm;
_self set["action", "Initial return fire"];

private _gridCount = count _grid;
private _j         = 0;
private _grpVehMen = _self call ["getGrpMembers"];

for "_i" from 0 to (count _grpVehMen -1)do{ 

	if(_j>_gridCount)
	then{_j = 0};

	private _grpMember   = _grpVehMen#_i;
	private _suppressPos = ATLToASL(_grid#_j);
	_grpMember doSuppressiveFire _suppressPos;
	_j=_j+1;
};

_self call ["endReturnFire"];

true;