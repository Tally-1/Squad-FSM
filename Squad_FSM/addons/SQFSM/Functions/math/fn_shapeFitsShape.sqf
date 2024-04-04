params[
	["_shape", nil, [createHashmap]]
];
private _canFit = true;
{
	private _key   = _x;
	private _value = _y;
	private _myVal = _self get _key;
	if(typeName _value isEqualTo "NUMBER"
	&&{_value > _myVal})
	exitWith{_canFit = false;};

} forEach _shape;

_canFit;