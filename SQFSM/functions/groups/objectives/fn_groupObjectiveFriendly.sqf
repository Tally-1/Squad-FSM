params[
	["_objModule",nil,[objNull]]
]; 
private _objData      = _objModule call getData;
private _side         = _self get "side";
private _contested    = _objData call ["getContested"];
private _owner        = _objData get "owner";
private _hostileOwner = [_side, _owner] call SQFM_fnc_hostile;
private _sides        = _objData get "allowedSides";
private _forcedFriend = (count _sides isEqualTo 1)&&{_side in _sides};

if(_forcedFriend)                exitWith{true};
if(_contested)                   exitWith{false};
if(_hostileOwner)                exitWith{false};
if(_owner isEqualTo _side)       exitWith{true};

true;