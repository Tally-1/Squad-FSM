params[
    ["_objective",nil,[objNull]]
];
"group clearing objective" call dbgm;
private _objData   = _objective call getData;
private _urban     = _objData get "isUrbanArea";
private _squadType = _self get "groupType";
private _infantry  = _squadType isEqualTo "infantry";
private _mech      = "(infantry)" in _squadType;
private _vehicle   = _infantry isEqualTo false && {_mech isEqualTo false};

[["mech: ",_mech, " infantry: ", _infantry, " vehicle: ", _vehicle, " urban: ", _urban, " type: ",_squadType]] call dbgm;

if(_urban isEqualTo false
&&{_infantry}) exitWith{_self call ["infClearObjective",[_objective]]};
if(_infantry)  exitWith{_self call ["infClearUrbanObjective",[_objective]]};

if(_urban isEqualTo false
&&{_mech}) exitWith{_self call ["mechClearObjective",[_objective]]};
if(_mech)  exitWith{_self call ["mechClearUrbanObjective",[_objective]]};

if(_urban isEqualTo false
&&{_vehicle}) exitWith{_self call ["vehicleClearObjective",[_objective]]};
if(_vehicle)  exitWith{_self call ["vehicleClearUrbanObjective",[_objective]]};


"No valid clearing options" call dbgm;