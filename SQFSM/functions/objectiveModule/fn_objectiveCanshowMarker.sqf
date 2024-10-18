params[
    ["_module",nil,[objNull]]
];
private _objData = _module call getData;
if(isNil "_objData")exitWith{false};

private _markerData = _objData get "markerData";
if(isNil "_markerData")exitWith{false};

private _sides  = _markerData get "sides";
private _player = call SQFM_fnc_getCurrentMan;
private _side   = side group _player;
if!(_side in _sides)exitWith{false};

private _condition  = _markerData get "condition";
if(_condition isEqualTo "always") exitWith{true};
if(_condition isEqualTo "never")  exitWith{false};

private _owner = _objData get "owner";
if(_condition isEqualTo "when_owned" 
&&{_owner isEqualTo _side}) 
exitWith{true};

if(_condition isEqualTo "when_hostile"
&&{_owner in SQFM_validSides
&&{[_player, _owner] call SQFM_fnc_hostile}}) 
exitWith{true};

if(_condition isEqualTo "when_active" 
&&{(_objData get "activated")}) 
exitWith{true};

false;