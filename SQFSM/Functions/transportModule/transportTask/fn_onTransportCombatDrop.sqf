params[
    ["_transportGroup",nil,[grpNull]]
];
private _transportData = _transportGroup call getData;

_transportData call ["deleteWaypoints"];

private _vehicle    = _transportGroup getVariable "SQFM_transportVehcicle";
private _returnPos  = _transportGroup getVariable "SQFM_returnPos";
private _onReturnWp = 'SQFM_fnc_onReturnWpTransporter';
private _returnWp   = _transportData call ["addWaypoint", [_returnPos, 10, "MOVE", _onReturnWp]];


_vehicle doMove _returnPos;

true;