private _callStatus = call SQFM_fnc_playerCanCallReinforcement;
if(_callStatus isNotEqualTo "ready")
exitWith{[_callStatus]call SQFM_fnc_rejectReinforcementCall};

[
    "SQFM_playerCallReforce",
    [group player]

] call CBA_fnc_serverEvent;
// private _data = group player call getData;

// _data call ["update"];
// _data call ["requestReinforcements"];

// [] spawn SQFM_fnc_showReforceData;

true;