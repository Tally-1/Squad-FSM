if(!SQFM_debugMode)exitWith{};
params[
    ["_map",nil,[controlNull]]
];
private _battles = missionNamespace getVariable ["SQFM_battles", []];
{_y call ["drawOnMap",[_map]]} forEach _battles;

true;