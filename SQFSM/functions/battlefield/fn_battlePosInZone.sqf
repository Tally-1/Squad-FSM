params[
    ["_position",nil,[[]]]
];
private _battlePos = _self get "position";
private _battleRad = _self get "radius";
private _distance  = _battlePos distance2D _position;

if(_distance > _battleRad)exitWith{false};

true;