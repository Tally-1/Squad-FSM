params[
    ["_ignoreStatus",nil,[true]]
];
private _available = _ignoreStatus or {_self call["canRecieveTask"]};
if!(_available) exitWith{false};

private _canLeave = _self call["canLeaveObjective"];
if!(_canLeave)exitWith{false};

true;