private _group = _self get "grp";
{
    if(currentCommand _x isEqualTo "STOP")
    then{
		_x doFollow leader _group;
		_x doMove getpos _x;
	};
    
} forEach (units _group);

true;