private _dataArr = [
    [east,        []],
    [west,        []],
    [independent, []],
    
    /*METHODS*/
    ["addRequest", SQFM_fnc_addAtSupportRequest]
];

SQFM_atSupportRequests = createHashMapObject [_dataArr];

SQFM_atSupportRequests;