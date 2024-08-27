params[
    ["_ctrl",   nil,[controlNull]],
    ["_numVal", nil,          [0]]
];
(_ctrl getVariable "SQFM_controlGroup")params[
    ["_textBox",  nil,[createHashMap]],
    ["_frame",    nil,[createHashMap]],
    ["_checkBox", nil,[createHashMap]]  // can also be slider
];
private _display   = ctrlParent _ctrl;
private _data      = _display getVariable "SQFM_data";
private _settings  = _data get "squadSettings";
private _key       = _checkBox get "squadSetting";
private _value     = cbChecked _ctrl;
private _red       = [1,0.3,0.3,1];
private _green     = [0.3,1,0.3,1];
private _color     = if(_value)then{_green}else{_red};

if(!isNil "_numVal")then{ 

    private _range = sliderRange _ctrl;
    private _max   = _range#1;

    if(_max isEqualTo 0)exitWith{};
    private _coef = if(_numVal isEqualTo 0)then{0}else{_numVal/_max};

    _color = [1-_coef, _coef,0.3,1];
    _value = _numVal;
    if(_max isEqualTo 1)
    then{_color = [_coef, 1-_coef,0.3,1]};
};

_settings set  [_key, _value];
_textBox  call ["setTextColor",[_color]];

_value;