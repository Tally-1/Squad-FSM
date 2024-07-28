private _status    = _self call ["actionStatus"];
private _available = _status isEqualTo "Available";

_available;