params [
    ["_group",nil,[grpNull]]
];
private _data       = _group call getData;
private _lastWpGarr = _data get "lastWpGarr";
private _since      = time - _lastWpGarr;
if(_since < 1)exitWith{"garrison spam blocked" call dbgm};

_data set ["lastWpGarr",time];
_data spawn {_this call["garrison",["Idle Cover Garrison"]]};

true;