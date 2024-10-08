private _playerSide = side group player;
private _objSide    = _objData get "owner";
private _friendly   = !([_playerSide, _objSide] call SQFM_fnc_hostile);
private _noOwner    = _objSide isEqualTo sideUnknown;
private _contested  = _objData get "contested";
private _inActive   = _objData get "activated" isEqualTo false;
private _status     = "No Owner";
private _color      = _white;

// Friendly Objective
if(_noOwner  isEqualTo false
&&{_friendly isEqualTo true})then{
    _status = "Friendly";
    _color  = _green;
};

// Hostile Objective
if(_noOwner  isEqualTo false
&&{_friendly isEqualTo false})then{
    _status = "Hostile";
    _color  = _red;
};

// If inside battle or 2 sides present
if(_contested)then{
    _status = "Contested";
    _color  = _orange;
};

// Synched trigger is not active.
if(_inActive)then{
    _status = "deactivated (Trigger)";
    _color  = _grey;
};
_status = [_status,"    "]joinString"";

private _typeText = [_leftMediumSize, "Status: ", _end, _rightMediumSize, _color, _status, _endd]joinString"";


_typeText;