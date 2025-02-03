params[
    ["_hashMap",      nil, [createHashmap]],
    ["_keyValArr",    nil,            [[]]],
    ["_existingOnly", nil,          [true]]
];

{
    private _key     = _x#0;
    private _val     = _x#1;
    private _include = (!_existingOnly)||{!isNil {_hashMap get _key}};
    if(_include)
    then{_hashMap set [_key, _val]};
    
} forEach _keyValArr;

_hashMap;