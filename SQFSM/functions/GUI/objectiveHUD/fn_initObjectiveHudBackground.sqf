private _objData    = _self get "objective";
private _title      = _objData get "description";
private _titleColor = [0.4, 1, 0.9, 1];
private _canvas     = "#(argb,8,8,3)color(0,0,0,0.800000,ca)";
private _backPos    = [0.09,0.045,0.2,0.7];
private _backGround = _self call ["addImage",   [_canvas, _backPos]];
private _textPos    = [_backPos#0,0.06,_backPos#2,_backPos#3];
private _textBox    = _self call ["addTextBox", [_textPos]];
private _imgPos     = [_backPos#0,0.545,_backPos#2,_backPos#2];
private _imgBox     = _self call ["addImage",   ["", _imgPos]];
private _mapImgBox  = _imgBox;
private _goodFps    = diag_fps > 22;
private _frame      = _self call ["addFrame",   [_backPos, _title, _titleColor, _goodFps, 0.05]];

if(visibleMap)then{
    private _mapDisplay = findDisplay 12;
    private _mapData    = _mapDisplay getVariable "SQFM_data";
    private _mapImgBox  = _mapData call ["addImage", ["#(argb,8,8,3)color(1,0,0,0.400000,ca)", _imgPos]];
    _self set ["mapImgBox",_mapImgBox];
};

_self set ["mainText", _textBox];
_self set ["imageBox",  _imgBox];

_backGround;