private _allSquads       = [];
private _attackSquads    = [];
private _defenseSquads   = [];
private _hunters         = [];
private _reinforceSquads = [];
private _reconSquads     = [];
private _supportSquads   = [];


private _getAvailable    = {
    params[
        ["_category",nil,  [""]],
        ["_side",    nil,[west]]
    ];
    private _reforceCheck = _category isEqualTo "reinforcements";
    _self get _category select { 

        private _data        = _x call getData;
        private _validData   = !isNil "_data";
        private _available   = _validData &&{_data call ["canRecieveTask"]};
        private _correctSide = isNil "_side" || {side _x isEqualTo _side};

        if(_validData
        &&{_reforceCheck
        &&{!(_data call ["ableToReinforce"])}})
        then{_available = false};

        if!(_correctSide)
        then{_available = false};

        if!(_validData)
        then{_available = false};

        _available;
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
    _self call ["remove",[grpNull]];
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
    ["removeMultiple",  _removeMultiple]
];
private _categoryMap = createHashmapObject [_allCategories];


_categoryMap;