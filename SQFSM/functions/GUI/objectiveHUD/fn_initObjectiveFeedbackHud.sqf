params[
    ["_display",   nil, [displayNull]],
    ["_objective", nil,     [objNull]]
];
private _data          = _display getVariable "SQFM_data";
private _objectiveData = _objective call getData;


_display displayAddEventHandler ["Unload", {_this call SQFM_fnc_onObjectiveFeedbackHudClosed}];

_data set ["initBackground", SQFM_fnc_initObjectiveHudBackground];
_data set ["showData",             SQFM_fnc_objectiveHudShowData];
_data set ["statusText",            SQFM_fnc_objectiveStatusText];
_data set ["assetsText",            SQFM_fnc_objectiveAssetsText];
_data set ["assetStrength",   SQFM_fnc_objectiveAssetStrengthTxt];
_data set ["objective",                           _objectiveData];
_data set ["showCamera",         SQFM_fnc_objectiveHudShowCamera];
_data set ["cameraReady",          SQFM_fnc_objectiveHudCamReady];

_data;