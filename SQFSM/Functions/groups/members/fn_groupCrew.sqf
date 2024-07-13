private _vehicles = _self call ["getVehiclesInUse"];
private _crewMen  = [];

{
	private _driver = driver    _x;
	private _gunner = gunner    _x;
	private _cmmndr = commander _x;
	if(alive _driver)then{_crewMen pushBackUnique _driver};
	if(alive _gunner)then{_crewMen pushBackUnique _gunner};
	if(alive _cmmndr)then{_crewMen pushBackUnique _cmmndr};
	
} forEach _vehicles;

_crewMen;