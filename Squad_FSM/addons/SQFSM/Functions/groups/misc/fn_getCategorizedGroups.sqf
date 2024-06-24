private _allSquads       = [];
private _attackSquads    = [];
private _defenseSquads   = [];
private _hunters         = [];
private _reinforceSquads = [];
private _reconSquads     = [];
private _supportSquads   = [];
private _checkReforce    = { 
params[
    ["_category", nil,     [""]],
    ["_group",    nil,[grpNull]]
];
if(_category != "reinforcements")exitWith{true}; // Will only evaluate grps when "reinforcements" category is queried.
private _data = _group call getData;
if!(_data get "canReinforce")exitWith{false};

private _justRequested = time - (_data get "lastReinfReq")<60;
if(_justRequested)          exitWith{false};
if(_data call ["inBattle"]) exitWith{false};

true;
};

private _getAvailable    = {
    params[
        ["_category",nil,  [""]],
        ["_side",    nil,[west]]
    ];
    _self get _category select { 
        private _grpDt          = _x call getData;
        private _notPlayerGrp   = !(_grpDt call["isPlayerGroup"]);
        private _idle           = _grpDt call["isIdle"];
        private _correctSide    = isNil "_side" || {side _x isEqualTo _side};
        private _reinforceCheck = {_self call ["checkReforce", [_category, _x]]};

        _notPlayerGrp
        &&{_idle
        &&{_correctSide
        && _reinforceCheck}};
    };
};

private _removeGroup = {isNil{
    params[["_group",nil,[grpNull]]];
    {
        private _array    = _y;
        if(typeName _array isEqualTo "ARRAY"
        &&{_group in _array})
        then{_array deleteAt (_array find _group)};
        
    } forEach _self;

}};

private _removeMultiple = { 
    params[["_groups",nil,[[]]]];
    {_self call ["remove",[_x]]} forEach _groups;
    true;
};

private _sortAttackSquads = { 
    private _value = 1;
    if((_x call getData)call["canAttackOnly"])then{_value = 0.5};
    _value;
};

private _sortDefenseSquads = { 
    private _value = 1;
    if((_x call getData)call["canDefendOnly"])then{_value = 0.5};
    _value;
};

{isNil{
        private _abilities  = [_x] call SQFM_fnc_getGroupAbilities;
        private _notSupport = !("support" in _abilities);

        if("attack"    in _abilities &&{_notSupport}) then{_attackSquads    pushBack _x};
        if("defend"    in _abilities &&{_notSupport}) then{_defenseSquads   pushBack _x};
        if("hunt"      in _abilities &&{_notSupport}) then{_hunters         pushBack _x};
        if("reinforce" in _abilities &&{_notSupport}) then{_reinforceSquads pushBack _x};
        if("recon"     in _abilities &&{_notSupport}) then{_reconSquads     pushBack _x};
        if("valid"     in _abilities &&{_notSupport}) then{_allSquads       pushBack _x};

        if("support" in _abilities)
        then{_supportSquads pushBack _x};
        

}} forEach allGroups;

_attackSquads  = [_attackSquads,  [], _sortAttackSquads, "ASCEND"] call BIS_fnc_sortBy;
_defenseSquads = [_defenseSquads, [], _sortDefenseSquads,"ASCEND"] call BIS_fnc_sortBy;


private _allCategories = [
    ["all",                  _allSquads],
    ["attackSquads",      _attackSquads],
    ["defenseSquads",    _defenseSquads],
    ["hunters",                _hunters],
    ["reinforcements", _reinforceSquads],
    ["recon",              _reconSquads],
    ["support",          _supportSquads],

    /*************METHODS**************/
    ["getAvailable",      _getAvailable],
    ["remove",             _removeGroup],
    ["removeMultiple",  _removeMultiple],
    ["checkReforce",      _checkReforce]
];
private _categoryMap = createHashmapObject [_allCategories];


_categoryMap;