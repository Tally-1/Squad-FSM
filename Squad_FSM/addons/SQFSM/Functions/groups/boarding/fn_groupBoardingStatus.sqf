private _members  = _self call ["getGrpMembers"];
private _vehicles = _members select {[_x] call SQFM_fnc_isLandVehicle};
private _men      = _members select {!(_x in _vehicles)};

if(count _vehicles isEqualTo 0 &&{count _men > 0})
exitWith{"on foot"};

if(count _men isEqualTo 0 &&{count _vehicles > 0})
exitWith{"boarded"};

if(count _men > 0 &&{count _vehicles > 0})
exitWith{"partially boarded"};

"unknown";