params[
    ["_side",     nil, [east]],
    ["_progress", nil,    [0]]
];
private _thisBar  = _self get _side;
private _barWest  = _self get west;
private _barGuer  = _self get independent;
private _barEast  = _self get east;

if(_thisBar isEqualTo _barWest)
exitWith{_thisBar progressSetPosition _progress};

private _leftBarPos   = ctrlPosition _barWest;
private _leftBarProgr = progressPosition _barWest;
private _leftBarWidth = (_leftBarPos#2)*_leftBarProgr;

private _midBarPos   = ctrlPosition _barGuer;
private _midStartPos = (_leftBarPos#0)+_leftBarWidth;

if(_thisBar isEqualTo _barGuer)
exitWith{
    _midBarPos set [0, _midStartPos];
    _thisBar ctrlSetPosition _midBarPos;
    _thisBar progressSetPosition _progress;
    _thisBar ctrlCommit 0;
};

private _midBarProgr = progressPosition _barGuer;
private _midBarWidth = (_midBarPos#2)*_midBarProgr;

private _rightBarPos   = ctrlPosition _barEast;
private _rightStartPos = (_midBarPos#0)+_midBarWidth;

if(_thisBar isEqualTo _barEast)
exitWith{
    _rightBarPos set [0, _rightStartPos];
    _thisBar ctrlSetPosition _rightBarPos;
    _thisBar progressSetPosition _progress;
    _thisBar ctrlCommit 0;
};