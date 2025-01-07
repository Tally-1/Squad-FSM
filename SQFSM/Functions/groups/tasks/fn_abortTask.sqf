params[
    ["_abortStatus","",[""]]
];
private _data = _self call ["ownerData"];

_self call ["abortCode", [_abortStatus]];

_data set ["state",  ""];
_data set ["action", ""];
_data set ["travelData", nil];
_data call ["removeTask"];


true;