params[
    ["_objective",nil,[objNull]]
];
[true] call SQFM_fnc_killCameras;
private _display = []                     call SQFM_fnc_initmarkerFeedBackDisplay;
private _data    = [_display, _objective] call SQFM_fnc_initObjectiveFeedbackHud;

_data call ["initBackground"];
_data call ["showData"];
_data call ["showCamera"];