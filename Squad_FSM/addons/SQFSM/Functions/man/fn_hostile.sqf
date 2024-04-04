params[
	["_man1", nil, [objNull, west]],
	["_man2", nil, [objNull, west]]
];

if(typeName _man1 isEqualTo "SIDE"
&&{typeName _man2 isEqualTo "SIDE"})
exitWith{!([_man1, _man2] call BIS_fnc_sideIsFriendly)};

private _isHostile = !([(side group _man1), (side group _man2)] call BIS_fnc_sideIsFriendly);

_isHostile;