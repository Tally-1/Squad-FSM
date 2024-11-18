params[
    ["_vehicle",    nil, [objNull]],
    ["_waitForMen", nil,    [true]]
];

private _men = [_vehicle] call SQFM_fnc_getVehiclePassengers;

if(_men isEqualTo [])exitWith{"No passengers in vehicle" call dbgm};
private _startTime   = time;
private _positions   = [_vehicle, _men] call SQFM_fnc_mechUnloadPositions;
private _targets     = [_vehicle, 300] call SQFM_fnc_zoneSuppressionTargets;
private _danger      = !isNil "_targets" &&{_targets isNotEqualTo []};
private _timeLimit   = _startTime + 30;
private _startTime   = time;
private _stayIncover = 3; // seconds holding position for one individual man

if(_danger)
then{
	[_vehicle, _men, _targets] spawn SQFM_fnc_onMechUnloadDanger;
	_stayIncover = 15;
};



[
    _vehicle, 
    _men, 
    _positions, 
    _timeLimit

] call SQFM_fnc_mechUnloadStart;

[_vehicle, _men, _stayIncover, _waitForMen] call SQFM_fnc_mechUnloadEnd;


true;