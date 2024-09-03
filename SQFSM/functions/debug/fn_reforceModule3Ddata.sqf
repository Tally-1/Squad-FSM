params[
    ["_module",nil,[objNull]]
];
private _data   = _module call getData;
private _icon   = "\a3\ui_f\data\igui\cfg\simpletasks\types\meet_ca.paa";
private _pos    = getPosATLVisual _module;
private _color  = [1,0.3,0.3,0.7];
private _data3D = [
    _icon,               // 0     "path\icon.paa"
    _color,              // 1     [RGBA]
    _pos,                // 2     [position ATL]
    1,                   // 3     size b
    1,                   // 4     size a
    0,                   // 5     angle
    "Reinforcements",    // 6     "text"
    2,                   // 7     shadow (2 = outline)
    0.035                // 8     textSize
];

if(isNil "_data")exitWith{
    _data3D set [6, "Reforce Module (Invalid)"];
    _data3D;
};

private _sent = _data get "sentCount";
private _max  = _data get "maxCount";
if(_sent >= _max)exitWith{
    _data3D set [6, "Reforce Module (No more squads available)"];
    _data3D;
};

private _ingame    = count(_data get "squads_ingame");
private _maxIngame = _data get "max_ingame";
if(_sent >= _max)exitWith{
    _data3D set [6, "Reforce Module (Ingame limit reached)"];
    _data3D;
};

private _timeSince = (time-(_data get "last_spawn"));
if(_timeSince < 10)exitWith{
    private _timeLeft = round(10-_timeSince);
    private _text = ["Reforce Module (Cooldown ", _timeLeft,")"]joinString"";
    _data3D set [6, _text];
    _data3D;
};

private _hostile = _self call ["hostileObjective"];
if(_hostile)exitWith{
    _data3D set [6, "Reforce Module (Synched objective hostile)"];
    _data3D;
};

private _text  = ["Ingame: (",_ingame,"/",_maxIngame,"). Sent: (",_sent,"/",_max,")"] joinString"";
private _side  = _data get "side";
private _color = [_side] call SQFM_fnc_sideColor;

_data3D set [1, _color];
_data3D set [6, _text];

_data3D;