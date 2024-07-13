params[
    ["_side", nil,[""]]
];
private _assetCount = (_self call["getAssignedAssets",[_side]])get"sum";

if(isNil "_assetCount")
exitWith{0};

_assetCount;