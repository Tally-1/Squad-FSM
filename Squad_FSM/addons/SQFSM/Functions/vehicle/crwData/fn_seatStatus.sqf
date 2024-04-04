params[
	["_seatData", nil, [[]]]
];

if(_seatData isEqualTo [])exitWith{"occupied";};

private _crewMan     = _seatData#0;
private _assignedMan = _seatData#5;

if(alive _crewMan)     exitWith{"occupied";};
if(alive _assignedMan) exitWith{"assigned"};

"available";