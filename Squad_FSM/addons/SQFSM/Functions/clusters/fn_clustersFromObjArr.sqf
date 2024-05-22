params[
    ["_objArr",     nil, [[]]],
    ["_clusterRad", 50,   [0]]
];
private _registeredObjects = [];
private _allClusters       = [];

{isNil{
    private _hashMap = [_x, _clusterRad,_registeredObjects] call SQFM_fnc_cluster;
    private _objects = _hashMap get "objects";

    _registeredObjects insert [0, _objects, true];
    _allClusters pushBackUnique _hashMap;
    
}} forEach _objArr;

_allClusters;