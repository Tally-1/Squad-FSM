if(isNil "_this")exitWith{};

private _dataType = typeName _this;
if!(_dataType in ["GROUP", "OBJECT", "DISPLAY"]) exitWith{};
if (isNull _this)                                exitWith{};
if (_dataType isEqualTo "GROUP")                 exitWith{_this getVariable "SQFM_grpData"};
if (_dataType isEqualTo "DISPLAY")               exitWith{_this getVariable "SQFM_data"};

private _type = typeOf _this;
if (_type isEqualTo "SQFSM_Objective")        exitWith{_this getVariable "SQFM_objectiveData"};
if (_type isEqualTo "SQFSM_TransportSpawner") exitWith{_this getVariable "SQFM_spawnerData"};
if (_type isEqualTo "SQFSM_Reforcer")         exitWith{_this getVariable "SQFM_reforcerData"};

nil;