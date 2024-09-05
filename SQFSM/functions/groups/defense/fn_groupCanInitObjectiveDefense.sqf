params[
    ["_objective", nil,[objNull]]
];
private _objData   = _objective call getData;
private _group     = _self get "grp";
private _canDefend = _self get "canDefend";
private _squadType = _self get "groupType";
private _isDefPos  = (_objData get "type") isEqualTo "dp";
private _infantry  = _squadType isEqualTo "infantry";
private _mech      = "(infantry)" in _squadType;
private _vehicle   = _infantry isEqualTo false && {_mech isEqualTo false};
private _enemies   = _objData call ["getGroupsInZone"] select {[_group,_x] call SQFM_fnc_hostile};
private _hostile   = _enemies isNotEqualTo [];
private _owned     = _objData get "owner" isEqualTo (side _group);
private _noSFSM    = (((!isNil "SFSM_disableSoldierFSM")
                   && {SFSM_disableSoldierFSM})
                   || {isNil "SFSM_fnc_fipoAvailable"});


if!(_owned)     exitWith{false};
if!(_canDefend) exitWith{false};
if!(_isDefPos)  exitWith{false};
if (_noSFSM)    exitWith{false};
if (_vehicle)   exitWith{false};
if (_hostile)   exitWith{false};

true;