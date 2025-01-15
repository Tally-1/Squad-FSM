params[
    ["_request",  nil,   [[]]],
    ["_approved", nil, [true]],
    ["_side",     nil, [west]]
];
if!(SQFM_showArtyChat)exitWith{};

_request params ["_pos", "_group", "_time"];
private _denied    = _approved isEqualTo false;
private _groupName = groupId _group;
private _posName   = [_pos] call SQFM_fnc_areaName;
private _msg       = [_groupName, "! Request denied. Artillery not able to respond."]joinString"";
private _delay     = random 3;

if(_denied)
exitWith{[_side, _msg, _delay] spawn SQFM_fnc_delayedBaseSideChat};

_msg = [_groupName, " Request approved! Shelling ", _posName, "."]joinString"";
[_side, _msg, _delay] spawn SQFM_fnc_delayedBaseSideChat;

true;