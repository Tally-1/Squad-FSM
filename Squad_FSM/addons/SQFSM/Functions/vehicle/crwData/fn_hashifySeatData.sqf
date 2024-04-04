params[
	["_seatData", nil,      [[]]],
	["_vehicle",  nil, [objNull]]
];
private _crewMan     = _seatData#0;
private _assignedMan = _seatData#5;
private _cargoIndex  = _seatData#2;
private _turretPath  = _seatData#3;
private _seatStatus  = [_seatData] call SQFM_fnc_seatStatus;

if(!alive _crewMan
&&{alive _assignedMan})
then{_crewMan = _assignedMan};

private _dataArr     = [
	["vehicle",                  _vehicle],
	["man",                      _crewMan],
	["seat",   [_cargoIndex, _turretPath]],
	["status",                _seatStatus],

	/************************************/
	["clearSeat",      SQFM_fnc_clearSeat]
];

private _hashMap = createHashmapObject [_dataArr];

_hashMap;