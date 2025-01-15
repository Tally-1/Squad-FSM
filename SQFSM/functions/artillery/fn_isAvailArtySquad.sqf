params[
    ["_group", nil,[grpNull]],
    ["_side",  nil,   [west]]
];
private _data  = _group call getData;
if(isNil "_data")exitWith{false};

private _sameSide = (_data get "side")isEqualTo _side;
if(!_sameSide)exitWith{false};

private _type = _data get "groupType";
private _arty = _type isEqualTo "artillery";
if(!_arty)exitWith{false};

true;