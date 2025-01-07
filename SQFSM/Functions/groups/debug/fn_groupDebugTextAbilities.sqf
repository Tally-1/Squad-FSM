private _title       = [_newLine,_largeTxt, "Abilities:", _end]joinString"";
private _abilities   = [_title];
private _i           = 0;
private _abilityKeys = [
    "canIdleCover",
    "canDefend",
    "canAttack",
    "canHunt",
    "huntDistance",
    "huntKnowledge",
    "canReinforce",
    "canUseNearVehicles",
    "forceTravelOnFoot",
    "canCallReinforcements",
    "canCallArty",
    "canGetTransport"
];

{ 
    private _name   = (_x select [3, count _x])+"s";
    private _color  = _green;
    private _value  = _self get _x;
    private _number = typeName _value isEqualTo "SCALAR";

    private _huntDistance    = _x isEqualTo "huntDistance";
    private _huntKnowledge   = _x isEqualTo "huntKnowledge";
    private _idleCover       = _x isEqualTo "canIdleCover";
    private _callTransport   = _x isEqualTo "canGetTransport";
    private _useNearVehicles = _x isEqualTo "canUseNearVehicles";
    private _forcedWalk      = _x isEqualTo "forceTravelOnFoot";

    // Set number / bool color to red in the case of false / 0;
    // Except for huntKnowledge.
    if(_number)then{_color = _aqua};
    if((_value isEqualTo false 
    ||{_value isEqualTo 0})
    &&{_huntKnowledge isEqualTo false})
    then{_color = _red};

    if(_idleCover)       then{_name = "Take cover when Idle"};
    if(_callTransport)   then{_name = "Can call transport"};
    if(_useNearVehicles) then{_name = "Use Empty Transport Vehicles"};
    if(_forcedWalk)      then{_name = "Override max walk distance"};
    if(_huntDistance)    then{_name = "Hunt Distance"};
    if(_huntKnowledge)   then{
        _name  = "Hunt Knowledge";
        _value = [round(_value*100),"%"]joinString"";
    };
    if("Call" in _x)
    then{_name = ["Can call ", (_x select [7, count _x])]joinstring""};

    private _title = [_subCategoryTitle, _name, _end]joinString"";
    private _text  = ["<t align='right' t size='1.2'>", _color, _value, _end,_end]joinString"";
    private _line  = [_newLine, _title, _text]joinString"";

    _abilities pushBack _line;

    // Add new title line for the settings of support calls.
    if(_i isEqualTo 8)
    then{_abilities append [_newLine, _newLine,_largeTxt,"Support calls:",_end]};

    _i=_i+1;
} forEach _abilityKeys;

private _abilityString = _abilities joinString "";

_abilityString;