params[
    ["_objective",nil,[objNull]]
];
private _objectiveData = _objective call getData;
private _markerData    = _objectiveData get "markerData";
private _canShowHUD    = _markerData get "showIntel";
private _canShowFeed   = _markerData get "showFeed";
if!(_canShowHUD)exitWith{};

[true] call SQFM_fnc_killCameras;
private _display = []                     call SQFM_fnc_initmarkerFeedBackDisplay;
private _data    = [_display, _objective] call SQFM_fnc_initObjectiveFeedbackHud;

_data call ["initBackground"];
_data call ["showData"];

if!(_canShowFeed)exitWith{};

_data call ["showCamera"];