params[
	["_vehicle",nil,[objNull]]
];

if!([_vehicle] call SQFM_fnc_isLandVehicle)
exitWith{"invalid vehicle passed to transport spawner" call dbgm; nil;};

private _capacity    = (_vehicle emptyPositions "");
private _crewNeeded  = 1;
private _gunnerSeat  = (fullCrew[_vehicle,"gunner",true])#0;
private _cmmndrSeat  =  (fullCrew [_vehicle, "commander", true])#0;
private _hasGunner   = !isNil "_gunnerSeat";
private _hasCmmndr   = !isNil "_cmmndrSeat";
private _position    = getPosATLVisual _vehicle;
private _direction   = getDirVisual    _vehicle;
private _className   = typeOf _vehicle;
private _shape       = [_vehicle] call SQFM_fnc_objectShape;
private _displayName = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
private _icon        = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "Icon");

if(_hasGunner)then{_crewNeeded = _crewNeeded+1};
if(_hasCmmndr)then{_crewNeeded = _crewNeeded+1};
_capacity = _capacity-_crewNeeded;

if(_capacity < 1)
exitWith{
	// private _message = joinstring"";
	[[_displayName, " cannot be used as a transport vehicle."]] call dbgm; 
	nil;
};

private _dataArr = [
	["type",      _className],
	["name",    _displayName],
	["icon",           _icon],
	["capacity",   _capacity],
	["crew",     _crewNeeded],
	["pos",        _position],
	["dir",       _direction],
	["shape",         _shape],
	["gunner",    _hasGunner],
	["cmmndr",    _hasCmmndr],

	["posClear", SQFM_fnc_transportSpawnPosClear]
];
private _hashMap = createHashMapObject [_dataArr];

_hashMap;