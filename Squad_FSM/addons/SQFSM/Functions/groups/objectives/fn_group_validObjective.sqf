params[
	["_objectiveModule",nil,[objNull]]
];
private _objctvData   = _objectiveModule getVariable "SQFM_objectiveData";
private _assetWanted  = _objctvData get "asset";
private _allowedSides = _objctvData get "allowedSides";
private _groupType    = _self       get "groupType";
private _side         = side (_self get "grp");
private _matches      = [_assetWanted, _groupType] call SQFM_fnc_assetTypesMatch;
private _inRange      = _self call ["objectiveInRange",[_objectiveModule]];

if!(_side in _allowedSides) exitWith{false;};
if!(_matches)               exitWith{false;};
if!(_inRange)               exitWith{false;};

true;