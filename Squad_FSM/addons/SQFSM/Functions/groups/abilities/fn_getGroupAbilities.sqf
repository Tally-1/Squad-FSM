params[
    ["_group",nil,[grpNull, createHashmap]]
];
private ["_data"];

if(typeName _group isEqualTo "HASHMAP")then{
    _data  = _group;
    _group = _data get "grp";
}
else{_data = _group call getData};

private _valid      = [_group] call SQFM_fnc_validGroup;
private _categories = [];

if (isNil "_data")          exitWith{_categories};
if!(_data call ["isValid"]) exitWith{_categories};


private _squadClass = _data get "squadClass";

if(_data get "canAttack")             then{_categories pushBack "attack"};
if(_data get "canDefend")             then{_categories pushBack "defend"};
if(_data get "canHunt")               then{_categories pushBack "hunt"};
if(_data get "canReinforce")          then{_categories pushBack "reinforce"};
if(_data get "canCallReinforcements") then{_categories pushBack "call reinforcements"};
if(_data get "canCallAir")            then{_categories pushBack "call cas"};
if(_data get "canCallArty")           then{_categories pushBack "call arty"};

if(_squadClass isEqualTo "recon")then{
    _categories pushBack "recon";
    _categories pushBackUnique "call reinforcements";
    _categories pushBackUnique "call cas";
    _categories pushBackUnique "call arty";
};
if(_squadClass isEqualTo "support")then{
    _categories deleteAt (_categories find "attack");
    _categories deleteAt (_categories find "defend");
    _categories deleteAt (_categories find "hunt");
    _categories deleteAt (_categories find "reinforce");
    _categories pushBack "support";
};

_categories pushBack "valid";

_categories;