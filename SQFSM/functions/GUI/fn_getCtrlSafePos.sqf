params[
	["_ctrl", nil, [controlNull]]
];
private _pos     = ctrlPosition _ctrl;
private _safePos = [];

for "_i"from 0 to (count _pos -1)do
{
	private _val = _pos#_i;
	if (_i isEqualTo 0) then {_val = (_val - safezoneX) / safezoneW};
	if (_i isEqualTo 1) then {_val = (_val - safezoneY) / safezoneH};
    if (_i isEqualTo 2) then {_val = _val / safezoneW};
    if (_i isEqualTo 3) then {_val = _val / safezoneH};

	_safePos pushBack _val;
};

_safePos;