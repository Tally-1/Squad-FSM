params[
    ["_map",nil,[controlNull]]
];
if!(SQFM_showSquadMapMarkers)exitWith{};

private _squads = allGroups select {[_x] call SQFM_fnc_validMapDrawSquad};

{[_x, _map] call SQFM_fnc_squadOnMap} forEach _squads;

[_squads, _map] call SQFM_fnc_setFocusedMapSquad;