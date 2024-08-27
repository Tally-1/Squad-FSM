params[
	["_posArr",nil,[[]]]
];
SQFM_Custom3Dpositions = [];

if(isNil "_posArr")      exitWith{};
if(_posArr isEqualTo []) exitWith{};

private _i = 0;
SQFM_Custom3Dpositions = _posArr apply {_i=_i+1;[_x, str _i]};