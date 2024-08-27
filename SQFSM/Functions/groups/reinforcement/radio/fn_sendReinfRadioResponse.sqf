params[
    ["_requestList", nil,   [[]]],
    ["_approved",    nil, [true]],
    ["_side",        nil, [west]]
];
if!(SQFM_showReforChat)exitWith{};

private _count    = count _requestList;
private _response = "approved.";

if!(_approved)  then{_response = "denied."};
if (_count > 2)exitWith{
    private _msg = [_count, " requests for reinforcements has been ", _response]joinString"";
    [[_side, "base"], _msg] remoteExecCall ["sideChat"];
};

{
    [
        _x,
        _approved,
        _side

    ] call SQFM_fnc_reinfRequestRadioResponse;
    
} forEach _requestList;

true;