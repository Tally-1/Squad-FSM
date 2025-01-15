params[
    ["_side",nil,[west]]
];
private _requests = SQFM_artilleryRequests get _side;
{_requests deleteAt(_requests find _x)} forEach _requests;

[["No available Artillery for ",_side]] call dbgm;

SQFM_artilleryRequests set [_side, []];
SQFM_artilleryRequests call ["globalize"];

if!(SQFM_showArtyChat)exitWith{};

private _delay     = random 3;
private _radioMsg  = "All units! be adviced, we have no artillery available at this time!";
private _radioMsg2 = "All artillery requests have been denied.";

[_side, _msg, _delay]   spawn SQFM_fnc_delayedBaseSideChat;
[_side, _msg, _delay+1] spawn SQFM_fnc_delayedBaseSideChat;