private _men   = _self call ["getUnitsOnfoot"];
private _AtMen = _men select {[_x, true]call SQFM_fnc_isAtMan};

_AtMen;