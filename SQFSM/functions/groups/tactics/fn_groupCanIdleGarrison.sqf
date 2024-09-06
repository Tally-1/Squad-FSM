if!(_self call ["canRecieveTask"])
exitWith{false};

if(_self call ["inBattle"])
exitWith{false};

private _action = _self get "action";
if("arrison" in _action)
exitWith{false};

private _fipoMen = _self call ["getFipoMen"];
if(_fipoMen isNotEqualTo [])
exitWith{false};

private _men = _self call ["getUnitsOnfoot"];
if(_men isEqualTo [])
exitWith{false};

true;