/*
This function is mainly for debugging purposes allowing to copy-paste
a hashmap into a .JS file for manual reading.
*/

params[
	["_hashmap", nil, [createHashmap]]
];
private _dataArr = [];
{
	private _strTypes  = ["OBJECT", "GROUP", "CODE"];
	private _key       = _x;
	private _val       = _y;
	private _stringify = typeName _val in _strTypes;
	
	if(typeName _val isEqualTo "ARRAY"
	&&{count _val > 0
	/*&&{typeName (_val#0) in _strTypes}*/})then{
		_val = _val apply {
			if(typeName _x in _strTypes)exitWith{str _x};
			if(typeName _x isEqualTo "ARRAY")then{_x = _x apply {if(typeName _x in _strTypes)exitWith{str _x}; _x}};
			_x;			
		};
	};

	if(_stringify)then{_val = typeName _val;};
	_dataArr pushBackUnique [_key, _val];

} forEach _hashmap;

private _strData = str _dataArr;

copyToClipboard _strData;
hint _strData;

_dataArr;