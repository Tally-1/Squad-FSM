"Vehicle clearing standard objective"call dbgm;
params[
    ["_objective",    nil,[objNull]],
    ["_getPositions", false, [true]]
];
private _group         = _self get "grp";
private _objData       = _objective call getData;
private _center        = _objData get "position";
private _radius        = (_objData get "zone")#1;
private _startPos      = _self call ["getAvgPos"];
private _roadMap       = _objData  get "roadmap";
private _roads         = (_roadMap get "positions");
private _centerRoad    = [_center, (_roads select {_x distance2D _center < 75})] call SQFM_fnc_getNearest;
private _conePositions = _objData call ["getZoneCone",[_startPos,0,180]];
private _targetPos     = if(!isNil "_centerRoad")then{_centerRoad}else{_center};
private _vehicle       = vehicle leader _group;
private _ignoreObjs    = [_vehicle];
private _endFunction   = 'SQFM_fnc_endTaskGroup';
private _firePositions = _conePositions select {
    private _z         = 1.5;
    private _firePos   = ATLToASL [_x#0,_x#1, _z];
    private _targetPos = ATLToASL [_targetPos#0,_targetPos#1, _z];
    private _valid     = [_x] call SQFM_fnc_clearPos && {!([_firePos,_targetPos,_ignoreObjs] call SQFM_fnc_lineBroken)};
    
    (!isNil "_valid"&&{_valid});
};

if(_getPositions)exitWith{[_firePositions, _targetPos]};

if(_firePositions isNotEqualTo [])then{
    private _firePos = selectRandom _firePositions;
    _self call ["addWaypoint", [_firePos]];
};

_self call ["addWaypoint", [_targetPos,20,"MOVE", _endFunction,nil,nil,_radius]];

true;