private _shotDataArr = _self get "groupShots";
if(_shotDataArr isEqualTo [])exitWith{0};
private _previousShot = (_shotDataArr#(count _shotDataArr -1))#0;
private _timeSince    = time - _previousShot;

_timeSince;