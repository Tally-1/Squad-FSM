if(!isNil "SQFM_handlingArtyReqs")exitWith{};
SQFM_handlingArtyReqs = true;

{[_x] call SQFM_fnc_artilleryHandleSideRequests} forEach SQFM_validSides;

SQFM_handlingArtyReqs = nil;