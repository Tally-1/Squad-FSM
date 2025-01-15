params[
    ["_position", nil,[[]],3],
    ["_side",     nil,[west]]
];
private _roundPos = _position apply{floor _x};
if(_roundPos isEqualTo [0,0,0])exitWith{false};

private _radius     = (selectMax [50, SQFM_artySpread])+SQFM_artySafeDist;
private _friendlies = _position nearEntities ["land", _radius]select{
    private _valid    = [_x] call SQFM_fnc_validLandEntity;
    private _friendly = !([_side, _x] call SQFM_fnc_hostile);
    private _include  = _valid &&{_friendly};
    _include;
};

if(_friendlies isEqualTo [])exitwith{true};

false;