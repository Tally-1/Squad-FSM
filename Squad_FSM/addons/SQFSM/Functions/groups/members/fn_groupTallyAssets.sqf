private _infantry   = _self call ["nonCrewMen"] select {[_x] call SQFM_fnc_functionalMan};
private _men        = count _infantry;
private _vehicles   = (_self call ["getVehiclesInUse"]) select {[_x] call SQFM_fnc_validVehicle};
private _armedCars  = 0;
private _lightArmor = 0;
private _heavyArmor = 0;

if(_vehicles isEqualTo [])
exitWith{[_men,0,0,0]};

{
    if([_x] call SQFM_fnc_validVehicle) then{
    if([_x] call SQFM_fnc_isArmedCar)   then{_armedCars  = _armedCars  +1;};
    if([_x] call SQFM_fnc_isLightArmor) then{_lightArmor = _lightArmor +1;};
    if([_x] call SQFM_fnc_isHeavyArmor) then{_heavyArmor = _heavyArmor +1;};

}} forEach _vehicles;

[_men, _armedCars, _lightArmor, _heavyArmor];