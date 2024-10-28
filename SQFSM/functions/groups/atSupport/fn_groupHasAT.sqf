private _members   = _self call ["getGrpMembers"];
private _AtMembers = [];

_members insert [0,(_self call ["nonCrewMen"]),true];

{
    private _atVehicle = [_x] call SQFM_fnc_isAtVehicle;
    if(_atVehicle)
    then{_AtMembers pushBackUnique _x}
    else{if([_x, true] call SQFM_fnc_isAtMan)
    then{_AtMembers pushBackUnique _x}};
    
} forEach _members;

if(_AtMembers isEqualTo [])exitWith{false};

true;