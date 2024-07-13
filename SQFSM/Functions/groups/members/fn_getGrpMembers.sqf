private _grpVehMen = []; // all men and vehicles in the group
{_grpVehMen pushBackUnique vehicle _x;} forEach units (_self get "grp");
_grpVehMen;