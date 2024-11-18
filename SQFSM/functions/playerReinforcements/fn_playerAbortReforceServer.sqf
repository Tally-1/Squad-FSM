params[
    ["_player",       nil,[objNull]], 
    ["_reforceGroup", nil,[grpNull]]
];
private _reforceData = _reforceGroup call getData;
private _callerData  = group _player call getData;
private _incoming    = _callerData get "incomingReforce";

_reforceData call ["abortReinforcing"];
_callerData set  ["awaitingReforce", false];

_incoming deleteAt (_incoming find _reforceGroup);

_callerData call ["globalize"];

true;