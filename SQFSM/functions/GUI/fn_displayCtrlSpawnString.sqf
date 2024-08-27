params[
	["_text",    nil,         [""]],
	["_time",    1,            [0]],
	["_delay",   0,            [0]]
];
private _control = _self get "ctrl";
[
    _control, 
    _text,
    _time,
    _delay

] spawn SQFM_fnc_ctrlSpawnText;

true;