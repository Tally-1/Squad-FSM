params[
    ["_building",     nil,[objNull]],
    ["_excludedSide", nil,   [west]]
];

private _shape = [_building] call SQFM_fnc_objectShape;
private _size  = selectMax [(_shape get "width"),(_shape get "length")];

private _occupants = (_building nearEntities ["CAManBase", _size]) select {
        private _valid   = [_x] call SQFM_fnc_validMan;
        private _thisBld = [_x] call SQFM_fnc_manGetBuilding;
        private _include = _valid &&{_thisBld isEqualTo _building};
        
        _include;
};

if(!isNil "_excludedSide")
then{_occupants = _occupants select {side _x != _excludedSide}};

_occupants;