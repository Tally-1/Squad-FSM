params[
    ["_man", nil,[objNull]]
];
private _side    = side group _man;
private _modules = entities "SQFSM_TransportSpawner" select {(call compile(_x getVariable "sqfm_side"))==_side};;
private _nearest = [_man, _modules] call SQFM_fnc_getNearest;
if(isNil "_nearest")exitWith{};

_nearest;