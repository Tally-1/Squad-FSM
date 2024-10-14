params [
    ["_man",  nil, [objNull]]
];
private _dist = _man distance _pos;
if(_dist>5)exitWith{[_man, "Move failed"] spawn SQFM_fnc_flashActionMan};

[_man, "Move ended"] spawn SQFM_fnc_flashActionMan;

doStop _man;