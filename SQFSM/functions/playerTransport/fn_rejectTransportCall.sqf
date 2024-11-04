#include "..\misc\textIncludes.sqf";
params[
    ["_status",nil,[""]]
];
private _title = [
    _largeTxt,_center, _red, "Cannot Call transport!",_enddd,_newLine
]joinString"";

private _explanations = 
createHashmapObject [[
    ["no_data",                     "Group Not initialized"],
    ["has_transport",     "You already have transportation"],
    ["invalid",                     "Your group is invalid"],
    ["near_enemy",               "There is an enemy nearby"],
    ["has_vehicle",       "Your group already has vehicles"],
    ["no_transport",         "Unable to spawn in transport"],
    ["not_leader",   "Only Squad Leader can call transport"],
    ["too_close",    "You are too close to the destination"]
]];
private _reason = _explanations getOrDefault [_status, _status];
private _text   = parseText([_title, _newLine, _reason]joinString"");

hint _text;

true;