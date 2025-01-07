// Used in the activation field of a trigger to send reinforcements from a synched
// Reforce module to the position of said trigger.
// Example: 
// call SQFM_fnc_sendReforceToTrigger;

private _triggerPos = getPosATLVisual thisTrigger;
private _modules    = synchronizedObjects thisTrigger select {typeOf _x isEqualTo "SQFSM_Reforcer"};
private _available  = _modules select{
    private _data     = _x call getData;
    private _canSpawn = if(isNil "_data")
        then{false}
        else{_data call ["canSpawn", [_triggerPos, thisTrigger]]};
    
    _canSpawn;
};

"Trigger attempting to send reinforcements" call dbgm;

if(_available isEqualTo [])
exitWith{"No available modules to reinforce on trigger" call dbgm};

private _nearest   = [_callPos, _available] call SQFM_fnc_getNearest;

[_nearest, thisTrigger] spawn SQFM_fnc_reinforceTrigger;