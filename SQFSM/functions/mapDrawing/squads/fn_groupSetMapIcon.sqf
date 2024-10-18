private _iconName = "b_unknown";
private _type     = _self get "groupType";

if(_type isEqualTo "infantry")      then{_iconName = "b_inf"};
if(_type isEqualTo "light vehicle") then{_iconName = "b_motor_inf"};
if(_type isEqualTo "light armor")   then{_iconName = "b_armor"};
if(_type isEqualTo "heavy armor")   then{_iconName = "b_armor"};
if(_type isEqualTo "artillery")     then{_iconName = "b_art"};
if("(infantry)" in _type)           then{_iconName = "b_mech_inf"};

private _mapIcon = ["\A3\ui_f\data\map\markers\nato\",_iconName,".paa"]joinString"";

_self set ["mapIcon", _mapIcon];

true;