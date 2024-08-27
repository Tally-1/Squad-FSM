private _title      = "Squad FSM Behaviour";
private _titleColor = [0.4, 1, 0.9, 1];
private _canvas     = "#(argb,8,8,3)color(0,0,0,0.800000,ca)";
private _backPos    = [0.3333,0.265,0.3333,0.442];
private _backGround = _self call ["addImage",[_canvas, _backPos]];
private _frame      = _self call ["addFrame",[_backPos, _title, _titleColor, true, 0.05]];

_backGround;