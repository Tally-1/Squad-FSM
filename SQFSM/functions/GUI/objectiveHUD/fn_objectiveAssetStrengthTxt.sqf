params[
    ["_side",nil,[west]]
];
private _sideName = "WEST";
private _color    = _blue;

if(_side isEqualTo east)then{
    _sideName = "EAST ";
    _color    = _red;
};

if(_side isEqualTo independent)then{
    _sideName = "GUER";
    _color    = _green;
};

private _objData  = _self get "objective";
private _data     = _objData call ["getAssignedAssets",[_side]];
private _men      = [_space, _color,_mediumTxt, (_data get "infantry"),  _endd]joinString"";
private _cars     = [_space, _color,_mediumTxt, (_data get "cars"),      _endd]joinString"";
private _APCs     = [_space, _color,_mediumTxt, (_data get "armor_l"),   _endd]joinString"";
private _tanks    = [_space, _color,_mediumTxt, (_data get "armor_h"),   _endd]joinString"";
private _strength = [_space, _color,_largeTxt,_right, (_data get "sum"),_enddd]joinString"";
private _assets   = [_sideName,":",_men,"     ",_cars,"     ", _APCs,"    ", _tanks,_strength]joinString"";

_assets;