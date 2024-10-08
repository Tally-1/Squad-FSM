params[
    ["_objective",nil,[objNull]]
];
private _display = []                     call SQFM_fnc_initmarkerFeedBackDisplay;
private _data    = [_display, _objective] call SQFM_fnc_initObjectiveFeedbackHud;

_data call ["initBackground"];
_data call ["showData"];
_data call ["showCamera"];