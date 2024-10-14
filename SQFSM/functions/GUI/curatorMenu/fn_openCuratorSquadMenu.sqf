private _displayData  = call SQFM_fnc_initCuratorSquadMenuDisplay;

_displayData call ["initSettingList"];
_displayData call ["initBackground"];
_displayData call ["initButtons"];
_displayData call ["initSettingEdits"];

true;