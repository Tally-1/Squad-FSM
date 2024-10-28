params[
    ["_availableOnly",true,[true]]
];
private _atGroups = allGroups select {
    private _data  = _x call getData;
    private _isAT  = (!isNil "_data")&&{(_data get "squadClass") isEqualTo "at_support"};
    
    _isAT;
};

if!(_availableOnly)exitWith{_atGroups};

private _available = _atGroups select {
    private _data      = _x call getData;
    private _available = _data call ["canRecieveTask"];

    _available;
};

_available;