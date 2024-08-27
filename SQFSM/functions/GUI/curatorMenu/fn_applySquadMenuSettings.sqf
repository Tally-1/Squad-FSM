params[
	["_ctrl",nil,[controlNull]]
];
private _display   = ctrlParent _ctrl;
private _data      = _display getVariable "SQFM_data";
private _settings  = _data get "squadSettings";
private _squad     = SQFM_currentEditSquad;
private _squadData = _squad call getData;

{_squadData set[_x,_y]} forEach _settings;


_display closeDisplay 1;