params[
    ["_map",nil,[controlNull]]
];
if(!SQFM_debugMode)exitWith{};

{
    _y params ["_targetPos","_rounds","_color","_timeLimit"];
    [_map,_targetPos,_rounds,_color,_timeLimit] call SQFM_fnc_artyRequestMap;
    
} forEach SQFM_activeArtyRequests;

true;