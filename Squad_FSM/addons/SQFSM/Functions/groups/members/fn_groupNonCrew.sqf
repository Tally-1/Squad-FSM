private _units   = _self call ["getUnits"];
private _crewMen = _self call ["crewMen"];
private _nonCrew = _units select {!(_x in _crewMen)};

_nonCrew;