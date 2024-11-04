params[
    ["_vehicle",     nil,[objNull]],
    ["_destination", nil,     [[]]]
];
private _displayName = "SQFM_transportInfo";
private _display     = [_displayName,true,true] call SQFM_fnc_initHudDisplay;
private _data        = [_display, _displayName] call SQFM_fnc_initDisplayData;
private _titleColor  = [0.4,1,0.9,0.7];
private _textPos     = [0.35,0.05,0.3,0.12];
private _textBox     = _data call ["addTextBox", [_textPos]];
private _updateNow   = true;

_data    set  ["getText", SQFM_fnc_getTransportInfoText];
_data    set  ["textBox",                      _textBox];
_data    set  ["vehicle",                      _vehicle];
_data    set  ["destination",              _destination];
_data    set  ["updateHUD",SQFM_fnc_updateTransportInfo];
_textBox call ["setText",     [(_data call["getText"])]];

while {_updateNow} do {
    sleep 0.1;
    _updateNow = false;
    if(isNil "_data")   exitWith{};
    if(isNull _display) exitWith{};

    _updateNow = _data call ["updateHUD"];
};

_display closeDisplay 1;

true;