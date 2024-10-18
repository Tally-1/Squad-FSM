// The better a position is the lower is the return-value 
params[ 
    ["_center",   nil,[[]]], // From where the distance will be measured.
    ["_position", nil,[[]]], // The position being evaluated
    ["_previous", nil,[[]]]  // List of previous positions that has already been evaluated
];
private _ASLCenter       = ATLToASL (_center   vectorAdd [0,0,1]);
private _ASLPosition     = ATLToASL (_position vectorAdd [0,0,1]);
private _distance        = _center distance2D _position;
private _subtractCoef    = 0;
private _altitudePos     = (ATLToASL _position)#2;
private _altitudeCen     = (ATLToASL _center)#2;
private _altitudeDiff    = _altitudePos-_altitudeCen;
private _isHigh          = _altitudeDiff>3;
private _building        = [_position] call SQFM_fnc_getHouseOnPos;
private _onBuilding      = !isNull _building;
private _visible         = ([objNull, "VIEW"] checkVisibility [_ASLPosition, _ASLCenter])>0.5;
private _manOnPos        = count(_position nearEntities ["caManBase",2]select{[_x,true] call SQFM_fnc_validMan})>0;
private _onFipo          = count(_position nearEntities ["SFSM_FIPO",2])>0;
private _nearPrevious    = count(_previous select {_x distance2D _position < 10})>0;
private _nearPosDiscount = _nearPrevious &&{_onFipo isEqualTo false &&{_onBuilding isEqualTo false}};
private _add             = { _subtractCoef = _subtractCoef+_this};

// If the center of the search algorythm is visible then that is good
if(_visible)then{0.1 call _add};

// High ground is preferred
if(_isHigh)then{
    0.1 call _add;
    if(_onBuilding)then{0.1 call _add};
};

// If inside a big building this is advantageous
if(_onBuilding) then{
    private _posCount = count (_building buildingPos -1);

    0.2 call _add;
    if(_visible)    then{0.1 call _add};
    if(_posCount>3) then{0.2 call _add};
};

if(_onFipo)then{0.2 call _add};

// If The position is taken it should be avoided.
// This reduces the scored by 90%
if(_manOnPos)
then{_subtractCoef = _subtractCoef*0.1};


// If The position is close to another, and is not on a FIPO and not inside a building
// then in order to keep the group spread out the score is reduced massively.
if(_nearPosDiscount)then{_subtractCoef = -10};

private _coef  = 1-_subtractCoef;
private _score = _distance*_coef;

_score;