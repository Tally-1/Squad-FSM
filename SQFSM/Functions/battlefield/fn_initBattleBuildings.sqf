private _self      = _this;
private _pos       = _self get "position";
private _rad       = _self get "radius";
private _buildings = [_pos, _rad] call SQFM_fnc_nearBuildings;
{
	private _displayName = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
	private _color       = [0.4, 1, 0.9, 1];
	private _data        = [_displayName, _color];
	_x setVariable ["SQFM_buildingData", _data, true];

} forEach _buildings;

_self set ["buildings",  _buildings];
_self set ["urbanZones", ([_buildings] call SQFM_fnc_getUrbanZones)];

true;