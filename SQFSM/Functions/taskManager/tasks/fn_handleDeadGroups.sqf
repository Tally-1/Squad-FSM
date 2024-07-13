private _groups = SQFM_deadGroups select {units _x isEqualTo []};
private _count  = (count _groups)-1;
if(_count<0)exitWith{};

for "_i"from 0 to _count do
{
	private _grp = _groups#_i;
	SQFM_deadGroups deleteAt (SQFM_deadGroups find _grp);
	deleteGroup _grp;
};

[["Deleted ", (_count+1), " groups."]] call dbgm;

SQFM_deadGroups = SQFM_deadGroups select {!isNull _x;};

true;