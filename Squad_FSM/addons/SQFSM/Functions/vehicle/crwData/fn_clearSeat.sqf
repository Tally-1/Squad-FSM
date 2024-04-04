private _man     = _self get "man";
private _vehicle = _self get "vehicle";
if(isNull _man)
exitWith{"no man"};

if(vehicle _man != _vehicle)
exitWith{_man leaveVehicle _vehicle; "unassigned"};

_man action ["Eject", _vehicle];
unassignVehicle _man; 
"ejected";