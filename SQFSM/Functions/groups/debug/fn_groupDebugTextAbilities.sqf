private _title       = [_newLine,_largeTxt, "Abilities:", _end]joinString"";
private _abilities   = [_title];
private _i           = 0;
private _abilityKeys = [
    "canDefend",
    "canAttack",
    "canHunt",
    "huntDistance",
    "canReinforce",
    "canCallReinforcements",
    "canCallAir",
    "canCallArty"
];

{
    private _name   = (_x select [3, count _x])+"s";//[, _maxLetterCount] call SQFM_fnc_textInsertSpace;
    private _color  = _green;
    private _value  = _self get _x;
    private _number = typeName _value isEqualTo "SCALAR";

    if(_number)then{_color = _aqua};
    if(_value isEqualTo false 
    ||{_value isEqualTo 0})
    then{_color = _red};
    if(_x isEqualTo "huntDistance")
    then{_name = "Hunt Distance"};
    

    if("Call" in _x)then{
        _name = ["Can call ", (_x select [7, count _x])]joinstring"";
    };


    private _title = [_subCategoryTitle, _name, _end]joinString"";
    private _text  = ["<t align='right' t size='1.2'>", _color, _value, _end,_end]joinString"";
    private _line  = [_newLine, _title, _text]joinString"";

    _abilities pushBack _line;

    if(_i isEqualTo 3)then{_abilities append [_newLine, _newLine,_largeTxt,"Support calls:",_end]};

    _i=_i+1;
} forEach _abilityKeys;

private _abilityString = _abilities joinString "";

_abilityString;