params [
    ["_curator", nil, [objNull]],
    ["_group",   nil, [grpNull]]
];
private _data = _group call getData;
SQFM_group = _group;
if!(SQFM_debugMode) exitWith{};
if(isNil "_data")   exitWith{};

sleep 0.1;

private _debugText = _data call ["debugText"];
hint _debugText;