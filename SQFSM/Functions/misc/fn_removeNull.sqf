params[
    ["_arr",nil, [[]]]
];
private _count = count _arr-1;
for "_i"from 0 to _count do 
{_arr deleteAt (_arr findIf {isNull _x})};
_arr;