private _frameColor = [1,1,1,0.5];
private _ctrlHeight = 0.027;
private _pos        = [0.35, 0.3, 0.3, _ctrlHeight];
private _squad      = SQFM_currentEditSquad;
private _squadData  = _squad call getData;
private _onChange   = SQFM_fnc_onCuratorSquadMenuSettingChange;
private _checkBoxes = [
    ["Capture Objectives",       "canAttack"],
    ["Defend Objectives",        "canDefend"],
    ["Can reinforce",            "canReinforce"],
    ["Push near enemies",        "canHunt"],
    ["Can call Artillery",       "canCallArty"],
    ["Can call CAS",             "canCallAir"],
    ["Can call reinforcements",  "canCallReinforcements"]
];

private _sliders = [
    ["Push Distance",   "huntDistance"],
    ["Push Knowledge",  "huntKnowledge"]
];

{
    private _title     = _x#0;
    private _key       = _x#1;
    private _value     = _squadData get _key;
    private _settings  = _self get "squadSettings";
    private _newYpos   = (_pos#1)+(_ctrlHeight + 0.005);
    private _alpha     = _frameColor#3;
    private _newAlpha  = ([0.5,0.25] select {_x != _alpha})#0;
    private _ctrlGroup = _self call ["addCheckBoxSetting", [_pos, _title, _value,_onChange,_frameColor]];
    private _checkBox  = _ctrlGroup#2;


    _pos        set [1, _newYpos];
    _settings   set [_key, _value];
    _frameColor set [3,_newAlpha];
    _checkBox   set ["squadSetting", _key];

} forEach _checkBoxes;

{
    private _title     = _x#0;
    private _key       = _x#1;
    private _value     = _squadData get _key;
    private _range     = if(_key isEqualTo "huntKnowledge")then{[0,1]}else{[0,500]};
    private _settings  = _self get "squadSettings";
    private _newYpos   = (_pos#1)+(_ctrlHeight + 0.005);
    private _alpha     = _frameColor#3;
    private _newAlpha  = ([0.5,0.25] select {_x != _alpha})#0;
    private _ctrlGroup = _self call ["addSliderSetting", [_pos, _title, _value,_range,_onChange,_frameColor]];
    private _slider    = _ctrlGroup#2;

    _pos        set [1, _newYpos];
    _settings   set [_key, _value];
    _frameColor set [3,_newAlpha];
    _slider     set ["squadSetting", _key];
    
} forEach _sliders;

true;