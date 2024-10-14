private _display      = uiNamespace getVariable "SQFM_currentEditDisplay";
private _displayData  = [_display, "SQFM_SquadMenu"] call SQFM_fnc_initDisplayData;
private _vanillaCtrls = allControls _display;

{_x ctrlShow false} forEach _vanillaCtrls;

_displayData set ["squadSettings", createHashmap]; // will be defined when calling initSettingEdits

_displayData set ["initBackground",      SQFM_fnc_initCuratorSquadMenuBackground];
_displayData set ["initSettingList",    SQFM_fnc_initCuratorSquadMenuSettingList];
_displayData set ["initButtons",            SQFM_fnc_initCuratorSquadMenuButtons];
_displayData set ["addCheckBoxSetting",          SQFM_fnc_curatorSquadMenuAddCBS];
_displayData set ["addSliderSetting",            SQFM_fnc_curatorSquadMenuAddSLS];
_displayData set ["initSettingEdits",  SQFM_fnc_curatorSquadMenuInitSettingEdits];

_displayData;