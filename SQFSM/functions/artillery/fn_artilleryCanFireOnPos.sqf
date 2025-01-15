params[
    ["_vehicle",   nil,[objNull]],
    ["_targetPos", nil,     [[]]]
];
private _ETA = _vehicle getArtilleryETA [_targetPos, currentMagazine _vehicle];
if(_ETA<0)exitWith{false};

true;