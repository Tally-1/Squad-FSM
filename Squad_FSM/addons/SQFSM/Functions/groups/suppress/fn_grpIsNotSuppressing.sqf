params[
	["_timeLimit", nil,[0]]
];
private _grpVehMen       = _self call ["getGrpMembers"];
private _shooters        = _grpVehMen select {currentCommand _x == "Suppress";};

if(_shooters isEqualTo []) exitWith{true;};
if(time > _timeLimit)      exitWith{true;};

false;