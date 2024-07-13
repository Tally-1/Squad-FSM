private _groupVehicles = (_self call ["getOwnVehicles"])#0 select{_x emptyPositions "" > 0};
private _nearVehicles  = _self call  ["getNearVehicles", [SQFM_manualBoardingDist]];
private _allVehicles   = [];

_allVehicles insert [0, _nearVehicles,  true];
_allVehicles insert [0, _groupVehicles, true];

_allVehicles;