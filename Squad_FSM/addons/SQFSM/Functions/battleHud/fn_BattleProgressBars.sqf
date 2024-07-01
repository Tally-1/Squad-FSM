params[
    ["_display", nil, [displayNull]],
    ["_ctrlPos", nil,          [[]]],
    ["_title",   nil,          [""]]
];
_ctrlPos params ["_x", "_y", "_width", "_height"];

private _alph       = 0.7;
private _textH      = 0.04; 
private _colorWest  = [0,0.3,0.6,_alph];
private _colorEast  = [0.5,0,0,_alph];
private _colorGuer  = [0,0.5,0,_alph];
private _frameColor = [1,1,1,1];

private _barPos   = _ctrlPos;
private _barFrPos = [_x, _y-(_textH*0.3), _width, _height+(_textH*0.3)];
private _barEast  = [_display, "RscProgress", _barPos,    _colorEast] call SQFM_fnc_newDisplayCtrl;
private _barWest  = [_display, "RscProgress", _barPos,    _colorWest] call SQFM_fnc_newDisplayCtrl;
private _barGuer  = [_display, "RscProgress", _barPos,    _colorGuer] call SQFM_fnc_newDisplayCtrl;
private _barFrame = [_display, "rscFrame",    _barFrPos, _frameColor] call SQFM_fnc_newDisplayCtrl;

_barFrame ctrlSetText _title;
_barFrame ctrlSetFontHeight _textH;

private _dataArr = [
    [west,                                     _barWest],
    [east,                                     _barEast],
    [independent,                              _barGuer],
    ["frame",                                 _barFrame],
    ["width",                                    _width],
    ["height",                                  _height],
    ["setprogPos",        SQFM_fnc_setBattleBarProgress],
    ["update",     SQFM_fnc_updateAllBattleProgressBars]
];
private _hashMap = createHashmapObject [_dataArr];

_hashMap call ["update",[0,0,0]];

_hashMap;