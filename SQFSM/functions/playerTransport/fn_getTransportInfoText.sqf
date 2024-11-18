#include "..\misc\textIncludes.sqf";
private _vehicle     = _self get "vehicle";
private _dropPos     = (_self get "destination")#0;
private _dropPlace   = (_self get "destination")#1;
private _vehicleName = [_vehicle] call SQFM_fnc_objectName;
private _distance    = [player distance2D _vehicle]call SQFM_fnc_describeDistance;
private _title       = [_center,_bigTxt,"Transport on the way",_end]joinString"";
private _distText    = [_vehicleName, " is ", _distance, " away."]joinString"";
private _cancelText  = [_newLine,"<t color='#e8e7e7d8'>","[CTRL]+[ESC] to cancel transport",_end]joinString"";
private _droppingOff = vehicle player isEqualTo _vehicle;
private _waitLimit   = _vehicle getVariable "SQFM_transportWait";

if(_droppingOff)then{
    _distance = [player distance2D _dropPos]call SQFM_fnc_describeDistance;
    _title    = [_center,_largeTxt,"Going to ",_dropPlace,_end]joinString"";
    _distText = [_distance, " remaining"]joinString"";

};

if(!isNil "_waitLimit")then{
    private _timeLeft = round(_waitLimit-time);
    _distance   = [player distance2D _vehicle]call SQFM_fnc_describeDistance;
    _title      = [_center,_largeTxt,"Transport leaving in  ",_timeLeft, " seconds.",_end]joinString"";
    _distText   = [
        _vehicleName," is waiting ", _distance," away.",_newLine,
        "Get your squad inside now!"
    ]joinString"";
    _cancelText = ["<t color='#e8e7e7d8'>","[CTRL]+[ESC] to cancel transport",_end]joinString"";
};

private _text = [
    _title,
    _newLine, _distText,
    _newLine, _cancelText
] joinString"";

_text;