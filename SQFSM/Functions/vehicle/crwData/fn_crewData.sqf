params[
	["_vehicle", nil, [objNull]]
];
private _turrets    = [_vehicle, "turret"] call SQFM_fnc_cargoSeatData;
private _cargoSeats = [_vehicle, "cargo"]  call SQFM_fnc_cargoSeatData;
private _driverSeat =  (fullCrew [_vehicle, "driver",    true])#0;
private _gunnerSeat =  (fullCrew [_vehicle, "gunner",    true])#0;
private _cmmndrSeat =  (fullCrew [_vehicle, "commander", true])#0;

if(isNil "_driverSeat" 
||{_driverSeat isEqualTo []})
then{_driverSeat = createHashmap}
else{_driverSeat = [_driverSeat, _vehicle] call SQFM_fnc_hashifySeatData};

if(isNil "_gunnerSeat" 
||{_gunnerSeat isEqualTo []})
then{_gunnerSeat = createHashmap}
else{_gunnerSeat = [_gunnerSeat, _vehicle] call SQFM_fnc_hashifySeatData};

if(isNil "_cmmndrSeat" 
||{_cmmndrSeat isEqualTo []})
then{_cmmndrSeat = createHashmap}
else{_cmmndrSeat = [_cmmndrSeat, _vehicle] call SQFM_fnc_hashifySeatData};

private _dataArr = [
	["driver",      _driverSeat],
	["gunner",      _gunnerSeat],
	["commander",   _cmmndrSeat],
	["turrets",     _turrets],
	["passengers",  _cargoSeats]
];

private _hashMap = createHashmapObject [_dataArr];

_hashMap;