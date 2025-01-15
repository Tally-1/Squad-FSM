params[
    ["_vehicle",  nil,[objNull]]
];
private _eventHandler = _vehicle getVariable "SQFM_artyFiredEh";
if(!isNil "_eventHandler")exitWith{_eventHandler};

_eventHandler = _vehicle addEventHandler ["Fired", {_this spawn SQFM_fnc_onArtyFired}];
_vehicle setVariable ["SQFM_artyFiredEh", _eventHandler];

_eventHandler;