params[
    ["_man",nil,[objNull]]
];

private _moving = !(_man getVariable ["FSM_moveEnded", true]);
if(_moving)exitWith{false};

private _inVehicle = vehicle _man isNotEqualTo _man;
if(_inVehicle)exitWith{false};

// If soldier FSM is not running, then the man should be available.
if(!SQFM_SFSM)exitWith{true};

private _action = [_man] call SFSM_fnc_getAction;
if(_action isNotEqualTo "none")exitWith{false};

private _healing = _man getVariable ["SFSM_reviving", false];
if(_healing)exitWith{false};

true;