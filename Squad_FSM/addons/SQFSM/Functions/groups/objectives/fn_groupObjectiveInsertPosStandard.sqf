params[
	["_objModule",nil,[objNull]]
];
private _objData = _objModule call getData;
private _area    = _objData get "area";
private _leader  = leader(_self get"grp");
private _insPos  = [_area, 6, _leader, true] call SQFM_fnc_getAreaParkingPos;

_insPos;