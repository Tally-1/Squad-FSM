params [
    ["_player",nil,[objNull]]
];
private _playable = [_player] call SQFM_fnc_playableUnit;
if!(_playable)exitWith{false};

true;