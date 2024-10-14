// The better a position is the lower is the return-value 
params[ 
    ["_center",   nil,[[]]], // From where the distance will be measured.
    ["_position", nil,[[]]]  // The position being evaluated
];
private _ASLCenter    = ATLToASL (_center vectorAdd [0,0,0.5]);
private _ASLPosition  = ATLToASL _position;
private _distance     = _center distance2D _position;
private _subtractCoef = 0;
private _altitudePos  = (ATLToASL _position)#2;
private _altitudeCen  = (ATLToASL _center)#2;
private _altitudeDiff = _altitudePos-_altitudeCen;
private _isHigh       = _altitudeDiff>3;
private _building     = [_position] call SQFM_fnc_getHouseOnPos;
private _onBuilding   = !isNull _building;
private _visible      = ([objNull, "VIEW"] checkVisibility [_ASLPosition, _ASLCenter])>0.5;
private _manOnPos     = count(_position nearEntities ["caManBase",2]select{[_x,true] call SQFM_fnc_validMan})>0;

// High ground is preferred
if(_isHigh)then{
    _subtractCoef = 0.1;
    if(_visible)   then{_subtractCoef = _subtractCoef+0.1};
    if(_onBuilding)then{_subtractCoef = _subtractCoef+0.1};
};

// If inside a big building this is advantageous
if(_onBuilding) then{
    private _posCount = count (_building buildingPos -1);

    _subtractCoef = _subtractCoef+0.2;
    if(_visible)    then{_subtractCoef = _subtractCoef+0.1};
    if(_posCount>3) then{_subtractCoef = _subtractCoef+0.39};
};

// If The position is taken it should be avoided.
if(_manOnPos)
then{_subtractCoef = _subtractCoef-0.4};

private _coef  = 1-_subtractCoef;
private _score = _distance*_coef;

_score;