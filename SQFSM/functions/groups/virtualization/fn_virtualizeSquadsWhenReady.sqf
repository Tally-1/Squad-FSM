params[
    ["_squadList",nil,[[]]]
];
private _timer         = time + 10;
private _virtualSquads = []; 

{
    waitUntil {
      private _data  = _x call getData;
      private _ready = (!isNil "_data")or{time > _timer};
      _ready;
    };

    private _valid     = [_x] call SQFM_fnc_validGroup;
    private _virtualSq = [_x, true] call SQFM_fnc_virtualizeSquad;
    private _ready = time < _timer
                  &&{typeName _virtualSq isEqualTo "HASHMAP"
                  &&{_valid}};
    if(_ready)
    then{_virtualSquads pushBackUnique _virtualSq};

} forEach _squadList;

_virtualSquads;