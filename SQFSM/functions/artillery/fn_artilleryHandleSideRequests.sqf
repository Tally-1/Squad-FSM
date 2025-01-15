params[
    ["_side",nil,[west]]
];
private _requests   = SQFM_artilleryRequests get _side;
private _noRequests = _requests isEqualTo [];
if(_noRequests)exitWith{};

private _artySquads = [_side] call SQFM_fnc_getArtillerySquads;
private _assigned   = [];
private _notAvail   = _artySquads isEqualTo [];
if(_notAvail)
exitwith{[_side] call SQFM_fnc_artilleryDenyAllRequests};

{
    private _responder = [_x, _artySquads, _assigned, _side] call SQFM_fnc_artilleryRespondRequest;
        
    if(!isNull _responder)
    then{_assigned pushBackUnique _responder};

    _artySquads deleteAt (_artySquads find _responder);
    _requests deleteAt (_requests find _x);
    sleep 0.1;
        
} forEach _requests;

SQFM_artilleryRequests set [_side, []];
SQFM_artilleryRequests call ["globalize"];

true;