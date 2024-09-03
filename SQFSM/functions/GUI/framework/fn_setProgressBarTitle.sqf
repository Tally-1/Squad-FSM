params[
	["_title",    nil,[""]],
	["_fontSize", 0.6, [0]]
];
private _titleImg = _self get "title";
_titleImg call ["setText", [_title,_fontSize]];

true;