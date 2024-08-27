params[ 
    ["_entity",    nil, [objNull]], // Man or vehicle whos LOS is evaluated
    ["_target",    nil, [objNull]], // the target being queried
    ["_ignoreList", [],      [[]]]
];

if(_ignoreList isEqualTo [])
then{_ignoreList = [_entity, _target]};

private _startPos   = eyePos _entity;
private _endPos     = eyePos _target;
private _linebreaks = [_startPos, _endPos, _ignoreList] call SQFM_fnc_validSurfaceIntersections;


if(_linebreaks isEqualTo [])exitWith{_target};

private _minDist = 8;
private _first   = _linebreaks#0;
private _posASL  = _first#0;
if(_posASL distance _endPos < _minDist)
exitWith{_posASL};

private ["_validPos"];
private _minZ  = [_endPos#2,(getPosASLVisual _target)#2] call SQFM_fnc_numDiff;
// private _step  = (_minDist-1)/3;
private _dir   = _entity getDirVisual _target;
private _right = [_dir+90] call SQFM_fnc_formatDir;
private _left  = [_dir-90] call SQFM_fnc_formatDir;

for "_i" from 1 to _minDist step 2 do { 
    if(!isNil "_validPos")exitWith{};

    private _newZ     = _minZ+_i;
    private _highPos  = _target modelToWorldVisualWorld [  0,0,_newZ];
    private _rightPos = [_highPos, _right, _i,(_highPos#2)] call SQFM_fnc_sinCosPos;
    private _leftPos  = [_highPos, _left, _i, (_highPos#2)] call SQFM_fnc_sinCosPos;
    private _positions = [_highPos, _rightPos, _leftPos];
    
    {
        private _newPos     = _x;
        private _linebreaks = [_startPos, _newPos, _ignoreList] call SQFM_fnc_validSurfaceIntersections;
        private _breakPos   = _linebreaks#0#0;
        if(_linebreaks isEqualTo [])
        exitWith{_validPos = _newPos};

        if(_breakPos distance _endPos < _minDist)
        exitWith{_validPos = _breakPos};
        
    } forEach _positions;

    
};

if(isNil "_validPos")exitWith{};


_validPos;