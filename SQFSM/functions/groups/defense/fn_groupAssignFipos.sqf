params[
    ["_fipos",nil,[[]]]
];
private _assigned = [];
private _leader   = leader (_self get"grp");
{
    if([_x] call SFSM_fnc_fipoAvailable)then{
        private _assignedMan = [_x, [_leader], _assigned] call SFSM_fnc_assignFipo;
		if(alive _assignedMan)then{
            _assigned pushBackUnique _assignedMan;
        };
    };
    
} forEach _fipos;

_assigned;