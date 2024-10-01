params[
	["_objModul",nil,[objNull]]
];
private _objData       = _objModul call getData;
private _active        = _objData get "activated";
private _allowedSides  = _objData get "allowedSides";
private _groupType     = _self    get "groupType";
private _side          = _self    get "side";
private _strSide       = _self call ["getStrSide"];
private _inRange       = _self call ["objectiveInRange",[_objModul]];

if!(_active)                                       exitWith{false};
if!(_inRange)                                      exitWith{false};//{"Out of range" call dbgm;false;};//
if!(_side in _allowedSides)                        exitWith{false};//{"Wong side" call dbgm;false;};//
if!(_objData call ["troopsNeeded",[_strSide]])     exitWith{false};//{"Has troops" call dbgm;false;};//
if!(_self call ["typeMatchObjective",[_objModul]]) exitWith{false};//{"No match" call dbgm;false;};//

true;