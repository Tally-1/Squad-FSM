waitUntil {!isNull (findDisplay 12 displayCtrl 51)};

private _map = findDisplay 12 displayCtrl 51;
[findDisplay 12, "SQFM_mapDisplay"] call SQFM_fnc_initDisplayData;
_map ctrlAddEventHandler ["Draw",{_this call SQFM_fnc_drawOnMap}];