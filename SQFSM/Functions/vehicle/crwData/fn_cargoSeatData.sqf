params[
	["_vehicle", nil, [objNull]],
	["_role",    nil,      [""]]
];

if!(_role in ["turret", "cargo"])
exitWith{
	"Wrong enum for seats query" call dbgm;
	'Use: ["turret", "cargo"]'   call dbgm;
	nil;
};
private _dataArr = fullCrew [_vehicle, _role, true];
if(_dataArr isEqualTo [])exitWith{[]};

private _seats = [];
{
	private _hashMap = [_x, _vehicle] call SQFM_fnc_hashifySeatData;
	_seats pushBackUnique _hashMap;

} forEach _dataArr;

_seats;