private _totalCount = count(_self call ["getUnits"]);
private _footCount  = count(_self call ["nonCrewMen"]);
private _isInfantry = _totalCount isEqualTo _footCount;

_isInfantry;