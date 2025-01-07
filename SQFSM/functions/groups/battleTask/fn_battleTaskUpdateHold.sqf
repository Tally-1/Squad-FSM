private _holdInPlace = _self get "holdInPlace";
if(_holdInPlace)exitWith{_self call ["updateHoldInPlace"]};

private _garrisoned = _self get "garrisoned";
if(!_garrisoned)exitWith{};

private _group   = _self get "group";
private _grpData = _group call getData;
private _men     = _grpData call ["getUnitsOnfoot"];
private _outside = _men select{
    private _command = toUpper (currentCommand _x);
    private _house   = [_x] call SQFM_fnc_manGetBuilding;
    private _outside = isNull _house && {!(_command in ["STOP", "SCRIPTED"])};
    
    _outside;
};

if(_outside isEqualTo [])exitWith{};

_grpData call ["disableAttack"];

{
    private _pos      = getPosATL _x;
    private _building = ([_pos, 50, true, _outside] call SQFM_fnc_nearBuildings)#0;
    if(isNil "_building") exitWith{};
    if(isNull _building)  exitWith{};

    private _positions = [[_building], _pos] call SQFM_fnc_allBuildingsPositions;
    if(_positions isEqualTo [])exitWith{};
    private _movePos = selectRandom _positions;
    [_x, _building, _movePos] spawn SQFM_fnc_garrisonMan;

    
} forEach _outSide;

true;