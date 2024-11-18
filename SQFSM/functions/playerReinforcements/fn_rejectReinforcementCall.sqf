#include "..\misc\textIncludes.sqf";
params[
    ["_status",nil,[""]]
];
private _title = [
    _largeTxt,_center, _red, "Reinforcements Rejected!",_enddd,_newLine
]joinString"";

private _tooSoon = [
    "Your recently called reinforcements",_newLine,
    "max 1 pr minute"
]joinString"";

private _explanations = 
createHashmapObject [[
    ["invalid",                            "Your group is invalid"],
    ["call_active",            "Reinforcements already on the way"],
    ["too_soon",                                          _tooSoon],
    ["no_cba_option", "Reinforcements was disabled for your group"],
    ["not_leader",     "Only Squad Leader can call reinforcements"]
]];
private _reason = _explanations getOrDefault [_status, _status];
private _text   = parseText([_title, _newLine, _reason]joinString"");

hint _text;

if(_status isEqualTo "call_active")
then{call SQFM_fnc_showReforceData};

true;