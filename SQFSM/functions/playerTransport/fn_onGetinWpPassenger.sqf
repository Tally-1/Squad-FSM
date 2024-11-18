_this spawn{
params[
	["_passengerGroup",nil,[grpNull]]
];
private _transportGroup = _passengerGroup getVariable "SQFM_transportGroup";
private _dropPos        = _transportGroup getVariable "SQFM_transportPos";
private _psnData        = _passengerGroup call getData;
private _trnData        = _transportGroup call getData;
private _men            = _psnData call ["getUnitsOnfoot"];
private _vehicle        = (_trnData call ["getVehiclesInUse"])#0;
private _wpPos          = waypointPosition [_transportGroup, currentWaypoint _transportGroup];
private _correctWp      = true;// _wpPos distance2D _dropPos < 50;
private _boarded        = _psnData call ["isBoarded"];
if(_correctWp && {_boarded})exitWith{
    sleep 3;
    private _isMoving = speed _vehicle > 1;
    if(!_isMoving)then{
        private _danger  = [_transportGroup, _dropPos] call SQFM_fnc_posIsHostile;
        private _dropRad = if(_danger)then{300}else{10};
        _trnData call ["deleteWaypoints"];
        _trnData call ["addWaypoint",[_dropPos,  _dropRad, "TR UNLOAD","SQFM_fnc_onDropOffWpTransporter"]];
}};

if(!_boarded)
then{[_men, _vehicle] call SQFM_fnc_menGetInSingleVehicle};

if(!_correctWp)then{
    private _danger  = [_transportGroup, _dropPos] call SQFM_fnc_posIsHostile;
    private _dropRad = if(_danger)then{300}else{10};
    _trnData call ["deleteWaypoints"];
    _trnData call ["addWaypoint",[_dropPos,  _dropRad, "TR UNLOAD","SQFM_fnc_onDropOffWpTransporter"]];
};

};