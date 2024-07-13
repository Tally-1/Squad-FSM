private _menOnfoot   = _self call ["getUnitsOnfoot"];
private _menBoarding = _menOnfoot select {currentCommand _x isEqualTo "GET IN"};

_menBoarding;