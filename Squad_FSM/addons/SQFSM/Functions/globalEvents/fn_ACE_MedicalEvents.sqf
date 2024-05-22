["ace_medical_CriticalInjury", {
params["_man"];
isNil{[_man] call SQFM_fnc_ACE_Medical_OnStatusChange;};

}] call CBA_fnc_addEventHandler;

["ace_medical_knockout", {
params["_man"];
isNil{[_man] call SQFM_fnc_ACE_Medical_OnStatusChange;};

}] call CBA_fnc_addEventHandler;


["ace_medical_WakeUp", {
params["_man"];
isNil{[_man] call SQFM_fnc_ACE_Medical_OnStatusChange;};

}] call CBA_fnc_addEventHandler;