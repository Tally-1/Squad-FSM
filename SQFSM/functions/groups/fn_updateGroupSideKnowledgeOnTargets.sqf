params[
    ["_group",      nil,[grpNull]],
    ["_targetList", nil,     [[]]]
];
private _data          = _group call getData;
private _side          = side _group;
private _hostiles      = _targetList select {[_group, _x] call SQFM_fnc_hostile};
private _knowsaboutArr = [];
{
    private _ownKnowledge  = _group knowsAbout _x;
    private _sideKnowledge = _side  knowsAbout _x;
    if(_ownKnowledge < _sideKnowledge)then{ 
        private _diff      = _sideKnowledge-_ownKnowledge;
        private _incCoef  = _diff/4;
        private _prevCoef = _ownKnowledge/4;
        _group reveal [_x, _sideKnowledge];
        _knowsaboutArr pushBackUnique [_x,_prevCoef,_incCoef];
    };
    
} forEach _hostiles;

(_data get"hostilesRevealed")set[0,time];
(_data get"hostilesRevealed")set[1,_knowsaboutArr];

true;