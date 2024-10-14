private _data = (uiNamespace getVariable "SQFM_debugHUD")getVariable "SQFM_data";
if(isNil "_data")exitWith{};

_data call ["update"];

true;