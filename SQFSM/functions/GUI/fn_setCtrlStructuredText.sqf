params[
	["_string", nil,["",[]]]
];
if(typeName _string isEqualTo "ARRAY")
then{_string = _string joinString""};

private _text = parseText _string;
private _ctrl = _self get "ctrl";

_ctrl ctrlSetStructuredText _text;

true;