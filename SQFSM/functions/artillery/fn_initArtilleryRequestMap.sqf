private _globalize = {
[
    missionNamespace, 
    "SQFM_artilleryRequests", 
    _self
] call setGlobalVar;    
};
private _dataArr = [
    [east,        []],
    [west,        []],
    [independent, []],
    
    /*METHODS*/
    ["addRequest", SQFM_fnc_addArtilleryRequest],
    ["globalize",                    _globalize]
];

SQFM_artilleryRequests = createHashMapObject [_dataArr];

SQFM_artilleryRequests;

[
    missionNamespace, 
    "SQFM_artilleryRequests", 
    SQFM_artilleryRequests
] call setGlobalVar;