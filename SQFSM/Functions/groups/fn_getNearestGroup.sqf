params[
    ["_pos",     nil, [[],objNull]],
    ["_grpList", nil,         [[]]]
];

private _validList  = _grpList select {
    private _data  = _x call getData;
    private _valid = (!isNil "_data")&&{[_x] call SQFM_fnc_validGroup};
    _valid;
};

private _men        = _validList apply {[_x] call SQFM_fnc_firstValidGroupMember};//{leader _x};//select{!isNull _x};
private _nearestMan = [_pos, _men] call SQFM_fnc_getNearest;

if(isNil "_nearestMan")exitWith{grpNull};

private _index        = _men find _nearestMan;
private _nearestGroup = _validList#_index;

_nearestGroup;