private _dataArr = [
    [east,        []],
    [west,        []],
    [independent, []],
    
    /*METHODS*/
    ["addRequest", SQFM_fnc_addReinfReq]
];

SQFM_reinforRequests = createHashMapObject [_dataArr];

SQFM_reinforRequests;

[
    missionNamespace, 
    "SQFM_reinforRequests", 
    SQFM_reinforRequests
] call setGlobalVar;