params[
    ["_target",nil,[objNull]]
];
private _canCall = _self call ["canCallAtSupport",[_target]];
if!(_canCall)exitWith{};

_self call ["sendAtSupportRequest",[_target]];

true;