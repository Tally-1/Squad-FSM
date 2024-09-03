params[
	["_control", nil,[controlNull]],
	["_text",    nil,         [""]],
	["_time",    1,            [0]],
	["_delay",   0,            [0]]
];

uiSleep _delay;
private _count  = count _text;
private _iSleep = _time / _count;

for "_i" from 0 to (_count-1)do{
	private _subString = _text select [0,_i+1];
	_control ctrlSetText _subString;
	uiSleep _iSleep;
};

_control ctrlSetText _text;

true;