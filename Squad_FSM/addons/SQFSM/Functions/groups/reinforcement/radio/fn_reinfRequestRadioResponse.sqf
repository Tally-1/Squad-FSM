params[
    ["_request",  nil,   [[]]],
    ["_approved", nil, [true]],
    ["_side",     nil, [west]]
];
_request params ["_pos", "_group", "_time"];
private _denied    = _approved isEqualTo false;
private _groupName = groupId _group;
private _posName   = [_pos] call SQFM_fnc_areaName;
private _msg       = [_groupName, "! Your request has been denied, no reinforcements available."]joinString"";
private _delay     = random 1;

if(_denied)
exitWith{[_side, _msg, _delay] spawn SQFM_fnc_delayedBaseSideChat};

_msg = [_groupName, " Request approved! Reinforcements moving to ", _posName]joinString"";
[_side, _msg, _delay] spawn SQFM_fnc_delayedBaseSideChat;

true;