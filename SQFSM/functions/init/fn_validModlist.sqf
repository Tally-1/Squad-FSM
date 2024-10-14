private _valid     = true;
private _modlist   = (call SQFM_fnc_getModlist)apply {toLower _x};
private _validMods = SQFM_validMods apply {toLower _x};

{if!(_x in _validMods)exitWith{_valid=false}} forEach _modlist;

SQFM_baseModset = _valid;

_valid;