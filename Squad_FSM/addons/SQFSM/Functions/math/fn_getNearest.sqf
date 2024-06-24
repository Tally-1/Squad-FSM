params[
	["_center", nil, [[],objNull]],
	["_posArr", nil,         [[]]]
];
private _selAlgo = {
	private _valid = true;
	if(_center isEqualTo _x)then{_valid = false;};
	if(typeName _x isEqualTo "OBJECT"
	&&{isNull _x})then{_valid = false;};
	
	_valid;
};

_posArr = _posArr select _selAlgo;
private _count = count _posArr;

if(_count isEqualTo 0)exitWith{};
if(_count isEqualTo 1)exitWith{_posArr#0;};

private["_nearest"];

isNil{_nearest = ([_posArr, [], {_center distance2D _x }, "ASCEND"] call BIS_fnc_sortBy)#0};

_nearest;