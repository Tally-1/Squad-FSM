private _vehicle   = _self get "vehicle";
private _positions = _self get "positions";
private _targetPos = _self get "targetPos";
private _magazine  = _self get "magazine";
private _hasFired  = false;

if(isNil "_magazine")exitWith{"Fire mission failed, nil magazine" call dbgm;};

for"_i"from 1 to 3 do {
    sleep 10;
    _hasFired = _self call ["hasFired"];
    if(_hasFired)exitWith{};

    private _eta = ceil (_vehicle getArtilleryETA [_targetPos, _magazine]);
    [["Firing artillery failed, trying again. ETA: ", _eta]] call dbgm;

    _firePos = selectRandom _positions;
    [_vehicle, [_firePos, _magazine, 1]]remoteExec["doArtilleryFire"];

};

if(_hasFired)exitWith{};

"Fire mission failed, could not fire artillery" call dbgm;

_vehicle setVariable ["SQFM_lastArtyFire", round time, true];
_self call ["end"];