params[
    ["_hashMap",nil,[createHashmap]]
];
private _arr = [];

{
    private _key = _x;
    private _val = if(!isNil "_y")then{_y}else{nil};
    if((!isNil "_val")
	&&{typeName _val != "CODE"})
    then{_arr pushBack [_key, _val]};
    
} forEach _hashMap;

_arr;