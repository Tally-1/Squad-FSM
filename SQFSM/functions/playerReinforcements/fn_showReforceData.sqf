private _display    = call SQFM_fnc_initReforceDisplay;
private _data       = _display call getData;
private _textBox    = _data get "textBox";
private _text       = (call SQFM_fnc_getReforceInfoText)#1;
private _updateNow  = true;
private _startTime  = round time;

_textBox call ["setText", [_text]];

sleep 2;

while {sleep 1; _updateNow} do { 
    private _timePassed = time-_startTime;

    (_data call ["getText"])
    params["_status", "_text"];

    if(_status isEqualTo "ended"
    &&{_timePassed>10}
    )
    exitWith{_updateNow = false};

    if("invalid" in _status)exitWith{
        private _reason = "Reinforcements canceled, reforce group is no longer valid";
        [_reason] call SQFM_fnc_playerAbortReforceLocal;
        _updateNow  = false;
    };

    if(isNull _display)
    exitWith{_updateNow  = false};

    _textBox call ["setText", [_text]];
};

_display closeDisplay 1;