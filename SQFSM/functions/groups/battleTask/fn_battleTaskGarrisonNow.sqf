params[
    ["_hostilePos",nil,[[]]]
];
private _group     = _self get "group";
private _grpData   = _group call getData;
private _men       = _grpData call ["getUnitsOnfoot"];
if(_men isEqualTo [])exitWith{false};

private _manCount  = count _men;
private _grpPos    = _grpData call ["getAvgPos"];
private _buildings = [_grpPos, 75,true,_men] call SQFM_fnc_nearBuildings;
if(_buildings isEqualTo [])exitWith{false};

private _positions = [_buildings] call SQFM_fnc_allBuildingsPositions;
private _posCount  = count _positions;
private _countDiff = _posCount - _manCount;
private _endIndex  = _posCount -1;
if(_posCount  <     3) exitWith{false};
if(_countDiff < (0-2)) exitWith{false};

_grpData call ["deleteWaypoints"];
_grpData call ["disableAttack"];

private _wp = _grpData call ["addWaypoint",[_grpPos,75,"HOLD"]];

_positions = [_positions, [], {_hostilePos distance _x}, "DESCEND"] call BIS_fnc_sortBy;

private _curIndex = 0;
for "_i" from 0 to (_manCount-1) do{
    private _man      = _men#_i;
    private _pos      = _positions#_curIndex;
    private _building = [_pos] call SQFM_fnc_getHouseOnPos;

    [_man, _building, _pos] spawn SQFM_fnc_garrisonMan;

    _curIndex=_curIndex+1;
    if(_curIndex > _endIndex)then{_curIndex=0};
};

_self set ["destination",_grpPos];
_self set ["waypoints",    [_wp]];
_self set ["garrisoned",    true];