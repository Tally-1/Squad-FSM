private _group     = group player;
private _groupData = _group call getData;
private _vehicle   = _groupData get "transportVehicle";
if(isNull _vehicle)exitWith{
	"no vehicle found" call dbgs;
	false;
};

private _transportGroup = group driver _vehicle;
if(isNull _transportGroup)
exitWith{[_vehicle] call SQFM_fnc_endPlayerTransport; true};

private _transportData = _transportGroup call getData;
_transportData call ["deleteWaypoints"];
[_transportGroup]call SQFM_fnc_onDropOffWpTransporter;

true;