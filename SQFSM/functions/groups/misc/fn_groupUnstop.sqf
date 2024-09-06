private _group = _self get "grp";
private _men   = units _group; 
{
    if(currentCommand _x isEqualTo "STOP")
    then{
		_x doFollow leader _group;
		_x doMove getpos _x;
	};
} forEach _men;

_self call ["leaveFipos"];

true;