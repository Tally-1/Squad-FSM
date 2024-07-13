private _vehicles = _self call ["getVehiclesInUse"];
if(_vehicles isEqualTo [])exitWith{false};

private _vCount = count _vehicles;
private _mCount = count (_self call ["getUnits"]);
private _cars   = 0;
private _armed  = 0;

if(_mCount <= _vCount)exitWith{false};

{
	private _objKind = [_x] call objScan_fnc_vehicleType;
	if(_objKind isEqualTo "car"
	or{_objKind isEqualTo "MRAP"
	or{_objKind isEqualTo "truck"}})
	then{_cars=_cars+1};

	if("(" in _objKind
	or{_objKind isEqualTo "APC"
	or{_objKind isEqualTo "IFV"
	or{_objKind isEqualTo "Tank"}}})
	then{_armed=_armed+1};
	
} forEach _vehicles;

if(_armed > 0)exitWith{false;};
if(_cars  < 1)exitWith{false;};

true;