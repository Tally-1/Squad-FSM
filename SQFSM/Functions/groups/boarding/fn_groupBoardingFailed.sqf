private _boardingMen = _self call ["getBoardingMen"];
private _status      = _self call ["boardingStatus"];
private _failed      = _boardingMen isEqualTo [] && {_status isNotEqualTo "boarded"};

_failed;