params[
    ["_position", nil,      [[]]],
    ["_group",    nil, [grpNull]]
];
private _data  = _group call getData;

[_position, _group] call SQFM_fnc_addArtilleryRequest;
_data call ["radioRequestArtillery"];

true;