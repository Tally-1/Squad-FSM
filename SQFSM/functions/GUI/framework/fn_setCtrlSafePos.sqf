params[
	["_pos",  nil,          [[]]],
	["_ctrl", nil, [controlNull]],
	["_time", 0,             [0]]
];
private _safePos = [];
for "_i"from 0 to (count _pos -1)do
{
	private _val = _pos#_i;
	if(_i isEqualTo 0)then{_val = _val * safezoneW + safezoneX};
	if(_i isEqualTo 1)then{_val = _val * safezoneH + safezoneY};
	if(_i isEqualTo 2)then{_val = _val * safezoneW};
	if(_i isEqualTo 3)then{_val = _val * safezoneH};
	_safePos pushBack _val;
};

if(!isNil "_ctrl")then{
	_ctrl ctrlSetPosition _safePos;
	_ctrl ctrlCommit _time;
};

_safePos;