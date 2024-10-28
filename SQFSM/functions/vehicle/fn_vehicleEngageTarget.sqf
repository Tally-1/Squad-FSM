params[
    ["_vehicle", nil,[objNull]],
    ["_target",  nil,[objNull]]
];
if([_vehicle] call SQFM_fnc_deadCrew)exitWith{};

private _startPos     = getPosATLVisual _vehicle;
private _targetPos    = getPosATLVisual _target;
private _distance     = selectMax[_target distance2D _startPos,200];
private _searchDist   = selectMin[_distance, 1000];
private _minDist      = 100;
private _firePos      = [_vehicle, _target, _searchDist] call SQFM_fnc_getRpgLaunchPos; // [
private _validFirePos = (!isNil "_firePos")&&{(_firePos distance _targetPos)>=_minDist};

(gunner    _vehicle) doFire  _target;
(commander _vehicle) doFire  _target;
(gunner    _vehicle) doWatch _target;

if(_validFirePos)then{
    SQFM_Custom3Dpositions = [[_firePos, "fire-Pos (vehicle)"]];
    _vehicle doMove _firePos;
};

true;