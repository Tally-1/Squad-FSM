params[
	["_objModule",nil,[objNull]]
]; 
private _objData      = _objModule call getData;
private _side         = _self get "side";
private _contested    = _objData call ["getContested"];
private _owner        = _objData get "owner";
private _hostileOwner = [_side, _owner] call SQFM_fnc_hostile;

if(_contested)                   exitWith{true};
if(_owner isEqualTo sideUnknown) exitWith{false};
if(_owner isEqualTo _side)       exitWith{false};

_hostileOwner;