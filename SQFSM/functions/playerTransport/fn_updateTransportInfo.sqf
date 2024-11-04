private _vehicle = _self get "vehicle";
if!([_vehicle] call SQFM_fnc_validVehicle) exitWith{false};
if!([player,true] call SQFM_fnc_validMan)  exitWith{false};

private _aborted = _vehicle getVariable ["SQFM_transportAborted", false];
if(_aborted)exitWith{false};

private _caller = _vehicle getVariable ["SQFM_transportCaller",objNull];
if(_caller != player)exitWith{false};

private _textBox = _self get   "textBox";
private _text    = _self call ["getText"];
_textBox call ["setText",[_text]];

true;