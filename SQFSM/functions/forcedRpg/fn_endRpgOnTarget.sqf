params[
    ["_man",nil,[objNull]]
];
private _timeLimit = round(time+15);
private _firedEh   = _man getVariable "SQFM_rpgFiredEh";
if(isNil "_firedEh")exitWith{};

if(canSuspend)then{
    waitUntil { 
            if(time> _timeLimit)exitWith{true};
            private _fired = _man getVariable ["SQFM_rpgFired", false];
            if(_fired)exitWith{true};
            false;
    };
};

private _fired  = _man getVariable ["SQFM_rpgFired", false];
if(_fired)
then{[_man, "SUCCESS!"]   spawn SQFM_fnc_flashActionMan}
else{[_man, "failure..."] spawn SQFM_fnc_flashActionMan};

[_man] call SQFM_fnc_deInitRpgOnTarget;

true;