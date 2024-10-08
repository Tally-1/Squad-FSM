params[
    ["_ctrl",nil,[controlNull]]
];
private _res       = getResolution#5;
private _factor    = 0.56/_res;
private _adjustedH = (ctrlFontHeight _ctrl)*_factor;

_ctrl ctrlSetFontHeight _adjustedH;

_adjustedH;